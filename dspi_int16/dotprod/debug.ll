; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dspm_mult_s16_ansi(ptr noalias nocapture noundef readonly %A, ptr noalias nocapture noundef readonly %B, ptr noalias nocapture noundef writeonly %C, i32 noundef %m, i32 noundef %n, i32 noundef %k, i32 noundef %shift) local_unnamed_addr #0 {
entry:
  %cmp63 = icmp sgt i32 %m, 0
  br i1 %cmp63, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %shift, -15
  %cmp261 = icmp sgt i32 %k, 0
  %shr = lshr i32 32767, %shift
  %conv = zext nneg i32 %shr to i64
  %cmp658 = icmp sgt i32 %n, 0
  %cmp18 = icmp sgt i32 %shift, 15
  %sub24 = sub nsw i32 15, %shift
  %sh_prom25 = zext nneg i32 %sub24 to i64
  %sh_prom = zext nneg i32 %sub to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %for.cond1.preheader.lr.ph
  %i.064 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc35, %for.cond.cleanup3 ]
  br i1 %cmp261, label %for.body4.lr.ph, label %for.cond.cleanup3

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  %mul = mul nsw i32 %i.064, %n
  %0 = getelementptr i16, ptr %A, i32 %mul
  %mul28 = mul nsw i32 %i.064, %k
  %1 = getelementptr i16, ptr %C, i32 %mul28
  br label %for.body4

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3, %entry
  ret i32 0

for.cond.cleanup3:                                ; preds = %for.cond.cleanup8, %for.cond1.preheader
  %inc35 = add nuw nsw i32 %i.064, 1
  %exitcond66.not = icmp eq i32 %inc35, %m
  br i1 %exitcond66.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !4

for.body4:                                        ; preds = %for.cond.cleanup8, %for.body4.lr.ph
  %j.062 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc32, %for.cond.cleanup8 ]
  %invariant.gep = getelementptr i16, ptr %B, i32 %j.062
  br i1 %cmp658, label %for.body9, label %for.cond.cleanup8

for.cond.cleanup8:                                ; preds = %for.body9, %for.body4
  %acc.0.lcssa = phi i64 [ %conv, %for.body4 ], [ %add17, %for.body9 ]
  %arrayidx23 = getelementptr i16, ptr %1, i32 %j.062
  %shr26 = ashr i64 %acc.0.lcssa, %sh_prom25
  %shl = shl i64 %acc.0.lcssa, %sh_prom
  %shr26.sink = select i1 %cmp18, i64 %shl, i64 %shr26
  %conv27 = trunc i64 %shr26.sink to i16
  store i16 %conv27, ptr %arrayidx23, align 2, !tbaa !6
  %inc32 = add nuw nsw i32 %j.062, 1
  %exitcond65.not = icmp eq i32 %inc32, %k
  br i1 %exitcond65.not, label %for.cond.cleanup3, label %for.body4, !llvm.loop !10

for.body9:                                        ; preds = %for.body9, %for.body4
  %s.060 = phi i32 [ %inc, %for.body9 ], [ 0, %for.body4 ]
  %acc.059 = phi i64 [ %add17, %for.body9 ], [ %conv, %for.body4 ]
  %arrayidx = getelementptr i16, ptr %0, i32 %s.060
  %2 = load i16, ptr %arrayidx, align 2, !tbaa !6
  %conv10 = sext i16 %2 to i32
  %mul11 = mul nsw i32 %s.060, %k
  %gep = getelementptr i16, ptr %invariant.gep, i32 %mul11
  %3 = load i16, ptr %gep, align 2, !tbaa !6
  %conv14 = sext i16 %3 to i32
  %mul15 = mul nsw i32 %conv14, %conv10
  %conv16 = sext i32 %mul15 to i64
  %add17 = add nsw i64 %acc.059, %conv16
  %inc = add nuw nsw i32 %s.060, 1
  %exitcond.not = icmp eq i32 %inc, %n
  br i1 %exitcond.not, label %for.cond.cleanup8, label %for.body9, !llvm.loop !11
}
