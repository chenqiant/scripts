; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_corr_f32_ansi(ptr noundef readonly %Signal, i32 noundef %siglen, ptr noundef readonly %Pattern, i32 noundef %patlen, ptr noundef writeonly %dest) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %Signal, null
  %cmp1 = icmp eq ptr %Pattern, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %dest, null
  %or.cond33 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %siglen, %patlen
  %or.cond34 = or i1 %cmp7, %or.cond33
  br i1 %or.cond34, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %sub = sub nsw i32 %siglen, %patlen
  %cmp1235.not = icmp eq i32 %patlen, 0
  br i1 %cmp1235.not, label %for.cond11.preheader.preheader, label %for.cond11.preheader.us

for.cond11.preheader.preheader:                   ; preds = %for.cond.preheader
  %0 = shl i32 %siglen, 2
  %1 = add i32 %0, 4
  tail call void @llvm.memset.p0.i32(ptr nonnull align 4 %dest, i8 0, i32 %1, i1 false), !tbaa !4
  br label %return

for.cond11.preheader.us:                          ; preds = %for.cond11.for.cond.cleanup13_crit_edge.us, %for.cond.preheader
  %n.038.us = phi i32 [ %inc18.us, %for.cond11.for.cond.cleanup13_crit_edge.us ], [ 0, %for.cond.preheader ]
  %2 = getelementptr float, ptr %Signal, i32 %n.038.us
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us, %for.cond11.preheader.us
  %m.037.us = phi i32 [ 0, %for.cond11.preheader.us ], [ %inc.us, %for.body14.us ]
  %k_corr.036.us = phi float [ 0.000000e+00, %for.cond11.preheader.us ], [ %5, %for.body14.us ]
  %arrayidx.us = getelementptr float, ptr %2, i32 %m.037.us
  %3 = load float, ptr %arrayidx.us, align 4, !tbaa !4
  %arrayidx15.us = getelementptr inbounds float, ptr %Pattern, i32 %m.037.us
  %4 = load float, ptr %arrayidx15.us, align 4, !tbaa !4
  %5 = tail call float @llvm.fmuladd.f32(float %3, float %4, float %k_corr.036.us)
  %inc.us = add nuw i32 %m.037.us, 1
  %exitcond.not = icmp eq i32 %inc.us, %patlen
  br i1 %exitcond.not, label %for.cond11.for.cond.cleanup13_crit_edge.us, label %for.body14.us, !llvm.loop !8

for.cond11.for.cond.cleanup13_crit_edge.us:       ; preds = %for.body14.us
  %arrayidx16.us = getelementptr inbounds float, ptr %dest, i32 %n.038.us
  store float %5, ptr %arrayidx16.us, align 4, !tbaa !4
  %inc18.us = add nuw i32 %n.038.us, 1
  %cmp10.not.us.not = icmp ult i32 %n.038.us, %sub
  br i1 %cmp10.not.us.not, label %for.cond11.preheader.us, label %return, !llvm.loop !10

return:                                           ; preds = %for.cond11.for.cond.cleanup13_crit_edge.us, %for.cond11.preheader.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond11.preheader.preheader ], [ 0, %for.cond11.for.cond.cleanup13_crit_edge.us ]
  ret i32 %retval.0
}
