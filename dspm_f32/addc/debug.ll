; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspm_mulc_f32_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, float noundef %C, i32 noundef %rows, i32 noundef %cols, i32 noundef %padd_in, i32 noundef %padd_out, i32 noundef %step_in, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp slt i32 %rows, 1
  %or.cond51 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %cols, 1
  %or.cond52 = or i1 %or.cond51, %cmp7
  %0 = or i32 %padd_out, %padd_in
  %1 = icmp slt i32 %0, 0
  %or.cond54 = or i1 %or.cond52, %1
  %cmp16 = icmp slt i32 %step_in, 1
  %or.cond55 = or i1 %cmp16, %or.cond54
  %cmp19 = icmp slt i32 %step_out, 1
  %or.cond56 = or i1 %cmp19, %or.cond55
  br i1 %or.cond56, label %return, label %if.end21

if.end21:                                         ; preds = %entry
  %add = add nuw nsw i32 %padd_in, %cols
  %add22 = add nuw nsw i32 %padd_out, %cols
  %sub = add nuw i32 %cols, -7
  %cmp35236 = icmp ugt i32 %cols, 7
  br label %for.body27.preheader

for.body27.preheader:                             ; preds = %for.cond.cleanup26, %if.end21
  %row.061 = phi i32 [ 0, %if.end21 ], [ %inc33, %for.cond.cleanup26 ]
  %ptr_input.060 = phi ptr [ %input, %if.end21 ], [ %add.ptr, %for.cond.cleanup26 ]
  %output.addr.059 = phi ptr [ %output, %if.end21 ], [ %add.ptr31, %for.cond.cleanup26 ]
  br i1 %cmp35236, label %for.body27.7, label %forCond113Preheader

forCond113Preheader:                              ; preds = %for.body27.7, %for.body27.preheader
  %col.0.lcssa = phi i32 [ 0, %for.body27.preheader ], [ %inc.7, %for.body27.7 ]
  %cmp114238 = icmp slt i32 %col.0.lcssa, %cols
  br i1 %cmp114238, label %for.body27.clone, label %for.cond.cleanup26

for.body27.7:                                     ; preds = %for.body27.preheader, %for.body27.7
  %col.058 = phi i32 [ %inc.7, %for.body27.7 ], [ 0, %for.body27.preheader ]
  %inc = or disjoint i32 %col.058, 1
  %inc.1 = or disjoint i32 %col.058, 2
  %inc.2 = or disjoint i32 %col.058, 3
  %inc.3 = or disjoint i32 %col.058, 4
  %inc.4 = or disjoint i32 %col.058, 5
  %inc.5 = or disjoint i32 %col.058, 6
  %inc.6 = or disjoint i32 %col.058, 7
  %mul = mul nsw i32 %col.058, %step_in
  %mul29 = mul nsw i32 %col.058, %step_out
  %mul.1 = mul nsw i32 %inc, %step_in
  %mul29.1 = mul nsw i32 %inc, %step_out
  %mul.2 = mul nsw i32 %inc.1, %step_in
  %mul29.2 = mul nsw i32 %inc.1, %step_out
  %mul.3 = mul nsw i32 %inc.2, %step_in
  %mul29.3 = mul nsw i32 %inc.2, %step_out
  %mul.4 = mul nsw i32 %inc.3, %step_in
  %mul29.4 = mul nsw i32 %inc.3, %step_out
  %mul.5 = mul nsw i32 %inc.4, %step_in
  %mul29.5 = mul nsw i32 %inc.4, %step_out
  %mul.6 = mul nsw i32 %inc.5, %step_in
  %mul29.6 = mul nsw i32 %inc.5, %step_out
  %mul.7 = mul nsw i32 %inc.6, %step_in
  %mul29.7 = mul nsw i32 %inc.6, %step_out
  %arrayidx = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul
  %arrayidx30 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29
  %arrayidx.1 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.1
  %arrayidx30.1 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.1
  %arrayidx.2 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.2
  %arrayidx30.2 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.2
  %arrayidx.3 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.3
  %arrayidx30.3 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.3
  %arrayidx.4 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.4
  %arrayidx30.4 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.4
  %arrayidx.5 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.5
  %arrayidx30.5 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.5
  %arrayidx.6 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.6
  %arrayidx30.6 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.6
  %arrayidx.7 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.7
  %arrayidx30.7 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.7
  %2 = load float, ptr %arrayidx, align 4, !tbaa !4
  %3 = load float, ptr %arrayidx.1, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx.2, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx.3, align 4, !tbaa !4
  %6 = load float, ptr %arrayidx.4, align 4, !tbaa !4
  %7 = load float, ptr %arrayidx.5, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx.6, align 4, !tbaa !4
  %9 = load float, ptr %arrayidx.7, align 4, !tbaa !4
  store float %mul28, ptr %arrayidx30, align 4, !tbaa !4
  store float %mul28.1, ptr %arrayidx30.1, align 4, !tbaa !4
  store float %mul28.2, ptr %arrayidx30.2, align 4, !tbaa !4
  store float %mul28.3, ptr %arrayidx30.3, align 4, !tbaa !4
  store float %mul28.4, ptr %arrayidx30.4, align 4, !tbaa !4
  store float %mul28.5, ptr %arrayidx30.5, align 4, !tbaa !4
  store float %mul28.6, ptr %arrayidx30.6, align 4, !tbaa !4
  store float %mul28.7, ptr %arrayidx30.7, align 4, !tbaa !4
  %mul28 = fmul float %2, %C
  %mul28.1 = fmul float %3, %C
  %mul28.2 = fmul float %4, %C
  %mul28.3 = fmul float %5, %C
  %mul28.4 = fmul float %6, %C
  %mul28.5 = fmul float %7, %C
  %mul28.6 = fmul float %8, %C
  %mul28.7 = fmul float %9, %C
  %inc.7 = add nuw nsw i32 %col.058, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub
  br i1 %exitcond.not.7, label %for.body27.7, label %forCond113Preheader, !llvm.loop !8

for.body27.clone:                                 ; preds = %forCond113Preheader, %for.body27.clone
  %col.058.clone = phi i32 [ %inc.clone, %for.body27.clone ], [ %col.0.lcssa, %forCond113Preheader ]
  %mul.clone = mul nsw i32 %col.058.clone, %step_in
  %arrayidx.clone = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.clone
  %10 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %mul28.clone = fmul float %10, %C
  %mul29.clone = mul nsw i32 %col.058.clone, %step_out
  %arrayidx30.clone = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.clone
  store float %mul28.clone, ptr %arrayidx30.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %col.058.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %cols
  br i1 %exitcond.not.clone, label %for.cond.cleanup26, label %for.body27.clone, !llvm.loop !8

for.cond.cleanup26:                               ; preds = %for.body27.clone, %forCond113Preheader
  %add.ptr = getelementptr inbounds float, ptr %ptr_input.060, i32 %add
  %add.ptr31 = getelementptr inbounds float, ptr %output.addr.059, i32 %add22
  %inc33 = add nuw nsw i32 %row.061, 1
  %exitcond62.not = icmp eq i32 %inc33, %rows
  br i1 %exitcond62.not, label %return, label %for.body27.preheader, !llvm.loop !10

return:                                           ; preds = %for.cond.cleanup26, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.cleanup26 ]
  ret i32 %retval.0
}
