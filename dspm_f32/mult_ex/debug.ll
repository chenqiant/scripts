; Function Attrs: nofree nounwind memory(write)
define dso_local void @dsps_wind_blackman_f32(ptr noalias nocapture noundef writeonly %window, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp22 = icmp sgt i32 %len, 0
  br i1 %cmp22, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %sub = add nsw i32 %len, -1
  %conv = sitofp i32 %sub to float
  %div = fdiv float 1.000000e+00, %conv
  %conv4 = fpext float %div to double
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.023 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %mul = shl nuw nsw i32 %i.023, 1
  %conv2 = sitofp i32 %mul to double
  %mul3 = fmul double %conv2, 0x400921FB54442D18
  %mul5 = fmul double %mul3, %conv4
  %conv6 = fptrunc double %mul5 to float
  %call = tail call float @cosf(float noundef %conv6) #3
  %0 = tail call float @llvm.fmuladd.f32(float %call, float -5.000000e-01, float 0x3FDAE147A0000000)
  %mul8 = shl nsw i32 %i.023, 2
  %conv9 = sitofp i32 %mul8 to double
  %mul10 = fmul double %conv9, 0x400921FB54442D18
  %mul12 = fmul double %mul10, %conv4
  %conv13 = fptrunc double %mul12 to float
  %call14 = tail call float @cosf(float noundef %conv13) #3
  %1 = tail call float @llvm.fmuladd.f32(float %call14, float 0x3FB47AE140000000, float %0)
  %arrayidx = getelementptr inbounds float, ptr %window, i32 %i.023
  store float %1, ptr %arrayidx, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.023, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !8
}
