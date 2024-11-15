; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_sqrt_f32_ansi(ptr noundef readonly %input, ptr noundef writeonly %output, i32 noundef %len) local_unnamed_addr #1 {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp411 = icmp sgt i32 %len, 0
  br i1 %cmp411, label %for.body, label %return

for.body:                                         ; preds = %for.body, %for.cond.preheader
  %i.012 = phi i32 [ %inc, %for.body ], [ 0, %for.cond.preheader ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.012
  %0 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %shr.i = ashr i32 %0, 1
  %add.i = add nsw i32 %shr.i, 532365312
  %arrayidx5 = getelementptr inbounds float, ptr %output, i32 %i.012
  store i32 %add.i, ptr %arrayidx5, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.012, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !8

return:                                           ; preds = %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ]
  ret i32 %retval.0
}
