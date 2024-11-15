; Function Attrs: nofree nounwind memory(write, argmem: readwrite)
define dso_local noundef i32 @dsps_dct_f32_ref(ptr nocapture noundef readonly %data, i32 noundef %N, ptr nocapture noundef writeonly %result) local_unnamed_addr #0 {
entry:
  %vla = alloca double, i32 %N, align 4
  %conv = sitofp i32 %N to double
  %div = fdiv double 0x400921FB54442D18, %conv
  %conv1 = fptrunc double %div to float
  %conv10 = fpext float %conv1 to double
  %cmp29.not = icmp sgt i32 %N, 0
  br i1 %cmp29.not, label %for.body7, label %for.cond.cleanup

for.cond3.preheader.lr.ph:                        ; preds = %for.body7
  br i1 %cmp29.not, label %for.cond3.preheader, label %for.cond.cleanup

for.cond3.preheader:                              ; preds = %for.cond3.preheader.lr.ph, %for.cond.cleanup6
  %i.030 = phi i32 [ 0, %for.cond3.preheader.lr.ph ], [ %inc16, %for.cond.cleanup6 ]
  %conv9 = uitofp i32 %i.030 to double
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us, %for.cond3.preheader
  %j.028.us = phi i32 [ 0, %for.cond3.preheader ], [ %inc.us, %for.body14.us ]
  %sum.027.us = phi float [ 0.000000e+00, %for.cond3.preheader ], [ %1, %for.body14.us ]
  %arrayidx16.us = getelementptr inbounds double, ptr %vla, i32 %j.028.us
  %a.us = load double, ptr %arrayidx16.us, align 4
  %arrayidx.us = getelementptr inbounds float, ptr %data, i32 %j.028.us
  %0 = load float, ptr %arrayidx.us, align 4, !tbaa !4
  %conv8.us = uitofp i32 %j.028.us to double
  %add.us = fadd double %conv8.us, 5.000000e-01
  %mul.us = fmul double %add.us, %conv9
  %mul11.us = fmul double %a.us, %conv9
  %conv12.us = fptrunc double %mul11.us to float
  %call.us = tail call float @cosf(float noundef %conv12.us) #3
  %1 = tail call float @llvm.fmuladd.f32(float %0, float %call.us, float %sum.027.us)
  %inc.us = add nuw i32 %j.028.us, 1
  %exitcond.not.us = icmp eq i32 %inc.us, %N
  br i1 %exitcond.not.us, label %for.cond.cleanup6, label %for.body14.us, !llvm.loop !8

for.cond.cleanup:                                 ; preds = %for.cond3.preheader.lr.ph, %entry, %for.cond.cleanup6
  ret i32 0

for.cond.cleanup6:                                ; preds = %for.body14.us
  %arrayidx14 = getelementptr inbounds float, ptr %result, i32 %i.030
  store float %1, ptr %arrayidx14, align 4, !tbaa !4
  %inc16 = add nuw i32 %i.030, 1
  %exitcond31.not = icmp eq i32 %inc16, %N
  br i1 %exitcond31.not, label %for.cond.cleanup, label %for.cond3.preheader, !llvm.loop !10

for.body7:                                        ; preds = %entry, %for.body7
  %j.028 = phi i32 [ 0, %entry ], [ %inc, %for.body7 ]
  %conv81 = sitofp i32 %j.028 to float
  %add2 = fadd float %conv81, 5.000000e-01
  %conv3 = fpext float %add2 to double
  %mul3 = fmul double %div, %conv3
  %arrayidx4 = getelementptr float, ptr %vla, i32 %j.028
  store double %mul3, ptr %arrayidx4, align 8
  %inc = add nuw i32 %j.028, 1
  %exitcond.not = icmp eq i32 %inc, %N
  br i1 %exitcond.not, label %for.cond3.preheader.lr.ph, label %for.body7, !llvm.loop !8
}
