; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_dotprod_s16_ansi(ptr noalias nocapture noundef readonly %in_image, ptr noalias nocapture noundef readonly %filter, ptr noalias nocapture noundef writeonly %out_value, i32 noundef %count_x, i32 noundef %count_y, i32 noundef %shift) local_unnamed_addr #0 {
entry:
  %step_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 1
  %0 = load i32, ptr %step_x, align 4, !tbaa !4
  %mul = mul nsw i32 %0, %count_x
  %stride_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 3
  %1 = load i32, ptr %stride_x, align 4, !tbaa !10
  %cmp = icmp sgt i32 %mul, %1
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %step_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 2
  %2 = load i32, ptr %step_y, align 4, !tbaa !11
  %mul1 = mul nsw i32 %2, %count_y
  %stride_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 4
  %3 = load i32, ptr %stride_y, align 4, !tbaa !12
  %cmp2 = icmp sgt i32 %mul1, %3
  br i1 %cmp2, label %return, label %if.end4

if.end4:                                          ; preds = %if.end
  %step_x5 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 1
  %4 = load i32, ptr %step_x5, align 4, !tbaa !4
  %mul6 = mul nsw i32 %4, %count_x
  %stride_x7 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 3
  %5 = load i32, ptr %stride_x7, align 4, !tbaa !10
  %cmp8 = icmp sgt i32 %mul6, %5
  br i1 %cmp8, label %return, label %if.end10

if.end10:                                         ; preds = %if.end4
  %step_y11 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 2
  %6 = load i32, ptr %step_y11, align 4, !tbaa !11
  %mul12 = mul nsw i32 %6, %count_y
  %stride_y13 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 4
  %7 = load i32, ptr %stride_y13, align 4, !tbaa !12
  %cmp14 = icmp sgt i32 %mul12, %7
  br i1 %cmp14, label %return, label %if.end16

if.end16:                                         ; preds = %if.end10
  %mul20 = mul nsw i32 %2, %1
  %mul23 = mul nsw i32 %6, %5
  %cmp2476 = icmp sgt i32 %count_y, 0
  %cmp2673 = icmp sgt i32 %count_x, 0
  %or.cond = and i1 %cmp2476, %cmp2673
  br i1 %or.cond, label %for.cond25.preheader.us.preheader, label %for.cond.cleanup

for.cond25.preheader.us.preheader:                ; preds = %if.end16
  %8 = load ptr, ptr %in_image, align 4, !tbaa !13
  %9 = load ptr, ptr %filter, align 4, !tbaa !13
  br label %for.cond25.preheader.us

for.cond25.preheader.us:                          ; preds = %for.cond25.for.cond.cleanup27_crit_edge.us, %for.cond25.preheader.us.preheader
  %y.080.us = phi i32 [ %inc39.us, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ 0, %for.cond25.preheader.us.preheader ]
  %acc.079.us = phi i64 [ %add.us.lcssa, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ 0, %for.cond25.preheader.us.preheader ]
  %i_data.078.us = phi ptr [ %add.ptr.us, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ %8, %for.cond25.preheader.us.preheader ]
  %f_data.077.us = phi ptr [ %add.ptr37.us, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ %9, %for.cond25.preheader.us.preheader ]
  br label %for.body28.us.7

for.body28.us.clone:                              ; No predecessors!
  %x.075.us.clone = phi i32 [ 0, %for.cond25.preheader.us ], [ %inc.us.7, %for.body28.us.7 ]
  %acc.174.us.clone = phi i64 [ %acc.079.us, %for.cond25.preheader.us ], [ %add.us.7, %for.body28.us.7 ]
  %mul30.us.clone = mul nsw i32 %x.075.us.clone, %0
  %arrayidx.us.clone = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.clone
  %10 = load i16, ptr %arrayidx.us.clone, align 2, !tbaa !14
  %conv.us.clone = sext i16 %10 to i32
  %mul32.us.clone = mul nsw i32 %x.075.us.clone, %4
  %arrayidx33.us.clone = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.clone
  %11 = load i16, ptr %arrayidx33.us.clone, align 2, !tbaa !14
  %conv34.us.clone = sext i16 %11 to i32
  %mul35.us.clone = mul nsw i32 %conv34.us.clone, %conv.us.clone
  %conv36.us.clone = sext i32 %mul35.us.clone to i64
  %add.us.clone = add nsw i64 %acc.174.us.clone, %conv36.us.clone
  %inc.us.clone = add nuw nsw i32 %x.075.us.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.us.clone, %count_x
  br i1 %exitcond.not.clone, label %for.cond25.for.cond.cleanup27_crit_edge.us, label %for.body28.us.7, !llvm.loop !16

for.body28.us.7:                                  ; preds = %for.cond25.preheader.us, %for.body28.us.7, %for.body28.us.clone
  %x.075.us = phi i32 [ 0, %for.cond25.preheader.us ], [ %inc.us.7, %for.body28.us.7 ]
  %acc.174.us = phi i64 [ %acc.079.us, %for.cond25.preheader.us ], [ %add.us.7, %for.body28.us.7 ]
  %mul30.us = mul nsw i32 %x.075.us, %0
  %arrayidx.us = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us
  %12 = load i16, ptr %arrayidx.us, align 2, !tbaa !14
  %conv.us = sext i16 %12 to i32
  %mul32.us = mul nsw i32 %x.075.us, %4
  %arrayidx33.us = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us
  %13 = load i16, ptr %arrayidx33.us, align 2, !tbaa !14
  %conv34.us = sext i16 %13 to i32
  %mul35.us = mul nsw i32 %conv34.us, %conv.us
  %conv36.us = sext i32 %mul35.us to i64
  %add.us = add nsw i64 %acc.174.us, %conv36.us
  %inc.us = add nuw nsw i32 %x.075.us, 1
  %exitcond.not = icmp eq i32 %inc.us, %count_x
  %mul30.us.1 = mul nsw i32 %inc.us, %0
  %arrayidx.us.1 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.1
  %14 = load i16, ptr %arrayidx.us.1, align 2, !tbaa !14
  %conv.us.1 = sext i16 %14 to i32
  %mul32.us.1 = mul nsw i32 %inc.us, %4
  %arrayidx33.us.1 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.1
  %15 = load i16, ptr %arrayidx33.us.1, align 2, !tbaa !14
  %conv34.us.1 = sext i16 %15 to i32
  %mul35.us.1 = mul nsw i32 %conv34.us.1, %conv.us.1
  %conv36.us.1 = sext i32 %mul35.us.1 to i64
  %add.us.1 = add nsw i64 %add.us, %conv36.us.1
  %inc.us.1 = add nuw nsw i32 %x.075.us, 2
  %exitcond.not.1 = icmp eq i32 %inc.us.1, %count_x
  %mul30.us.2 = mul nsw i32 %inc.us.1, %0
  %arrayidx.us.2 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.2
  %16 = load i16, ptr %arrayidx.us.2, align 2, !tbaa !14
  %conv.us.2 = sext i16 %16 to i32
  %mul32.us.2 = mul nsw i32 %inc.us.1, %4
  %arrayidx33.us.2 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.2
  %17 = load i16, ptr %arrayidx33.us.2, align 2, !tbaa !14
  %conv34.us.2 = sext i16 %17 to i32
  %mul35.us.2 = mul nsw i32 %conv34.us.2, %conv.us.2
  %conv36.us.2 = sext i32 %mul35.us.2 to i64
  %add.us.2 = add nsw i64 %add.us.1, %conv36.us.2
  %inc.us.2 = add nuw nsw i32 %x.075.us, 3
  %exitcond.not.2 = icmp eq i32 %inc.us.2, %count_x
  %mul30.us.3 = mul nsw i32 %inc.us.2, %0
  %arrayidx.us.3 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.3
  %18 = load i16, ptr %arrayidx.us.3, align 2, !tbaa !14
  %conv.us.3 = sext i16 %18 to i32
  %mul32.us.3 = mul nsw i32 %inc.us.2, %4
  %arrayidx33.us.3 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.3
  %19 = load i16, ptr %arrayidx33.us.3, align 2, !tbaa !14
  %conv34.us.3 = sext i16 %19 to i32
  %mul35.us.3 = mul nsw i32 %conv34.us.3, %conv.us.3
  %conv36.us.3 = sext i32 %mul35.us.3 to i64
  %add.us.3 = add nsw i64 %add.us.2, %conv36.us.3
  %inc.us.3 = add nuw nsw i32 %x.075.us, 4
  %exitcond.not.3 = icmp eq i32 %inc.us.3, %count_x
  %mul30.us.4 = mul nsw i32 %inc.us.3, %0
  %arrayidx.us.4 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.4
  %20 = load i16, ptr %arrayidx.us.4, align 2, !tbaa !14
  %conv.us.4 = sext i16 %20 to i32
  %mul32.us.4 = mul nsw i32 %inc.us.3, %4
  %arrayidx33.us.4 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.4
  %21 = load i16, ptr %arrayidx33.us.4, align 2, !tbaa !14
  %conv34.us.4 = sext i16 %21 to i32
  %mul35.us.4 = mul nsw i32 %conv34.us.4, %conv.us.4
  %conv36.us.4 = sext i32 %mul35.us.4 to i64
  %add.us.4 = add nsw i64 %add.us.3, %conv36.us.4
  %inc.us.4 = add nuw nsw i32 %x.075.us, 5
  %exitcond.not.4 = icmp eq i32 %inc.us.4, %count_x
  %mul30.us.5 = mul nsw i32 %inc.us.4, %0
  %arrayidx.us.5 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.5
  %22 = load i16, ptr %arrayidx.us.5, align 2, !tbaa !14
  %conv.us.5 = sext i16 %22 to i32
  %mul32.us.5 = mul nsw i32 %inc.us.4, %4
  %arrayidx33.us.5 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.5
  %23 = load i16, ptr %arrayidx33.us.5, align 2, !tbaa !14
  %conv34.us.5 = sext i16 %23 to i32
  %mul35.us.5 = mul nsw i32 %conv34.us.5, %conv.us.5
  %conv36.us.5 = sext i32 %mul35.us.5 to i64
  %add.us.5 = add nsw i64 %add.us.4, %conv36.us.5
  %inc.us.5 = add nuw nsw i32 %x.075.us, 6
  %exitcond.not.5 = icmp eq i32 %inc.us.5, %count_x
  %mul30.us.6 = mul nsw i32 %inc.us.5, %0
  %arrayidx.us.6 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.6
  %24 = load i16, ptr %arrayidx.us.6, align 2, !tbaa !14
  %conv.us.6 = sext i16 %24 to i32
  %mul32.us.6 = mul nsw i32 %inc.us.5, %4
  %arrayidx33.us.6 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.6
  %25 = load i16, ptr %arrayidx33.us.6, align 2, !tbaa !14
  %conv34.us.6 = sext i16 %25 to i32
  %mul35.us.6 = mul nsw i32 %conv34.us.6, %conv.us.6
  %conv36.us.6 = sext i32 %mul35.us.6 to i64
  %add.us.6 = add nsw i64 %add.us.5, %conv36.us.6
  %inc.us.6 = add nuw nsw i32 %x.075.us, 7
  %exitcond.not.6 = icmp eq i32 %inc.us.6, %count_x
  %mul30.us.7 = mul nsw i32 %inc.us.6, %0
  %arrayidx.us.7 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.7
  %26 = load i16, ptr %arrayidx.us.7, align 2, !tbaa !14
  %conv.us.7 = sext i16 %26 to i32
  %mul32.us.7 = mul nsw i32 %inc.us.6, %4
  %arrayidx33.us.7 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.7
  %27 = load i16, ptr %arrayidx33.us.7, align 2, !tbaa !14
  %conv34.us.7 = sext i16 %27 to i32
  %mul35.us.7 = mul nsw i32 %conv34.us.7, %conv.us.7
  %conv36.us.7 = sext i32 %mul35.us.7 to i64
  %add.us.7 = add nsw i64 %add.us.6, %conv36.us.7
  %inc.us.7 = add nuw nsw i32 %x.075.us, 8
  %exitcond.not.7 = icmp eq i32 %inc.us.7, %count_x
  br i1 %exitcond.not.7, label %for.cond25.for.cond.cleanup27_crit_edge.us, label %for.body28.us.7, !llvm.loop !16

for.cond25.for.cond.cleanup27_crit_edge.us:       ; preds = %for.body28.us.clone, %for.body28.us.7
  %add.us.lcssa = phi i64 [ %add.us, %for.body28.us.7 ], [ %add.us.1, %for.body28.us.7 ], [ %add.us.2, %for.body28.us.7 ], [ %add.us.3, %for.body28.us.7 ], [ %add.us.4, %for.body28.us.7 ], [ %add.us.5, %for.body28.us.7 ], [ %add.us.6, %for.body28.us.7 ], [ %add.us.7, %for.body28.us.7 ]
  %add.ptr.us = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul20
  %add.ptr37.us = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul23
  %inc39.us = add nuw nsw i32 %y.080.us, 1
  %exitcond83.not = icmp eq i32 %inc39.us, %count_y
  br i1 %exitcond83.not, label %for.cond.cleanup.loopexit, label %for.cond25.preheader.us, !llvm.loop !18

for.cond.cleanup.loopexit:                        ; preds = %for.cond25.for.cond.cleanup27_crit_edge.us
  %add.us.lcssa.lcssa = phi i64 [ %add.us.lcssa, %for.cond25.for.cond.cleanup27_crit_edge.us ]
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %if.end16
  %acc.0.lcssa = phi i64 [ 0, %if.end16 ], [ %add.us.lcssa.lcssa, %for.cond.cleanup.loopexit ]
  %sub = add nsw i32 %shift, -1
  %shl = shl nuw i32 1, %sub
  %conv41 = sext i32 %shl to i64
  %add42 = add nsw i64 %acc.0.lcssa, %conv41
  %sh_prom = zext nneg i32 %shift to i64
  %shr = ashr i64 %add42, %sh_prom
  %conv43 = trunc i64 %shr to i16
  store i16 %conv43, ptr %out_value, align 2, !tbaa !14
  br label %return

return:                                           ; preds = %for.cond.cleanup, %if.end10, %if.end4, %if.end, %entry
  %retval.0 = phi i32 [ 0, %for.cond.cleanup ], [ 458755, %entry ], [ 458755, %if.end ], [ 458755, %if.end4 ], [ 458755, %if.end10 ]
  ret i32 %retval.0
}
