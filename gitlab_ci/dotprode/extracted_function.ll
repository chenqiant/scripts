; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_dotprode_f32_ansi(ptr nocapture noundef readonly %src1, ptr nocapture noundef readonly %src2, ptr nocapture noundef writeonly %dest, i32 noundef %len, i32 noundef %step1, i32 noundef %step2) local_unnamed_addr #0 {
entry:
  %cmp8 = icmp sgt i32 %len, 0
  br i1 %cmp8, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.body, %entry
  %acc.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %2, %for.body ]
  store float %acc.0.lcssa, ptr %dest, align 4, !tbaa !4
  ret i32 0

for.body:                                         ; preds = %for.body, %entry
  %i.010 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %acc.09 = phi float [ %2, %for.body ], [ 0.000000e+00, %entry ]
  %mul = mul nsw i32 %i.010, %step1
  %arrayidx = getelementptr inbounds float, ptr %src1, i32 %mul
  %0 = load float, ptr %arrayidx, align 4, !tbaa !4
  %mul1 = mul nsw i32 %i.010, %step2
  %arrayidx2 = getelementptr inbounds float, ptr %src2, i32 %mul1
  %1 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %2 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %acc.09)
  %inc = add nuw nsw i32 %i.010, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !8
}
