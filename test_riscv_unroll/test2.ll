%struct.fir_s16_s = type { ptr, ptr, i16, i16, i16, i16, i16, ptr, i32, i16 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fird_s16_ansi(ptr nocapture noundef %fir, ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %shift = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 6
  %0 = load i16, ptr %shift, align 4
  %conv = sext i16 %0 to i32
  %sub = add nsw i32 %conv, -15
  %rounding_val = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 8
  %1 = load i32, ptr %rounding_val, align 4
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
  %2 = load i16, ptr %decim, align 4
  %coeffs_len = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 2
  %3 = load i16, ptr %coeffs_len, align 4
  %delay = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 1
  %4 = load ptr, ptr %delay, align 4
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
  %5 = load i16, ptr %d_pos, align 2
  %cmp18138 = icmp sgt i16 %2, %5
  br i1 %cmp18138, label %for.body21.lr.ph, label %for.cond.cleanup20

for.body21.lr.ph:                                 ; preds = %for.cond14.preheader
  br label %for.body21

for.cond.cleanup:                                 ; preds = %for.cond.cleanup63, %if.end
  %result.0.lcssa = phi i32 [ 0, %if.end ], [ %len, %for.cond.cleanup63 ]
  ret i32 %result.0.lcssa

for.cond.cleanup20:                               ; preds = %if.end28, %for.cond14.preheader
  %input_pos.1.lcssa = phi i32 [ %input_pos.0154, %for.cond14.preheader ], [ %inc, %if.end28 ]
  store i16 0, ptr %d_pos, align 2
  %6 = load i16, ptr %pos, align 2
  %conv39 = sext i16 %6 to i32
  %conv42 = sext i16 %3 to i32
  %coeff_pos.0141 = add i16 %3, -1
  %cmp43142 = icmp slt i16 %6, %3
  br i1 %cmp43142, label %for.body46.lr.ph, label %for.cond58.preheader

for.body46.lr.ph:                                 ; preds = %for.cond.cleanup20
  %7 = load ptr, ptr %fir, align 4
  br label %for.body46

for.body21:                                       ; preds = %if.end28, %for.body21.lr.ph
  %j.0140 = phi i32 [ 0, %for.body21.lr.ph ], [ %inc32, %if.end28 ]
  %input_pos.1139 = phi i32 [ %input_pos.0154, %for.body21.lr.ph ], [ %inc, %if.end28 ]
  %8 = load i16, ptr %pos, align 2
  %cmp24.not = icmp slt i16 %8, %3
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
  %arrayidx31 = getelementptr inbounds i16, ptr %4, i32 %idxprom
  store i16 %10, ptr %arrayidx31, align 2
  %inc32 = add nuw nsw i32 %j.0140, 1
  %conv15 = sext i16 %2 to i32
  %11 = load i16, ptr %d_pos, align 2
  %conv16 = sext i16 %11 to i32
  %sub17 = sub nsw i32 %conv15, %conv16
  %cmp18 = icmp slt i32 %inc32, %sub17
  br i1 %cmp18, label %for.body21, label %for.cond.cleanup20

for.cond58.preheader.loopexit:                    ; preds = %for.body46
  %12 = add i16 %6, -1
  br label %for.cond58.preheader

for.cond58.preheader:                             ; preds = %for.cond58.preheader.loopexit, %for.cond.cleanup20
  %acc.0.lcssa = phi i64 [ %rounding.0, %for.cond.cleanup20 ], [ %add, %for.cond58.preheader.loopexit ]
  %coeff_pos.0.lcssa = phi i16 [ %coeff_pos.0141, %for.cond.cleanup20 ], [ %12, %for.cond58.preheader.loopexit ]
  %cmp61148 = icmp sgt i16 %6, 0
  br i1 %cmp61148, label %for.body64.lr.ph, label %for.cond.cleanup63

for.body64.lr.ph:                                 ; preds = %for.cond58.preheader
  %13 = load ptr, ptr %fir, align 4
  br label %for.body64

for.body46:                                       ; preds = %for.body46, %for.body46.lr.ph
  %coeff_pos.0145 = phi i16 [ %coeff_pos.0141, %for.body46.lr.ph ], [ %coeff_pos.0, %for.body46 ]
  %n.0144 = phi i32 [ %conv39, %for.body46.lr.ph ], [ %inc55, %for.body46 ]
  %acc.0143 = phi i64 [ %rounding.0, %for.body46.lr.ph ], [ %add, %for.body46 ]
  %idxprom47 = sext i16 %coeff_pos.0145 to i32
  %arrayidx48 = getelementptr inbounds i16, ptr %7, i32 %idxprom47
  %14 = load i16, ptr %arrayidx48, align 2
  %conv49 = sext i16 %14 to i32
  %arrayidx51 = getelementptr inbounds i16, ptr %4, i32 %n.0144
  %15 = load i16, ptr %arrayidx51, align 2
  %conv52 = sext i16 %15 to i32
  %mul = mul nsw i32 %conv52, %conv49
  %conv53 = sext i32 %mul to i64
  %add = add nsw i64 %acc.0143, %conv53
  %inc55 = add nsw i32 %n.0144, 1
  %coeff_pos.0 = add i16 %coeff_pos.0145, -1
  %exitcond.not = icmp eq i32 %inc55, %conv42
  br i1 %exitcond.not, label %for.cond58.preheader.loopexit, label %for.body46

for.cond.cleanup63:                               ; preds = %for.body64, %for.cond58.preheader
  %acc.1.lcssa = phi i64 [ %acc.0.lcssa, %for.cond58.preheader ], [ %add75, %for.body64 ]
  %shr90 = ashr i64 %acc.1.lcssa, %sh_prom89
  %shl83 = shl i64 %acc.1.lcssa, %sh_prom82
  %shr90.sink = select i1 %cmp79, i64 %shl83, i64 %shr90
  %conv91 = trunc i64 %shr90.sink to i16
  %16 = getelementptr inbounds i16, ptr %output, i32 %i.0156
  store i16 %conv91, ptr %16, align 2
  %inc96 = add nuw nsw i32 %i.0156, 1
  %exitcond160.not = icmp eq i32 %inc96, %len
  br i1 %exitcond160.not, label %for.cond.cleanup, label %for.cond14.preheader

for.body64:                                       ; preds = %for.body64, %for.body64.lr.ph
  %n57.0151 = phi i32 [ 0, %for.body64.lr.ph ], [ %inc77, %for.body64 ]
  %coeff_pos.1150 = phi i16 [ %coeff_pos.0.lcssa, %for.body64.lr.ph ], [ %dec66, %for.body64 ]
  %acc.1149 = phi i64 [ %acc.0.lcssa, %for.body64.lr.ph ], [ %add75, %for.body64 ]
  %dec66 = add i16 %coeff_pos.1150, -1
  %idxprom67 = sext i16 %coeff_pos.1150 to i32
  %arrayidx68 = getelementptr inbounds i16, ptr %13, i32 %idxprom67
  %17 = load i16, ptr %arrayidx68, align 2
  %conv69 = sext i16 %17 to i32
  %arrayidx71 = getelementptr inbounds i16, ptr %4, i32 %n57.0151
  %18 = load i16, ptr %arrayidx71, align 2
  %conv72 = sext i16 %18 to i32
  %mul73 = mul nsw i32 %conv72, %conv69
  %conv74 = sext i32 %mul73 to i64
  %add75 = add nsw i64 %acc.1149, %conv74
  %inc77 = add nuw nsw i32 %n57.0151, 1
  %exitcond159.not = icmp eq i32 %inc77, %conv39
  br i1 %exitcond159.not, label %for.cond.cleanup63, label %for.body64
}