//===-- RISCVESPAccelOptr.cpp - RISC-V dotprod optimize pass
//----------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This pass optimizes dot product operations for the RISC-V architecture.
// It identifies and transforms dot product patterns in loops, utilizing
// RISC-V specific instructions to enhance dot product performance.
// Key optimizations include:
// 1. Identifying dot product computation patterns
// 2. Utilizing esp.lp.setup instruction for hardware loop setup
// 3. add,addc,biquad,dotprod,dotprode,mul,mulc,sqrt,sub
//
//
//===----------------------------------------------------------------------===//

#include "RISCVInstrInfo.h"
#include "RISCVMachineFunctionInfo.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/CodeGen/LivePhysRegs.h"
#include "llvm/CodeGen/MachineBasicBlock.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/RegisterScavenging.h"
#include "llvm/Config/llvm-config.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Compiler.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/Format.h"
#include "llvm/Support/MathExtras.h"
#include "llvm/Support/raw_ostream.h"
#include <algorithm>
#include <cassert>
#include <cmath>
#include <cstdint>
#include <iterator>
#include <vector>

using namespace llvm;
#define DEBUG_TYPE "riscv-esp-accel-opt"

#define RISCV_ESP_ACCEL_OPTIMIZE_NAME                                          \
  "RISC-V ESP accel optimize using esp.lp.setup pass"

enum ESPAccelOptType {
  BIQUAD = 0,
  CCORR = 1,
  UNKNOWN = 2,
};

ESPAccelOptType CurrentESPAccelOptType = UNKNOWN;
namespace {
struct RISCVESPAccelOpt : public MachineFunctionPass {
  static char ID;
  const TargetInstrInfo *TII;
  MachineFunction *MF;
  // const TargetRegisterInfo *TRI;
  RISCVESPAccelOpt() : MachineFunctionPass(ID) {}

  bool runOnMachineFunction(MachineFunction &Fn) override;
  // Implement logic to detect loop header
  bool isLoopHeader(const MachineBasicBlock &MBB);

  // Implement logic to check loop length > 2
  bool shouldOptimizeLoop(const MachineBasicBlock &MBB);
  StringRef getPassName() const override {
    return RISCV_ESP_ACCEL_OPTIMIZE_NAME;
  }
  MachineBasicBlock *splitBlockBeforeInstr(MachineInstr &MI);
  bool removeRedundantInstr(MachineBasicBlock &MBB);
  bool isRedundantSLLIAdd(MachineInstr &Instr, MachineBasicBlock::iterator &MI);
  bool isMoveSafe(MachineBasicBlock::iterator I, MachineBasicBlock::iterator J);
  bool removeRedundantInstrWithLoopReg(MachineBasicBlock &MBB,
                                       unsigned LoopReg);
  bool removeRedundantInstrOfSqrt(MachineBasicBlock &MBB);
};

char RISCVESPAccelOpt::ID = 0;

} // end of anonymous namespace

INITIALIZE_PASS(RISCVESPAccelOpt, "riscv-enable-esp-opt",
                RISCV_ESP_ACCEL_OPTIMIZE_NAME, false, false)

bool RISCVESPAccelOpt::isLoopHeader(const MachineBasicBlock &MBB) {
  // A loop header usually has more than one predecessor
  if (MBB.pred_size() <= 1)
    return false;

  // Check if the block ends with a conditional branch that jumps back to itself
  const MachineInstr &LastInstr = MBB.back();
  if (LastInstr.isBranch()) {
    for (auto &Pred : MBB.predecessors()) {
      if (Pred == &MBB)
        return true;
    }
  }
  return false;
}

bool RISCVESPAccelOpt::shouldOptimizeLoop(const MachineBasicBlock &MBB) {
  // Check if there is a BNE instruction in the basic block
  for (auto &MI : MBB) {
    if (MI.getOpcode() == RISCV::BNE) {
      // Check if the operands of BNE instruction are registers a5 and a7
      if (MI.getNumOperands() >= 2 && MI.getOperand(0).isReg() &&
          MI.getOperand(1).isReg() &&
          MI.getOperand(0).getReg() == RISCV::X15 && // a5
          MI.getOperand(1).getReg() == RISCV::X17) { // a7
        return true;
      } else if (MI.getNumOperands() >= 2 && MI.getOperand(0).isReg() &&
                 MI.getOperand(1).isReg() &&
                 MI.getOperand(0).getReg() == RISCV::X6 &&
                 MI.getOperand(1).getReg() == RISCV::X28) {
        return true;
      } else if (MI.getNumOperands() >= 2 && MI.getOperand(0).isReg() &&
                 MI.getOperand(1).isReg() &&
                 MI.getOperand(0).getReg() == RISCV::X11 &&
                 MI.getOperand(1).getReg() == RISCV::X12) {
        CurrentESPAccelOptType = ESPAccelOptType::BIQUAD;
        return true;
      }
    } else if (MI.getOpcode() == RISCV::BGE) {
      if (MI.getNumOperands() >= 2 && MI.getOperand(0).isReg() &&
          MI.getOperand(1).isReg() && MI.getOperand(0).getReg() == RISCV::X16 &&
          MI.getOperand(1).getReg() == RISCV::X17) {
        return true;
      } else if (MI.getNumOperands() >= 2 && MI.getOperand(0).isReg() &&
                 MI.getOperand(1).isReg() &&
                 MI.getOperand(0).getReg() == RISCV::X5 &&
                 MI.getOperand(1).getReg() == RISCV::X17) {
        return true;
      }
    }
  }
  return false;
}

/// Split the basic block containing MI into two blocks, which are joined by
/// an unconditional branch.  Update data structures and renumber blocks to
/// account for this change and returns the newly created block.
MachineBasicBlock *RISCVESPAccelOpt::splitBlockBeforeInstr(MachineInstr &MI) {
  MachineBasicBlock *OrigBB = MI.getParent();

  // Collect liveness information at MI.
  LivePhysRegs LRs(*MF->getSubtarget().getRegisterInfo());
  LRs.addLiveOuts(*OrigBB);
  auto LivenessEnd = ++MachineBasicBlock::iterator(MI).getReverse();
  for (MachineInstr &LiveMI : make_range(OrigBB->rbegin(), LivenessEnd))
    LRs.stepBackward(LiveMI);

  // Create a new MBB for the code after the OrigBB.
  MachineBasicBlock *NewBB =
      MF->CreateMachineBasicBlock(OrigBB->getBasicBlock());
  MachineFunction::iterator MBBI = ++OrigBB->getIterator();
  MF->insert(MBBI, NewBB);

  // Splice the instructions starting with MI over to NewBB.
  NewBB->splice(NewBB->end(), OrigBB, MI, OrigBB->end());

  // Update the CFG.  All succs of OrigBB are now succs of NewBB.
  NewBB->transferSuccessors(OrigBB);

  // OrigBB branches to NewBB.
  OrigBB->addSuccessor(NewBB);

  // Update live-in information in the new block.
  MachineRegisterInfo &MRI = MF->getRegInfo();
  for (MCPhysReg L : LRs)
    if (!MRI.isReserved(L))
      NewBB->addLiveIn(L);

  // Update internal data structures to account for the newly inserted MBB.
  // This is almost the same as updateForInsertedWaterBlock, except that
  // the Water goes after OrigBB, not NewBB.
  MF->RenumberBlocks(NewBB);

  NewBB->setLabelMustBeEmitted();
  return NewBB;
}

/*
Delete redundant instruction sequence in dot product expansion:
from
        slli	a7, a7, 2
        addi	a7, a7, -4
        andi	a4, a7, -32
        add	a4, a4, a1
  fmv.w.x	fa5, zero
  addi a7, a4, 48
to
  srli	a7, a3, 3
  fmv.w.x	fa5, zero
*/
bool RISCVESPAccelOpt::isRedundantSLLIAdd(MachineInstr &Instr,
                                          MachineBasicBlock::iterator &MI) {
  // Check if first instruction is "slli a7, a7, 2"
  if (Instr.getOpcode() == RISCV::SLLI && Instr.getOperand(0).isReg() &&
      Instr.getOperand(0).getReg() == RISCV::X17 && // a7 is X17 register
      Instr.getOperand(1).isReg() &&
      Instr.getOperand(1).getReg() == RISCV::X17 &&
      Instr.getOperand(2).isImm() && Instr.getOperand(2).getImm() == 2) {

    // Check subsequent instructions
    auto NextMI = std::next(MI);
    if (NextMI == Instr.getParent()->end())
      return false;

    // Check "addi a7, a7, -4"
    if (NextMI->getOpcode() != RISCV::ADDI || !NextMI->getOperand(0).isReg() ||
        NextMI->getOperand(0).getReg() != RISCV::X17 ||
        !NextMI->getOperand(1).isReg() ||
        NextMI->getOperand(1).getReg() != RISCV::X17 ||
        !NextMI->getOperand(2).isImm() || NextMI->getOperand(2).getImm() != -4)
      return false;

    NextMI = std::next(NextMI);
    if (NextMI == Instr.getParent()->end())
      return false;

    // Check "andi a4, a7, -32"
    if (NextMI->getOpcode() != RISCV::ANDI || !NextMI->getOperand(0).isReg() ||
        NextMI->getOperand(0).getReg() != RISCV::X14 ||
        !NextMI->getOperand(1).isReg() ||
        NextMI->getOperand(1).getReg() != RISCV::X17 ||
        !NextMI->getOperand(2).isImm() || NextMI->getOperand(2).getImm() != -32)
      return false;

    NextMI = std::next(NextMI);
    if (NextMI == Instr.getParent()->end())
      return false;

    // Check "add a4, a4, a1"
    if (NextMI->getOpcode() != RISCV::ADD || !NextMI->getOperand(0).isReg() ||
        NextMI->getOperand(0).getReg() != RISCV::X14 ||
        !NextMI->getOperand(1).isReg() ||
        NextMI->getOperand(1).getReg() != RISCV::X14 ||
        !NextMI->getOperand(2).isReg() ||
        NextMI->getOperand(2).getReg() != RISCV::X11)
      return false;

    NextMI = std::next(NextMI);
    if (NextMI == Instr.getParent()->end())
      return false;

    // Check "fmv.w.x fa5, zero"
    if (NextMI->getOpcode() != RISCV::FMV_W_X ||
        !NextMI->getOperand(0).isReg() ||
        NextMI->getOperand(0).getReg() != RISCV::F15_F ||
        !NextMI->getOperand(1).isReg() ||
        NextMI->getOperand(1).getReg() != RISCV::X0)
      return false;

    NextMI = std::next(NextMI);
    if (NextMI == Instr.getParent()->end())
      return false;

    // Check "addi a7, a4, 48"
    if (NextMI->getOpcode() != RISCV::ADDI || !NextMI->getOperand(0).isReg() ||
        NextMI->getOperand(0).getReg() != RISCV::X17 ||
        !NextMI->getOperand(1).isReg() ||
        NextMI->getOperand(1).getReg() != RISCV::X14 ||
        !NextMI->getOperand(2).isImm() || NextMI->getOperand(2).getImm() != 48)
      return false;

    return true;
  }
  return false;
}

bool RISCVESPAccelOpt::removeRedundantInstr(MachineBasicBlock &MBB) {
  bool Changed = false;

  for (auto MI = MBB.begin(), ME = MBB.end(); MI != ME;) {
    MachineInstr &Instr = *MI;

    // Check if this is a redundant instruction sequence
    if (isRedundantSLLIAdd(Instr, MI)) {
      // Delete original instruction sequence
      MI = MBB.erase(MI); // Delete slli
      MI = MBB.erase(MI); // Delete addi
      MI = MBB.erase(MI); // Delete andi
      MI = MBB.erase(MI); // Delete add

      // Keep fmv.w.x
      ++MI;

      // Delete final addi
      MI = MBB.erase(MI);

      // Insert srli a7, a3, 3 at the beginning
      auto FMVInst = std::prev(MI);
      BuildMI(MBB, FMVInst, DebugLoc(), TII->get(RISCV::SRLI))
          .addReg(RISCV::X17) // a7
          .addReg(RISCV::X13) // a3
          .addImm(3);

      Changed = true;
    } else {
      ++MI;
    }
  }

  return Changed;
}

bool RISCVESPAccelOpt::removeRedundantInstrWithLoopReg(MachineBasicBlock &MBB,
                                                       unsigned LoopReg) {
  // Delete all instructions using LoopReg in MBB
  bool Changed = false;
  for (auto MI = MBB.begin(); MI != MBB.end();) {
    if (MI->getOperand(0).isReg() && MI->getOperand(0).getReg() == LoopReg) {
      MI = MBB.erase(MI); // erase() returns next valid iterator
      Changed = true;
    } else {
      ++MI; // Only increment iterator when no instruction is deleted
    }
  }
  return Changed;
}

bool RISCVESPAccelOpt::removeRedundantInstrOfSqrt(MachineBasicBlock &MBB) {
  // Delete all instructions using LoopReg in MBB
  bool Changed = false;
  for (auto MI = MBB.begin(); MI != MBB.end();) {
    if (MI->getOpcode() == RISCV::ADDI && MI->getOperand(0).isReg() &&
        MI->getOperand(0).getReg() == RISCV::X16 && // a6 is X16 register
        MI->getOperand(1).isReg() && MI->getOperand(1).getReg() == RISCV::X12 &&
        MI->getOperand(2).isImm() && MI->getOperand(2).getImm() == -16) {
      MI = MBB.erase(MI); // erase() returns next valid iterator
      Changed = true;
    } else {
      ++MI; // Only increment iterator when no instruction is deleted
    }
  }

  return Changed;
}

bool RISCVESPAccelOpt::isMoveSafe(MachineBasicBlock::iterator I,
                                  MachineBasicBlock::iterator J) {
  // Get registers defined and used by second SLLI instruction
  Register SecondDefReg = J->getOperand(0).getReg();
  Register SecondSrcReg = J->getOperand(1).getReg();

  // Check instructions between I and J
  for (auto K = std::next(I); K != J; ++K) {
    // Check if any instruction defines source register of second SLLI
    for (const MachineOperand &MO : K->operands()) {
      if (MO.isReg() && MO.isDef()) {
        Register DefReg = MO.getReg();
        if (DefReg == SecondSrcReg) {
          return false;
        }
      }
    }

    // Check if any instruction uses register that will be defined by second
    // SLLI
    for (const MachineOperand &MO : K->operands()) {
      if (MO.isReg() && MO.getReg() == SecondDefReg) {
        return false;
      }
    }
  }

  return true;
}

bool RISCVESPAccelOpt::runOnMachineFunction(MachineFunction &Fn) {

  MF = &Fn;
  LLVM_DEBUG(Fn.dump());

  TII = Fn.getSubtarget().getInstrInfo();
  bool Changed = false;
  for (auto &MBB : Fn) {
    // Remove redundant instruction combinations only once
    if (!Changed)
      Changed = removeRedundantInstr(MBB);

    // Condition to check if last inst is BNE
    if (isLoopHeader(MBB) && shouldOptimizeLoop(MBB)) {
      MachineInstr *BranchInst = nullptr;
      unsigned LoopReg = 0;

      for (auto MI = MBB.begin(); MI != MBB.end(); ++MI) {
        // Check if the instruction is a `bne`
        if (MI->getOpcode() == RISCV::BNE || MI->getOpcode() == RISCV::BGE) {
          BranchInst = &*MI;
          LoopReg =
              MI->getOperand(1).getReg(); // Get the register used in `bne`
          break;
        }
      }

      if (BranchInst) {
        // Remove the `bne` instruction
        BranchInst->eraseFromParent();

        MachineInstr *LastInstr = &(MBB.back()); // Get the last instruction

        // Assert that LastInstr is an ADDI instruction
        assert((LastInstr->getOpcode() == RISCV::ADDI ||
                LastInstr->getOpcode() == RISCV::FSGNJ_S) &&
               "Last instruction must be an ADDI");
        MachineBasicBlock *NewMBB = splitBlockBeforeInstr(*LastInstr);

        // Insert `esp.lp.setup` at the start of the MBB
        auto InsertPos = MBB.getPrevNode()->end();
        MachineInstr *ESP_LP_SETUP =
            BuildMI(*MBB.getPrevNode(), InsertPos, DebugLoc(),
                    TII->get(RISCV::ESP_LP_SETUP))
                .addImm(0)       // Immediate value, set as needed
                .addReg(LoopReg) // Register to be used in `esp.lp.setup`
                .addMBB(
                    NewMBB); // Loop end label (use correct MBB for loop end)
        if (CurrentESPAccelOptType == ESPAccelOptType::BIQUAD) {
          Changed = true;
          return Changed;
        } else if (removeRedundantInstrWithLoopReg(*MBB.getPrevNode(),
                                                   LoopReg)) {
          // Count the number of fmadd.s, fmul.s and fsub.s instructions
          int fmaddCount = 0;
          int fmulCount = 0;
          int fsubCount = 0;
          int faddCount = 0;
          for (auto &MI : MBB) {
            if (MI.getOpcode() == RISCV::FMADD_S)
              fmaddCount++;
            else if (MI.getOpcode() == RISCV::FMUL_S)
              fmulCount++;
            else if (MI.getOpcode() == RISCV::FSUB_S)
              fsubCount++;
            else if (MI.getOpcode() == RISCV::FADD_S)
              faddCount++;
          }

          // Calculate immediate value with base 2
          int imm = 0;
          if (fmaddCount > 0)
            imm = (int)(log2(fmaddCount));
          else if (fmulCount > 0)
            imm = (int)(log2(fmulCount));
          else if (fsubCount > 0)
            imm = (int)(log2(fsubCount));
          else if (faddCount > 0)
            imm = (int)(log2(faddCount));
          else
            imm = 3; // Default value

          BuildMI(*MBB.getPrevNode(), ESP_LP_SETUP, DebugLoc(),
                  TII->get(RISCV::SRLI))
              .addReg(LoopReg)    // a7
              .addReg(RISCV::X13) // a3
              .addImm(imm);
        } else if (removeRedundantInstrOfSqrt(*MBB.getPrevNode())) {
          BuildMI(*MBB.getPrevNode(), ESP_LP_SETUP, DebugLoc(),
                  TII->get(RISCV::SRLI))
              .addReg(LoopReg)    // a7
              .addReg(RISCV::X12) // a2
              .addImm(4);
        }
        LLVM_DEBUG(Fn.dump());
        Changed = true;
      }
    }
    for (auto MI = MBB.begin(); MI != MBB.end(); ++MI) {
      if (MI->getOpcode() == RISCV::SLLI) {
        // Get register defined by current SLLI instruction
        Register DefReg = MI->getOperand(0).getReg();

        // Look forward for other SLLI instructions
        auto J = std::next(MI);
        while (J != MBB.end()) {
          if (J->getOpcode() == RISCV::SLLI && isMoveSafe(MI, J)) {
            MBB.splice(std::next(MI), &MBB, J);
            Changed = true;
            break;
          }
          ++J;
        }
      }
    }
  }

  return Changed;
}

/// createRISCVESPAccelOptPass - returns an instance of the
/// dotprod opt pass.
FunctionPass *llvm::createRISCVESPAccelOptPass() {
  return new RISCVESPAccelOpt();
}
