; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fir_f32_ansi(ptr nocapture noundef %fir, ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp67 = icmp sgt i32 %len, 0
  br i1 %cmp67, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %delay = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %0 = load ptr, ptr %delay, align 4, !tbaa !4
  %pos = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %1 = load i32, ptr %N, align 4, !tbaa !11
  %.pre = load i32, ptr %pos, align 4, !tbaa !12
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.cond.cleanup21, %entry
  ret i32 0

for.body:                                         ; preds = %for.cond.cleanup21, %for.body.lr.ph
  %2 = phi i32 [ %.pre, %for.body.lr.ph ], [ %spec.store.select, %for.cond.cleanup21 ]
  %i.068 = phi i32 [ 0, %for.body.lr.ph ], [ %inc33, %for.cond.cleanup21 ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.068
  %3 = load float, ptr %arrayidx, align 4, !tbaa !13
  %arrayidx1 = getelementptr inbounds float, ptr %0, i32 %2
  store float %3, ptr %arrayidx1, align 4, !tbaa !13
  %inc = add nsw i32 %2, 1
  %cmp4.not = icmp slt i32 %inc, %1
  %spec.store.select = select i1 %cmp4.not, i32 %inc, i32 0
  store i32 %spec.store.select, ptr %pos, align 4
  %cmp957 = icmp slt i32 %spec.store.select, %1
  br i1 %cmp957, label %for.body11.lr.ph, label %for.cond18.preheader

for.body11.lr.ph:                                 ; preds = %for.body
  %4 = load ptr, ptr %fir, align 4, !tbaa !15
  %5 = sub i32 %1, %spec.store.select
  br label %for.body11

for.cond18.preheader:                             ; preds = %for.body11, %for.body
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.body ], [ %9, %for.body11 ]
  %coeff_pos.0.lcssa = phi i32 [ 0, %for.body ], [ %5, %for.body11 ]
  %cmp2062 = icmp sgt i32 %spec.store.select, 0
  br i1 %cmp2062, label %for.body22.lr.ph, label %for.cond.cleanup21

for.body22.lr.ph:                                 ; preds = %for.cond18.preheader
  %6 = load ptr, ptr %fir, align 4, !tbaa !15
  br label %for.body22

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph
  %n.060 = phi i32 [ %spec.store.select, %for.body11.lr.ph ], [ %inc16, %for.body11 ]
  %coeff_pos.059 = phi i32 [ 0, %for.body11.lr.ph ], [ %inc12, %for.body11 ]
  %acc.058 = phi float [ 0.000000e+00, %for.body11.lr.ph ], [ %9, %for.body11 ]
  %inc12 = add nuw i32 %coeff_pos.059, 1
  %arrayidx13 = getelementptr inbounds float, ptr %4, i32 %coeff_pos.059
  %7 = load float, ptr %arrayidx13, align 4, !tbaa !13
  %arrayidx15 = getelementptr inbounds float, ptr %0, i32 %n.060
  %8 = load float, ptr %arrayidx15, align 4, !tbaa !13
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %acc.058)
  %inc16 = add nsw i32 %n.060, 1
  %exitcond.not = icmp eq i32 %inc12, %5
  br i1 %exitcond.not, label %for.cond18.preheader, label %for.body11, !llvm.loop !16

for.cond.cleanup21:                               ; preds = %for.body22, %for.cond18.preheader
  %acc.1.lcssa = phi float [ %acc.0.lcssa, %for.cond18.preheader ], [ %12, %for.body22 ]
  %arrayidx31 = getelementptr inbounds float, ptr %output, i32 %i.068
  store float %acc.1.lcssa, ptr %arrayidx31, align 4, !tbaa !13
  %inc33 = add nuw nsw i32 %i.068, 1
  %exitcond71.not = icmp eq i32 %inc33, %len
  br i1 %exitcond71.not, label %for.cond.cleanup, label %for.body, !llvm.loop !18

for.body22:                                       ; preds = %for.body22, %for.body22.lr.ph
  %n17.065 = phi i32 [ 0, %for.body22.lr.ph ], [ %inc29, %for.body22 ]
  %coeff_pos.164 = phi i32 [ %coeff_pos.0.lcssa, %for.body22.lr.ph ], [ %inc24, %for.body22 ]
  %acc.163 = phi float [ %acc.0.lcssa, %for.body22.lr.ph ], [ %12, %for.body22 ]
  %inc24 = add nuw nsw i32 %coeff_pos.164, 1
  %arrayidx25 = getelementptr inbounds float, ptr %6, i32 %coeff_pos.164
  %10 = load float, ptr %arrayidx25, align 4, !tbaa !13
  %arrayidx27 = getelementptr inbounds float, ptr %0, i32 %n17.065
  %11 = load float, ptr %arrayidx27, align 4, !tbaa !13
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %acc.163)
  %inc29 = add nuw nsw i32 %n17.065, 1
  %exitcond70.not = icmp eq i32 %inc29, %spec.store.select
  br i1 %exitcond70.not, label %for.cond.cleanup21, label %for.body22, !llvm.loop !19
}
