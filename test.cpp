// static void addCommonOptimizationPasses(Function &F) {
//   // Create function-level pass manager
//   legacy::FunctionPassManager FPM(F.getParent());
//   FPM.add(createLoopDataPrefetchPass());
//   // if (currentUnrollType == UnrollType::CORR || currentUnrollType == UnrollType::FIRD) {
//     FPM.add(createLoopStrengthReducePass());
//   // }
//   // Add basic optimization passes
//   FPM.add(createPromoteMemoryToRegisterPass());
//   // if(currentUnrollType == UnrollType::CONV_CCORR || currentUnrollType == UnrollType::FIRD){
//     FPM.add(createEarlyCSEPass(true));
//   // }
  
//   FPM.add(createReassociatePass());          // Reassociate expressions
//   FPM.add(createGVNPass());                  // Global Value Numbering
//   FPM.add(createCFGSimplificationPass());    // Simplify control flow graph
//   FPM.add(createLoopRotatePass());
//   FPM.add(createLoopSimplifyPass());        // Simplify loops
//   FPM.add(createLICMPass());                // Loop Invariant Code Motion
  
//   // Add SimplifyCFG pass with common options
//   FPM.add(createCFGSimplificationPass(
//       SimplifyCFGOptions()
//           .bonusInstThreshold(1)              // Set instruction bonus threshold
//           .forwardSwitchCondToPhi(true)      // Allow forwarding switch conditions to phi
//           .convertSwitchToLookupTable(true)   // Allow converting switch to lookup table
//           .needCanonicalLoops(false)          // Don't require canonical loop form
//           .hoistCommonInsts(true)            // Hoist common instructions
//           .sinkCommonInsts(true)             // Sink common instructions
//   ));

//   // Initialize and run passes
//   FPM.doInitialization();
//   FPM.run(F);
//   FPM.doFinalization();
// }
// static void addCommonOptimizationPasses(Function &F) {
//   // 创建 pass manager 和必要的分析管理器
//   LoopAnalysisManager LAM;
//   FunctionAnalysisManager FAM;
//   CGSCCAnalysisManager CGAM;
//   ModuleAnalysisManager MAM;

//   // 创建 pass builder
//   PassBuilder PB;

//   // 注册分析
//   PB.registerModuleAnalyses(MAM);
//   PB.registerCGSCCAnalyses(CGAM);
//   PB.registerFunctionAnalyses(FAM);
//   PB.registerLoopAnalyses(LAM);
//   PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);

//   // 创建函数优化 pipeline
//   FunctionPassManager FPM;

//   FPM.addPass(AggressiveInstCombinePass());
//   FPM.addPass(InstCombinePass());
//   FPM.addPass(EliminateAvailableExternallyPass());
//   FPM.addPass(GlobalDCEPass());
//   FPM.addPass(GlobalOptPass());
//   FPM.addPass(SCCPPass());
//   FPM.addPass(StripDeadPrototypesPass());
//   FPM.addPass(StripSymbolsPass());
//   FPM.addPass(ADCEPass());
//   FPM.addPass(AlignmentFromAssumptionsPass());
//   FPM.addPass(BDCEPass());
//   FPM.addPass(ConstantHoistingPass());
//   FPM.addPass(ConstraintEliminationPass());
//   FPM.addPass(CorrelatedValuePropagationPass());
//   FPM.addPass(DCEPass());
//   FPM.addPass(DeadStoreEliminationPass());
//   FPM.addPass(DFAJumpThreadingPass());
//   FPM.addPass(DivRemPairsPass());
//   FPM.addPass(EarlyCSEPass());
//   FPM.addPass(FlattenCFGPass());
//   FPM.addPass(Float2IntPass());
//   FPM.addPass(GVNPass());
//   FPM.addPass(IRCEPass());
//   FPM.addPass(IndVarSimplifyPass());
//   FPM.addPass(InferAddressSpacesPass());
//   FPM.addPass(InferAlignmentPass());
//   FPM.addPass(InstSimplifyPass());
//   FPM.addPass(LICMPass());
//   FPM.addPass(LoopBoundSplitPass());
//   FPM.addPass(LoopDataPrefetchPass());
//   FPM.addPass(LoopDeletionPass());
//   FPM.addPass(LoopDistributePass());
//   FPM.addPass(LoopFlattenPass());
//   FPM.addPass(LoopFusePass());
//   FPM.addPass(LoopIdiomRecognizePass());
//   FPM.addPass(LoopInstSimplifyPass());
//   FPM.addPass(LoopInterchangePass());
//   FPM.addPass(LoopLoadEliminationPass());
//   FPM.addPass(LoopPredicationPass());
//   // FPM.addPass(LoopRerollPass());
//   FPM.addPass(LoopRotationPass());
//   FPM.addPass(LoopSimplifyCFGPass());
//   FPM.addPass(LoopSinkPass());
//   FPM.addPass(LoopStrengthReducePass());
//   FPM.addPass(LoopUnrollPass());
//   FPM.addPass(LoopUnrollAndJamPass());
//   FPM.addPass(LoopVersioningLICMPass());
//   FPM.addPass(MemCpyOptimizerPass());
//   FPM.addPass(MergedLoadStoreMotionPass());
//   FPM.addPass(MergeICmpsPass());
//   FPM.addPass(NaryReassociatePass());
//   FPM.addPass(NewGVNPass());
//   FPM.addPass(PartiallyInlineLibCallsPass());
//   FPM.addPass(ReassociatePass());
//   FPM.addPass(SeparateConstOffsetFromGEPPass());
//   FPM.addPass(SimpleLoopUnswitchPass());
//   FPM.addPass(SinkPass());
//   FPM.addPass(SpeculativeExecutionPass());
//   FPM.addPass(SROAPass(SROAOptions::PreserveCFG));
//   FPM.addPass(StraightLineStrengthReducePass());
//   FPM.addPass(TailCallEliminationPass());
//   FPM.addPass(FixIrreduciblePass());
//   FPM.addPass(LCSSAPass());
//   FPM.addPass(LibCallsShrinkWrapPass());
//   FPM.addPass(LowerInvokePass());
//   FPM.addPass(LowerSwitchPass());
//   FPM.addPass(BreakCriticalEdgesPass());
//   FPM.addPass(PromoteMemoryToRegisterPass());
//   FPM.addPass(LoopSimplifyPass());

//   // 运行优化
//   FPM.run(F, FAM);
// }

static void addCommonOptimizationPasses(Function &F) {
  // 创建必要的分析管理器
  LoopAnalysisManager LAM;
  FunctionAnalysisManager FAM;
  CGSCCAnalysisManager CGAM;
  ModuleAnalysisManager MAM;

  // 创建 pass builder
  PassBuilder PB;

  // 注册分析
  PB.registerModuleAnalyses(MAM);
  PB.registerCGSCCAnalyses(CGAM);
  PB.registerFunctionAnalyses(FAM);
  PB.registerLoopAnalyses(LAM);
  PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);

  // 创建函数级优化 pipeline
  FunctionPassManager FPM;
  
  // 添加函数级优化 passes
  FPM.addPass(AggressiveInstCombinePass());
  FPM.addPass(InstCombinePass());
  // FPM.addPass(EliminateAvailableExternallyPass());
  // FPM.addPass(GlobalDCEPass());
  // FPM.addPass(GlobalOptPass());
  FPM.addPass(SCCPPass());
  // FPM.addPass(StripDeadPrototypesPass());
  // FPM.addPass(StripSymbolsPass());
  FPM.addPass(ADCEPass());
  FPM.addPass(AlignmentFromAssumptionsPass());
  FPM.addPass(BDCEPass());
  FPM.addPass(ConstantHoistingPass());
  FPM.addPass(ConstraintEliminationPass());
  FPM.addPass(CorrelatedValuePropagationPass());
  FPM.addPass(DCEPass());
  // FPM.addPass(DeadStoreEliminationPass());
  FPM.addPass(DFAJumpThreadingPass());
  FPM.addPass(DivRemPairsPass());
  FPM.addPass(EarlyCSEPass());
  FPM.addPass(FlattenCFGPass());
  FPM.addPass(Float2IntPass());
  FPM.addPass(GVNPass());
  FPM.addPass(IRCEPass());
  // FPM.addPass(IndVarSimplifyPass());
  FPM.addPass(InferAddressSpacesPass());
  FPM.addPass(InferAlignmentPass());
  FPM.addPass(InstSimplifyPass());
  // FPM.addPass(LICMPass());
  FPM.addPass(MemCpyOptPass());
  FPM.addPass(MergedLoadStoreMotionPass());
  FPM.addPass(MergeICmpsPass());
  FPM.addPass(NaryReassociatePass());
  FPM.addPass(NewGVNPass());
  FPM.addPass(PartiallyInlineLibCallsPass());
  FPM.addPass(ReassociatePass());
  FPM.addPass(SeparateConstOffsetFromGEPPass());
  // FPM.addPass(SimpleLoopUnswitchPass());
  // FPM.addPass(CreateSinkPass());
  FPM.addPass(SpeculativeExecutionPass());
  FPM.addPass(SROAPass(SROAOptions::PreserveCFG));
  FPM.addPass(StraightLineStrengthReducePass());
  // FPM.addPass(TailCallElimPass());
  FPM.addPass(FixIrreduciblePass());
  FPM.addPass(LCSSAPass());
  FPM.addPass(LibCallsShrinkWrapPass());
  FPM.addPass(LowerInvokePass());
  FPM.addPass(LowerSwitchPass());
  FPM.addPass(BreakCriticalEdgesPass());
  // FPM.addPass(PromoteLegacyPass());
  FPM.addPass(LoopDataPrefetchPass());
  FPM.addPass(createFunctionToLoopPassAdaptor(LoopVersioningLICMPass()));
  FPM.addPass(createFunctionToLoopPassAdaptor(LoopRotatePass()));
  FPM.addPass(createFunctionToLoopPassAdaptor(IndVarSimplifyPass()));
  FPM.addPass(createFunctionToLoopPassAdaptor(LoopDeletionPass()));
  FPM.addPass(createFunctionToLoopPassAdaptor(LoopInterchangePass()));
  FPM.addPass(createFunctionToLoopPassAdaptor(LoopStrengthReducePass()));
  // FPM.addPass(createFunctionToLoopPassAdaptor(LoopLoadEliminationPass()));
  // FPM.addPass(createFunctionToLoopPassAdaptor(LoopDistributePass()));
  // FPM.addPass(createFunctionToLoopPassAdaptor(LoopVectorizePass()));
  // FPM.addPass(createFunctionToLoopPassAdaptor(LoopUnrollPass()));
  FPM.addPass(createFunctionToLoopPassAdaptor(LoopUnrollAndJamPass()));
  // 运行函数级优化
  FPM.run(F, FAM);

  // // 获取循环信息
  // LoopInfo &LI = FAM.getResult<LoopAnalysis>(F);
  // DominatorTree &DT = FAM.getResult<DominatorTreeAnalysis>(F);
  // ScalarEvolution &SE = FAM.getResult<ScalarEvolutionAnalysis>(F);
  // AssumptionCache &AC = FAM.getResult<AssumptionAnalysis>(F);
  // TargetTransformInfo &TTI = FAM.getResult<TargetIRAnalysis>(F);
  // BlockFrequencyInfo *BFI = nullptr;
  // OptimizationRemarkEmitter &ORE = FAM.getResult<OptimizationRemarkEmitterAnalysis>(F);

  // // 为每个循环运行循环优化 passes
  // for (Loop *L : LI) {
  //   // 创建循环优化所需的分析结果
  //   // LoopStandardAnalysisResults LAR = {
  //   //   FAM.getResult<AAManager>(F),
  //   //   FAM.getResult<AssumptionAnalysis>(F),
  //   //   FAM.getResult<DominatorTreeAnalysis>(F),
  //   //   FAM.getResult<LoopAnalysis>(F),
  //   //   FAM.getResult<ScalarEvolutionAnalysis>(F),
  //   //   FAM.getResult<TargetIRAnalysis>(F),
  //   //   FAM.getResult<TargetLibraryAnalysis>(F)
  //   // };

  //   // // 创建循环pass管理器更新器
  //   // LPMUpdater Updater;
    
  //   // // 创建循环级优化 pipeline
  //   LoopPassManager LPM;

  //   // 添加循环级优化 passes
  //   // LPM.addPass(LoopSimplifyPass());
  //   // LPM.addPass(LoopRotatePass());
  //   // LPM.addPass(IndVarSimplifyPass());
  //   // LPM.addPass(LoopDeletionPass());
  //   // LPM.addPass(LoopInterchangePass());
  //   // LPM.addPass(LoopStrengthReducePass());
  //   // LPM.addPass(LoopLoadEliminationPass());
  //   // LPM.addPass(LoopDistributePass());
  //   // LPM.addPass(LoopVectorizePass());
  //   // LPM.addPass(LoopUnrollPass());
  //   // LPM.addPass(LoopUnrollAndJamPass());
  //   LPM.addPass(LoopVersioningLICMPass());
    

  //   // 运行循环级优化,传入所需的分析结果
  //   LPM.run(*L, LAM);
  // }
}