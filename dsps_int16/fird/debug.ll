define dso_local noundef i32 @dsps_fird_s16_ansi(ptr noalias nocapture noundef %fir, ptr noalias nocapture noundef readonly %input, ptr noalias nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr {
entry:
  %0 = load ptr, ptr %fir, align 4
  %shift = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 6
  %1 = load i16, ptr %shift, align 4
  %conv = sext i16 %1 to i32
  %sub = add nsw i32 %conv, -15
  %rounding_val = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 8
  %2 = load i32, ptr %rounding_val, align 4
  %conv1 = sext i32 %2 to i64
  %cmp = icmp sgt i16 %1, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %sh_prom = zext nneg i32 %conv to i64
  %shr = ashr i64 %conv1, %sh_prom
  br label %if.end

if.else:                                          ; preds = %entry
  %sub9 = sub nsw i32 0, %conv
  %sh_prom10 = zext nneg i32 %sub9 to i64
  %shl = shl i64 %conv1, %sh_prom10
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %rounding.0.in = phi i64 [ %shr, %if.then ], [ %shl, %if.else ]
  %rounding.0 = and i64 %rounding.0.in, 1099511627775
  %decim = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 4
  %3 = load i16, ptr %decim, align 4
  %coeffs_len = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 2
  %4 = load i16, ptr %coeffs_len, align 4
  %delay = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 1
  %5 = load ptr, ptr %delay, align 4
  %cmp12153 = icmp sgt i32 %len, 0
  br i1 %cmp12153, label %for.cond14.preheader.lr.ph, label %for.cond.cleanup

for.cond14.preheader.lr.ph:                       ; preds = %if.end
  %d_pos = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 5
  %pos = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 3
  %cmp79 = icmp sgt i16 %1, 15
  %sub88 = sub nsw i32 15, %conv
  %sh_prom89 = zext nneg i32 %sub88 to i64
  %sh_prom82 = zext nneg i32 %sub to i64
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond.cleanup63, %for.cond14.preheader.lr.ph
  %i.0156 = phi i32 [ 0, %for.cond14.preheader.lr.ph ], [ %inc96, %for.cond.cleanup63 ]
  %input_pos.0154 = phi i32 [ 0, %for.cond14.preheader.lr.ph ], [ %input_pos.1.lcssa, %for.cond.cleanup63 ]
  %6 = load i16, ptr %d_pos, align 2
  %cmp18138 = icmp sgt i16 %3, %6
  br i1 %cmp18138, label %for.body21, label %for.cond.cleanup20

for.cond.cleanup:                                 ; preds = %for.cond.cleanup63, %if.end
  %result.0.lcssa = phi i32 [ 0, %if.end ], [ %len, %for.cond.cleanup63 ]
  ret i32 %result.0.lcssa

for.cond.cleanup20:                               ; preds = %if.end28, %for.cond14.preheader
  %input_pos.1.lcssa = phi i32 [ %input_pos.0154, %for.cond14.preheader ], [ %inc, %if.end28 ]
  store i16 0, ptr %d_pos, align 2
  %7 = load i16, ptr %pos, align 2
  %conv39 = sext i16 %7 to i32
  %conv42 = sext i16 %4 to i32
  %coeff_pos.0141 = add i16 %4, -1
  %sub45 = add nsw i32 %conv42, -15
  %cmp43142 = icmp slt i32 %conv39, %sub45
  br i1 %cmp43142, label %for.body46.15, label %for.cond58.preheader

for.body21:                                       ; preds = %for.cond14.preheader, %if.end28
  %j.0140 = phi i32 [ %inc32, %if.end28 ], [ 0, %for.cond14.preheader ]
  %input_pos.1139 = phi i32 [ %inc, %if.end28 ], [ %input_pos.0154, %for.cond14.preheader ]
  %8 = load i16, ptr %pos, align 2
  %cmp24.not = icmp slt i16 %8, %4
  br i1 %cmp24.not, label %if.end28, label %if.then26

if.then26:                                        ; preds = %for.body21
  store i16 0, ptr %pos, align 2
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %for.body21
  %9 = phi i16 [ 0, %if.then26 ], [ %8, %for.body21 ]
  %inc = add nsw i32 %input_pos.1139, 1
  %arrayidx = getelementptr inbounds i16, ptr %input, i32 %input_pos.1139
  %10 = load i16, ptr %arrayidx, align 2
  %inc30 = add nsw i16 %9, 1
  store i16 %inc30, ptr %pos, align 2
  %idxprom = sext i16 %9 to i32
  %arrayidx31 = getelementptr inbounds i16, ptr %5, i32 %idxprom
  store i16 %10, ptr %arrayidx31, align 2
  %inc32 = add nuw nsw i32 %j.0140, 1
  %conv15 = sext i16 %3 to i32
  %conv16 = sext i16 %6 to i32
  %sub17 = sub nsw i32 %conv15, %conv16
  %cmp18 = icmp slt i32 %inc32, %sub17
  br i1 %cmp18, label %for.body21, label %for.cond.cleanup20

for.cond58.preheader:                             ; preds = %for.body46.15, %for.cond.cleanup20
  %acc.0.lcssa = phi i64 [ %rounding.0, %for.cond.cleanup20 ], [ %add.15, %for.body46.15 ]
  %coeff_pos.0.lcssa = phi i16 [ %coeff_pos.0141, %for.cond.cleanup20 ], [ %coeff_pos.0.15, %for.body46.15 ]
  %n.0.lcssa = phi i32 [ %conv39, %for.cond.cleanup20 ], [ %inc55.15, %for.body46.15 ]
  %11 = trunc i32 %n.0.lcssa to i16
  %cmp61148 = icmp sgt i32 %conv42, %n.0.lcssa
  br i1 %cmp61148, label %for.body46.clone, label %for.cond227.preheader

for.body46.15:                                    ; preds = %for.cond.cleanup20, %for.body46.15
  %coeff_pos.0145 = phi i16 [ %coeff_pos.0.15, %for.body46.15 ], [ %coeff_pos.0141, %for.cond.cleanup20 ]
  %n.0144 = phi i32 [ %inc55.15, %for.body46.15 ], [ %conv39, %for.cond.cleanup20 ]
  %acc.0143 = phi i64 [ %add.15, %for.body46.15 ], [ %rounding.0, %for.cond.cleanup20 ]
  %idxprom47 = sext i16 %coeff_pos.0145 to i32
  %arrayidx48 = getelementptr inbounds i16, ptr %0, i32 %idxprom47
  %arrayidx51 = getelementptr inbounds i16, ptr %5, i32 %n.0144
  %arrayidx48.1 = getelementptr inbounds i16, ptr %arrayidx48, i32 -1
  %arrayidx51.1 = getelementptr inbounds i16, ptr %arrayidx51, i32 1
  %arrayidx48.2 = getelementptr inbounds i16, ptr %arrayidx48, i32 -2
  %arrayidx51.2 = getelementptr inbounds i16, ptr %arrayidx51, i32 2
  %arrayidx48.3 = getelementptr inbounds i16, ptr %arrayidx48, i32 -3
  %arrayidx51.3 = getelementptr inbounds i16, ptr %arrayidx51, i32 3
  %arrayidx48.4 = getelementptr inbounds i16, ptr %arrayidx48, i32 -4
  %arrayidx51.4 = getelementptr inbounds i16, ptr %arrayidx51, i32 4
  %arrayidx48.5 = getelementptr inbounds i16, ptr %arrayidx48, i32 -5
  %arrayidx51.5 = getelementptr inbounds i16, ptr %arrayidx51, i32 5
  %arrayidx48.6 = getelementptr inbounds i16, ptr %arrayidx48, i32 -6
  %arrayidx51.6 = getelementptr inbounds i16, ptr %arrayidx51, i32 6
  %arrayidx48.7 = getelementptr inbounds i16, ptr %arrayidx48, i32 -7
  %arrayidx51.7 = getelementptr inbounds i16, ptr %arrayidx51, i32 7
  %arrayidx48.8 = getelementptr inbounds i16, ptr %arrayidx48, i32 -8
  %arrayidx51.8 = getelementptr inbounds i16, ptr %arrayidx51, i32 8
  %arrayidx48.9 = getelementptr inbounds i16, ptr %arrayidx48, i32 -9
  %arrayidx51.9 = getelementptr inbounds i16, ptr %arrayidx51, i32 9
  %arrayidx48.10 = getelementptr inbounds i16, ptr %arrayidx48, i32 -10
  %arrayidx51.10 = getelementptr inbounds i16, ptr %arrayidx51, i32 10
  %arrayidx48.11 = getelementptr inbounds i16, ptr %arrayidx48, i32 -11
  %arrayidx51.11 = getelementptr inbounds i16, ptr %arrayidx51, i32 11
  %arrayidx48.12 = getelementptr inbounds i16, ptr %arrayidx48, i32 -12
  %arrayidx51.12 = getelementptr inbounds i16, ptr %arrayidx51, i32 12
  %arrayidx48.13 = getelementptr inbounds i16, ptr %arrayidx48, i32 -13
  %arrayidx51.13 = getelementptr inbounds i16, ptr %arrayidx51, i32 13
  %arrayidx48.14 = getelementptr inbounds i16, ptr %arrayidx48, i32 -14
  %arrayidx51.14 = getelementptr inbounds i16, ptr %arrayidx51, i32 14
  %arrayidx48.15 = getelementptr inbounds i16, ptr %arrayidx48, i32 -15
  %arrayidx51.15 = getelementptr inbounds i16, ptr %arrayidx51, i32 15
  %12 = load i16, ptr %arrayidx48, align 2
  %13 = load i16, ptr %arrayidx51, align 2
  %14 = load i16, ptr %arrayidx48.1, align 2
  %15 = load i16, ptr %arrayidx51.1, align 2
  %16 = load i16, ptr %arrayidx48.2, align 2
  %17 = load i16, ptr %arrayidx51.2, align 2
  %18 = load i16, ptr %arrayidx48.3, align 2
  %19 = load i16, ptr %arrayidx51.3, align 2
  %20 = load i16, ptr %arrayidx48.4, align 2
  %21 = load i16, ptr %arrayidx51.4, align 2
  %22 = load i16, ptr %arrayidx48.5, align 2
  %23 = load i16, ptr %arrayidx51.5, align 2
  %24 = load i16, ptr %arrayidx48.6, align 2
  %25 = load i16, ptr %arrayidx51.6, align 2
  %26 = load i16, ptr %arrayidx48.7, align 2
  %27 = load i16, ptr %arrayidx51.7, align 2
  %28 = load i16, ptr %arrayidx48.8, align 2
  %29 = load i16, ptr %arrayidx51.8, align 2
  %30 = load i16, ptr %arrayidx48.9, align 2
  %31 = load i16, ptr %arrayidx51.9, align 2
  %32 = load i16, ptr %arrayidx48.10, align 2
  %33 = load i16, ptr %arrayidx51.10, align 2
  %34 = load i16, ptr %arrayidx48.11, align 2
  %35 = load i16, ptr %arrayidx51.11, align 2
  %36 = load i16, ptr %arrayidx48.12, align 2
  %37 = load i16, ptr %arrayidx51.12, align 2
  %38 = load i16, ptr %arrayidx48.13, align 2
  %39 = load i16, ptr %arrayidx51.13, align 2
  %40 = load i16, ptr %arrayidx48.14, align 2
  %41 = load i16, ptr %arrayidx51.14, align 2
  %42 = load i16, ptr %arrayidx48.15, align 2
  %43 = load i16, ptr %arrayidx51.15, align 2
  %conv49 = sext i16 %12 to i32
  %conv52 = sext i16 %13 to i32
  %conv49.1 = sext i16 %14 to i32
  %conv52.1 = sext i16 %15 to i32
  %conv49.2 = sext i16 %16 to i32
  %conv52.2 = sext i16 %17 to i32
  %conv49.3 = sext i16 %18 to i32
  %conv52.3 = sext i16 %19 to i32
  %conv49.4 = sext i16 %20 to i32
  %conv52.4 = sext i16 %21 to i32
  %conv49.5 = sext i16 %22 to i32
  %conv52.5 = sext i16 %23 to i32
  %conv49.6 = sext i16 %24 to i32
  %conv52.6 = sext i16 %25 to i32
  %conv49.7 = sext i16 %26 to i32
  %conv52.7 = sext i16 %27 to i32
  %conv49.8 = sext i16 %28 to i32
  %conv52.8 = sext i16 %29 to i32
  %conv49.9 = sext i16 %30 to i32
  %conv52.9 = sext i16 %31 to i32
  %conv49.10 = sext i16 %32 to i32
  %conv52.10 = sext i16 %33 to i32
  %conv49.11 = sext i16 %34 to i32
  %conv52.11 = sext i16 %35 to i32
  %conv49.12 = sext i16 %36 to i32
  %conv52.12 = sext i16 %37 to i32
  %conv49.13 = sext i16 %38 to i32
  %conv52.13 = sext i16 %39 to i32
  %conv49.14 = sext i16 %40 to i32
  %conv52.14 = sext i16 %41 to i32
  %conv49.15 = sext i16 %42 to i32
  %conv52.15 = sext i16 %43 to i32
  %mul = mul nsw i32 %conv52, %conv49
  %mul.1 = mul nsw i32 %conv52.1, %conv49.1
  %mul.2 = mul nsw i32 %conv52.2, %conv49.2
  %mul.3 = mul nsw i32 %conv52.3, %conv49.3
  %mul.4 = mul nsw i32 %conv52.4, %conv49.4
  %mul.5 = mul nsw i32 %conv52.5, %conv49.5
  %mul.6 = mul nsw i32 %conv52.6, %conv49.6
  %mul.7 = mul nsw i32 %conv52.7, %conv49.7
  %mul.8 = mul nsw i32 %conv52.8, %conv49.8
  %mul.9 = mul nsw i32 %conv52.9, %conv49.9
  %mul.10 = mul nsw i32 %conv52.10, %conv49.10
  %mul.11 = mul nsw i32 %conv52.11, %conv49.11
  %mul.12 = mul nsw i32 %conv52.12, %conv49.12
  %mul.13 = mul nsw i32 %conv52.13, %conv49.13
  %mul.14 = mul nsw i32 %conv52.14, %conv49.14
  %mul.15 = mul nsw i32 %conv52.15, %conv49.15
  %conv53 = sext i32 %mul to i64
  %conv53.1 = sext i32 %mul.1 to i64
  %conv53.2 = sext i32 %mul.2 to i64
  %conv53.3 = sext i32 %mul.3 to i64
  %conv53.4 = sext i32 %mul.4 to i64
  %conv53.5 = sext i32 %mul.5 to i64
  %conv53.6 = sext i32 %mul.6 to i64
  %conv53.7 = sext i32 %mul.7 to i64
  %conv53.8 = sext i32 %mul.8 to i64
  %conv53.9 = sext i32 %mul.9 to i64
  %conv53.10 = sext i32 %mul.10 to i64
  %conv53.11 = sext i32 %mul.11 to i64
  %conv53.12 = sext i32 %mul.12 to i64
  %conv53.13 = sext i32 %mul.13 to i64
  %conv53.14 = sext i32 %mul.14 to i64
  %conv53.15 = sext i32 %mul.15 to i64
  %add = add nsw i64 %conv53, %acc.0143
  %add.1 = add nsw i64 %add, %conv53.1
  %add.2 = add nsw i64 %add.1, %conv53.2
  %add.3 = add nsw i64 %add.2, %conv53.3
  %add.4 = add nsw i64 %add.3, %conv53.4
  %add.5 = add nsw i64 %add.4, %conv53.5
  %add.6 = add nsw i64 %add.5, %conv53.6
  %add.7 = add nsw i64 %add.6, %conv53.7
  %add.8 = add nsw i64 %add.7, %conv53.8
  %add.9 = add nsw i64 %add.8, %conv53.9
  %add.10 = add nsw i64 %add.9, %conv53.10
  %add.11 = add nsw i64 %add.10, %conv53.11
  %add.12 = add nsw i64 %add.11, %conv53.12
  %add.13 = add nsw i64 %add.12, %conv53.13
  %add.14 = add nsw i64 %add.13, %conv53.14
  %add.15 = add nsw i64 %add.14, %conv53.15
  %inc55.15 = add nsw i32 %n.0144, 16
  %coeff_pos.0.15 = add i16 %coeff_pos.0145, -16
  %exitcond.not.15 = icmp slt i32 %inc55.15, %sub45
  br i1 %exitcond.not.15, label %for.body46.15, label %for.cond58.preheader

for.cond227.preheader.loopexit:                   ; preds = %for.body46.clone
  %.neg = sub i16 0, %4
  %44 = add i16 %coeff_pos.0.lcssa, %.neg
  %45 = add i16 %44, %11
  br label %for.cond227.preheader

for.cond227.preheader:                            ; preds = %for.cond58.preheader, %for.cond227.preheader.loopexit
  %acc.1.lcssa1 = phi i64 [ %acc.0.lcssa, %for.cond58.preheader ], [ %add.clone, %for.cond227.preheader.loopexit ]
  %coeff_pos.1.lcssa = phi i16 [ %coeff_pos.0.lcssa, %for.cond58.preheader ], [ %45, %for.cond227.preheader.loopexit ]
  %sub230 = add nuw i32 %conv39, -15
  %cmp231659 = icmp sgt i16 %7, 15
  br i1 %cmp231659, label %for.body233.preheader, label %for.cond398.preheader

for.body233.preheader:                            ; preds = %for.cond227.preheader
  %m47 = and i32 %conv39, 32752
  br label %for.body64.15

for.body46.clone:                                 ; preds = %for.cond58.preheader, %for.body46.clone
  %coeff_pos.0145.clone = phi i16 [ %coeff_pos.0.clone, %for.body46.clone ], [ %coeff_pos.0.lcssa, %for.cond58.preheader ]
  %n.0144.clone = phi i32 [ %inc55.clone, %for.body46.clone ], [ %n.0.lcssa, %for.cond58.preheader ]
  %acc.0143.clone = phi i64 [ %add.clone, %for.body46.clone ], [ %acc.0.lcssa, %for.cond58.preheader ]
  %idxprom47.clone = sext i16 %coeff_pos.0145.clone to i32
  %arrayidx48.clone = getelementptr inbounds i16, ptr %0, i32 %idxprom47.clone
  %46 = load i16, ptr %arrayidx48.clone, align 2
  %conv49.clone = sext i16 %46 to i32
  %arrayidx51.clone = getelementptr inbounds i16, ptr %5, i32 %n.0144.clone
  %47 = load i16, ptr %arrayidx51.clone, align 2
  %conv52.clone = sext i16 %47 to i32
  %mul.clone = mul nsw i32 %conv52.clone, %conv49.clone
  %conv53.clone = sext i32 %mul.clone to i64
  %add.clone = add nsw i64 %conv53.clone, %acc.0143.clone
  %inc55.clone = add nsw i32 %n.0144.clone, 1
  %coeff_pos.0.clone = add i16 %coeff_pos.0145.clone, -1
  %exitcond.not.clone = icmp eq i32 %inc55.clone, %conv42
  br i1 %exitcond.not.clone, label %for.cond227.preheader.loopexit, label %for.body46.clone

for.cond398.preheader:                            ; preds = %for.body64.15, %for.cond227.preheader
  %48 = phi i64 [ %acc.1.lcssa1, %for.cond227.preheader ], [ %add75.15, %for.body64.15 ]
  %49 = phi i16 [ %coeff_pos.1.lcssa, %for.cond227.preheader ], [ %dec66.15, %for.body64.15 ]
  %50 = phi i32 [ 0, %for.cond227.preheader ], [ %m47, %for.body64.15 ]
  %cmp401666 = icmp slt i32 %50, %conv39
  br i1 %cmp401666, label %for.body64.clone, label %for.cond.cleanup63

for.body64.15:                                    ; preds = %for.body64.15, %for.body233.preheader
  %n57.0151 = phi i32 [ 0, %for.body233.preheader ], [ %inc77.15, %for.body64.15 ]
  %coeff_pos.1150 = phi i16 [ %coeff_pos.1.lcssa, %for.body233.preheader ], [ %dec66.15, %for.body64.15 ]
  %acc.1149 = phi i64 [ %acc.1.lcssa1, %for.body233.preheader ], [ %add75.15, %for.body64.15 ]
  %idxprom67 = sext i16 %coeff_pos.1150 to i32
  %arrayidx68 = getelementptr inbounds i16, ptr %0, i32 %idxprom67
  %arrayidx71 = getelementptr inbounds i16, ptr %5, i32 %n57.0151
  %arrayidx68.1 = getelementptr inbounds i16, ptr %arrayidx68, i32 -1
  %arrayidx71.1 = getelementptr inbounds i16, ptr %arrayidx71, i32 1
  %arrayidx68.2 = getelementptr inbounds i16, ptr %arrayidx68, i32 -2
  %arrayidx71.2 = getelementptr inbounds i16, ptr %arrayidx71, i32 2
  %arrayidx68.3 = getelementptr inbounds i16, ptr %arrayidx68, i32 -3
  %arrayidx71.3 = getelementptr inbounds i16, ptr %arrayidx71, i32 3
  %arrayidx68.4 = getelementptr inbounds i16, ptr %arrayidx68, i32 -4
  %arrayidx71.4 = getelementptr inbounds i16, ptr %arrayidx71, i32 4
  %arrayidx68.5 = getelementptr inbounds i16, ptr %arrayidx68, i32 -5
  %arrayidx71.5 = getelementptr inbounds i16, ptr %arrayidx71, i32 5
  %arrayidx68.6 = getelementptr inbounds i16, ptr %arrayidx68, i32 -6
  %arrayidx71.6 = getelementptr inbounds i16, ptr %arrayidx71, i32 6
  %arrayidx68.7 = getelementptr inbounds i16, ptr %arrayidx68, i32 -7
  %arrayidx71.7 = getelementptr inbounds i16, ptr %arrayidx71, i32 7
  %arrayidx68.8 = getelementptr inbounds i16, ptr %arrayidx68, i32 -8
  %arrayidx71.8 = getelementptr inbounds i16, ptr %arrayidx71, i32 8
  %arrayidx68.9 = getelementptr inbounds i16, ptr %arrayidx68, i32 -9
  %arrayidx71.9 = getelementptr inbounds i16, ptr %arrayidx71, i32 9
  %arrayidx68.10 = getelementptr inbounds i16, ptr %arrayidx68, i32 -10
  %arrayidx71.10 = getelementptr inbounds i16, ptr %arrayidx71, i32 10
  %arrayidx68.11 = getelementptr inbounds i16, ptr %arrayidx68, i32 -11
  %arrayidx71.11 = getelementptr inbounds i16, ptr %arrayidx71, i32 11
  %arrayidx68.12 = getelementptr inbounds i16, ptr %arrayidx68, i32 -12
  %arrayidx71.12 = getelementptr inbounds i16, ptr %arrayidx71, i32 12
  %arrayidx68.13 = getelementptr inbounds i16, ptr %arrayidx68, i32 -13
  %arrayidx71.13 = getelementptr inbounds i16, ptr %arrayidx71, i32 13
  %arrayidx68.14 = getelementptr inbounds i16, ptr %arrayidx68, i32 -14
  %arrayidx71.14 = getelementptr inbounds i16, ptr %arrayidx71, i32 14
  %arrayidx68.15 = getelementptr inbounds i16, ptr %arrayidx68, i32 -15
  %arrayidx71.15 = getelementptr inbounds i16, ptr %arrayidx71, i32 15
  %51 = load i16, ptr %arrayidx68, align 2
  %52 = load i16, ptr %arrayidx71, align 2
  %53 = load i16, ptr %arrayidx68.1, align 2
  %54 = load i16, ptr %arrayidx71.1, align 2
  %55 = load i16, ptr %arrayidx68.2, align 2
  %56 = load i16, ptr %arrayidx71.2, align 2
  %57 = load i16, ptr %arrayidx68.3, align 2
  %58 = load i16, ptr %arrayidx71.3, align 2
  %59 = load i16, ptr %arrayidx68.4, align 2
  %60 = load i16, ptr %arrayidx71.4, align 2
  %61 = load i16, ptr %arrayidx68.5, align 2
  %62 = load i16, ptr %arrayidx71.5, align 2
  %63 = load i16, ptr %arrayidx68.6, align 2
  %64 = load i16, ptr %arrayidx71.6, align 2
  %65 = load i16, ptr %arrayidx68.7, align 2
  %66 = load i16, ptr %arrayidx71.7, align 2
  %67 = load i16, ptr %arrayidx68.8, align 2
  %68 = load i16, ptr %arrayidx71.8, align 2
  %69 = load i16, ptr %arrayidx68.9, align 2
  %70 = load i16, ptr %arrayidx71.9, align 2
  %71 = load i16, ptr %arrayidx68.10, align 2
  %72 = load i16, ptr %arrayidx71.10, align 2
  %73 = load i16, ptr %arrayidx68.11, align 2
  %74 = load i16, ptr %arrayidx71.11, align 2
  %75 = load i16, ptr %arrayidx68.12, align 2
  %76 = load i16, ptr %arrayidx71.12, align 2
  %77 = load i16, ptr %arrayidx68.13, align 2
  %78 = load i16, ptr %arrayidx71.13, align 2
  %79 = load i16, ptr %arrayidx68.14, align 2
  %80 = load i16, ptr %arrayidx71.14, align 2
  %81 = load i16, ptr %arrayidx68.15, align 2
  %82 = load i16, ptr %arrayidx71.15, align 2
  %conv69 = sext i16 %51 to i32
  %conv72 = sext i16 %52 to i32
  %conv69.1 = sext i16 %53 to i32
  %conv72.1 = sext i16 %54 to i32
  %conv69.2 = sext i16 %55 to i32
  %conv72.2 = sext i16 %56 to i32
  %conv69.3 = sext i16 %57 to i32
  %conv72.3 = sext i16 %58 to i32
  %conv69.4 = sext i16 %59 to i32
  %conv72.4 = sext i16 %60 to i32
  %conv69.5 = sext i16 %61 to i32
  %conv72.5 = sext i16 %62 to i32
  %conv69.6 = sext i16 %63 to i32
  %conv72.6 = sext i16 %64 to i32
  %conv69.7 = sext i16 %65 to i32
  %conv72.7 = sext i16 %66 to i32
  %conv69.8 = sext i16 %67 to i32
  %conv72.8 = sext i16 %68 to i32
  %conv69.9 = sext i16 %69 to i32
  %conv72.9 = sext i16 %70 to i32
  %conv69.10 = sext i16 %71 to i32
  %conv72.10 = sext i16 %72 to i32
  %conv69.11 = sext i16 %73 to i32
  %conv72.11 = sext i16 %74 to i32
  %conv69.12 = sext i16 %75 to i32
  %conv72.12 = sext i16 %76 to i32
  %conv69.13 = sext i16 %77 to i32
  %conv72.13 = sext i16 %78 to i32
  %conv69.14 = sext i16 %79 to i32
  %conv72.14 = sext i16 %80 to i32
  %conv69.15 = sext i16 %81 to i32
  %conv72.15 = sext i16 %82 to i32
  %mul73 = mul nsw i32 %conv72, %conv69
  %mul73.1 = mul nsw i32 %conv72.1, %conv69.1
  %mul73.2 = mul nsw i32 %conv72.2, %conv69.2
  %mul73.3 = mul nsw i32 %conv72.3, %conv69.3
  %mul73.4 = mul nsw i32 %conv72.4, %conv69.4
  %mul73.5 = mul nsw i32 %conv72.5, %conv69.5
  %mul73.6 = mul nsw i32 %conv72.6, %conv69.6
  %mul73.7 = mul nsw i32 %conv72.7, %conv69.7
  %mul73.8 = mul nsw i32 %conv72.8, %conv69.8
  %mul73.9 = mul nsw i32 %conv72.9, %conv69.9
  %mul73.10 = mul nsw i32 %conv72.10, %conv69.10
  %mul73.11 = mul nsw i32 %conv72.11, %conv69.11
  %mul73.12 = mul nsw i32 %conv72.12, %conv69.12
  %mul73.13 = mul nsw i32 %conv72.13, %conv69.13
  %mul73.14 = mul nsw i32 %conv72.14, %conv69.14
  %mul73.15 = mul nsw i32 %conv72.15, %conv69.15
  %conv74 = sext i32 %mul73 to i64
  %conv74.1 = sext i32 %mul73.1 to i64
  %conv74.2 = sext i32 %mul73.2 to i64
  %conv74.3 = sext i32 %mul73.3 to i64
  %conv74.4 = sext i32 %mul73.4 to i64
  %conv74.5 = sext i32 %mul73.5 to i64
  %conv74.6 = sext i32 %mul73.6 to i64
  %conv74.7 = sext i32 %mul73.7 to i64
  %conv74.8 = sext i32 %mul73.8 to i64
  %conv74.9 = sext i32 %mul73.9 to i64
  %conv74.10 = sext i32 %mul73.10 to i64
  %conv74.11 = sext i32 %mul73.11 to i64
  %conv74.12 = sext i32 %mul73.12 to i64
  %conv74.13 = sext i32 %mul73.13 to i64
  %conv74.14 = sext i32 %mul73.14 to i64
  %conv74.15 = sext i32 %mul73.15 to i64
  %add75 = add nsw i64 %conv74, %acc.1149
  %add75.1 = add nsw i64 %add75, %conv74.1
  %add75.2 = add nsw i64 %add75.1, %conv74.2
  %add75.3 = add nsw i64 %add75.2, %conv74.3
  %add75.4 = add nsw i64 %add75.3, %conv74.4
  %add75.5 = add nsw i64 %add75.4, %conv74.5
  %add75.6 = add nsw i64 %add75.5, %conv74.6
  %add75.7 = add nsw i64 %add75.6, %conv74.7
  %add75.8 = add nsw i64 %add75.7, %conv74.8
  %add75.9 = add nsw i64 %add75.8, %conv74.9
  %add75.10 = add nsw i64 %add75.9, %conv74.10
  %add75.11 = add nsw i64 %add75.10, %conv74.11
  %add75.12 = add nsw i64 %add75.11, %conv74.12
  %add75.13 = add nsw i64 %add75.12, %conv74.13
  %add75.14 = add nsw i64 %add75.13, %conv74.14
  %dec66.15 = add i16 %coeff_pos.1150, -16
  %add75.15 = add nsw i64 %add75.14, %conv74.15
  %inc77.15 = add nuw nsw i32 %n57.0151, 16
  %exitcond159.not.15 = icmp slt i32 %inc77.15, %sub230
  br i1 %exitcond159.not.15, label %for.body64.15, label %for.cond398.preheader

for.body64.clone:                                 ; preds = %for.body64.clone, %for.cond398.preheader
  %n57.0151.clone = phi i32 [ %50, %for.cond398.preheader ], [ %inc77.clone, %for.body64.clone ]
  %coeff_pos.1150.clone = phi i16 [ %49, %for.cond398.preheader ], [ %dec66.clone, %for.body64.clone ]
  %acc.1149.clone = phi i64 [ %48, %for.cond398.preheader ], [ %add75.clone, %for.body64.clone ]
  %dec66.clone = add i16 %coeff_pos.1150.clone, -1
  %idxprom67.clone = sext i16 %coeff_pos.1150.clone to i32
  %arrayidx68.clone = getelementptr inbounds i16, ptr %0, i32 %idxprom67.clone
  %83 = load i16, ptr %arrayidx68.clone, align 2
  %conv69.clone = sext i16 %83 to i32
  %arrayidx71.clone = getelementptr inbounds i16, ptr %5, i32 %n57.0151.clone
  %84 = load i16, ptr %arrayidx71.clone, align 2
  %conv72.clone = sext i16 %84 to i32
  %mul73.clone = mul nsw i32 %conv72.clone, %conv69.clone
  %conv74.clone = sext i32 %mul73.clone to i64
  %add75.clone = add nsw i64 %conv74.clone, %acc.1149.clone
  %inc77.clone = add nuw nsw i32 %n57.0151.clone, 1
  %exitcond159.not.clone = icmp eq i32 %inc77.clone, %conv39
  br i1 %exitcond159.not.clone, label %for.cond.cleanup63, label %for.body64.clone

for.cond.cleanup63:                               ; preds = %for.cond398.preheader, %for.body64.clone
  %acc.3.lcssa = phi i64 [ %48, %for.cond398.preheader ], [ %add75.clone, %for.body64.clone ]
  %shr90 = ashr i64 %acc.3.lcssa, %sh_prom89
  %shl83 = shl i64 %acc.3.lcssa, %sh_prom82
  %shr90.sink = select i1 %cmp79, i64 %shl83, i64 %shr90
  %conv91 = trunc i64 %shr90.sink to i16
  %85 = getelementptr inbounds i16, ptr %output, i32 %i.0156
  store i16 %conv91, ptr %85, align 2
  %inc96 = add nuw nsw i32 %i.0156, 1
  %exitcond160.not = icmp eq i32 %inc96, %len
  br i1 %exitcond160.not, label %for.cond.cleanup, label %for.cond14.preheader
}
