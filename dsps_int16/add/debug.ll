; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_add_s16_ansi(ptr noalias noundef readonly %input1, ptr noalias noundef readonly %input2, ptr noalias noundef writeonly %output, i32 noundef %len, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out, i32 noundef %shift) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input1, null
  %cmp1 = icmp eq ptr %input2, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %output, null
  %or.cond21 = or i1 %or.cond, %cmp4
  br i1 %or.cond21, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %and = and i32 %len, -15
  %cmp722 = icmp sgt i32 %and, 0
  br i1 %cmp722, label %for.body.15, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.15, %for.cond.preheader
  %i.0.lcssa = phi i32 [ 0, %for.cond.preheader ], [ %inc.15, %for.body.15 ]
  %cmp226415 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp226415, label %for.body.clone, label %return

for.body.15:                                      ; preds = %for.body.15, %for.cond.preheader
  %i.023 = phi i32 [ 0, %for.cond.preheader ], [ %inc.15, %for.body.15 ]
  %mul = mul nsw i32 %i.023, %step1
  %arrayidx = getelementptr inbounds i16, ptr %input1, i32 %mul
  %0 = load i16, ptr %arrayidx, align 2, !tbaa !4
  %conv = sext i16 %0 to i32
  %mul8 = mul nsw i32 %i.023, %step2
  %arrayidx9 = getelementptr inbounds i16, ptr %input2, i32 %mul8
  %1 = load i16, ptr %arrayidx9, align 2, !tbaa !4
  %conv10 = sext i16 %1 to i32
  %add = add nsw i32 %conv10, %conv
  %shr = ashr i32 %add, %shift
  %conv11 = trunc i32 %shr to i16
  %mul12 = mul nsw i32 %i.023, %step_out
  %arrayidx13 = getelementptr inbounds i16, ptr %output, i32 %mul12
  store i16 %conv11, ptr %arrayidx13, align 2, !tbaa !4
  %add2 = or disjoint i32 %i.023, 1
  %mul.1 = mul nsw i32 %add2, %step1
  %arrayidx.1 = getelementptr inbounds i16, ptr %input1, i32 %mul.1
  %2 = load i16, ptr %arrayidx.1, align 2, !tbaa !4
  %conv.1 = sext i16 %2 to i32
  %mul8.1 = mul nsw i32 %add2, %step2
  %arrayidx9.1 = getelementptr inbounds i16, ptr %input2, i32 %mul8.1
  %3 = load i16, ptr %arrayidx9.1, align 2, !tbaa !4
  %conv10.1 = sext i16 %3 to i32
  %add.1 = add nsw i32 %conv10.1, %conv.1
  %shr.1 = ashr i32 %add.1, %shift
  %conv11.1 = trunc i32 %shr.1 to i16
  %mul12.1 = mul nsw i32 %add2, %step_out
  %arrayidx13.1 = getelementptr inbounds i16, ptr %output, i32 %mul12.1
  store i16 %conv11.1, ptr %arrayidx13.1, align 2, !tbaa !4
  %add4 = or disjoint i32 %i.023, 2
  %mul.2 = mul nsw i32 %add4, %step1
  %arrayidx.2 = getelementptr inbounds i16, ptr %input1, i32 %mul.2
  %4 = load i16, ptr %arrayidx.2, align 2, !tbaa !4
  %conv.2 = sext i16 %4 to i32
  %mul8.2 = mul nsw i32 %add4, %step2
  %arrayidx9.2 = getelementptr inbounds i16, ptr %input2, i32 %mul8.2
  %5 = load i16, ptr %arrayidx9.2, align 2, !tbaa !4
  %conv10.2 = sext i16 %5 to i32
  %add.2 = add nsw i32 %conv10.2, %conv.2
  %shr.2 = ashr i32 %add.2, %shift
  %conv11.2 = trunc i32 %shr.2 to i16
  %mul12.2 = mul nsw i32 %add4, %step_out
  %arrayidx13.2 = getelementptr inbounds i16, ptr %output, i32 %mul12.2
  store i16 %conv11.2, ptr %arrayidx13.2, align 2, !tbaa !4
  %add6 = or disjoint i32 %i.023, 3
  %mul.3 = mul nsw i32 %add6, %step1
  %arrayidx.3 = getelementptr inbounds i16, ptr %input1, i32 %mul.3
  %6 = load i16, ptr %arrayidx.3, align 2, !tbaa !4
  %conv.3 = sext i16 %6 to i32
  %mul8.3 = mul nsw i32 %add6, %step2
  %arrayidx9.3 = getelementptr inbounds i16, ptr %input2, i32 %mul8.3
  %7 = load i16, ptr %arrayidx9.3, align 2, !tbaa !4
  %conv10.3 = sext i16 %7 to i32
  %add.3 = add nsw i32 %conv10.3, %conv.3
  %shr.3 = ashr i32 %add.3, %shift
  %conv11.3 = trunc i32 %shr.3 to i16
  %mul12.3 = mul nsw i32 %add6, %step_out
  %arrayidx13.3 = getelementptr inbounds i16, ptr %output, i32 %mul12.3
  store i16 %conv11.3, ptr %arrayidx13.3, align 2, !tbaa !4
  %add8 = or disjoint i32 %i.023, 4
  %mul.4 = mul nsw i32 %add8, %step1
  %arrayidx.4 = getelementptr inbounds i16, ptr %input1, i32 %mul.4
  %8 = load i16, ptr %arrayidx.4, align 2, !tbaa !4
  %conv.4 = sext i16 %8 to i32
  %mul8.4 = mul nsw i32 %add8, %step2
  %arrayidx9.4 = getelementptr inbounds i16, ptr %input2, i32 %mul8.4
  %9 = load i16, ptr %arrayidx9.4, align 2, !tbaa !4
  %conv10.4 = sext i16 %9 to i32
  %add.4 = add nsw i32 %conv10.4, %conv.4
  %shr.4 = ashr i32 %add.4, %shift
  %conv11.4 = trunc i32 %shr.4 to i16
  %mul12.4 = mul nsw i32 %add8, %step_out
  %arrayidx13.4 = getelementptr inbounds i16, ptr %output, i32 %mul12.4
  store i16 %conv11.4, ptr %arrayidx13.4, align 2, !tbaa !4
  %add10 = or disjoint i32 %i.023, 5
  %mul.5 = mul nsw i32 %add10, %step1
  %arrayidx.5 = getelementptr inbounds i16, ptr %input1, i32 %mul.5
  %10 = load i16, ptr %arrayidx.5, align 2, !tbaa !4
  %conv.5 = sext i16 %10 to i32
  %mul8.5 = mul nsw i32 %add10, %step2
  %arrayidx9.5 = getelementptr inbounds i16, ptr %input2, i32 %mul8.5
  %11 = load i16, ptr %arrayidx9.5, align 2, !tbaa !4
  %conv10.5 = sext i16 %11 to i32
  %add.5 = add nsw i32 %conv10.5, %conv.5
  %shr.5 = ashr i32 %add.5, %shift
  %conv11.5 = trunc i32 %shr.5 to i16
  %mul12.5 = mul nsw i32 %add10, %step_out
  %arrayidx13.5 = getelementptr inbounds i16, ptr %output, i32 %mul12.5
  store i16 %conv11.5, ptr %arrayidx13.5, align 2, !tbaa !4
  %add12 = or disjoint i32 %i.023, 6
  %mul.6 = mul nsw i32 %add12, %step1
  %arrayidx.6 = getelementptr inbounds i16, ptr %input1, i32 %mul.6
  %12 = load i16, ptr %arrayidx.6, align 2, !tbaa !4
  %conv.6 = sext i16 %12 to i32
  %mul8.6 = mul nsw i32 %add12, %step2
  %arrayidx9.6 = getelementptr inbounds i16, ptr %input2, i32 %mul8.6
  %13 = load i16, ptr %arrayidx9.6, align 2, !tbaa !4
  %conv10.6 = sext i16 %13 to i32
  %add.6 = add nsw i32 %conv10.6, %conv.6
  %shr.6 = ashr i32 %add.6, %shift
  %conv11.6 = trunc i32 %shr.6 to i16
  %mul12.6 = mul nsw i32 %add12, %step_out
  %arrayidx13.6 = getelementptr inbounds i16, ptr %output, i32 %mul12.6
  store i16 %conv11.6, ptr %arrayidx13.6, align 2, !tbaa !4
  %add14 = or disjoint i32 %i.023, 7
  %mul.7 = mul nsw i32 %add14, %step1
  %arrayidx.7 = getelementptr inbounds i16, ptr %input1, i32 %mul.7
  %14 = load i16, ptr %arrayidx.7, align 2, !tbaa !4
  %conv.7 = sext i16 %14 to i32
  %mul8.7 = mul nsw i32 %add14, %step2
  %arrayidx9.7 = getelementptr inbounds i16, ptr %input2, i32 %mul8.7
  %15 = load i16, ptr %arrayidx9.7, align 2, !tbaa !4
  %conv10.7 = sext i16 %15 to i32
  %add.7 = add nsw i32 %conv10.7, %conv.7
  %shr.7 = ashr i32 %add.7, %shift
  %conv11.7 = trunc i32 %shr.7 to i16
  %mul12.7 = mul nsw i32 %add14, %step_out
  %arrayidx13.7 = getelementptr inbounds i16, ptr %output, i32 %mul12.7
  store i16 %conv11.7, ptr %arrayidx13.7, align 2, !tbaa !4
  %add16 = or disjoint i32 %i.023, 8
  %mul.8 = mul nsw i32 %add16, %step1
  %arrayidx.8 = getelementptr inbounds i16, ptr %input1, i32 %mul.8
  %16 = load i16, ptr %arrayidx.8, align 2, !tbaa !4
  %conv.8 = sext i16 %16 to i32
  %mul8.8 = mul nsw i32 %add16, %step2
  %arrayidx9.8 = getelementptr inbounds i16, ptr %input2, i32 %mul8.8
  %17 = load i16, ptr %arrayidx9.8, align 2, !tbaa !4
  %conv10.8 = sext i16 %17 to i32
  %add.8 = add nsw i32 %conv10.8, %conv.8
  %shr.8 = ashr i32 %add.8, %shift
  %conv11.8 = trunc i32 %shr.8 to i16
  %mul12.8 = mul nsw i32 %add16, %step_out
  %arrayidx13.8 = getelementptr inbounds i16, ptr %output, i32 %mul12.8
  store i16 %conv11.8, ptr %arrayidx13.8, align 2, !tbaa !4
  %add18 = or disjoint i32 %i.023, 9
  %mul.9 = mul nsw i32 %add18, %step1
  %arrayidx.9 = getelementptr inbounds i16, ptr %input1, i32 %mul.9
  %18 = load i16, ptr %arrayidx.9, align 2, !tbaa !4
  %conv.9 = sext i16 %18 to i32
  %mul8.9 = mul nsw i32 %add18, %step2
  %arrayidx9.9 = getelementptr inbounds i16, ptr %input2, i32 %mul8.9
  %19 = load i16, ptr %arrayidx9.9, align 2, !tbaa !4
  %conv10.9 = sext i16 %19 to i32
  %add.9 = add nsw i32 %conv10.9, %conv.9
  %shr.9 = ashr i32 %add.9, %shift
  %conv11.9 = trunc i32 %shr.9 to i16
  %mul12.9 = mul nsw i32 %add18, %step_out
  %arrayidx13.9 = getelementptr inbounds i16, ptr %output, i32 %mul12.9
  store i16 %conv11.9, ptr %arrayidx13.9, align 2, !tbaa !4
  %add20 = or disjoint i32 %i.023, 10
  %mul.10 = mul nsw i32 %add20, %step1
  %arrayidx.10 = getelementptr inbounds i16, ptr %input1, i32 %mul.10
  %20 = load i16, ptr %arrayidx.10, align 2, !tbaa !4
  %conv.10 = sext i16 %20 to i32
  %mul8.10 = mul nsw i32 %add20, %step2
  %arrayidx9.10 = getelementptr inbounds i16, ptr %input2, i32 %mul8.10
  %21 = load i16, ptr %arrayidx9.10, align 2, !tbaa !4
  %conv10.10 = sext i16 %21 to i32
  %add.10 = add nsw i32 %conv10.10, %conv.10
  %shr.10 = ashr i32 %add.10, %shift
  %conv11.10 = trunc i32 %shr.10 to i16
  %mul12.10 = mul nsw i32 %add20, %step_out
  %arrayidx13.10 = getelementptr inbounds i16, ptr %output, i32 %mul12.10
  store i16 %conv11.10, ptr %arrayidx13.10, align 2, !tbaa !4
  %add22 = or disjoint i32 %i.023, 11
  %mul.11 = mul nsw i32 %add22, %step1
  %arrayidx.11 = getelementptr inbounds i16, ptr %input1, i32 %mul.11
  %22 = load i16, ptr %arrayidx.11, align 2, !tbaa !4
  %conv.11 = sext i16 %22 to i32
  %mul8.11 = mul nsw i32 %add22, %step2
  %arrayidx9.11 = getelementptr inbounds i16, ptr %input2, i32 %mul8.11
  %23 = load i16, ptr %arrayidx9.11, align 2, !tbaa !4
  %conv10.11 = sext i16 %23 to i32
  %add.11 = add nsw i32 %conv10.11, %conv.11
  %shr.11 = ashr i32 %add.11, %shift
  %conv11.11 = trunc i32 %shr.11 to i16
  %mul12.11 = mul nsw i32 %add22, %step_out
  %arrayidx13.11 = getelementptr inbounds i16, ptr %output, i32 %mul12.11
  store i16 %conv11.11, ptr %arrayidx13.11, align 2, !tbaa !4
  %add24 = or disjoint i32 %i.023, 12
  %mul.12 = mul nsw i32 %add24, %step1
  %arrayidx.12 = getelementptr inbounds i16, ptr %input1, i32 %mul.12
  %24 = load i16, ptr %arrayidx.12, align 2, !tbaa !4
  %conv.12 = sext i16 %24 to i32
  %mul8.12 = mul nsw i32 %add24, %step2
  %arrayidx9.12 = getelementptr inbounds i16, ptr %input2, i32 %mul8.12
  %25 = load i16, ptr %arrayidx9.12, align 2, !tbaa !4
  %conv10.12 = sext i16 %25 to i32
  %add.12 = add nsw i32 %conv10.12, %conv.12
  %shr.12 = ashr i32 %add.12, %shift
  %conv11.12 = trunc i32 %shr.12 to i16
  %mul12.12 = mul nsw i32 %add24, %step_out
  %arrayidx13.12 = getelementptr inbounds i16, ptr %output, i32 %mul12.12
  store i16 %conv11.12, ptr %arrayidx13.12, align 2, !tbaa !4
  %add26 = or disjoint i32 %i.023, 13
  %mul.13 = mul nsw i32 %add26, %step1
  %arrayidx.13 = getelementptr inbounds i16, ptr %input1, i32 %mul.13
  %26 = load i16, ptr %arrayidx.13, align 2, !tbaa !4
  %conv.13 = sext i16 %26 to i32
  %mul8.13 = mul nsw i32 %add26, %step2
  %arrayidx9.13 = getelementptr inbounds i16, ptr %input2, i32 %mul8.13
  %27 = load i16, ptr %arrayidx9.13, align 2, !tbaa !4
  %conv10.13 = sext i16 %27 to i32
  %add.13 = add nsw i32 %conv10.13, %conv.13
  %shr.13 = ashr i32 %add.13, %shift
  %conv11.13 = trunc i32 %shr.13 to i16
  %mul12.13 = mul nsw i32 %add26, %step_out
  %arrayidx13.13 = getelementptr inbounds i16, ptr %output, i32 %mul12.13
  store i16 %conv11.13, ptr %arrayidx13.13, align 2, !tbaa !4
  %add28 = or disjoint i32 %i.023, 14
  %mul.14 = mul nsw i32 %add28, %step1
  %arrayidx.14 = getelementptr inbounds i16, ptr %input1, i32 %mul.14
  %28 = load i16, ptr %arrayidx.14, align 2, !tbaa !4
  %conv.14 = sext i16 %28 to i32
  %mul8.14 = mul nsw i32 %add28, %step2
  %arrayidx9.14 = getelementptr inbounds i16, ptr %input2, i32 %mul8.14
  %29 = load i16, ptr %arrayidx9.14, align 2, !tbaa !4
  %conv10.14 = sext i16 %29 to i32
  %add.14 = add nsw i32 %conv10.14, %conv.14
  %shr.14 = ashr i32 %add.14, %shift
  %conv11.14 = trunc i32 %shr.14 to i16
  %mul12.14 = mul nsw i32 %add28, %step_out
  %arrayidx13.14 = getelementptr inbounds i16, ptr %output, i32 %mul12.14
  store i16 %conv11.14, ptr %arrayidx13.14, align 2, !tbaa !4
  %add30 = or disjoint i32 %i.023, 15
  %mul.15 = mul nsw i32 %add30, %step1
  %arrayidx.15 = getelementptr inbounds i16, ptr %input1, i32 %mul.15
  %30 = load i16, ptr %arrayidx.15, align 2, !tbaa !4
  %conv.15 = sext i16 %30 to i32
  %mul8.15 = mul nsw i32 %add30, %step2
  %arrayidx9.15 = getelementptr inbounds i16, ptr %input2, i32 %mul8.15
  %31 = load i16, ptr %arrayidx9.15, align 2, !tbaa !4
  %conv10.15 = sext i16 %31 to i32
  %add.15 = add nsw i32 %conv10.15, %conv.15
  %shr.15 = ashr i32 %add.15, %shift
  %conv11.15 = trunc i32 %shr.15 to i16
  %mul12.15 = mul nsw i32 %add30, %step_out
  %arrayidx13.15 = getelementptr inbounds i16, ptr %output, i32 %mul12.15
  store i16 %conv11.15, ptr %arrayidx13.15, align 2, !tbaa !4
  %inc.15 = add nuw nsw i32 %i.023, 16
  %exitcond.not.15 = icmp slt i32 %inc.15, %and
  br i1 %exitcond.not.15, label %for.body.15, label %for.body.preheader, !llvm.loop !8

for.body.clone:                                   ; preds = %for.body.clone, %for.body.preheader
  %i.023.clone = phi i32 [ %i.0.lcssa, %for.body.preheader ], [ %inc.clone, %for.body.clone ]
  %mul.clone = mul nsw i32 %i.023.clone, %step1
  %arrayidx.clone = getelementptr inbounds i16, ptr %input1, i32 %mul.clone
  %32 = load i16, ptr %arrayidx.clone, align 2, !tbaa !4
  %conv.clone = sext i16 %32 to i32
  %mul8.clone = mul nsw i32 %i.023.clone, %step2
  %arrayidx9.clone = getelementptr inbounds i16, ptr %input2, i32 %mul8.clone
  %33 = load i16, ptr %arrayidx9.clone, align 2, !tbaa !4
  %conv10.clone = sext i16 %33 to i32
  %add.clone = add nsw i32 %conv10.clone, %conv.clone
  %shr.clone = ashr i32 %add.clone, %shift
  %conv11.clone = trunc i32 %shr.clone to i16
  %mul12.clone = mul nsw i32 %i.023.clone, %step_out
  %arrayidx13.clone = getelementptr inbounds i16, ptr %output, i32 %mul12.clone
  store i16 %conv11.clone, ptr %arrayidx13.clone, align 2, !tbaa !4
  %inc.clone = add nuw nsw i32 %i.023.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return.loopexit, label %for.body.clone, !llvm.loop !8

return.loopexit:                                  ; preds = %for.body.clone
  br label %return

return:                                           ; preds = %for.body.preheader, %return.loopexit, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.body.preheader ], [ 0, %return.loopexit ]
  ret i32 %retval.0
}
