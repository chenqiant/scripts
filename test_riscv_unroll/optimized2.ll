; ModuleID = 'test2.ll'
source_filename = "test2.ll"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

%struct.fir_s16_s = type { ptr, ptr, i16, i16, i16, i16, i16, ptr, i32, i16 }

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
  %5 = sext i16 %3 to i32
  %6 = add i32 %5, -1
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond.cleanup63, %for.cond14.preheader.lr.ph
  %i.0156 = phi i32 [ 0, %for.cond14.preheader.lr.ph ], [ %inc96, %for.cond.cleanup63 ]
  %input_pos.0154 = phi i32 [ 0, %for.cond14.preheader.lr.ph ], [ %input_pos.1.lcssa, %for.cond.cleanup63 ]
  %7 = load i16, ptr %d_pos, align 2
  %cmp18138 = icmp sgt i16 %2, %7
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
  store i16 0, ptr %d_pos, align 2
  %8 = load i16, ptr %pos, align 2
  %conv39 = sext i16 %8 to i32
  %conv42 = sext i16 %3 to i32
  %coeff_pos.0141 = add i16 %3, -1
  %cmp43142 = icmp slt i16 %8, %3
  br i1 %cmp43142, label %for.body46.lr.ph, label %for.cond58.preheader

for.body46.lr.ph:                                 ; preds = %for.cond.cleanup20
  %9 = load ptr, ptr %fir, align 4
  %10 = sub i32 %5, %conv39
  %11 = sub i32 %6, %conv39
  %xtraiter = and i32 %10, 7
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body46.prol.preheader, label %for.body46.prol.loopexit

for.body46.prol.preheader:                        ; preds = %for.body46.lr.ph
  br label %for.body46.prol

for.body46.prol:                                  ; preds = %for.body46.prol.preheader
  %idxprom47.prol = sext i16 %coeff_pos.0141 to i32
  %arrayidx48.prol = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol
  %12 = load i16, ptr %arrayidx48.prol, align 2
  %conv49.prol = sext i16 %12 to i32
  %arrayidx51.prol = getelementptr inbounds i16, ptr %4, i32 %conv39
  %13 = load i16, ptr %arrayidx51.prol, align 2
  %conv52.prol = sext i16 %13 to i32
  %mul.prol = mul nsw i32 %conv52.prol, %conv49.prol
  %conv53.prol = sext i32 %mul.prol to i64
  %add.prol = add nsw i64 %rounding.0, %conv53.prol
  %inc55.prol = add nsw i32 %conv39, 1
  %coeff_pos.0.prol = add i16 %3, -2
  %prol.iter.cmp = icmp ne i32 1, %xtraiter
  br i1 %prol.iter.cmp, label %for.body46.prol.1, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.1:                                ; preds = %for.body46.prol
  %idxprom47.prol.1 = sext i16 %coeff_pos.0.prol to i32
  %arrayidx48.prol.1 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.1
  %14 = load i16, ptr %arrayidx48.prol.1, align 2
  %conv49.prol.1 = sext i16 %14 to i32
  %arrayidx51.prol.1 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol
  %15 = load i16, ptr %arrayidx51.prol.1, align 2
  %conv52.prol.1 = sext i16 %15 to i32
  %mul.prol.1 = mul nsw i32 %conv52.prol.1, %conv49.prol.1
  %conv53.prol.1 = sext i32 %mul.prol.1 to i64
  %add.prol.1 = add nsw i64 %add.prol, %conv53.prol.1
  %inc55.prol.1 = add nsw i32 %conv39, 2
  %coeff_pos.0.prol.1 = add i16 %3, -3
  %prol.iter.cmp.1 = icmp ne i32 2, %xtraiter
  br i1 %prol.iter.cmp.1, label %for.body46.prol.2, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.2:                                ; preds = %for.body46.prol.1
  %idxprom47.prol.2 = sext i16 %coeff_pos.0.prol.1 to i32
  %arrayidx48.prol.2 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.2
  %16 = load i16, ptr %arrayidx48.prol.2, align 2
  %conv49.prol.2 = sext i16 %16 to i32
  %arrayidx51.prol.2 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.1
  %17 = load i16, ptr %arrayidx51.prol.2, align 2
  %conv52.prol.2 = sext i16 %17 to i32
  %mul.prol.2 = mul nsw i32 %conv52.prol.2, %conv49.prol.2
  %conv53.prol.2 = sext i32 %mul.prol.2 to i64
  %add.prol.2 = add nsw i64 %add.prol.1, %conv53.prol.2
  %inc55.prol.2 = add nsw i32 %conv39, 3
  %coeff_pos.0.prol.2 = add i16 %3, -4
  %prol.iter.cmp.2 = icmp ne i32 3, %xtraiter
  br i1 %prol.iter.cmp.2, label %for.body46.prol.3, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.3:                                ; preds = %for.body46.prol.2
  %idxprom47.prol.3 = sext i16 %coeff_pos.0.prol.2 to i32
  %arrayidx48.prol.3 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.3
  %18 = load i16, ptr %arrayidx48.prol.3, align 2
  %conv49.prol.3 = sext i16 %18 to i32
  %arrayidx51.prol.3 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.2
  %19 = load i16, ptr %arrayidx51.prol.3, align 2
  %conv52.prol.3 = sext i16 %19 to i32
  %mul.prol.3 = mul nsw i32 %conv52.prol.3, %conv49.prol.3
  %conv53.prol.3 = sext i32 %mul.prol.3 to i64
  %add.prol.3 = add nsw i64 %add.prol.2, %conv53.prol.3
  %inc55.prol.3 = add nsw i32 %conv39, 4
  %coeff_pos.0.prol.3 = add i16 %3, -5
  %prol.iter.cmp.3 = icmp ne i32 4, %xtraiter
  br i1 %prol.iter.cmp.3, label %for.body46.prol.4, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.4:                                ; preds = %for.body46.prol.3
  %idxprom47.prol.4 = sext i16 %coeff_pos.0.prol.3 to i32
  %arrayidx48.prol.4 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.4
  %20 = load i16, ptr %arrayidx48.prol.4, align 2
  %conv49.prol.4 = sext i16 %20 to i32
  %arrayidx51.prol.4 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.3
  %21 = load i16, ptr %arrayidx51.prol.4, align 2
  %conv52.prol.4 = sext i16 %21 to i32
  %mul.prol.4 = mul nsw i32 %conv52.prol.4, %conv49.prol.4
  %conv53.prol.4 = sext i32 %mul.prol.4 to i64
  %add.prol.4 = add nsw i64 %add.prol.3, %conv53.prol.4
  %inc55.prol.4 = add nsw i32 %conv39, 5
  %coeff_pos.0.prol.4 = add i16 %3, -6
  %prol.iter.cmp.4 = icmp ne i32 5, %xtraiter
  br i1 %prol.iter.cmp.4, label %for.body46.prol.5, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.5:                                ; preds = %for.body46.prol.4
  %idxprom47.prol.5 = sext i16 %coeff_pos.0.prol.4 to i32
  %arrayidx48.prol.5 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.5
  %22 = load i16, ptr %arrayidx48.prol.5, align 2
  %conv49.prol.5 = sext i16 %22 to i32
  %arrayidx51.prol.5 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.4
  %23 = load i16, ptr %arrayidx51.prol.5, align 2
  %conv52.prol.5 = sext i16 %23 to i32
  %mul.prol.5 = mul nsw i32 %conv52.prol.5, %conv49.prol.5
  %conv53.prol.5 = sext i32 %mul.prol.5 to i64
  %add.prol.5 = add nsw i64 %add.prol.4, %conv53.prol.5
  %inc55.prol.5 = add nsw i32 %conv39, 6
  %coeff_pos.0.prol.5 = add i16 %3, -7
  %prol.iter.cmp.5 = icmp ne i32 6, %xtraiter
  br i1 %prol.iter.cmp.5, label %for.body46.prol.6, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.6:                                ; preds = %for.body46.prol.5
  %idxprom47.prol.6 = sext i16 %coeff_pos.0.prol.5 to i32
  %arrayidx48.prol.6 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.6
  %24 = load i16, ptr %arrayidx48.prol.6, align 2
  %conv49.prol.6 = sext i16 %24 to i32
  %arrayidx51.prol.6 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.5
  %25 = load i16, ptr %arrayidx51.prol.6, align 2
  %conv52.prol.6 = sext i16 %25 to i32
  %mul.prol.6 = mul nsw i32 %conv52.prol.6, %conv49.prol.6
  %conv53.prol.6 = sext i32 %mul.prol.6 to i64
  %add.prol.6 = add nsw i64 %add.prol.5, %conv53.prol.6
  %inc55.prol.6 = add nsw i32 %conv39, 7
  %coeff_pos.0.prol.6 = add i16 %3, -8
  br label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.loopexit.unr-lcssa:               ; preds = %for.body46.prol.6, %for.body46.prol.5, %for.body46.prol.4, %for.body46.prol.3, %for.body46.prol.2, %for.body46.prol.1, %for.body46.prol
  %add.lcssa.unr.ph = phi i64 [ %add.prol, %for.body46.prol ], [ %add.prol.1, %for.body46.prol.1 ], [ %add.prol.2, %for.body46.prol.2 ], [ %add.prol.3, %for.body46.prol.3 ], [ %add.prol.4, %for.body46.prol.4 ], [ %add.prol.5, %for.body46.prol.5 ], [ %add.prol.6, %for.body46.prol.6 ]
  %coeff_pos.0145.unr.ph = phi i16 [ %coeff_pos.0.prol, %for.body46.prol ], [ %coeff_pos.0.prol.1, %for.body46.prol.1 ], [ %coeff_pos.0.prol.2, %for.body46.prol.2 ], [ %coeff_pos.0.prol.3, %for.body46.prol.3 ], [ %coeff_pos.0.prol.4, %for.body46.prol.4 ], [ %coeff_pos.0.prol.5, %for.body46.prol.5 ], [ %coeff_pos.0.prol.6, %for.body46.prol.6 ]
  %n.0144.unr.ph = phi i32 [ %inc55.prol, %for.body46.prol ], [ %inc55.prol.1, %for.body46.prol.1 ], [ %inc55.prol.2, %for.body46.prol.2 ], [ %inc55.prol.3, %for.body46.prol.3 ], [ %inc55.prol.4, %for.body46.prol.4 ], [ %inc55.prol.5, %for.body46.prol.5 ], [ %inc55.prol.6, %for.body46.prol.6 ]
  %acc.0143.unr.ph = phi i64 [ %add.prol, %for.body46.prol ], [ %add.prol.1, %for.body46.prol.1 ], [ %add.prol.2, %for.body46.prol.2 ], [ %add.prol.3, %for.body46.prol.3 ], [ %add.prol.4, %for.body46.prol.4 ], [ %add.prol.5, %for.body46.prol.5 ], [ %add.prol.6, %for.body46.prol.6 ]
  br label %for.body46.prol.loopexit

for.body46.prol.loopexit:                         ; preds = %for.body46.prol.loopexit.unr-lcssa, %for.body46.lr.ph
  %add.lcssa.unr = phi i64 [ undef, %for.body46.lr.ph ], [ %add.lcssa.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %coeff_pos.0145.unr = phi i16 [ %coeff_pos.0141, %for.body46.lr.ph ], [ %coeff_pos.0145.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %n.0144.unr = phi i32 [ %conv39, %for.body46.lr.ph ], [ %n.0144.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %acc.0143.unr = phi i64 [ %rounding.0, %for.body46.lr.ph ], [ %acc.0143.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %26 = icmp ult i32 %11, 7
  br i1 %26, label %for.cond58.preheader.loopexit, label %for.body46.lr.ph.new

for.body46.lr.ph.new:                             ; preds = %for.body46.prol.loopexit
  br label %for.body46

for.body21:                                       ; preds = %if.end28, %for.body21.lr.ph
  %j.0140 = phi i32 [ 0, %for.body21.lr.ph ], [ %inc32, %if.end28 ]
  %input_pos.1139 = phi i32 [ %input_pos.0154, %for.body21.lr.ph ], [ %inc, %if.end28 ]
  %27 = load i16, ptr %pos, align 2
  %cmp24.not = icmp slt i16 %27, %3
  br i1 %cmp24.not, label %if.end28, label %if.then26

if.then26:                                        ; preds = %for.body21
  store i16 0, ptr %pos, align 2
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %for.body21
  %28 = phi i16 [ 0, %if.then26 ], [ %27, %for.body21 ]
  %inc = add nsw i32 %input_pos.1139, 1
  %arrayidx = getelementptr inbounds i16, ptr %input, i32 %input_pos.1139
  %29 = load i16, ptr %arrayidx, align 2
  %inc30 = add nsw i16 %28, 1
  store i16 %inc30, ptr %pos, align 2
  %idxprom = sext i16 %28 to i32
  %arrayidx31 = getelementptr inbounds i16, ptr %4, i32 %idxprom
  store i16 %29, ptr %arrayidx31, align 2
  %inc32 = add nuw nsw i32 %j.0140, 1
  %conv15 = sext i16 %2 to i32
  %30 = load i16, ptr %d_pos, align 2
  %conv16 = sext i16 %30 to i32
  %sub17 = sub nsw i32 %conv15, %conv16
  %cmp18 = icmp slt i32 %inc32, %sub17
  br i1 %cmp18, label %for.body21, label %for.cond.cleanup20.loopexit

for.cond58.preheader.loopexit.unr-lcssa:          ; preds = %for.body46
  %add.lcssa.ph = phi i64 [ %add.7, %for.body46 ]
  br label %for.cond58.preheader.loopexit

for.cond58.preheader.loopexit:                    ; preds = %for.body46.prol.loopexit, %for.cond58.preheader.loopexit.unr-lcssa
  %add.lcssa = phi i64 [ %add.lcssa.unr, %for.body46.prol.loopexit ], [ %add.lcssa.ph, %for.cond58.preheader.loopexit.unr-lcssa ]
  %31 = add i16 %8, -1
  br label %for.cond58.preheader

for.cond58.preheader:                             ; preds = %for.cond58.preheader.loopexit, %for.cond.cleanup20
  %acc.0.lcssa = phi i64 [ %rounding.0, %for.cond.cleanup20 ], [ %add.lcssa, %for.cond58.preheader.loopexit ]
  %coeff_pos.0.lcssa = phi i16 [ %coeff_pos.0141, %for.cond.cleanup20 ], [ %31, %for.cond58.preheader.loopexit ]
  %cmp61148 = icmp sgt i16 %8, 0
  br i1 %cmp61148, label %for.body64.lr.ph, label %for.cond.cleanup63

for.body64.lr.ph:                                 ; preds = %for.cond58.preheader
  %32 = load ptr, ptr %fir, align 4
  %33 = add nsw i32 %conv39, -1
  %xtraiter1 = and i32 %conv39, 7
  %34 = icmp ult i32 %33, 7
  br i1 %34, label %for.cond.cleanup63.loopexit.unr-lcssa, label %for.body64.lr.ph.new

for.body64.lr.ph.new:                             ; preds = %for.body64.lr.ph
  %unroll_iter = sub i32 %conv39, %xtraiter1
  br label %for.body64

for.body46:                                       ; preds = %for.body46, %for.body46.lr.ph.new
  %coeff_pos.0145 = phi i16 [ %coeff_pos.0145.unr, %for.body46.lr.ph.new ], [ %coeff_pos.0.7, %for.body46 ]
  %n.0144 = phi i32 [ %n.0144.unr, %for.body46.lr.ph.new ], [ %inc55.7, %for.body46 ]
  %acc.0143 = phi i64 [ %acc.0143.unr, %for.body46.lr.ph.new ], [ %add.7, %for.body46 ]
  %idxprom47 = sext i16 %coeff_pos.0145 to i32
  %arrayidx48 = getelementptr inbounds i16, ptr %9, i32 %idxprom47
  %35 = load i16, ptr %arrayidx48, align 2
  %conv49 = sext i16 %35 to i32
  %arrayidx51 = getelementptr inbounds i16, ptr %4, i32 %n.0144
  %36 = load i16, ptr %arrayidx51, align 2
  %conv52 = sext i16 %36 to i32
  %mul = mul nsw i32 %conv52, %conv49
  %conv53 = sext i32 %mul to i64
  %add = add nsw i64 %acc.0143, %conv53
  %inc55 = add nsw i32 %n.0144, 1
  %coeff_pos.0 = add i16 %coeff_pos.0145, -1
  %idxprom47.1 = sext i16 %coeff_pos.0 to i32
  %arrayidx48.1 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.1
  %37 = load i16, ptr %arrayidx48.1, align 2
  %conv49.1 = sext i16 %37 to i32
  %arrayidx51.1 = getelementptr inbounds i16, ptr %4, i32 %inc55
  %38 = load i16, ptr %arrayidx51.1, align 2
  %conv52.1 = sext i16 %38 to i32
  %mul.1 = mul nsw i32 %conv52.1, %conv49.1
  %conv53.1 = sext i32 %mul.1 to i64
  %add.1 = add nsw i64 %add, %conv53.1
  %inc55.1 = add nsw i32 %n.0144, 2
  %coeff_pos.0.1 = add i16 %coeff_pos.0145, -2
  %idxprom47.2 = sext i16 %coeff_pos.0.1 to i32
  %arrayidx48.2 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.2
  %39 = load i16, ptr %arrayidx48.2, align 2
  %conv49.2 = sext i16 %39 to i32
  %arrayidx51.2 = getelementptr inbounds i16, ptr %4, i32 %inc55.1
  %40 = load i16, ptr %arrayidx51.2, align 2
  %conv52.2 = sext i16 %40 to i32
  %mul.2 = mul nsw i32 %conv52.2, %conv49.2
  %conv53.2 = sext i32 %mul.2 to i64
  %add.2 = add nsw i64 %add.1, %conv53.2
  %inc55.2 = add nsw i32 %n.0144, 3
  %coeff_pos.0.2 = add i16 %coeff_pos.0145, -3
  %idxprom47.3 = sext i16 %coeff_pos.0.2 to i32
  %arrayidx48.3 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.3
  %41 = load i16, ptr %arrayidx48.3, align 2
  %conv49.3 = sext i16 %41 to i32
  %arrayidx51.3 = getelementptr inbounds i16, ptr %4, i32 %inc55.2
  %42 = load i16, ptr %arrayidx51.3, align 2
  %conv52.3 = sext i16 %42 to i32
  %mul.3 = mul nsw i32 %conv52.3, %conv49.3
  %conv53.3 = sext i32 %mul.3 to i64
  %add.3 = add nsw i64 %add.2, %conv53.3
  %inc55.3 = add nsw i32 %n.0144, 4
  %coeff_pos.0.3 = add i16 %coeff_pos.0145, -4
  %idxprom47.4 = sext i16 %coeff_pos.0.3 to i32
  %arrayidx48.4 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.4
  %43 = load i16, ptr %arrayidx48.4, align 2
  %conv49.4 = sext i16 %43 to i32
  %arrayidx51.4 = getelementptr inbounds i16, ptr %4, i32 %inc55.3
  %44 = load i16, ptr %arrayidx51.4, align 2
  %conv52.4 = sext i16 %44 to i32
  %mul.4 = mul nsw i32 %conv52.4, %conv49.4
  %conv53.4 = sext i32 %mul.4 to i64
  %add.4 = add nsw i64 %add.3, %conv53.4
  %inc55.4 = add nsw i32 %n.0144, 5
  %coeff_pos.0.4 = add i16 %coeff_pos.0145, -5
  %idxprom47.5 = sext i16 %coeff_pos.0.4 to i32
  %arrayidx48.5 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.5
  %45 = load i16, ptr %arrayidx48.5, align 2
  %conv49.5 = sext i16 %45 to i32
  %arrayidx51.5 = getelementptr inbounds i16, ptr %4, i32 %inc55.4
  %46 = load i16, ptr %arrayidx51.5, align 2
  %conv52.5 = sext i16 %46 to i32
  %mul.5 = mul nsw i32 %conv52.5, %conv49.5
  %conv53.5 = sext i32 %mul.5 to i64
  %add.5 = add nsw i64 %add.4, %conv53.5
  %inc55.5 = add nsw i32 %n.0144, 6
  %coeff_pos.0.5 = add i16 %coeff_pos.0145, -6
  %idxprom47.6 = sext i16 %coeff_pos.0.5 to i32
  %arrayidx48.6 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.6
  %47 = load i16, ptr %arrayidx48.6, align 2
  %conv49.6 = sext i16 %47 to i32
  %arrayidx51.6 = getelementptr inbounds i16, ptr %4, i32 %inc55.5
  %48 = load i16, ptr %arrayidx51.6, align 2
  %conv52.6 = sext i16 %48 to i32
  %mul.6 = mul nsw i32 %conv52.6, %conv49.6
  %conv53.6 = sext i32 %mul.6 to i64
  %add.6 = add nsw i64 %add.5, %conv53.6
  %inc55.6 = add nsw i32 %n.0144, 7
  %coeff_pos.0.6 = add i16 %coeff_pos.0145, -7
  %idxprom47.7 = sext i16 %coeff_pos.0.6 to i32
  %arrayidx48.7 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.7
  %49 = load i16, ptr %arrayidx48.7, align 2
  %conv49.7 = sext i16 %49 to i32
  %arrayidx51.7 = getelementptr inbounds i16, ptr %4, i32 %inc55.6
  %50 = load i16, ptr %arrayidx51.7, align 2
  %conv52.7 = sext i16 %50 to i32
  %mul.7 = mul nsw i32 %conv52.7, %conv49.7
  %conv53.7 = sext i32 %mul.7 to i64
  %add.7 = add nsw i64 %add.6, %conv53.7
  %inc55.7 = add nsw i32 %n.0144, 8
  %coeff_pos.0.7 = add i16 %coeff_pos.0145, -8
  %exitcond.not.7 = icmp eq i32 %inc55.7, %conv42
  br i1 %exitcond.not.7, label %for.cond58.preheader.loopexit.unr-lcssa, label %for.body46

for.cond.cleanup63.loopexit.unr-lcssa.loopexit:   ; preds = %for.body64
  %add75.lcssa.ph.ph = phi i64 [ %add75.7, %for.body64 ]
  %n57.0151.unr.ph = phi i32 [ %inc77.7, %for.body64 ]
  %coeff_pos.1150.unr.ph = phi i16 [ %dec66.7, %for.body64 ]
  %acc.1149.unr.ph = phi i64 [ %add75.7, %for.body64 ]
  br label %for.cond.cleanup63.loopexit.unr-lcssa

for.cond.cleanup63.loopexit.unr-lcssa:            ; preds = %for.cond.cleanup63.loopexit.unr-lcssa.loopexit, %for.body64.lr.ph
  %add75.lcssa.ph = phi i64 [ undef, %for.body64.lr.ph ], [ %add75.lcssa.ph.ph, %for.cond.cleanup63.loopexit.unr-lcssa.loopexit ]
  %n57.0151.unr = phi i32 [ 0, %for.body64.lr.ph ], [ %n57.0151.unr.ph, %for.cond.cleanup63.loopexit.unr-lcssa.loopexit ]
  %coeff_pos.1150.unr = phi i16 [ %coeff_pos.0.lcssa, %for.body64.lr.ph ], [ %coeff_pos.1150.unr.ph, %for.cond.cleanup63.loopexit.unr-lcssa.loopexit ]
  %acc.1149.unr = phi i64 [ %acc.0.lcssa, %for.body64.lr.ph ], [ %acc.1149.unr.ph, %for.cond.cleanup63.loopexit.unr-lcssa.loopexit ]
  %lcmp.mod2 = icmp ne i32 %xtraiter1, 0
  br i1 %lcmp.mod2, label %for.body64.epil.preheader, label %for.cond.cleanup63.loopexit

for.body64.epil.preheader:                        ; preds = %for.cond.cleanup63.loopexit.unr-lcssa
  br label %for.body64.epil

for.body64.epil:                                  ; preds = %for.body64.epil.preheader
  %dec66.epil = add i16 %coeff_pos.1150.unr, -1
  %idxprom67.epil = sext i16 %coeff_pos.1150.unr to i32
  %arrayidx68.epil = getelementptr inbounds i16, ptr %32, i32 %idxprom67.epil
  %51 = load i16, ptr %arrayidx68.epil, align 2
  %conv69.epil = sext i16 %51 to i32
  %arrayidx71.epil = getelementptr inbounds i16, ptr %4, i32 %n57.0151.unr
  %52 = load i16, ptr %arrayidx71.epil, align 2
  %conv72.epil = sext i16 %52 to i32
  %mul73.epil = mul nsw i32 %conv72.epil, %conv69.epil
  %conv74.epil = sext i32 %mul73.epil to i64
  %add75.epil = add nsw i64 %acc.1149.unr, %conv74.epil
  %inc77.epil = add nuw nsw i32 %n57.0151.unr, 1
  %epil.iter.cmp = icmp ne i32 1, %xtraiter1
  br i1 %epil.iter.cmp, label %for.body64.epil.1, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.1:                                ; preds = %for.body64.epil
  %dec66.epil.1 = add i16 %coeff_pos.1150.unr, -2
  %idxprom67.epil.1 = sext i16 %dec66.epil to i32
  %arrayidx68.epil.1 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.epil.1
  %53 = load i16, ptr %arrayidx68.epil.1, align 2
  %conv69.epil.1 = sext i16 %53 to i32
  %arrayidx71.epil.1 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil
  %54 = load i16, ptr %arrayidx71.epil.1, align 2
  %conv72.epil.1 = sext i16 %54 to i32
  %mul73.epil.1 = mul nsw i32 %conv72.epil.1, %conv69.epil.1
  %conv74.epil.1 = sext i32 %mul73.epil.1 to i64
  %add75.epil.1 = add nsw i64 %add75.epil, %conv74.epil.1
  %inc77.epil.1 = add nuw nsw i32 %n57.0151.unr, 2
  %epil.iter.cmp.1 = icmp ne i32 2, %xtraiter1
  br i1 %epil.iter.cmp.1, label %for.body64.epil.2, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.2:                                ; preds = %for.body64.epil.1
  %dec66.epil.2 = add i16 %coeff_pos.1150.unr, -3
  %idxprom67.epil.2 = sext i16 %dec66.epil.1 to i32
  %arrayidx68.epil.2 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.epil.2
  %55 = load i16, ptr %arrayidx68.epil.2, align 2
  %conv69.epil.2 = sext i16 %55 to i32
  %arrayidx71.epil.2 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.1
  %56 = load i16, ptr %arrayidx71.epil.2, align 2
  %conv72.epil.2 = sext i16 %56 to i32
  %mul73.epil.2 = mul nsw i32 %conv72.epil.2, %conv69.epil.2
  %conv74.epil.2 = sext i32 %mul73.epil.2 to i64
  %add75.epil.2 = add nsw i64 %add75.epil.1, %conv74.epil.2
  %inc77.epil.2 = add nuw nsw i32 %n57.0151.unr, 3
  %epil.iter.cmp.2 = icmp ne i32 3, %xtraiter1
  br i1 %epil.iter.cmp.2, label %for.body64.epil.3, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.3:                                ; preds = %for.body64.epil.2
  %dec66.epil.3 = add i16 %coeff_pos.1150.unr, -4
  %idxprom67.epil.3 = sext i16 %dec66.epil.2 to i32
  %arrayidx68.epil.3 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.epil.3
  %57 = load i16, ptr %arrayidx68.epil.3, align 2
  %conv69.epil.3 = sext i16 %57 to i32
  %arrayidx71.epil.3 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.2
  %58 = load i16, ptr %arrayidx71.epil.3, align 2
  %conv72.epil.3 = sext i16 %58 to i32
  %mul73.epil.3 = mul nsw i32 %conv72.epil.3, %conv69.epil.3
  %conv74.epil.3 = sext i32 %mul73.epil.3 to i64
  %add75.epil.3 = add nsw i64 %add75.epil.2, %conv74.epil.3
  %inc77.epil.3 = add nuw nsw i32 %n57.0151.unr, 4
  %epil.iter.cmp.3 = icmp ne i32 4, %xtraiter1
  br i1 %epil.iter.cmp.3, label %for.body64.epil.4, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.4:                                ; preds = %for.body64.epil.3
  %dec66.epil.4 = add i16 %coeff_pos.1150.unr, -5
  %idxprom67.epil.4 = sext i16 %dec66.epil.3 to i32
  %arrayidx68.epil.4 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.epil.4
  %59 = load i16, ptr %arrayidx68.epil.4, align 2
  %conv69.epil.4 = sext i16 %59 to i32
  %arrayidx71.epil.4 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.3
  %60 = load i16, ptr %arrayidx71.epil.4, align 2
  %conv72.epil.4 = sext i16 %60 to i32
  %mul73.epil.4 = mul nsw i32 %conv72.epil.4, %conv69.epil.4
  %conv74.epil.4 = sext i32 %mul73.epil.4 to i64
  %add75.epil.4 = add nsw i64 %add75.epil.3, %conv74.epil.4
  %inc77.epil.4 = add nuw nsw i32 %n57.0151.unr, 5
  %epil.iter.cmp.4 = icmp ne i32 5, %xtraiter1
  br i1 %epil.iter.cmp.4, label %for.body64.epil.5, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.5:                                ; preds = %for.body64.epil.4
  %dec66.epil.5 = add i16 %coeff_pos.1150.unr, -6
  %idxprom67.epil.5 = sext i16 %dec66.epil.4 to i32
  %arrayidx68.epil.5 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.epil.5
  %61 = load i16, ptr %arrayidx68.epil.5, align 2
  %conv69.epil.5 = sext i16 %61 to i32
  %arrayidx71.epil.5 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.4
  %62 = load i16, ptr %arrayidx71.epil.5, align 2
  %conv72.epil.5 = sext i16 %62 to i32
  %mul73.epil.5 = mul nsw i32 %conv72.epil.5, %conv69.epil.5
  %conv74.epil.5 = sext i32 %mul73.epil.5 to i64
  %add75.epil.5 = add nsw i64 %add75.epil.4, %conv74.epil.5
  %inc77.epil.5 = add nuw nsw i32 %n57.0151.unr, 6
  %epil.iter.cmp.5 = icmp ne i32 6, %xtraiter1
  br i1 %epil.iter.cmp.5, label %for.body64.epil.6, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.6:                                ; preds = %for.body64.epil.5
  %idxprom67.epil.6 = sext i16 %dec66.epil.5 to i32
  %arrayidx68.epil.6 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.epil.6
  %63 = load i16, ptr %arrayidx68.epil.6, align 2
  %conv69.epil.6 = sext i16 %63 to i32
  %arrayidx71.epil.6 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.5
  %64 = load i16, ptr %arrayidx71.epil.6, align 2
  %conv72.epil.6 = sext i16 %64 to i32
  %mul73.epil.6 = mul nsw i32 %conv72.epil.6, %conv69.epil.6
  %conv74.epil.6 = sext i32 %mul73.epil.6 to i64
  %add75.epil.6 = add nsw i64 %add75.epil.5, %conv74.epil.6
  br label %for.cond.cleanup63.loopexit.epilog-lcssa

for.cond.cleanup63.loopexit.epilog-lcssa:         ; preds = %for.body64.epil.6, %for.body64.epil.5, %for.body64.epil.4, %for.body64.epil.3, %for.body64.epil.2, %for.body64.epil.1, %for.body64.epil
  %add75.lcssa.ph3 = phi i64 [ %add75.epil, %for.body64.epil ], [ %add75.epil.1, %for.body64.epil.1 ], [ %add75.epil.2, %for.body64.epil.2 ], [ %add75.epil.3, %for.body64.epil.3 ], [ %add75.epil.4, %for.body64.epil.4 ], [ %add75.epil.5, %for.body64.epil.5 ], [ %add75.epil.6, %for.body64.epil.6 ]
  br label %for.cond.cleanup63.loopexit

for.cond.cleanup63.loopexit:                      ; preds = %for.cond.cleanup63.loopexit.unr-lcssa, %for.cond.cleanup63.loopexit.epilog-lcssa
  %add75.lcssa = phi i64 [ %add75.lcssa.ph, %for.cond.cleanup63.loopexit.unr-lcssa ], [ %add75.lcssa.ph3, %for.cond.cleanup63.loopexit.epilog-lcssa ]
  br label %for.cond.cleanup63

for.cond.cleanup63:                               ; preds = %for.cond.cleanup63.loopexit, %for.cond58.preheader
  %acc.1.lcssa = phi i64 [ %acc.0.lcssa, %for.cond58.preheader ], [ %add75.lcssa, %for.cond.cleanup63.loopexit ]
  %shr90 = ashr i64 %acc.1.lcssa, %sh_prom89
  %shl83 = shl i64 %acc.1.lcssa, %sh_prom82
  %shr90.sink = select i1 %cmp79, i64 %shl83, i64 %shr90
  %conv91 = trunc i64 %shr90.sink to i16
  %65 = getelementptr inbounds i16, ptr %output, i32 %i.0156
  store i16 %conv91, ptr %65, align 2
  %inc96 = add nuw nsw i32 %i.0156, 1
  %exitcond160.not = icmp eq i32 %inc96, %len
  br i1 %exitcond160.not, label %for.cond.cleanup.loopexit, label %for.cond14.preheader

for.body64:                                       ; preds = %for.body64, %for.body64.lr.ph.new
  %n57.0151 = phi i32 [ 0, %for.body64.lr.ph.new ], [ %inc77.7, %for.body64 ]
  %coeff_pos.1150 = phi i16 [ %coeff_pos.0.lcssa, %for.body64.lr.ph.new ], [ %dec66.7, %for.body64 ]
  %acc.1149 = phi i64 [ %acc.0.lcssa, %for.body64.lr.ph.new ], [ %add75.7, %for.body64 ]
  %niter = phi i32 [ 0, %for.body64.lr.ph.new ], [ %niter.next.7, %for.body64 ]
  %dec66 = add i16 %coeff_pos.1150, -1
  %idxprom67 = sext i16 %coeff_pos.1150 to i32
  %arrayidx68 = getelementptr inbounds i16, ptr %32, i32 %idxprom67
  %66 = load i16, ptr %arrayidx68, align 2
  %conv69 = sext i16 %66 to i32
  %arrayidx71 = getelementptr inbounds i16, ptr %4, i32 %n57.0151
  %67 = load i16, ptr %arrayidx71, align 2
  %conv72 = sext i16 %67 to i32
  %mul73 = mul nsw i32 %conv72, %conv69
  %conv74 = sext i32 %mul73 to i64
  %add75 = add nsw i64 %acc.1149, %conv74
  %inc77 = add nuw nsw i32 %n57.0151, 1
  %dec66.1 = add i16 %coeff_pos.1150, -2
  %idxprom67.1 = sext i16 %dec66 to i32
  %arrayidx68.1 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.1
  %68 = load i16, ptr %arrayidx68.1, align 2
  %conv69.1 = sext i16 %68 to i32
  %arrayidx71.1 = getelementptr inbounds i16, ptr %4, i32 %inc77
  %69 = load i16, ptr %arrayidx71.1, align 2
  %conv72.1 = sext i16 %69 to i32
  %mul73.1 = mul nsw i32 %conv72.1, %conv69.1
  %conv74.1 = sext i32 %mul73.1 to i64
  %add75.1 = add nsw i64 %add75, %conv74.1
  %inc77.1 = add nuw nsw i32 %n57.0151, 2
  %dec66.2 = add i16 %coeff_pos.1150, -3
  %idxprom67.2 = sext i16 %dec66.1 to i32
  %arrayidx68.2 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.2
  %70 = load i16, ptr %arrayidx68.2, align 2
  %conv69.2 = sext i16 %70 to i32
  %arrayidx71.2 = getelementptr inbounds i16, ptr %4, i32 %inc77.1
  %71 = load i16, ptr %arrayidx71.2, align 2
  %conv72.2 = sext i16 %71 to i32
  %mul73.2 = mul nsw i32 %conv72.2, %conv69.2
  %conv74.2 = sext i32 %mul73.2 to i64
  %add75.2 = add nsw i64 %add75.1, %conv74.2
  %inc77.2 = add nuw nsw i32 %n57.0151, 3
  %dec66.3 = add i16 %coeff_pos.1150, -4
  %idxprom67.3 = sext i16 %dec66.2 to i32
  %arrayidx68.3 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.3
  %72 = load i16, ptr %arrayidx68.3, align 2
  %conv69.3 = sext i16 %72 to i32
  %arrayidx71.3 = getelementptr inbounds i16, ptr %4, i32 %inc77.2
  %73 = load i16, ptr %arrayidx71.3, align 2
  %conv72.3 = sext i16 %73 to i32
  %mul73.3 = mul nsw i32 %conv72.3, %conv69.3
  %conv74.3 = sext i32 %mul73.3 to i64
  %add75.3 = add nsw i64 %add75.2, %conv74.3
  %inc77.3 = add nuw nsw i32 %n57.0151, 4
  %dec66.4 = add i16 %coeff_pos.1150, -5
  %idxprom67.4 = sext i16 %dec66.3 to i32
  %arrayidx68.4 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.4
  %74 = load i16, ptr %arrayidx68.4, align 2
  %conv69.4 = sext i16 %74 to i32
  %arrayidx71.4 = getelementptr inbounds i16, ptr %4, i32 %inc77.3
  %75 = load i16, ptr %arrayidx71.4, align 2
  %conv72.4 = sext i16 %75 to i32
  %mul73.4 = mul nsw i32 %conv72.4, %conv69.4
  %conv74.4 = sext i32 %mul73.4 to i64
  %add75.4 = add nsw i64 %add75.3, %conv74.4
  %inc77.4 = add nuw nsw i32 %n57.0151, 5
  %dec66.5 = add i16 %coeff_pos.1150, -6
  %idxprom67.5 = sext i16 %dec66.4 to i32
  %arrayidx68.5 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.5
  %76 = load i16, ptr %arrayidx68.5, align 2
  %conv69.5 = sext i16 %76 to i32
  %arrayidx71.5 = getelementptr inbounds i16, ptr %4, i32 %inc77.4
  %77 = load i16, ptr %arrayidx71.5, align 2
  %conv72.5 = sext i16 %77 to i32
  %mul73.5 = mul nsw i32 %conv72.5, %conv69.5
  %conv74.5 = sext i32 %mul73.5 to i64
  %add75.5 = add nsw i64 %add75.4, %conv74.5
  %inc77.5 = add nuw nsw i32 %n57.0151, 6
  %dec66.6 = add i16 %coeff_pos.1150, -7
  %idxprom67.6 = sext i16 %dec66.5 to i32
  %arrayidx68.6 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.6
  %78 = load i16, ptr %arrayidx68.6, align 2
  %conv69.6 = sext i16 %78 to i32
  %arrayidx71.6 = getelementptr inbounds i16, ptr %4, i32 %inc77.5
  %79 = load i16, ptr %arrayidx71.6, align 2
  %conv72.6 = sext i16 %79 to i32
  %mul73.6 = mul nsw i32 %conv72.6, %conv69.6
  %conv74.6 = sext i32 %mul73.6 to i64
  %add75.6 = add nsw i64 %add75.5, %conv74.6
  %inc77.6 = add nuw nsw i32 %n57.0151, 7
  %dec66.7 = add i16 %coeff_pos.1150, -8
  %idxprom67.7 = sext i16 %dec66.6 to i32
  %arrayidx68.7 = getelementptr inbounds i16, ptr %32, i32 %idxprom67.7
  %80 = load i16, ptr %arrayidx68.7, align 2
  %conv69.7 = sext i16 %80 to i32
  %arrayidx71.7 = getelementptr inbounds i16, ptr %4, i32 %inc77.6
  %81 = load i16, ptr %arrayidx71.7, align 2
  %conv72.7 = sext i16 %81 to i32
  %mul73.7 = mul nsw i32 %conv72.7, %conv69.7
  %conv74.7 = sext i32 %mul73.7 to i64
  %add75.7 = add nsw i64 %add75.6, %conv74.7
  %inc77.7 = add nuw nsw i32 %n57.0151, 8
  %niter.next.7 = add i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.cond.cleanup63.loopexit.unr-lcssa.loopexit, label %for.body64
}

attributes #0 = { "target-cpu"="sifive-s76" }
