; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_dotprod_f32_ansi(ptr noalias nocapture noundef readonly %in_image, ptr noalias nocapture noundef readonly %filter, ptr noalias nocapture noundef writeonly %out_value, i32 noundef %count_x, i32 noundef %count_y) local_unnamed_addr #0 {
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
  %cmp2468 = icmp sgt i32 %count_y, 0
  br i1 %cmp2468, label %for.cond25.preheader.lr.ph, label %for.cond.cleanup

for.cond25.preheader.lr.ph:                       ; preds = %if.end16
  %8 = load ptr, ptr %filter, align 4, !tbaa !13
  %9 = load ptr, ptr %in_image, align 4, !tbaa !13
  %cmp2665 = icmp sgt i32 %count_x, 0
  br label %for.cond25.preheader

for.cond25.preheader:                             ; preds = %for.cond.cleanup27, %for.cond25.preheader.lr.ph
  %y.072 = phi i32 [ 0, %for.cond25.preheader.lr.ph ], [ %inc37, %for.cond.cleanup27 ]
  %acc.071 = phi float [ 0.000000e+00, %for.cond25.preheader.lr.ph ], [ %acc.1.lcssa, %for.cond.cleanup27 ]
  %i_data.070 = phi ptr [ %9, %for.cond25.preheader.lr.ph ], [ %add.ptr, %for.cond.cleanup27 ]
  %f_data.069 = phi ptr [ %8, %for.cond25.preheader.lr.ph ], [ %add.ptr35, %for.cond.cleanup27 ]
  br i1 %cmp2665, label %for.body28.7, label %for.cond.cleanup27

for.cond.cleanup:                                 ; preds = %for.cond.cleanup27, %if.end16
  %acc.0.lcssa = phi float [ 0.000000e+00, %if.end16 ], [ %acc.1.lcssa, %for.cond.cleanup27 ]
  store float %acc.0.lcssa, ptr %out_value, align 4, !tbaa !14
  br label %return

for.cond.cleanup27:                               ; preds = %for.body28.clone, %for.body28.7, %for.cond25.preheader
  %acc.1.lcssa = phi float [ %acc.071, %for.cond25.preheader ], [ %12, %for.body28.7 ], [ %15, %for.body28.7 ], [ %18, %for.body28.7 ], [ %21, %for.body28.7 ], [ %24, %for.body28.7 ], [ %27, %for.body28.7 ], [ %30, %for.body28.7 ], [ %33, %for.body28.7 ]
  %add.ptr = getelementptr inbounds float, ptr %i_data.070, i32 %mul20
  %add.ptr35 = getelementptr inbounds float, ptr %f_data.069, i32 %mul23
  %inc37 = add nuw nsw i32 %y.072, 1
  %exitcond74.not = icmp eq i32 %inc37, %count_y
  br i1 %exitcond74.not, label %for.cond.cleanup, label %for.cond25.preheader, !llvm.loop !16

for.body28.7:                                     ; preds = %for.body28.7, %for.cond25.preheader, %for.body28.clone
  %x.067 = phi i32 [ %inc.7, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc.166 = phi float [ %33, %for.body28.7 ], [ %acc.071, %for.cond25.preheader ]
  %mul30 = mul nsw i32 %x.067, %0
  %arrayidx = getelementptr inbounds float, ptr %i_data.070, i32 %mul30
  %10 = load float, ptr %arrayidx, align 4, !tbaa !14
  %mul32 = mul nsw i32 %x.067, %4
  %arrayidx33 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32
  %11 = load float, ptr %arrayidx33, align 4, !tbaa !14
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %acc.166)
  %inc = add nuw nsw i32 %x.067, 1
  %exitcond.not = icmp eq i32 %inc, %count_x
  %mul30.1 = mul nsw i32 %inc, %0
  %arrayidx.1 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.1
  %13 = load float, ptr %arrayidx.1, align 4, !tbaa !14
  %mul32.1 = mul nsw i32 %inc, %4
  %arrayidx33.1 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.1
  %14 = load float, ptr %arrayidx33.1, align 4, !tbaa !14
  %15 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %12)
  %inc.1 = add nuw nsw i32 %x.067, 2
  %exitcond.not.1 = icmp eq i32 %inc.1, %count_x
  %mul30.2 = mul nsw i32 %inc.1, %0
  %arrayidx.2 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.2
  %16 = load float, ptr %arrayidx.2, align 4, !tbaa !14
  %mul32.2 = mul nsw i32 %inc.1, %4
  %arrayidx33.2 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.2
  %17 = load float, ptr %arrayidx33.2, align 4, !tbaa !14
  %18 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %15)
  %inc.2 = add nuw nsw i32 %x.067, 3
  %exitcond.not.2 = icmp eq i32 %inc.2, %count_x
  %mul30.3 = mul nsw i32 %inc.2, %0
  %arrayidx.3 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.3
  %19 = load float, ptr %arrayidx.3, align 4, !tbaa !14
  %mul32.3 = mul nsw i32 %inc.2, %4
  %arrayidx33.3 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.3
  %20 = load float, ptr %arrayidx33.3, align 4, !tbaa !14
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %18)
  %inc.3 = add nuw nsw i32 %x.067, 4
  %exitcond.not.3 = icmp eq i32 %inc.3, %count_x
  %mul30.4 = mul nsw i32 %inc.3, %0
  %arrayidx.4 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.4
  %22 = load float, ptr %arrayidx.4, align 4, !tbaa !14
  %mul32.4 = mul nsw i32 %inc.3, %4
  %arrayidx33.4 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.4
  %23 = load float, ptr %arrayidx33.4, align 4, !tbaa !14
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %21)
  %inc.4 = add nuw nsw i32 %x.067, 5
  %exitcond.not.4 = icmp eq i32 %inc.4, %count_x
  %mul30.5 = mul nsw i32 %inc.4, %0
  %arrayidx.5 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.5
  %25 = load float, ptr %arrayidx.5, align 4, !tbaa !14
  %mul32.5 = mul nsw i32 %inc.4, %4
  %arrayidx33.5 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.5
  %26 = load float, ptr %arrayidx33.5, align 4, !tbaa !14
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %24)
  %inc.5 = add nuw nsw i32 %x.067, 6
  %exitcond.not.5 = icmp eq i32 %inc.5, %count_x
  %mul30.6 = mul nsw i32 %inc.5, %0
  %arrayidx.6 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.6
  %28 = load float, ptr %arrayidx.6, align 4, !tbaa !14
  %mul32.6 = mul nsw i32 %inc.5, %4
  %arrayidx33.6 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.6
  %29 = load float, ptr %arrayidx33.6, align 4, !tbaa !14
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float %27)
  %inc.6 = add nuw nsw i32 %x.067, 7
  %exitcond.not.6 = icmp eq i32 %inc.6, %count_x
  %mul30.7 = mul nsw i32 %inc.6, %0
  %arrayidx.7 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.7
  %31 = load float, ptr %arrayidx.7, align 4, !tbaa !14
  %mul32.7 = mul nsw i32 %inc.6, %4
  %arrayidx33.7 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.7
  %32 = load float, ptr %arrayidx33.7, align 4, !tbaa !14
  %33 = tail call float @llvm.fmuladd.f32(float %31, float %32, float %30)
  %inc.7 = add nuw nsw i32 %x.067, 8
  %exitcond.not.7 = icmp eq i32 %inc.7, %count_x
  br i1 %exitcond.not.7, label %for.cond.cleanup27, label %for.body28.7, !llvm.loop !18

for.body28.clone:                                 ; No predecessors!
  %x.067.clone = phi i32 [ %inc.7, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc.166.clone = phi float [ %33, %for.body28.7 ], [ %acc.071, %for.cond25.preheader ]
  %mul30.clone = mul nsw i32 %x.067.clone, %0
  %arrayidx.clone = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.clone
  %34 = load float, ptr %arrayidx.clone, align 4, !tbaa !14
  %mul32.clone = mul nsw i32 %x.067.clone, %4
  %arrayidx33.clone = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.clone
  %35 = load float, ptr %arrayidx33.clone, align 4, !tbaa !14
  %36 = tail call float @llvm.fmuladd.f32(float %34, float %35, float %acc.166.clone)
  %inc.clone = add nuw nsw i32 %x.067.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %count_x
  br i1 %exitcond.not.clone, label %for.cond.cleanup27, label %for.body28.7, !llvm.loop !18

return:                                           ; preds = %for.cond.cleanup, %if.end10, %if.end4, %if.end, %entry
  %retval.0 = phi i32 [ 0, %for.cond.cleanup ], [ 458755, %entry ], [ 458755, %if.end ], [ 458755, %if.end4 ], [ 458755, %if.end10 ]
  ret i32 %retval.0
}
