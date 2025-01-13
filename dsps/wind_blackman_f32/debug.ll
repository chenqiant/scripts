define dso_local void @dsps_wind_nuttall_f32(ptr noalias nocapture noundef writeonly %window, i32 noundef %len) local_unnamed_addr {
entry:
  %cmp32 = icmp sgt i32 %len, 0
  br i1 %cmp32, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %sub = add nsw i32 %len, -1
  %conv = sitofp i32 %sub to float
  %div = fdiv float 1.000000e+00, %conv
  %conv4 = fpext float %div to double
  %mul1 = fmul double %conv4, 0x401921FB54442D18
  %conv22 = fptrunc double %mul1 to float
  %mul33 = fmul float %conv22, 2.000000e+00
  %mul4 = fmul float %conv22, 3.000000e+00
  %sub4 = add nsw i32 %len, -7
  %cmp169 = icmp sgt i32 %len, 7
  br i1 %cmp169, label %for.body.7, label %for.cond97.preheader

for.cond.cleanup:                                 ; preds = %for.body.clone, %for.cond97.preheader, %entry
  ret void

for.cond97.preheader:                             ; preds = %for.body.7, %for.body.lr.ph
  %i.0.lcssa = phi i32 [ 0, %for.body.lr.ph ], [ %inc.7, %for.body.7 ]
  %cmp98171 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp98171, label %for.body.clone, label %for.cond.cleanup

for.body.7:                                       ; preds = %for.body.lr.ph, %for.body.7
  %i.033 = phi i32 [ %inc.7, %for.body.7 ], [ 0, %for.body.lr.ph ]
  %conv5 = sitofp i32 %i.033 to float
  %mul6 = fmul float %conv22, %conv5
  %call = tail call float @cosf(float noundef %mul6)
  %0 = tail call float @llvm.fmuladd.f32(float %call, float 0xBFDF317F00000000, float 0x3FD6C4E720000000)
  %mul9 = fmul float %mul33, %conv5
  %call14 = tail call float @cosf(float noundef %mul9)
  %1 = tail call float @llvm.fmuladd.f32(float %call14, float 0x3FC27631C0000000, float %0)
  %mul124 = fmul float %mul4, %conv5
  %call22 = tail call float @cosf(float noundef %mul124)
  %2 = tail call float @llvm.fmuladd.f32(float %call22, float 0xBF89D02040000000, float %1)
  %arrayidx = getelementptr inbounds float, ptr %window, i32 %i.033
  store float %2, ptr %arrayidx, align 4
  %inc = or disjoint i32 %i.033, 1
  %conv5.1 = sitofp i32 %inc to float
  %mul6.1 = fmul float %conv22, %conv5.1
  %call.1 = tail call float @cosf(float noundef %mul6.1)
  %3 = tail call float @llvm.fmuladd.f32(float %call.1, float 0xBFDF317F00000000, float 0x3FD6C4E720000000)
  %mul9.1 = fmul float %mul33, %conv5.1
  %call14.1 = tail call float @cosf(float noundef %mul9.1)
  %4 = tail call float @llvm.fmuladd.f32(float %call14.1, float 0x3FC27631C0000000, float %3)
  %mul124.1 = fmul float %mul4, %conv5.1
  %call22.1 = tail call float @cosf(float noundef %mul124.1)
  %5 = tail call float @llvm.fmuladd.f32(float %call22.1, float 0xBF89D02040000000, float %4)
  %arrayidx.1 = getelementptr inbounds float, ptr %window, i32 %inc
  store float %5, ptr %arrayidx.1, align 4
  %inc.1 = or disjoint i32 %i.033, 2
  %conv5.2 = sitofp i32 %inc.1 to float
  %mul6.2 = fmul float %conv22, %conv5.2
  %call.2 = tail call float @cosf(float noundef %mul6.2)
  %6 = tail call float @llvm.fmuladd.f32(float %call.2, float 0xBFDF317F00000000, float 0x3FD6C4E720000000)
  %mul9.2 = fmul float %mul33, %conv5.2
  %call14.2 = tail call float @cosf(float noundef %mul9.2)
  %7 = tail call float @llvm.fmuladd.f32(float %call14.2, float 0x3FC27631C0000000, float %6)
  %mul124.2 = fmul float %mul4, %conv5.2
  %call22.2 = tail call float @cosf(float noundef %mul124.2)
  %8 = tail call float @llvm.fmuladd.f32(float %call22.2, float 0xBF89D02040000000, float %7)
  %arrayidx.2 = getelementptr inbounds float, ptr %window, i32 %inc.1
  store float %8, ptr %arrayidx.2, align 4
  %inc.2 = or disjoint i32 %i.033, 3
  %conv5.3 = sitofp i32 %inc.2 to float
  %mul6.3 = fmul float %conv22, %conv5.3
  %call.3 = tail call float @cosf(float noundef %mul6.3)
  %9 = tail call float @llvm.fmuladd.f32(float %call.3, float 0xBFDF317F00000000, float 0x3FD6C4E720000000)
  %mul9.3 = fmul float %mul33, %conv5.3
  %call14.3 = tail call float @cosf(float noundef %mul9.3)
  %10 = tail call float @llvm.fmuladd.f32(float %call14.3, float 0x3FC27631C0000000, float %9)
  %mul124.3 = fmul float %mul4, %conv5.3
  %call22.3 = tail call float @cosf(float noundef %mul124.3)
  %11 = tail call float @llvm.fmuladd.f32(float %call22.3, float 0xBF89D02040000000, float %10)
  %arrayidx.3 = getelementptr inbounds float, ptr %window, i32 %inc.2
  store float %11, ptr %arrayidx.3, align 4
  %inc.3 = or disjoint i32 %i.033, 4
  %conv5.4 = sitofp i32 %inc.3 to float
  %mul6.4 = fmul float %conv22, %conv5.4
  %call.4 = tail call float @cosf(float noundef %mul6.4)
  %12 = tail call float @llvm.fmuladd.f32(float %call.4, float 0xBFDF317F00000000, float 0x3FD6C4E720000000)
  %mul9.4 = fmul float %mul33, %conv5.4
  %call14.4 = tail call float @cosf(float noundef %mul9.4)
  %13 = tail call float @llvm.fmuladd.f32(float %call14.4, float 0x3FC27631C0000000, float %12)
  %mul124.4 = fmul float %mul4, %conv5.4
  %call22.4 = tail call float @cosf(float noundef %mul124.4)
  %14 = tail call float @llvm.fmuladd.f32(float %call22.4, float 0xBF89D02040000000, float %13)
  %arrayidx.4 = getelementptr inbounds float, ptr %window, i32 %inc.3
  store float %14, ptr %arrayidx.4, align 4
  %inc.4 = or disjoint i32 %i.033, 5
  %conv5.5 = sitofp i32 %inc.4 to float
  %mul6.5 = fmul float %conv22, %conv5.5
  %call.5 = tail call float @cosf(float noundef %mul6.5)
  %15 = tail call float @llvm.fmuladd.f32(float %call.5, float 0xBFDF317F00000000, float 0x3FD6C4E720000000)
  %mul9.5 = fmul float %mul33, %conv5.5
  %call14.5 = tail call float @cosf(float noundef %mul9.5)
  %16 = tail call float @llvm.fmuladd.f32(float %call14.5, float 0x3FC27631C0000000, float %15)
  %mul124.5 = fmul float %mul4, %conv5.5
  %call22.5 = tail call float @cosf(float noundef %mul124.5)
  %17 = tail call float @llvm.fmuladd.f32(float %call22.5, float 0xBF89D02040000000, float %16)
  %arrayidx.5 = getelementptr inbounds float, ptr %window, i32 %inc.4
  store float %17, ptr %arrayidx.5, align 4
  %inc.5 = or disjoint i32 %i.033, 6
  %conv5.6 = sitofp i32 %inc.5 to float
  %mul6.6 = fmul float %conv22, %conv5.6
  %call.6 = tail call float @cosf(float noundef %mul6.6)
  %18 = tail call float @llvm.fmuladd.f32(float %call.6, float 0xBFDF317F00000000, float 0x3FD6C4E720000000)
  %mul9.6 = fmul float %mul33, %conv5.6
  %call14.6 = tail call float @cosf(float noundef %mul9.6)
  %19 = tail call float @llvm.fmuladd.f32(float %call14.6, float 0x3FC27631C0000000, float %18)
  %mul124.6 = fmul float %mul4, %conv5.6
  %call22.6 = tail call float @cosf(float noundef %mul124.6)
  %20 = tail call float @llvm.fmuladd.f32(float %call22.6, float 0xBF89D02040000000, float %19)
  %arrayidx.6 = getelementptr inbounds float, ptr %window, i32 %inc.5
  store float %20, ptr %arrayidx.6, align 4
  %inc.6 = or disjoint i32 %i.033, 7
  %conv5.7 = sitofp i32 %inc.6 to float
  %mul6.7 = fmul float %conv22, %conv5.7
  %call.7 = tail call float @cosf(float noundef %mul6.7)
  %21 = tail call float @llvm.fmuladd.f32(float %call.7, float 0xBFDF317F00000000, float 0x3FD6C4E720000000)
  %mul9.7 = fmul float %mul33, %conv5.7
  %call14.7 = tail call float @cosf(float noundef %mul9.7)
  %22 = tail call float @llvm.fmuladd.f32(float %call14.7, float 0x3FC27631C0000000, float %21)
  %mul124.7 = fmul float %mul4, %conv5.7
  %call22.7 = tail call float @cosf(float noundef %mul124.7)
  %23 = tail call float @llvm.fmuladd.f32(float %call22.7, float 0xBF89D02040000000, float %22)
  %arrayidx.7 = getelementptr inbounds float, ptr %window, i32 %inc.6
  store float %23, ptr %arrayidx.7, align 4
  %inc.7 = add nuw nsw i32 %i.033, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub4
  br i1 %exitcond.not.7, label %for.body.7, label %for.cond97.preheader

for.body.clone:                                   ; preds = %for.cond97.preheader, %for.body.clone
  %i.033.clone = phi i32 [ %inc.clone, %for.body.clone ], [ %i.0.lcssa, %for.cond97.preheader ]
  %conv5.clone = sitofp i32 %i.033.clone to float
  %mul6.clone = fmul float %conv22, %conv5.clone
  %call.clone = tail call float @cosf(float noundef %mul6.clone)
  %24 = tail call float @llvm.fmuladd.f32(float %call.clone, float 0xBFDF317F00000000, float 0x3FD6C4E720000000)
  %mul9.clone = fmul float %mul33, %conv5.clone
  %call14.clone = tail call float @cosf(float noundef %mul9.clone)
  %25 = tail call float @llvm.fmuladd.f32(float %call14.clone, float 0x3FC27631C0000000, float %24)
  %mul124.clone = fmul float %mul4, %conv5.clone
  %call22.clone = tail call float @cosf(float noundef %mul124.clone)
  %26 = tail call float @llvm.fmuladd.f32(float %call22.clone, float 0xBF89D02040000000, float %25)
  %arrayidx.clone = getelementptr inbounds float, ptr %window, i32 %i.033.clone
  store float %26, ptr %arrayidx.clone, align 4
  %inc.clone = add nuw nsw i32 %i.033.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %for.cond.cleanup, label %for.body.clone
}
