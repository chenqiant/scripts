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
  br i1 %cmp103, label %for.cond3.preheader.preheader, label %return

for.cond3.preheader.preheader:                    ; preds = %if.end2
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond3.preheader.preheader, %for.cond.cleanup5
  %N2.0105.in = phi i32 [ %N2.0105, %for.cond.cleanup5 ], [ %N, %for.cond3.preheader.preheader ]
  %ie.0104 = phi i32 [ %shl, %for.cond.cleanup5 ], [ 1, %for.cond3.preheader.preheader ]
  %N2.0105 = lshr i32 %N2.0105.in, 1
  %cmp4100 = icmp sgt i32 %ie.0104, 0
  br i1 %cmp4100, label %for.body6.lr.ph, label %for.cond.cleanup5

for.body6.lr.ph:                                  ; preds = %for.cond3.preheader
  %cmp1097.not = icmp ult i32 %N2.0105.in, 2
  br label %for.body6

for.cond.cleanup5.loopexit:                       ; preds = %for.cond.cleanup11
  br label %for.cond.cleanup5

for.cond.cleanup5:                                ; preds = %for.cond.cleanup5.loopexit, %for.cond3.preheader
  %shl = shl i32 %ie.0104, 1
  %cmp.not = icmp ult i32 %N2.0105.in, 4
  br i1 %cmp.not, label %return.loopexit, label %for.cond3.preheader, !llvm.loop !7

for.body6:                                        ; preds = %for.cond.cleanup11, %for.body6.lr.ph
  %j.0102 = phi i32 [ 0, %for.body6.lr.ph ], [ %inc54, %for.cond.cleanup11 ]
  %ia.0101 = phi i32 [ 0, %for.body6.lr.ph ], [ %add52, %for.cond.cleanup11 ]
  %mul = shl nuw nsw i32 %j.0102, 1
  %arrayidx = getelementptr inbounds float, ptr %w, i32 %mul
  %1 = load float, ptr %arrayidx, align 4, !tbaa !9
  %add = or disjoint i32 %mul, 1
  %arrayidx8 = getelementptr inbounds float, ptr %w, i32 %add
  %2 = load float, ptr %arrayidx8, align 4, !tbaa !9
  br i1 %cmp1097.not, label %for.cond.cleanup11, label %for.body12.lr.ph

for.body12.lr.ph:                                 ; preds = %for.body6
  %3 = fneg float %2
  br label %for.body12

for.cond.cleanup11.loopexit:                      ; preds = %for.body12.3, %for.body12.2, %for.body12.1, %for.body12
  %inc.lcssa = phi i32 [ %inc, %for.body12 ], [ %inc.1, %for.body12.1 ], [ %inc.2, %for.body12.2 ], [ %inc.3, %for.body12.3 ]
  br label %for.cond.cleanup11

for.cond.cleanup11:                               ; preds = %for.cond.cleanup11.loopexit, %for.body6
  %ia.1.lcssa = phi i32 [ %ia.0101, %for.body6 ], [ %inc.lcssa, %for.cond.cleanup11.loopexit ]
  %add52 = add nsw i32 %ia.1.lcssa, %N2.0105
  %inc54 = add nuw nsw i32 %j.0102, 1
  %exitcond106.not = icmp eq i32 %inc54, %ie.0104
  br i1 %exitcond106.not, label %for.cond.cleanup5.loopexit, label %for.body6, !llvm.loop !11

for.body12:                                       ; preds = %for.body12.3, %for.body12.lr.ph
  %i.099 = phi i32 [ 0, %for.body12.lr.ph ], [ %inc51.3, %for.body12.3 ]
  %ia.198 = phi i32 [ %ia.0101, %for.body12.lr.ph ], [ %inc.3, %for.body12.3 ]
  %add13 = add nsw i32 %ia.198, %N2.0105
  %inc = add nsw i32 %ia.198, 1
  %inc51 = add nuw nsw i32 %i.099, 1
  %mul14 = shl nsw i32 %add13, 1
  %mul28 = shl nsw i32 %ia.198, 1
  %add18 = or disjoint i32 %mul14, 1
  %add33 = or disjoint i32 %mul28, 1
  %arrayidx15 = getelementptr inbounds float, ptr %data, i32 %mul14
  %arrayidx19 = getelementptr inbounds float, ptr %data, i32 %add18
  %arrayidx29 = getelementptr inbounds float, ptr %data, i32 %mul28
  %arrayidx34 = getelementptr inbounds float, ptr %data, i32 %add33
  %4 = load float, ptr %arrayidx15, align 4, !tbaa !9
  %5 = load float, ptr %arrayidx19, align 4, !tbaa !9
  %6 = load float, ptr %arrayidx29, align 4, !tbaa !9
  %7 = load float, ptr %arrayidx34, align 4, !tbaa !9
  %mul20 = fmul float %2, %5
  %neg = fmul float %4, %3
  %8 = tail call float @llvm.fmuladd.f32(float %1, float %4, float %mul20)
  %9 = tail call float @llvm.fmuladd.f32(float %1, float %5, float %neg)
  %add41 = fadd float %6, %8
  %add47 = fadd float %9, %7
  %sub = fsub float %6, %8
  %sub35 = fsub float %7, %9
  store float %sub, ptr %arrayidx15, align 4, !tbaa !9
  store float %sub35, ptr %arrayidx19, align 4, !tbaa !9
  store float %add41, ptr %arrayidx29, align 4, !tbaa !9
  store float %add47, ptr %arrayidx34, align 4, !tbaa !9
  %exitcond.not = icmp eq i32 %inc51, %N2.0105
  br i1 %exitcond.not, label %for.cond.cleanup11.loopexit, label %for.body12.1, !llvm.loop !12

for.body12.1:                                     ; preds = %for.body12
  %add13.1 = add nsw i32 %inc, %N2.0105
  %inc.1 = add nsw i32 %ia.198, 2
  %inc51.1 = add nuw nsw i32 %i.099, 2
  %mul14.1 = shl nsw i32 %add13.1, 1
  %mul28.1 = shl nsw i32 %inc, 1
  %add18.1 = or disjoint i32 %mul14.1, 1
  %add33.1 = or disjoint i32 %mul28.1, 1
  %arrayidx15.1 = getelementptr inbounds float, ptr %data, i32 %mul14.1
  %arrayidx19.1 = getelementptr inbounds float, ptr %data, i32 %add18.1
  %arrayidx29.1 = getelementptr inbounds float, ptr %data, i32 %mul28.1
  %arrayidx34.1 = getelementptr inbounds float, ptr %data, i32 %add33.1
  %10 = load float, ptr %arrayidx15.1, align 4, !tbaa !9
  %11 = load float, ptr %arrayidx19.1, align 4, !tbaa !9
  %12 = load float, ptr %arrayidx29.1, align 4, !tbaa !9
  %13 = load float, ptr %arrayidx34.1, align 4, !tbaa !9
  %mul20.1 = fmul float %2, %11
  %neg.1 = fmul float %10, %3
  %14 = tail call float @llvm.fmuladd.f32(float %1, float %10, float %mul20.1)
  %15 = tail call float @llvm.fmuladd.f32(float %1, float %11, float %neg.1)
  %add41.1 = fadd float %12, %14
  %add47.1 = fadd float %15, %13
  %sub.1 = fsub float %12, %14
  %sub35.1 = fsub float %13, %15
  store float %sub.1, ptr %arrayidx15.1, align 4, !tbaa !9
  store float %sub35.1, ptr %arrayidx19.1, align 4, !tbaa !9
  store float %add41.1, ptr %arrayidx29.1, align 4, !tbaa !9
  store float %add47.1, ptr %arrayidx34.1, align 4, !tbaa !9
  %exitcond.not.1 = icmp eq i32 %inc51.1, %N2.0105
  br i1 %exitcond.not.1, label %for.cond.cleanup11.loopexit, label %for.body12.2, !llvm.loop !12

for.body12.2:                                     ; preds = %for.body12.1
  %add13.2 = add nsw i32 %inc.1, %N2.0105
  %inc.2 = add nsw i32 %ia.198, 3
  %inc51.2 = add nuw nsw i32 %i.099, 3
  %mul14.2 = shl nsw i32 %add13.2, 1
  %mul28.2 = shl nsw i32 %inc.1, 1
  %add18.2 = or disjoint i32 %mul14.2, 1
  %add33.2 = or disjoint i32 %mul28.2, 1
  %arrayidx15.2 = getelementptr inbounds float, ptr %data, i32 %mul14.2
  %arrayidx19.2 = getelementptr inbounds float, ptr %data, i32 %add18.2
  %arrayidx29.2 = getelementptr inbounds float, ptr %data, i32 %mul28.2
  %arrayidx34.2 = getelementptr inbounds float, ptr %data, i32 %add33.2
  %16 = load float, ptr %arrayidx15.2, align 4, !tbaa !9
  %17 = load float, ptr %arrayidx19.2, align 4, !tbaa !9
  %18 = load float, ptr %arrayidx29.2, align 4, !tbaa !9
  %19 = load float, ptr %arrayidx34.2, align 4, !tbaa !9
  %mul20.2 = fmul float %2, %17
  %neg.2 = fmul float %16, %3
  %20 = tail call float @llvm.fmuladd.f32(float %1, float %16, float %mul20.2)
  %21 = tail call float @llvm.fmuladd.f32(float %1, float %17, float %neg.2)
  %add41.2 = fadd float %18, %20
  %add47.2 = fadd float %21, %19
  %sub.2 = fsub float %18, %20
  %sub35.2 = fsub float %19, %21
  store float %sub.2, ptr %arrayidx15.2, align 4, !tbaa !9
  store float %sub35.2, ptr %arrayidx19.2, align 4, !tbaa !9
  store float %add41.2, ptr %arrayidx29.2, align 4, !tbaa !9
  store float %add47.2, ptr %arrayidx34.2, align 4, !tbaa !9
  %exitcond.not.2 = icmp eq i32 %inc51.2, %N2.0105
  br i1 %exitcond.not.2, label %for.cond.cleanup11.loopexit, label %for.body12.3, !llvm.loop !12

for.body12.3:                                     ; preds = %for.body12.2
  %add13.3 = add nsw i32 %inc.2, %N2.0105
  %inc.3 = add nsw i32 %ia.198, 4
  %inc51.3 = add nuw nsw i32 %i.099, 4
  %mul14.3 = shl nsw i32 %add13.3, 1
  %mul28.3 = shl nsw i32 %inc.2, 1
  %add18.3 = or disjoint i32 %mul14.3, 1
  %add33.3 = or disjoint i32 %mul28.3, 1
  %arrayidx15.3 = getelementptr inbounds float, ptr %data, i32 %mul14.3
  %arrayidx19.3 = getelementptr inbounds float, ptr %data, i32 %add18.3
  %arrayidx29.3 = getelementptr inbounds float, ptr %data, i32 %mul28.3
  %arrayidx34.3 = getelementptr inbounds float, ptr %data, i32 %add33.3
  %22 = load float, ptr %arrayidx15.3, align 4, !tbaa !9
  %23 = load float, ptr %arrayidx19.3, align 4, !tbaa !9
  %24 = load float, ptr %arrayidx29.3, align 4, !tbaa !9
  %25 = load float, ptr %arrayidx34.3, align 4, !tbaa !9
  %mul20.3 = fmul float %2, %23
  %neg.3 = fmul float %22, %3
  %26 = tail call float @llvm.fmuladd.f32(float %1, float %22, float %mul20.3)
  %27 = tail call float @llvm.fmuladd.f32(float %1, float %23, float %neg.3)
  %add41.3 = fadd float %24, %26
  %add47.3 = fadd float %27, %25
  %sub.3 = fsub float %24, %26
  %sub35.3 = fsub float %25, %27
  store float %sub.3, ptr %arrayidx15.3, align 4, !tbaa !9
  store float %sub35.3, ptr %arrayidx19.3, align 4, !tbaa !9
  store float %add41.3, ptr %arrayidx29.3, align 4, !tbaa !9
  store float %add47.3, ptr %arrayidx34.3, align 4, !tbaa !9
  %exitcond.not.3 = icmp eq i32 %inc51.3, %N2.0105
  br i1 %exitcond.not.3, label %for.cond.cleanup11.loopexit, label %for.body12, !llvm.loop !12

return.loopexit:                                  ; preds = %for.cond.cleanup5
  br label %return

return:                                           ; preds = %return.loopexit, %if.end2, %if.end, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 458756, %if.end ], [ 0, %if.end2 ], [ 0, %return.loopexit ]
  ret i32 %retval.0
}
