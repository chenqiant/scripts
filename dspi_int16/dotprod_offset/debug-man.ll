; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_dotprod_off_s16_ansi(ptr noalias nocapture noundef readonly %in_image, ptr noalias nocapture noundef readonly %filter, ptr noalias nocapture noundef writeonly %out_value, i32 noundef %count_x, i32 noundef %count_y, i32 noundef %shift, i16 noundef signext %offset) local_unnamed_addr #0 {
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
  %cmp2478 = icmp sgt i32 %count_y, 0
  br i1 %cmp2478, label %for.cond25.preheader.lr.ph, label %for.cond.cleanup

for.cond25.preheader.lr.ph:                       ; preds = %if.end16
  %cmp2675 = icmp sgt i32 %count_x, 0
  %conv35 = sext i16 %offset to i32
  br i1 %cmp2675, label %for.cond25.preheader.us.preheader, label %for.cond.cleanup

for.cond25.preheader.us.preheader:                ; preds = %for.cond25.preheader.lr.ph
  %8 = load ptr, ptr %in_image, align 4, !tbaa !13
  %9 = load ptr, ptr %filter, align 4, !tbaa !13
  br label %for.cond25.preheader.us

for.cond25.preheader.us:                          ; preds = %for.cond25.for.cond.cleanup27_crit_edge.us, %for.cond25.preheader.us.preheader
  %y.082.us = phi i32 [ %inc41.us, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ 0, %for.cond25.preheader.us.preheader ]
  %acc.081.us = phi i64 [ %add38.us.lcssa, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ 0, %for.cond25.preheader.us.preheader ]
  %i_data.080.us = phi ptr [ %add.ptr.us, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ %8, %for.cond25.preheader.us.preheader ]
  %f_data.079.us = phi ptr [ %add.ptr39.us, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ %9, %for.cond25.preheader.us.preheader ]
  br label %for.body28.us.15

for.body28.us.clone:                              ; No predecessors!
  %x.077.us.clone = phi i32 [ 0, %for.cond25.preheader.us ], [ %inc.us.15, %for.body28.us.15 ]
  %acc.176.us.clone = phi i64 [ %acc.081.us, %for.cond25.preheader.us ], [ %add38.us.15, %for.body28.us.15 ]
  %mul30.us.clone = mul nsw i32 %x.077.us.clone, %0
  %arrayidx.us.clone = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.clone
  %10 = load i16, ptr %arrayidx.us.clone, align 2, !tbaa !14
  %conv.us.clone = sext i16 %10 to i32
  %mul32.us.clone = mul nsw i32 %x.077.us.clone, %4
  %arrayidx33.us.clone = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.clone
  %11 = load i16, ptr %arrayidx33.us.clone, align 2, !tbaa !14
  %conv34.us.clone = sext i16 %11 to i32
  %add.us.clone = add nsw i32 %conv34.us.clone, %conv35
  %mul36.us.clone = mul nsw i32 %add.us.clone, %conv.us.clone
  %conv37.us.clone = sext i32 %mul36.us.clone to i64
  %add38.us.clone = add nsw i64 %acc.176.us.clone, %conv37.us.clone
  %inc.us.clone = add nuw nsw i32 %x.077.us.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.us.clone, %count_x
  br i1 %exitcond.not.clone, label %for.cond25.for.cond.cleanup27_crit_edge.us, label %for.body28.us.15, !llvm.loop !16

for.body28.us.15:                                 ; preds = %for.cond25.preheader.us, %for.body28.us.15, %for.body28.us.clone
  %x.077.us = phi i32 [ 0, %for.cond25.preheader.us ], [ %inc.us.15, %for.body28.us.15 ]
  %acc.176.us = phi i64 [ %acc.081.us, %for.cond25.preheader.us ], [ %add38.us.15, %for.body28.us.15 ]
  %mul30.us = mul nsw i32 %x.077.us, %0
  %arrayidx.us = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us
  %12 = load i16, ptr %arrayidx.us, align 2, !tbaa !14
  %conv.us = sext i16 %12 to i32
  %mul32.us = mul nsw i32 %x.077.us, %4
  %arrayidx33.us = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us
  %13 = load i16, ptr %arrayidx33.us, align 2, !tbaa !14
  %conv34.us = sext i16 %13 to i32
  %add.us = add nsw i32 %conv34.us, %conv35
  %mul36.us = mul nsw i32 %add.us, %conv.us
  %conv37.us = sext i32 %mul36.us to i64
  %add38.us = add nsw i64 %acc.176.us, %conv37.us
  %inc.us = add nuw nsw i32 %x.077.us, 1
  %exitcond.not = icmp eq i32 %inc.us, %count_x
  %mul30.us.1 = mul nsw i32 %inc.us, %0
  %arrayidx.us.1 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.1
  %14 = load i16, ptr %arrayidx.us.1, align 2, !tbaa !14
  %conv.us.1 = sext i16 %14 to i32
  %mul32.us.1 = mul nsw i32 %inc.us, %4
  %arrayidx33.us.1 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.1
  %15 = load i16, ptr %arrayidx33.us.1, align 2, !tbaa !14
  %conv34.us.1 = sext i16 %15 to i32
  %add.us.1 = add nsw i32 %conv34.us.1, %conv35
  %mul36.us.1 = mul nsw i32 %add.us.1, %conv.us.1
  %conv37.us.1 = sext i32 %mul36.us.1 to i64
  %add38.us.1 = add nsw i64 %add38.us, %conv37.us.1
  %inc.us.1 = add nuw nsw i32 %x.077.us, 2
  %exitcond.not.1 = icmp eq i32 %inc.us.1, %count_x
  %mul30.us.2 = mul nsw i32 %inc.us.1, %0
  %arrayidx.us.2 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.2
  %16 = load i16, ptr %arrayidx.us.2, align 2, !tbaa !14
  %conv.us.2 = sext i16 %16 to i32
  %mul32.us.2 = mul nsw i32 %inc.us.1, %4
  %arrayidx33.us.2 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.2
  %17 = load i16, ptr %arrayidx33.us.2, align 2, !tbaa !14
  %conv34.us.2 = sext i16 %17 to i32
  %add.us.2 = add nsw i32 %conv34.us.2, %conv35
  %mul36.us.2 = mul nsw i32 %add.us.2, %conv.us.2
  %conv37.us.2 = sext i32 %mul36.us.2 to i64
  %add38.us.2 = add nsw i64 %add38.us.1, %conv37.us.2
  %inc.us.2 = add nuw nsw i32 %x.077.us, 3
  %exitcond.not.2 = icmp eq i32 %inc.us.2, %count_x
  %mul30.us.3 = mul nsw i32 %inc.us.2, %0
  %arrayidx.us.3 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.3
  %18 = load i16, ptr %arrayidx.us.3, align 2, !tbaa !14
  %conv.us.3 = sext i16 %18 to i32
  %mul32.us.3 = mul nsw i32 %inc.us.2, %4
  %arrayidx33.us.3 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.3
  %19 = load i16, ptr %arrayidx33.us.3, align 2, !tbaa !14
  %conv34.us.3 = sext i16 %19 to i32
  %add.us.3 = add nsw i32 %conv34.us.3, %conv35
  %mul36.us.3 = mul nsw i32 %add.us.3, %conv.us.3
  %conv37.us.3 = sext i32 %mul36.us.3 to i64
  %add38.us.3 = add nsw i64 %add38.us.2, %conv37.us.3
  %inc.us.3 = add nuw nsw i32 %x.077.us, 4
  %exitcond.not.3 = icmp eq i32 %inc.us.3, %count_x
  %mul30.us.4 = mul nsw i32 %inc.us.3, %0
  %arrayidx.us.4 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.4
  %20 = load i16, ptr %arrayidx.us.4, align 2, !tbaa !14
  %conv.us.4 = sext i16 %20 to i32
  %mul32.us.4 = mul nsw i32 %inc.us.3, %4
  %arrayidx33.us.4 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.4
  %21 = load i16, ptr %arrayidx33.us.4, align 2, !tbaa !14
  %conv34.us.4 = sext i16 %21 to i32
  %add.us.4 = add nsw i32 %conv34.us.4, %conv35
  %mul36.us.4 = mul nsw i32 %add.us.4, %conv.us.4
  %conv37.us.4 = sext i32 %mul36.us.4 to i64
  %add38.us.4 = add nsw i64 %add38.us.3, %conv37.us.4
  %inc.us.4 = add nuw nsw i32 %x.077.us, 5
  %exitcond.not.4 = icmp eq i32 %inc.us.4, %count_x
  %mul30.us.5 = mul nsw i32 %inc.us.4, %0
  %arrayidx.us.5 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.5
  %22 = load i16, ptr %arrayidx.us.5, align 2, !tbaa !14
  %conv.us.5 = sext i16 %22 to i32
  %mul32.us.5 = mul nsw i32 %inc.us.4, %4
  %arrayidx33.us.5 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.5
  %23 = load i16, ptr %arrayidx33.us.5, align 2, !tbaa !14
  %conv34.us.5 = sext i16 %23 to i32
  %add.us.5 = add nsw i32 %conv34.us.5, %conv35
  %mul36.us.5 = mul nsw i32 %add.us.5, %conv.us.5
  %conv37.us.5 = sext i32 %mul36.us.5 to i64
  %add38.us.5 = add nsw i64 %add38.us.4, %conv37.us.5
  %inc.us.5 = add nuw nsw i32 %x.077.us, 6
  %exitcond.not.5 = icmp eq i32 %inc.us.5, %count_x
  %mul30.us.6 = mul nsw i32 %inc.us.5, %0
  %arrayidx.us.6 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.6
  %24 = load i16, ptr %arrayidx.us.6, align 2, !tbaa !14
  %conv.us.6 = sext i16 %24 to i32
  %mul32.us.6 = mul nsw i32 %inc.us.5, %4
  %arrayidx33.us.6 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.6
  %25 = load i16, ptr %arrayidx33.us.6, align 2, !tbaa !14
  %conv34.us.6 = sext i16 %25 to i32
  %add.us.6 = add nsw i32 %conv34.us.6, %conv35
  %mul36.us.6 = mul nsw i32 %add.us.6, %conv.us.6
  %conv37.us.6 = sext i32 %mul36.us.6 to i64
  %add38.us.6 = add nsw i64 %add38.us.5, %conv37.us.6
  %inc.us.6 = add nuw nsw i32 %x.077.us, 7
  %exitcond.not.6 = icmp eq i32 %inc.us.6, %count_x
  %mul30.us.7 = mul nsw i32 %inc.us.6, %0
  %arrayidx.us.7 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.7
  %26 = load i16, ptr %arrayidx.us.7, align 2, !tbaa !14
  %conv.us.7 = sext i16 %26 to i32
  %mul32.us.7 = mul nsw i32 %inc.us.6, %4
  %arrayidx33.us.7 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.7
  %27 = load i16, ptr %arrayidx33.us.7, align 2, !tbaa !14
  %conv34.us.7 = sext i16 %27 to i32
  %add.us.7 = add nsw i32 %conv34.us.7, %conv35
  %mul36.us.7 = mul nsw i32 %add.us.7, %conv.us.7
  %conv37.us.7 = sext i32 %mul36.us.7 to i64
  %add38.us.7 = add nsw i64 %add38.us.6, %conv37.us.7
  %inc.us.7 = add nuw nsw i32 %x.077.us, 8
  %exitcond.not.7 = icmp eq i32 %inc.us.7, %count_x
  %mul30.us.8 = mul nsw i32 %inc.us.7, %0
  %arrayidx.us.8 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.8
  %28 = load i16, ptr %arrayidx.us.8, align 2, !tbaa !14
  %conv.us.8 = sext i16 %28 to i32
  %mul32.us.8 = mul nsw i32 %inc.us.7, %4
  %arrayidx33.us.8 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.8
  %29 = load i16, ptr %arrayidx33.us.8, align 2, !tbaa !14
  %conv34.us.8 = sext i16 %29 to i32
  %add.us.8 = add nsw i32 %conv34.us.8, %conv35
  %mul36.us.8 = mul nsw i32 %add.us.8, %conv.us.8
  %conv37.us.8 = sext i32 %mul36.us.8 to i64
  %add38.us.8 = add nsw i64 %add38.us.7, %conv37.us.8
  %inc.us.8 = add nuw nsw i32 %x.077.us, 9
  %exitcond.not.8 = icmp eq i32 %inc.us.8, %count_x
  %mul30.us.9 = mul nsw i32 %inc.us.8, %0
  %arrayidx.us.9 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.9
  %30 = load i16, ptr %arrayidx.us.9, align 2, !tbaa !14
  %conv.us.9 = sext i16 %30 to i32
  %mul32.us.9 = mul nsw i32 %inc.us.8, %4
  %arrayidx33.us.9 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.9
  %31 = load i16, ptr %arrayidx33.us.9, align 2, !tbaa !14
  %conv34.us.9 = sext i16 %31 to i32
  %add.us.9 = add nsw i32 %conv34.us.9, %conv35
  %mul36.us.9 = mul nsw i32 %add.us.9, %conv.us.9
  %conv37.us.9 = sext i32 %mul36.us.9 to i64
  %add38.us.9 = add nsw i64 %add38.us.8, %conv37.us.9
  %inc.us.9 = add nuw nsw i32 %x.077.us, 10
  %exitcond.not.9 = icmp eq i32 %inc.us.9, %count_x
  %mul30.us.10 = mul nsw i32 %inc.us.9, %0
  %arrayidx.us.10 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.10
  %32 = load i16, ptr %arrayidx.us.10, align 2, !tbaa !14
  %conv.us.10 = sext i16 %32 to i32
  %mul32.us.10 = mul nsw i32 %inc.us.9, %4
  %arrayidx33.us.10 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.10
  %33 = load i16, ptr %arrayidx33.us.10, align 2, !tbaa !14
  %conv34.us.10 = sext i16 %33 to i32
  %add.us.10 = add nsw i32 %conv34.us.10, %conv35
  %mul36.us.10 = mul nsw i32 %add.us.10, %conv.us.10
  %conv37.us.10 = sext i32 %mul36.us.10 to i64
  %add38.us.10 = add nsw i64 %add38.us.9, %conv37.us.10
  %inc.us.10 = add nuw nsw i32 %x.077.us, 11
  %exitcond.not.10 = icmp eq i32 %inc.us.10, %count_x
  %mul30.us.11 = mul nsw i32 %inc.us.10, %0
  %arrayidx.us.11 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.11
  %34 = load i16, ptr %arrayidx.us.11, align 2, !tbaa !14
  %conv.us.11 = sext i16 %34 to i32
  %mul32.us.11 = mul nsw i32 %inc.us.10, %4
  %arrayidx33.us.11 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.11
  %35 = load i16, ptr %arrayidx33.us.11, align 2, !tbaa !14
  %conv34.us.11 = sext i16 %35 to i32
  %add.us.11 = add nsw i32 %conv34.us.11, %conv35
  %mul36.us.11 = mul nsw i32 %add.us.11, %conv.us.11
  %conv37.us.11 = sext i32 %mul36.us.11 to i64
  %add38.us.11 = add nsw i64 %add38.us.10, %conv37.us.11
  %inc.us.11 = add nuw nsw i32 %x.077.us, 12
  %exitcond.not.11 = icmp eq i32 %inc.us.11, %count_x
  %mul30.us.12 = mul nsw i32 %inc.us.11, %0
  %arrayidx.us.12 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.12
  %36 = load i16, ptr %arrayidx.us.12, align 2, !tbaa !14
  %conv.us.12 = sext i16 %36 to i32
  %mul32.us.12 = mul nsw i32 %inc.us.11, %4
  %arrayidx33.us.12 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.12
  %37 = load i16, ptr %arrayidx33.us.12, align 2, !tbaa !14
  %conv34.us.12 = sext i16 %37 to i32
  %add.us.12 = add nsw i32 %conv34.us.12, %conv35
  %mul36.us.12 = mul nsw i32 %add.us.12, %conv.us.12
  %conv37.us.12 = sext i32 %mul36.us.12 to i64
  %add38.us.12 = add nsw i64 %add38.us.11, %conv37.us.12
  %inc.us.12 = add nuw nsw i32 %x.077.us, 13
  %exitcond.not.12 = icmp eq i32 %inc.us.12, %count_x
  %mul30.us.13 = mul nsw i32 %inc.us.12, %0
  %arrayidx.us.13 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.13
  %38 = load i16, ptr %arrayidx.us.13, align 2, !tbaa !14
  %conv.us.13 = sext i16 %38 to i32
  %mul32.us.13 = mul nsw i32 %inc.us.12, %4
  %arrayidx33.us.13 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.13
  %39 = load i16, ptr %arrayidx33.us.13, align 2, !tbaa !14
  %conv34.us.13 = sext i16 %39 to i32
  %add.us.13 = add nsw i32 %conv34.us.13, %conv35
  %mul36.us.13 = mul nsw i32 %add.us.13, %conv.us.13
  %conv37.us.13 = sext i32 %mul36.us.13 to i64
  %add38.us.13 = add nsw i64 %add38.us.12, %conv37.us.13
  %inc.us.13 = add nuw nsw i32 %x.077.us, 14
  %exitcond.not.13 = icmp eq i32 %inc.us.13, %count_x
  %mul30.us.14 = mul nsw i32 %inc.us.13, %0
  %arrayidx.us.14 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.14
  %40 = load i16, ptr %arrayidx.us.14, align 2, !tbaa !14
  %conv.us.14 = sext i16 %40 to i32
  %mul32.us.14 = mul nsw i32 %inc.us.13, %4
  %arrayidx33.us.14 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.14
  %41 = load i16, ptr %arrayidx33.us.14, align 2, !tbaa !14
  %conv34.us.14 = sext i16 %41 to i32
  %add.us.14 = add nsw i32 %conv34.us.14, %conv35
  %mul36.us.14 = mul nsw i32 %add.us.14, %conv.us.14
  %conv37.us.14 = sext i32 %mul36.us.14 to i64
  %add38.us.14 = add nsw i64 %add38.us.13, %conv37.us.14
  %inc.us.14 = add nuw nsw i32 %x.077.us, 15
  %exitcond.not.14 = icmp eq i32 %inc.us.14, %count_x
  %mul30.us.15 = mul nsw i32 %inc.us.14, %0
  %arrayidx.us.15 = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul30.us.15
  %42 = load i16, ptr %arrayidx.us.15, align 2, !tbaa !14
  %conv.us.15 = sext i16 %42 to i32
  %mul32.us.15 = mul nsw i32 %inc.us.14, %4
  %arrayidx33.us.15 = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul32.us.15
  %43 = load i16, ptr %arrayidx33.us.15, align 2, !tbaa !14
  %conv34.us.15 = sext i16 %43 to i32
  %add.us.15 = add nsw i32 %conv34.us.15, %conv35
  %mul36.us.15 = mul nsw i32 %add.us.15, %conv.us.15
  %conv37.us.15 = sext i32 %mul36.us.15 to i64
  %add38.us.15 = add nsw i64 %add38.us.14, %conv37.us.15
  %inc.us.15 = add nuw nsw i32 %x.077.us, 16
  %exitcond.not.15 = icmp eq i32 %inc.us.15, %count_x
  br i1 %exitcond.not.15, label %for.cond25.for.cond.cleanup27_crit_edge.us, label %for.body28.us.15, !llvm.loop !16

for.cond25.for.cond.cleanup27_crit_edge.us:       ; preds = %for.body28.us.clone, %for.body28.us.15
  %add38.us.lcssa = phi i64 [ %add38.us, %for.body28.us.15 ], [ %add38.us.1, %for.body28.us.15 ], [ %add38.us.2, %for.body28.us.15 ], [ %add38.us.3, %for.body28.us.15 ], [ %add38.us.4, %for.body28.us.15 ], [ %add38.us.5, %for.body28.us.15 ], [ %add38.us.6, %for.body28.us.15 ], [ %add38.us.7, %for.body28.us.15 ], [ %add38.us.8, %for.body28.us.15 ], [ %add38.us.9, %for.body28.us.15 ], [ %add38.us.10, %for.body28.us.15 ], [ %add38.us.11, %for.body28.us.15 ], [ %add38.us.12, %for.body28.us.15 ], [ %add38.us.13, %for.body28.us.15 ], [ %add38.us.14, %for.body28.us.15 ], [ %add38.us.15, %for.body28.us.15 ]
  %add.ptr.us = getelementptr inbounds i16, ptr %i_data.080.us, i32 %mul20
  %add.ptr39.us = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul23
  %inc41.us = add nuw nsw i32 %y.082.us, 1
  %exitcond85.not = icmp eq i32 %inc41.us, %count_y
  br i1 %exitcond85.not, label %for.cond.cleanup.loopexit, label %for.cond25.preheader.us, !llvm.loop !18

for.cond.cleanup.loopexit:                        ; preds = %for.cond25.for.cond.cleanup27_crit_edge.us
  %add38.us.lcssa.lcssa = phi i64 [ %add38.us.lcssa, %for.cond25.for.cond.cleanup27_crit_edge.us ]
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %for.cond25.preheader.lr.ph, %if.end16
  %acc.0.lcssa = phi i64 [ 0, %if.end16 ], [ 0, %for.cond25.preheader.lr.ph ], [ %add38.us.lcssa.lcssa, %for.cond.cleanup.loopexit ]
  %sub = add nsw i32 %shift, -1
  %shl = shl nuw i32 1, %sub
  %conv43 = sext i32 %shl to i64
  %add44 = add nsw i64 %acc.0.lcssa, %conv43
  %sh_prom = zext nneg i32 %shift to i64
  %shr = ashr i64 %add44, %sh_prom
  %conv45 = trunc i64 %shr to i16
  store i16 %conv45, ptr %out_value, align 2, !tbaa !14
  br label %return

return:                                           ; preds = %for.cond.cleanup, %if.end10, %if.end4, %if.end, %entry
  %retval.0 = phi i32 [ 0, %for.cond.cleanup ], [ 458755, %entry ], [ 458755, %if.end ], [ 458755, %if.end4 ], [ 458755, %if.end10 ]
  ret i32 %retval.0
}
