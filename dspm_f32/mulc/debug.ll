; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspm_sub_f32_ansi(ptr noalias noundef readonly %input1, ptr noalias noundef readonly %input2, ptr noalias noundef writeonly %output, i32 noundef %rows, i32 noundef %cols, i32 noundef %padd1, i32 noundef %padd2, i32 noundef %padd_out, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input1, null
  %cmp1 = icmp eq ptr %input2, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %output, null
  %or.cond69 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %rows, 1
  %or.cond70 = or i1 %or.cond69, %cmp7
  %cmp10 = icmp slt i32 %cols, 1
  %or.cond71 = or i1 %or.cond70, %cmp10
  %0 = or i32 %padd2, %padd1
  %1 = or i32 %0, %padd_out
  %2 = icmp slt i32 %1, 0
  %or.cond74 = or i1 %or.cond71, %2
  %cmp22 = icmp slt i32 %step1, 1
  %or.cond75 = or i1 %cmp22, %or.cond74
  %cmp25 = icmp slt i32 %step2, 1
  %or.cond76 = or i1 %cmp25, %or.cond75
  %cmp28 = icmp slt i32 %step_out, 1
  %or.cond77 = or i1 %cmp28, %or.cond76
  br i1 %or.cond77, label %return, label %if.end30

if.end30:                                         ; preds = %entry
  %add = add nuw nsw i32 %padd1, %cols
  %add31 = add nuw nsw i32 %padd2, %cols
  %add32 = add nuw nsw i32 %padd_out, %cols
  %cmp3380 = icmp sgt i32 %rows, 0
  %sub1 = add nuw i32 %cols, -7
  %cmp35236 = icmp ugt i32 %cols, 7
  br i1 %cmp3380, label %for.cond34.preheader, label %return

for.cond34.preheader:                             ; preds = %if.end30, %for.cond.cleanup36
  %row.084 = phi i32 [ %inc45, %for.cond.cleanup36 ], [ 0, %if.end30 ]
  %ptr_input2.083 = phi ptr [ %add.ptr42, %for.cond.cleanup36 ], [ %input2, %if.end30 ]
  %ptr_input1.082 = phi ptr [ %add.ptr, %for.cond.cleanup36 ], [ %input1, %if.end30 ]
  %output.addr.081 = phi ptr [ %add.ptr43, %for.cond.cleanup36 ], [ %output, %if.end30 ]
  br i1 %cmp35236, label %for.body37.7, label %forCond113Preheader

forCond113Preheader:                              ; preds = %for.body37.7, %for.cond34.preheader
  %col.0.lcssa = phi i32 [ 0, %for.cond34.preheader ], [ %inc.7, %for.body37.7 ]
  %cmp114238 = icmp slt i32 %col.0.lcssa, %cols
  br i1 %cmp114238, label %for.body37.clone, label %for.cond.cleanup36

for.body37.7:                                     ; preds = %for.cond34.preheader, %for.body37.7
  %col.079 = phi i32 [ %inc.7, %for.body37.7 ], [ 0, %for.cond34.preheader ]
  %inc = or disjoint i32 %col.079, 1
  %inc.1 = or disjoint i32 %col.079, 2
  %inc.2 = or disjoint i32 %col.079, 3
  %inc.3 = or disjoint i32 %col.079, 4
  %inc.4 = or disjoint i32 %col.079, 5
  %inc.5 = or disjoint i32 %col.079, 6
  %inc.6 = or disjoint i32 %col.079, 7
  %mul = mul nsw i32 %col.079, %step1
  %mul38 = mul nsw i32 %col.079, %step2
  %mul40 = mul nsw i32 %col.079, %step_out
  %mul.1 = mul nsw i32 %inc, %step1
  %mul38.1 = mul nsw i32 %inc, %step2
  %mul40.1 = mul nsw i32 %inc, %step_out
  %mul.2 = mul nsw i32 %inc.1, %step1
  %mul38.2 = mul nsw i32 %inc.1, %step2
  %mul40.2 = mul nsw i32 %inc.1, %step_out
  %mul.3 = mul nsw i32 %inc.2, %step1
  %mul38.3 = mul nsw i32 %inc.2, %step2
  %mul40.3 = mul nsw i32 %inc.2, %step_out
  %mul.4 = mul nsw i32 %inc.3, %step1
  %mul38.4 = mul nsw i32 %inc.3, %step2
  %mul40.4 = mul nsw i32 %inc.3, %step_out
  %mul.5 = mul nsw i32 %inc.4, %step1
  %mul38.5 = mul nsw i32 %inc.4, %step2
  %mul40.5 = mul nsw i32 %inc.4, %step_out
  %mul.6 = mul nsw i32 %inc.5, %step1
  %mul38.6 = mul nsw i32 %inc.5, %step2
  %mul40.6 = mul nsw i32 %inc.5, %step_out
  %mul.7 = mul nsw i32 %inc.6, %step1
  %mul38.7 = mul nsw i32 %inc.6, %step2
  %mul40.7 = mul nsw i32 %inc.6, %step_out
  %arrayidx = getelementptr inbounds float, ptr %ptr_input1.082, i32 %mul
  %arrayidx39 = getelementptr inbounds float, ptr %ptr_input2.083, i32 %mul38
  %arrayidx41 = getelementptr inbounds float, ptr %output.addr.081, i32 %mul40
  %arrayidx.1 = getelementptr inbounds float, ptr %ptr_input1.082, i32 %mul.1
  %arrayidx39.1 = getelementptr inbounds float, ptr %ptr_input2.083, i32 %mul38.1
  %arrayidx41.1 = getelementptr inbounds float, ptr %output.addr.081, i32 %mul40.1
  %arrayidx.2 = getelementptr inbounds float, ptr %ptr_input1.082, i32 %mul.2
  %arrayidx39.2 = getelementptr inbounds float, ptr %ptr_input2.083, i32 %mul38.2
  %arrayidx41.2 = getelementptr inbounds float, ptr %output.addr.081, i32 %mul40.2
  %arrayidx.3 = getelementptr inbounds float, ptr %ptr_input1.082, i32 %mul.3
  %arrayidx39.3 = getelementptr inbounds float, ptr %ptr_input2.083, i32 %mul38.3
  %arrayidx41.3 = getelementptr inbounds float, ptr %output.addr.081, i32 %mul40.3
  %arrayidx.4 = getelementptr inbounds float, ptr %ptr_input1.082, i32 %mul.4
  %arrayidx39.4 = getelementptr inbounds float, ptr %ptr_input2.083, i32 %mul38.4
  %arrayidx41.4 = getelementptr inbounds float, ptr %output.addr.081, i32 %mul40.4
  %arrayidx.5 = getelementptr inbounds float, ptr %ptr_input1.082, i32 %mul.5
  %arrayidx39.5 = getelementptr inbounds float, ptr %ptr_input2.083, i32 %mul38.5
  %arrayidx41.5 = getelementptr inbounds float, ptr %output.addr.081, i32 %mul40.5
  %arrayidx.6 = getelementptr inbounds float, ptr %ptr_input1.082, i32 %mul.6
  %arrayidx39.6 = getelementptr inbounds float, ptr %ptr_input2.083, i32 %mul38.6
  %arrayidx41.6 = getelementptr inbounds float, ptr %output.addr.081, i32 %mul40.6
  %arrayidx.7 = getelementptr inbounds float, ptr %ptr_input1.082, i32 %mul.7
  %arrayidx39.7 = getelementptr inbounds float, ptr %ptr_input2.083, i32 %mul38.7
  %arrayidx41.7 = getelementptr inbounds float, ptr %output.addr.081, i32 %mul40.7
  %3 = load float, ptr %arrayidx, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx39, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx.1, align 4, !tbaa !4
  %6 = load float, ptr %arrayidx39.1, align 4, !tbaa !4
  %7 = load float, ptr %arrayidx.2, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx39.2, align 4, !tbaa !4
  %9 = load float, ptr %arrayidx.3, align 4, !tbaa !4
  %10 = load float, ptr %arrayidx39.3, align 4, !tbaa !4
  %11 = load float, ptr %arrayidx.4, align 4, !tbaa !4
  %12 = load float, ptr %arrayidx39.4, align 4, !tbaa !4
  %13 = load float, ptr %arrayidx.5, align 4, !tbaa !4
  %14 = load float, ptr %arrayidx39.5, align 4, !tbaa !4
  %15 = load float, ptr %arrayidx.6, align 4, !tbaa !4
  %16 = load float, ptr %arrayidx39.6, align 4, !tbaa !4
  %17 = load float, ptr %arrayidx.7, align 4, !tbaa !4
  %18 = load float, ptr %arrayidx39.7, align 4, !tbaa !4
  %sub = fsub float %3, %4
  %sub.1 = fsub float %5, %6
  %sub.2 = fsub float %7, %8
  %sub.3 = fsub float %9, %10
  %sub.4 = fsub float %11, %12
  %sub.5 = fsub float %13, %14
  %sub.6 = fsub float %15, %16
  %sub.7 = fsub float %17, %18
  store float %sub, ptr %arrayidx41, align 4, !tbaa !4
  store float %sub.1, ptr %arrayidx41.1, align 4, !tbaa !4
  store float %sub.2, ptr %arrayidx41.2, align 4, !tbaa !4
  store float %sub.3, ptr %arrayidx41.3, align 4, !tbaa !4
  store float %sub.4, ptr %arrayidx41.4, align 4, !tbaa !4
  store float %sub.5, ptr %arrayidx41.5, align 4, !tbaa !4
  store float %sub.6, ptr %arrayidx41.6, align 4, !tbaa !4
  store float %sub.7, ptr %arrayidx41.7, align 4, !tbaa !4
  %inc.7 = add nuw nsw i32 %col.079, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub1
  br i1 %exitcond.not.7, label %for.body37.7, label %forCond113Preheader, !llvm.loop !8

for.body37.clone:                                 ; preds = %forCond113Preheader, %for.body37.clone
  %col.079.clone = phi i32 [ %inc.clone, %for.body37.clone ], [ %col.0.lcssa, %forCond113Preheader ]
  %mul.clone = mul nsw i32 %col.079.clone, %step1
  %arrayidx.clone = getelementptr inbounds float, ptr %ptr_input1.082, i32 %mul.clone
  %19 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %mul38.clone = mul nsw i32 %col.079.clone, %step2
  %arrayidx39.clone = getelementptr inbounds float, ptr %ptr_input2.083, i32 %mul38.clone
  %20 = load float, ptr %arrayidx39.clone, align 4, !tbaa !4
  %sub.clone = fsub float %19, %20
  %mul40.clone = mul nsw i32 %col.079.clone, %step_out
  %arrayidx41.clone = getelementptr inbounds float, ptr %output.addr.081, i32 %mul40.clone
  store float %sub.clone, ptr %arrayidx41.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %col.079.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %cols
  br i1 %exitcond.not.clone, label %for.cond.cleanup36, label %for.body37.clone, !llvm.loop !8

for.cond.cleanup36:                               ; preds = %for.body37.clone, %forCond113Preheader
  %add.ptr = getelementptr inbounds float, ptr %ptr_input1.082, i32 %add
  %add.ptr42 = getelementptr inbounds float, ptr %ptr_input2.083, i32 %add31
  %add.ptr43 = getelementptr inbounds float, ptr %output.addr.081, i32 %add32
  %inc45 = add nuw nsw i32 %row.084, 1
  %exitcond85.not = icmp eq i32 %inc45, %rows
  br i1 %exitcond85.not, label %return, label %for.cond34.preheader, !llvm.loop !10

return:                                           ; preds = %for.cond.cleanup36, %if.end30, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %if.end30 ], [ 0, %for.cond.cleanup36 ]
  ret i32 %retval.0
}
