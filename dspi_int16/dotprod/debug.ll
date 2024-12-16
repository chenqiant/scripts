; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_dotprod_off_s8_ansi(ptr noalias nocapture noundef readonly %in_image, ptr noalias nocapture noundef readonly %filter, ptr noalias nocapture noundef writeonly %out_value, i32 noundef %count_x, i32 noundef %count_y, i32 noundef %shift, i8 noundef signext %offset) local_unnamed_addr #0 {
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
  %cmp2479 = icmp sgt i32 %count_y, 0
  br i1 %cmp2479, label %for.cond25.preheader.lr.ph, label %for.cond.cleanup

for.cond25.preheader.lr.ph:                       ; preds = %if.end16
  %8 = load ptr, ptr %filter, align 4, !tbaa !13
  %9 = load ptr, ptr %in_image, align 4, !tbaa !13
  %sub1 = add nsw i32 %count_x, -7
  %10 = and i32 %count_x, -8
  %cmp2676 = icmp sgt i32 %count_x, 7
  %conv38 = sext i8 %offset to i32
  br label %for.cond25.preheader

for.cond25.preheader:                             ; preds = %for.cond.cleanup27, %for.cond25.preheader.lr.ph
  %y.083 = phi i32 [ 0, %for.cond25.preheader.lr.ph ], [ %inc43, %for.cond.cleanup27 ]
  %acc.082 = phi i32 [ 0, %for.cond25.preheader.lr.ph ], [ %30, %for.cond.cleanup27 ]
  %i_data.081 = phi ptr [ %9, %for.cond25.preheader.lr.ph ], [ %add.ptr, %for.cond.cleanup27 ]
  %f_data.080 = phi ptr [ %8, %for.cond25.preheader.lr.ph ], [ %add.ptr41, %for.cond.cleanup27 ]
  br i1 %cmp2676, label %for.body28.7, label %for.cond128.preheader

for.cond.cleanup:                                 ; preds = %for.cond.cleanup27, %if.end16
  %acc.0.lcssa = phi i32 [ 0, %if.end16 ], [ %30, %for.cond.cleanup27 ]
  %sub = add nsw i32 %shift, -1
  %shl = shl nuw i32 1, %sub
  %add45 = add nsw i32 %acc.0.lcssa, %shl
  %shr = ashr i32 %add45, %shift
  %conv46 = trunc i32 %shr to i8
  store i8 %conv46, ptr %out_value, align 1, !tbaa !14
  br label %return

for.cond128.preheader:                            ; preds = %for.body28.7, %for.cond25.preheader
  %x.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %10, %for.body28.7 ]
  %11 = phi i32 [ %acc.082, %for.cond25.preheader ], [ %add40.7, %for.body28.7 ]
  %cmp129268 = icmp slt i32 %x.0.lcssa, %count_x
  br i1 %cmp129268, label %for.body28.clone, label %for.cond.cleanup27

for.body28.7:                                     ; preds = %for.cond25.preheader, %for.body28.7
  %x.078 = phi i32 [ %inc.7, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc.177 = phi i32 [ %add40.7, %for.body28.7 ], [ %acc.082, %for.cond25.preheader ]
  %mul30 = mul nsw i32 %x.078, %0
  %arrayidx = getelementptr inbounds i8, ptr %i_data.081, i32 %mul30
  %12 = load i8, ptr %arrayidx, align 1, !tbaa !14
  %conv31 = sext i8 %12 to i32
  %mul33 = mul nsw i32 %x.078, %4
  %arrayidx34 = getelementptr inbounds i8, ptr %f_data.080, i32 %mul33
  %13 = load i8, ptr %arrayidx34, align 1, !tbaa !14
  %conv36 = sext i8 %13 to i32
  %add = add nsw i32 %conv36, %conv38
  %mul39 = mul nsw i32 %add, %conv31
  %add40 = add nsw i32 %mul39, %acc.177
  %inc = or disjoint i32 %x.078, 1
  %mul30.1 = mul nsw i32 %inc, %0
  %arrayidx.1 = getelementptr inbounds i8, ptr %i_data.081, i32 %mul30.1
  %14 = load i8, ptr %arrayidx.1, align 1, !tbaa !14
  %conv31.1 = sext i8 %14 to i32
  %mul33.1 = mul nsw i32 %inc, %4
  %arrayidx34.1 = getelementptr inbounds i8, ptr %f_data.080, i32 %mul33.1
  %15 = load i8, ptr %arrayidx34.1, align 1, !tbaa !14
  %conv36.1 = sext i8 %15 to i32
  %add.1 = add nsw i32 %conv36.1, %conv38
  %mul39.1 = mul nsw i32 %add.1, %conv31.1
  %add40.1 = add nsw i32 %mul39.1, %add40
  %inc.1 = or disjoint i32 %x.078, 2
  %mul30.2 = mul nsw i32 %inc.1, %0
  %arrayidx.2 = getelementptr inbounds i8, ptr %i_data.081, i32 %mul30.2
  %16 = load i8, ptr %arrayidx.2, align 1, !tbaa !14
  %conv31.2 = sext i8 %16 to i32
  %mul33.2 = mul nsw i32 %inc.1, %4
  %arrayidx34.2 = getelementptr inbounds i8, ptr %f_data.080, i32 %mul33.2
  %17 = load i8, ptr %arrayidx34.2, align 1, !tbaa !14
  %conv36.2 = sext i8 %17 to i32
  %add.2 = add nsw i32 %conv36.2, %conv38
  %mul39.2 = mul nsw i32 %add.2, %conv31.2
  %add40.2 = add nsw i32 %mul39.2, %add40.1
  %inc.2 = or disjoint i32 %x.078, 3
  %mul30.3 = mul nsw i32 %inc.2, %0
  %arrayidx.3 = getelementptr inbounds i8, ptr %i_data.081, i32 %mul30.3
  %18 = load i8, ptr %arrayidx.3, align 1, !tbaa !14
  %conv31.3 = sext i8 %18 to i32
  %mul33.3 = mul nsw i32 %inc.2, %4
  %arrayidx34.3 = getelementptr inbounds i8, ptr %f_data.080, i32 %mul33.3
  %19 = load i8, ptr %arrayidx34.3, align 1, !tbaa !14
  %conv36.3 = sext i8 %19 to i32
  %add.3 = add nsw i32 %conv36.3, %conv38
  %mul39.3 = mul nsw i32 %add.3, %conv31.3
  %add40.3 = add nsw i32 %mul39.3, %add40.2
  %inc.3 = or disjoint i32 %x.078, 4
  %mul30.4 = mul nsw i32 %inc.3, %0
  %arrayidx.4 = getelementptr inbounds i8, ptr %i_data.081, i32 %mul30.4
  %20 = load i8, ptr %arrayidx.4, align 1, !tbaa !14
  %conv31.4 = sext i8 %20 to i32
  %mul33.4 = mul nsw i32 %inc.3, %4
  %arrayidx34.4 = getelementptr inbounds i8, ptr %f_data.080, i32 %mul33.4
  %21 = load i8, ptr %arrayidx34.4, align 1, !tbaa !14
  %conv36.4 = sext i8 %21 to i32
  %add.4 = add nsw i32 %conv36.4, %conv38
  %mul39.4 = mul nsw i32 %add.4, %conv31.4
  %add40.4 = add nsw i32 %mul39.4, %add40.3
  %inc.4 = or disjoint i32 %x.078, 5
  %mul30.5 = mul nsw i32 %inc.4, %0
  %arrayidx.5 = getelementptr inbounds i8, ptr %i_data.081, i32 %mul30.5
  %22 = load i8, ptr %arrayidx.5, align 1, !tbaa !14
  %conv31.5 = sext i8 %22 to i32
  %mul33.5 = mul nsw i32 %inc.4, %4
  %arrayidx34.5 = getelementptr inbounds i8, ptr %f_data.080, i32 %mul33.5
  %23 = load i8, ptr %arrayidx34.5, align 1, !tbaa !14
  %conv36.5 = sext i8 %23 to i32
  %add.5 = add nsw i32 %conv36.5, %conv38
  %mul39.5 = mul nsw i32 %add.5, %conv31.5
  %add40.5 = add nsw i32 %mul39.5, %add40.4
  %inc.5 = or disjoint i32 %x.078, 6
  %mul30.6 = mul nsw i32 %inc.5, %0
  %arrayidx.6 = getelementptr inbounds i8, ptr %i_data.081, i32 %mul30.6
  %24 = load i8, ptr %arrayidx.6, align 1, !tbaa !14
  %conv31.6 = sext i8 %24 to i32
  %mul33.6 = mul nsw i32 %inc.5, %4
  %arrayidx34.6 = getelementptr inbounds i8, ptr %f_data.080, i32 %mul33.6
  %25 = load i8, ptr %arrayidx34.6, align 1, !tbaa !14
  %conv36.6 = sext i8 %25 to i32
  %add.6 = add nsw i32 %conv36.6, %conv38
  %mul39.6 = mul nsw i32 %add.6, %conv31.6
  %add40.6 = add nsw i32 %mul39.6, %add40.5
  %inc.6 = or disjoint i32 %x.078, 7
  %mul30.7 = mul nsw i32 %inc.6, %0
  %arrayidx.7 = getelementptr inbounds i8, ptr %i_data.081, i32 %mul30.7
  %26 = load i8, ptr %arrayidx.7, align 1, !tbaa !14
  %conv31.7 = sext i8 %26 to i32
  %mul33.7 = mul nsw i32 %inc.6, %4
  %arrayidx34.7 = getelementptr inbounds i8, ptr %f_data.080, i32 %mul33.7
  %27 = load i8, ptr %arrayidx34.7, align 1, !tbaa !14
  %conv36.7 = sext i8 %27 to i32
  %add.7 = add nsw i32 %conv36.7, %conv38
  %mul39.7 = mul nsw i32 %add.7, %conv31.7
  %add40.7 = add nsw i32 %mul39.7, %add40.6
  %inc.7 = add nuw nsw i32 %x.078, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub1
  br i1 %exitcond.not.7, label %for.body28.7, label %for.cond128.preheader, !llvm.loop !15

for.body28.clone:                                 ; preds = %for.cond128.preheader, %for.body28.clone
  %x.078.clone = phi i32 [ %inc.clone, %for.body28.clone ], [ %x.0.lcssa, %for.cond128.preheader ]
  %acc.177.clone = phi i32 [ %add40.clone, %for.body28.clone ], [ %11, %for.cond128.preheader ]
  %mul30.clone = mul nsw i32 %x.078.clone, %0
  %arrayidx.clone = getelementptr inbounds i8, ptr %i_data.081, i32 %mul30.clone
  %28 = load i8, ptr %arrayidx.clone, align 1, !tbaa !14
  %conv31.clone = sext i8 %28 to i32
  %mul33.clone = mul nsw i32 %x.078.clone, %4
  %arrayidx34.clone = getelementptr inbounds i8, ptr %f_data.080, i32 %mul33.clone
  %29 = load i8, ptr %arrayidx34.clone, align 1, !tbaa !14
  %conv36.clone = sext i8 %29 to i32
  %add.clone = add nsw i32 %conv36.clone, %conv38
  %mul39.clone = mul nsw i32 %add.clone, %conv31.clone
  %add40.clone = add nsw i32 %mul39.clone, %acc.177.clone
  %inc.clone = add nuw nsw i32 %x.078.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %count_x
  br i1 %exitcond.not.clone, label %for.cond.cleanup27, label %for.body28.clone, !llvm.loop !15

for.cond.cleanup27:                               ; preds = %for.body28.clone, %for.cond128.preheader
  %30 = phi i32 [ %11, %for.cond128.preheader ], [ %add40.clone, %for.body28.clone ]
  %add.ptr = getelementptr inbounds i8, ptr %i_data.081, i32 %mul20
  %add.ptr41 = getelementptr inbounds i8, ptr %f_data.080, i32 %mul23
  %inc43 = add nuw nsw i32 %y.083, 1
  %exitcond85.not = icmp eq i32 %inc43, %count_y
  br i1 %exitcond85.not, label %for.cond.cleanup, label %for.cond25.preheader, !llvm.loop !17

return:                                           ; preds = %for.cond.cleanup, %if.end10, %if.end4, %if.end, %entry
  %retval.0 = phi i32 [ 0, %for.cond.cleanup ], [ 458755, %entry ], [ 458755, %if.end ], [ 458755, %if.end4 ], [ 458755, %if.end10 ]
  ret i32 %retval.0
}
