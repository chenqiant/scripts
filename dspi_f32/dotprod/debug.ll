; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspm_add_f32_ansi(ptr noalias noundef readonly %input1, ptr noalias noundef readonly %input2, ptr noalias noundef writeonly %output, i32 noundef %rows, i32 noundef %cols, i32 noundef %padd1, i32 noundef %padd2, i32 noundef %padd_out, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input1, null
  %cmp1 = icmp eq ptr %input2, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %output, null
  %or.cond70 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %rows, 1
  %or.cond71 = or i1 %or.cond70, %cmp7
  %cmp10 = icmp slt i32 %cols, 1
  %or.cond72 = or i1 %or.cond71, %cmp10
  %0 = or i32 %padd2, %padd1
  %1 = or i32 %0, %padd_out
  %2 = icmp slt i32 %1, 0
  %or.cond75 = or i1 %or.cond72, %2
  %cmp22 = icmp slt i32 %step1, 1
  %or.cond76 = or i1 %cmp22, %or.cond75
  %cmp25 = icmp slt i32 %step2, 1
  %or.cond77 = or i1 %cmp25, %or.cond76
  %cmp28 = icmp slt i32 %step_out, 1
  %or.cond78 = or i1 %cmp28, %or.cond77
  br i1 %or.cond78, label %return, label %if.end30

if.end30:                                         ; preds = %entry
  %add = add nuw nsw i32 %padd1, %cols
  %add31 = add nuw nsw i32 %padd2, %cols
  %add32 = add nuw nsw i32 %padd_out, %cols
  %cmp3381 = icmp sgt i32 %rows, 0
  br i1 %cmp3381, label %for.cond34.preheader, label %return

for.cond34.preheader:                             ; preds = %for.cond.cleanup36, %if.end30
  %row.085 = phi i32 [ %inc46, %for.cond.cleanup36 ], [ 0, %if.end30 ]
  %ptr_input2.084 = phi ptr [ %add.ptr43, %for.cond.cleanup36 ], [ %input2, %if.end30 ]
  %ptr_input1.083 = phi ptr [ %add.ptr, %for.cond.cleanup36 ], [ %input1, %if.end30 ]
  %output.addr.082 = phi ptr [ %add.ptr44, %for.cond.cleanup36 ], [ %output, %if.end30 ]
  br label %for.body37

for.cond.cleanup36:                               ; preds = %for.body37
  %add.ptr = getelementptr inbounds float, ptr %ptr_input1.083, i32 %add
  %add.ptr43 = getelementptr inbounds float, ptr %ptr_input2.084, i32 %add31
  %add.ptr44 = getelementptr inbounds float, ptr %output.addr.082, i32 %add32
  %inc46 = add nuw nsw i32 %row.085, 1
  %exitcond86.not = icmp eq i32 %inc46, %rows
  br i1 %exitcond86.not, label %return, label %for.cond34.preheader, !llvm.loop !4

for.body37:                                       ; preds = %for.body37, %for.cond34.preheader
  %col.080 = phi i32 [ %inc, %for.body37 ], [ 0, %for.cond34.preheader ]
  %mul = mul nsw i32 %col.080, %step1
  %arrayidx = getelementptr inbounds float, ptr %ptr_input1.083, i32 %mul
  %3 = load float, ptr %arrayidx, align 4, !tbaa !6
  %mul38 = mul nsw i32 %col.080, %step2
  %arrayidx39 = getelementptr inbounds float, ptr %ptr_input2.084, i32 %mul38
  %4 = load float, ptr %arrayidx39, align 4, !tbaa !6
  %add40 = fadd float %3, %4
  %mul41 = mul nsw i32 %col.080, %step_out
  %arrayidx42 = getelementptr inbounds float, ptr %output.addr.082, i32 %mul41
  store float %add40, ptr %arrayidx42, align 4, !tbaa !6
  %inc = add nuw nsw i32 %col.080, 1
  %exitcond.not = icmp eq i32 %inc, %cols
  br i1 %exitcond.not, label %for.cond.cleanup36, label %for.body37, !llvm.loop !10

return:                                           ; preds = %for.cond.cleanup36, %if.end30, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %if.end30 ], [ 0, %for.cond.cleanup36 ]
  ret i32 %retval.0
}
