; ModuleID = 'after_customlicm.ll'
source_filename = "after_customlicm.ll"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

define dso_local noundef i32 @dsps_biquad_f32_ansi(ptr noalias nocapture noundef readonly %input, ptr noalias nocapture noundef writeonly %output, i32 noundef %len, ptr noalias nocapture noundef readonly %coef, ptr noalias nocapture noundef %w) local_unnamed_addr {
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.cond.preheader, label %for.body.lr.ph.clone

for.cond.preheader:                               ; preds = %entry
  %cmp30 = icmp sgt i32 %len, 0
  br i1 %cmp30, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %arrayidx1 = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3 = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4 = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7 = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10 = getelementptr inbounds float, ptr %coef, i32 2
  %.pre = load float, ptr %w, align 4
  %.pre32 = load float, ptr %arrayidx4, align 4
  %1 = load float, ptr %arrayidx1, align 4
  %2 = load float, ptr %arrayidx3, align 4
  %3 = load float, ptr %coef, align 4
  %4 = load float, ptr %arrayidx7, align 4
  %5 = load float, ptr %arrayidx10, align 4
  %6 = load float, ptr %w, align 4
  %7 = fneg float %1
  %8 = fneg float %2
  br label %for.body

if.end:                                           ; preds = %for.body.clone, %for.cond.cleanup, %for.cond.preheader
  ret i32 0

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %9 = phi float [ %.pre, %for.body.lr.ph ], [ %13, %for.body ]
  %10 = phi float [ %.pre32, %for.body.lr.ph ], [ %9, %for.body ]
  %i.031 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.031
  %11 = load float, ptr %arrayidx, align 4
  %12 = tail call float @llvm.fmuladd.f32(float %7, float %9, float %11)
  %13 = tail call float @llvm.fmuladd.f32(float %8, float %10, float %12)
  %mul9 = fmul float %9, %4
  %14 = tail call float @llvm.fmuladd.f32(float %3, float %13, float %mul9)
  %15 = tail call float @llvm.fmuladd.f32(float %5, float %10, float %14)
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %i.031
  store float %15, ptr %arrayidx12, align 4
  %inc = add nuw nsw i32 %i.031, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body

for.cond.cleanup:                                 ; preds = %for.body
  store float %6, ptr %arrayidx4, align 4
  store float %13, ptr %w, align 4
  br label %if.end

for.body.lr.ph.clone:                             ; preds = %entry
  %arrayidx1.clone = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3.clone = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4.clone = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7.clone = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10.clone = getelementptr inbounds float, ptr %coef, i32 2
  %.pre.clone = load float, ptr %w, align 4
  %.pre32.clone = load float, ptr %arrayidx4.clone, align 4
  br label %for.body.clone

for.body.clone:                                   ; preds = %for.body.clone, %for.body.lr.ph.clone
  %16 = phi float [ %.pre32.clone, %for.body.lr.ph.clone ], [ %28, %for.body.clone ]
  %17 = phi float [ %.pre.clone, %for.body.lr.ph.clone ], [ %22, %for.body.clone ]
  %i.031.clone = phi i32 [ 0, %for.body.lr.ph.clone ], [ %inc.clone, %for.body.clone ]
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %i.031.clone
  %18 = load float, ptr %arrayidx.clone, align 4
  %19 = load float, ptr %arrayidx1.clone, align 4
  %neg.clone = fneg float %19
  %20 = tail call float @llvm.fmuladd.f32(float %neg.clone, float %17, float %18)
  %21 = load float, ptr %arrayidx3.clone, align 4
  %neg5.clone = fneg float %21
  %22 = tail call float @llvm.fmuladd.f32(float %neg5.clone, float %16, float %20)
  %23 = load float, ptr %coef, align 4
  %24 = load float, ptr %arrayidx7.clone, align 4
  %mul9.clone = fmul float %17, %24
  %25 = tail call float @llvm.fmuladd.f32(float %23, float %22, float %mul9.clone)
  %26 = load float, ptr %arrayidx10.clone, align 4
  %27 = tail call float @llvm.fmuladd.f32(float %26, float %16, float %25)
  %arrayidx12.clone = getelementptr inbounds float, ptr %output, i32 %i.031.clone
  store float %27, ptr %arrayidx12.clone, align 4
  %28 = load float, ptr %w, align 4
  store float %28, ptr %arrayidx4.clone, align 4
  store float %22, ptr %w, align 4
  %inc.clone = add nuw nsw i32 %i.031.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %if.end, label %for.body.clone
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
