; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dspm_mult_f32_ansi(ptr noalias nocapture noundef readonly %A, ptr noalias nocapture noundef readonly %B, ptr noalias nocapture noundef writeonly %C, i32 noundef %m, i32 noundef %n, i32 noundef %k) local_unnamed_addr #0 {
entry:
  %cmp54 = icmp sgt i32 %m, 0
  br i1 %cmp54, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp252 = icmp sgt i32 %k, 0
  %sub6 = add nsw i32 %n, -7
  %cmp1050 = icmp sgt i32 %n, 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %for.cond1.preheader.lr.ph
  %i.055 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc27, %for.cond.cleanup3 ]
  br i1 %cmp252, label %for.body4.lr.ph, label %for.cond.cleanup3

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  %mul = mul nsw i32 %i.055, %n
  %arrayidx = getelementptr inbounds float, ptr %A, i32 %mul
  %mul7 = mul nsw i32 %i.055, %k
  %0 = getelementptr float, ptr %C, i32 %mul7
  br label %for.body4

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3, %entry
  ret i32 0

for.cond.cleanup3:                                ; preds = %for.cond.cleanup11, %for.cond1.preheader
  %inc27 = add nuw nsw i32 %i.055, 1
  %exitcond57.not = icmp eq i32 %inc27, %m
  br i1 %exitcond57.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !4

for.body4:                                        ; preds = %for.cond.cleanup11, %for.body4.lr.ph
  %j.053 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc24, %for.cond.cleanup11 ]
  %1 = load float, ptr %arrayidx, align 4, !tbaa !6
  %arrayidx5 = getelementptr float, ptr %B, i32 %j.053
  %2 = load float, ptr %arrayidx5, align 4, !tbaa !6
  %mul6 = fmul float %1, %2
  %arrayidx8 = getelementptr float, ptr %0, i32 %j.053
  store float %mul6, ptr %arrayidx8, align 4, !tbaa !6
  br i1 %cmp1050, label %for.body12.7, label %for.cond110.preheader

for.cond110.preheader:                            ; preds = %for.body12.7, %for.body4
  %s.0.lcssa = phi i32 [ %inc.7, %for.body12.7 ], [ 1, %for.body4 ]
  %acc.0.lcssa = phi float [ %27, %for.body12.7 ], [ %mul6, %for.body4 ]
  %cmp111262 = icmp slt i32 %s.0.lcssa, %n
  br i1 %cmp111262, label %for.body12.clone, label %for.cond.cleanup11

for.body12.7:                                     ; preds = %for.body12.7, %for.body4
  %3 = phi float [ %27, %for.body12.7 ], [ %mul6, %for.body4 ]
  %s.051 = phi i32 [ %inc.7, %for.body12.7 ], [ 1, %for.body4 ]
  %arrayidx15 = getelementptr float, ptr %arrayidx, i32 %s.051
  %4 = load float, ptr %arrayidx15, align 4, !tbaa !6
  %mul16 = mul nsw i32 %s.051, %k
  %gep = getelementptr float, ptr %arrayidx5, i32 %mul16
  %5 = load float, ptr %gep, align 4, !tbaa !6
  %6 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %3)
  store float %6, ptr %arrayidx8, align 4, !tbaa !6
  %inc = add nuw nsw i32 %s.051, 1
  %exitcond.not = icmp eq i32 %inc, %n
  %arrayidx15.1 = getelementptr float, ptr %arrayidx, i32 %inc
  %7 = load float, ptr %arrayidx15.1, align 4, !tbaa !6
  %mul16.1 = mul nsw i32 %inc, %k
  %gep.1 = getelementptr float, ptr %arrayidx5, i32 %mul16.1
  %8 = load float, ptr %gep.1, align 4, !tbaa !6
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %6)
  store float %9, ptr %arrayidx8, align 4, !tbaa !6
  %inc.1 = add nuw nsw i32 %s.051, 2
  %exitcond.not.1 = icmp eq i32 %inc.1, %n
  %arrayidx15.2 = getelementptr float, ptr %arrayidx, i32 %inc.1
  %10 = load float, ptr %arrayidx15.2, align 4, !tbaa !6
  %mul16.2 = mul nsw i32 %inc.1, %k
  %gep.2 = getelementptr float, ptr %arrayidx5, i32 %mul16.2
  %11 = load float, ptr %gep.2, align 4, !tbaa !6
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %9)
  store float %12, ptr %arrayidx8, align 4, !tbaa !6
  %inc.2 = add nuw nsw i32 %s.051, 3
  %exitcond.not.2 = icmp eq i32 %inc.2, %n
  %arrayidx15.3 = getelementptr float, ptr %arrayidx, i32 %inc.2
  %13 = load float, ptr %arrayidx15.3, align 4, !tbaa !6
  %mul16.3 = mul nsw i32 %inc.2, %k
  %gep.3 = getelementptr float, ptr %arrayidx5, i32 %mul16.3
  %14 = load float, ptr %gep.3, align 4, !tbaa !6
  %15 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %12)
  store float %15, ptr %arrayidx8, align 4, !tbaa !6
  %inc.3 = add nuw nsw i32 %s.051, 4
  %exitcond.not.3 = icmp eq i32 %inc.3, %n
  %arrayidx15.4 = getelementptr float, ptr %arrayidx, i32 %inc.3
  %16 = load float, ptr %arrayidx15.4, align 4, !tbaa !6
  %mul16.4 = mul nsw i32 %inc.3, %k
  %gep.4 = getelementptr float, ptr %arrayidx5, i32 %mul16.4
  %17 = load float, ptr %gep.4, align 4, !tbaa !6
  %18 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %15)
  store float %18, ptr %arrayidx8, align 4, !tbaa !6
  %inc.4 = add nuw nsw i32 %s.051, 5
  %exitcond.not.4 = icmp eq i32 %inc.4, %n
  %arrayidx15.5 = getelementptr float, ptr %arrayidx, i32 %inc.4
  %19 = load float, ptr %arrayidx15.5, align 4, !tbaa !6
  %mul16.5 = mul nsw i32 %inc.4, %k
  %gep.5 = getelementptr float, ptr %arrayidx5, i32 %mul16.5
  %20 = load float, ptr %gep.5, align 4, !tbaa !6
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %18)
  store float %21, ptr %arrayidx8, align 4, !tbaa !6
  %inc.5 = add nuw nsw i32 %s.051, 6
  %exitcond.not.5 = icmp eq i32 %inc.5, %n
  %arrayidx15.6 = getelementptr float, ptr %arrayidx, i32 %inc.5
  %22 = load float, ptr %arrayidx15.6, align 4, !tbaa !6
  %mul16.6 = mul nsw i32 %inc.5, %k
  %gep.6 = getelementptr float, ptr %arrayidx5, i32 %mul16.6
  %23 = load float, ptr %gep.6, align 4, !tbaa !6
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %21)
  store float %24, ptr %arrayidx8, align 4, !tbaa !6
  %inc.6 = add nuw nsw i32 %s.051, 7
  %exitcond.not.6 = icmp eq i32 %inc.6, %n
  %arrayidx15.7 = getelementptr float, ptr %arrayidx, i32 %inc.6
  %25 = load float, ptr %arrayidx15.7, align 4, !tbaa !6
  %mul16.7 = mul nsw i32 %inc.6, %k
  %gep.7 = getelementptr float, ptr %arrayidx5, i32 %mul16.7
  %26 = load float, ptr %gep.7, align 4, !tbaa !6
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %24)
  store float %27, ptr %arrayidx8, align 4, !tbaa !6
  %inc.7 = add nuw nsw i32 %s.051, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub6
  br i1 %exitcond.not.7, label %for.body12.7, label %for.cond110.preheader, !llvm.loop !10

for.body12.clone:                                 ; preds = %for.body12.clone, %for.cond110.preheader
  %28 = phi float [ %31, %for.body12.clone ], [ %acc.0.lcssa, %for.cond110.preheader ]
  %s.051.clone = phi i32 [ %inc.clone, %for.body12.clone ], [ %s.0.lcssa, %for.cond110.preheader ]
  %arrayidx15.clone = getelementptr float, ptr %arrayidx, i32 %s.051.clone
  %29 = load float, ptr %arrayidx15.clone, align 4, !tbaa !6
  %mul16.clone = mul nsw i32 %s.051.clone, %k
  %gep.clone = getelementptr float, ptr %arrayidx5, i32 %mul16.clone
  %30 = load float, ptr %gep.clone, align 4, !tbaa !6
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %28)
  store float %31, ptr %arrayidx8, align 4, !tbaa !6
  %inc.clone = add nuw nsw i32 %s.051.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %n
  br i1 %exitcond.not.clone, label %for.cond.cleanup11, label %for.body12.clone, !llvm.loop !10

for.cond.cleanup11:                               ; preds = %for.cond110.preheader, %for.body12.clone
  %inc24 = add nuw nsw i32 %j.053, 1
  %exitcond56.not = icmp eq i32 %inc24, %k
  br i1 %exitcond56.not, label %for.cond.cleanup3, label %for.body4, !llvm.loop !11
}
