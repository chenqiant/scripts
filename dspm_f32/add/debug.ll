; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspm_addc_f32_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, float noundef %C, i32 noundef %rows, i32 noundef %cols, i32 noundef %padd_in, i32 noundef %padd_out, i32 noundef %step_in, i32 noundef %step_out) local_unnamed_addr #0 {
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
  br label %for.body27.preheader

for.body27.preheader:                             ; preds = %for.cond.cleanup26, %if.end21
  %row.061 = phi i32 [ 0, %if.end21 ], [ %inc33, %for.cond.cleanup26 ]
  %ptr_input.060 = phi ptr [ %input, %if.end21 ], [ %add.ptr31, %for.cond.cleanup26 ]
  %output.addr.059 = phi ptr [ %output, %if.end21 ], [ %add.ptr, %for.cond.cleanup26 ]
  br i1 %cmp35236, label %for.body27.7, label %forCond113Preheader

forCond113Preheader:                              ; preds = %for.body27.7, %for.body27.preheader
  %col.0.lcssa = phi i32 [ 0, %for.body27.preheader ], [ %inc.7, %for.body27.7 ]
  %cmp114238 = icmp slt i32 %col.0.lcssa, %cols
  br i1 %cmp114238, label %for.body27.clone, label %for.cond.cleanup26

for.body27.7:                                     ; preds = %for.body27.preheader, %for.body27.7
  %col.058 = phi i32 [ %inc.7, %for.body27.7 ], [ 0, %for.body27.preheader ]
  %mul = mul nsw i32 %col.058, %step_in
  %arrayidx = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul
  %2 = load float, ptr %arrayidx, align 4, !tbaa !4
  %add28 = fadd float %2, %C
  %mul29 = mul nsw i32 %col.058, %step_out
  %arrayidx30 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29
  store float %add28, ptr %arrayidx30, align 4, !tbaa !4
  %inc = or disjoint i32 %col.058, 1
  %mul.1 = mul nsw i32 %inc, %step_in
  %arrayidx.1 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.1
  %3 = load float, ptr %arrayidx.1, align 4, !tbaa !4
  %add28.1 = fadd float %3, %C
  %mul29.1 = mul nsw i32 %inc, %step_out
  %arrayidx30.1 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.1
  store float %add28.1, ptr %arrayidx30.1, align 4, !tbaa !4
  %inc.1 = or disjoint i32 %col.058, 2
  %mul.2 = mul nsw i32 %inc.1, %step_in
  %arrayidx.2 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.2
  %4 = load float, ptr %arrayidx.2, align 4, !tbaa !4
  %add28.2 = fadd float %4, %C
  %mul29.2 = mul nsw i32 %inc.1, %step_out
  %arrayidx30.2 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.2
  store float %add28.2, ptr %arrayidx30.2, align 4, !tbaa !4
  %inc.2 = or disjoint i32 %col.058, 3
  %mul.3 = mul nsw i32 %inc.2, %step_in
  %arrayidx.3 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.3
  %5 = load float, ptr %arrayidx.3, align 4, !tbaa !4
  %add28.3 = fadd float %5, %C
  %mul29.3 = mul nsw i32 %inc.2, %step_out
  %arrayidx30.3 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.3
  store float %add28.3, ptr %arrayidx30.3, align 4, !tbaa !4
  %inc.3 = or disjoint i32 %col.058, 4
  %mul.4 = mul nsw i32 %inc.3, %step_in
  %arrayidx.4 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.4
  %6 = load float, ptr %arrayidx.4, align 4, !tbaa !4
  %add28.4 = fadd float %6, %C
  %mul29.4 = mul nsw i32 %inc.3, %step_out
  %arrayidx30.4 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.4
  store float %add28.4, ptr %arrayidx30.4, align 4, !tbaa !4
  %inc.4 = or disjoint i32 %col.058, 5
  %mul.5 = mul nsw i32 %inc.4, %step_in
  %arrayidx.5 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.5
  %7 = load float, ptr %arrayidx.5, align 4, !tbaa !4
  %add28.5 = fadd float %7, %C
  %mul29.5 = mul nsw i32 %inc.4, %step_out
  %arrayidx30.5 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.5
  store float %add28.5, ptr %arrayidx30.5, align 4, !tbaa !4
  %inc.5 = or disjoint i32 %col.058, 6
  %mul.6 = mul nsw i32 %inc.5, %step_in
  %arrayidx.6 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.6
  %8 = load float, ptr %arrayidx.6, align 4, !tbaa !4
  %add28.6 = fadd float %8, %C
  %mul29.6 = mul nsw i32 %inc.5, %step_out
  %arrayidx30.6 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.6
  store float %add28.6, ptr %arrayidx30.6, align 4, !tbaa !4
  %inc.6 = or disjoint i32 %col.058, 7
  %mul.7 = mul nsw i32 %inc.6, %step_in
  %arrayidx.7 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.7
  %9 = load float, ptr %arrayidx.7, align 4, !tbaa !4
  %add28.7 = fadd float %9, %C
  %mul29.7 = mul nsw i32 %inc.6, %step_out
  %arrayidx30.7 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.7
  store float %add28.7, ptr %arrayidx30.7, align 4, !tbaa !4
  %inc.7 = add nuw nsw i32 %col.058, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %cols
  br i1 %exitcond.not.7, label %for.body27.7, label %forCond113Preheader, !llvm.loop !8

for.body27.clone:                                 ; preds = %forCond113Preheader, %for.body27.clone
  %col.058.clone = phi i32 [ %inc.clone, %for.body27.clone ], [ %col.0.lcssa, %forCond113Preheader ]
  %mul.clone = mul nsw i32 %col.058.clone, %step_in
  %arrayidx.clone = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.clone
  %10 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %add28.clone = fadd float %10, %C
  %mul29.clone = mul nsw i32 %col.058.clone, %step_out
  %arrayidx30.clone = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.clone
  store float %add28.clone, ptr %arrayidx30.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %col.058.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %cols
  br i1 %exitcond.not.clone, label %for.cond.cleanup26, label %for.body27.clone, !llvm.loop !8

for.cond.cleanup26:                               ; preds = %for.body27.clone, %forCond113Preheader
  %add.ptr = getelementptr inbounds float, ptr %output.addr.059, i32 %add22
  %add.ptr31 = getelementptr inbounds float, ptr %ptr_input.060, i32 %add
  %inc33 = add nuw nsw i32 %row.061, 1
  %exitcond62.not = icmp eq i32 %inc33, %rows
  %cmp35236 = icmp ugt i32 %cols, 7
  br i1 %exitcond62.not, label %return, label %for.body27.preheader, !llvm.loop !10

return:                                           ; preds = %for.cond.cleanup26, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.cleanup26 ]
  ret i32 %retval.0
}
