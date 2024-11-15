; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_dotprod_f32_ansi(ptr nocapture noundef readonly %src1, ptr nocapture noundef readonly %src2, ptr nocapture noundef writeonly %dest, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %len, 0
  br i1 %cmp6, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.body, %entry
  %acc.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %2, %for.body ]
  store float %acc.0.lcssa, ptr %dest, align 4, !tbaa !4
  ret i32 0

for.body:                                         ; preds = %for.body, %entry
  %i.08 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %acc.07 = phi float [ %2, %for.body ], [ 0.000000e+00, %entry ]
  %arrayidx = getelementptr inbounds float, ptr %src1, i32 %i.08
  %0 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx1 = getelementptr inbounds float, ptr %src2, i32 %i.08
  %1 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %2 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %acc.07)
  %inc = add nuw nsw i32 %i.08, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !8
}
