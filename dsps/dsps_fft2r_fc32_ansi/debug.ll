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
  %cmp103 = icmp sgt i32 %N, 1
  br i1 %cmp103, label %for.cond3.preheader, label %return

for.cond3.preheader:                              ; preds = %if.end2, %for.cond.cleanup5
  %N2.0105.in = phi i32 [ %N2.0105, %for.cond.cleanup5 ], [ %N, %if.end2 ]
  %ie.0104 = phi i32 [ %shl, %for.cond.cleanup5 ], [ 1, %if.end2 ]
  %N2.0105 = lshr i32 %N2.0105.in, 1
  %cmp4100 = icmp sgt i32 %ie.0104, 0
  br i1 %cmp4100, label %for.body6.lr.ph, label %for.cond.cleanup5

for.body6.lr.ph:                                  ; preds = %for.cond3.preheader
  %sub3 = add nsw i32 %N2.0105, -3
  %and = and i32 %N2.0105, 1073741820
  %cmp1097.not = icmp ugt i32 %N2.0105.in, 7
  br label %for.body6

for.cond.cleanup5:                                ; preds = %for.cond.cleanup11, %for.cond3.preheader
  %shl = shl i32 %ie.0104, 1
  %cmp.not = icmp ult i32 %N2.0105.in, 4
  br i1 %cmp.not, label %return, label %for.cond3.preheader, !llvm.loop !7

for.body6:                                        ; preds = %for.cond.cleanup11, %for.body6.lr.ph
  %j.0102 = phi i32 [ 0, %for.body6.lr.ph ], [ %inc54, %for.cond.cleanup11 ]
  %ia.0101 = phi i32 [ 0, %for.body6.lr.ph ], [ %add52, %for.cond.cleanup11 ]
  %mul = shl nuw nsw i32 %j.0102, 1
  %arrayidx = getelementptr inbounds float, ptr %w, i32 %mul
  %1 = load float, ptr %arrayidx, align 4, !tbaa !9
  %add = or disjoint i32 %mul, 1
  %arrayidx8 = getelementptr inbounds float, ptr %w, i32 %add
  %2 = load float, ptr %arrayidx8, align 4, !tbaa !9
  %3 = fneg float %2
  br i1 %cmp1097.not, label %for.body12.3, label %for.cond.preheader

for.cond.preheader:                               ; preds = %for.body12.3, %for.body6
  %i.0991 = phi i32 [ 0, %for.body6 ], [ %and, %for.body12.3 ]
  %ia.1982 = phi i32 [ %ia.0101, %for.body6 ], [ %inc.3, %for.body12.3 ]
  %4 = icmp ult i32 %i.0991, %N2.0105
  br i1 %4, label %for.body12.clone, label %for.cond.cleanup11

for.body12.3:                                     ; preds = %for.body6, %for.body12.3
  %i.099 = phi i32 [ %inc51.3, %for.body12.3 ], [ 0, %for.body6 ]
  %ia.198 = phi i32 [ %inc.3, %for.body12.3 ], [ %ia.0101, %for.body6 ]
  %add13 = add nsw i32 %ia.198, %N2.0105
  %inc = add nsw i32 %ia.198, 1
  %add13.1 = add nsw i32 %inc, %N2.0105
  %inc.1 = add nsw i32 %ia.198, 2
  %add13.2 = add nsw i32 %inc.1, %N2.0105
  %inc.2 = add nsw i32 %ia.198, 3
  %add13.3 = add nsw i32 %inc.2, %N2.0105
  %inc.3 = add nsw i32 %ia.198, 4
  %inc51.3 = add nuw nsw i32 %i.099, 4
  %mul14 = shl nsw i32 %add13, 1
  %mul28 = shl nsw i32 %ia.198, 1
  %mul14.1 = shl nsw i32 %add13.1, 1
  %mul28.1 = shl nsw i32 %inc, 1
  %mul14.2 = shl nsw i32 %add13.2, 1
  %mul28.2 = shl nsw i32 %inc.1, 1
  %mul14.3 = shl nsw i32 %add13.3, 1
  %mul28.3 = shl nsw i32 %inc.2, 1
  %add18 = or disjoint i32 %mul14, 1
  %add33 = or disjoint i32 %mul28, 1
  %add18.1 = or disjoint i32 %mul14.1, 1
  %add33.1 = or disjoint i32 %mul28.1, 1
  %add18.2 = or disjoint i32 %mul14.2, 1
  %add33.2 = or disjoint i32 %mul28.2, 1
  %add18.3 = or disjoint i32 %mul14.3, 1
  %add33.3 = or disjoint i32 %mul28.3, 1
  %arrayidx15 = getelementptr inbounds float, ptr %data, i32 %mul14
  %arrayidx19 = getelementptr inbounds float, ptr %data, i32 %add18
  %arrayidx29 = getelementptr inbounds float, ptr %data, i32 %mul28
  %arrayidx34 = getelementptr inbounds float, ptr %data, i32 %add33
  %arrayidx15.1 = getelementptr inbounds float, ptr %data, i32 %mul14.1
  %arrayidx19.1 = getelementptr inbounds float, ptr %data, i32 %add18.1
  %arrayidx29.1 = getelementptr inbounds float, ptr %data, i32 %mul28.1
  %arrayidx34.1 = getelementptr inbounds float, ptr %data, i32 %add33.1
  %arrayidx15.2 = getelementptr inbounds float, ptr %data, i32 %mul14.2
  %arrayidx19.2 = getelementptr inbounds float, ptr %data, i32 %add18.2
  %arrayidx29.2 = getelementptr inbounds float, ptr %data, i32 %mul28.2
  %arrayidx34.2 = getelementptr inbounds float, ptr %data, i32 %add33.2
  %arrayidx15.3 = getelementptr inbounds float, ptr %data, i32 %mul14.3
  %arrayidx19.3 = getelementptr inbounds float, ptr %data, i32 %add18.3
  %arrayidx29.3 = getelementptr inbounds float, ptr %data, i32 %mul28.3
  %arrayidx34.3 = getelementptr inbounds float, ptr %data, i32 %add33.3
  %5 = load float, ptr %arrayidx15, align 4, !tbaa !9
  %6 = load float, ptr %arrayidx19, align 4, !tbaa !9
  %7 = load float, ptr %arrayidx29, align 4, !tbaa !9
  %8 = load float, ptr %arrayidx34, align 4, !tbaa !9
  %9 = load float, ptr %arrayidx15.1, align 4, !tbaa !9
  %10 = load float, ptr %arrayidx19.1, align 4, !tbaa !9
  %11 = load float, ptr %arrayidx29.1, align 4, !tbaa !9
  %12 = load float, ptr %arrayidx34.1, align 4, !tbaa !9
  %13 = load float, ptr %arrayidx15.2, align 4, !tbaa !9
  %14 = load float, ptr %arrayidx19.2, align 4, !tbaa !9
  %15 = load float, ptr %arrayidx29.2, align 4, !tbaa !9
  %16 = load float, ptr %arrayidx34.2, align 4, !tbaa !9
  %17 = load float, ptr %arrayidx15.3, align 4, !tbaa !9
  %18 = load float, ptr %arrayidx19.3, align 4, !tbaa !9
  %19 = load float, ptr %arrayidx29.3, align 4, !tbaa !9
  %20 = load float, ptr %arrayidx34.3, align 4, !tbaa !9
  %mul20 = fmul float %2, %6
  %neg = fmul float %5, %3
  %mul20.1 = fmul float %2, %10
  %neg.1 = fmul float %9, %3
  %mul20.2 = fmul float %2, %14
  %neg.2 = fmul float %13, %3
  %mul20.3 = fmul float %2, %18
  %neg.3 = fmul float %17, %3
  %21 = tail call float @llvm.fmuladd.f32(float %1, float %5, float %mul20)
  %22 = tail call float @llvm.fmuladd.f32(float %1, float %6, float %neg)
  %23 = tail call float @llvm.fmuladd.f32(float %1, float %9, float %mul20.1)
  %24 = tail call float @llvm.fmuladd.f32(float %1, float %10, float %neg.1)
  %25 = tail call float @llvm.fmuladd.f32(float %1, float %13, float %mul20.2)
  %26 = tail call float @llvm.fmuladd.f32(float %1, float %14, float %neg.2)
  %27 = tail call float @llvm.fmuladd.f32(float %1, float %17, float %mul20.3)
  %28 = tail call float @llvm.fmuladd.f32(float %1, float %18, float %neg.3)
  %add41 = fadd float %7, %21
  %add47 = fadd float %22, %8
  %add41.1 = fadd float %11, %23
  %add47.1 = fadd float %24, %12
  %add41.2 = fadd float %15, %25
  %add47.2 = fadd float %26, %16
  %add41.3 = fadd float %19, %27
  %add47.3 = fadd float %28, %20
  %sub = fsub float %7, %21
  %sub35 = fsub float %8, %22
  %sub.1 = fsub float %11, %23
  %sub35.1 = fsub float %12, %24
  %sub.2 = fsub float %15, %25
  %sub35.2 = fsub float %16, %26
  %sub.3 = fsub float %19, %27
  %sub35.3 = fsub float %20, %28
  store float %sub, ptr %arrayidx15, align 4, !tbaa !9
  store float %sub35, ptr %arrayidx19, align 4, !tbaa !9
  store float %add41, ptr %arrayidx29, align 4, !tbaa !9
  store float %add47, ptr %arrayidx34, align 4, !tbaa !9
  store float %sub.1, ptr %arrayidx15.1, align 4, !tbaa !9
  store float %sub35.1, ptr %arrayidx19.1, align 4, !tbaa !9
  store float %add41.1, ptr %arrayidx29.1, align 4, !tbaa !9
  store float %add47.1, ptr %arrayidx34.1, align 4, !tbaa !9
  store float %sub.2, ptr %arrayidx15.2, align 4, !tbaa !9
  store float %sub35.2, ptr %arrayidx19.2, align 4, !tbaa !9
  store float %add41.2, ptr %arrayidx29.2, align 4, !tbaa !9
  store float %add47.2, ptr %arrayidx34.2, align 4, !tbaa !9
  store float %sub.3, ptr %arrayidx15.3, align 4, !tbaa !9
  store float %sub35.3, ptr %arrayidx19.3, align 4, !tbaa !9
  store float %add41.3, ptr %arrayidx29.3, align 4, !tbaa !9
  store float %add47.3, ptr %arrayidx34.3, align 4, !tbaa !9
  %exitcond.not.3 = icmp slt i32 %inc51.3, %sub3
  br i1 %exitcond.not.3, label %for.body12.3, label %for.cond.preheader, !llvm.loop !11

for.body12.clone:                                 ; preds = %for.cond.preheader, %for.body12.clone
  %i.099.clone = phi i32 [ %inc51.clone, %for.body12.clone ], [ %i.0991, %for.cond.preheader ]
  %ia.198.clone = phi i32 [ %inc.clone, %for.body12.clone ], [ %ia.1982, %for.cond.preheader ]
  %add13.clone = add nsw i32 %ia.198.clone, %N2.0105
  %inc.clone = add nsw i32 %ia.198.clone, 1
  %inc51.clone = add nuw nsw i32 %i.099.clone, 1
  %mul14.clone = shl nsw i32 %add13.clone, 1
  %mul28.clone = shl nsw i32 %ia.198.clone, 1
  %add18.clone = or disjoint i32 %mul14.clone, 1
  %add33.clone = or disjoint i32 %mul28.clone, 1
  %arrayidx15.clone = getelementptr inbounds float, ptr %data, i32 %mul14.clone
  %arrayidx19.clone = getelementptr inbounds float, ptr %data, i32 %add18.clone
  %arrayidx29.clone = getelementptr inbounds float, ptr %data, i32 %mul28.clone
  %arrayidx34.clone = getelementptr inbounds float, ptr %data, i32 %add33.clone
  %29 = load float, ptr %arrayidx15.clone, align 4, !tbaa !9
  %30 = load float, ptr %arrayidx19.clone, align 4, !tbaa !9
  %31 = load float, ptr %arrayidx29.clone, align 4, !tbaa !9
  %32 = load float, ptr %arrayidx34.clone, align 4, !tbaa !9
  %mul20.clone = fmul float %2, %30
  %neg.clone = fmul float %29, %3
  %33 = tail call float @llvm.fmuladd.f32(float %1, float %29, float %mul20.clone)
  %34 = tail call float @llvm.fmuladd.f32(float %1, float %30, float %neg.clone)
  %add41.clone = fadd float %31, %33
  %add47.clone = fadd float %34, %32
  %sub.clone = fsub float %31, %33
  %sub35.clone = fsub float %32, %34
  store float %sub.clone, ptr %arrayidx15.clone, align 4, !tbaa !9
  store float %sub35.clone, ptr %arrayidx19.clone, align 4, !tbaa !9
  store float %add41.clone, ptr %arrayidx29.clone, align 4, !tbaa !9
  store float %add47.clone, ptr %arrayidx34.clone, align 4, !tbaa !9
  %exitcond.not.clone = icmp eq i32 %inc51.clone, %N2.0105
  br i1 %exitcond.not.clone, label %for.cond.cleanup11, label %for.body12.clone

for.cond.cleanup11:                               ; preds = %for.body12.clone, %for.cond.preheader
  %35 = phi i32 [ %ia.1982, %for.cond.preheader ], [ %inc.clone, %for.body12.clone ]
  %add52 = add nsw i32 %35, %N2.0105
  %inc54 = add nuw nsw i32 %j.0102, 1
  %exitcond106.not = icmp eq i32 %inc54, %ie.0104
  br i1 %exitcond106.not, label %for.cond.cleanup5, label %for.body6, !llvm.loop !12

return:                                           ; preds = %for.cond.cleanup5, %if.end2, %if.end, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 458756, %if.end ], [ 0, %if.end2 ], [ 0, %for.cond.cleanup5 ]
  ret i32 %retval.0
}
