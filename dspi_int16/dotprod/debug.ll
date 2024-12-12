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
  br i1 %cmp2476, label %for.cond25.preheader.lr.ph, label %for.cond.cleanup

for.cond25.preheader.lr.ph:                       ; preds = %if.end16
  %8 = load ptr, ptr %filter, align 4, !tbaa !13
  %9 = load ptr, ptr %in_image, align 4, !tbaa !13
  %sub1 = add nsw i32 %count_x, -7
  %10 = and i32 %count_x, -8
  %cmp2673 = icmp sgt i32 %count_x, 7
  br label %for.cond25.preheader

for.cond25.preheader:                             ; preds = %for.cond.cleanup27, %for.cond25.preheader.lr.ph
  %y.080 = phi i32 [ 0, %for.cond25.preheader.lr.ph ], [ %inc39, %for.cond.cleanup27 ]
  %acc.079 = phi i64 [ 0, %for.cond25.preheader.lr.ph ], [ %final.sum, %for.cond.cleanup27 ]
  %i_data.078 = phi ptr [ %9, %for.cond25.preheader.lr.ph ], [ %add.ptr, %for.cond.cleanup27 ]
  %f_data.077 = phi ptr [ %8, %for.cond25.preheader.lr.ph ], [ %add.ptr37, %for.cond.cleanup27 ]
  br i1 %cmp2673, label %for.body28.7, label %for.cond128.preheader

for.cond.cleanup:                                 ; preds = %for.cond.cleanup27, %if.end16
  %acc.0.lcssa = phi i64 [ 0, %if.end16 ], [ %final.sum, %for.cond.cleanup27 ]
  %sub = add nsw i32 %shift, -1
  %shl = shl nuw i32 1, %sub
  %conv41 = sext i32 %shl to i64
  %add42 = add nsw i64 %acc.0.lcssa, %conv41
  %sh_prom = zext nneg i32 %shift to i64
  %shr = ashr i64 %add42, %sh_prom
  %conv43 = trunc i64 %shr to i16
  store i16 %conv43, ptr %out_value, align 2, !tbaa !14
  br label %return

for.cond128.preheader:                            ; preds = %for.body28.7, %for.cond25.preheader
  %x.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %10, %for.body28.7 ]
  %acc0.0.lcssa23 = phi i32 [ 0, %for.cond25.preheader ], [ %13, %for.body28.7 ]
  %acc0.0.lcssa25 = phi i32 [ 0, %for.cond25.preheader ], [ %16, %for.body28.7 ]
  %acc0.0.lcssa27 = phi i32 [ 0, %for.cond25.preheader ], [ %19, %for.body28.7 ]
  %acc0.0.lcssa29 = phi i32 [ 0, %for.cond25.preheader ], [ %22, %for.body28.7 ]
  %acc0.0.lcssa31 = phi i32 [ 0, %for.cond25.preheader ], [ %25, %for.body28.7 ]
  %acc0.0.lcssa33 = phi i32 [ 0, %for.cond25.preheader ], [ %28, %for.body28.7 ]
  %acc0.0.lcssa35 = phi i32 [ 0, %for.cond25.preheader ], [ %31, %for.body28.7 ]
  %acc0.0.lcssa37 = phi i32 [ 0, %for.cond25.preheader ], [ %34, %for.body28.7 ]
  %cmp129268 = icmp slt i32 %x.0.lcssa, %count_x
  br i1 %cmp129268, label %for.body28.clone, label %for.cond.cleanup27

for.body28.7:                                     ; preds = %for.cond25.preheader, %for.body28.7
  %x.075 = phi i32 [ %inc.7, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc22 = phi i32 [ %13, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc224 = phi i32 [ %16, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc426 = phi i32 [ %19, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc628 = phi i32 [ %22, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc830 = phi i32 [ %25, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc1032 = phi i32 [ %28, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc1234 = phi i32 [ %31, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc1436 = phi i32 [ %34, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %mul30 = mul nsw i32 %x.075, %0
  %arrayidx = getelementptr inbounds i16, ptr %i_data.078, i32 %mul30
  %11 = load i16, ptr %arrayidx, align 2, !tbaa !14
  %conv = sext i16 %11 to i32
  %mul32 = mul nsw i32 %x.075, %4
  %arrayidx33 = getelementptr inbounds i16, ptr %f_data.077, i32 %mul32
  %12 = load i16, ptr %arrayidx33, align 2, !tbaa !14
  %conv34 = sext i16 %12 to i32
  %mul35 = mul nsw i32 %conv34, %conv
  %13 = add i32 %mul35, %acc22
  %inc = or disjoint i32 %x.075, 1
  %mul30.1 = mul nsw i32 %inc, %0
  %arrayidx.1 = getelementptr inbounds i16, ptr %i_data.078, i32 %mul30.1
  %14 = load i16, ptr %arrayidx.1, align 2, !tbaa !14
  %conv.1 = sext i16 %14 to i32
  %mul32.1 = mul nsw i32 %inc, %4
  %arrayidx33.1 = getelementptr inbounds i16, ptr %f_data.077, i32 %mul32.1
  %15 = load i16, ptr %arrayidx33.1, align 2, !tbaa !14
  %conv34.1 = sext i16 %15 to i32
  %mul35.1 = mul nsw i32 %conv34.1, %conv.1
  %16 = add i32 %mul35.1, %acc224
  %inc.1 = or disjoint i32 %x.075, 2
  %mul30.2 = mul nsw i32 %inc.1, %0
  %arrayidx.2 = getelementptr inbounds i16, ptr %i_data.078, i32 %mul30.2
  %17 = load i16, ptr %arrayidx.2, align 2, !tbaa !14
  %conv.2 = sext i16 %17 to i32
  %mul32.2 = mul nsw i32 %inc.1, %4
  %arrayidx33.2 = getelementptr inbounds i16, ptr %f_data.077, i32 %mul32.2
  %18 = load i16, ptr %arrayidx33.2, align 2, !tbaa !14
  %conv34.2 = sext i16 %18 to i32
  %mul35.2 = mul nsw i32 %conv34.2, %conv.2
  %19 = add i32 %mul35.2, %acc426
  %inc.2 = or disjoint i32 %x.075, 3
  %mul30.3 = mul nsw i32 %inc.2, %0
  %arrayidx.3 = getelementptr inbounds i16, ptr %i_data.078, i32 %mul30.3
  %20 = load i16, ptr %arrayidx.3, align 2, !tbaa !14
  %conv.3 = sext i16 %20 to i32
  %mul32.3 = mul nsw i32 %inc.2, %4
  %arrayidx33.3 = getelementptr inbounds i16, ptr %f_data.077, i32 %mul32.3
  %21 = load i16, ptr %arrayidx33.3, align 2, !tbaa !14
  %conv34.3 = sext i16 %21 to i32
  %mul35.3 = mul nsw i32 %conv34.3, %conv.3
  %22 = add i32 %mul35.3, %acc628
  %inc.3 = or disjoint i32 %x.075, 4
  %mul30.4 = mul nsw i32 %inc.3, %0
  %arrayidx.4 = getelementptr inbounds i16, ptr %i_data.078, i32 %mul30.4
  %23 = load i16, ptr %arrayidx.4, align 2, !tbaa !14
  %conv.4 = sext i16 %23 to i32
  %mul32.4 = mul nsw i32 %inc.3, %4
  %arrayidx33.4 = getelementptr inbounds i16, ptr %f_data.077, i32 %mul32.4
  %24 = load i16, ptr %arrayidx33.4, align 2, !tbaa !14
  %conv34.4 = sext i16 %24 to i32
  %mul35.4 = mul nsw i32 %conv34.4, %conv.4
  %25 = add i32 %mul35.4, %acc830
  %inc.4 = or disjoint i32 %x.075, 5
  %mul30.5 = mul nsw i32 %inc.4, %0
  %arrayidx.5 = getelementptr inbounds i16, ptr %i_data.078, i32 %mul30.5
  %26 = load i16, ptr %arrayidx.5, align 2, !tbaa !14
  %conv.5 = sext i16 %26 to i32
  %mul32.5 = mul nsw i32 %inc.4, %4
  %arrayidx33.5 = getelementptr inbounds i16, ptr %f_data.077, i32 %mul32.5
  %27 = load i16, ptr %arrayidx33.5, align 2, !tbaa !14
  %conv34.5 = sext i16 %27 to i32
  %mul35.5 = mul nsw i32 %conv34.5, %conv.5
  %28 = add i32 %mul35.5, %acc1032
  %inc.5 = or disjoint i32 %x.075, 6
  %mul30.6 = mul nsw i32 %inc.5, %0
  %arrayidx.6 = getelementptr inbounds i16, ptr %i_data.078, i32 %mul30.6
  %29 = load i16, ptr %arrayidx.6, align 2, !tbaa !14
  %conv.6 = sext i16 %29 to i32
  %mul32.6 = mul nsw i32 %inc.5, %4
  %arrayidx33.6 = getelementptr inbounds i16, ptr %f_data.077, i32 %mul32.6
  %30 = load i16, ptr %arrayidx33.6, align 2, !tbaa !14
  %conv34.6 = sext i16 %30 to i32
  %mul35.6 = mul nsw i32 %conv34.6, %conv.6
  %31 = add i32 %mul35.6, %acc1234
  %inc.6 = or disjoint i32 %x.075, 7
  %mul30.7 = mul nsw i32 %inc.6, %0
  %arrayidx.7 = getelementptr inbounds i16, ptr %i_data.078, i32 %mul30.7
  %32 = load i16, ptr %arrayidx.7, align 2, !tbaa !14
  %conv.7 = sext i16 %32 to i32
  %mul32.7 = mul nsw i32 %inc.6, %4
  %arrayidx33.7 = getelementptr inbounds i16, ptr %f_data.077, i32 %mul32.7
  %33 = load i16, ptr %arrayidx33.7, align 2, !tbaa !14
  %conv34.7 = sext i16 %33 to i32
  %mul35.7 = mul nsw i32 %conv34.7, %conv.7
  %34 = add i32 %mul35.7, %acc1436
  %inc.7 = add nuw nsw i32 %x.075, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub1
  br i1 %exitcond.not.7, label %for.body28.7, label %for.cond128.preheader, !llvm.loop !16

for.body28.clone:                                 ; preds = %for.cond128.preheader, %for.body28.clone
  %x.075.clone = phi i32 [ %inc.clone, %for.body28.clone ], [ %x.0.lcssa, %for.cond128.preheader ]
  %acc.174.clone = phi i64 [ %add.clone, %for.body28.clone ], [ %acc.079, %for.cond128.preheader ]
  %mul30.clone = mul nsw i32 %x.075.clone, %0
  %arrayidx.clone = getelementptr inbounds i16, ptr %i_data.078, i32 %mul30.clone
  %35 = load i16, ptr %arrayidx.clone, align 2, !tbaa !14
  %conv.clone = sext i16 %35 to i32
  %mul32.clone = mul nsw i32 %x.075.clone, %4
  %arrayidx33.clone = getelementptr inbounds i16, ptr %f_data.077, i32 %mul32.clone
  %36 = load i16, ptr %arrayidx33.clone, align 2, !tbaa !14
  %conv34.clone = sext i16 %36 to i32
  %mul35.clone = mul nsw i32 %conv34.clone, %conv.clone
  %conv36.clone = sext i32 %mul35.clone to i64
  %add.clone = add nsw i64 %conv36.clone, %acc.174.clone
  %inc.clone = add nuw nsw i32 %x.075.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %count_x
  br i1 %exitcond.not.clone, label %for.cond.cleanup27, label %for.body28.clone, !llvm.loop !16

for.cond.cleanup27:                               ; preds = %for.body28.clone, %for.cond128.preheader
  %37 = phi i64 [ %acc.079, %for.cond128.preheader ], [ %add.clone, %for.body28.clone ]
  %pairwise.sum41 = add i32 %acc0.0.lcssa25, %acc0.0.lcssa23
  %pairwise.sum40 = add i32 %pairwise.sum41, %acc0.0.lcssa27
  %pairwise.sum43 = add i32 %pairwise.sum40, %acc0.0.lcssa29
  %pairwise.sum39 = add i32 %pairwise.sum43, %acc0.0.lcssa31
  %pairwise.sum38 = add i32 %pairwise.sum39, %acc0.0.lcssa33
  %pairwise.sum42 = add i32 %pairwise.sum38, %acc0.0.lcssa35
  %pairwise.sum44 = add i32 %pairwise.sum42, %acc0.0.lcssa37
  %38 = sext i32 %pairwise.sum44 to i64
  %final.sum = add nsw i64 %37, %38
  %add.ptr = getelementptr inbounds i16, ptr %i_data.078, i32 %mul20
  %add.ptr37 = getelementptr inbounds i16, ptr %f_data.077, i32 %mul23
  %inc39 = add nuw nsw i32 %y.080, 1
  %exitcond82.not = icmp eq i32 %inc39, %count_y
  br i1 %exitcond82.not, label %for.cond.cleanup, label %for.cond25.preheader, !llvm.loop !18

return:                                           ; preds = %for.cond.cleanup, %if.end10, %if.end4, %if.end, %entry
  %retval.0 = phi i32 [ 0, %for.cond.cleanup ], [ 458755, %entry ], [ 458755, %if.end ], [ 458755, %if.end4 ], [ 458755, %if.end10 ]
  ret i32 %retval.0
}
