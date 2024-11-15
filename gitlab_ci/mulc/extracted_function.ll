; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_mulc_f32_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, i32 noundef %len, float noundef %C, i32 noundef %step_in, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp413 = icmp sgt i32 %len, 0
  br i1 %cmp413, label %for.body, label %return

for.body:                                         ; preds = %for.body, %for.cond.preheader
  %i.014 = phi i32 [ %inc, %for.body ], [ 0, %for.cond.preheader ]
  %mul = mul nsw i32 %i.014, %step_in
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %mul
  %0 = load float, ptr %arrayidx, align 4, !tbaa !4
  %mul5 = fmul float %0, %C
  %mul6 = mul nsw i32 %i.014, %step_out
  %arrayidx7 = getelementptr inbounds float, ptr %output, i32 %mul6
  store float %mul5, ptr %arrayidx7, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.014, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !8

return:                                           ; preds = %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ]
  ret i32 %retval.0
}
