; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_mul_f32_ansi(ptr noundef readonly %input1, ptr noundef readonly %input2, ptr noundef writeonly %output, i32 noundef %len, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input1, null
  %cmp1 = icmp eq ptr %input2, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %output, null
  %or.cond20 = or i1 %or.cond, %cmp4
  br i1 %or.cond20, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp721 = icmp sgt i32 %len, 0
  br i1 %cmp721, label %for.body, label %return

for.body:                                         ; preds = %for.body, %for.cond.preheader
  %i.022 = phi i32 [ %inc, %for.body ], [ 0, %for.cond.preheader ]
  %mul = mul nsw i32 %i.022, %step1
  %arrayidx = getelementptr inbounds float, ptr %input1, i32 %mul
  %0 = load float, ptr %arrayidx, align 4, !tbaa !4
  %mul8 = mul nsw i32 %i.022, %step2
  %arrayidx9 = getelementptr inbounds float, ptr %input2, i32 %mul8
  %1 = load float, ptr %arrayidx9, align 4, !tbaa !4
  %mul10 = fmul float %0, %1
  %mul11 = mul nsw i32 %i.022, %step_out
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %mul11
  store float %mul10, ptr %arrayidx12, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.022, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !8

return:                                           ; preds = %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ]
  ret i32 %retval.0
}
