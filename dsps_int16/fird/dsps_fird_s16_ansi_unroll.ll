; ModuleID = 'dsps_fird_s16_ansi.ll'
source_filename = "dsps_fird_s16_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.fir_s16_s = type { ptr, ptr, i16, i16, i16, i16, i16, ptr, i32, i16 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fird_s16_ansi(ptr nocapture noundef %fir, ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 {
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
  %cmp12153 = icmp sgt i32 %len, 0
  br i1 %cmp12153, label %for.cond14.preheader.lr.ph, label %for.cond.cleanup

for.cond14.preheader.lr.ph:                       ; preds = %if.end
  %decim = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 4
  %d_pos = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 5
  %pos = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 3
  %coeffs_len = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 2
  %delay = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 1
  %cmp79 = icmp sgt i16 %0, 15
  %sub88 = sub nsw i32 15, %conv
  %sh_prom89 = zext nneg i32 %sub88 to i64
  %sh_prom82 = zext nneg i32 %sub to i64
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond.cleanup63, %for.cond14.preheader.lr.ph
  %i.0156 = phi i32 [ 0, %for.cond14.preheader.lr.ph ], [ %inc96, %for.cond.cleanup63 ]
  %input_pos.0154 = phi i32 [ 0, %for.cond14.preheader.lr.ph ], [ %input_pos.1.lcssa, %for.cond.cleanup63 ]
  %2 = load i16, ptr %decim, align 4, !tbaa !12
  %3 = load i16, ptr %d_pos, align 2, !tbaa !13
  %cmp18138 = icmp sgt i16 %2, %3
  br i1 %cmp18138, label %for.body21.lr.ph, label %for.cond.cleanup20

for.body21.lr.ph:                                 ; preds = %for.cond14.preheader
  %4 = load ptr, ptr %delay, align 4, !tbaa !14
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
  store i16 0, ptr %d_pos, align 2, !tbaa !13
  %5 = load i16, ptr %coeffs_len, align 4, !tbaa !15
  %6 = load i16, ptr %pos, align 2, !tbaa !16
  %conv39 = sext i16 %6 to i32
  %conv42 = sext i16 %5 to i32
  %coeff_pos.0141 = add i16 %5, -1
  %cmp43142 = icmp slt i16 %6, %5
  br i1 %cmp43142, label %for.body46.lr.ph, label %for.cond58.preheader

for.body46.lr.ph:                                 ; preds = %for.cond.cleanup20
  %7 = load ptr, ptr %fir, align 4, !tbaa !17
  %8 = load ptr, ptr %delay, align 4, !tbaa !14
  %9 = sub i32 %conv42, %conv39
  %10 = add i32 %conv42, -1
  %11 = sub i32 %10, %conv39
  %xtraiter = and i32 %9, 7
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body46.prol.preheader, label %for.body46.prol.loopexit

for.body46.prol.preheader:                        ; preds = %for.body46.lr.ph
  br label %for.body46.prol

for.body46.prol:                                  ; preds = %for.body46.prol, %for.body46.prol.preheader
  %coeff_pos.0145.prol = phi i16 [ %coeff_pos.0141, %for.body46.prol.preheader ], [ %coeff_pos.0.prol, %for.body46.prol ]
  %n.0144.prol = phi i32 [ %conv39, %for.body46.prol.preheader ], [ %inc55.prol, %for.body46.prol ]
  %acc.0143.prol = phi i64 [ %rounding.0, %for.body46.prol.preheader ], [ %add.prol, %for.body46.prol ]
  %prol.iter = phi i32 [ 0, %for.body46.prol.preheader ], [ %prol.iter.next, %for.body46.prol ]
  %idxprom47.prol = sext i16 %coeff_pos.0145.prol to i32
  %arrayidx48.prol = getelementptr inbounds i16, ptr %7, i32 %idxprom47.prol
  %12 = load i16, ptr %arrayidx48.prol, align 2, !tbaa !18
  %conv49.prol = sext i16 %12 to i32
  %arrayidx51.prol = getelementptr inbounds i16, ptr %8, i32 %n.0144.prol
  %13 = load i16, ptr %arrayidx51.prol, align 2, !tbaa !18
  %conv52.prol = sext i16 %13 to i32
  %mul.prol = mul nsw i32 %conv52.prol, %conv49.prol
  %conv53.prol = sext i32 %mul.prol to i64
  %add.prol = add nsw i64 %acc.0143.prol, %conv53.prol
  %inc55.prol = add nsw i32 %n.0144.prol, 1
  %coeff_pos.0.prol = add i16 %coeff_pos.0145.prol, -1
  %exitcond.not.prol = icmp eq i32 %inc55.prol, %conv42
  %prol.iter.next = add i32 %prol.iter, 1
  %prol.iter.cmp = icmp ne i32 %prol.iter.next, %xtraiter
  br i1 %prol.iter.cmp, label %for.body46.prol, label %for.body46.prol.loopexit.unr-lcssa, !llvm.loop !19

for.body46.prol.loopexit.unr-lcssa:               ; preds = %for.body46.prol
  %add.lcssa.unr.ph = phi i64 [ %add.prol, %for.body46.prol ]
  %coeff_pos.0145.unr.ph = phi i16 [ %coeff_pos.0.prol, %for.body46.prol ]
  %n.0144.unr.ph = phi i32 [ %inc55.prol, %for.body46.prol ]
  %acc.0143.unr.ph = phi i64 [ %add.prol, %for.body46.prol ]
  br label %for.body46.prol.loopexit

for.body46.prol.loopexit:                         ; preds = %for.body46.prol.loopexit.unr-lcssa, %for.body46.lr.ph
  %add.lcssa.unr = phi i64 [ undef, %for.body46.lr.ph ], [ %add.lcssa.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %coeff_pos.0145.unr = phi i16 [ %coeff_pos.0141, %for.body46.lr.ph ], [ %coeff_pos.0145.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %n.0144.unr = phi i32 [ %conv39, %for.body46.lr.ph ], [ %n.0144.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %acc.0143.unr = phi i64 [ %rounding.0, %for.body46.lr.ph ], [ %acc.0143.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %14 = icmp ult i32 %11, 7
  br i1 %14, label %for.cond58.preheader.loopexit, label %for.body46.lr.ph.new

for.body46.lr.ph.new:                             ; preds = %for.body46.prol.loopexit
  br label %for.body46

for.body21:                                       ; preds = %if.end28, %for.body21.lr.ph
  %j.0140 = phi i32 [ 0, %for.body21.lr.ph ], [ %inc32, %if.end28 ]
  %input_pos.1139 = phi i32 [ %input_pos.0154, %for.body21.lr.ph ], [ %inc, %if.end28 ]
  %15 = load i16, ptr %pos, align 2, !tbaa !16
  %16 = load i16, ptr %coeffs_len, align 4, !tbaa !15
  %cmp24.not = icmp slt i16 %15, %16
  br i1 %cmp24.not, label %if.end28, label %if.then26

if.then26:                                        ; preds = %for.body21
  store i16 0, ptr %pos, align 2, !tbaa !16
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %for.body21
  %17 = phi i16 [ 0, %if.then26 ], [ %15, %for.body21 ]
  %inc = add nsw i32 %input_pos.1139, 1
  %arrayidx = getelementptr inbounds i16, ptr %input, i32 %input_pos.1139
  %18 = load i16, ptr %arrayidx, align 2, !tbaa !18
  %inc30 = add nsw i16 %17, 1
  store i16 %inc30, ptr %pos, align 2, !tbaa !16
  %idxprom = sext i16 %17 to i32
  %arrayidx31 = getelementptr inbounds i16, ptr %4, i32 %idxprom
  store i16 %18, ptr %arrayidx31, align 2, !tbaa !18
  %inc32 = add nuw nsw i32 %j.0140, 1
  %19 = load i16, ptr %decim, align 4, !tbaa !12
  %conv15 = sext i16 %19 to i32
  %20 = load i16, ptr %d_pos, align 2, !tbaa !13
  %conv16 = sext i16 %20 to i32
  %sub17 = sub nsw i32 %conv15, %conv16
  %cmp18 = icmp slt i32 %inc32, %sub17
  br i1 %cmp18, label %for.body21, label %for.cond.cleanup20.loopexit, !llvm.loop !21

for.cond58.preheader.loopexit.unr-lcssa:          ; preds = %for.body46
  %add.lcssa.ph = phi i64 [ %add.7, %for.body46 ]
  br label %for.cond58.preheader.loopexit

for.cond58.preheader.loopexit:                    ; preds = %for.body46.prol.loopexit, %for.cond58.preheader.loopexit.unr-lcssa
  %add.lcssa = phi i64 [ %add.lcssa.unr, %for.body46.prol.loopexit ], [ %add.lcssa.ph, %for.cond58.preheader.loopexit.unr-lcssa ]
  %21 = add i16 %6, -1
  br label %for.cond58.preheader

for.cond58.preheader:                             ; preds = %for.cond58.preheader.loopexit, %for.cond.cleanup20
  %acc.0.lcssa = phi i64 [ %rounding.0, %for.cond.cleanup20 ], [ %add.lcssa, %for.cond58.preheader.loopexit ]
  %coeff_pos.0.lcssa = phi i16 [ %coeff_pos.0141, %for.cond.cleanup20 ], [ %21, %for.cond58.preheader.loopexit ]
  %cmp61148 = icmp sgt i16 %6, 0
  br i1 %cmp61148, label %for.body64.lr.ph, label %for.cond.cleanup63

for.body64.lr.ph:                                 ; preds = %for.cond58.preheader
  %22 = load ptr, ptr %fir, align 4, !tbaa !17
  %23 = load ptr, ptr %delay, align 4, !tbaa !14
  %24 = add nsw i32 %conv39, -1
  %xtraiter1 = and i32 %conv39, 7
  %25 = icmp ult i32 %24, 7
  br i1 %25, label %for.cond.cleanup63.loopexit.unr-lcssa, label %for.body64.lr.ph.new

for.body64.lr.ph.new:                             ; preds = %for.body64.lr.ph
  %unroll_iter = sub i32 %conv39, %xtraiter1
  br label %for.body64

for.body46:                                       ; preds = %for.body46, %for.body46.lr.ph.new
  %coeff_pos.0145 = phi i16 [ %coeff_pos.0145.unr, %for.body46.lr.ph.new ], [ %coeff_pos.0.7, %for.body46 ]
  %n.0144 = phi i32 [ %n.0144.unr, %for.body46.lr.ph.new ], [ %inc55.7, %for.body46 ]
  %acc.0143 = phi i64 [ %acc.0143.unr, %for.body46.lr.ph.new ], [ %add.7, %for.body46 ]
  %idxprom47 = sext i16 %coeff_pos.0145 to i32
  %arrayidx48 = getelementptr inbounds i16, ptr %7, i32 %idxprom47
  %26 = load i16, ptr %arrayidx48, align 2, !tbaa !18
  %conv49 = sext i16 %26 to i32
  %arrayidx51 = getelementptr inbounds i16, ptr %8, i32 %n.0144
  %27 = load i16, ptr %arrayidx51, align 2, !tbaa !18
  %conv52 = sext i16 %27 to i32
  %mul = mul nsw i32 %conv52, %conv49
  %conv53 = sext i32 %mul to i64
  %add = add nsw i64 %acc.0143, %conv53
  %inc55 = add nsw i32 %n.0144, 1
  %coeff_pos.0 = add i16 %coeff_pos.0145, -1
  %idxprom47.1 = sext i16 %coeff_pos.0 to i32
  %arrayidx48.1 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.1
  %28 = load i16, ptr %arrayidx48.1, align 2, !tbaa !18
  %conv49.1 = sext i16 %28 to i32
  %arrayidx51.1 = getelementptr inbounds i16, ptr %8, i32 %inc55
  %29 = load i16, ptr %arrayidx51.1, align 2, !tbaa !18
  %conv52.1 = sext i16 %29 to i32
  %mul.1 = mul nsw i32 %conv52.1, %conv49.1
  %conv53.1 = sext i32 %mul.1 to i64
  %add.1 = add nsw i64 %add, %conv53.1
  %inc55.1 = add nsw i32 %n.0144, 2
  %coeff_pos.0.1 = add i16 %coeff_pos.0145, -2
  %idxprom47.2 = sext i16 %coeff_pos.0.1 to i32
  %arrayidx48.2 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.2
  %30 = load i16, ptr %arrayidx48.2, align 2, !tbaa !18
  %conv49.2 = sext i16 %30 to i32
  %arrayidx51.2 = getelementptr inbounds i16, ptr %8, i32 %inc55.1
  %31 = load i16, ptr %arrayidx51.2, align 2, !tbaa !18
  %conv52.2 = sext i16 %31 to i32
  %mul.2 = mul nsw i32 %conv52.2, %conv49.2
  %conv53.2 = sext i32 %mul.2 to i64
  %add.2 = add nsw i64 %add.1, %conv53.2
  %inc55.2 = add nsw i32 %n.0144, 3
  %coeff_pos.0.2 = add i16 %coeff_pos.0145, -3
  %idxprom47.3 = sext i16 %coeff_pos.0.2 to i32
  %arrayidx48.3 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.3
  %32 = load i16, ptr %arrayidx48.3, align 2, !tbaa !18
  %conv49.3 = sext i16 %32 to i32
  %arrayidx51.3 = getelementptr inbounds i16, ptr %8, i32 %inc55.2
  %33 = load i16, ptr %arrayidx51.3, align 2, !tbaa !18
  %conv52.3 = sext i16 %33 to i32
  %mul.3 = mul nsw i32 %conv52.3, %conv49.3
  %conv53.3 = sext i32 %mul.3 to i64
  %add.3 = add nsw i64 %add.2, %conv53.3
  %inc55.3 = add nsw i32 %n.0144, 4
  %coeff_pos.0.3 = add i16 %coeff_pos.0145, -4
  %idxprom47.4 = sext i16 %coeff_pos.0.3 to i32
  %arrayidx48.4 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.4
  %34 = load i16, ptr %arrayidx48.4, align 2, !tbaa !18
  %conv49.4 = sext i16 %34 to i32
  %arrayidx51.4 = getelementptr inbounds i16, ptr %8, i32 %inc55.3
  %35 = load i16, ptr %arrayidx51.4, align 2, !tbaa !18
  %conv52.4 = sext i16 %35 to i32
  %mul.4 = mul nsw i32 %conv52.4, %conv49.4
  %conv53.4 = sext i32 %mul.4 to i64
  %add.4 = add nsw i64 %add.3, %conv53.4
  %inc55.4 = add nsw i32 %n.0144, 5
  %coeff_pos.0.4 = add i16 %coeff_pos.0145, -5
  %idxprom47.5 = sext i16 %coeff_pos.0.4 to i32
  %arrayidx48.5 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.5
  %36 = load i16, ptr %arrayidx48.5, align 2, !tbaa !18
  %conv49.5 = sext i16 %36 to i32
  %arrayidx51.5 = getelementptr inbounds i16, ptr %8, i32 %inc55.4
  %37 = load i16, ptr %arrayidx51.5, align 2, !tbaa !18
  %conv52.5 = sext i16 %37 to i32
  %mul.5 = mul nsw i32 %conv52.5, %conv49.5
  %conv53.5 = sext i32 %mul.5 to i64
  %add.5 = add nsw i64 %add.4, %conv53.5
  %inc55.5 = add nsw i32 %n.0144, 6
  %coeff_pos.0.5 = add i16 %coeff_pos.0145, -6
  %idxprom47.6 = sext i16 %coeff_pos.0.5 to i32
  %arrayidx48.6 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.6
  %38 = load i16, ptr %arrayidx48.6, align 2, !tbaa !18
  %conv49.6 = sext i16 %38 to i32
  %arrayidx51.6 = getelementptr inbounds i16, ptr %8, i32 %inc55.5
  %39 = load i16, ptr %arrayidx51.6, align 2, !tbaa !18
  %conv52.6 = sext i16 %39 to i32
  %mul.6 = mul nsw i32 %conv52.6, %conv49.6
  %conv53.6 = sext i32 %mul.6 to i64
  %add.6 = add nsw i64 %add.5, %conv53.6
  %inc55.6 = add nsw i32 %n.0144, 7
  %coeff_pos.0.6 = add i16 %coeff_pos.0145, -7
  %idxprom47.7 = sext i16 %coeff_pos.0.6 to i32
  %arrayidx48.7 = getelementptr inbounds i16, ptr %7, i32 %idxprom47.7
  %40 = load i16, ptr %arrayidx48.7, align 2, !tbaa !18
  %conv49.7 = sext i16 %40 to i32
  %arrayidx51.7 = getelementptr inbounds i16, ptr %8, i32 %inc55.6
  %41 = load i16, ptr %arrayidx51.7, align 2, !tbaa !18
  %conv52.7 = sext i16 %41 to i32
  %mul.7 = mul nsw i32 %conv52.7, %conv49.7
  %conv53.7 = sext i32 %mul.7 to i64
  %add.7 = add nsw i64 %add.6, %conv53.7
  %inc55.7 = add nsw i32 %n.0144, 8
  %coeff_pos.0.7 = add i16 %coeff_pos.0145, -8
  %exitcond.not.7 = icmp eq i32 %inc55.7, %conv42
  br i1 %exitcond.not.7, label %for.cond58.preheader.loopexit.unr-lcssa, label %for.body46, !llvm.loop !23

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

for.body64.epil:                                  ; preds = %for.body64.epil, %for.body64.epil.preheader
  %n57.0151.epil = phi i32 [ %n57.0151.unr, %for.body64.epil.preheader ], [ %inc77.epil, %for.body64.epil ]
  %coeff_pos.1150.epil = phi i16 [ %coeff_pos.1150.unr, %for.body64.epil.preheader ], [ %dec66.epil, %for.body64.epil ]
  %acc.1149.epil = phi i64 [ %acc.1149.unr, %for.body64.epil.preheader ], [ %add75.epil, %for.body64.epil ]
  %epil.iter = phi i32 [ 0, %for.body64.epil.preheader ], [ %epil.iter.next, %for.body64.epil ]
  %dec66.epil = add i16 %coeff_pos.1150.epil, -1
  %idxprom67.epil = sext i16 %coeff_pos.1150.epil to i32
  %arrayidx68.epil = getelementptr inbounds i16, ptr %22, i32 %idxprom67.epil
  %42 = load i16, ptr %arrayidx68.epil, align 2, !tbaa !18
  %conv69.epil = sext i16 %42 to i32
  %arrayidx71.epil = getelementptr inbounds i16, ptr %23, i32 %n57.0151.epil
  %43 = load i16, ptr %arrayidx71.epil, align 2, !tbaa !18
  %conv72.epil = sext i16 %43 to i32
  %mul73.epil = mul nsw i32 %conv72.epil, %conv69.epil
  %conv74.epil = sext i32 %mul73.epil to i64
  %add75.epil = add nsw i64 %acc.1149.epil, %conv74.epil
  %inc77.epil = add nuw nsw i32 %n57.0151.epil, 1
  %exitcond159.not.epil = icmp eq i32 %inc77.epil, %conv39
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp = icmp ne i32 %epil.iter.next, %xtraiter1
  br i1 %epil.iter.cmp, label %for.body64.epil, label %for.cond.cleanup63.loopexit.epilog-lcssa, !llvm.loop !24

for.cond.cleanup63.loopexit.epilog-lcssa:         ; preds = %for.body64.epil
  %add75.lcssa.ph3 = phi i64 [ %add75.epil, %for.body64.epil ]
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
  %44 = getelementptr inbounds i16, ptr %output, i32 %i.0156
  store i16 %conv91, ptr %44, align 2
  %inc96 = add nuw nsw i32 %i.0156, 1
  %exitcond160.not = icmp eq i32 %inc96, %len
  br i1 %exitcond160.not, label %for.cond.cleanup.loopexit, label %for.cond14.preheader, !llvm.loop !25

for.body64:                                       ; preds = %for.body64, %for.body64.lr.ph.new
  %n57.0151 = phi i32 [ 0, %for.body64.lr.ph.new ], [ %inc77.7, %for.body64 ]
  %coeff_pos.1150 = phi i16 [ %coeff_pos.0.lcssa, %for.body64.lr.ph.new ], [ %dec66.7, %for.body64 ]
  %acc.1149 = phi i64 [ %acc.0.lcssa, %for.body64.lr.ph.new ], [ %add75.7, %for.body64 ]
  %niter = phi i32 [ 0, %for.body64.lr.ph.new ], [ %niter.next.7, %for.body64 ]
  %dec66 = add i16 %coeff_pos.1150, -1
  %idxprom67 = sext i16 %coeff_pos.1150 to i32
  %arrayidx68 = getelementptr inbounds i16, ptr %22, i32 %idxprom67
  %45 = load i16, ptr %arrayidx68, align 2, !tbaa !18
  %conv69 = sext i16 %45 to i32
  %arrayidx71 = getelementptr inbounds i16, ptr %23, i32 %n57.0151
  %46 = load i16, ptr %arrayidx71, align 2, !tbaa !18
  %conv72 = sext i16 %46 to i32
  %mul73 = mul nsw i32 %conv72, %conv69
  %conv74 = sext i32 %mul73 to i64
  %add75 = add nsw i64 %acc.1149, %conv74
  %inc77 = add nuw nsw i32 %n57.0151, 1
  %dec66.1 = add i16 %coeff_pos.1150, -2
  %idxprom67.1 = sext i16 %dec66 to i32
  %arrayidx68.1 = getelementptr inbounds i16, ptr %22, i32 %idxprom67.1
  %47 = load i16, ptr %arrayidx68.1, align 2, !tbaa !18
  %conv69.1 = sext i16 %47 to i32
  %arrayidx71.1 = getelementptr inbounds i16, ptr %23, i32 %inc77
  %48 = load i16, ptr %arrayidx71.1, align 2, !tbaa !18
  %conv72.1 = sext i16 %48 to i32
  %mul73.1 = mul nsw i32 %conv72.1, %conv69.1
  %conv74.1 = sext i32 %mul73.1 to i64
  %add75.1 = add nsw i64 %add75, %conv74.1
  %inc77.1 = add nuw nsw i32 %n57.0151, 2
  %dec66.2 = add i16 %coeff_pos.1150, -3
  %idxprom67.2 = sext i16 %dec66.1 to i32
  %arrayidx68.2 = getelementptr inbounds i16, ptr %22, i32 %idxprom67.2
  %49 = load i16, ptr %arrayidx68.2, align 2, !tbaa !18
  %conv69.2 = sext i16 %49 to i32
  %arrayidx71.2 = getelementptr inbounds i16, ptr %23, i32 %inc77.1
  %50 = load i16, ptr %arrayidx71.2, align 2, !tbaa !18
  %conv72.2 = sext i16 %50 to i32
  %mul73.2 = mul nsw i32 %conv72.2, %conv69.2
  %conv74.2 = sext i32 %mul73.2 to i64
  %add75.2 = add nsw i64 %add75.1, %conv74.2
  %inc77.2 = add nuw nsw i32 %n57.0151, 3
  %dec66.3 = add i16 %coeff_pos.1150, -4
  %idxprom67.3 = sext i16 %dec66.2 to i32
  %arrayidx68.3 = getelementptr inbounds i16, ptr %22, i32 %idxprom67.3
  %51 = load i16, ptr %arrayidx68.3, align 2, !tbaa !18
  %conv69.3 = sext i16 %51 to i32
  %arrayidx71.3 = getelementptr inbounds i16, ptr %23, i32 %inc77.2
  %52 = load i16, ptr %arrayidx71.3, align 2, !tbaa !18
  %conv72.3 = sext i16 %52 to i32
  %mul73.3 = mul nsw i32 %conv72.3, %conv69.3
  %conv74.3 = sext i32 %mul73.3 to i64
  %add75.3 = add nsw i64 %add75.2, %conv74.3
  %inc77.3 = add nuw nsw i32 %n57.0151, 4
  %dec66.4 = add i16 %coeff_pos.1150, -5
  %idxprom67.4 = sext i16 %dec66.3 to i32
  %arrayidx68.4 = getelementptr inbounds i16, ptr %22, i32 %idxprom67.4
  %53 = load i16, ptr %arrayidx68.4, align 2, !tbaa !18
  %conv69.4 = sext i16 %53 to i32
  %arrayidx71.4 = getelementptr inbounds i16, ptr %23, i32 %inc77.3
  %54 = load i16, ptr %arrayidx71.4, align 2, !tbaa !18
  %conv72.4 = sext i16 %54 to i32
  %mul73.4 = mul nsw i32 %conv72.4, %conv69.4
  %conv74.4 = sext i32 %mul73.4 to i64
  %add75.4 = add nsw i64 %add75.3, %conv74.4
  %inc77.4 = add nuw nsw i32 %n57.0151, 5
  %dec66.5 = add i16 %coeff_pos.1150, -6
  %idxprom67.5 = sext i16 %dec66.4 to i32
  %arrayidx68.5 = getelementptr inbounds i16, ptr %22, i32 %idxprom67.5
  %55 = load i16, ptr %arrayidx68.5, align 2, !tbaa !18
  %conv69.5 = sext i16 %55 to i32
  %arrayidx71.5 = getelementptr inbounds i16, ptr %23, i32 %inc77.4
  %56 = load i16, ptr %arrayidx71.5, align 2, !tbaa !18
  %conv72.5 = sext i16 %56 to i32
  %mul73.5 = mul nsw i32 %conv72.5, %conv69.5
  %conv74.5 = sext i32 %mul73.5 to i64
  %add75.5 = add nsw i64 %add75.4, %conv74.5
  %inc77.5 = add nuw nsw i32 %n57.0151, 6
  %dec66.6 = add i16 %coeff_pos.1150, -7
  %idxprom67.6 = sext i16 %dec66.5 to i32
  %arrayidx68.6 = getelementptr inbounds i16, ptr %22, i32 %idxprom67.6
  %57 = load i16, ptr %arrayidx68.6, align 2, !tbaa !18
  %conv69.6 = sext i16 %57 to i32
  %arrayidx71.6 = getelementptr inbounds i16, ptr %23, i32 %inc77.5
  %58 = load i16, ptr %arrayidx71.6, align 2, !tbaa !18
  %conv72.6 = sext i16 %58 to i32
  %mul73.6 = mul nsw i32 %conv72.6, %conv69.6
  %conv74.6 = sext i32 %mul73.6 to i64
  %add75.6 = add nsw i64 %add75.5, %conv74.6
  %inc77.6 = add nuw nsw i32 %n57.0151, 7
  %dec66.7 = add i16 %coeff_pos.1150, -8
  %idxprom67.7 = sext i16 %dec66.6 to i32
  %arrayidx68.7 = getelementptr inbounds i16, ptr %22, i32 %idxprom67.7
  %59 = load i16, ptr %arrayidx68.7, align 2, !tbaa !18
  %conv69.7 = sext i16 %59 to i32
  %arrayidx71.7 = getelementptr inbounds i16, ptr %23, i32 %inc77.6
  %60 = load i16, ptr %arrayidx71.7, align 2, !tbaa !18
  %conv72.7 = sext i16 %60 to i32
  %mul73.7 = mul nsw i32 %conv72.7, %conv69.7
  %conv74.7 = sext i32 %mul73.7 to i64
  %add75.7 = add nsw i64 %add75.6, %conv74.7
  %inc77.7 = add nuw nsw i32 %n57.0151, 8
  %niter.next.7 = add i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.cond.cleanup63.loopexit.unr-lcssa.loopexit, label %for.body64, !llvm.loop !26
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb)"}
!4 = !{!5, !9, i64 16}
!5 = !{!"fir_s16_s", !6, i64 0, !6, i64 4, !9, i64 8, !9, i64 10, !9, i64 12, !9, i64 14, !9, i64 16, !6, i64 20, !10, i64 24, !9, i64 28}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"short", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!5, !10, i64 24}
!12 = !{!5, !9, i64 12}
!13 = !{!5, !9, i64 14}
!14 = !{!5, !6, i64 4}
!15 = !{!5, !9, i64 8}
!16 = !{!5, !9, i64 10}
!17 = !{!5, !6, i64 0}
!18 = !{!9, !9, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22, !20}
!24 = distinct !{!24, !20}
!25 = distinct !{!25, !22}
!26 = distinct !{!26, !22, !20}
