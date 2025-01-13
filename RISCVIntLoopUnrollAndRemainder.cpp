//===-- RISCVLoopUnrollAndRemainder.cpp - Loop Unrolling Pass
//------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
//
//===----------------------------------------------------------------------===//
#include "RISCVIntLoopUnrollAndRemainder.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/DenseMapInfo.h"
#include "llvm/ADT/DenseSet.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SetVector.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/Analysis/AssumptionCache.h"
#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/CGSCCPassManager.h"
#include "llvm/Analysis/CodeMetrics.h"
#include "llvm/Analysis/LoopAnalysisManager.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopUnrollAnalyzer.h"
#include "llvm/Analysis/OptimizationRemarkEmitter.h"
#include "llvm/Analysis/ProfileSummaryInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DiagnosticInfo.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/IntrinsicsRISCV.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Verifier.h"
#include "llvm/InitializePasses.h"
#include "llvm/Pass.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/ADCE.h"
#include "llvm/Transforms/Scalar/DCE.h"
#include "llvm/Transforms/Scalar/DeadStoreElimination.h"
#include "llvm/Transforms/Scalar/EarlyCSE.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Transforms/Scalar/LoopStrengthReduce.h"
#include "llvm/Transforms/Scalar/LoopUnrollPass.h"
#include "llvm/Transforms/Scalar/Reassociate.h"
#include "llvm/Transforms/Scalar/SROA.h"
#include "llvm/Transforms/Utils.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/Local.h"
#include "llvm/Transforms/Utils/LoopPeel.h"
#include "llvm/Transforms/Utils/LoopSimplify.h"
#include "llvm/Transforms/Utils/LoopUtils.h"
#include "llvm/Transforms/Utils/SimplifyCFGOptions.h"
#include "llvm/Transforms/Utils/UnrollLoop.h"
#include "llvm/Transforms/Utils/CodeExtractor.h"
#include <algorithm>
#include <cassert>
#include <cstdint>
#include <iostream>
#include <limits>
#include <optional>
#include <string>
#include <tuple>
#include <utility>

using namespace llvm;

#define DEBUG_TYPE "riscv-int-loop-unroll-and-remainder"

// Enumeration to represent different types of unrolling
enum class UnrollType {
  F32_DSPI_DOTPROD,
  F32_DSPI_CONV,
  F32_DSPM_ADD,
  F32_DSPM_MULT,
  F32_DSPM_MULT_EX,
  F32_DSPS_WIND_BLACKMAN,
  F32_DSPS_FFT2R,
  F32_DSPS_BIT_REV_FC32,
  INT16_DSPS_DOTPROD,
  INT16_DSPI_DOTPROD,
  INT16_DSPS_ADD,
  INT16_DSPS_MULC,
  INT16_DSPS_FIRD,
  INT16_DSPM_MULT,
  INT8_DSPI_DOTPROD,
  UNKNOWN
};

// Global variable to store the current unroll type
static UnrollType currentUnrollType = UnrollType::UNKNOWN;
static unsigned unroll_count = 16;
// Command line option to enable the RISCVLoopUnrollAndRemainder pass
cl::opt<bool> llvm::EnableRISCVIntLoopUnrollAndRemainder(
    "riscv-int-loop-unroll-and-remainder", cl::init(false),
    cl::desc("Enable integer loop unrolling and remainder specific loop"));

// 定义枚举类型表示不同的DSPI矩阵大小
enum class DSPIMatrixSize {
  SIZE_4X4,
  SIZE_8X8,
  SIZE_16X16, 
  SIZE_32X32,
  SIZE_64X64
};

// 命令行选项用于控制DSPI矩阵大小
cl::opt<DSPIMatrixSize> DSPIMatrixSizeOpt(
    "dspi-matrix-size",
    cl::desc("选择DSPI矩阵大小进行优化:"),
    cl::values(
      clEnumValN(DSPIMatrixSize::SIZE_4X4, "4x4", "优化4x4矩阵"),
      clEnumValN(DSPIMatrixSize::SIZE_8X8, "8x8", "优化8x8矩阵"),
      clEnumValN(DSPIMatrixSize::SIZE_16X16, "16x16", "优化16x16矩阵"),
      clEnumValN(DSPIMatrixSize::SIZE_32X32, "32x32", "优化32x32矩阵"), 
      clEnumValN(DSPIMatrixSize::SIZE_64X64, "64x64", "优化64x64矩阵")
    ),
    cl::init(DSPIMatrixSize::SIZE_8X8));

// 全局变量存储当前选择的矩阵大小
static DSPIMatrixSize currentDSPIMatrixSize = DSPIMatrixSize::SIZE_8X8;

enum class DSPSFft2rFc32N {
  N_64,
  N_128,
  N_256,
  N_512,
  N_1024
};

// 命令行选项用于控制DSPI矩阵大小
cl::opt<DSPSFft2rFc32N> DSPSFft2rFc32NOpt(
    "dsps-fft2r-fc32-n",
    cl::desc("选择DSPS FFT2R FC32矩阵大小进行优化:"),
    cl::values(
      clEnumValN(DSPSFft2rFc32N::N_64, "64", "优化64N"),
      clEnumValN(DSPSFft2rFc32N::N_128, "128", "优化128N"),
      clEnumValN(DSPSFft2rFc32N::N_256, "256", "优化256N"),
      clEnumValN(DSPSFft2rFc32N::N_512, "512", "优化512N"), 
      clEnumValN(DSPSFft2rFc32N::N_1024, "1024", "优化1024N")
    ),
    cl::init(DSPSFft2rFc32N::N_64));

static DSPSFft2rFc32N currentDSPSFft2rFc32N = DSPSFft2rFc32N::N_64;

static void addnoalias(Function &F) {
  for (Argument &Arg : F.args()) {
    if (Arg.getType()->isPointerTy()) {
      Arg.addAttr(Attribute::NoAlias);
    }
  }
}

// Helper function to swap the successors of a terminator instruction
static void swapTerminatorSuccessors(BasicBlock *BB) {
  if (auto *BI = dyn_cast<BranchInst>(BB->getTerminator())) {
    if (BI->isConditional() && BI->getNumSuccessors() == 2) {
      BasicBlock *TrueSuccessor = BI->getSuccessor(0);
      BasicBlock *FalseSuccessor = BI->getSuccessor(1);
      BI->setSuccessor(0, FalseSuccessor);
      BI->setSuccessor(1, TrueSuccessor);
    } else {
      llvm_unreachable("BB's terminator is not a conditional branch or doesn't "
                       "have two successors");
    }
  } else {
    llvm_unreachable("BB's terminator is not a branch instruction");
  }
}

// Helper function to get a basic block by name from a function
static BasicBlock *getBasicBlockByName(Function &F, StringRef Name) {
  for (BasicBlock &BB : F)
    if (BB.getName() == Name)
      return &BB;
  return nullptr;
}

// Helper function to run dead code elimination
static void runDeadCodeElimination(Function &F) {
  legacy::FunctionPassManager FPM(F.getParent());
  FPM.add(createDeadCodeEliminationPass());
  FPM.add(createLoopSimplifyPass());
  // Add SimplifyCFG pass with common options
  FPM.add(createCFGSimplificationPass(
      SimplifyCFGOptions()
          .bonusInstThreshold(1) // Set instruction bonus threshold
          .forwardSwitchCondToPhi(
              true) // Allow forwarding switch conditions to phi
          .convertSwitchToLookupTable(
              true)                  // Allow converting switch to lookup table
          .needCanonicalLoops(false) // Don't require canonical loop form
          .hoistCommonInsts(true)    // Hoist common instructions
          .sinkCommonInsts(true)     // Sink common instructions
      ));
  FPM.run(F);
  LLVM_DEBUG(F.dump());
}

static void runPostPass(Function &F) {
  // Create necessary analysis managers
  LoopAnalysisManager LAM;
  FunctionAnalysisManager FAM;
  CGSCCAnalysisManager CGAM;
  ModuleAnalysisManager MAM;

  // Create pass builder
  PassBuilder PB;

  // Register analyses
  PB.registerModuleAnalyses(MAM);
  PB.registerCGSCCAnalyses(CGAM);
  PB.registerFunctionAnalyses(FAM);
  PB.registerLoopAnalyses(LAM);
  PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);

  FunctionPassManager FPM;
  FPM.addPass(InstCombinePass());
  FPM.addPass(ADCEPass());
  FPM.addPass(EarlyCSEPass(true));
  // FPM.addPass(ReassociatePass());
  FPM.addPass(GVNPass());

  FPM.run(F, FAM);
}

// Helper function to move PHI nodes to the top of a basic block
static void movePHINodesToTop(BasicBlock &BB,
                              BasicBlock *ForBodyPreheaderBB = nullptr) {
  SmallVector<PHINode *, 8> PHIs;
  for (Instruction &I : BB) {
    if (PHINode *PHI = dyn_cast<PHINode>(&I)) {
      if (ForBodyPreheaderBB)
        PHI->setIncomingBlock(1, ForBodyPreheaderBB);
      PHIs.push_back(PHI);
    }
  }

  // Move PHI nodes in reverse order
  for (auto it = PHIs.rbegin(); it != PHIs.rend(); ++it) {
    (*it)->moveBefore(&BB.front());
  }
}


// Helper function to get the first float PHI node in a basic block
static PHINode *getFirstFloatPhi(BasicBlock *BB) {
  for (auto &Inst : *BB) {
    if (auto *Phi = dyn_cast<PHINode>(&Inst)) {
      if (Phi->getType()->isFloatTy()) {
        return Phi;
      }
    }
  }
  return nullptr;
}

// Helper function to get the last float PHI node in a basic block
static PHINode *getLastFloatPhi(BasicBlock *BB) {
  for (auto it = BB->rbegin(); it != BB->rend(); ++it) {
    if (auto *Phi = dyn_cast<PHINode>(&*it)) {
      if (Phi->getType()->isFloatTy()) {
        return Phi;
      }
    }
  }
  return nullptr;
}

// Helper function to get the first i64 PHI node in a basic block
static PHINode *getFirstI64Phi(BasicBlock *BB) {
  for (auto &Inst : *BB) {
    if (auto *Phi = dyn_cast<PHINode>(&Inst)) {
      if (Phi->getType()->isIntegerTy(64)) {
        return Phi;
      }
    }
  }
  return nullptr;
}

// Helper function to get the first 32-bit integer PHI node in a basic block
static PHINode *getFirstI32Phi(BasicBlock *BB) {
  for (auto &Inst : *BB) {
    if (auto *Phi = dyn_cast<PHINode>(&Inst)) {
      if (Phi->getType()->isIntegerTy(32)) {
        return Phi;
      }
    }
  }
  return nullptr;
}

// Helper function to get the last i64 PHI node in a basic block
static PHINode *getLastI64Phi(BasicBlock *BB) {
  for (auto it = BB->rbegin(); it != BB->rend(); ++it) {
    if (auto *Phi = dyn_cast<PHINode>(&*it)) {
      if (Phi->getType()->isIntegerTy(64)) {
        return Phi;
      }
    }
  }
  return nullptr;
}

// Helper function to get the last 32-bit integer PHI node in a basic block
static PHINode *getLastI32Phi(BasicBlock *BB) {
  for (auto it = BB->rbegin(); it != BB->rend(); ++it) {
    if (auto *Phi = dyn_cast<PHINode>(&*it)) {
      if (Phi->getType()->isIntegerTy(32)) {
        return Phi;
      }
    }
  }
  return nullptr;
}

// Helper function to get the first ICmp instruction in a basic block
static ICmpInst *getFirstICmpInst(BasicBlock *BB) {
  for (Instruction &I : *BB) {
    if (auto *CI = dyn_cast<ICmpInst>(&I)) {
      return CI;
    }
  }
  return nullptr;
}

// Helper function to get the last ICmp instruction in a basic block
static ICmpInst *getLastICmpInst(BasicBlock *BB) {
  for (auto it = BB->rbegin(); it != BB->rend(); ++it) {
    if (auto *icmp = dyn_cast<ICmpInst>(&*it)) {
      return icmp;
    }
  }
  return nullptr;
}

// Helper function to get the last add nsw i64 instruction in a basic block
static Instruction *getLastAddNswI64Inst(BasicBlock *BB) {
  for (auto it = BB->rbegin(); it != BB->rend(); ++it) {
    if (auto *BinOp = dyn_cast<BinaryOperator>(&*it)) {
      if (BinOp->getOpcode() == Instruction::Add && BinOp->hasNoSignedWrap() &&
          BinOp->getType()->isIntegerTy(64)) {
        return BinOp;
      }
    }
  }
  return nullptr;
}

// Helper function to get the first add nuw nsw i32 instruction in a basic block
static Instruction *getFirstAddNuwNswI32Inst(BasicBlock *BB) {
  for (auto &I : *BB) {
    if (auto *BinOp = dyn_cast<BinaryOperator>(&I)) {
      if (BinOp->getOpcode() == Instruction::Add &&
          BinOp->hasNoUnsignedWrap() && BinOp->hasNoSignedWrap() &&
          BinOp->getType()->isIntegerTy(32)) {
        return BinOp;
      }
    }
  }
  return nullptr;
}

// Helper function to clone a basic block and update its relations
static BasicBlock *cloneBasicBlockWithRelations(BasicBlock *BB,
                                                const std::string &NameSuffix,
                                                Function *F) {
  ValueToValueMapTy VMap;
  BasicBlock *NewBB = CloneBasicBlock(BB, VMap, NameSuffix, F);

  // Update instruction references in the new block
  for (Instruction &I : *NewBB) {
    // Update operands
    for (Use &U : I.operands()) {
      Value *V = U.get();
      Value *NewV = VMap[V];
      if (NewV) {
        U.set(NewV);
      }
    }

    // Update PHI node basic block references
    if (PHINode *PN = dyn_cast<PHINode>(&I)) {
      for (unsigned i = 0, e = PN->getNumIncomingValues(); i != e; ++i) {
        BasicBlock *IncomingBB = PN->getIncomingBlock(i);
        if (IncomingBB == BB) {
          PN->setIncomingBlock(i, NewBB);
        } else if (VMap.count(IncomingBB)) {
          PN->setIncomingBlock(i, cast<BasicBlock>(VMap[IncomingBB]));
        }
      }
    }
  }

  return NewBB;
}

// 检查基本块的后继是否符合预期
static bool checkSuccessors(BasicBlock *BB, unsigned NumSuccessors,
                            StringRef Succ1Name, StringRef Succ2Name = "") {
  assert(BB->getTerminator() && "BB's terminator is nullptr");
  assert(NumSuccessors == 1 ||
         NumSuccessors == 2 && "NumSuccessors must be 1 or 2");
  if (BB->getTerminator()->getNumSuccessors() != NumSuccessors)
    return false;
  if (!BB->getTerminator()->getSuccessor(0)->getName().equals(Succ1Name))
    return false;
  if (NumSuccessors == 2 &&
      !BB->getTerminator()->getSuccessor(1)->getName().equals(Succ2Name))
    return false;
  return true;
}

static bool checkDspsInt16DotprodType(Function &F) {
  if (F.size() != 6)
    return false;
  if (F.arg_size() != 5)
    return false;

  BasicBlock *Entry = getBasicBlockByName(F, "entry");
  BasicBlock *ForCondCleanup = getBasicBlockByName(F, "for.cond.cleanup");
  BasicBlock *ForBody = getBasicBlockByName(F, "for.body");
  BasicBlock *IfThen = getBasicBlockByName(F, "if.then");
  BasicBlock *IfElse = getBasicBlockByName(F, "if.else");
  BasicBlock *IfEnd = getBasicBlockByName(F, "if.end");
  if (!Entry || !ForCondCleanup || !ForBody || !IfThen || !IfElse || !IfEnd)
    return false;

  // 检查各个基本块的后继
  if (!checkSuccessors(Entry, 2, "for.body", "for.cond.cleanup"))
    return false;

  if (!checkSuccessors(ForCondCleanup, 2, "if.then", "if.else"))
    return false;

  if (!checkSuccessors(ForBody, 2, "for.cond.cleanup", "for.body"))
    return false;

  if (!checkSuccessors(IfThen, 1, "if.end"))
    return false;

  if (!checkSuccessors(IfElse, 1, "if.end"))
    return false;

  // 检查if.end是否为函数出口
  if (!IfEnd->getTerminator()->isTerminator() ||
      !isa<ReturnInst>(IfEnd->getTerminator()))
    return false;
  return true;
}

static bool checkDspsInt16AddType(Function &F) {
  if (F.size() != 4)
    return false;
  if (F.arg_size() != 8)
    return false;

  BasicBlock *Entry = getBasicBlockByName(F, "entry");
  BasicBlock *ForCondPreheader = getBasicBlockByName(F, "for.cond.preheader");
  BasicBlock *ForBody = getBasicBlockByName(F, "for.body");
  BasicBlock *ReturnBB = getBasicBlockByName(F, "return");

  if (!Entry || !ForCondPreheader || !ForBody || !ReturnBB)
    return false;

  // 检查各个基本块的后继
  if (!checkSuccessors(Entry, 2, "return", "for.cond.preheader"))
    return false;

  if (!checkSuccessors(ForCondPreheader, 2, "for.body", "return"))
    return false;

  if (!checkSuccessors(ForBody, 2, "return", "for.body"))
    return false;

  // 检查if.end是否为函数出口
  if (!ReturnBB->getTerminator()->isTerminator() ||
      !isa<ReturnInst>(ReturnBB->getTerminator()))
    return false;
  return true;
}

static bool checkDspsInt16MulCType(Function &F) {
  if (F.size() != 5)
    return false;
  if (F.arg_size() != 6)
    return false;

  BasicBlock *Entry = getBasicBlockByName(F, "entry");
  BasicBlock *ForCondPreheader = getBasicBlockByName(F, "for.cond.preheader");
  BasicBlock *ForBodyLrPh = getBasicBlockByName(F, "for.body.lr.ph");
  BasicBlock *ForBody = getBasicBlockByName(F, "for.body");
  BasicBlock *ReturnBB = getBasicBlockByName(F, "return");

  if (!Entry || !ForCondPreheader || !ForBodyLrPh || !ForBody || !ReturnBB)
    return false;

  // 检查各个基本块的后继
  if (!checkSuccessors(Entry, 2, "return", "for.cond.preheader"))
    return false;

  if (!checkSuccessors(ForCondPreheader, 2, "for.body.lr.ph", "return"))
    return false;

  if (!checkSuccessors(ForBodyLrPh, 1, "for.body"))
    return false;

  if (!checkSuccessors(ForBody, 2, "return", "for.body"))
    return false;

  // 检查if.end是否为函数出口
  if (!ReturnBB->getTerminator()->isTerminator() ||
      !isa<ReturnInst>(ReturnBB->getTerminator()))
    return false;
  return true;
}

static bool checkDspsInt16FirdUnrollPattern(Loop &L) {
  if (L.getLoopDepth() == 1) {
    return false;
  }
  BasicBlock *loopHeader = L.getHeader();
  if (loopHeader->getTerminator()->getNumSuccessors() != 2) {
    return false;
  }
  if (loopHeader->getTerminator()->getSuccessor(1) != loopHeader) {
    return false;
  }
  return true;
}

static bool checkDspiInt16DotprodUnrollPattern(Loop &L) {
  if (L.getLoopDepth() == 1) {
    return false;
  }
  BasicBlock *loopHeader = L.getHeader();
  if (loopHeader->getTerminator()->getNumSuccessors() != 2) {
    return false;
  }
  if (loopHeader->getTerminator()->getSuccessor(1) != loopHeader) {
    return false;
  }
  return true;
}

static bool checkDspsInt16FirdPhiNodes(BasicBlock *forBody) {
  int i16Count = 0;
  int i32Count = 0;
  int i64Count = 0;
  int totalPhiCount = 0;

  for (auto &phi : forBody->phis()) {
    totalPhiCount++;
    if (phi.getType()->isIntegerTy(16)) {
      i16Count++;
    } else if (phi.getType()->isIntegerTy(32)) {
      i32Count++;
    } else if (phi.getType()->isIntegerTy(64)) {
      i64Count++;
    }
  }

  return totalPhiCount == 3 && i16Count == 1 && i32Count == 1 && i64Count == 1;
}

static bool checkDspsWindBlackmanF32Type(Function &F) {
  if(F.size() != 4)
    return false;
  if(F.arg_size() != 2)
    return false;
  BasicBlock *entry = getBasicBlockByName(F, "entry");
  BasicBlock *forBodyLrPh = getBasicBlockByName(F, "for.body.lr.ph");
  BasicBlock *forBody = getBasicBlockByName(F, "for.body");
  BasicBlock *forCondCleanup = getBasicBlockByName(F, "for.cond.cleanup");
  if(!entry || !forBodyLrPh || !forBody || !forCondCleanup)
    return false;
  if(entry->getTerminator()->getNumSuccessors() != 2 || entry->getTerminator()->getSuccessor(0) != forBodyLrPh || entry->getTerminator()->getSuccessor(1) != forCondCleanup)
    return false;
  if(forBodyLrPh->getSingleSuccessor() != forBody)
    return false;
  if(forCondCleanup->getTerminator()->getNumSuccessors() != 0)
    return false;
  if(forBody->getTerminator()->getNumSuccessors() != 2 || forBody->getTerminator()->getSuccessor(0) != forCondCleanup || forBody->getTerminator()->getSuccessor(1) != forBody)
    return false;
  return true;
}

static bool checkDspiConvF32Type(Function &F,LoopInfo &LI) {
   if(F.arg_size() != 3)
     return false;
   
   for(const Argument &arg : F.args()) {
     if(!arg.getType()->isPointerTy()) {
       return false;
     }
   }

   int outerLoopCount = 0;
   int innerLoopCount = 0;
   for(Loop *L : LI){
      outerLoopCount++;
      for(Loop *subL : L->getSubLoops()){
        for(Loop *subsubL : subL->getSubLoops()){
          for(Loop *subsubsubL : subsubL->getSubLoops()){
            innerLoopCount++;
          }
        }
      }
   }
   if(outerLoopCount != 4 || innerLoopCount != 9)
     return false;
   return true;
}

template <typename T> static T *getFirstInst(BasicBlock *BB) {
  for (Instruction &I : *BB) {
    if (T *Inst = dyn_cast<T>(&I)) {
      return Inst;
    }
  }
  return nullptr;
}

template <typename T> static T *getLastInst(BasicBlock *BB) {
  for (Instruction &I : reverse(*BB)) {
    if (T *Inst = dyn_cast<T>(&I)) {
      return Inst;
    }
  }
  return nullptr;
}

static Instruction *getFirstFMulAddInst(BasicBlock *BB) {
  for (Instruction &I : *BB) {
    if (RecurrenceDescriptor::isFMulAddIntrinsic(&I)) {
      return &I;
    }
  }
  return nullptr;
}

static bool checkDspsInt16FIRDType(Function &F, LoopInfo &LI) {
  int loopCount = 0;
  for (Loop *L : LI) {
    for (Loop *subL : L->getSubLoops()) {
      loopCount++;
      if (!checkDspsInt16FirdUnrollPattern(*subL)) {
        continue;
      }
      BasicBlock *forBodyLrPh = subL->getLoopPreheader();
      BasicBlock *forBody = subL->getHeader();
      if (!forBodyLrPh || !forBody)
        return false;
      LoadInst *lI = getFirstInst<LoadInst>(forBodyLrPh);
      if (!lI) {
        return false;
      }
      if (!checkDspsInt16FirdPhiNodes(forBody)) {
        return false;
      }
    }
  }
  return loopCount == 3;
}

// both support dspi int16 dotprod and dotprod_offset
static bool checkDspiInt16DotprodType(Function &F, LoopInfo &LI) {
  for (Loop *L : LI) {
    BasicBlock *forCond25Preheader = L->getHeader();
    BasicBlock *forCond25PreheaderLrPh = L->getLoopPreheader();
    
    if(!forCond25Preheader || !forCond25PreheaderLrPh)
      return false;
    if(forCond25PreheaderLrPh->getSingleSuccessor() != forCond25Preheader)
      return false;
    for (Loop *subL : L->getSubLoops()) {
      BasicBlock *forBody28 = subL->getHeader();
      if(!forBody28)
        return false;
      if (subL->getLoopPredecessor() != forCond25Preheader)
        return false;
      if(forCond25Preheader->getTerminator()->getNumSuccessors() != 2 || forCond25Preheader->getTerminator()->getSuccessor(0) != forBody28)
        return false;
      if(forBody28->getTerminator()->getNumSuccessors() != 2 || forBody28->getTerminator()->getSuccessor(1) != forBody28)
        return false;
      if(forBody28->getTerminator()->getSuccessor(0) != forCond25Preheader->getTerminator()->getSuccessor(1))
        return false;
      PHINode *firstI64Phi = getFirstI64Phi(forCond25Preheader);
      if(!firstI64Phi)
        return false;
      return true;
    }
  }
  return false;
}


// both support dspi f32 dotprod and dotprod_offset
static bool checkDspiF32DotprodType(Function &F, LoopInfo &LI) {
  for (Loop *L : LI) {
    BasicBlock *forCond25Preheader = L->getHeader();
    BasicBlock *forCond25PreheaderLrPh = L->getLoopPreheader();
    
    if(!forCond25Preheader || !forCond25PreheaderLrPh)
      return false;
    if(forCond25PreheaderLrPh->getSingleSuccessor() != forCond25Preheader)
      return false;
    for (Loop *subL : L->getSubLoops()) {
      BasicBlock *forBody28 = subL->getHeader();
      if(!forBody28)
        return false;
      if (subL->getLoopPredecessor() != forCond25Preheader)
        return false;
      if(forCond25Preheader->getTerminator()->getNumSuccessors() != 2 || forCond25Preheader->getTerminator()->getSuccessor(0) != forBody28)
        return false;
      if(forBody28->getTerminator()->getNumSuccessors() != 2 || forBody28->getTerminator()->getSuccessor(1) != forBody28)
        return false;
      if(forBody28->getTerminator()->getSuccessor(0) != forCond25Preheader->getTerminator()->getSuccessor(1))
        return false;
      PHINode *firstF32Phi = getFirstFloatPhi(forCond25Preheader);
      if(!firstF32Phi)
        return false;
      Instruction *firstFMulAddInst = getFirstFMulAddInst(forBody28);
      if(!firstFMulAddInst)
        return false;
      return true;
    }
  }
  return false;
}

static bool checkDspiInt8DotprodType(Function &F, LoopInfo &LI) {
  for (Loop *L : LI) {
    BasicBlock *forCond25Preheader = L->getHeader();
    BasicBlock *forCond25PreheaderLrPh = L->getLoopPreheader();
    
    if(!forCond25Preheader || !forCond25PreheaderLrPh)
      return false;
    if(forCond25PreheaderLrPh->getSingleSuccessor() != forCond25Preheader)
      return false;
    for (Loop *subL : L->getSubLoops()) {
      BasicBlock *forBody28 = subL->getHeader();
      if(!forBody28)
        return false;
      if (subL->getLoopPredecessor() != forCond25Preheader)
        return false;
      if(forCond25Preheader->getTerminator()->getNumSuccessors() != 2 || forCond25Preheader->getTerminator()->getSuccessor(0) != forBody28)
        return false;
      if(forBody28->getTerminator()->getNumSuccessors() != 2 || forBody28->getTerminator()->getSuccessor(1) != forBody28)
        return false;
      if(forBody28->getTerminator()->getSuccessor(0) != forCond25Preheader->getTerminator()->getSuccessor(1))
        return false;
      PHINode *firstI64Phi = getFirstI64Phi(forCond25Preheader);
      if(firstI64Phi)
        return false;
      Instruction *firstFMulAddInst = getFirstFMulAddInst(forBody28);
      if(firstFMulAddInst)
        return false;
      return true;
    }
  }
  return false;
}

static bool checkDspmInt16MultType(Function &F, LoopInfo &LI) {
  for (Loop *L : LI) {
    // 检查第一层循环是否只有一个子循环
    BasicBlock *forCond1PreheaderLrPh = L->getLoopPreheader();
    BasicBlock *forCond1Preheader = L->getHeader();
    BasicBlock *forCondCleanup = L->getExitBlock();
    BasicBlock *forCondCleanup3 = L->getExitingBlock();
    if(!forCond1PreheaderLrPh || !forCond1Preheader || !forCondCleanup || !forCondCleanup3)
      return false;
    if(forCondCleanup3 != L->getLoopLatch())
      return false;
    if (L->getSubLoops().size() != 1)
      return false;
      
    // 检查第二层循环是否只有一个子循环  
    Loop *subL = L->getSubLoops().front();
    if(!subL)
      return false;
    BasicBlock *forBody4LrPh = subL->getLoopPreheader();
    BasicBlock *forBody4 = subL->getHeader();
    BasicBlock *forCondCleanup8 = subL->getExitingBlock();
    if(!forBody4LrPh || !forBody4)
      return false;
    if(subL->getExitBlock() != forCondCleanup3)
      return false;
    if(subL->getLoopLatch() != forCondCleanup8)
      return false;
    if (subL->getSubLoops().size() != 1)
      return false;
      
    // 检查第三层循环是否没有子循环
    Loop *subsubL = subL->getSubLoops().front();
    if (!subsubL || !subsubL->getSubLoops().empty())
      return false;

    if(forBody4 != subsubL->getLoopPredecessor())
      return false;
    BasicBlock *forBody9 = subsubL->getHeader();
    if(!forBody9)
      return false;
    if(forBody9 != subsubL->getLoopLatch() || forBody9 != subsubL->getExitingBlock())
      return false;

    if(forCondCleanup8 != subsubL->getExitBlock())
      return false;
    PHINode *firstI64Phi = getFirstI64Phi(forBody9);
    if(!firstI64Phi)
      return false;
    return true;
  }
  return false;
}


static bool checkDspmF32MultType(Function &F, LoopInfo &LI) {
  for (Loop *L : LI) {
    // 检查第一层循环是否只有一个子循环
    BasicBlock *forCond1PreheaderLrPh = L->getLoopPreheader();
    BasicBlock *forCond1Preheader = L->getHeader();
    BasicBlock *forCondCleanup = L->getExitBlock();
    BasicBlock *forCondCleanup3 = L->getExitingBlock();
    if(!forCond1PreheaderLrPh || !forCond1Preheader || !forCondCleanup || !forCondCleanup3)
      return false;
    if(forCondCleanup3 != L->getLoopLatch())
      return false;
    if (L->getSubLoops().size() != 1)
      return false;
      
    // 检查第二层循环是否只有一个子循环  
    Loop *subL = L->getSubLoops().front();
    if(!subL)
      return false;
    BasicBlock *forBody4LrPh = subL->getLoopPreheader();
    BasicBlock *forBody4 = subL->getHeader();
    BasicBlock *forCondCleanup8 = subL->getExitingBlock();
    if(!forBody4LrPh || !forBody4)
      return false;
    if(subL->getExitBlock() != forCondCleanup3)
      return false;
    if(subL->getLoopLatch() != forCondCleanup8)
      return false;
    if (subL->getSubLoops().size() != 1)
      return false;
      
    // 检查第三层循环是否没有子循环
    Loop *subsubL = subL->getSubLoops().front();
    if (!subsubL || !subsubL->getSubLoops().empty())
      return false;

    if(forBody4 != subsubL->getLoopPredecessor())
      return false;
    BasicBlock *forBody9 = subsubL->getHeader();
    if(!forBody9)
      return false;
    if(forBody9 != subsubL->getLoopLatch() || forBody9 != subsubL->getExitingBlock())
      return false;

    if(forCondCleanup8 != subsubL->getExitBlock())
      return false;
    PHINode *firstF32Phi = getFirstFloatPhi(forBody9);
    if(!firstF32Phi)
      return false;
    for (auto &I : *forCond1PreheaderLrPh) {
      if (auto *icmp = dyn_cast<ICmpInst>(&I)) {
        if (icmp->getPredicate() == ICmpInst::ICMP_SGT) {
          return true;
        }
      }
    }
    return false;
  }
  return false;
}

static bool checkDspmF32MultExType(Function &F, LoopInfo &LI) {
  for (Loop *L : LI) {
    // 检查第一层循环是否只有一个子循环
    BasicBlock *forCond1PreheaderLrPh = L->getLoopPreheader();
    BasicBlock *forCond1Preheader = L->getHeader();
    BasicBlock *forCondCleanup = L->getExitBlock();
    BasicBlock *forCondCleanup3 = L->getExitingBlock();
    if(!forCond1PreheaderLrPh || !forCond1Preheader || !forCondCleanup || !forCondCleanup3)
      return false;
    if(forCondCleanup3 != L->getLoopLatch())
      return false;
    if (L->getSubLoops().size() != 1)
      return false;
      
    // 检查第二层循环是否只有一个子循环  
    Loop *subL = L->getSubLoops().front();
    if(!subL)
      return false;
    BasicBlock *forBody4LrPh = subL->getLoopPreheader();
    BasicBlock *forBody4 = subL->getHeader();
    BasicBlock *forCondCleanup8 = subL->getExitingBlock();
    if(!forBody4LrPh || !forBody4)
      return false;
    if(subL->getExitBlock() != forCondCleanup3)
      return false;
    if(subL->getLoopLatch() != forCondCleanup8)
      return false;
    if (subL->getSubLoops().size() != 1)
      return false;
      
    // 检查第三层循环是否没有子循环
    Loop *subsubL = subL->getSubLoops().front();
    if (!subsubL || !subsubL->getSubLoops().empty())
      return false;

    if(forBody4 != subsubL->getLoopPredecessor())
      return false;
    BasicBlock *forBody9 = subsubL->getHeader();
    if(!forBody9)
      return false;
    if(forBody9 != subsubL->getLoopLatch() || forBody9 != subsubL->getExitingBlock())
      return false;

    if(forCondCleanup8 != subsubL->getExitBlock())
      return false;
    PHINode *firstF32Phi = getFirstFloatPhi(forBody9);
    if(!firstF32Phi)
      return false;
    for (auto &I : *forCond1PreheaderLrPh) {
      if (auto *icmp = dyn_cast<ICmpInst>(&I)) {
        if (icmp->getPredicate() == ICmpInst::ICMP_UGT) {
          return true;
        }
      }
    }
    return false;
  }
  return false;
}

static bool checkDspmF32AddType(Function &F, LoopInfo &LI){
  for (Loop *L : LI) {
    // 检查第一层循环是否只有一个子循环
    if (L->getSubLoops().size() != 1)
      return false;
    BasicBlock *ifEnd30 = L->getLoopPredecessor();
    BasicBlock *forCond34Preheader = L->getHeader();
    BasicBlock *forCondCleanup36 = L->getExitingBlock();
    BasicBlock *returnBB = L->getExitBlock();
    if(!ifEnd30 || !forCond34Preheader || !forCondCleanup36 || !returnBB)
      return false;
    if(L->getLoopLatch() != forCondCleanup36)
      return false;
    // 检查第二层循环是否只有一个子循环  
    Loop *subL = L->getSubLoops().front();
    if (!subL->getSubLoops().empty())
      return false;
    BasicBlock *forBody37 = subL->getHeader();
    if(!forBody37)
      return false;
    if(subL->getLoopPredecessor() != forCond34Preheader)
      return false;
    if(subL->getExitingBlock() != forBody37 || subL->getLoopLatch() != forBody37)
      return false;
    if(subL->getExitBlock() != forCondCleanup36)
      return false;

    return true;
  }
  return false;
}

static std::pair<Value *, Value *> modifyEntryBB(BasicBlock &entryBB,
                                                 int unroll_count) {
  ICmpInst *icmp = getLastICmpInst(&entryBB);
  assert(icmp && "icmp not found");
  Value *start_index = icmp->getOperand(1);
  Value *end_index = icmp->getOperand(0);
  // Insert new instructions before icmp
  IRBuilder<> Builder(icmp);
  Value *andValue = Builder.CreateAnd(
      end_index, ConstantInt::get(end_index->getType(), -unroll_count), "and");
  icmp->setOperand(0, andValue);
  icmp->setOperand(1, start_index);
  return std::make_pair(andValue, end_index);
}

static void modifyAddToOr(BasicBlock *ClonedForBody) {
  SmallVector<BinaryOperator *> addInsts;

  // Collect all add instructions that meet the criteria
  for (auto &I : *ClonedForBody) {
    if (auto *binOp = dyn_cast<BinaryOperator>(&I)) {
      if (binOp->getOpcode() == Instruction::Add &&
          binOp->hasNoUnsignedWrap() && binOp->hasNoSignedWrap()) {
        addInsts.push_back(binOp);
      }
    }
  }
  if (addInsts.empty()) {
    return;
  }
  // Replace each add instruction with an or disjoint instruction
  for (auto it = addInsts.begin(); it != std::prev(addInsts.end()); ++it) {
    auto *addInst = *it;
    // Create a new or disjoint instruction
    Instruction *orInst =
        BinaryOperator::CreateDisjoint(Instruction::Or, addInst->getOperand(0),
                                       addInst->getOperand(1), "add", addInst);

    // Replace all uses of the add instruction
    addInst->replaceAllUsesWith(orInst);

    // Delete the original add instruction
    addInst->eraseFromParent();
    orInst->setName("add");
  }
}

// Helper function to get the last PHI node in a basic block
static PHINode *getLastPhi(BasicBlock *BB) {
  for (auto it = BB->rbegin(); it != BB->rend(); ++it) {
    if (auto *Phi = dyn_cast<PHINode>(&*it)) {
      return Phi;
    }
  }
  return nullptr;
}

static void groupSameInstForDotprod(BasicBlock *forBodyMerged) {
  // Collect different types of instructions
  SmallVector<PHINode *> phiNodes;
  SmallVector<Instruction *> orInsts, gepInsts, loadInsts, sextI16Insts,
      mulnswInsts, sextI32Insts;

  // Categorize instructions by type
  for (Instruction &I : *forBodyMerged) {
    if (auto *phi = dyn_cast<PHINode>(&I)) {
      phiNodes.push_back(phi);
    } else if (I.getOpcode() == Instruction::Or) {
      orInsts.push_back(&I);
    } else if (isa<GetElementPtrInst>(&I)) {
      gepInsts.push_back(&I);
    } else if (isa<LoadInst>(&I)) {
      loadInsts.push_back(&I);
    } else if (auto *sextInst = dyn_cast<SExtInst>(&I)) {
      if (sextInst->getSrcTy()->isIntegerTy(16)) {
        sextI16Insts.push_back(sextInst);
      } else if (sextInst->getSrcTy()->isIntegerTy(32)) {
        sextI32Insts.push_back(sextInst);
      }
    } else if (auto *mulInst = dyn_cast<BinaryOperator>(&I)) {
      if (mulInst->getOpcode() == Instruction::Mul &&
          mulInst->hasNoSignedWrap()) {
        mulnswInsts.push_back(mulInst);
      }
    }
  }

  // If no PHI nodes are found, return
  if (phiNodes.empty()) {
    return;
  }

  // Reorder instructions
  Instruction *insertPoint = phiNodes.back()->getNextNode();

  auto moveInstructions = [&insertPoint](SmallVector<Instruction *> &insts) {
    for (auto *inst : insts) {
      inst->moveBefore(insertPoint);
      insertPoint = inst->getNextNode();
    }
  };

  // Move instructions in the desired order
  moveInstructions(orInsts);
  moveInstructions(gepInsts);
  moveInstructions(loadInsts);
  moveInstructions(sextI16Insts);
  moveInstructions(mulnswInsts);
  moveInstructions(sextI32Insts);
}

static void groupSameInstForFird(BasicBlock *forBodyMerged) {
  // Collect different types of instructions
  SmallVector<PHINode *> phiNodes;
  SmallVector<Instruction *> gepInsts, loadInsts, sextI16Insts, mulnswInsts,
      sextI32Insts, addNswI64Insts;

  // Categorize instructions by type
  for (Instruction &I : *forBodyMerged) {
    if (auto *phi = dyn_cast<PHINode>(&I)) {
      phiNodes.push_back(phi);
    } else if (isa<GetElementPtrInst>(&I)) {
      gepInsts.push_back(&I);
    } else if (isa<LoadInst>(&I)) {
      loadInsts.push_back(&I);
    } else if (auto *sextInst = dyn_cast<SExtInst>(&I)) {
      if (sextInst->getSrcTy()->isIntegerTy(16)) {
        sextI16Insts.push_back(sextInst);
      } else if (sextInst->getSrcTy()->isIntegerTy(32)) {
        sextI32Insts.push_back(sextInst);
      }
    } else if (auto *mulInst = dyn_cast<BinaryOperator>(&I)) {
      if (mulInst->getOpcode() == Instruction::Mul &&
          mulInst->hasNoSignedWrap()) {
        mulnswInsts.push_back(mulInst);
      }
    } else if (auto *addInst = dyn_cast<BinaryOperator>(&I)) {
      if (addInst->getOpcode() == Instruction::Add &&
          addInst->hasNoSignedWrap() && addInst->getType()->isIntegerTy(64)) {
        addNswI64Insts.push_back(addInst);
      }
    }
  }

  // If no PHI nodes are found, return
  if (phiNodes.empty()) {
    return;
  }

  // Reorder instructions
  Instruction *insertPoint = phiNodes.back()->getNextNode();

  auto moveInstructions = [&insertPoint](SmallVector<Instruction *> &insts) {
    for (auto *inst : insts) {
      inst->moveBefore(insertPoint);
      insertPoint = inst->getNextNode();
    }
  };

  // Move instructions in the desired order
  moveInstructions(gepInsts);
  moveInstructions(loadInsts);
  moveInstructions(sextI16Insts);
  moveInstructions(mulnswInsts);
  moveInstructions(sextI32Insts);
  moveInstructions(addNswI64Insts);
  // 检查每条指令的定义和使用
  for (Instruction &I : *forBodyMerged) {
    // 跳过PHI节点,因为PHI节点必须在基本块开头
    if (isa<PHINode>(&I)) {
      continue;
    }

    // 获取该指令的所有使用
    for (Use &U : I.uses()) {
      Instruction *User = dyn_cast<Instruction>(U.getUser());
      if (!User || User->getParent() != forBodyMerged) {
        continue;
      }

      // 如果使用在定义之前,移动定义到使用前
      if (User->comesBefore(&I)) {
        I.moveBefore(User);
        return;
      }
    }
  }
}

static void groupSameInstForAdd(BasicBlock *forBodyMerged){
  // Collect different types of instructions
  SmallVector<PHINode *> phiNodes;
  SmallVector<Instruction *> orInsts, gepInsts, loadInsts,mulnswInsts,faddInsts,fmulInsts,fsubInsts,storeInsts;

  // Categorize instructions by type
  for (Instruction &I : *forBodyMerged) {
    if (auto *phi = dyn_cast<PHINode>(&I)) {
      phiNodes.push_back(phi);
    } else if (I.getOpcode() == Instruction::Or) {
      orInsts.push_back(&I);
    } else if (isa<GetElementPtrInst>(&I)) {
      gepInsts.push_back(&I);
    } else if (isa<LoadInst>(&I)) {
      loadInsts.push_back(&I);
    } else if (auto *binInst = dyn_cast<BinaryOperator>(&I)) {
      if (binInst->getOpcode() == Instruction::Mul &&
          binInst->hasNoSignedWrap()) {
        mulnswInsts.push_back(binInst);
      }
      else if (binInst->getOpcode() == Instruction::FAdd) {
        faddInsts.push_back(binInst);
      }
      else if (binInst->getOpcode() == Instruction::FMul) {
        fmulInsts.push_back(binInst);
      }
      else if (binInst->getOpcode() == Instruction::FSub) {
        fsubInsts.push_back(binInst);
      }
    } else if (isa<StoreInst>(&I)) {
      storeInsts.push_back(&I);
    }
  }

  // If no PHI nodes are found, return
  if (phiNodes.empty()) {
    return;
  }

  // Reorder instructions
  Instruction *insertPoint = phiNodes.back()->getNextNode();

  auto moveInstructions = [&insertPoint](SmallVector<Instruction *> &insts) {
    for (auto *inst : insts) {
      inst->moveBefore(insertPoint);
      insertPoint = inst->getNextNode();
    }
  };

  // Move instructions in the desired order
  moveInstructions(orInsts);
  moveInstructions(mulnswInsts);
  moveInstructions(gepInsts);
  moveInstructions(loadInsts);
  moveInstructions(faddInsts);
  moveInstructions(fsubInsts);
  moveInstructions(fmulInsts);
  moveInstructions(storeInsts);

}

static void groupSameInstForDspiConvF32(BasicBlock *forBodyMerged){
  // Collect different types of instructions
  SmallVector<PHINode *> phiNodes;
  SmallVector<Instruction *> orInsts, gepInsts, loadInsts,mulnswInsts,fmuladdInsts,addInsts,fmulInsts,fsubInsts,storeInsts;

  // Categorize instructions by type
  for (Instruction &I : *forBodyMerged) {
    if (RecurrenceDescriptor::isFMulAddIntrinsic(&I)) {
      fmuladdInsts.push_back(&I);
    } 
    else if (auto *phi = dyn_cast<PHINode>(&I)) {
      phiNodes.push_back(phi);
    } else if (isa<GetElementPtrInst>(&I)) {
      gepInsts.push_back(&I);
    } else if (isa<LoadInst>(&I)) {
      loadInsts.push_back(&I);
    } else if (auto *binInst = dyn_cast<BinaryOperator>(&I)) {
      if (binInst->getOpcode() == Instruction::Mul &&
          binInst->hasNoSignedWrap()) {
        mulnswInsts.push_back(binInst);
      }
      else if (I.getOpcode() == Instruction::Or) {
            orInsts.push_back(&I);
      }
      else if (binInst->getOpcode() == Instruction::Add) {
        addInsts.push_back(binInst);
      }
      else if (binInst->getOpcode() == Instruction::FMul) {
        fmulInsts.push_back(binInst);
      }
      else if (binInst->getOpcode() == Instruction::FSub) {
        fsubInsts.push_back(binInst);
      }
    } else if (isa<StoreInst>(&I)) {
      storeInsts.push_back(&I);
    }
  }

  // If no PHI nodes are found, return
  if (phiNodes.empty()) {
    return;
  }

  // Reorder instructions
  Instruction *insertPoint = phiNodes.back()->getNextNode();

  auto moveInstructions = [&insertPoint](SmallVector<Instruction *> &insts) {
    for (auto *inst : insts) {
      inst->moveBefore(insertPoint);
      insertPoint = inst->getNextNode();
    }
  };

  // Move instructions in the desired order
  // moveInstructions(orInsts);
  
  moveInstructions(mulnswInsts);
  moveInstructions(addInsts);
  
  moveInstructions(gepInsts);
  moveInstructions(loadInsts);
  moveInstructions(fmuladdInsts);
  
  moveInstructions(fmulInsts);
  moveInstructions(storeInsts);

}

// both support dspi int16 dotprod and dotprod_offset
static void postUnrollDspsInt16Dotprod(Function &F, Loop &L, int unroll_count) {
  // 获取基本块
  BasicBlock *entryBB = &F.getEntryBlock();
  BasicBlock *loopPreheader = L.getLoopPreheader();
  BasicBlock *loopHeader = L.getHeader();
  BasicBlock *forEnd = getBasicBlockByName(F, "for.cond.cleanup");
  BasicBlock *forCondCleanupLoopExit =
      getBasicBlockByName(F, "for.cond.cleanup.loopexit");
  assert(forEnd && "basic block not found");
  forEnd->setName("for.end85");

  // 克隆和合并基本块
  BasicBlock *loopHeaderClone =
      cloneBasicBlockWithRelations(loopHeader, ".clone", &F);
  loopHeaderClone->moveAfter(loopHeader);
  loopHeaderClone->getTerminator()->setSuccessor(1, loopHeader);

  std::vector<BasicBlock *> BBsToMerge;
  StringRef forBodyName = loopHeader->getName();
  for (int i = 1; i < unroll_count; ++i) {
    std::string BBName = (forBodyName + "." + std::to_string(i)).str();
    BasicBlock *clonedBB = getBasicBlockByName(F, BBName);
    if (clonedBB) {
      BBsToMerge.push_back(clonedBB);
    } else {
      llvm_unreachable("Basic block not found");
    }
  }

  if (BBsToMerge.size() == static_cast<size_t>(unroll_count - 1)) {
    for (BasicBlock *BB : BBsToMerge) {
      MergeBasicBlockIntoOnlyPred(BB);
    }
  }

  // 创建和移动基本块
  BasicBlock *forCond73Preheader =
      BasicBlock::Create(F.getContext(), "for.cond73.preheader", &F, forEnd);
  forCondCleanupLoopExit->getTerminator()->setSuccessor(0, forCond73Preheader);
  forEnd->moveAfter(forCondCleanupLoopExit);
  BasicBlock *forBodyMerged = BBsToMerge.back();
  loopHeaderClone->moveAfter(forBodyMerged);
  forEnd->moveAfter(loopHeaderClone);

  // 修改Entry基本块
  auto [andValue, endIndex] = modifyEntryBB(*entryBB, unroll_count);
  ICmpInst *lastICmp = getLastICmpInst(forBodyMerged);
  assert(lastICmp && "icmp not found");
  lastICmp->setOperand(1, andValue);
  lastICmp->setPredicate(ICmpInst::ICMP_SLT);
  entryBB->getTerminator()->setSuccessor(1, forCond73Preheader);

  // 插入循环前置指令
  IRBuilder<> preheaderBuilder(loopPreheader->getTerminator());
  Value *minusOne = preheaderBuilder.CreateAdd(
      andValue, ConstantInt::get(andValue->getType(), -1));
  Value *andEight = preheaderBuilder.CreateAnd(
      minusOne, ConstantInt::get(andValue->getType(), -unroll_count));

  // 插入循环退出指令
  IRBuilder<> exitBuilder(forCondCleanupLoopExit->getTerminator());
  Value *addEight = exitBuilder.CreateAdd(
      andEight, ConstantInt::get(andValue->getType(), unroll_count));

  // 处理PHI节点
  PHINode *i0Lcssa = PHINode::Create(Type::getInt32Ty(F.getContext()), 2,
                                     "i.0.lcssa", forCond73Preheader);
  i0Lcssa->addIncoming(ConstantInt::get(Type::getInt32Ty(F.getContext()), 0),
                       entryBB);
  i0Lcssa->addIncoming(addEight, forCondCleanupLoopExit);

  ICmpInst *cmp74172 =
      new ICmpInst(ICmpInst::ICMP_SLT, i0Lcssa, endIndex, "cmp74172");
  cmp74172->insertAfter(i0Lcssa);

  BranchInst *br = BranchInst::Create(loopHeaderClone, forEnd, cmp74172);
  br->insertAfter(cmp74172);

  // 克隆和处理PHI节点
  PHINode *firstI64Phi = getFirstI64Phi(forBodyMerged);
  assert(firstI64Phi && "first i64 phi not found");

  SmallVector<Instruction *> addNswI64Insts;
  for (Instruction &I : *forBodyMerged) {
    if (auto *binOp = dyn_cast<BinaryOperator>(&I)) {
      if (binOp->getOpcode() == Instruction::Add && binOp->hasNoSignedWrap() &&
          binOp->getType()->isIntegerTy(64)) {
        addNswI64Insts.push_back(binOp);
      }
    }
  }
  assert(!addNswI64Insts.empty() && "add.nsw i64 instruction not found");

  PHINode *clonedPhi = cast<PHINode>(firstI64Phi->clone());
  clonedPhi->setName("result0.0");
  clonedPhi->insertAfter(firstI64Phi);
  auto *temp = addNswI64Insts[0];
  clonedPhi->setIncomingValue(1, temp);
  temp->setOperand(0, clonedPhi);

  // 处理返回值
  Value *conv1 = nullptr;
  for (PHINode &phi : forBodyMerged->phis()) {
    phi.setIncomingBlock(0, entryBB);
    auto *temp = phi.clone();
    temp->setName("result0.0.lcssa");
    PHINode *tempPhi = cast<PHINode>(temp);
    if (!conv1) {
      conv1 = tempPhi->getIncomingValue(0);
      tempPhi->setIncomingValue(0, ConstantInt::get(temp->getType(), 0));
      tempPhi->setIncomingBlock(1, forCondCleanupLoopExit);
      temp->insertBefore(forCond73Preheader->getTerminator());
      break;
    }
  }

  movePHINodesToTop(*forCond73Preheader);

  for (PHINode &phi : forBodyMerged->phis()) {
    phi.setIncomingBlock(0, loopPreheader);
    phi.setIncomingValue(0, ConstantInt::get(phi.getType(), 0));
  }

  swapTerminatorSuccessors(forBodyMerged);

  // 处理最终返回值
  PHINode *originalRetValue = getFirstI64Phi(forEnd);

  PHINode *result0_0_lcssa8 = getLastI64Phi(forCond73Preheader);
  result0_0_lcssa8->setIncomingValue(0, conv1);

  Instruction *lastAddNswI64Inst = getLastAddNswI64Inst(loopHeaderClone);
  originalRetValue->setIncomingValue(0, result0_0_lcssa8);
  originalRetValue->setIncomingBlock(0, forCond73Preheader);
  originalRetValue->setIncomingValue(1, lastAddNswI64Inst);
  originalRetValue->setIncomingBlock(1, loopHeaderClone);

  Instruction *originalRetValueClone = originalRetValue->clone();
  PHINode *loopHeaderCloneFirstI64Phi = getFirstI64Phi(loopHeaderClone);
  originalRetValueClone->insertBefore(loopHeaderCloneFirstI64Phi);
  loopHeaderCloneFirstI64Phi->replaceAllUsesWith(originalRetValueClone);

  // 最终清理
  movePHINodesToTop(*forBodyMerged);

  PHINode *firstI32PhiLoopHeaderClone = getFirstI32Phi(loopHeaderClone);
  PHINode *firstI32PhiForCond73Preheader = getFirstI32Phi(forCond73Preheader);
  firstI32PhiLoopHeaderClone->setIncomingValue(1,
                                               firstI32PhiForCond73Preheader);
  firstI32PhiLoopHeaderClone->setIncomingBlock(1, forCond73Preheader);
  firstI32PhiLoopHeaderClone->setIncomingBlock(0, loopHeaderClone);

  Instruction *firstAddNuwNswI32Inst =
      getFirstAddNuwNswI32Inst(loopHeaderClone);
  firstI32PhiLoopHeaderClone->setIncomingValue(0, firstAddNuwNswI32Inst);

  loopHeaderClone->getTerminator()->setSuccessor(0, forEnd);
  loopHeaderClone->getTerminator()->setSuccessor(1, loopHeaderClone);

  getLastI64Phi(forBodyMerged)->setIncomingValue(0, conv1);
  getLastI64Phi(forBodyMerged)
      ->setIncomingValue(1, getLastAddNswI64Inst(forBodyMerged));
  // modifyAddToOr(forBodyMerged);
  runPostPass(F);
  groupSameInstForDotprod(forBodyMerged);
  runDeadCodeElimination(F);
}

// Function to check if a call instruction can be moved
static bool canMoveCallInstruction(CallInst *callInst,
                                   Instruction *insertPoint) {
  for (unsigned i = 0; i < callInst->getNumOperands(); ++i) {
    if (auto *operandInst = dyn_cast<Instruction>(callInst->getOperand(i))) {
      if (operandInst->getParent() == callInst->getParent() &&
          insertPoint->comesBefore(operandInst)) {
        return false;
      }
    }
  }
  return true;
}

static void groupSameInst(BasicBlock *forBodyMerged) {
  PHINode *firstI32Phi = getFirstI32Phi(forBodyMerged);
  // 遍历基本块中的所有指令
  SmallVector<Instruction *> mulInsts;
  SmallVector<Instruction *> mulInsts2;
  SmallVector<Instruction *> orInsts;
  SmallVector<Instruction *> gepInsts, loadInsts, sextInsts, ashrInsts,
      truncInsts, storeInsts, addInsts;
  for (auto &I : *forBodyMerged) {
    if (auto *BinInst = dyn_cast<BinaryOperator>(&I)) {
      // 检查是否是mul nsw指令且第一个操作数是firstI32Phi
      if (BinInst->getOpcode() == Instruction::Mul &&
          BinInst->hasNoSignedWrap() && BinInst->getOperand(0) == firstI32Phi) {
        mulInsts.push_back(BinInst);
      } else if (BinInst->getOpcode() == Instruction::Mul &&
                 BinInst->hasNoSignedWrap()) {
        mulInsts2.push_back(BinInst);
      } else if (BinInst->getOpcode() == Instruction::Or &&
                 cast<PossiblyDisjointInst>(&I)->isDisjoint() &&
                 BinInst->getOperand(0) == firstI32Phi) {
        orInsts.push_back(BinInst);
      } else if (BinInst->getOpcode() == Instruction::AShr) {
        ashrInsts.push_back(BinInst);
      } else if (BinInst->getOpcode() == Instruction::Add &&
                 BinInst->hasNoSignedWrap()) {
        addInsts.push_back(BinInst);
      }

    } else if (isa<GetElementPtrInst>(&I)) {
      gepInsts.push_back(cast<GetElementPtrInst>(&I));
    } else if (isa<LoadInst>(&I)) {
      loadInsts.push_back(cast<LoadInst>(&I));
    } else if (isa<SExtInst>(&I)) {
      sextInsts.push_back(cast<SExtInst>(&I));
    } else if (isa<StoreInst>(&I)) {
      storeInsts.push_back(cast<StoreInst>(&I));
    } else if (auto *truncInst = dyn_cast<TruncInst>(&I)) {
      truncInsts.push_back(truncInst);
    }
  }

  Instruction *insertPoint = firstI32Phi->getNextNode();
  auto moveInstructions = [&insertPoint](SmallVector<Instruction *> &insts) {
    for (auto *inst : insts) {
      inst->moveBefore(insertPoint);
      insertPoint = inst->getNextNode();
    }
  };
  // 将找到的mul指令移动到firstI32Phi后面
  moveInstructions(orInsts);
  moveInstructions(mulInsts);
  moveInstructions(gepInsts);
  moveInstructions(loadInsts);
  moveInstructions(sextInsts);
  moveInstructions(addInsts);
  moveInstructions(ashrInsts);
  moveInstructions(truncInsts);

  // moveInstructions(storeInsts);
}

// unroll factor is 16
static void postUnrollInt16MathType(Function &F, Loop &L, int unroll_count) {
  BasicBlock *forBodyPreheader = L.getLoopPreheader();
  BasicBlock *loopHeader = L.getHeader();

  // 克隆和合并基本块
  BasicBlock *loopHeaderClone =
      cloneBasicBlockWithRelations(loopHeader, ".clone", &F);
  loopHeaderClone->moveAfter(loopHeader);
  loopHeaderClone->getTerminator()->setSuccessor(1, loopHeader);

  std::vector<BasicBlock *> BBsToMerge;
  StringRef forBodyName = loopHeader->getName();
  for (int i = 1; i < unroll_count; ++i) {
    std::string BBName = (forBodyName + "." + std::to_string(i)).str();
    BasicBlock *clonedBB = getBasicBlockByName(F, BBName);
    if (clonedBB) {
      BBsToMerge.push_back(clonedBB);
    } else {
      llvm_unreachable("Basic block not found");
    }
  }

  if (BBsToMerge.size() == static_cast<size_t>(unroll_count - 1)) {
    for (BasicBlock *BB : BBsToMerge) {
      MergeBasicBlockIntoOnlyPred(BB);
    }
  }

  BasicBlock *forBodyMerged = BBsToMerge.back();
  loopHeaderClone->moveAfter(forBodyMerged);

  // modify for.cond.preheader
  BasicBlock *forCondPreheader = getBasicBlockByName(F, "for.cond.preheader");

  ICmpInst *firstICmp = getFirstICmpInst(forCondPreheader);
  assert(firstICmp && "icmp not found");
  Value *lenarg = firstICmp->getOperand(0);
  IRBuilder<> Builder(firstICmp);
  Value *andValue = Builder.CreateAnd(
      lenarg, ConstantInt::get(lenarg->getType(), 1 - unroll_count), "and");
  firstICmp->setOperand(0, andValue);
  forCondPreheader->getTerminator()->setSuccessor(1, forBodyMerged);
  swapTerminatorSuccessors(forCondPreheader);

  getLastICmpInst(forBodyMerged)->setOperand(1, andValue);
  getLastICmpInst(forBodyMerged)->setPredicate(ICmpInst::ICMP_SLT);

  // modify for.body.preheader
  PHINode *firstI32Phi = getFirstI32Phi(forBodyMerged);
  firstI32Phi->setIncomingBlock(0, forCondPreheader);
  // 克隆PHI节点到forBodyPreheader开头
  PHINode *clonedPhi = cast<PHINode>(firstI32Phi->clone());
  // 将克隆的PHI节点插入到forBodyPreheader开头
  clonedPhi->setName("i.0.lcssa");
  clonedPhi->insertBefore(&*forBodyPreheader->begin());

  // 创建比较指令
  Builder.SetInsertPoint(forBodyPreheader->getTerminator());
  Value *cmp = Builder.CreateICmpSLT(clonedPhi, lenarg, "cmp226415");

  // 替换原来的无条件跳转为条件跳转
  BranchInst *oldBr = cast<BranchInst>(forBodyPreheader->getTerminator());
  BasicBlock *returnBB = getBasicBlockByName(F, "return");
  BranchInst *newBr = BranchInst::Create(loopHeaderClone, returnBB, cmp);
  ReplaceInstWithInst(oldBr, newBr);

  // modify for.body.merged
  forBodyMerged->getTerminator()->setSuccessor(0, forBodyMerged);
  forBodyMerged->getTerminator()->setSuccessor(1, forBodyPreheader);

  // modify for.body.clone
  getFirstI32Phi(loopHeaderClone)->setIncomingValue(0, clonedPhi);
  getFirstI32Phi(loopHeaderClone)
      ->setIncomingValue(1, getLastICmpInst(loopHeaderClone)->getOperand(0));
  getFirstI32Phi(loopHeaderClone)->setIncomingBlock(1, loopHeaderClone);
  loopHeaderClone->getTerminator()->setSuccessor(1, loopHeaderClone);

  // modify return
  getFirstI32Phi(returnBB)->setIncomingBlock(1, forBodyPreheader);

  // modifyAddToOr(forBodyMerged);
  runPostPass(F);
  // groupSameInst(forBodyMerged);

  runDeadCodeElimination(F);
}

static bool isMathType(Function &F) {
  return currentUnrollType == UnrollType::INT16_DSPS_ADD ||
         currentUnrollType == UnrollType::INT16_DSPS_MULC;
}

static void preTransformDspsInt16MulC(Function &F) {
  BasicBlock *forCondPreheader = getBasicBlockByName(F, "for.cond.preheader");
  BasicBlock *ForBodyLrPh = getBasicBlockByName(F, "for.body.lr.ph");

  // 获取for.body.lr.ph中除了terminator之外的所有指令
  SmallVector<Instruction *, 8> instToMove;
  for (auto &I : *ForBodyLrPh) {
    if (!I.isTerminator()) {
      instToMove.push_back(&I);
    }
  }

  // 将指令移动到for.cond.preheader的开头
  Instruction *insertPoint = &*forCondPreheader->getFirstInsertionPt();
  for (auto *I : instToMove) {
    I->moveBefore(insertPoint);
  }

  // 获取for.body.lr.ph的后继基本块
  BasicBlock *successor = ForBodyLrPh->getTerminator()->getSuccessor(0);

  // 更新所有使用for.body.lr.ph的PHI节点
  for (BasicBlock *Succ : successors(ForBodyLrPh)) {
    for (PHINode &PN : Succ->phis()) {
      int idx = PN.getBasicBlockIndex(ForBodyLrPh);
      if (idx != -1) {
        PN.setIncomingBlock(idx, forCondPreheader);
      }
    }
  }

  // 更新for.cond.preheader的terminator
  forCondPreheader->getTerminator()->setSuccessor(0, successor);

  // 删除for.body.lr.ph
  ForBodyLrPh->eraseFromParent();
}

template <typename T> static BinaryOperator *getFirstAddInst(BasicBlock *BB) {
  for (Instruction &I : *BB) {
    if (BinaryOperator *BinOp = dyn_cast<BinaryOperator>(&I)) {
      if (BinOp->getOpcode() == Instruction::Add &&
          BinOp->getType()->isIntegerTy(sizeof(T) * 8)) {
        return BinOp;
      }
    }
  }
  return nullptr;
}



template <typename T> static BinaryOperator *getLastAddInst(BasicBlock *BB) {
  for (Instruction &I : reverse(*BB)) {
    if (BinaryOperator *BinOp = dyn_cast<BinaryOperator>(&I)) {
      if (BinOp->getOpcode() == Instruction::Add &&
          BinOp->getType()->isIntegerTy(sizeof(T) * 8)) {
        return BinOp;
      }
    }
  }
  return nullptr;
}

static void mergeAndMoveLoadInst(BasicBlock *forbody46LrPh,
                                 BasicBlock *forbody64LrPh, BasicBlock *entry) {
  // 获取两个load指令
  LoadInst *Load46 = getFirstInst<LoadInst>(forbody46LrPh);
  LoadInst *Load64 = getFirstInst<LoadInst>(forbody64LrPh);

  // 将第一个load指令移动到entry block开头
  if (Load46) {
    Load46->moveBefore(&*entry->getFirstInsertionPt());
    // 将第二个load指令的所有使用替换为第一个load指令
    if (Load64) {
      Load64->replaceAllUsesWith(Load46);
      Load64->eraseFromParent();
    }
  }
}

static std::pair<BasicBlock *, BasicBlock *>
cloneAndMergeLoop(Loop *L, Function &F, int unroll_count) {

  BasicBlock *loopHeader = L->getHeader();
  BasicBlock *loopHeaderClone =
      cloneBasicBlockWithRelations(loopHeader, ".clone", &F);
  loopHeaderClone->moveAfter(loopHeader);
  loopHeaderClone->getTerminator()->setSuccessor(1, loopHeader);

  std::vector<BasicBlock *> BBsToMerge;
  StringRef forBodyName = loopHeader->getName();
  for (int i = 1; i < unroll_count; ++i) {
    std::string BBName = (forBodyName + "." + std::to_string(i)).str();
    BasicBlock *clonedBB = getBasicBlockByName(F, BBName);
    if (clonedBB) {
      BBsToMerge.push_back(clonedBB);
    } else {
      llvm_unreachable("Basic block not found");
    }
  }

  if (BBsToMerge.size() == static_cast<size_t>(unroll_count - 1)) {
    for (BasicBlock *BB : BBsToMerge) {
      MergeBasicBlockIntoOnlyPred(BB);
    }
  }

  return std::make_pair(loopHeaderClone, BBsToMerge.back());
}

static void transformUnrollGetElementPtr(BasicBlock *BB) {
  // 收集所有的 getelementptr 指令
  SmallVector<GetElementPtrInst *, 16> GEPs;
  for (auto &I : *BB) {
    if (auto *GEP = dyn_cast<GetElementPtrInst>(&I)) {
      GEPs.push_back(GEP);
    }
  }

  if (GEPs.size() < 2) {
    return;
  }

  // 获取第一个和第二个GEP作为基准
  GetElementPtrInst *FirstGEP = GEPs[0];
  GetElementPtrInst *SecondGEP = GEPs[1];

  // 从第三个GEP开始处理
  for (unsigned i = 2; i < GEPs.size(); i++) {
    GetElementPtrInst *GEP = GEPs[i];

    if (i % 2 == 0) {
      // 偶数索引的GEP
      GEP->setOperand(0, FirstGEP);
      int64_t Offset = -(i / 2);
      GEP->setOperand(1,
                      ConstantInt::get(GEP->getOperand(1)->getType(), Offset));
    } else {
      // 奇数索引的GEP
      GEP->setOperand(0, SecondGEP);
      int64_t Offset = (i - 1) / 2;
      GEP->setOperand(1,
                      ConstantInt::get(GEP->getOperand(1)->getType(), Offset));
    }
  }
}

static void
postUnrollDspsInt16FIRD(Function &F,
                        SmallVector<Loop *, 2> &FIRDWillTransformLoops,
                        int unroll_count, LoopInfo &LI) {
  runDeadCodeElimination(F);

  // merge load fir into one and move it into entry block
  Loop *firstL = FIRDWillTransformLoops.front();
  Loop *secondL = FIRDWillTransformLoops.back();
  BasicBlock *forBody46LrPh = firstL->getLoopPreheader();
  BasicBlock *forBody64LrPh = secondL->getLoopPreheader();
  BasicBlock *forBody46 = firstL->getHeader();
  BasicBlock *forBody64 = secondL->getHeader();
  BasicBlock *entry = &F.getEntryBlock();
  mergeAndMoveLoadInst(forBody46LrPh, forBody64LrPh, entry);

  BasicBlock *forCondCleanup20 = forBody46LrPh->getSinglePredecessor();
  SExtInst *conv39 = getFirstInst<SExtInst>(forCondCleanup20);
  SExtInst *conv42 = getLastInst<SExtInst>(forCondCleanup20);
  ICmpInst *cmp43142 = getLastInst<ICmpInst>(forCondCleanup20);
  Value *Sub45 = BinaryOperator::CreateNSWAdd(
      conv42, ConstantInt::get(conv42->getType(), -15), "sub45", cmp43142);
  cmp43142->setOperand(0, conv39);
  cmp43142->setOperand(1, Sub45);

  // 克隆和合并loop
  auto [forBody46Clone, forBody46Merged] =
      cloneAndMergeLoop(firstL, F, unroll_count);
  auto [forBody64Clone, forBody64Merged] =
      cloneAndMergeLoop(secondL, F, unroll_count);
  forBody46Clone->moveAfter(forBody46Merged);
  forBody64Clone->moveAfter(forBody64Merged);

  BasicBlock *forCond58Preheader = forBody64LrPh->getSinglePredecessor();
  forBody64LrPh->getTerminator()->setSuccessor(0, forBody46Clone);
  PHINode *acc_0_lcssa = getFirstInst<PHINode>(forCond58Preheader);
  PHINode *coeff_pos_0_lcssa = getLastInst<PHINode>(forCond58Preheader);

  BasicBlock *forCond58PreheaderLoopExit = acc_0_lcssa->getIncomingBlock(1);
  PHINode *add_lcssa = cast<PHINode>(acc_0_lcssa->getIncomingValue(1));
  acc_0_lcssa->setIncomingValue(
      1, add_lcssa->getIncomingValue(add_lcssa->getNumIncomingValues() - 1));

  PHINode *coeff_pos_0145 = getFirstInst<PHINode>(forBody46Merged);
  Value *coeff_pos_0_15 = coeff_pos_0145->getIncomingValue(1);
  coeff_pos_0_lcssa->setIncomingValue(1, coeff_pos_0_15);

  ICmpInst *exitCond_not_15 = getLastInst<ICmpInst>(forBody46Merged);
  Value *inc15_15 = exitCond_not_15->getOperand(0);

  ICmpInst *cmp61148 = getLastInst<ICmpInst>(forCond58Preheader);
  PHINode *n_0_lcssa =
      PHINode::Create(conv39->getType(), 2, "n.0.lcssa", cmp61148);
  n_0_lcssa->addIncoming(conv39, forCondCleanup20);
  n_0_lcssa->addIncoming(inc15_15, forCond58PreheaderLoopExit);
  for (auto &phi : forCond58Preheader->phis()) {
    phi.setIncomingBlock(1, forBody46Merged);
  }

  IRBuilder<> Builder(cmp61148);
  Value *n_0_lcssa_trunc =
      Builder.CreateTrunc(n_0_lcssa, Type::getInt16Ty(F.getContext()));
  cmp61148->setOperand(0, conv42);
  cmp61148->setOperand(1, n_0_lcssa);

  exitCond_not_15->setOperand(1, Sub45);
  exitCond_not_15->setPredicate(ICmpInst::ICMP_SLT);
  forBody46Merged->getTerminator()->setSuccessor(0, forCond58Preheader);
  swapTerminatorSuccessors(forBody46Merged);

  Value *load_coeffs_len = conv42->getOperand(0);
  Value *load_pos = conv39->getOperand(0);
  BasicBlock *forCond227PreheaderLoopExit = BasicBlock::Create(
      F.getContext(), "for.cond227.preheader.loopexit", &F, forBody46Clone);
  Builder.SetInsertPoint(forCond227PreheaderLoopExit);
  Value *num = Builder.CreateSub(coeff_pos_0_lcssa, load_coeffs_len);
  Value *m46 = Builder.CreateAdd(num, n_0_lcssa_trunc);
  auto *add_clone = getFirstAddInst<int64_t>(forBody46Clone);
  for (auto &phi : forBody46Clone->phis()) {
    if (phi.getType()->isIntegerTy(16)) {
      phi.setIncomingValue(0, coeff_pos_0_lcssa);
      phi.setIncomingValue(1, getFirstAddInst<int16_t>(forBody46Clone));
    } else if (phi.getType()->isIntegerTy(32)) {
      phi.setIncomingValue(0, n_0_lcssa);
      phi.setIncomingValue(1, getFirstAddInst<int32_t>(forBody46Clone));
    } else if (phi.getType()->isIntegerTy(64)) {
      phi.setIncomingValue(0, acc_0_lcssa);
      phi.setIncomingValue(1, add_clone);
    }
    phi.setIncomingBlock(0, forBody64LrPh);
    phi.setIncomingBlock(1, forBody46Clone);
  }
  ICmpInst *exitcond159_not_clone = getLastInst<ICmpInst>(forBody46Clone);

  forBody46Clone->getTerminator()->setSuccessor(0, forCond227PreheaderLoopExit);
  forBody46Clone->getTerminator()->setSuccessor(1, forBody46Clone);

  BasicBlock *forCond227Preheader = BasicBlock::Create(
      F.getContext(), "for.cond227.preheader", &F, forBody46Clone);
  BranchInst::Create(forCond227Preheader, forCond227PreheaderLoopExit);

  PHINode *acc_1_lcssa = PHINode::Create(Type::getInt64Ty(F.getContext()), 2,
                                         "acc.1.lcssa", forCond227Preheader);
  acc_1_lcssa->addIncoming(acc_0_lcssa, forCond58Preheader);
  acc_1_lcssa->addIncoming(add_clone, forCond227PreheaderLoopExit);

  PHINode *coeff_pos_1_lcssa =
      PHINode::Create(Type::getInt16Ty(F.getContext()), 2, "coeff_pos.1.lcssa",
                      forCond227Preheader);
  coeff_pos_1_lcssa->addIncoming(coeff_pos_0_lcssa, forCond58Preheader);
  coeff_pos_1_lcssa->addIncoming(m46, forCond227PreheaderLoopExit);

  Builder.SetInsertPoint(forCond227Preheader);
  Value *sub230 = Builder.CreateAdd(
      conv39, ConstantInt::get(Type::getInt32Ty(F.getContext()), -15), "sub230",
      true);
  Value *cmp231659 = Builder.CreateICmpSGT(
      load_pos, ConstantInt::get(Type::getInt16Ty(F.getContext()), 15),
      "cmp231659");

  BasicBlock *forCondCleanup63 =
      forCond58Preheader->getTerminator()->getSuccessor(1);
  forCond58Preheader->getTerminator()->setSuccessor(1, forCond227Preheader);

  BasicBlock *forBody233Preheader = BasicBlock::Create(
      F.getContext(), "for.body233.preheader", &F, forBody46Clone);

  BasicBlock *forCond398Preheader =
      BasicBlock::Create(F.getContext(), "for.cond398.preheader", &F,
                         forBody46Clone->getNextNode());
  Builder.CreateCondBr(cmp231659, forBody233Preheader, forCond398Preheader);

  Builder.SetInsertPoint(forBody233Preheader);
  Value *m47 = Builder.CreateAnd(
      conv39, ConstantInt::get(Type::getInt32Ty(F.getContext()), 32752), "m47");
  BranchInst::Create(forBody64Merged, forBody233Preheader);

  auto cloneAndInsertPhi = [&](PHINode &phi) {
    PHINode *phi_clone = cast<PHINode>(phi.clone());
    phi_clone->setIncomingBlock(0, forCond227Preheader);
    phi_clone->insertInto(forCond398Preheader, forCond398Preheader->begin());

    assert(phi_clone->getParent() == forCond398Preheader &&
           "PHI node inserted into wrong basic block");
    return phi_clone;
  };

  DenseMap<unsigned, PHINode *> phiCloneMap;
  for (auto &phi : forBody64Merged->phis()) {
    phi.setIncomingBlock(0, forBody233Preheader);
    if (phi.getType()->isIntegerTy(16)) {
      phi.setIncomingValue(0, coeff_pos_1_lcssa);
      phiCloneMap[16] = cloneAndInsertPhi(phi);
    } else if (phi.getType()->isIntegerTy(32)) {
      PHINode *phi_clone = cloneAndInsertPhi(phi);
      phiCloneMap[32] = phi_clone;
      phi_clone->setIncomingValue(1, m47);
      Builder.SetInsertPoint(forCond398Preheader);
      Value *cmp401666 = Builder.CreateICmpSLT(phi_clone, conv39, "cmp401666");
      Builder.CreateCondBr(cmp401666, forBody64Clone, forCondCleanup63);
    } else if (phi.getType()->isIntegerTy(64)) {
      phi.setIncomingValue(0, acc_1_lcssa);
      phiCloneMap[64] = cloneAndInsertPhi(phi);
    }
  }
  ICmpInst *exitCond159_not_64 = getLastInst<ICmpInst>(forBody64Merged);
  exitCond159_not_64->setPredicate(ICmpInst::ICMP_SLT);
  exitCond159_not_64->setOperand(1, sub230);
  forBody64Merged->getTerminator()->setSuccessor(0, forCond398Preheader);
  swapTerminatorSuccessors(forBody64Merged);

  auto *add75_clone = getFirstAddInst<int64_t>(forBody64Clone);
  for (auto &phi : forBody64Clone->phis()) {
    if (phi.getType()->isIntegerTy(16)) {
      phi.setIncomingValue(0, phiCloneMap[16]);
      phi.setIncomingValue(1, getFirstAddInst<int16_t>(forBody64Clone));
    } else if (phi.getType()->isIntegerTy(32)) {
      phi.setIncomingValue(0, phiCloneMap[32]);
      phi.setIncomingValue(1, getFirstAddInst<int32_t>(forBody64Clone));
    } else if (phi.getType()->isIntegerTy(64)) {
      phi.setIncomingValue(0, phiCloneMap[64]);
      phi.setIncomingValue(1, add75_clone);
    }
    phi.setIncomingBlock(0, forCond398Preheader);
    phi.setIncomingBlock(1, forBody64Clone);
  }

  forBody64Clone->getTerminator()->setSuccessor(1, forBody64Clone);

  forCondCleanup63->moveAfter(forBody64Clone);

  PHINode *old_acc_1_lcssa = getFirstInst<PHINode>(forCondCleanup63);
  PHINode *acc3lcssa = PHINode::Create(Type::getInt64Ty(F.getContext()), 2,
                                       "acc.3.lcssa", old_acc_1_lcssa);
  acc3lcssa->addIncoming(phiCloneMap[64], forCond398Preheader);
  acc3lcssa->addIncoming(add75_clone, forBody64Clone);

  // 获取第一个PHINode并替换所有使用
  old_acc_1_lcssa->replaceAllUsesWith(acc3lcssa);
  forCond58PreheaderLoopExit->eraseFromParent();

  transformUnrollGetElementPtr(forBody46Merged);
  groupSameInstForFird(forBody46Merged);
  transformUnrollGetElementPtr(forBody64Merged);
  groupSameInstForFird(forBody64Merged);

  runDeadCodeElimination(F);
  runPostPass(F);
}

static void runO3Optimize(Function &F) {
  PassBuilder PB;
  LoopAnalysisManager LAM;
  FunctionAnalysisManager FAM;
  CGSCCAnalysisManager CGAM;
  ModuleAnalysisManager MAM;

  // 注册分析
  PB.registerModuleAnalyses(MAM);
  PB.registerCGSCCAnalyses(CGAM);
  PB.registerFunctionAnalyses(FAM);
  PB.registerLoopAnalyses(LAM);
  PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);

  // 创建O3优化pipeline
  ModulePassManager MPM =
      PB.buildPerModuleDefaultPipeline(OptimizationLevel::O3);

  // 创建一个新的Module来包含当前Function
  Module *M = F.getParent();

  // 运行优化
  MPM.run(*M, MAM);
}

static void postUnrollDspiInt16Dotprod(Function &F, Loop *L, int unroll_count,
                                       LoopInfo &LI) {
  runDeadCodeElimination(F);
  BasicBlock *forCond25Preheader = L->getLoopPredecessor();
  BasicBlock *loopHeader = L->getHeader();

  // 克隆和合并基本块
  BasicBlock *loopHeaderClone =
      cloneBasicBlockWithRelations(loopHeader, ".clone", &F);
  loopHeaderClone->moveAfter(loopHeader);
  loopHeaderClone->getTerminator()->setSuccessor(1, loopHeader);

  std::vector<BasicBlock *> BBsToMerge;
  StringRef forBodyName = loopHeader->getName();
  for (int i = 1; i < unroll_count; ++i) {
    std::string BBName = (forBodyName + "." + std::to_string(i)).str();
    BasicBlock *clonedBB = getBasicBlockByName(F, BBName);
    if (clonedBB) {
      BBsToMerge.push_back(clonedBB);
    } else {
      llvm_unreachable("Basic block not found");
    }
  }

  if (BBsToMerge.size() == static_cast<size_t>(unroll_count - 1)) {
    for (BasicBlock *BB : BBsToMerge) {
      MergeBasicBlockIntoOnlyPred(BB);
    }
  }
  BasicBlock *forBodyMerged = BBsToMerge.back();
  loopHeaderClone->moveAfter(forBodyMerged);

  BasicBlock *forCond25PreheaderLrPh = nullptr;
  for (BasicBlock *pred : predecessors(forCond25Preheader)) {
    if (pred->getSingleSuccessor() == forCond25Preheader) {
      forCond25PreheaderLrPh = pred;
      break;
    }
  }
  // 获取原始的比较指令
  ICmpInst *cmp2673 = getFirstInst<ICmpInst>(forCond25PreheaderLrPh);

  // 获取count_x操作数
  Value *count_x = cmp2673->getOperand(0);
  cmp2673->setOperand(1, ConstantInt::get(count_x->getType(), 7));
  // 创建新指令
  IRBuilder<> Builder(cmp2673);
  Value *sub = Builder.CreateNSWAdd(
      count_x, ConstantInt::get(count_x->getType(), -7), "sub");
  Value *and_val =
      Builder.CreateAnd(count_x, ConstantInt::get(count_x->getType(), -8));

  BasicBlock *forCondCleanup27 = nullptr;
  for (BasicBlock *Succ : successors(forCond25Preheader)) {
    if (Succ != forBodyMerged) {
      forCondCleanup27 = Succ;
      break;
    }
  }
  forCondCleanup27->moveAfter(loopHeaderClone);

  // 创建新的for.cond128.preheader基本块
  BasicBlock *forCond128Preheader = BasicBlock::Create(
      F.getContext(), "for.cond128.preheader", &F, forBodyMerged);
  // 创建x.0.lcssa phi节点
  Builder.SetInsertPoint(forCond128Preheader);
  // 创建PHI节点
  PHINode *x0Lcssa =
      Builder.CreatePHI(Type::getInt32Ty(F.getContext()), 2, "x.0.lcssa");
  x0Lcssa->addIncoming(ConstantInt::get(Type::getInt32Ty(F.getContext()), 0),
                       forCond25Preheader);
  x0Lcssa->addIncoming(and_val, forBodyMerged);

  // 创建比较指令
  Value *cmp129268 = Builder.CreateICmpSLT(x0Lcssa, count_x, "cmp129268");

  // 创建条件分支指令
  Builder.CreateCondBr(cmp129268, loopHeaderClone, forCondCleanup27);

  forCond25Preheader->getTerminator()->setSuccessor(1, forCond128Preheader);

  ICmpInst *cmp26 = getLastInst<ICmpInst>(forBodyMerged);
  cmp26->setPredicate(ICmpInst::ICMP_SLT);
  cmp26->setOperand(1, sub);
  forBodyMerged->getTerminator()->setSuccessor(0, forBodyMerged);
  forBodyMerged->getTerminator()->setSuccessor(1, forCond128Preheader);

  auto *add_clone = getFirstAddInst<int64_t>(loopHeaderClone);
  for (auto &phi : loopHeaderClone->phis()) {
    if (phi.getType()->isIntegerTy(32)) {
      phi.setIncomingValue(1, x0Lcssa);
      phi.setIncomingValue(0, getLastAddInst<int32_t>(loopHeaderClone));
    } else if (phi.getType()->isIntegerTy(64)) {
      // phi.setIncomingValue(1, getLastInst<PHINode>(forCond25Preheader));
      phi.setIncomingValue(0, getFirstAddInst<int64_t>(loopHeaderClone));
    }
    phi.setIncomingBlock(0, loopHeaderClone);
    phi.setIncomingBlock(1, forCond128Preheader);
  }

  loopHeaderClone->getTerminator()->setSuccessor(1, loopHeaderClone);


  PHINode *acc174 = getFirstI64Phi(forBodyMerged);
  PHINode *clonedPhi2 = nullptr;
  if (acc174) {
    clonedPhi2 = cast<PHINode>(acc174->clone());
    clonedPhi2->insertBefore(forCond128Preheader->getFirstNonPHI());
  }

  PHINode *acc_1_lcssa = getFirstI64Phi(forCondCleanup27);
  PHINode *acc174clone = getFirstI64Phi(loopHeaderClone);
  PHINode *clonedPhi = nullptr;
  if (acc174clone) {
    acc174clone->setIncomingValue(1, clonedPhi2);
    clonedPhi = cast<PHINode>(acc174clone->clone());
    clonedPhi->insertBefore(forCondCleanup27->getFirstNonPHI());
  }
  acc_1_lcssa->replaceAllUsesWith(clonedPhi);
  acc_1_lcssa->eraseFromParent();

  runDeadCodeElimination(F);
  runPostPass(F);
}

static void postUnrollDspiF32DotprodVariables(Function &F, Loop *L, int unroll_count,
                                       LoopInfo &LI) {
  runDeadCodeElimination(F);
  BasicBlock *forCond25Preheader = L->getLoopPredecessor();
  BasicBlock *forCondCleanup27 = forCond25Preheader->getTerminator()->getSuccessor(1);
  // BasicBlock *forBody107 = L->getHeader();
  auto [forBody107, forBodyMerged] =
    cloneAndMergeLoop(L, F, unroll_count); 
  forBody107->moveAfter(forBodyMerged);
  forCondCleanup27->moveAfter(forBody107);

  BasicBlock *forCond25PreheaderLrPh = nullptr;
  for (BasicBlock *pred : predecessors(forCond25Preheader)) {
    if (pred->getSingleSuccessor() == forCond25Preheader) {
      forCond25PreheaderLrPh = pred;
      break;
    }
  }

  // 获取原始的比较指令
  ICmpInst *cmp2673 = getFirstInst<ICmpInst>(forCond25PreheaderLrPh);

  // 获取count_x操作数
  Value *count_x = cmp2673->getOperand(0);
  cmp2673->setOperand(1, ConstantInt::get(count_x->getType(), 7));
  // 创建新指令
  IRBuilder<> Builder(cmp2673);
  Value *sub = Builder.CreateNSWAdd(
      count_x, ConstantInt::get(count_x->getType(), -7), "sub");
  Value *and_val =
      Builder.CreateAnd(count_x, ConstantInt::get(count_x->getType(), -8));

  // 创建for.end.loopexit基本块
  BasicBlock *forEndLoopexit = BasicBlock::Create(
      F.getContext(), "for.end.loopexit", &F, forBody107);
  // BranchInst::Create(forEndLoopexit);

  // 创建for.end基本块 
  BasicBlock *forEnd = BasicBlock::Create(
      F.getContext(), "for.end", &F, forBody107);

  // 创建从for.end.loopexit到for.end的无条件跳转
  BranchInst::Create(forEnd, forEndLoopexit);

  // 在for.end中创建PHI节点
  PHINode *x0Lcssa = PHINode::Create(count_x->getType(), 2, "x.0.lcssa", forEnd);
  x0Lcssa->addIncoming(ConstantInt::get(count_x->getType(), 0), forCond25Preheader);
  x0Lcssa->addIncoming(and_val, forEndLoopexit);

  // 创建比较指令
  ICmpInst *cmp106225 = new ICmpInst(*forEnd, ICmpInst::ICMP_SLT, 
      x0Lcssa, count_x, "cmp106225");

  // 创建条件跳转指令
  BranchInst::Create(forBody107, forCondCleanup27, cmp106225, forEnd);

  // 遍历forBodyMerged中的指令,找到fmuladd指令
  SmallVector<Instruction *, 8> fmuladdInsts;
  for (auto &I : *forBodyMerged) {
    if (RecurrenceDescriptor::isFMulAddIntrinsic(&I)) {
      fmuladdInsts.push_back(&I);
    }
  }

  for (Instruction *I : fmuladdInsts) {
      // 创建新的phi float指令
      PHINode *phiFloat = PHINode::Create(Type::getFloatTy(F.getContext()), 2, "", &*forBodyMerged->begin());
      phiFloat->addIncoming(cast<CallInst>(I), forBodyMerged);
      phiFloat->addIncoming(ConstantFP::get(Type::getFloatTy(F.getContext()), 0.0), forCond25Preheader);
      phiFloat->setName("acc");
      // 设置fmuladd指令的最后一个操作数为新的phi指令
      cast<CallInst>(I)->setArgOperand(2, phiFloat);
  }

  Builder.SetInsertPoint(forEndLoopexit->getFirstNonPHI());

  // 两两相加直到只剩一个值
  SmallVector<Value *, 8> currentValues(fmuladdInsts.begin(), fmuladdInsts.end());
  while (currentValues.size() > 1) {
    SmallVector<Value *, 8> nextValues;

    // 两两配对相加
    for (size_t i = 0; i < currentValues.size() - 1; i += 2) {
      Value *sum =
          Builder.CreateFAdd(currentValues[i], currentValues[i + 1],
                            "pairwise.sum");
      nextValues.push_back(sum);
    }

    // 如果有落单的值,直接加入下一轮
    if (currentValues.size() % 2 == 1) {
      nextValues.push_back(currentValues.back());
    }

    currentValues = nextValues;
  }
  
  PHINode *acc_071 = getFirstFloatPhi(forCond25Preheader);
  // 在forEnd中创建phi节点
  PHINode *add103 = PHINode::Create(Type::getFloatTy(F.getContext()), 2, "add103", forEnd->getFirstNonPHI());
  add103->addIncoming(ConstantFP::get(Type::getFloatTy(F.getContext()), 0.0), forCond25Preheader);
  add103->addIncoming(currentValues[0], forEndLoopexit);


  Builder.SetInsertPoint(add103->getNextNode());
  Value *add104 = Builder.CreateFAdd(acc_071, add103, "add104");

  ICmpInst *exitCondNot7 = getLastInst<ICmpInst>(forBodyMerged);
  exitCondNot7->setPredicate(ICmpInst::ICMP_SLT);
  exitCondNot7->setOperand(1, sub);
  forBodyMerged->getTerminator()->setSuccessor(0, forBodyMerged);
  forBodyMerged->getTerminator()->setSuccessor(1, forEndLoopexit);

  for (auto &phi : forBody107->phis()) {
    if (phi.getType()->isIntegerTy(32)) {
      phi.setIncomingValue(1, x0Lcssa);
      phi.setIncomingValue(0, getLastAddInst<int32_t>(forBody107));
    } else if (phi.getType()->isFloatTy()) {
      phi.setIncomingValue(1, add104);
      phi.setIncomingValue(0, getFirstFMulAddInst(forBody107));
    }
    phi.setIncomingBlock(0, forBody107);
    phi.setIncomingBlock(1, forEnd);
  }

  forBody107->getTerminator()->setSuccessor(1, forBody107);

  PHINode *acc_1_lcssa = getFirstFloatPhi(forCondCleanup27);
  PHINode *clonedPhi = PHINode::Create(Type::getFloatTy(F.getContext()), 2, "acc.1.lcssa.clone", forCondCleanup27->getFirstNonPHI());
  clonedPhi->addIncoming(add104, forEnd);
  clonedPhi->addIncoming(getFirstFMulAddInst(forBody107), forBody107);
  acc_1_lcssa->replaceAllUsesWith(clonedPhi);
  acc_1_lcssa->eraseFromParent();


  forCond25Preheader->getTerminator()->setSuccessor(1,forEnd);
}
static void postUnrollDspiF32Dotprod(Function &F, Loop *L, int unroll_count,
                                       LoopInfo &LI) {
  runDeadCodeElimination(F);
  BasicBlock *forCond25Preheader = L->getLoopPredecessor();
  BasicBlock *loopHeader = L->getHeader();

  // 克隆和合并基本块
  BasicBlock *loopHeaderClone =
      cloneBasicBlockWithRelations(loopHeader, ".clone", &F);
  loopHeaderClone->moveAfter(loopHeader);
  loopHeaderClone->getTerminator()->setSuccessor(1, loopHeader);

  std::vector<BasicBlock *> BBsToMerge;
  StringRef forBodyName = loopHeader->getName();
  for (int i = 1; i < unroll_count; ++i) {
    std::string BBName = (forBodyName + "." + std::to_string(i)).str();
    BasicBlock *clonedBB = getBasicBlockByName(F, BBName);
    if (clonedBB) {
      BBsToMerge.push_back(clonedBB);
    } else {
      llvm_unreachable("Basic block not found");
    }
  }

  if (BBsToMerge.size() == static_cast<size_t>(unroll_count - 1)) {
    for (BasicBlock *BB : BBsToMerge) {
      MergeBasicBlockIntoOnlyPred(BB);
    }
  }
  BasicBlock *forBodyMerged = BBsToMerge.back();
  loopHeaderClone->moveAfter(forBodyMerged);

  BasicBlock *forCond25PreheaderLrPh = nullptr;
  for (BasicBlock *pred : predecessors(forCond25Preheader)) {
    if (pred->getSingleSuccessor() == forCond25Preheader) {
      forCond25PreheaderLrPh = pred;
      break;
    }
  }
  // 获取原始的比较指令
  ICmpInst *cmp2673 = getFirstInst<ICmpInst>(forCond25PreheaderLrPh);

  // 获取count_x操作数
  Value *count_x = cmp2673->getOperand(0);
  cmp2673->setOperand(1, ConstantInt::get(count_x->getType(), 7));
  // 创建新指令
  IRBuilder<> Builder(cmp2673);
  Value *sub = Builder.CreateNSWAdd(
      count_x, ConstantInt::get(count_x->getType(), -7), "sub");
  Value *and_val =
      Builder.CreateAnd(count_x, ConstantInt::get(count_x->getType(), -8));

  BasicBlock *forCondCleanup27 = nullptr;
  for (BasicBlock *Succ : successors(forCond25Preheader)) {
    if (Succ != forBodyMerged) {
      forCondCleanup27 = Succ;
      break;
    }
  }
  forCondCleanup27->moveAfter(loopHeaderClone);

  // 创建新的for.cond128.preheader基本块
  BasicBlock *forCond128Preheader = BasicBlock::Create(
      F.getContext(), "for.cond128.preheader", &F, forBodyMerged);
  // 创建x.0.lcssa phi节点
  Builder.SetInsertPoint(forCond128Preheader);
  // 创建PHI节点
  PHINode *x0Lcssa =
      Builder.CreatePHI(Type::getInt32Ty(F.getContext()), 2, "x.0.lcssa");
  x0Lcssa->addIncoming(ConstantInt::get(Type::getInt32Ty(F.getContext()), 0),
                       forCond25Preheader);
  x0Lcssa->addIncoming(and_val, forBodyMerged);

  // 创建比较指令
  Value *cmp129268 = Builder.CreateICmpSLT(x0Lcssa, count_x, "cmp129268");

  // 创建条件分支指令
  Builder.CreateCondBr(cmp129268, loopHeaderClone, forCondCleanup27);

  forCond25Preheader->getTerminator()->setSuccessor(1, forCond128Preheader);

  ICmpInst *cmp26 = getLastInst<ICmpInst>(forBodyMerged);
  cmp26->setPredicate(ICmpInst::ICMP_SLT);
  cmp26->setOperand(1, sub);
  forBodyMerged->getTerminator()->setSuccessor(0, forBodyMerged);
  forBodyMerged->getTerminator()->setSuccessor(1, forCond128Preheader);

  for (auto &phi : loopHeaderClone->phis()) {
    if (phi.getType()->isIntegerTy(32)) {
      phi.setIncomingValue(1, x0Lcssa);
      phi.setIncomingValue(0, getLastAddInst<int32_t>(loopHeaderClone));
    } else if (phi.getType()->isFloatTy()) {
      // phi.setIncomingValue(1, getLastInst<PHINode>(forCond25Preheader));
      phi.setIncomingValue(0, getFirstFMulAddInst(loopHeaderClone));
    }
    phi.setIncomingBlock(0, loopHeaderClone);
    phi.setIncomingBlock(1, forCond128Preheader);
  }

  loopHeaderClone->getTerminator()->setSuccessor(1, loopHeaderClone);


  PHINode *acc174 = getFirstFloatPhi(forBodyMerged);
  PHINode *clonedPhi2 = nullptr;
  if (acc174) {
    clonedPhi2 = cast<PHINode>(acc174->clone());
    clonedPhi2->insertBefore(forCond128Preheader->getFirstNonPHI());
  }

  PHINode *acc_1_lcssa = getFirstFloatPhi(forCondCleanup27);
  PHINode *acc174clone = getFirstFloatPhi(loopHeaderClone);
  PHINode *clonedPhi = nullptr;
  if (acc174clone) {
    acc174clone->setIncomingValue(1, clonedPhi2);
    clonedPhi = cast<PHINode>(acc174clone->clone());
    clonedPhi->insertBefore(forCondCleanup27->getFirstNonPHI());
  }
  acc_1_lcssa->replaceAllUsesWith(clonedPhi);
  acc_1_lcssa->eraseFromParent();

  runDeadCodeElimination(F);
  runPostPass(F);                                        
}

static void postUnrollDspiInt8Dotprod(Function &F, Loop *L, int unroll_count,
                                       LoopInfo &LI) {
  runDeadCodeElimination(F);
  BasicBlock *forCond25Preheader = L->getLoopPredecessor();
  BasicBlock *loopHeader = L->getHeader();

  // 克隆和合并基本块
  BasicBlock *loopHeaderClone =
      cloneBasicBlockWithRelations(loopHeader, ".clone", &F);
  loopHeaderClone->moveAfter(loopHeader);
  loopHeaderClone->getTerminator()->setSuccessor(1, loopHeader);

  std::vector<BasicBlock *> BBsToMerge;
  StringRef forBodyName = loopHeader->getName();
  for (int i = 1; i < unroll_count; ++i) {
    std::string BBName = (forBodyName + "." + std::to_string(i)).str();
    BasicBlock *clonedBB = getBasicBlockByName(F, BBName);
    if (clonedBB) {
      BBsToMerge.push_back(clonedBB);
    } else {
      llvm_unreachable("Basic block not found");
    }
  }

  if (BBsToMerge.size() == static_cast<size_t>(unroll_count - 1)) {
    for (BasicBlock *BB : BBsToMerge) {
      MergeBasicBlockIntoOnlyPred(BB);
    }
  }
  BasicBlock *forBodyMerged = BBsToMerge.back();
  loopHeaderClone->moveAfter(forBodyMerged);

  BasicBlock *forCond25PreheaderLrPh = nullptr;
  for (BasicBlock *pred : predecessors(forCond25Preheader)) {
    if (pred->getSingleSuccessor() == forCond25Preheader) {
      forCond25PreheaderLrPh = pred;
      break;
    }
  }
  // 获取原始的比较指令
  ICmpInst *cmp2673 = getFirstInst<ICmpInst>(forCond25PreheaderLrPh);

  // 获取count_x操作数
  Value *count_x = cmp2673->getOperand(0);
  cmp2673->setOperand(1, ConstantInt::get(count_x->getType(), 7));
  // 创建新指令
  IRBuilder<> Builder(cmp2673);
  Value *sub = Builder.CreateNSWAdd(
      count_x, ConstantInt::get(count_x->getType(), -7), "sub");
  Value *and_val =
      Builder.CreateAnd(count_x, ConstantInt::get(count_x->getType(), -8));

  BasicBlock *forCondCleanup27 = nullptr;
  for (BasicBlock *Succ : successors(forCond25Preheader)) {
    if (Succ != forBodyMerged) {
      forCondCleanup27 = Succ;
      break;
    }
  }
  forCondCleanup27->moveAfter(loopHeaderClone);

  // 创建新的for.cond128.preheader基本块
  BasicBlock *forCond128Preheader = BasicBlock::Create(
      F.getContext(), "for.cond128.preheader", &F, forBodyMerged);
  // 创建x.0.lcssa phi节点
  Builder.SetInsertPoint(forCond128Preheader);
  // 创建PHI节点
  PHINode *x0Lcssa =
      Builder.CreatePHI(Type::getInt32Ty(F.getContext()), 2, "x.0.lcssa");
  x0Lcssa->addIncoming(ConstantInt::get(Type::getInt32Ty(F.getContext()), 0),
                       forCond25Preheader);
  x0Lcssa->addIncoming(and_val, forBodyMerged);

  // 创建比较指令
  Value *cmp129268 = Builder.CreateICmpSLT(x0Lcssa, count_x, "cmp129268");

  // 创建条件分支指令
  Builder.CreateCondBr(cmp129268, loopHeaderClone, forCondCleanup27);

  forCond25Preheader->getTerminator()->setSuccessor(1, forCond128Preheader);

  ICmpInst *cmp26 = getLastInst<ICmpInst>(forBodyMerged);
  cmp26->setPredicate(ICmpInst::ICMP_SLT);
  cmp26->setOperand(1, sub);
  forBodyMerged->getTerminator()->setSuccessor(0, forBodyMerged);
  forBodyMerged->getTerminator()->setSuccessor(1, forCond128Preheader);

  // auto *add_clone = getLastAddInst<int32_t>(loopHeaderClone);
  PHINode *x_075_clone = getFirstI32Phi(loopHeaderClone);
  Value *inc_clone = nullptr;
  for (User *U : x_075_clone->users()) {
    if (auto *Add = dyn_cast<BinaryOperator>(U)) {
      if (Add->getOpcode() == Instruction::Add) {
        inc_clone = Add;
        break;
      }
    }
  }

  PHINode *acc_174_clone = getLastI32Phi(loopHeaderClone);
  Value *add_clone = nullptr;
  for (User *U : acc_174_clone->users()) {
    if (auto *Add = dyn_cast<BinaryOperator>(U)) {
      if (Add->getOpcode() == Instruction::Add) {
        add_clone = Add;
        break;
      }
    }
  }
  x_075_clone->setIncomingValue(0, inc_clone);
  x_075_clone->setIncomingValue(1, x0Lcssa);


  acc_174_clone->setIncomingValue(0, add_clone);
  // acc_174_clone->setIncomingValue(1, acc_1_lcssa);

  for (auto &phi : loopHeaderClone->phis()) {
    // if (phi.getType()->isIntegerTy(32)) {
    //   phi.setIncomingValue(1, x0Lcssa);
    //   phi.setIncomingValue(0, getLastAddInst<int32_t>(loopHeaderClone));
    // } else if (phi.getType()->isIntegerTy(64)) {
    //   // phi.setIncomingValue(1, getLastInst<PHINode>(forCond25Preheader));
    //   phi.setIncomingValue(0, getFirstAddInst<int64_t>(loopHeaderClone));
    // }
    phi.setIncomingBlock(0, loopHeaderClone);
    phi.setIncomingBlock(1, forCond128Preheader);
  }

  loopHeaderClone->getTerminator()->setSuccessor(1, loopHeaderClone);


  PHINode *acc174 = getLastI32Phi(forBodyMerged);
  PHINode *clonedPhi2 = nullptr;
  if (acc174) {
    clonedPhi2 = cast<PHINode>(acc174->clone());
    clonedPhi2->insertBefore(forCond128Preheader->getFirstNonPHI());
  }

  PHINode *acc_1_lcssa = getFirstI32Phi(forCondCleanup27);
  PHINode *acc174clone = getLastI32Phi(loopHeaderClone);
  PHINode *clonedPhi = nullptr;
  if (acc174clone) {
    acc174clone->setIncomingValue(1, clonedPhi2);
    clonedPhi = cast<PHINode>(acc174clone->clone());
    clonedPhi->insertBefore(forCondCleanup27->getFirstNonPHI());
  }
  acc_1_lcssa->replaceAllUsesWith(clonedPhi);
  acc_1_lcssa->eraseFromParent();

  runDeadCodeElimination(F);
  runPostPass(F);
}

static void postUnrollDspmInt16Mult(Function &F, Loop *L, int unroll_count,ScalarEvolution &SE) {
  runDeadCodeElimination(F);
  BasicBlock *forBody4 = L->getLoopPredecessor();
  BasicBlock *forCondCleanup8 = forBody4->getTerminator()->getSuccessor(1);
  auto [forBody113, forBodyMerged] =
      cloneAndMergeLoop(L, F, unroll_count);
  forBody113->moveAfter(forBodyMerged);
  forCondCleanup8->moveAfter(forBody113);

  ICmpInst *exitcond_not_7 = getLastInst<ICmpInst>(forBodyMerged);
  Value *n = exitcond_not_7->getOperand(1);

  BasicBlock *forCond1PreheaderLrPh = F.getEntryBlock().getTerminator()->getSuccessor(0);
  // 获取forCond1PreheaderLrPh中的icmp指令
  ICmpInst *cmp658 = nullptr;
  for (auto &I : *forCond1PreheaderLrPh) {
    if (auto *icmp = dyn_cast<ICmpInst>(&I)) {
      if (icmp->getPredicate() == ICmpInst::ICMP_SGT && 
          icmp->getOperand(0) == n) {
        cmp658 = icmp;
        break;
      }
    }
  }
  assert(cmp658 && "cmp658 not found");
  cmp658->setOperand(1, ConstantInt::get(n->getType(), 7));

  IRBuilder<> Builder(cmp658);
  Value *sub6 = Builder.CreateNSWAdd(
      n, ConstantInt::get(n->getType(), -7), "sub6");  
  Value *and_val =
      Builder.CreateAnd(n, ConstantInt::get(n->getType(), -8));
  
  // 创建新的for.cond110.preheader基本块
  BasicBlock *forCond110Preheader = BasicBlock::Create(
      F.getContext(), "for.cond110.preheader", &F, forBodyMerged);

  // 克隆forBodyMerged中的PHI节点到for.cond110.preheader
  Builder.SetInsertPoint(forCond110Preheader);
  
  PHINode *s_0_lcssa = nullptr;
  PHINode *acc_0_lcssa = nullptr;
  // 遍历forBodyMerged中的PHI节点并克隆
  for (auto &Phi : forBodyMerged->phis()) {
    PHINode *NewPhi = cast<PHINode>(Phi.clone());
    NewPhi->insertInto(forCond110Preheader,forCond110Preheader->begin());
    if (Phi.getType()->isIntegerTy(32)) {
      NewPhi->setName("s.0.lcssa");
      NewPhi->setIncomingValue(0, and_val);
      s_0_lcssa = NewPhi;
      // 创建比较指令
      Value *cmp111262 = Builder.CreateICmpSLT(NewPhi, n, "cmp111262");
      // 创建条件分支指令
      Builder.CreateCondBr(cmp111262, forBody113, forCondCleanup8);
    }
    else if (Phi.getType()->isIntegerTy(64)) {
      NewPhi->setName("acc.0.lcssa");
      acc_0_lcssa = NewPhi;
    }
    else {
      llvm_unreachable("Unsupported type");
    }
  }

  // 更新前驱基本块的终结器
  forBody4->getTerminator()->setSuccessor(1, forCond110Preheader);
  forBodyMerged->getTerminator()->setSuccessor(0, forCond110Preheader);

  exitcond_not_7->setOperand(1, sub6);
  exitcond_not_7->setPredicate(ICmpInst::ICMP_SLT);
  swapTerminatorSuccessors(forBodyMerged);

  PHINode *acc_059_clone = nullptr;
  for(auto &phi : forBody113->phis()) {
    phi.setIncomingBlock(0, forBody113);
    phi.setIncomingBlock(1, forCond110Preheader);
    if(phi.getType()->isIntegerTy(32)) {
      phi.setIncomingValue(0, phi.user_back());
      phi.setIncomingValue(1, s_0_lcssa);
    }
    else if(phi.getType()->isIntegerTy(64)) {
      phi.setIncomingValue(0, phi.user_back());
      phi.setIncomingValue(1, acc_0_lcssa);
      acc_059_clone = cast<PHINode>(phi.clone());
      // 
      for (auto &phi : forCondCleanup8->phis()) {
        if (phi.getType()->isIntegerTy(64)) {
          phi.replaceAllUsesWith(acc_059_clone);
          phi.eraseFromParent();
          break;
        }
      }
      acc_059_clone->insertInto(forCondCleanup8, forCondCleanup8->begin());
      acc_059_clone->setName("acc.1.lcssa");
    }
    else {
      llvm_unreachable("Unsupported type");
    }
  }
  forBody113->getTerminator()->setSuccessor(1, forBody113);
}

static void postUnrollDspmF32Mult(Function &F, Loop *L, int unroll_count) {
  runDeadCodeElimination(F);
  BasicBlock *forBody4 = L->getLoopPredecessor();
  BasicBlock *forCondCleanup8 = forBody4->getTerminator()->getSuccessor(1);
  
  
  auto [forBody113, forBodyMerged] =
      cloneAndMergeLoop(L, F, unroll_count);
  forBody113->moveAfter(forBodyMerged);
  forCondCleanup8->moveAfter(forBody113);

  ICmpInst *exitcond_not_7 = getLastInst<ICmpInst>(forBodyMerged);
  Value *n = exitcond_not_7->getOperand(1);

  BasicBlock *forCond1PreheaderLrPh = F.getEntryBlock().getTerminator()->getSuccessor(0);
  // 获取forCond1PreheaderLrPh中的icmp指令
  ICmpInst *cmp658 = nullptr;
  for (auto &I : *forCond1PreheaderLrPh) {
    if (auto *icmp = dyn_cast<ICmpInst>(&I)) {
      if (icmp->getPredicate() == ICmpInst::ICMP_SGT && 
          icmp->getOperand(0) == n) {
        cmp658 = icmp;
        break;
      }
    }
  }
  assert(cmp658 && "cmp658 not found");
  cmp658->setOperand(1, ConstantInt::get(n->getType(), 8));

  IRBuilder<> Builder(cmp658);
  Value *sub6 = Builder.CreateNSWAdd(
      n, ConstantInt::get(n->getType(), -7), "sub6");  
  // Value *and_val =
  //     Builder.CreateAnd(n, ConstantInt::get(n->getType(), -8));
  
  // 创建新的for.cond110.preheader基本块
  BasicBlock *forCond110Preheader = BasicBlock::Create(
      F.getContext(), "for.cond110.preheader", &F, forBodyMerged);

  // 克隆forBodyMerged中的PHI节点到for.cond110.preheader
  Builder.SetInsertPoint(forCond110Preheader);
  
  PHINode *s_0_lcssa = nullptr;
  PHINode *acc_0_lcssa = nullptr;
  // 遍历forBodyMerged中的PHI节点并克隆
  for (auto &Phi : forBodyMerged->phis()) {
    PHINode *NewPhi = cast<PHINode>(Phi.clone());
    NewPhi->insertInto(forCond110Preheader,forCond110Preheader->begin());
    if (Phi.getType()->isIntegerTy(32)) {
      NewPhi->setName("s.0.lcssa");
      // NewPhi->setIncomingValue(0, and_val);
      s_0_lcssa = NewPhi;
      // 创建比较指令
      Value *cmp111262 = Builder.CreateICmpSLT(NewPhi, n, "cmp111262");
      // 创建条件分支指令
      Builder.CreateCondBr(cmp111262, forBody113, forCondCleanup8);
    }
    else if (Phi.getType()->isFloatTy()) {
      NewPhi->setName("acc.0.lcssa");
      acc_0_lcssa = NewPhi;
    }
    else {
      llvm_unreachable("Unsupported type");
    }
  }

  // 更新前驱基本块的终结器
  forBody4->getTerminator()->setSuccessor(1, forCond110Preheader);
  forBodyMerged->getTerminator()->setSuccessor(0, forCond110Preheader);

  exitcond_not_7->setOperand(1, sub6);
  exitcond_not_7->setPredicate(ICmpInst::ICMP_SLT);
  swapTerminatorSuccessors(forBodyMerged);

  PHINode *acc_059_clone = nullptr;
  for(auto &phi : forBody113->phis()) {
    phi.setIncomingBlock(0, forBody113);
    phi.setIncomingBlock(1, forCond110Preheader);
    if(phi.getType()->isIntegerTy(32)) {
      phi.setIncomingValue(0, phi.user_back());
      phi.setIncomingValue(1, s_0_lcssa);
    }
    else if(phi.getType()->isFloatTy()) {
      phi.setIncomingValue(0, phi.user_back());
      phi.setIncomingValue(1, acc_0_lcssa);
    }
    else {
      llvm_unreachable("Unsupported type");
    }
  }
  forBody113->getTerminator()->setSuccessor(1, forBody113);

  runDeadCodeElimination(F);
  runPostPass(F);
}

static void postUnrollDspmF32MultEx(Function &F, Loop *L, int unroll_count) {
  runDeadCodeElimination(F);
  BasicBlock *forBody4 = L->getLoopPredecessor();
  BasicBlock *forCondCleanup8 = forBody4->getTerminator()->getSuccessor(1);
  
  
  auto [forBody113, forBodyMerged] =
      cloneAndMergeLoop(L, F, unroll_count);
  forBody113->moveAfter(forBodyMerged);
  forCondCleanup8->moveAfter(forBody113);

  ICmpInst *exitcond_not_7 = getLastInst<ICmpInst>(forBodyMerged);
  Value *n = exitcond_not_7->getOperand(1);

  BasicBlock *forCond1PreheaderLrPh = F.getEntryBlock().getTerminator()->getSuccessor(1);
  // 获取forCond1PreheaderLrPh中的icmp指令
  ICmpInst *cmp658 = nullptr;
  for (auto &I : *forCond1PreheaderLrPh) {
    if (auto *icmp = dyn_cast<ICmpInst>(&I)) {
      if (icmp->getPredicate() == ICmpInst::ICMP_UGT) {
        cmp658 = icmp;
        break;
      }
    }
  }
  assert(cmp658 && "cmp658 not found");
  cmp658->setOperand(1, ConstantInt::get(n->getType(), 8));

  IRBuilder<> Builder(cmp658);
  Value *sub6 = Builder.CreateNSWAdd(
      n, ConstantInt::get(n->getType(), -7), "sub6");  
  // Value *and_val =
  //     Builder.CreateAnd(n, ConstantInt::get(n->getType(), -8));
  
  // 创建新的for.cond110.preheader基本块
  BasicBlock *forCond110Preheader = BasicBlock::Create(
      F.getContext(), "for.cond110.preheader", &F, forBodyMerged);

  // 克隆forBodyMerged中的PHI节点到for.cond110.preheader
  Builder.SetInsertPoint(forCond110Preheader);
  
  PHINode *s_0_lcssa = nullptr;
  PHINode *acc_0_lcssa = nullptr;
  // 遍历forBodyMerged中的PHI节点并克隆
  for (auto &Phi : forBodyMerged->phis()) {
    PHINode *NewPhi = cast<PHINode>(Phi.clone());
    NewPhi->insertInto(forCond110Preheader,forCond110Preheader->begin());
    if (Phi.getType()->isIntegerTy(32)) {
      NewPhi->setName("s.0.lcssa");
      // NewPhi->setIncomingValue(0, and_val);
      s_0_lcssa = NewPhi;
      // 创建比较指令
      Value *cmp111262 = Builder.CreateICmpSLT(NewPhi, n, "cmp111262");
      // 创建条件分支指令
      Builder.CreateCondBr(cmp111262, forBody113, forCondCleanup8);
    }
    else if (Phi.getType()->isFloatTy()) {
      NewPhi->setName("acc.0.lcssa");
      acc_0_lcssa = NewPhi;
    }
    else {
      llvm_unreachable("Unsupported type");
    }
  }

  // 更新前驱基本块的终结器
  forBody4->getTerminator()->setSuccessor(1, forCond110Preheader);
  forBodyMerged->getTerminator()->setSuccessor(0, forCond110Preheader);

  exitcond_not_7->setOperand(1, sub6);
  exitcond_not_7->setPredicate(ICmpInst::ICMP_SLT);
  swapTerminatorSuccessors(forBodyMerged);

  PHINode *acc_059_clone = nullptr;
  for(auto &phi : forBody113->phis()) {
    phi.setIncomingBlock(0, forBody113);
    phi.setIncomingBlock(1, forCond110Preheader);
    if(phi.getType()->isIntegerTy(32)) {
      phi.setIncomingValue(0, phi.user_back());
      phi.setIncomingValue(1, s_0_lcssa);
    }
    else if(phi.getType()->isFloatTy()) {
      phi.setIncomingValue(0, phi.user_back());
      phi.setIncomingValue(1, acc_0_lcssa);
    }
    else {
      llvm_unreachable("Unsupported type");
    }
  }
  forBody113->getTerminator()->setSuccessor(1, forBody113);

  runDeadCodeElimination(F);
  runPostPass(F);
}

static void postUnrollDspmF32Add(Function &F, Loop *L, int unroll_count, LoopInfo &LI){
  runDeadCodeElimination(F);
  BasicBlock *forCond34Preheader = L->getLoopPreheader();
  auto [forBodyCloned, forBodyMerged] =
      cloneAndMergeLoop(L, F, unroll_count);
  forBodyCloned->moveAfter(forBodyMerged);
  BasicBlock *forCondCleanup36 = forBodyMerged->getTerminator()->getSuccessor(0);
  forCondCleanup36->moveAfter(forBodyCloned);

  BasicBlock *forCond34PreheaderLrPh = F.getEntryBlock().getTerminator()->getSuccessor(1);

  ICmpInst *exitCond_Not_7 = getLastInst<ICmpInst>(forBodyMerged);
  Value *cols = exitCond_Not_7->getOperand(1);
  exitCond_Not_7->setPredicate(ICmpInst::ICMP_SLT);

  IRBuilder<> Builder(forCond34PreheaderLrPh->getTerminator());
  Value *sub = Builder.CreateAdd(cols, ConstantInt::get(cols->getType(), -7), "sub", true);
  Value *cmp35236 = Builder.CreateICmp(ICmpInst::ICMP_UGT, cols, ConstantInt::get(cols->getType(), 7), "cmp35236");
  exitCond_Not_7->setOperand(1, sub);
  
  BasicBlock *forCond113Preheader = BasicBlock::Create(F.getContext(), "forCond113Preheader", &F, forBodyMerged);
  PHINode *col_0_lcssa = cast<PHINode>(forBodyMerged->begin()->clone());
  col_0_lcssa->setName("col.0.lcssa");
  col_0_lcssa->insertInto(forCond113Preheader, forCond113Preheader->begin());

  Builder.SetInsertPoint(forCond113Preheader);
  Value *cmp114238 = Builder.CreateICmp(ICmpInst::ICMP_SLT, col_0_lcssa, cols, "cmp114238");
  Builder.CreateCondBr(cmp114238, forBodyCloned, forCondCleanup36);

  // 修改forCond34Preheader的跳转目标为forCond113Preheader
  forCond34Preheader->getTerminator()->eraseFromParent();
  BranchInst::Create(forBodyMerged, forCond113Preheader, cmp35236, forCond34Preheader);

  PHINode *acc_080_clone = getFirstI32Phi(forBodyCloned);
  acc_080_clone->setIncomingValue(0, getLastAddInst<int32_t>(forBodyCloned));
  acc_080_clone->setIncomingBlock(0, forBodyCloned);
  acc_080_clone->setIncomingValue(1, col_0_lcssa);
  acc_080_clone->setIncomingBlock(1, forCond113Preheader);

  forBodyCloned->getTerminator()->setSuccessor(1, forBodyCloned);
  forBodyMerged->getTerminator()->setSuccessor(0, forCond113Preheader);
  swapTerminatorSuccessors(forBodyMerged);
  
  runDeadCodeElimination(F);
  runPostPass(F);
  groupSameInstForAdd(forBodyMerged);
}

static void postUnrollDspsWindBlackmanF32(Function &F, Loop *L, int unroll_count) {
  
  BasicBlock *forBodyLrPh = L->getLoopPreheader();
  runDeadCodeElimination(F);
  
  auto [forBodyclone, forBodyMerged] =
      cloneAndMergeLoop(L, F, unroll_count);
  forBodyclone->moveAfter(forBodyMerged);

  BasicBlock *forCondCleanup = forBodyMerged->getTerminator()->getSuccessor(0);
  ICmpInst *exitcond_not_7 = getLastInst<ICmpInst>(forBodyMerged);
  Value *len = exitcond_not_7->getOperand(1);

  IRBuilder<> Builder(forBodyLrPh->getTerminator());
  Value *sub4 = Builder.CreateNSWAdd(
      len, ConstantInt::get(len->getType(), -7), "sub4");
  BasicBlock *forCond97Preheader = BasicBlock::Create(
      F.getContext(), "for.cond97.preheader", &F, forBodyMerged);

  // BasicBlock *forBodyLrPh = L->getLoopPreheader();
  Value *cmp169 = Builder.CreateICmpSGT(len, ConstantInt::get(len->getType(), 7), "cmp169");
  
  // 修改原先的跳转
  forBodyLrPh->getTerminator()->eraseFromParent();
  BranchInst::Create(forBodyMerged, forCond97Preheader, cmp169, forBodyLrPh);
  exitcond_not_7->setOperand(1, sub4);
  exitcond_not_7->setPredicate(ICmpInst::ICMP_SLT);

  // 克隆forBodyMerged中的PHI节点到forCond97Preheader
  Builder.SetInsertPoint(forCond97Preheader);
  
  PHINode *i_0_lcssa = nullptr;
  // 遍历forBodyMerged中的PHI节点并克隆
  for (auto &Phi : forBodyMerged->phis()) {
    if (Phi.getType()->isIntegerTy(32)) {
      PHINode *NewPhi = cast<PHINode>(Phi.clone());
      NewPhi->insertInto(forCond97Preheader, forCond97Preheader->begin());
      NewPhi->setName("i.0.lcssa");
      i_0_lcssa = NewPhi;
      // 创建比较指令
      Value *cmp98171 = Builder.CreateICmpSLT(NewPhi, len, "cmp98171");
      // 创建条件分支指令
      Builder.CreateCondBr(cmp98171, forBodyclone, forCondCleanup);
    }
    else {
      llvm_unreachable("Unsupported type");
    }
  }

  forBodyMerged->getTerminator()->setSuccessor(0, forCond97Preheader);
  swapTerminatorSuccessors(forBodyMerged);

  forBodyclone->getTerminator()->setSuccessor(1, forBodyclone);
  
  for(auto &phi : forBodyclone->phis()) {
    phi.setIncomingBlock(0, forBodyclone);
    phi.setIncomingBlock(1, forCond97Preheader);
    if(phi.getType()->isIntegerTy(32)) {
      phi.setIncomingValue(0, phi.user_back());
      phi.setIncomingValue(1, i_0_lcssa);
    }
    else {
      llvm_unreachable("Unsupported type");
    }
  }
  runDeadCodeElimination(F);
  runPostPass(F);
}

static void preprocessUnrolledBBs(BasicBlock *BB) {
  // 获取BB的最后两条指令
  Instruction *br = BB->getTerminator();
  ICmpInst *cmp = getLastInst<ICmpInst>(BB);
  BasicBlock *nextBB = nullptr;
  BasicBlock *forCondCleanup26Loopexit = nullptr;
  // 根据比较指令的类型设置后继基本块
  if (cmp->getPredicate() == ICmpInst::ICMP_EQ) {
    // 如果是eq，交换后继基本块顺序
    nextBB = br->getSuccessor(1);
    forCondCleanup26Loopexit = br->getSuccessor(0);
  } else if (cmp->getPredicate() == ICmpInst::ICMP_SLT) {
    // 如果是slt，保持原有顺序
    nextBB = br->getSuccessor(0);
    forCondCleanup26Loopexit = br->getSuccessor(1);
  } else {
    llvm_unreachable("Unsupported comparison predicate");
  }

  // 删除原有的条件分支和比较指令
  br->eraseFromParent();
  cmp->eraseFromParent();

  // 创建无条件跳转指令从BB到nextBB
  BranchInst::Create(nextBB, BB);

  // 删除phi节点中对应的incoming value和block
  if (forCondCleanup26Loopexit) {
    for (PHINode &phi : forCondCleanup26Loopexit->phis()) {
      int idx = phi.getBasicBlockIndex(BB);
      if (idx != -1) {
        phi.removeIncomingValue(idx);
      }
    }
  }

}

static bool hasOnlyThreeICmpInsts(BasicBlock *BB) {
  int icmpCount = 0;
  int otherCount = 0;
  
  // 遍历基本块中的所有指令
  for (Instruction &I : *BB) {
    if (isa<ICmpInst>(&I)) {
      icmpCount++;
    } else if (!isa<BranchInst>(&I)) {
      // 如果不是icmp也不是branch指令,则计数加1
      otherCount++;
    }
  }
  
  // 检查是否恰好有3条icmp指令且没有其他类型指令(除了branch)
  return icmpCount == 3 && otherCount == 0;
}

static void hoistIndexIntoEntryBlock4(BasicBlock *forBodyMerged,Function &F){
  BasicBlock *entryBlock = &F.getEntryBlock();
  Instruction *entryBlockTerminator = entryBlock->getTerminator();
  PHINode *n_0894 = getFirstI32Phi(forBodyMerged);
  static Value *mul28 = nullptr;
  static Value *mul29 = nullptr;

  static Value *mul34 = nullptr;
  static Value *mul35 = nullptr;

  // 获取n_0894的所有引用指令
  SmallVector<Instruction *, 2> mulUsers;
  SmallVector<Instruction *, 2> addUsers;
  for(User *U : n_0894->users()){
    if(Instruction *I = dyn_cast<Instruction>(U)){
      if(I->getOpcode() == Instruction::Mul){
        mulUsers.push_back(I);
      }
      else if(I->getOpcode() == Instruction::Add){
        addUsers.push_back(I);
      }
    }
  }
  Value *filter_step_x = nullptr;
  Value *mul30_ = nullptr;
  Value *in_image_step_x = nullptr;
  Value *mul28_ = nullptr;
  for(Instruction *I : reverse(mulUsers)){
    if(GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(I->user_back())){
      // 检查GEP是否有inbounds属性
      if (GEP->isInBounds()) {
        filter_step_x = I->getOperand(0);
        mul30_ = I;
      } else {
        in_image_step_x = I->getOperand(0);
        mul28_ = I;
      }
    }
  }
  assert(mul30_ && "mul30_ is nullptr");
  assert(filter_step_x && "filter_step_x is nullptr");
  for(Instruction *I : reverse(addUsers)){
    if(I->getOpcode() == Instruction::Add){
      if (auto *constOp = dyn_cast<ConstantInt>(I->getOperand(1))) {
        int64_t constVal = constOp->getSExtValue();
        if(constVal != 4)
           I->setOperand(0, mul30_);
        switch (constVal) {
              case 1:
                I->setOperand(1, filter_step_x);
                break;
              case 2:
                if(mul28 == nullptr){
                  mul28 = BinaryOperator::CreateNSWShl(filter_step_x, ConstantInt::get(filter_step_x->getType(), 1), "mul28", entryBlockTerminator);
                }
                I->setOperand(1, mul28);
                break;
              case 3:
                if(mul29 == nullptr){
                  mul29 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 3), "mul29", entryBlockTerminator);
                }
                I->setOperand(1, mul29);
                break;
              case 4:
                break;
              default:
          llvm_unreachable("Unsupported const value");
        }
        Instruction *inst = I->user_back();
        if(inst->getOpcode() == Instruction::Mul){
          inst->replaceAllUsesWith(I);
          inst->eraseFromParent();
        }
    }
  }
  }

  Instruction *arrayidx = dyn_cast<Instruction>(mul28_->user_back());
  Value *arrayidx_0_op = arrayidx->getOperand(0);
  
  SmallVector<Instruction *, 4> get_element_ptr_users;
  for (User *U : arrayidx_0_op->users()) {
    if (Instruction *I = dyn_cast<Instruction>(U)) {
      get_element_ptr_users.push_back(I);
    }
  }
  int idx = 1;
  for(Instruction *I : reverse(get_element_ptr_users)){
    if(I != arrayidx){
      I->setOperand(0,arrayidx);
      switch (idx) {
        case 1:
          I->setOperand(1, in_image_step_x);
          break;
        case 2:
          if(mul34 == nullptr){
            mul34 = BinaryOperator::CreateNSWShl(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 1), "mul34", entryBlockTerminator);
          }
          I->setOperand(1, mul34);
          break;
        case 3:
          if(mul35 == nullptr){
            mul35 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 3), "mul35", entryBlockTerminator);
          }
          I->setOperand(1, mul35);
          break;
        case 4:
          break;
        default:
          llvm_unreachable("Unsupported const value");
      }
    idx++;
    }
    
  }
}

static void hoistIndexIntoEntryBlock8(BasicBlock *forBodyMerged,Function &F){
  BasicBlock *entryBlock = &F.getEntryBlock();
  Instruction *entryBlockTerminator = entryBlock->getTerminator();
  PHINode *n_0894 = getFirstI32Phi(forBodyMerged);
  static Value *mul28 = nullptr;
  static Value *mul29 = nullptr;
  static Value *mul30 = nullptr;
  static Value *mul31 = nullptr;
  static Value *mul32 = nullptr;
  static Value *mul33 = nullptr;

  static Value *mul34 = nullptr;
  static Value *mul35 = nullptr;
  static Value *mul36 = nullptr;
  static Value *mul37 = nullptr;
  static Value *mul38 = nullptr;
  static Value *mul39 = nullptr;

  // 获取n_0894的所有引用指令
  SmallVector<Instruction *, 2> mulUsers;
  SmallVector<Instruction *, 2> addUsers;
  for(User *U : n_0894->users()){
    if(Instruction *I = dyn_cast<Instruction>(U)){
      if(I->getOpcode() == Instruction::Mul){
        mulUsers.push_back(I);
      }
      else if(I->getOpcode() == Instruction::Add){
        addUsers.push_back(I);
      }
    }
  }
  Value *filter_step_x = nullptr;
  Value *mul30_ = nullptr;
  Value *in_image_step_x = nullptr;
  Value *mul28_ = nullptr;
  for(Instruction *I : reverse(mulUsers)){
    if(GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(I->user_back())){
      // 检查GEP是否有inbounds属性
      if (GEP->isInBounds()) {
        filter_step_x = I->getOperand(0);
        mul30_ = I;
      } else {
        in_image_step_x = I->getOperand(0);
        mul28_ = I;
      }
    }
  }
  assert(mul30_ && "mul30_ is nullptr");
  assert(filter_step_x && "filter_step_x is nullptr");
  for(Instruction *I : reverse(addUsers)){
    if(I->getOpcode() == Instruction::Add){
      if (auto *constOp = dyn_cast<ConstantInt>(I->getOperand(1))) {
        int64_t constVal = constOp->getSExtValue();
        if(constVal != 8)
           I->setOperand(0, mul30_);
        switch (constVal) {
              case 1:
                I->setOperand(1, filter_step_x);
                break;
              case 2:
                if(mul28 == nullptr){
                  mul28 = BinaryOperator::CreateNSWShl(filter_step_x, ConstantInt::get(filter_step_x->getType(), 1), "mul28", entryBlockTerminator);
                }
                I->setOperand(1, mul28);
                break;
              case 3:
                if(mul29 == nullptr){
                  mul29 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 3), "mul30", entryBlockTerminator);
                }
                I->setOperand(1, mul29);
                break;
              case 4:
                if(mul30 == nullptr){
                  mul30 = BinaryOperator::CreateNSWShl(filter_step_x, ConstantInt::get(filter_step_x->getType(), 2), "mul31", entryBlockTerminator);
                }
                I->setOperand(1, mul30);
                break;
              case 5:
                if(mul31 == nullptr){
                  mul31 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 5), "mul31", entryBlockTerminator);
                }
                I->setOperand(1, mul31);
                break;
              case 6:
                if(mul32 == nullptr){
                  mul32 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 6), "mul32", entryBlockTerminator);
                }
                I->setOperand(1, mul32);
                break;
              case 7:
                if(mul33 == nullptr){
                  mul33 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 7), "mul33", entryBlockTerminator);
                }
                I->setOperand(1, mul33);
                break;
              case 8:
                break;
              default:
          llvm_unreachable("Unsupported const value");
        }
        Instruction *inst = I->user_back();
        if(inst->getOpcode() == Instruction::Mul){
          inst->replaceAllUsesWith(I);
          inst->eraseFromParent();
        }
    }
  }
  }

  Instruction *arrayidx = dyn_cast<Instruction>(mul28_->user_back());
  Value *arrayidx_0_op = arrayidx->getOperand(0);
  
  SmallVector<Instruction *, 8> get_element_ptr_users;
  for (User *U : arrayidx_0_op->users()) {
    if (Instruction *I = dyn_cast<Instruction>(U)) {
      get_element_ptr_users.push_back(I);
    }
  }
  int idx = 1;
  for(Instruction *I : reverse(get_element_ptr_users)){
    if(I != arrayidx){
      I->setOperand(0,arrayidx);
      switch (idx) {
        case 1:
          I->setOperand(1, in_image_step_x);
          break;
        case 2:
          if(mul34 == nullptr){
            mul34 = BinaryOperator::CreateNSWShl(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 1), "mul34", entryBlockTerminator);
          }
          I->setOperand(1, mul34);
          break;
        case 3:
          if(mul35 == nullptr){
            mul35 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 3), "mul35", entryBlockTerminator);
          }
          I->setOperand(1, mul35);
          break;
        case 4:
          if(mul36 == nullptr){
            mul36 = BinaryOperator::CreateNSWShl(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 2), "mul36", entryBlockTerminator);
          }
          I->setOperand(1, mul36);
          break;
        case 5:
          if(mul37 == nullptr){
            mul37 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 5), "mul37", entryBlockTerminator);
          }
          I->setOperand(1, mul37);
          break;
        case 6:
          if(mul38 == nullptr){
            mul38 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 6), "mul38", entryBlockTerminator);
          }
          I->setOperand(1, mul38);
          break;
        case 7:
          if(mul39 == nullptr){
            mul39 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 7), "mul39", entryBlockTerminator);
          }
          I->setOperand(1, mul39);
          break;
        case 8:
          break;
        default:
          llvm_unreachable("Unsupported const value");
      }
    idx++;
    }
    
  }

}

static void hoistIndexIntoEntryBlock16(BasicBlock *forBodyMerged,Function &F){
  BasicBlock *entryBlock = &F.getEntryBlock();
  Instruction *entryBlockTerminator = entryBlock->getTerminator();
  PHINode *n_0894 = getFirstI32Phi(forBodyMerged);
  static Value *mul28 = nullptr;
  static Value *mul29 = nullptr;
  static Value *mul30 = nullptr;
  static Value *mul31 = nullptr;
  static Value *mul32 = nullptr;
  static Value *mul33 = nullptr;

  static Value *mul34 = nullptr;
  static Value *mul35 = nullptr;
  static Value *mul36 = nullptr;
  static Value *mul37 = nullptr;
  static Value *mul38 = nullptr;
  static Value *mul39 = nullptr;
  static Value *mul40 = nullptr;
  static Value *mul41 = nullptr;
  static Value *mul42 = nullptr;
  static Value *mul43 = nullptr;
  static Value *mul44 = nullptr;
  static Value *mul45 = nullptr;
  static Value *mul46 = nullptr;
  static Value *mul47 = nullptr;
  static Value *mul48 = nullptr;
  static Value *mul49 = nullptr;
  static Value *mul50 = nullptr;
  static Value *mul51 = nullptr;
  static Value *mul52 = nullptr;
  static Value *mul53 = nullptr;
  static Value *mul54 = nullptr;
  static Value *mul55 = nullptr;
  // 获取n_0894的所有引用指令
  SmallVector<Instruction *, 2> mulUsers;
  SmallVector<Instruction *, 2> addUsers;
  for(User *U : n_0894->users()){
    if(Instruction *I = dyn_cast<Instruction>(U)){
      if(I->getOpcode() == Instruction::Mul){
        mulUsers.push_back(I);
      }
      else if(I->getOpcode() == Instruction::Add){
        addUsers.push_back(I);
      }
    }
  }
  Value *filter_step_x = nullptr;
  Value *mul30_ = nullptr;
  Value *in_image_step_x = nullptr;
  Value *mul28_ = nullptr;
  for(Instruction *I : reverse(mulUsers)){
    if(GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(I->user_back())){
      // 检查GEP是否有inbounds属性
      if (GEP->isInBounds()) {
        filter_step_x = I->getOperand(0);
        mul30_ = I;
      } else {
        in_image_step_x = I->getOperand(0);
        mul28_ = I;
      }
    }
  }
  assert(mul30_ && "mul30_ is nullptr");
  assert(filter_step_x && "filter_step_x is nullptr");
  for(Instruction *I : reverse(addUsers)){
    if(I->getOpcode() == Instruction::Add){
      if (auto *constOp = dyn_cast<ConstantInt>(I->getOperand(1))) {
        int64_t constVal = constOp->getSExtValue();
        if(constVal != 16)
           I->setOperand(0, mul30_);
        switch (constVal) {
              case 1:
                I->setOperand(1, filter_step_x);
                break;
              case 2:
                if(mul28 == nullptr){
                  mul28 = BinaryOperator::CreateNSWShl(filter_step_x, ConstantInt::get(filter_step_x->getType(), 1), "mul28", entryBlockTerminator);
                }
                I->setOperand(1, mul28);
                break;
              case 3:
                if(mul29 == nullptr){
                  mul29 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 3), "mul30", entryBlockTerminator);
                }
                I->setOperand(1, mul29);
                break;
              case 4:
                if(mul30 == nullptr){
                  mul30 = BinaryOperator::CreateNSWShl(filter_step_x, ConstantInt::get(filter_step_x->getType(), 2), "mul31", entryBlockTerminator);
                }
                I->setOperand(1, mul30);
                break;
              case 5:
                if(mul31 == nullptr){
                  mul31 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 5), "mul31", entryBlockTerminator);
                }
                I->setOperand(1, mul31);
                break;
              case 6:
                if(mul32 == nullptr){
                  mul32 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 6), "mul32", entryBlockTerminator);
                }
                I->setOperand(1, mul32);
                break;
              case 7:
                if(mul33 == nullptr){
                  mul33 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 7), "mul33", entryBlockTerminator);
                }
                I->setOperand(1, mul33);
                break;
              case 8:
                if(mul34 == nullptr){
                  mul34 = BinaryOperator::CreateNSWShl(filter_step_x, ConstantInt::get(filter_step_x->getType(), 3), "mul34", entryBlockTerminator);
                }
                I->setOperand(1, mul34);
                break;
              case 9:
                if(mul35 == nullptr){
                  mul35 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 9), "mul35", entryBlockTerminator);
                }
                I->setOperand(1, mul35);
                break;
              case 10:
                if(mul36 == nullptr){
                  mul36 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 10), "mul36", entryBlockTerminator);
                }
                I->setOperand(1, mul36);
                break;
              case 11:
                if(mul37 == nullptr){
                  mul37 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 11), "mul37", entryBlockTerminator);
                }
                I->setOperand(1, mul37);
                break;
              case 12:
                if(mul38 == nullptr){
                  mul38 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 12), "mul38", entryBlockTerminator);
                }
                I->setOperand(1, mul38);
                break;
              case 13:
                if(mul39 == nullptr){
                  mul39 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 13), "mul39", entryBlockTerminator);
                }
                I->setOperand(1, mul39);
                break;
              case 14:
                if(mul40 == nullptr){
                  mul40 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 14), "mul40", entryBlockTerminator);
                }
                I->setOperand(1, mul40);
                break;
              case 15:
                if(mul41 == nullptr){
                  mul41 = BinaryOperator::CreateNSWMul(filter_step_x, ConstantInt::get(filter_step_x->getType(), 15), "mul41", entryBlockTerminator);
                }
                I->setOperand(1, mul41);
                break;
              case 16:
                break;
              default:
          llvm_unreachable("Unsupported const value");
        }
        Instruction *inst = I->user_back();
        if(inst->getOpcode() == Instruction::Mul){
          inst->replaceAllUsesWith(I);
          inst->eraseFromParent();
        }
    }
  }
  }

  Instruction *arrayidx = dyn_cast<Instruction>(mul28_->user_back());
  Value *arrayidx_0_op = arrayidx->getOperand(0);
  
  SmallVector<Instruction *, 16> get_element_ptr_users;
  for (User *U : arrayidx_0_op->users()) {
    if (Instruction *I = dyn_cast<Instruction>(U)) {
      get_element_ptr_users.push_back(I);
    }
  }
  int idx = 1;
  for(Instruction *I : reverse(get_element_ptr_users)){
    if(I != arrayidx){
      I->setOperand(0,arrayidx);
      switch (idx) {
        case 1:
          I->setOperand(1, in_image_step_x);
          break;
        case 2:
          if(mul42 == nullptr){
            mul42 = BinaryOperator::CreateNSWShl(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 1), "mul42", entryBlockTerminator);
          }
          I->setOperand(1, mul42);
          break;
        case 3:
          if(mul43 == nullptr){
            mul43 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 3), "mul43", entryBlockTerminator);
          }
          I->setOperand(1, mul43);
          break;
        case 4:
          if(mul44 == nullptr){
            mul44 = BinaryOperator::CreateNSWShl(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 2), "mul44", entryBlockTerminator);
          }
          I->setOperand(1, mul44);
          break;
        case 5:
          if(mul45 == nullptr){
            mul45 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 5), "mul45", entryBlockTerminator);
          }
          I->setOperand(1, mul45);
          break;
        case 6:
          if(mul46 == nullptr){
            mul46 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 6), "mul46", entryBlockTerminator);
          }
          I->setOperand(1, mul46);
          break;
        case 7:
          if(mul47 == nullptr){
            mul47 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 7), "mul47", entryBlockTerminator);
          }
          I->setOperand(1, mul47);
          break;
        case 8:
          if(mul48 == nullptr){
            mul48 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 8), "mul48", entryBlockTerminator);
          }
          I->setOperand(1, mul48);
          break;
        case 9:
          if(mul49 == nullptr){
            mul49 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 9), "mul49", entryBlockTerminator);
          }
          I->setOperand(1, mul49);
          break;
        case 10:
          if(mul50 == nullptr){
            mul50 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 10), "mul50", entryBlockTerminator);
          }
          I->setOperand(1, mul50);
          break;
        case 11:
          if(mul51 == nullptr){
            mul51 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 11), "mul51", entryBlockTerminator);
          }
          I->setOperand(1, mul51);
          break;
        case 12:
          if(mul52 == nullptr){
            mul52 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 12), "mul52", entryBlockTerminator);
          }
          I->setOperand(1, mul52);
          break;
        case 13:
          if(mul53 == nullptr){
            mul53 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 13), "mul53", entryBlockTerminator);
          }
          I->setOperand(1, mul53);
          break;
        case 14:
          if(mul54 == nullptr){
            mul54 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 14), "mul54", entryBlockTerminator);
          }
          I->setOperand(1, mul54);
          break;
        case 15:
          if(mul55 == nullptr){
            mul55 = BinaryOperator::CreateNSWMul(in_image_step_x, ConstantInt::get(in_image_step_x->getType(), 15), "mul55", entryBlockTerminator);
          }
          I->setOperand(1, mul55);
          break;
        case 16:
          break;
        default:
          llvm_unreachable("Unsupported const value");
      }
    idx++;
    }
    
  }
}

static void postUnrollDspiConvF32(Function &F, SmallVector<Loop *, 2> &FIRDWillTransformLoops, int unroll_count,LoopInfo &LI) {
  runDeadCodeElimination(F);
  BasicBlock &entryBB = F.getEntryBlock();
  int loop_idx = 0;
  for(auto L : FIRDWillTransformLoops){

    BasicBlock *loopHeader = L->getHeader();

    ValueToValueMapTy VMap;
    BasicBlock *loopHeaderClone = CloneBasicBlock(loopHeader, VMap, ".clone", &F);
  
    for (Instruction &inst : *loopHeaderClone) {
      for (unsigned i = 0; i < inst.getNumOperands(); ++i) {
          Value *op = inst.getOperand(i);
          if (VMap.count(op)) {
              inst.setOperand(i, VMap[op]); // 更新操作数为映射后的新值
          }
      }
    }

    loopHeaderClone->moveAfter(loopHeader);
    Instruction *loopHeaderCloneTerminator = loopHeaderClone->getTerminator();
    loopHeaderCloneTerminator->eraseFromParent();
    
    preprocessUnrolledBBs(loopHeader);
    
    std::vector<BasicBlock *> BBsToMerge;
    StringRef forBodyName = loopHeader->getName();
    for (int i = 1; i < unroll_count; ++i) {
      std::string BBName = (forBodyName + "." + std::to_string(i)).str();
      BasicBlock *clonedBB = getBasicBlockByName(F, BBName);
      if(i < unroll_count - 1){
        preprocessUnrolledBBs(clonedBB);
      }
      if (clonedBB) {
        BBsToMerge.push_back(clonedBB);
      } else {
        llvm_unreachable("Basic block not found");
      }
    }

    if (BBsToMerge.size() == static_cast<size_t>(unroll_count - 1)) {
      for (BasicBlock *BB : BBsToMerge) {
        MergeBasicBlockIntoOnlyPred(BB);
      }
    }

    BasicBlock *forBodyMerged = BBsToMerge.back();
    if(unroll_count == 4){
      hoistIndexIntoEntryBlock4(forBodyMerged,F);
    }
    else if(unroll_count == 8){
      hoistIndexIntoEntryBlock8(forBodyMerged,F);
    }
    else if(unroll_count == 16){
      hoistIndexIntoEntryBlock16(forBodyMerged,F);
    }

    BasicBlock *forBody = nullptr;
    for(BasicBlock *pred : predecessors(forBodyMerged)){
      if(pred != forBodyMerged){
        forBody = pred;
        break;
      }
    }
    assert(forBody != nullptr && "forBody not found");

    loopHeaderClone->moveAfter(forBodyMerged);
    for(auto &phi : loopHeaderClone->phis()){
      phi.setIncomingBlock(1, loopHeaderClone);
    }

    
    BasicBlock *forCondCleanup26 = nullptr;
    for (BasicBlock *succ : successors(forBodyMerged)) {
      if (succ != forBodyMerged) {
        forCondCleanup26 = succ;
        break;
      }
    }
    forCondCleanup26->moveAfter(loopHeaderClone);
    
    // 创建新的loop preheader基本块
    BasicBlock *loopHeaderCloneLrPh = BasicBlock::Create(
        F.getContext(), loopHeaderClone->getName() + ".lr.ph", &F, loopHeaderClone);

    // 创建无条件分支指令指向loopHeaderClone
    IRBuilder<> Builder(loopHeaderCloneLrPh);
    Builder.CreateBr(loopHeaderClone);

    // 更新loopHeaderClone的phi节点的incoming block
    for (auto &phi : loopHeaderClone->phis()) {
      phi.setIncomingBlock(0, loopHeaderCloneLrPh);
    }

    ICmpInst *cmp25_clone = getLastInst<ICmpInst>(loopHeaderClone);
    Value *inc_clone = cmp25_clone->getOperand(0);
    Value *op1 = cmp25_clone->getOperand(1);
    cmp25_clone->setPredicate(ICmpInst::ICMP_EQ);
    Value *first_fadd = getFirstFMulAddInst(loopHeaderClone);
    for(auto &PN : loopHeaderClone->phis()){
      if(PN.getType()->isIntegerTy(32)){
        PN.setIncomingValue(1, inc_clone);
      }
      else if(PN.getType()->isFloatingPointTy()){
        PN.setIncomingValue(1, first_fadd);
      }
    }

    // 创建for.cond.preheader基本块
    BasicBlock *forCondPreheader = BasicBlock::Create(
        F.getContext(), "for.cond.preheader", &F, loopHeaderCloneLrPh);
    
    // 将forBodyMerged中的phi节点克隆到forCondPreheader中
    IRBuilder<> BuilderPreheader(forCondPreheader);
    for (auto &I : *forBodyMerged) {
      PHINode *PN = dyn_cast<PHINode>(&I);
      if (!PN)
        break;

      Instruction *In = I.clone();
        
      if (PN->getType()->isIntegerTy(32)) {
        Value *cond = BuilderPreheader.CreateICmpSLT(In, op1);
        BuilderPreheader.CreateCondBr(cond, loopHeaderCloneLrPh, forCondCleanup26);
      }
      In->insertBefore(&*forCondPreheader->begin());
    }
    
    // 在loopHeaderClone中创建条件分支指令
    BranchInst *BI = BranchInst::Create(forCondCleanup26, loopHeaderClone, cmp25_clone);
    BI->insertAfter(cmp25_clone);


    forBody->getTerminator()->setSuccessor(1, forCondPreheader);
    forBodyMerged->getTerminator()->setSuccessor(1, forCondPreheader);

    PHINode *acc_1_lcssa = getLastInst<PHINode>(forCondCleanup26);
    acc_1_lcssa->setIncomingBlock(0, forCondPreheader);
    acc_1_lcssa->setIncomingValue(0, getFirstFloatPhi(forCondPreheader));
    acc_1_lcssa->setIncomingValue(1, first_fadd);
    acc_1_lcssa->setIncomingBlock(1, loopHeaderClone);

    // 将forCondPreheader中的phi (float和i32) 设置到loopHeaderClone中对应phi的incoming value 0
    for (auto &I : *forCondPreheader) {
      PHINode *PN = dyn_cast<PHINode>(&I);
      if (!PN)
        break;
      if (PN->getType()->isFloatingPointTy() || PN->getType()->isIntegerTy(32)) {
        for (auto &HeaderPN : loopHeaderClone->phis()) {
          if (HeaderPN.getType() == PN->getType()) {
            HeaderPN.setIncomingValue(0, PN);
          }
        }
      }
    }

    GetElementPtrInst *gep = getFirstInst<GetElementPtrInst>(loopHeaderClone);
    Instruction *gep_op0 = dyn_cast<Instruction>(gep->getOperand(0));
    if(gep_op0->getParent() != loopHeaderClone){
      Instruction *gep_op0_op0_clone = dyn_cast<Instruction>(gep_op0->getOperand(0))->clone();
      gep_op0_op0_clone->insertBefore(&*loopHeaderCloneLrPh->begin());
      gep->setOperand(0, gep_op0_op0_clone);

    }

    loopHeaderClone->getTerminator()->setSuccessor(0, forCondCleanup26);

    ICmpInst *exitcond1057_not_7 = getLastInst<ICmpInst>(forBodyMerged);
    exitcond1057_not_7->setPredicate(ICmpInst::ICMP_SLT);

    Value *operand_1 = exitcond1057_not_7->getOperand(1);
    if(dyn_cast<Instruction>(operand_1)->getParent() == &entryBB){
      IRBuilder<> BuilderEntry(entryBB.getTerminator());
      Value *sub22 = BuilderEntry.CreateNSWAdd(operand_1, ConstantInt::get(operand_1->getType(), 1-unroll_count), "sub22");
      exitcond1057_not_7->setOperand(1, sub22);

      if (BranchInst *forBodyTerm = dyn_cast<BranchInst>(forBody->getTerminator())) {
        if (ICmpInst *forBodyTermCond = dyn_cast<ICmpInst>(forBodyTerm->getCondition())) {
          if (forBodyTermCond->getOperand(1) == operand_1) {
            forBodyTermCond->setOperand(1, sub22);
          } else {
            // llvm_unreachable("Unexpected operand in forBody terminator condition");
            ;
          }
        }
      }
    }
    else if(Instruction *sub135 = dyn_cast<Instruction>(operand_1)){
      IRBuilder<> Builder(sub135->getParent()->getTerminator());
      Value *sub216 = Builder.CreateNSWAdd(operand_1, ConstantInt::get(operand_1->getType(), 1-unroll_count), "sub216");
      exitcond1057_not_7->setOperand(1, sub216);
    }

    Instruction *sub135 = dyn_cast<Instruction>(operand_1);
    for (User *U : sub135->users()) {
      if (ICmpInst *ICI = dyn_cast<ICmpInst>(U)) {
        if (ICI->getOperand(0) == sub135) {
          if (ConstantInt *CI = dyn_cast<ConstantInt>(ICI->getOperand(1))) {
            if (CI->isZero()) {
              ICI->setOperand(1, ConstantInt::get(CI->getType(), unroll_count-1));
            }
          }
        }
      }
    }
    forBodyMerged->getTerminator()->setSuccessor(0, forBodyMerged);

    loop_idx++;


    // groupSameInstForDspiConvF32(forBodyMerged);
  }

  SmallVector<Instruction*, 512> InstsToMove;
  for(auto &BB : F){
      for(auto &I : BB){
          if (isa<PHINode>(I) || isa<BranchInst>(I))
              continue;
          InstsToMove.push_back(&I);  // 存储指针而不是对象
      }
  }

  for(auto *I : InstsToMove){  // 使用指针
      if (I->getNumOperands() > 0) {
          Value *firstOp = I->getOperand(0);
          if (Instruction *firstOpInst = dyn_cast<Instruction>(firstOp)) {
              BasicBlock *baseParent = firstOpInst->getParent();
              BasicBlock *instParent = I->getParent();
              
              bool allSameParent = true;
              for (unsigned idx = 1; idx < I->getNumOperands(); idx++) {
                  Value *op = I->getOperand(idx);
                  if (Instruction *opInst = dyn_cast<Instruction>(op)) {
                      if (opInst->getParent() != baseParent) {
                          allSameParent = false;
                          break;
                      }
                  }
              }
              
              if (allSameParent && baseParent != instParent && baseParent != nullptr) {
                  I->moveBefore(baseParent->getTerminator());
              }
          }
      }
    
  }

  runPostPass(F);
  runDeadCodeElimination(F);
  // runO3Optimize(F);
}

static void PrintDebugFunction(Function &F) {
  std::error_code EC;
  llvm::raw_fd_ostream File(
      "/home/chenqian/Workspace/scripts/dsps/dsps_bit_rev_fc32_ansi/debug.ll", EC,
      llvm::sys::fs::OF_Text);

  if (EC) {
    llvm::errs() << "Could not open file: " << EC.message() << "\n";
    return;
  }

  F.print(File, nullptr);
}

static void PrintDebugModule(Module &M) {
  std::error_code EC;
  llvm::raw_fd_ostream File(
      "/home/chenqian/Workspace/scripts/dsps/dsps_bit_rev_fc32_ansi/debug.ll", EC,
      llvm::sys::fs::OF_Text);

  if (EC) {
    llvm::errs() << "Could not open file: " << EC.message() << "\n";
    return;
  }

  M.print(File, nullptr);
}

static bool checkDspsFft2rFc32Type(Function &F,LoopInfo &LI){
  // 检查函数参数数量
  if (F.arg_size() != 3)
    return false;

  // 获取函数参数迭代器
  Function::arg_iterator args = F.arg_begin();

  // 检查第一个参数是否为指针类型
  if (!args->getType()->isPointerTy())
    return false;
  ++args;

  // 检查第二个参数是否为i32类型
  if (!args->getType()->isIntegerTy(32))
    return false;
  ++args;

  // 检查第三个参数是否为指针类型
  if (!args->getType()->isPointerTy())
    return false;

  return true;

}

static bool checkDspsBitRevFc32Type(Function &F){

  return true;
}

void copyPHINodes(BasicBlock *sourceBB, BasicBlock *targetBB) {
    for (PHINode &phi : sourceBB->phis()) {
        // 创建一个新的PHI节点
        PHINode *newPhi = PHINode::Create(phi.getType(), phi.getNumIncomingValues(), phi.getName(), targetBB);

        // 复制每个操作数
        for (unsigned i = 0; i < phi.getNumIncomingValues(); ++i) {
            Value *incomingValue = phi.getIncomingValue(i);
            BasicBlock *incomingBlock = phi.getIncomingBlock(i);
            newPhi->addIncoming(incomingValue, incomingBlock);
        }
    }
}

static void groupSameInstructionDspsFft2rFc32(BasicBlock *forBody) {
  // Collect different types of instructions
  SmallVector<PHINode *> phiNodes;
  SmallVector<Instruction *> addInsts,shlInsts,orInsts, gepInsts, loadInsts, fmulInsts,
      fsubInsts, faddInsts, fmuladdInsts;

  // Categorize instructions by type
  for (Instruction &I : *forBody) {
    if (auto *phi = dyn_cast<PHINode>(&I)) {
      phiNodes.push_back(phi);
    } else if (I.getOpcode() == Instruction::Or) {
      orInsts.push_back(&I);
    } else if (isa<GetElementPtrInst>(&I)) {
      gepInsts.push_back(&I);
    } else if (isa<LoadInst>(&I)) {
      loadInsts.push_back(&I);
    } else if (I.getOpcode() == Instruction::FAdd) {
      faddInsts.push_back(&I);
    } else if (I.getOpcode() == Instruction::FSub) {
      fsubInsts.push_back(&I);
    } else if (I.getOpcode() == Instruction::FMul) {
      fmulInsts.push_back(&I);
    } else if (auto *mulInst = dyn_cast<BinaryOperator>(&I)) {
      if(mulInst->getOpcode() == Instruction::Add){
        addInsts.push_back(mulInst);
      }
      else if(mulInst->getOpcode() == Instruction::Shl){
        shlInsts.push_back(mulInst);
      }
    }
    else if(RecurrenceDescriptor::isFMulAddIntrinsic(&I)){
      fmuladdInsts.push_back(&I);
    }
  }

  // If no PHI nodes are found, return
  if (phiNodes.empty()) {
    return;
  }

  // Reorder instructions
  Instruction *insertPoint = phiNodes.back()->getNextNode();

  auto moveInstructions = [&insertPoint](SmallVector<Instruction *> &insts) {
    for (auto *inst : insts) {
      inst->moveBefore(insertPoint);
      insertPoint = inst->getNextNode();
    }
  };

  // Move instructions in the desired order
  moveInstructions(addInsts);
  moveInstructions(shlInsts);
  moveInstructions(orInsts);
  moveInstructions(gepInsts);
  moveInstructions(loadInsts);
  moveInstructions(fmulInsts);
  moveInstructions(fmuladdInsts);
  moveInstructions(faddInsts);
  moveInstructions(fsubInsts);

}

static void postUnrollDspsFft2rFc32(Function &F, SmallVector<Loop *, 2> &FIRDWillTransformLoops, int unroll_count,LoopInfo &LI) {
  runDeadCodeElimination(F);
  
  
  assert(FIRDWillTransformLoops.size() == 1);
  Loop *L = FIRDWillTransformLoops[0];
  
  BasicBlock *loopHeader = L->getHeader();

  ValueToValueMapTy VMap;
  BasicBlock *loopHeaderClone = CloneBasicBlock(loopHeader, VMap, ".clone", &F);

  for (Instruction &inst : *loopHeaderClone) {
    for (unsigned i = 0; i < inst.getNumOperands(); ++i) {
        Value *op = inst.getOperand(i);
        if (VMap.count(op)) {
            inst.setOperand(i, VMap[op]); // 更新操作数为映射后的新值
        }
    }
  }

  loopHeaderClone->moveAfter(loopHeader);
  Instruction *loopHeaderCloneTerminator = loopHeaderClone->getTerminator();
  loopHeaderCloneTerminator->eraseFromParent();

  preprocessUnrolledBBs(loopHeader);

  std::vector<BasicBlock *> BBsToMerge;
  StringRef forBodyName = loopHeader->getName();
  for (int i = 1; i < unroll_count; ++i) {
    std::string BBName = (forBodyName + "." + std::to_string(i)).str();
    BasicBlock *clonedBB = getBasicBlockByName(F, BBName);
    if(i < unroll_count - 1){
      preprocessUnrolledBBs(clonedBB);
    }
    if (clonedBB) {
      BBsToMerge.push_back(clonedBB);
    } else {
      llvm_unreachable("Basic block not found");
    }
  }

  if (BBsToMerge.size() == static_cast<size_t>(unroll_count - 1)) {
    for (BasicBlock *BB : BBsToMerge) {
      MergeBasicBlockIntoOnlyPred(BB);
    }
  }

  BasicBlock *forBodyMerged = BBsToMerge.back();
  BasicBlock *forBody = nullptr;
  for(BasicBlock *pred : predecessors(forBodyMerged)){
    if(pred != forBodyMerged){
      forBody = pred;
      break;
    }
  }
  assert(forBody != nullptr && "forBody not found");

  loopHeaderClone->moveAfter(forBodyMerged);
  for(auto &phi : loopHeaderClone->phis()){
    phi.setIncomingBlock(1, loopHeaderClone);
  }

  BasicBlock *forCondCleanup26 = nullptr;
  for (BasicBlock *succ : successors(forBodyMerged)) {
    if (succ != forBodyMerged) {
      forCondCleanup26 = succ;
      break;
    }
  }
  forCondCleanup26->moveAfter(loopHeaderClone);

  // 创建新的loop preheader基本块
  BasicBlock *loopHeaderCloneLrPh = BasicBlock::Create(
      F.getContext(), loopHeaderClone->getName() + ".lr.ph", &F, loopHeaderClone);

  // 创建无条件分支指令指向loopHeaderClone
  IRBuilder<> Builder(loopHeaderCloneLrPh);
  Builder.CreateBr(loopHeaderClone);

  // 更新loopHeaderClone的phi节点的incoming block
  for (auto &phi : loopHeaderClone->phis()) {
    phi.setIncomingBlock(0, loopHeaderCloneLrPh);
  }

  for(auto &PN : loopHeaderClone->phis()){
    for(auto &I : *loopHeaderClone){
      if(auto *Add = dyn_cast<BinaryOperator>(&I)){
        if(Add->getOpcode() == Instruction::Add && Add->hasNoSignedWrap()){
          if(Add->getOperand(0) == &PN && 
             isa<ConstantInt>(Add->getOperand(1)) && 
             cast<ConstantInt>(Add->getOperand(1))->equalsInt(1)){
            PN.setIncomingValue(1, Add);
            break;
          }
        }
      }
    }
  }

  ICmpInst *cmp25_clone = getLastInst<ICmpInst>(loopHeaderClone);
  Value *inc_clone = cmp25_clone->getOperand(0);
  Value *N2_0105 = cmp25_clone->getOperand(1);

  Value *first_fadd = getFirstFMulAddInst(loopHeaderClone);
  // 创建for.cond.preheader基本块
  BasicBlock *forCondPreheader = BasicBlock::Create(
      F.getContext(), "for.cond.preheader", &F, loopHeaderCloneLrPh);

   // 将forBodyMerged中的phi节点克隆到forCondPreheader中
   IRBuilder<> BuilderPreheader(forCondPreheader);

    copyPHINodes(forBodyMerged, forCondPreheader);
    PHINode *temp = getFirstI32Phi(forCondPreheader);
    Value *cond = BuilderPreheader.CreateICmpULT(temp, N2_0105);
    BuilderPreheader.CreateCondBr(cond, loopHeaderCloneLrPh, forCondCleanup26);

    // 在loopHeaderClone中创建条件分支指令
    BranchInst *BI = BranchInst::Create(forCondCleanup26, loopHeaderClone, cmp25_clone);
    BI->insertAfter(cmp25_clone);

    forCondPreheader->moveBefore(forBodyMerged);
    BasicBlock *forBody6LrPh = nullptr;
    BasicBlock *forBody6 = nullptr;
    for(auto &L : LI){
      for(auto &subL : *L){
        forBody6LrPh = subL->getLoopPredecessor();
        forBody6 = subL->getHeader();
        forBody6LrPh->dump();
        forBody6->dump();
        break;
      }
    }
    assert(forBody6LrPh != nullptr && "forBody6LrPh not found");
    assert(forBody6 != nullptr && "forBody6 not found");

    ICmpInst *cmp1097_not = getLastInst<ICmpInst>(forBody6LrPh);

    IRBuilder<> BuilderForBody6LrPh(cmp1097_not);
    Value *sub = BuilderForBody6LrPh.CreateAdd(N2_0105, ConstantInt::get(N2_0105->getType(), -3), "sub", /*HasNUW=*/false, /*HasNSW=*/true);

    cmp1097_not->setOperand(1, ConstantInt::get(N2_0105->getType(), 7));
    cmp1097_not->setPredicate(ICmpInst::ICMP_UGT);
    Value *and_val = BuilderForBody6LrPh.CreateAnd(N2_0105, ConstantInt::get(N2_0105->getType(), 1073741820), "and");
    forBody6->getTerminator()->setSuccessor(0, forCondPreheader);
    swapTerminatorSuccessors(forBody6);

    for(auto &phi : forCondPreheader->phis()){
      phi.setIncomingBlock(0, forBody6);
    }
    PHINode *i_0_lcssa = getFirstI32Phi(forCondPreheader);
    i_0_lcssa->setIncomingValue(1, and_val);

    BasicBlock *forBody12LrPh = forBody6->getTerminator()->getSuccessor(0);
    // 将forBody12LrPh中非分支指令移动到forBody6
    std::vector<Instruction*> instsToMove;
    for (auto &I : *forBody12LrPh) {
      if (!isa<BranchInst>(I)) {
        instsToMove.push_back(&I);
      }
    }

    // 将指令移动到forBody6的终止符之前
    Instruction *forBody6Term = forBody6->getTerminator();
    for (auto *I : instsToMove) {
      I->moveBefore(forBody6Term);
    }

    ICmpInst *exitCond_not_3 = getLastInst<ICmpInst>(forBodyMerged);
    exitCond_not_3->setOperand(1, sub);
    exitCond_not_3->setPredicate(ICmpInst::ICMP_SLT);
    forBodyMerged->getTerminator()->setSuccessor(0, forCondPreheader);
    swapTerminatorSuccessors(forBodyMerged);

    // PHINode *i_099_clone = getFirstI32Phi(loopHeaderClone);
    
    for(auto &phi1 : loopHeaderClone->phis()){
      for(auto &phi2 : forCondPreheader->phis()){
        if(phi1.getIncomingValue(0) == phi2.getIncomingValue(0)){
          phi1.setIncomingValue(0, &phi2);
        }
      }
    }
    PHINode *ia_198_clone = getLastI32Phi(loopHeaderClone);
    PHINode *ia_198_clone_clone = cast<PHINode>(ia_198_clone->clone());
    ia_198_clone_clone->insertBefore(forCondCleanup26->getFirstNonPHI());
    ia_198_clone_clone->setIncomingBlock(0, forCondPreheader);
    PHINode *ia_1_lcssa = getFirstI32Phi(forCondCleanup26);
    ia_1_lcssa->replaceAllUsesWith(ia_198_clone_clone);
    ia_1_lcssa->eraseFromParent();
    groupSameInstructionDspsFft2rFc32(forBodyMerged);

    runPostPass(F);
    runDeadCodeElimination(F);
    // runO3Optimize(F);
}

static void postUnrollDspsBitRevFc32(Function &F, SmallVector<Loop *, 2> &FIRDWillTransformLoops, int unroll_count,LoopInfo &LI) {
  runDeadCodeElimination(F);
  // for(auto &L : FIRDWillTransformLoops){
  //   L->dump();
  // }
}



static void extractLoopToFunction(Loop *L,Function &F){
   Module *M = F.getParent();
    LLVMContext &Ctx = M->getContext();

    // 创建bit_rev_single_step函数
    // 先创建float类型
    Type *FloatTy = Type::getFloatTy(Ctx);
    // 然后创建指向float的指针类型
    Type *FloatPtrTy = PointerType::get(FloatTy, 0);  // 0表示默认地址空间
    Type *Int32Ty = Type::getInt32Ty(Ctx);
    
    std::vector<Type*> ParamTypes = {
      FloatPtrTy,  // data
      Int32Ty,     // i
      Int32Ty,     // j
      Int32Ty      // N
    };
    
    FunctionType *BitRevFnTy = FunctionType::get(
      Int32Ty,     // 返回类型
      ParamTypes,  // 参数类型
      false        // 不是可变参数
    );

    // 创建新函数
    Function *BitRevFn = Function::Create(
      BitRevFnTy,
      Function::InternalLinkage,
      "bit_rev_single_step",
      M
    );

    // 设置函数属性
    BitRevFn->addFnAttr(Attribute::NoFree);
    BitRevFn->addFnAttr(Attribute::NoInline);
    BitRevFn->addFnAttr(Attribute::NoRecurse);
    BitRevFn->addFnAttr(Attribute::NoSync);
    BitRevFn->addFnAttr(Attribute::NoUnwind);
    BitRevFn->addFnAttr(Attribute::Memory);

    // 修改主函数的循环结构
    BasicBlock *Entry = &F.getEntryBlock();
    IRBuilder<> Builder(Entry);

    // ... 在这里实现循环重构和函数调用的逻辑 ...
    // 注意:完整实现需要:
    // 1. 提取位反转逻辑到新函数
    // 2. 在主函数中替换原有逻辑为对新函数的调用
    // 3. 保持原有的控制流结构

    return;

  // for(auto &L : LI){
  //   if(L->getLoopDepth() == 1){
  //     extractLoopToFunction(L,F);
  //   }
  // }
}

static std::pair<Value*,Value*> findArgI(BasicBlock *BB){
  ICmpInst *cmp = getLastInst<ICmpInst>(BB);
  if(cmp->getPredicate() == ICmpInst::ICMP_SLT){
    return std::make_pair(cmp->getOperand(0),cmp->getOperand(1));
  }
  return std::make_pair(nullptr,nullptr);
}

static Value* findArgJ(BasicBlock *BB){
  PHINode *phi = getLastI32Phi(BB);
  return phi->getIncomingValue(1);
}

static bool LoopExtract(Function &F,LoopInfo &LI){
    Module *M = F.getParent();

    // 创建新函数的类型
    LLVMContext &Ctx = M->getContext();
    Type *FloatTy = Type::getFloatTy(Ctx);
    Type *FloatPtrTy = PointerType::get(FloatTy, 0);
    Type *Int32Ty = Type::getInt32Ty(Ctx);
    std::vector<Type*> ParamTypes = {
      FloatPtrTy,  // data
      Int32Ty,     // i
      Int32Ty,     // j
      Int32Ty      // N
    };
  
    FunctionType *BitRevFnTy = FunctionType::get(Int32Ty, ParamTypes, false);
    Function *BitRevFn = Function::Create(BitRevFnTy, 
                                        Function::InternalLinkage,
                                        "bit_rev_single_step", 
                                        M);
    // 添加以下代码来设置fastcc调用约定
    BitRevFn->setCallingConv(CallingConv::Fast);
    // BitRevFn->stealArgumentListFrom(F);
    // 获取参数的引用
    auto args_it = BitRevFn->arg_begin();
    Argument *data = BitRevFn->getArg(0);  // data参数
    Argument *arg_i = BitRevFn->getArg(1); // i参数 (新增)
    Argument *arg_j = BitRevFn->getArg(2); // j参数 (新增)
    Argument *N = BitRevFn->getArg(3);       // N参数

    // 设置参数名称
    data->setName("data");
    arg_i->setName("i");    // 新增
    arg_j->setName("j");    // 新增
    N->setName("N");     


    // 为第一个参数额外添加 NoCapture 属性
    BitRevFn->arg_begin()->addAttr(Attribute::NoCapture);

    // 设置函数属性
    BitRevFn->addFnAttr(Attribute::NoFree);
    BitRevFn->addFnAttr(Attribute::NoInline);
    BitRevFn->addFnAttr(Attribute::NoRecurse);
    BitRevFn->addFnAttr(Attribute::NoSync);
    BitRevFn->addFnAttr(Attribute::NoUnwind);
    BitRevFn->addFnAttr(Attribute::Memory);

    // 创建入口基本块
    BasicBlock *NewEntry = BasicBlock::Create(Ctx, "entry", BitRevFn);
    IRBuilder<> Builder(NewEntry);

    // 找到需要移动的基本块
    BasicBlock *WhileCondBB = nullptr;
    BasicBlock *WhileEndBB = nullptr;
    BasicBlock *IfThenBB = nullptr;
    BasicBlock *ForIncBB = nullptr;
    for (BasicBlock &BB : F) {
      if (BB.getName() == "while.cond") WhileCondBB = &BB;
      else if (BB.getName() == "while.end") WhileEndBB = &BB;
      else if (BB.getName() == "if.then5") IfThenBB = &BB;
      else if (BB.getName() == "for.inc") ForIncBB = &BB;
    }

    if(!WhileCondBB || !WhileEndBB || !IfThenBB || !ForIncBB){
      return false;
    }
    // 将基本块移动到新函数
    WhileCondBB->removeFromParent();
      WhileEndBB->removeFromParent();
      IfThenBB->removeFromParent();
      ForIncBB->removeFromParent();
      
      WhileCondBB->insertInto(BitRevFn);
      WhileEndBB->insertInto(BitRevFn);
      IfThenBB->insertInto(BitRevFn);
      ForIncBB->insertInto(BitRevFn);
      // 从入口块跳转到while.cond
      Builder.CreateBr(WhileCondBB);

      // 修复PHI节点的引用
      for (BasicBlock &BB : *BitRevFn) {
        for (PHINode &Phi : BB.phis()) {
          for (unsigned i = 0; i < Phi.getNumIncomingValues(); ++i) {
            BasicBlock *IncomingBB = Phi.getIncomingBlock(i);
            if (IncomingBB->getParent() != BitRevFn) {
              // 如果incoming block不在新函数中，替换为entry
              Phi.setIncomingBlock(i, NewEntry);
            }
          }
        }
      }
      


    // 获取if.then5的终结器
      // if (BranchInst *Br = dyn_cast<BranchInst>(IfThenBB->getTerminator())) {
      //   if (Br->isUnconditional()) {
      //     BasicBlock *SuccBB = Br->getSuccessor(0);
      //     if (SuccBB) {
      //       // 将后继基本块移动到新函数
      //       SuccBB->removeFromParent();
      //       SuccBB->insertInto(BitRevFn);
      //     }
      //   }
      // }
    // 删除ForIncBB中的所有指令
    // ForIncBB->dropAllReferences();
    // 收集ForIncBB的所有引用
    SmallVector<User*, 8> Users;
    for (User *U : ForIncBB->users()) {
      // Users.push_back(U);
      U->dump();
    }
    auto [i,add] = findArgI(WhileEndBB);
    Value *j = findArgJ(WhileCondBB);


  // 为所有参数添加 NoUndef 属性
  for(Argument &Arg : BitRevFn->args()) {
    Arg.addAttr(Attribute::NoUndef);
  }

  BasicBlock *ForBodyBB = nullptr;
  BasicBlock *ReturnBB = nullptr;

  for (BasicBlock &BB : F) {
    if (BB.getName() == "while.cond.preheader") ForBodyBB = &BB;
    else if (BB.getName() == "return") ReturnBB = &BB;
  }

  if (!ForBodyBB || !ReturnBB) return false;

  // 在for.body中添加对新函数的调用
  // IRBuilder<> Builder(ForBodyBB->getTerminator());
  Builder.SetInsertPoint(ForBodyBB->getTerminator());
  std::vector<Value*> Args = {
    F.getArg(0),  // data
    // 获取循环变量i和j
    getFirstI32Phi(ForBodyBB),  // i
    getLastI32Phi(ForBodyBB),  // j
    F.getArg(1)  // N
  };

  CallInst *call1 = Builder.CreateCall(BitRevFn, Args, "call1");
  call1->setTailCall(true);
  for (auto I = ForIncBB->begin(); I != ForIncBB->end();) {
    Instruction &Inst = *I++;
    Inst.moveBefore(ForBodyBB->getTerminator());
 
  }

  // 创建新的ret指令
  ReturnInst::Create(F.getContext(), add, ForIncBB);

  if(i && j){
    i->replaceUsesOutsideBlock(arg_i,ForBodyBB);
    j->replaceAllUsesWith(arg_j);
  }
 
  ForBodyBB->getTerminator()->eraseFromParent();

  for(PHINode &Phi : ForBodyBB->phis()){
    Phi.setIncomingBlock(0,ForBodyBB);
  }
  getLastI32Phi(ForBodyBB)->setIncomingValue(0,call1);
  
  getFirstI32Phi(ReturnBB)->setIncomingBlock(2,ForBodyBB);
  return true;
}

static PreservedAnalyses runLoopUnrollPass(Function &F,
                                           FunctionAnalysisManager &AM) {
  // F.dump();
  bool force = true;
  bool runtime = false;
  auto &LI = AM.getResult<LoopAnalysis>(F);
  auto &DT = AM.getResult<DominatorTreeAnalysis>(F);
  // There are no loops in the function. Return before computing other expensive
  // analyses.
  if (LI.empty())
    return PreservedAnalyses::all();
  if (checkDspsInt16DotprodType(F)) {
    currentUnrollType = UnrollType::INT16_DSPS_DOTPROD;
    unroll_count = 8;
  } else if (checkDspsInt16AddType(F)) {
    currentUnrollType = UnrollType::INT16_DSPS_ADD;
    unroll_count = 16;
  } else if (checkDspsInt16MulCType(F)) {
    currentUnrollType = UnrollType::INT16_DSPS_MULC;
    preTransformDspsInt16MulC(F);
    unroll_count = 16;
  } else if (checkDspsInt16FIRDType(F, LI)) {
    currentUnrollType = UnrollType::INT16_DSPS_FIRD;
    unroll_count = 16;
  } else if (checkDspiInt16DotprodType(F, LI)) {
    currentUnrollType = UnrollType::INT16_DSPI_DOTPROD;
    unroll_count = 8;
  } else if (checkDspiInt8DotprodType(F, LI)) {
    currentUnrollType = UnrollType::INT8_DSPI_DOTPROD;
    unroll_count = 8;
  } else if (checkDspmInt16MultType(F, LI)) {
    currentUnrollType = UnrollType::INT16_DSPM_MULT;
    unroll_count = 8;
  } else if (checkDspiF32DotprodType(F, LI)) {
    currentUnrollType = UnrollType::F32_DSPI_DOTPROD;
    unroll_count = 8;
  } else if (checkDspmF32AddType(F,LI)){
    currentUnrollType = UnrollType::F32_DSPM_ADD;
    unroll_count = 8;    
  } else if (checkDspmF32MultType(F,LI)){
    currentUnrollType = UnrollType::F32_DSPM_MULT;
    unroll_count = 8;
  } else if (checkDspmF32MultExType(F,LI)){
    currentUnrollType = UnrollType::F32_DSPM_MULT_EX;
    unroll_count = 8;
  } else if (checkDspsWindBlackmanF32Type(F)){
    currentUnrollType = UnrollType::F32_DSPS_WIND_BLACKMAN;
    unroll_count = 8;
  } else if (checkDspiConvF32Type(F,LI)){
    currentUnrollType = UnrollType::F32_DSPI_CONV;
    if(DSPIMatrixSizeOpt == DSPIMatrixSize::SIZE_4X4){
      unroll_count = 8;
    }
    else if(DSPIMatrixSizeOpt == DSPIMatrixSize::SIZE_8X8){
      unroll_count = 8;
    }
    else if(DSPIMatrixSizeOpt == DSPIMatrixSize::SIZE_16X16){
      unroll_count = 16;
    }
  } 
  else if(checkDspsFft2rFc32Type(F,LI)){
    currentUnrollType = UnrollType::F32_DSPS_FFT2R;
    unroll_count = 4;
  }
  else if(checkDspsBitRevFc32Type(F)){
    currentUnrollType = UnrollType::F32_DSPS_BIT_REV_FC32;
    unroll_count = 8;
    bool Changed = LoopExtract(F,LI);
    PrintDebugModule(*F.getParent());
    // if(Changed){
    //   
    //   return PreservedAnalyses::all();
    // }
    verifyModule(*F.getParent());
    return PreservedAnalyses::none();
  }
  else {
    currentUnrollType = UnrollType::UNKNOWN;
    return PreservedAnalyses::all();
  }
  
  auto &SE = AM.getResult<ScalarEvolutionAnalysis>(F);
  auto &TTI = AM.getResult<TargetIRAnalysis>(F);
  
  auto &AC = AM.getResult<AssumptionAnalysis>(F);
  auto &ORE = AM.getResult<OptimizationRemarkEmitterAnalysis>(F);
  SmallVector<Loop *, 2> FIRDWillTransformLoops;
  Loop *DSPIDotprodWillTransformLoop = nullptr;
  LoopAnalysisManager *LAM = nullptr;
  if (auto *LAMProxy = AM.getCachedResult<LoopAnalysisManagerFunctionProxy>(F))
    LAM = &LAMProxy->getManager();

  auto &MAMProxy = AM.getResult<ModuleAnalysisManagerFunctionProxy>(F);
  ProfileSummaryInfo *PSI =
      MAMProxy.getCachedResult<ProfileSummaryAnalysis>(*F.getParent());
  auto *BFI = (PSI && PSI->hasProfileSummary())
                  ? &AM.getResult<BlockFrequencyAnalysis>(F)
                  : nullptr;

  bool Changed = false;

  // The unroller requires loops to be in simplified form, and also needs LCSSA.
  // Since simplification may add new inner loops, it has to run before the
  // legality and profitability checks. This means running the loop unroller
  // will simplify all loops, regardless of whether anything end up being
  // unrolled.
  for (const auto &L : LI) {
    Changed |=
        simplifyLoop(L, &DT, &LI, &SE, &AC, nullptr, false /* PreserveLCSSA */);
    Changed |= formLCSSARecursively(*L, DT, &LI, &SE);
  }

  // Add the loop nests in the reverse order of LoopInfo. See method
  // declaration.
  SmallPriorityWorklist<Loop *, 4> Worklist;
  appendLoopsToWorklist(LI, Worklist);

  while (!Worklist.empty()) {
    Loop *remainderLoop = nullptr;
    // Because the LoopInfo stores the loops in RPO, we walk the worklist
    // from back to front so that we work forward across the CFG, which
    // for unrolling is only needed to get optimization remarks emitted in
    // a forward order.
    Loop &L = *Worklist.pop_back_val();
    if (currentUnrollType == UnrollType::INT16_DSPS_FIRD) {
      if (!checkDspsInt16FirdUnrollPattern(L)) {
        continue;
      }
      FIRDWillTransformLoops.push_back(&L);
    }
    if (currentUnrollType == UnrollType::INT16_DSPI_DOTPROD || currentUnrollType == UnrollType::INT8_DSPI_DOTPROD) {
      if (!checkDspiInt16DotprodUnrollPattern(L)) {
        continue;
      }
      DSPIDotprodWillTransformLoop = &L;
    }
    if (currentUnrollType == UnrollType::INT16_DSPM_MULT || currentUnrollType == UnrollType::F32_DSPS_WIND_BLACKMAN || currentUnrollType == UnrollType::F32_DSPM_MULT || currentUnrollType == UnrollType::F32_DSPM_MULT_EX || currentUnrollType == UnrollType::F32_DSPI_DOTPROD || currentUnrollType == UnrollType::F32_DSPM_ADD) {
      if (!L.isInnermost())
        continue;
      DSPIDotprodWillTransformLoop = &L;
    }
    if (currentUnrollType == UnrollType::F32_DSPI_CONV || currentUnrollType == UnrollType::F32_DSPS_FFT2R){
      if (!L.isInnermost())
        continue;
      FIRDWillTransformLoops.push_back(&L);
    }
    if (currentUnrollType == UnrollType::F32_DSPS_BIT_REV_FC32){
      if (L.getLoopDepth() != 1)
        continue;
      FIRDWillTransformLoops.push_back(&L);
    }
#ifndef NDEBUG
    Loop *ParentL = L.getParentLoop();
#endif

    // Check if the profile summary indicates that the profiled application
    // has a huge working set size, in which case we disable peeling to avoid
    // bloating it further.

    std::string LoopName = std::string(L.getName());
    // The API here is quite complex to call and we allow to select some
    // flavors of unrolling during construction time (by setting UnrollOpts).
    // LoopUnrollResult Result = tryToUnrollLoop(
    //     &L, DT, &LI, SE, TTI, AC, ORE, BFI, PSI);
    LoopUnrollResult Result = UnrollLoop(
        &L,
        {/*Count*/ unroll_count, /*Force*/ force, /*Runtime*/ runtime,
         /*AllowExpensiveTripCount*/ true,
         /*UnrollRemainder*/ true, true},
        &LI, &SE, &DT, &AC, &TTI, /*ORE*/ &ORE, true);
    Changed |= Result != LoopUnrollResult::Unmodified;

    // The parent must not be damaged by unrolling!
#ifndef NDEBUG
    if (Result != LoopUnrollResult::Unmodified && ParentL)
      ParentL->verifyLoop();
#endif

    // Clear any cached analysis results for L if we removed it completely.
    if (LAM && Result == LoopUnrollResult::FullyUnrolled)
      LAM->clear(L, LoopName);
    if (Result != LoopUnrollResult::Unmodified &&
        currentUnrollType == UnrollType::INT16_DSPS_DOTPROD) {
      postUnrollDspsInt16Dotprod(F, L, unroll_count);
    } else if (Result != LoopUnrollResult::Unmodified && isMathType(F)) {
      postUnrollInt16MathType(F, L, unroll_count);
    } 
  }

  if (currentUnrollType == UnrollType::INT16_DSPS_FIRD) {
    postUnrollDspsInt16FIRD(F, FIRDWillTransformLoops, unroll_count, LI);
  }
  else if (currentUnrollType == UnrollType::INT16_DSPI_DOTPROD) {
    postUnrollDspiInt16Dotprod(F, DSPIDotprodWillTransformLoop, unroll_count,
                               LI);
  }
  else if (currentUnrollType == UnrollType::INT8_DSPI_DOTPROD) {
    postUnrollDspiInt8Dotprod(F, DSPIDotprodWillTransformLoop, unroll_count,
                               LI);
  }
  else if (currentUnrollType == UnrollType::INT16_DSPM_MULT) {
    postUnrollDspmInt16Mult(F, DSPIDotprodWillTransformLoop, unroll_count,SE);
  }
  else if (currentUnrollType == UnrollType::F32_DSPI_DOTPROD) {
    if(DSPIMatrixSizeOpt == DSPIMatrixSize::SIZE_8X8 || DSPIMatrixSizeOpt == DSPIMatrixSize::SIZE_16X16) {
      postUnrollDspiF32Dotprod(F, DSPIDotprodWillTransformLoop, unroll_count,
                               LI);
    }
    else if(DSPIMatrixSizeOpt == DSPIMatrixSize::SIZE_32X32 || DSPIMatrixSizeOpt == DSPIMatrixSize::SIZE_64X64) {
      postUnrollDspiF32DotprodVariables(F, DSPIDotprodWillTransformLoop, unroll_count,
                               LI);
    }
  }
  else if (currentUnrollType == UnrollType::F32_DSPM_ADD){
    postUnrollDspmF32Add(F, DSPIDotprodWillTransformLoop, unroll_count, LI);
  } 
  else if (currentUnrollType == UnrollType::F32_DSPM_MULT){
    postUnrollDspmF32Mult(F, DSPIDotprodWillTransformLoop, unroll_count);
  }
  else if (currentUnrollType == UnrollType::F32_DSPM_MULT_EX){
    postUnrollDspmF32MultEx(F, DSPIDotprodWillTransformLoop, unroll_count);
  }
  else if (currentUnrollType == UnrollType::F32_DSPS_WIND_BLACKMAN){
    postUnrollDspsWindBlackmanF32(F, DSPIDotprodWillTransformLoop, unroll_count);
  }
  else if (currentUnrollType == UnrollType::F32_DSPI_CONV){
    if(DSPIMatrixSizeOpt == DSPIMatrixSize::SIZE_8X8 || DSPIMatrixSizeOpt == DSPIMatrixSize::SIZE_16X16){
      postUnrollDspiConvF32(F,FIRDWillTransformLoops, unroll_count,LI);
    }
  }
  else if (currentUnrollType == UnrollType::F32_DSPS_FFT2R){
    if(DSPSFft2rFc32NOpt == DSPSFft2rFc32N::N_64 || DSPSFft2rFc32NOpt == DSPSFft2rFc32N::N_128){
      // postUnrollDspsFft2rFc32(F, FIRDWillTransformLoops, unroll_count,LI);
      ;
    }
    else if(DSPSFft2rFc32NOpt == DSPSFft2rFc32N::N_256 || DSPSFft2rFc32NOpt == DSPSFft2rFc32N::N_512 || DSPSFft2rFc32NOpt == DSPSFft2rFc32N::N_1024){
      postUnrollDspsFft2rFc32(F, FIRDWillTransformLoops, unroll_count,LI);
    }
  }
  else if (currentUnrollType == UnrollType::F32_DSPS_BIT_REV_FC32){
    postUnrollDspsBitRevFc32(F, FIRDWillTransformLoops, unroll_count,LI);
  }
  if (!Changed)
    return PreservedAnalyses::all();
  // PrintDebugFunction(F);
  return getLoopPassPreservedAnalyses();
}

PreservedAnalyses
RISCVIntLoopUnrollAndRemainderPass::run(Function &F,
                                        FunctionAnalysisManager &AM) {
  if (!EnableRISCVIntLoopUnrollAndRemainder)
    return PreservedAnalyses::all();
  addnoalias(F);
  PreservedAnalyses PA = runLoopUnrollPass(F, AM);


  return PreservedAnalyses::all();
}
