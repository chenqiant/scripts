; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fird_s16_ansi(ptr noalias nocapture noundef %fir, ptr noalias nocapture noundef readonly %input, ptr noalias nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %shift = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 6
  %0 = load i16, ptr %shift, align 4, !tbaa !4
  %conv = sext i16 %0 to i32
  %sub = add nsw i32 %conv, -15
  %rounding_val = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 8
  %1 = load i32, ptr %rounding_val, align 4, !tbaa !11
  %conv1 = sext i32 %1 to i64
  %cmp = icmp sgt i16 %0, -1
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
  %2 = load i16, ptr %decim, align 4, !tbaa !12
  %coeffs_len = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 2
  %3 = load i16, ptr %coeffs_len, align 4, !tbaa !13
  %delay = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 1
  %4 = load ptr, ptr %delay, align 4, !tbaa !14
  %cmp12153 = icmp sgt i32 %len, 0
  br i1 %cmp12153, label %for.cond14.preheader.lr.ph, label %for.cond.cleanup

for.cond14.preheader.lr.ph:                       ; preds = %if.end
  %d_pos = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 5
  %pos = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 3
  %cmp79 = icmp sgt i16 %0, 15
  %sub88 = sub nsw i32 15, %conv
  %sh_prom89 = zext nneg i32 %sub88 to i64
  %sh_prom82 = zext nneg i32 %sub to i64
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond.cleanup63, %for.cond14.preheader.lr.ph
  %i.0156 = phi i32 [ 0, %for.cond14.preheader.lr.ph ], [ %inc96, %for.cond.cleanup63 ]
  %input_pos.0154 = phi i32 [ 0, %for.cond14.preheader.lr.ph ], [ %input_pos.1.lcssa, %for.cond.cleanup63 ]
  %5 = load i16, ptr %d_pos, align 2, !tbaa !15
  %cmp18138 = icmp sgt i16 %2, %5
  br i1 %cmp18138, label %for.body21.lr.ph, label %for.cond.cleanup20

for.body21.lr.ph:                                 ; preds = %for.cond14.preheader
  br label %for.body21

for.cond.cleanup.loopexit:                        ; preds = %for.cond.cleanup63
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %if.end
  %result.0.lcssa = phi i32 [ 0, %if.end ], [ %len, %for.cond.cleanup.loopexit ]
  ret i32 %result.0.lcssa

for.cond.cleanup20.loopexit:                      ; preds = %if.end28
  %inc.lcssa = phi i32 [ %inc, %if.end28 ]
  br label %for.cond.cleanup20

for.cond.cleanup20:                               ; preds = %for.cond.cleanup20.loopexit, %for.cond14.preheader
  %input_pos.1.lcssa = phi i32 [ %input_pos.0154, %for.cond14.preheader ], [ %inc.lcssa, %for.cond.cleanup20.loopexit ]
  store i16 0, ptr %d_pos, align 2, !tbaa !15
  %6 = load i16, ptr %pos, align 2, !tbaa !16
  %conv39 = sext i16 %6 to i32
  %conv42 = sext i16 %3 to i32
  %coeff_pos.0141 = add i16 %3, -1
  %cmp43142 = icmp slt i16 %6, %3
  br i1 %cmp43142, label %for.body46.lr.ph, label %for.cond58.preheader

for.body46.lr.ph:                                 ; preds = %for.cond.cleanup20
  %7 = load ptr, ptr %fir, align 4, !tbaa !17
  br label %for.body46

for.body21:                                       ; preds = %if.end28, %for.body21.lr.ph
  %j.0140 = phi i32 [ 0, %for.body21.lr.ph ], [ %inc32, %if.end28 ]
  %input_pos.1139 = phi i32 [ %input_pos.0154, %for.body21.lr.ph ], [ %inc, %if.end28 ]
  %8 = load i16, ptr %pos, align 2, !tbaa !16
  %cmp24.not = icmp slt i16 %8, %3
  br i1 %cmp24.not, label %if.end28, label %if.then26

if.then26:                                        ; preds = %for.body21
  store i16 0, ptr %pos, align 2, !tbaa !16
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %for.body21
  %9 = phi i16 [ 0, %if.then26 ], [ %8, %for.body21 ]
  %inc = add nsw i32 %input_pos.1139, 1
  %arrayidx = getelementptr inbounds i16, ptr %input, i32 %input_pos.1139
  %10 = load i16, ptr %arrayidx, align 2, !tbaa !18
  %inc30 = add nsw i16 %9, 1
  store i16 %inc30, ptr %pos, align 2, !tbaa !16
  %idxprom = sext i16 %9 to i32
  %arrayidx31 = getelementptr inbounds i16, ptr %4, i32 %idxprom
  store i16 %10, ptr %arrayidx31, align 2, !tbaa !18
  %inc32 = add nuw nsw i32 %j.0140, 1
  %conv15 = sext i16 %2 to i32
  %11 = load i16, ptr %d_pos, align 2, !tbaa !15
  %conv16 = sext i16 %11 to i32
  %sub17 = sub nsw i32 %conv15, %conv16
  %cmp18 = icmp slt i32 %inc32, %sub17
  br i1 %cmp18, label %for.body21, label %for.cond.cleanup20.loopexit, !llvm.loop !19

for.cond58.preheader.loopexit:                    ; preds = %for.body46.15, %for.body46.14, %for.body46.13, %for.body46.12, %for.body46.11, %for.body46.10, %for.body46.9, %for.body46.8, %for.body46.7, %for.body46.6, %for.body46.5, %for.body46.4, %for.body46.3, %for.body46.2, %for.body46.1, %for.body46
  %add.lcssa = phi i64 [ %add, %for.body46 ], [ %add.1, %for.body46.1 ], [ %add.2, %for.body46.2 ], [ %add.3, %for.body46.3 ], [ %add.4, %for.body46.4 ], [ %add.5, %for.body46.5 ], [ %add.6, %for.body46.6 ], [ %add.7, %for.body46.7 ], [ %add.8, %for.body46.8 ], [ %add.9, %for.body46.9 ], [ %add.10, %for.body46.10 ], [ %add.11, %for.body46.11 ], [ %add.12, %for.body46.12 ], [ %add.13, %for.body46.13 ], [ %add.14, %for.body46.14 ], [ %add.15, %for.body46.15 ]
  %12 = add i16 %6, -1
  br label %for.cond58.preheader

for.cond58.preheader:                             ; preds = %for.cond58.preheader.loopexit, %for.cond.cleanup20
  %acc.0.lcssa = phi i64 [ %rounding.0, %for.cond.cleanup20 ], [ %add.lcssa, %for.cond58.preheader.loopexit ]
  %coeff_pos.0.lcssa = phi i16 [ %coeff_pos.0141, %for.cond.cleanup20 ], [ %12, %for.cond58.preheader.loopexit ]
  %cmp61148 = icmp sgt i16 %6, 0
  br i1 %cmp61148, label %for.body64.lr.ph, label %for.cond.cleanup63

for.body64.lr.ph:                                 ; preds = %for.cond58.preheader
  %13 = load ptr, ptr %fir, align 4, !tbaa !17
  br label %for.body64

for.body46:                                       ; preds = %for.body46.15, %for.body46.lr.ph
  %coeff_pos.0145 = phi i16 [ %coeff_pos.0141, %for.body46.lr.ph ], [ %coeff_pos.0.15, %for.body46.15 ]
  %n.0144 = phi i32 [ %conv39, %for.body46.lr.ph ], [ %inc55.15, %for.body46.15 ]
  %acc.0143 = phi i64 [ %rounding.0, %for.body46.lr.ph ], [ %add.15, %for.body46.15 ]
  %idxprom47 = sext i16 %coeff_pos.0145 to i32
  %arrayidx48 = getelementptr inbounds i16, ptr %7, i32 %idxprom47
  %14 = load i16, ptr %arrayidx48, align 2, !tbaa !18
  %conv49 = sext i16 %14 to i32
  %arrayidx51 = getelementptr inbounds i16, ptr %4, i32 %n.0144
  %15 = load i16, ptr %arrayidx51, align 2, !tbaa !18
  %conv52 = sext i16 %15 to i32
  %mul = mul nsw i32 %conv52, %conv49
  %conv53 = sext i32 %mul to i64
  %add = add nsw i64 %acc.0143, %conv53
  %inc55 = add nsw i32 %n.0144, 1
  %coeff_pos.0 = add i16 %coeff_pos.0145, -1
  %exitcond.not = icmp eq i32 %inc55, %conv42
  br i1 %exitcond.not, label %for.cond58.preheader.loopexit, label %for.body46.1, !llvm.loop !21

for.body46.1:                                     ; preds = %for.body46
  %idxprom47.1 = sext i16 %coeff_pos.0 to i32
  %arrayidx48.1 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.1
  %16 = load i16, ptr %arrayidx48.1, align 2, !tbaa !18
  %conv49.1 = sext i16 %16 to i32
  %arrayidx51.1 = getelementptr inbounds i16, ptr %4, i32 %inc55
  %17 = load i16, ptr %arrayidx51.1, align 2, !tbaa !18
  %conv52.1 = sext i16 %17 to i32
  %mul.1 = mul nsw i32 %conv52.1, %conv49.1
  %conv53.1 = sext i32 %mul.1 to i64
  %add.1 = add nsw i64 %add, %conv53.1
  %inc55.1 = add nsw i32 %n.0144, 2
  %coeff_pos.0.1 = add i16 %coeff_pos.0145, -2
  %exitcond.not.1 = icmp eq i32 %inc55.1, %conv42
  br i1 %exitcond.not.1, label %for.cond58.preheader.loopexit, label %for.body46.2, !llvm.loop !21

for.body46.2:                                     ; preds = %for.body46.1
  %idxprom47.2 = sext i16 %coeff_pos.0.1 to i32
  %arrayidx48.2 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.2
  %18 = load i16, ptr %arrayidx48.2, align 2, !tbaa !18
  %conv49.2 = sext i16 %18 to i32
  %arrayidx51.2 = getelementptr inbounds i16, ptr %4, i32 %inc55.1
  %19 = load i16, ptr %arrayidx51.2, align 2, !tbaa !18
  %conv52.2 = sext i16 %19 to i32
  %mul.2 = mul nsw i32 %conv52.2, %conv49.2
  %conv53.2 = sext i32 %mul.2 to i64
  %add.2 = add nsw i64 %add.1, %conv53.2
  %inc55.2 = add nsw i32 %n.0144, 3
  %coeff_pos.0.2 = add i16 %coeff_pos.0145, -3
  %exitcond.not.2 = icmp eq i32 %inc55.2, %conv42
  br i1 %exitcond.not.2, label %for.cond58.preheader.loopexit, label %for.body46.3, !llvm.loop !21

for.body46.3:                                     ; preds = %for.body46.2
  %idxprom47.3 = sext i16 %coeff_pos.0.2 to i32
  %arrayidx48.3 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.3
  %20 = load i16, ptr %arrayidx48.3, align 2, !tbaa !18
  %conv49.3 = sext i16 %20 to i32
  %arrayidx51.3 = getelementptr inbounds i16, ptr %4, i32 %inc55.2
  %21 = load i16, ptr %arrayidx51.3, align 2, !tbaa !18
  %conv52.3 = sext i16 %21 to i32
  %mul.3 = mul nsw i32 %conv52.3, %conv49.3
  %conv53.3 = sext i32 %mul.3 to i64
  %add.3 = add nsw i64 %add.2, %conv53.3
  %inc55.3 = add nsw i32 %n.0144, 4
  %coeff_pos.0.3 = add i16 %coeff_pos.0145, -4
  %exitcond.not.3 = icmp eq i32 %inc55.3, %conv42
  br i1 %exitcond.not.3, label %for.cond58.preheader.loopexit, label %for.body46.4, !llvm.loop !21

for.body46.4:                                     ; preds = %for.body46.3
  %idxprom47.4 = sext i16 %coeff_pos.0.3 to i32
  %arrayidx48.4 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.4
  %22 = load i16, ptr %arrayidx48.4, align 2, !tbaa !18
  %conv49.4 = sext i16 %22 to i32
  %arrayidx51.4 = getelementptr inbounds i16, ptr %4, i32 %inc55.3
  %23 = load i16, ptr %arrayidx51.4, align 2, !tbaa !18
  %conv52.4 = sext i16 %23 to i32
  %mul.4 = mul nsw i32 %conv52.4, %conv49.4
  %conv53.4 = sext i32 %mul.4 to i64
  %add.4 = add nsw i64 %add.3, %conv53.4
  %inc55.4 = add nsw i32 %n.0144, 5
  %coeff_pos.0.4 = add i16 %coeff_pos.0145, -5
  %exitcond.not.4 = icmp eq i32 %inc55.4, %conv42
  br i1 %exitcond.not.4, label %for.cond58.preheader.loopexit, label %for.body46.5, !llvm.loop !21

for.body46.5:                                     ; preds = %for.body46.4
  %idxprom47.5 = sext i16 %coeff_pos.0.4 to i32
  %arrayidx48.5 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.5
  %24 = load i16, ptr %arrayidx48.5, align 2, !tbaa !18
  %conv49.5 = sext i16 %24 to i32
  %arrayidx51.5 = getelementptr inbounds i16, ptr %4, i32 %inc55.4
  %25 = load i16, ptr %arrayidx51.5, align 2, !tbaa !18
  %conv52.5 = sext i16 %25 to i32
  %mul.5 = mul nsw i32 %conv52.5, %conv49.5
  %conv53.5 = sext i32 %mul.5 to i64
  %add.5 = add nsw i64 %add.4, %conv53.5
  %inc55.5 = add nsw i32 %n.0144, 6
  %coeff_pos.0.5 = add i16 %coeff_pos.0145, -6
  %exitcond.not.5 = icmp eq i32 %inc55.5, %conv42
  br i1 %exitcond.not.5, label %for.cond58.preheader.loopexit, label %for.body46.6, !llvm.loop !21

for.body46.6:                                     ; preds = %for.body46.5
  %idxprom47.6 = sext i16 %coeff_pos.0.5 to i32
  %arrayidx48.6 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.6
  %26 = load i16, ptr %arrayidx48.6, align 2, !tbaa !18
  %conv49.6 = sext i16 %26 to i32
  %arrayidx51.6 = getelementptr inbounds i16, ptr %4, i32 %inc55.5
  %27 = load i16, ptr %arrayidx51.6, align 2, !tbaa !18
  %conv52.6 = sext i16 %27 to i32
  %mul.6 = mul nsw i32 %conv52.6, %conv49.6
  %conv53.6 = sext i32 %mul.6 to i64
  %add.6 = add nsw i64 %add.5, %conv53.6
  %inc55.6 = add nsw i32 %n.0144, 7
  %coeff_pos.0.6 = add i16 %coeff_pos.0145, -7
  %exitcond.not.6 = icmp eq i32 %inc55.6, %conv42
  br i1 %exitcond.not.6, label %for.cond58.preheader.loopexit, label %for.body46.7, !llvm.loop !21

for.body46.7:                                     ; preds = %for.body46.6
  %idxprom47.7 = sext i16 %coeff_pos.0.6 to i32
  %arrayidx48.7 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.7
  %28 = load i16, ptr %arrayidx48.7, align 2, !tbaa !18
  %conv49.7 = sext i16 %28 to i32
  %arrayidx51.7 = getelementptr inbounds i16, ptr %4, i32 %inc55.6
  %29 = load i16, ptr %arrayidx51.7, align 2, !tbaa !18
  %conv52.7 = sext i16 %29 to i32
  %mul.7 = mul nsw i32 %conv52.7, %conv49.7
  %conv53.7 = sext i32 %mul.7 to i64
  %add.7 = add nsw i64 %add.6, %conv53.7
  %inc55.7 = add nsw i32 %n.0144, 8
  %coeff_pos.0.7 = add i16 %coeff_pos.0145, -8
  %exitcond.not.7 = icmp eq i32 %inc55.7, %conv42
  br i1 %exitcond.not.7, label %for.cond58.preheader.loopexit, label %for.body46.8, !llvm.loop !21

for.body46.8:                                     ; preds = %for.body46.7
  %idxprom47.8 = sext i16 %coeff_pos.0.7 to i32
  %arrayidx48.8 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.8
  %30 = load i16, ptr %arrayidx48.8, align 2, !tbaa !18
  %conv49.8 = sext i16 %30 to i32
  %arrayidx51.8 = getelementptr inbounds i16, ptr %4, i32 %inc55.7
  %31 = load i16, ptr %arrayidx51.8, align 2, !tbaa !18
  %conv52.8 = sext i16 %31 to i32
  %mul.8 = mul nsw i32 %conv52.8, %conv49.8
  %conv53.8 = sext i32 %mul.8 to i64
  %add.8 = add nsw i64 %add.7, %conv53.8
  %inc55.8 = add nsw i32 %n.0144, 9
  %coeff_pos.0.8 = add i16 %coeff_pos.0145, -9
  %exitcond.not.8 = icmp eq i32 %inc55.8, %conv42
  br i1 %exitcond.not.8, label %for.cond58.preheader.loopexit, label %for.body46.9, !llvm.loop !21

for.body46.9:                                     ; preds = %for.body46.8
  %idxprom47.9 = sext i16 %coeff_pos.0.8 to i32
  %arrayidx48.9 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.9
  %32 = load i16, ptr %arrayidx48.9, align 2, !tbaa !18
  %conv49.9 = sext i16 %32 to i32
  %arrayidx51.9 = getelementptr inbounds i16, ptr %4, i32 %inc55.8
  %33 = load i16, ptr %arrayidx51.9, align 2, !tbaa !18
  %conv52.9 = sext i16 %33 to i32
  %mul.9 = mul nsw i32 %conv52.9, %conv49.9
  %conv53.9 = sext i32 %mul.9 to i64
  %add.9 = add nsw i64 %add.8, %conv53.9
  %inc55.9 = add nsw i32 %n.0144, 10
  %coeff_pos.0.9 = add i16 %coeff_pos.0145, -10
  %exitcond.not.9 = icmp eq i32 %inc55.9, %conv42
  br i1 %exitcond.not.9, label %for.cond58.preheader.loopexit, label %for.body46.10, !llvm.loop !21

for.body46.10:                                    ; preds = %for.body46.9
  %idxprom47.10 = sext i16 %coeff_pos.0.9 to i32
  %arrayidx48.10 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.10
  %34 = load i16, ptr %arrayidx48.10, align 2, !tbaa !18
  %conv49.10 = sext i16 %34 to i32
  %arrayidx51.10 = getelementptr inbounds i16, ptr %4, i32 %inc55.9
  %35 = load i16, ptr %arrayidx51.10, align 2, !tbaa !18
  %conv52.10 = sext i16 %35 to i32
  %mul.10 = mul nsw i32 %conv52.10, %conv49.10
  %conv53.10 = sext i32 %mul.10 to i64
  %add.10 = add nsw i64 %add.9, %conv53.10
  %inc55.10 = add nsw i32 %n.0144, 11
  %coeff_pos.0.10 = add i16 %coeff_pos.0145, -11
  %exitcond.not.10 = icmp eq i32 %inc55.10, %conv42
  br i1 %exitcond.not.10, label %for.cond58.preheader.loopexit, label %for.body46.11, !llvm.loop !21

for.body46.11:                                    ; preds = %for.body46.10
  %idxprom47.11 = sext i16 %coeff_pos.0.10 to i32
  %arrayidx48.11 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.11
  %36 = load i16, ptr %arrayidx48.11, align 2, !tbaa !18
  %conv49.11 = sext i16 %36 to i32
  %arrayidx51.11 = getelementptr inbounds i16, ptr %4, i32 %inc55.10
  %37 = load i16, ptr %arrayidx51.11, align 2, !tbaa !18
  %conv52.11 = sext i16 %37 to i32
  %mul.11 = mul nsw i32 %conv52.11, %conv49.11
  %conv53.11 = sext i32 %mul.11 to i64
  %add.11 = add nsw i64 %add.10, %conv53.11
  %inc55.11 = add nsw i32 %n.0144, 12
  %coeff_pos.0.11 = add i16 %coeff_pos.0145, -12
  %exitcond.not.11 = icmp eq i32 %inc55.11, %conv42
  br i1 %exitcond.not.11, label %for.cond58.preheader.loopexit, label %for.body46.12, !llvm.loop !21

for.body46.12:                                    ; preds = %for.body46.11
  %idxprom47.12 = sext i16 %coeff_pos.0.11 to i32
  %arrayidx48.12 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.12
  %38 = load i16, ptr %arrayidx48.12, align 2, !tbaa !18
  %conv49.12 = sext i16 %38 to i32
  %arrayidx51.12 = getelementptr inbounds i16, ptr %4, i32 %inc55.11
  %39 = load i16, ptr %arrayidx51.12, align 2, !tbaa !18
  %conv52.12 = sext i16 %39 to i32
  %mul.12 = mul nsw i32 %conv52.12, %conv49.12
  %conv53.12 = sext i32 %mul.12 to i64
  %add.12 = add nsw i64 %add.11, %conv53.12
  %inc55.12 = add nsw i32 %n.0144, 13
  %coeff_pos.0.12 = add i16 %coeff_pos.0145, -13
  %exitcond.not.12 = icmp eq i32 %inc55.12, %conv42
  br i1 %exitcond.not.12, label %for.cond58.preheader.loopexit, label %for.body46.13, !llvm.loop !21

for.body46.13:                                    ; preds = %for.body46.12
  %idxprom47.13 = sext i16 %coeff_pos.0.12 to i32
  %arrayidx48.13 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.13
  %40 = load i16, ptr %arrayidx48.13, align 2, !tbaa !18
  %conv49.13 = sext i16 %40 to i32
  %arrayidx51.13 = getelementptr inbounds i16, ptr %4, i32 %inc55.12
  %41 = load i16, ptr %arrayidx51.13, align 2, !tbaa !18
  %conv52.13 = sext i16 %41 to i32
  %mul.13 = mul nsw i32 %conv52.13, %conv49.13
  %conv53.13 = sext i32 %mul.13 to i64
  %add.13 = add nsw i64 %add.12, %conv53.13
  %inc55.13 = add nsw i32 %n.0144, 14
  %coeff_pos.0.13 = add i16 %coeff_pos.0145, -14
  %exitcond.not.13 = icmp eq i32 %inc55.13, %conv42
  br i1 %exitcond.not.13, label %for.cond58.preheader.loopexit, label %for.body46.14, !llvm.loop !21

for.body46.14:                                    ; preds = %for.body46.13
  %idxprom47.14 = sext i16 %coeff_pos.0.13 to i32
  %arrayidx48.14 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.14
  %42 = load i16, ptr %arrayidx48.14, align 2, !tbaa !18
  %conv49.14 = sext i16 %42 to i32
  %arrayidx51.14 = getelementptr inbounds i16, ptr %4, i32 %inc55.13
  %43 = load i16, ptr %arrayidx51.14, align 2, !tbaa !18
  %conv52.14 = sext i16 %43 to i32
  %mul.14 = mul nsw i32 %conv52.14, %conv49.14
  %conv53.14 = sext i32 %mul.14 to i64
  %add.14 = add nsw i64 %add.13, %conv53.14
  %inc55.14 = add nsw i32 %n.0144, 15
  %coeff_pos.0.14 = add i16 %coeff_pos.0145, -15
  %exitcond.not.14 = icmp eq i32 %inc55.14, %conv42
  br i1 %exitcond.not.14, label %for.cond58.preheader.loopexit, label %for.body46.15, !llvm.loop !21

for.body46.15:                                    ; preds = %for.body46.14
  %idxprom47.15 = sext i16 %coeff_pos.0.14 to i32
  %arrayidx48.15 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.15
  %44 = load i16, ptr %arrayidx48.15, align 2, !tbaa !18
  %conv49.15 = sext i16 %44 to i32
  %arrayidx51.15 = getelementptr inbounds i16, ptr %4, i32 %inc55.14
  %45 = load i16, ptr %arrayidx51.15, align 2, !tbaa !18
  %conv52.15 = sext i16 %45 to i32
  %mul.15 = mul nsw i32 %conv52.15, %conv49.15
  %conv53.15 = sext i32 %mul.15 to i64
  %add.15 = add nsw i64 %add.14, %conv53.15
  %inc55.15 = add nsw i32 %n.0144, 16
  %coeff_pos.0.15 = add i16 %coeff_pos.0145, -16
  %exitcond.not.15 = icmp eq i32 %inc55.15, %conv42
  br i1 %exitcond.not.15, label %for.cond58.preheader.loopexit, label %for.body46, !llvm.loop !21

for.cond.cleanup63.loopexit:                      ; preds = %for.body64.15, %for.body64.14, %for.body64.13, %for.body64.12, %for.body64.11, %for.body64.10, %for.body64.9, %for.body64.8, %for.body64.7, %for.body64.6, %for.body64.5, %for.body64.4, %for.body64.3, %for.body64.2, %for.body64.1, %for.body64
  %add75.lcssa = phi i64 [ %add75, %for.body64 ], [ %add75.1, %for.body64.1 ], [ %add75.2, %for.body64.2 ], [ %add75.3, %for.body64.3 ], [ %add75.4, %for.body64.4 ], [ %add75.5, %for.body64.5 ], [ %add75.6, %for.body64.6 ], [ %add75.7, %for.body64.7 ], [ %add75.8, %for.body64.8 ], [ %add75.9, %for.body64.9 ], [ %add75.10, %for.body64.10 ], [ %add75.11, %for.body64.11 ], [ %add75.12, %for.body64.12 ], [ %add75.13, %for.body64.13 ], [ %add75.14, %for.body64.14 ], [ %add75.15, %for.body64.15 ]
  br label %for.cond.cleanup63

for.cond.cleanup63:                               ; preds = %for.cond.cleanup63.loopexit, %for.cond58.preheader
  %acc.1.lcssa = phi i64 [ %acc.0.lcssa, %for.cond58.preheader ], [ %add75.lcssa, %for.cond.cleanup63.loopexit ]
  %shr90 = ashr i64 %acc.1.lcssa, %sh_prom89
  %shl83 = shl i64 %acc.1.lcssa, %sh_prom82
  %shr90.sink = select i1 %cmp79, i64 %shl83, i64 %shr90
  %conv91 = trunc i64 %shr90.sink to i16
  %46 = getelementptr inbounds i16, ptr %output, i32 %i.0156
  store i16 %conv91, ptr %46, align 2
  %inc96 = add nuw nsw i32 %i.0156, 1
  %exitcond160.not = icmp eq i32 %inc96, %len
  br i1 %exitcond160.not, label %for.cond.cleanup.loopexit, label %for.cond14.preheader, !llvm.loop !22

for.body64:                                       ; preds = %for.body64.15, %for.body64.lr.ph
  %n57.0151 = phi i32 [ 0, %for.body64.lr.ph ], [ %inc77.15, %for.body64.15 ]
  %coeff_pos.1150 = phi i16 [ %coeff_pos.0.lcssa, %for.body64.lr.ph ], [ %dec66.15, %for.body64.15 ]
  %acc.1149 = phi i64 [ %acc.0.lcssa, %for.body64.lr.ph ], [ %add75.15, %for.body64.15 ]
  %dec66 = add i16 %coeff_pos.1150, -1
  %idxprom67 = sext i16 %coeff_pos.1150 to i32
  %arrayidx68 = getelementptr inbounds i16, ptr %13, i32 %idxprom67
  %47 = load i16, ptr %arrayidx68, align 2, !tbaa !18
  %conv69 = sext i16 %47 to i32
  %arrayidx71 = getelementptr inbounds i16, ptr %4, i32 %n57.0151
  %48 = load i16, ptr %arrayidx71, align 2, !tbaa !18
  %conv72 = sext i16 %48 to i32
  %mul73 = mul nsw i32 %conv72, %conv69
  %conv74 = sext i32 %mul73 to i64
  %add75 = add nsw i64 %acc.1149, %conv74
  %inc77 = add nuw nsw i32 %n57.0151, 1
  %exitcond159.not = icmp eq i32 %inc77, %conv39
  br i1 %exitcond159.not, label %for.cond.cleanup63.loopexit, label %for.body64.1, !llvm.loop !23

for.body64.1:                                     ; preds = %for.body64
  %dec66.1 = add i16 %coeff_pos.1150, -2
  %idxprom67.1 = sext i16 %dec66 to i32
  %arrayidx68.1 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.1
  %49 = load i16, ptr %arrayidx68.1, align 2, !tbaa !18
  %conv69.1 = sext i16 %49 to i32
  %arrayidx71.1 = getelementptr inbounds i16, ptr %4, i32 %inc77
  %50 = load i16, ptr %arrayidx71.1, align 2, !tbaa !18
  %conv72.1 = sext i16 %50 to i32
  %mul73.1 = mul nsw i32 %conv72.1, %conv69.1
  %conv74.1 = sext i32 %mul73.1 to i64
  %add75.1 = add nsw i64 %add75, %conv74.1
  %inc77.1 = add nuw nsw i32 %n57.0151, 2
  %exitcond159.not.1 = icmp eq i32 %inc77.1, %conv39
  br i1 %exitcond159.not.1, label %for.cond.cleanup63.loopexit, label %for.body64.2, !llvm.loop !23

for.body64.2:                                     ; preds = %for.body64.1
  %dec66.2 = add i16 %coeff_pos.1150, -3
  %idxprom67.2 = sext i16 %dec66.1 to i32
  %arrayidx68.2 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.2
  %51 = load i16, ptr %arrayidx68.2, align 2, !tbaa !18
  %conv69.2 = sext i16 %51 to i32
  %arrayidx71.2 = getelementptr inbounds i16, ptr %4, i32 %inc77.1
  %52 = load i16, ptr %arrayidx71.2, align 2, !tbaa !18
  %conv72.2 = sext i16 %52 to i32
  %mul73.2 = mul nsw i32 %conv72.2, %conv69.2
  %conv74.2 = sext i32 %mul73.2 to i64
  %add75.2 = add nsw i64 %add75.1, %conv74.2
  %inc77.2 = add nuw nsw i32 %n57.0151, 3
  %exitcond159.not.2 = icmp eq i32 %inc77.2, %conv39
  br i1 %exitcond159.not.2, label %for.cond.cleanup63.loopexit, label %for.body64.3, !llvm.loop !23

for.body64.3:                                     ; preds = %for.body64.2
  %dec66.3 = add i16 %coeff_pos.1150, -4
  %idxprom67.3 = sext i16 %dec66.2 to i32
  %arrayidx68.3 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.3
  %53 = load i16, ptr %arrayidx68.3, align 2, !tbaa !18
  %conv69.3 = sext i16 %53 to i32
  %arrayidx71.3 = getelementptr inbounds i16, ptr %4, i32 %inc77.2
  %54 = load i16, ptr %arrayidx71.3, align 2, !tbaa !18
  %conv72.3 = sext i16 %54 to i32
  %mul73.3 = mul nsw i32 %conv72.3, %conv69.3
  %conv74.3 = sext i32 %mul73.3 to i64
  %add75.3 = add nsw i64 %add75.2, %conv74.3
  %inc77.3 = add nuw nsw i32 %n57.0151, 4
  %exitcond159.not.3 = icmp eq i32 %inc77.3, %conv39
  br i1 %exitcond159.not.3, label %for.cond.cleanup63.loopexit, label %for.body64.4, !llvm.loop !23

for.body64.4:                                     ; preds = %for.body64.3
  %dec66.4 = add i16 %coeff_pos.1150, -5
  %idxprom67.4 = sext i16 %dec66.3 to i32
  %arrayidx68.4 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.4
  %55 = load i16, ptr %arrayidx68.4, align 2, !tbaa !18
  %conv69.4 = sext i16 %55 to i32
  %arrayidx71.4 = getelementptr inbounds i16, ptr %4, i32 %inc77.3
  %56 = load i16, ptr %arrayidx71.4, align 2, !tbaa !18
  %conv72.4 = sext i16 %56 to i32
  %mul73.4 = mul nsw i32 %conv72.4, %conv69.4
  %conv74.4 = sext i32 %mul73.4 to i64
  %add75.4 = add nsw i64 %add75.3, %conv74.4
  %inc77.4 = add nuw nsw i32 %n57.0151, 5
  %exitcond159.not.4 = icmp eq i32 %inc77.4, %conv39
  br i1 %exitcond159.not.4, label %for.cond.cleanup63.loopexit, label %for.body64.5, !llvm.loop !23

for.body64.5:                                     ; preds = %for.body64.4
  %dec66.5 = add i16 %coeff_pos.1150, -6
  %idxprom67.5 = sext i16 %dec66.4 to i32
  %arrayidx68.5 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.5
  %57 = load i16, ptr %arrayidx68.5, align 2, !tbaa !18
  %conv69.5 = sext i16 %57 to i32
  %arrayidx71.5 = getelementptr inbounds i16, ptr %4, i32 %inc77.4
  %58 = load i16, ptr %arrayidx71.5, align 2, !tbaa !18
  %conv72.5 = sext i16 %58 to i32
  %mul73.5 = mul nsw i32 %conv72.5, %conv69.5
  %conv74.5 = sext i32 %mul73.5 to i64
  %add75.5 = add nsw i64 %add75.4, %conv74.5
  %inc77.5 = add nuw nsw i32 %n57.0151, 6
  %exitcond159.not.5 = icmp eq i32 %inc77.5, %conv39
  br i1 %exitcond159.not.5, label %for.cond.cleanup63.loopexit, label %for.body64.6, !llvm.loop !23

for.body64.6:                                     ; preds = %for.body64.5
  %dec66.6 = add i16 %coeff_pos.1150, -7
  %idxprom67.6 = sext i16 %dec66.5 to i32
  %arrayidx68.6 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.6
  %59 = load i16, ptr %arrayidx68.6, align 2, !tbaa !18
  %conv69.6 = sext i16 %59 to i32
  %arrayidx71.6 = getelementptr inbounds i16, ptr %4, i32 %inc77.5
  %60 = load i16, ptr %arrayidx71.6, align 2, !tbaa !18
  %conv72.6 = sext i16 %60 to i32
  %mul73.6 = mul nsw i32 %conv72.6, %conv69.6
  %conv74.6 = sext i32 %mul73.6 to i64
  %add75.6 = add nsw i64 %add75.5, %conv74.6
  %inc77.6 = add nuw nsw i32 %n57.0151, 7
  %exitcond159.not.6 = icmp eq i32 %inc77.6, %conv39
  br i1 %exitcond159.not.6, label %for.cond.cleanup63.loopexit, label %for.body64.7, !llvm.loop !23

for.body64.7:                                     ; preds = %for.body64.6
  %dec66.7 = add i16 %coeff_pos.1150, -8
  %idxprom67.7 = sext i16 %dec66.6 to i32
  %arrayidx68.7 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.7
  %61 = load i16, ptr %arrayidx68.7, align 2, !tbaa !18
  %conv69.7 = sext i16 %61 to i32
  %arrayidx71.7 = getelementptr inbounds i16, ptr %4, i32 %inc77.6
  %62 = load i16, ptr %arrayidx71.7, align 2, !tbaa !18
  %conv72.7 = sext i16 %62 to i32
  %mul73.7 = mul nsw i32 %conv72.7, %conv69.7
  %conv74.7 = sext i32 %mul73.7 to i64
  %add75.7 = add nsw i64 %add75.6, %conv74.7
  %inc77.7 = add nuw nsw i32 %n57.0151, 8
  %exitcond159.not.7 = icmp eq i32 %inc77.7, %conv39
  br i1 %exitcond159.not.7, label %for.cond.cleanup63.loopexit, label %for.body64.8, !llvm.loop !23

for.body64.8:                                     ; preds = %for.body64.7
  %dec66.8 = add i16 %coeff_pos.1150, -9
  %idxprom67.8 = sext i16 %dec66.7 to i32
  %arrayidx68.8 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.8
  %63 = load i16, ptr %arrayidx68.8, align 2, !tbaa !18
  %conv69.8 = sext i16 %63 to i32
  %arrayidx71.8 = getelementptr inbounds i16, ptr %4, i32 %inc77.7
  %64 = load i16, ptr %arrayidx71.8, align 2, !tbaa !18
  %conv72.8 = sext i16 %64 to i32
  %mul73.8 = mul nsw i32 %conv72.8, %conv69.8
  %conv74.8 = sext i32 %mul73.8 to i64
  %add75.8 = add nsw i64 %add75.7, %conv74.8
  %inc77.8 = add nuw nsw i32 %n57.0151, 9
  %exitcond159.not.8 = icmp eq i32 %inc77.8, %conv39
  br i1 %exitcond159.not.8, label %for.cond.cleanup63.loopexit, label %for.body64.9, !llvm.loop !23

for.body64.9:                                     ; preds = %for.body64.8
  %dec66.9 = add i16 %coeff_pos.1150, -10
  %idxprom67.9 = sext i16 %dec66.8 to i32
  %arrayidx68.9 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.9
  %65 = load i16, ptr %arrayidx68.9, align 2, !tbaa !18
  %conv69.9 = sext i16 %65 to i32
  %arrayidx71.9 = getelementptr inbounds i16, ptr %4, i32 %inc77.8
  %66 = load i16, ptr %arrayidx71.9, align 2, !tbaa !18
  %conv72.9 = sext i16 %66 to i32
  %mul73.9 = mul nsw i32 %conv72.9, %conv69.9
  %conv74.9 = sext i32 %mul73.9 to i64
  %add75.9 = add nsw i64 %add75.8, %conv74.9
  %inc77.9 = add nuw nsw i32 %n57.0151, 10
  %exitcond159.not.9 = icmp eq i32 %inc77.9, %conv39
  br i1 %exitcond159.not.9, label %for.cond.cleanup63.loopexit, label %for.body64.10, !llvm.loop !23

for.body64.10:                                    ; preds = %for.body64.9
  %dec66.10 = add i16 %coeff_pos.1150, -11
  %idxprom67.10 = sext i16 %dec66.9 to i32
  %arrayidx68.10 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.10
  %67 = load i16, ptr %arrayidx68.10, align 2, !tbaa !18
  %conv69.10 = sext i16 %67 to i32
  %arrayidx71.10 = getelementptr inbounds i16, ptr %4, i32 %inc77.9
  %68 = load i16, ptr %arrayidx71.10, align 2, !tbaa !18
  %conv72.10 = sext i16 %68 to i32
  %mul73.10 = mul nsw i32 %conv72.10, %conv69.10
  %conv74.10 = sext i32 %mul73.10 to i64
  %add75.10 = add nsw i64 %add75.9, %conv74.10
  %inc77.10 = add nuw nsw i32 %n57.0151, 11
  %exitcond159.not.10 = icmp eq i32 %inc77.10, %conv39
  br i1 %exitcond159.not.10, label %for.cond.cleanup63.loopexit, label %for.body64.11, !llvm.loop !23

for.body64.11:                                    ; preds = %for.body64.10
  %dec66.11 = add i16 %coeff_pos.1150, -12
  %idxprom67.11 = sext i16 %dec66.10 to i32
  %arrayidx68.11 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.11
  %69 = load i16, ptr %arrayidx68.11, align 2, !tbaa !18
  %conv69.11 = sext i16 %69 to i32
  %arrayidx71.11 = getelementptr inbounds i16, ptr %4, i32 %inc77.10
  %70 = load i16, ptr %arrayidx71.11, align 2, !tbaa !18
  %conv72.11 = sext i16 %70 to i32
  %mul73.11 = mul nsw i32 %conv72.11, %conv69.11
  %conv74.11 = sext i32 %mul73.11 to i64
  %add75.11 = add nsw i64 %add75.10, %conv74.11
  %inc77.11 = add nuw nsw i32 %n57.0151, 12
  %exitcond159.not.11 = icmp eq i32 %inc77.11, %conv39
  br i1 %exitcond159.not.11, label %for.cond.cleanup63.loopexit, label %for.body64.12, !llvm.loop !23

for.body64.12:                                    ; preds = %for.body64.11
  %dec66.12 = add i16 %coeff_pos.1150, -13
  %idxprom67.12 = sext i16 %dec66.11 to i32
  %arrayidx68.12 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.12
  %71 = load i16, ptr %arrayidx68.12, align 2, !tbaa !18
  %conv69.12 = sext i16 %71 to i32
  %arrayidx71.12 = getelementptr inbounds i16, ptr %4, i32 %inc77.11
  %72 = load i16, ptr %arrayidx71.12, align 2, !tbaa !18
  %conv72.12 = sext i16 %72 to i32
  %mul73.12 = mul nsw i32 %conv72.12, %conv69.12
  %conv74.12 = sext i32 %mul73.12 to i64
  %add75.12 = add nsw i64 %add75.11, %conv74.12
  %inc77.12 = add nuw nsw i32 %n57.0151, 13
  %exitcond159.not.12 = icmp eq i32 %inc77.12, %conv39
  br i1 %exitcond159.not.12, label %for.cond.cleanup63.loopexit, label %for.body64.13, !llvm.loop !23

for.body64.13:                                    ; preds = %for.body64.12
  %dec66.13 = add i16 %coeff_pos.1150, -14
  %idxprom67.13 = sext i16 %dec66.12 to i32
  %arrayidx68.13 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.13
  %73 = load i16, ptr %arrayidx68.13, align 2, !tbaa !18
  %conv69.13 = sext i16 %73 to i32
  %arrayidx71.13 = getelementptr inbounds i16, ptr %4, i32 %inc77.12
  %74 = load i16, ptr %arrayidx71.13, align 2, !tbaa !18
  %conv72.13 = sext i16 %74 to i32
  %mul73.13 = mul nsw i32 %conv72.13, %conv69.13
  %conv74.13 = sext i32 %mul73.13 to i64
  %add75.13 = add nsw i64 %add75.12, %conv74.13
  %inc77.13 = add nuw nsw i32 %n57.0151, 14
  %exitcond159.not.13 = icmp eq i32 %inc77.13, %conv39
  br i1 %exitcond159.not.13, label %for.cond.cleanup63.loopexit, label %for.body64.14, !llvm.loop !23

for.body64.14:                                    ; preds = %for.body64.13
  %dec66.14 = add i16 %coeff_pos.1150, -15
  %idxprom67.14 = sext i16 %dec66.13 to i32
  %arrayidx68.14 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.14
  %75 = load i16, ptr %arrayidx68.14, align 2, !tbaa !18
  %conv69.14 = sext i16 %75 to i32
  %arrayidx71.14 = getelementptr inbounds i16, ptr %4, i32 %inc77.13
  %76 = load i16, ptr %arrayidx71.14, align 2, !tbaa !18
  %conv72.14 = sext i16 %76 to i32
  %mul73.14 = mul nsw i32 %conv72.14, %conv69.14
  %conv74.14 = sext i32 %mul73.14 to i64
  %add75.14 = add nsw i64 %add75.13, %conv74.14
  %inc77.14 = add nuw nsw i32 %n57.0151, 15
  %exitcond159.not.14 = icmp eq i32 %inc77.14, %conv39
  br i1 %exitcond159.not.14, label %for.cond.cleanup63.loopexit, label %for.body64.15, !llvm.loop !23

for.body64.15:                                    ; preds = %for.body64.14
  %dec66.15 = add i16 %coeff_pos.1150, -16
  %idxprom67.15 = sext i16 %dec66.14 to i32
  %arrayidx68.15 = getelementptr inbounds i16, ptr %13, i32 %idxprom67.15
  %77 = load i16, ptr %arrayidx68.15, align 2, !tbaa !18
  %conv69.15 = sext i16 %77 to i32
  %arrayidx71.15 = getelementptr inbounds i16, ptr %4, i32 %inc77.14
  %78 = load i16, ptr %arrayidx71.15, align 2, !tbaa !18
  %conv72.15 = sext i16 %78 to i32
  %mul73.15 = mul nsw i32 %conv72.15, %conv69.15
  %conv74.15 = sext i32 %mul73.15 to i64
  %add75.15 = add nsw i64 %add75.14, %conv74.15
  %inc77.15 = add nuw nsw i32 %n57.0151, 16
  %exitcond159.not.15 = icmp eq i32 %inc77.15, %conv39
  br i1 %exitcond159.not.15, label %for.cond.cleanup63.loopexit, label %for.body64, !llvm.loop !23
}
