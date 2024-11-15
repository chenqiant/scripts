; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_biquad_f32_ansi(ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len, ptr nocapture noundef readonly %coef, ptr nocapture noundef %w) local_unnamed_addr #0 {
entry:
  %cmp30 = icmp sgt i32 %len, 0
  br i1 %cmp30, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %arrayidx1 = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3 = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4 = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7 = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10 = getelementptr inbounds float, ptr %coef, i32 2
  %.pre = load float, ptr %w, align 4, !tbaa !4
  %.pre32 = load float, ptr %arrayidx4, align 4, !tbaa !4
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret i32 0

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %0 = phi float [ %.pre32, %for.body.lr.ph ], [ %12, %for.body ]
  %1 = phi float [ %.pre, %for.body.lr.ph ], [ %6, %for.body ]
  %i.031 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.031
  %2 = load float, ptr %arrayidx, align 4, !tbaa !4
  %3 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %neg = fneg float %3
  %4 = tail call float @llvm.fmuladd.f32(float %neg, float %1, float %2)
  %5 = load float, ptr %arrayidx3, align 4, !tbaa !4
  %neg5 = fneg float %5
  %6 = tail call float @llvm.fmuladd.f32(float %neg5, float %0, float %4)
  %7 = load float, ptr %coef, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx7, align 4, !tbaa !4
  %mul9 = fmul float %1, %8
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %6, float %mul9)
  %10 = load float, ptr %arrayidx10, align 4, !tbaa !4
  %11 = tail call float @llvm.fmuladd.f32(float %10, float %0, float %9)
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %i.031
  store float %11, ptr %arrayidx12, align 4, !tbaa !4
  %12 = load float, ptr %w, align 4, !tbaa !4
  store float %12, ptr %arrayidx4, align 4, !tbaa !4
  store float %6, ptr %w, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.031, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !8
}
