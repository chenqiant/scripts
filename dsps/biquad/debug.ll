; Function Attrs: nounwind
define dso_local noundef i32 @dsps_fft2r_fc32_arp4_(ptr noalias nocapture noundef %data, i32 noundef %N, ptr noalias nocapture noundef readonly %w) local_unnamed_addr #0 {
entry:
  %call = tail call zeroext i1 @dsp_is_power_of_two(i32 noundef %N) #3
  br i1 %call, label %if.end, label %return

if.end:                                           ; preds = %entry
  %0 = load i8, ptr @dsps_fft2r_initialized, align 1, !tbaa !4
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %return, label %if.end2

if.end2:                                          ; preds = %if.end
  %cmp155 = icmp sgt i32 %N, 1
  br i1 %cmp155, label %for.cond3.preheader, label %return

for.cond3.preheader:                              ; preds = %for.cond.cleanup5, %if.end2
  %N2.0157.in = phi i32 [ %N2.0157, %for.cond.cleanup5 ], [ %N, %if.end2 ]
  %ie.0156 = phi i32 [ %shl, %for.cond.cleanup5 ], [ 1, %if.end2 ]
  %N2.0157 = lshr i32 %N2.0157.in, 1
  %cmp4152 = icmp sgt i32 %ie.0156, 0
  br i1 %cmp4152, label %for.body6.lr.ph, label %for.cond.cleanup5

for.body6.lr.ph:                                  ; preds = %for.cond3.preheader
  %cmp10149.not = icmp ult i32 %N2.0157.in, 2
  br label %for.body6

for.cond.cleanup5:                                ; preds = %for.cond.cleanup11, %for.cond3.preheader
  %shl = shl i32 %ie.0156, 1
  %cmp.not = icmp ult i32 %N2.0157.in, 4
  br i1 %cmp.not, label %return, label %for.cond3.preheader, !llvm.loop !7

for.body6:                                        ; preds = %for.cond.cleanup11, %for.body6.lr.ph
  %j.0154 = phi i32 [ 0, %for.body6.lr.ph ], [ %inc75, %for.cond.cleanup11 ]
  %ia.0153 = phi i32 [ 0, %for.body6.lr.ph ], [ %add73, %for.cond.cleanup11 ]
  %mul = shl nuw nsw i32 %j.0154, 1
  %arrayidx = getelementptr inbounds float, ptr %w, i32 %mul
  %1 = load float, ptr %arrayidx, align 4, !tbaa !9
  %add = or disjoint i32 %mul, 1
  %arrayidx8 = getelementptr inbounds float, ptr %w, i32 %add
  %2 = load float, ptr %arrayidx8, align 4, !tbaa !9
  br i1 %cmp10149.not, label %for.cond.cleanup11, label %for.body12.lr.ph

for.body12.lr.ph:                                 ; preds = %for.body6
  %3 = fneg float %2
  br label %for.body12

for.cond.cleanup11:                               ; preds = %for.body12, %for.body6
  %ia.1.lcssa = phi i32 [ %ia.0153, %for.body6 ], [ %inc71, %for.body12 ]
  %add73 = add nsw i32 %ia.1.lcssa, %N2.0157
  %inc75 = add nuw nsw i32 %j.0154, 1
  %exitcond.not = icmp eq i32 %inc75, %ie.0156
  br i1 %exitcond.not, label %for.cond.cleanup5, label %for.body6, !llvm.loop !11

for.body12:                                       ; preds = %for.body12, %for.body12.lr.ph
  %i.0151 = phi i32 [ 0, %for.body12.lr.ph ], [ %add72, %for.body12 ]
  %ia.1150 = phi i32 [ %ia.0153, %for.body12.lr.ph ], [ %inc71, %for.body12 ]
  %add13 = add nsw i32 %ia.1150, %N2.0157
  %inc = add nsw i32 %ia.1150, 1
  %add41 = add nsw i32 %inc, %N2.0157
  %inc71 = add nsw i32 %ia.1150, 2
  %add72 = add nuw nsw i32 %i.0151, 2
  %mul14 = shl nsw i32 %ia.1150, 1
  %mul19 = shl nsw i32 %add13, 1
  %mul42 = shl nsw i32 %inc, 1
  %mul47 = shl nsw i32 %add41, 1
  %add17 = or disjoint i32 %mul14, 1
  %add22 = or disjoint i32 %mul19, 1
  %add45 = or disjoint i32 %mul42, 1
  %add50 = or disjoint i32 %mul47, 1
  %arrayidx15 = getelementptr inbounds float, ptr %data, i32 %mul14
  %arrayidx18 = getelementptr inbounds float, ptr %data, i32 %add17
  %arrayidx20 = getelementptr inbounds float, ptr %data, i32 %mul19
  %arrayidx23 = getelementptr inbounds float, ptr %data, i32 %add22
  %arrayidx43 = getelementptr inbounds float, ptr %data, i32 %mul42
  %arrayidx46 = getelementptr inbounds float, ptr %data, i32 %add45
  %arrayidx48 = getelementptr inbounds float, ptr %data, i32 %mul47
  %arrayidx51 = getelementptr inbounds float, ptr %data, i32 %add50
  %4 = load float, ptr %arrayidx15, align 4, !tbaa !9
  %5 = load float, ptr %arrayidx18, align 4, !tbaa !9
  %6 = load float, ptr %arrayidx20, align 4, !tbaa !9
  %7 = load float, ptr %arrayidx23, align 4, !tbaa !9
  %8 = load float, ptr %arrayidx43, align 4, !tbaa !9
  %9 = load float, ptr %arrayidx46, align 4, !tbaa !9
  %10 = load float, ptr %arrayidx48, align 4, !tbaa !9
  %11 = load float, ptr %arrayidx51, align 4, !tbaa !9
  %mul25 = fmul float %2, %7
  %neg = fmul float %6, %3
  %mul53 = fmul float %2, %11
  %neg56 = fmul float %10, %3
  %12 = tail call float @llvm.fmuladd.f32(float %1, float %6, float %mul25)
  %13 = tail call float @llvm.fmuladd.f32(float %1, float %7, float %neg)
  %14 = tail call float @llvm.fmuladd.f32(float %1, float %10, float %mul53)
  %15 = tail call float @llvm.fmuladd.f32(float %1, float %11, float %neg56)
  %add34 = fadd float %4, %12
  %add37 = fadd float %5, %13
  %add64 = fadd float %8, %14
  %add67 = fadd float %9, %15
  %sub = fsub float %4, %12
  %sub30 = fsub float %5, %13
  %sub57 = fsub float %8, %14
  %sub60 = fsub float %9, %15
  store float %sub, ptr %arrayidx20, align 4, !tbaa !9
  store float %sub30, ptr %arrayidx23, align 4, !tbaa !9
  store float %add34, ptr %arrayidx15, align 4, !tbaa !9
  store float %add37, ptr %arrayidx18, align 4, !tbaa !9
  store float %sub57, ptr %arrayidx48, align 4, !tbaa !9
  store float %sub60, ptr %arrayidx51, align 4, !tbaa !9
  store float %add64, ptr %arrayidx43, align 4, !tbaa !9
  store float %add67, ptr %arrayidx46, align 4, !tbaa !9
  %cmp10 = icmp ult i32 %add72, %N2.0157
  br i1 %cmp10, label %for.body12, label %for.cond.cleanup11, !llvm.loop !12

return:                                           ; preds = %for.cond.cleanup5, %if.end2, %if.end, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 458756, %if.end ], [ 0, %if.end2 ], [ 0, %for.cond.cleanup5 ]
  ret i32 %retval.0
}
