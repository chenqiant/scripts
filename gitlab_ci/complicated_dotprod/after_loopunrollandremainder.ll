; ModuleID = 'after_customlicm.ll'
source_filename = "after_customlicm.ll"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

define dso_local float @test_loop(ptr noalias nocapture noundef readonly %data1, ptr noalias nocapture noundef readonly %data2, i32 noundef %start_index, i32 noundef %end_index, i32 noundef %update1, i32 noundef %update2, float noundef %offset) local_unnamed_addr {
entry:
  %invariant.gep = getelementptr float, ptr %data1, i32 %update1
  %invariant.gep8 = getelementptr float, ptr %data2, i32 %update2
  %sub = add nsw i32 %end_index, -8
  %cmp10 = icmp slt i32 %sub, %start_index
  br i1 %cmp10, label %for.cond.preheader, label %for.body.7

for.cond.preheader:                               ; preds = %for.body.7, %entry
  %result0.0.lcssa = phi i32 [ %start_index, %entry ], [ %inc.7, %for.body.7 ]
  %result0.0.lcssa1 = phi float [ 0.000000e+00, %entry ], [ %add3.7, %for.body.7 ]
  %result0.0.lcssa2 = phi float [ 0.000000e+00, %entry ], [ %add3.6, %for.body.7 ]
  %result0.0.lcssa3 = phi float [ 0.000000e+00, %entry ], [ %add3.5, %for.body.7 ]
  %result0.0.lcssa4 = phi float [ 0.000000e+00, %entry ], [ %add3.4, %for.body.7 ]
  %result0.0.lcssa5 = phi float [ 0.000000e+00, %entry ], [ %add3.3, %for.body.7 ]
  %result0.0.lcssa6 = phi float [ 0.000000e+00, %entry ], [ %add3.2, %for.body.7 ]
  %result0.0.lcssa7 = phi float [ 0.000000e+00, %entry ], [ %add3.1, %for.body.7 ]
  %result0.0.lcssa8 = phi float [ 0.000000e+00, %entry ], [ %add3, %for.body.7 ]
  %cmp = icmp slt i32 %result0.0.lcssa, %end_index
  br i1 %cmp, label %for.body.clone, label %for.end

for.body.7:                                       ; preds = %for.body.7, %entry
  %i.012 = phi i32 [ %start_index, %entry ], [ %inc.7, %for.body.7 ]
  %result6 = phi float [ 0.000000e+00, %entry ], [ %add3.6, %for.body.7 ]
  %result5 = phi float [ 0.000000e+00, %entry ], [ %add3.5, %for.body.7 ]
  %result4 = phi float [ 0.000000e+00, %entry ], [ %add3.4, %for.body.7 ]
  %result3 = phi float [ 0.000000e+00, %entry ], [ %add3.3, %for.body.7 ]
  %result2 = phi float [ 0.000000e+00, %entry ], [ %add3.2, %for.body.7 ]
  %result1 = phi float [ 0.000000e+00, %entry ], [ %add3.1, %for.body.7 ]
  %result0 = phi float [ 0.000000e+00, %entry ], [ %add3, %for.body.7 ]
  %gep = getelementptr float, ptr %invariant.gep, i32 %i.012
  %0 = load float, ptr %gep, align 4
  %gep9 = getelementptr float, ptr %invariant.gep8, i32 %i.012
  %1 = load float, ptr %gep9, align 4
  %2 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %offset)
  %add3 = fadd float %result0, %2
  %inc = add nsw i32 %i.012, 1
  %gep.1 = getelementptr float, ptr %invariant.gep, i32 %inc
  %3 = load float, ptr %gep.1, align 4
  %gep9.1 = getelementptr float, ptr %invariant.gep8, i32 %inc
  %4 = load float, ptr %gep9.1, align 4
  %5 = tail call float @llvm.fmuladd.f32(float %3, float %4, float %offset)
  %add3.1 = fadd float %result1, %5
  %inc.1 = add nsw i32 %i.012, 2
  %gep.2 = getelementptr float, ptr %invariant.gep, i32 %inc.1
  %6 = load float, ptr %gep.2, align 4
  %gep9.2 = getelementptr float, ptr %invariant.gep8, i32 %inc.1
  %7 = load float, ptr %gep9.2, align 4
  %8 = tail call float @llvm.fmuladd.f32(float %6, float %7, float %offset)
  %add3.2 = fadd float %result2, %8
  %inc.2 = add nsw i32 %i.012, 3
  %gep.3 = getelementptr float, ptr %invariant.gep, i32 %inc.2
  %9 = load float, ptr %gep.3, align 4
  %gep9.3 = getelementptr float, ptr %invariant.gep8, i32 %inc.2
  %10 = load float, ptr %gep9.3, align 4
  %11 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %offset)
  %add3.3 = fadd float %result3, %11
  %inc.3 = add nsw i32 %i.012, 4
  %gep.4 = getelementptr float, ptr %invariant.gep, i32 %inc.3
  %12 = load float, ptr %gep.4, align 4
  %gep9.4 = getelementptr float, ptr %invariant.gep8, i32 %inc.3
  %13 = load float, ptr %gep9.4, align 4
  %14 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %offset)
  %add3.4 = fadd float %result4, %14
  %inc.4 = add nsw i32 %i.012, 5
  %gep.5 = getelementptr float, ptr %invariant.gep, i32 %inc.4
  %15 = load float, ptr %gep.5, align 4
  %gep9.5 = getelementptr float, ptr %invariant.gep8, i32 %inc.4
  %16 = load float, ptr %gep9.5, align 4
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %offset)
  %add3.5 = fadd float %result5, %17
  %inc.5 = add nsw i32 %i.012, 6
  %gep.6 = getelementptr float, ptr %invariant.gep, i32 %inc.5
  %18 = load float, ptr %gep.6, align 4
  %gep9.6 = getelementptr float, ptr %invariant.gep8, i32 %inc.5
  %19 = load float, ptr %gep9.6, align 4
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %offset)
  %add3.6 = fadd float %result6, %20
  %inc.6 = add nsw i32 %i.012, 7
  %gep.7 = getelementptr float, ptr %invariant.gep, i32 %inc.6
  %21 = load float, ptr %gep.7, align 4
  %gep9.7 = getelementptr float, ptr %invariant.gep8, i32 %inc.6
  %22 = load float, ptr %gep9.7, align 4
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %offset)
  %add3.7 = fadd float %add3.6, %23
  %inc.7 = add nsw i32 %i.012, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub
  br i1 %exitcond.not.7, label %for.cond.preheader, label %for.body.7

for.body.clone:                                   ; preds = %for.cond.preheader, %for.body.clone
  %i.012.clone = phi i32 [ %result0.0.lcssa, %for.cond.preheader ], [ %inc.clone, %for.body.clone ]
  %result.011.clone = phi float [ %result0.0.lcssa8, %for.cond.preheader ], [ %add3.clone, %for.body.clone ]
  %gep.clone = getelementptr float, ptr %invariant.gep, i32 %i.012.clone
  %24 = load float, ptr %gep.clone, align 4
  %gep9.clone = getelementptr float, ptr %invariant.gep8, i32 %i.012.clone
  %25 = load float, ptr %gep9.clone, align 4
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %offset)
  %add3.clone = fadd float %result.011.clone, %26
  %inc.clone = add nsw i32 %i.012.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %end_index
  br i1 %exitcond.not.clone, label %for.end, label %for.body.clone

for.end:                                          ; preds = %for.cond.preheader, %for.body.clone
  %result.0.lcssa = phi float [ %add3.clone, %for.body.clone ], [ %result0.0.lcssa8, %for.cond.preheader ]
  %add0 = fadd float %result0.0.lcssa1, %result.0.lcssa
  %add1 = fadd float %result0.0.lcssa2, %add0
  %add2 = fadd float %result0.0.lcssa3, %add1
  %add39 = fadd float %result0.0.lcssa4, %add2
  %add4 = fadd float %result0.0.lcssa5, %add39
  %add5 = fadd float %result0.0.lcssa6, %add4
  %add6 = fadd float %result0.0.lcssa7, %add5
  ret float %add6
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
