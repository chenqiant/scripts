; ModuleID = 'after_customlicm.ll'
source_filename = "after_customlicm.ll"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

define dso_local noundef i32 @dsps_dotprode_f32_ansi(ptr noalias nocapture noundef readonly %src1, ptr noalias nocapture noundef readonly %src2, ptr noalias nocapture noundef writeonly %dest, i32 noundef %len, i32 noundef %step1, i32 noundef %step2) local_unnamed_addr {
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.cond.preheader1, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp47110 = icmp sgt i32 %len, 0
  br i1 %cmp47110, label %for.body.clone, label %if.end

if.end:                                           ; preds = %for.end37, %for.body.clone, %for.cond.preheader
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %add44, %for.end37 ], [ %31, %for.body.clone ]
  store float %acc.0.lcssa, ptr %dest, align 4
  ret i32 0

for.cond.preheader1:                              ; preds = %entry
  %sub = add nsw i32 %len, -7
  %cmp1113 = icmp ugt i32 %len, 7
  br i1 %cmp1113, label %for.body.preheader, label %for.cond31.preheader

for.body.preheader:                               ; preds = %for.cond.preheader1
  %1 = and i32 %len, 2147483640
  br label %for.body

for.cond31.preheader:                             ; preds = %for.body, %for.cond.preheader1
  %acc0.0.lcssa = phi float [ %19, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc1.0.lcssa = phi float [ %20, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc2.0.lcssa = phi float [ %21, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc3.0.lcssa = phi float [ %22, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc4.0.lcssa = phi float [ %23, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc5.0.lcssa = phi float [ %24, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc6.0.lcssa = phi float [ %25, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %i.0.lcssa = phi i32 [ 0, %for.cond.preheader1 ], [ %1, %for.body ]
  %cmp32132 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp32132, label %for.body33, label %for.end37

for.body:                                         ; preds = %for.body, %for.body.preheader
  %i.0122 = phi i32 [ %add30, %for.body ], [ 0, %for.body.preheader ]
  %acc.09 = phi float [ %18, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc1 = phi float [ %19, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc2 = phi float [ %20, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc3 = phi float [ %21, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc4 = phi float [ %22, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc5 = phi float [ %23, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc6 = phi float [ %24, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc7 = phi float [ %25, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %mul = mul nsw i32 %i.0122, %step1
  %mul1 = mul nsw i32 %i.0122, %step2
  %add1 = or disjoint i32 %i.0122, 1
  %add2 = or disjoint i32 %i.0122, 2
  %add3 = or disjoint i32 %i.0122, 3
  %add4 = or disjoint i32 %i.0122, 4
  %add5 = or disjoint i32 %i.0122, 5
  %add6 = or disjoint i32 %i.0122, 6
  %add7 = or disjoint i32 %i.0122, 7
  %arrayidx = getelementptr inbounds float, ptr %src1, i32 %mul
  %arrayidx2 = getelementptr inbounds float, ptr %src2, i32 %mul1
  %arrayidx1_0 = getelementptr inbounds float, ptr %src1, i32 %add1
  %arrayidx1_1 = getelementptr inbounds float, ptr %src2, i32 %add1
  %arrayidx2_0 = getelementptr inbounds float, ptr %src1, i32 %add2
  %arrayidx2_1 = getelementptr inbounds float, ptr %src2, i32 %add2
  %arrayidx3_0 = getelementptr inbounds float, ptr %src1, i32 %add3
  %arrayidx3_1 = getelementptr inbounds float, ptr %src2, i32 %add3
  %arrayidx4_0 = getelementptr inbounds float, ptr %src1, i32 %add4
  %arrayidx4_1 = getelementptr inbounds float, ptr %src2, i32 %add4
  %arrayidx5_0 = getelementptr inbounds float, ptr %src1, i32 %add5
  %arrayidx5_1 = getelementptr inbounds float, ptr %src2, i32 %add5
  %arrayidx6_0 = getelementptr inbounds float, ptr %src1, i32 %add6
  %arrayidx6_1 = getelementptr inbounds float, ptr %src2, i32 %add6
  %arrayidx7_0 = getelementptr inbounds float, ptr %src1, i32 %add7
  %arrayidx7_1 = getelementptr inbounds float, ptr %src2, i32 %add7
  %2 = load float, ptr %arrayidx, align 4
  %3 = load float, ptr %arrayidx2, align 4
  %4 = load float, ptr %arrayidx1_0, align 4
  %5 = load float, ptr %arrayidx1_1, align 4
  %6 = load float, ptr %arrayidx2_0, align 4
  %7 = load float, ptr %arrayidx2_1, align 4
  %8 = load float, ptr %arrayidx3_0, align 4
  %9 = load float, ptr %arrayidx3_1, align 4
  %10 = load float, ptr %arrayidx4_0, align 4
  %11 = load float, ptr %arrayidx4_1, align 4
  %12 = load float, ptr %arrayidx5_0, align 4
  %13 = load float, ptr %arrayidx5_1, align 4
  %14 = load float, ptr %arrayidx6_0, align 4
  %15 = load float, ptr %arrayidx6_1, align 4
  %16 = load float, ptr %arrayidx7_0, align 4
  %17 = load float, ptr %arrayidx7_1, align 4
  %18 = tail call float @llvm.fmuladd.f32(float %2, float %3, float %acc.09)
  %19 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %acc1)
  %20 = tail call float @llvm.fmuladd.f32(float %6, float %7, float %acc2)
  %21 = tail call float @llvm.fmuladd.f32(float %8, float %9, float %acc3)
  %22 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %acc4)
  %23 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %acc5)
  %24 = tail call float @llvm.fmuladd.f32(float %14, float %15, float %acc6)
  %25 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %acc7)
  %add30 = add nuw nsw i32 %i.0122, 8
  %cmp1 = icmp slt i32 %add30, %sub
  br i1 %cmp1, label %for.body, label %for.cond31.preheader

for.body33:                                       ; preds = %for.body33, %for.cond31.preheader
  %i.01033 = phi i32 [ %inc33, %for.body33 ], [ %i.0.lcssa, %for.cond31.preheader ]
  %acc.0933 = phi float [ %28, %for.body33 ], [ %acc0.0.lcssa, %for.cond31.preheader ]
  %mul33 = mul nsw i32 %i.01033, %step1
  %arrayidx33 = getelementptr inbounds float, ptr %src1, i32 %mul33
  %26 = load float, ptr %arrayidx33, align 4
  %mul133 = mul nsw i32 %i.01033, %step2
  %arrayidx233 = getelementptr inbounds float, ptr %src2, i32 %mul133
  %27 = load float, ptr %arrayidx233, align 4
  %28 = tail call float @llvm.fmuladd.f32(float %26, float %27, float %acc.0933)
  %inc33 = add nuw nsw i32 %i.01033, 1
  %exitcond.not33 = icmp eq i32 %inc33, %len
  br i1 %exitcond.not33, label %for.end37, label %for.body33

for.end37:                                        ; preds = %for.body33, %for.cond31.preheader
  %acc0.1.lcssa = phi float [ %28, %for.body33 ], [ %acc0.0.lcssa, %for.cond31.preheader ]
  %add38 = fadd float %acc0.0.lcssa, %acc0.1.lcssa
  %add39 = fadd float %acc1.0.lcssa, %add38
  %add40 = fadd float %acc2.0.lcssa, %add39
  %add41 = fadd float %acc3.0.lcssa, %add40
  %add42 = fadd float %acc4.0.lcssa, %add41
  %add43 = fadd float %acc5.0.lcssa, %add42
  %add44 = fadd float %acc6.0.lcssa, %add43
  br label %if.end

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.010.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %acc.09.clone = phi float [ %31, %for.body.clone ], [ 0.000000e+00, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.010.clone, %step1
  %arrayidx.clone = getelementptr inbounds float, ptr %src1, i32 %mul.clone
  %29 = load float, ptr %arrayidx.clone, align 4
  %mul1.clone = mul nsw i32 %i.010.clone, %step2
  %arrayidx2.clone = getelementptr inbounds float, ptr %src2, i32 %mul1.clone
  %30 = load float, ptr %arrayidx2.clone, align 4
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %acc.09.clone)
  %inc.clone = add nuw nsw i32 %i.010.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %if.end, label %for.body.clone
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
