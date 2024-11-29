; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_fird_s16_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.fir_s16_s = type { ptr, ptr, i16, i16, i16, i16, i16, ptr, i32, i16 }

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
  %5 = sext i16 %3 to i32
  %6 = add i32 %5, -1
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond.cleanup63, %for.cond14.preheader.lr.ph
  %i.0156 = phi i32 [ 0, %for.cond14.preheader.lr.ph ], [ %inc96, %for.cond.cleanup63 ]
  %input_pos.0154 = phi i32 [ 0, %for.cond14.preheader.lr.ph ], [ %input_pos.1.lcssa, %for.cond.cleanup63 ]
  %7 = load i16, ptr %d_pos, align 2, !tbaa !15
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
  store i16 0, ptr %d_pos, align 2, !tbaa !15
  %8 = load i16, ptr %pos, align 2, !tbaa !16
  %conv39 = sext i16 %8 to i32
  %conv42 = sext i16 %3 to i32
  %coeff_pos.0141 = add i16 %3, -1
  %cmp43142 = icmp slt i16 %8, %3
  br i1 %cmp43142, label %for.body46.lr.ph, label %for.cond58.preheader

for.body46.lr.ph:                                 ; preds = %for.cond.cleanup20
  %9 = load ptr, ptr %fir, align 4, !tbaa !17
  %10 = sub i32 %5, %conv39
  %11 = sub i32 %6, %conv39
  %xtraiter = and i32 %10, 15
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body46.prol.preheader, label %for.body46.prol.loopexit

for.body46.prol.preheader:                        ; preds = %for.body46.lr.ph
  br label %for.body46.prol

for.body46.prol:                                  ; preds = %for.body46.prol.preheader
  %idxprom47.prol = sext i16 %coeff_pos.0141 to i32
  %arrayidx48.prol = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol
  %12 = load i16, ptr %arrayidx48.prol, align 2, !tbaa !18
  %conv49.prol = sext i16 %12 to i32
  %arrayidx51.prol = getelementptr inbounds i16, ptr %4, i32 %conv39
  %13 = load i16, ptr %arrayidx51.prol, align 2, !tbaa !18
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
  %14 = load i16, ptr %arrayidx48.prol.1, align 2, !tbaa !18
  %conv49.prol.1 = sext i16 %14 to i32
  %arrayidx51.prol.1 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol
  %15 = load i16, ptr %arrayidx51.prol.1, align 2, !tbaa !18
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
  %16 = load i16, ptr %arrayidx48.prol.2, align 2, !tbaa !18
  %conv49.prol.2 = sext i16 %16 to i32
  %arrayidx51.prol.2 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.1
  %17 = load i16, ptr %arrayidx51.prol.2, align 2, !tbaa !18
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
  %18 = load i16, ptr %arrayidx48.prol.3, align 2, !tbaa !18
  %conv49.prol.3 = sext i16 %18 to i32
  %arrayidx51.prol.3 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.2
  %19 = load i16, ptr %arrayidx51.prol.3, align 2, !tbaa !18
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
  %20 = load i16, ptr %arrayidx48.prol.4, align 2, !tbaa !18
  %conv49.prol.4 = sext i16 %20 to i32
  %arrayidx51.prol.4 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.3
  %21 = load i16, ptr %arrayidx51.prol.4, align 2, !tbaa !18
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
  %22 = load i16, ptr %arrayidx48.prol.5, align 2, !tbaa !18
  %conv49.prol.5 = sext i16 %22 to i32
  %arrayidx51.prol.5 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.4
  %23 = load i16, ptr %arrayidx51.prol.5, align 2, !tbaa !18
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
  %24 = load i16, ptr %arrayidx48.prol.6, align 2, !tbaa !18
  %conv49.prol.6 = sext i16 %24 to i32
  %arrayidx51.prol.6 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.5
  %25 = load i16, ptr %arrayidx51.prol.6, align 2, !tbaa !18
  %conv52.prol.6 = sext i16 %25 to i32
  %mul.prol.6 = mul nsw i32 %conv52.prol.6, %conv49.prol.6
  %conv53.prol.6 = sext i32 %mul.prol.6 to i64
  %add.prol.6 = add nsw i64 %add.prol.5, %conv53.prol.6
  %inc55.prol.6 = add nsw i32 %conv39, 7
  %coeff_pos.0.prol.6 = add i16 %3, -8
  %prol.iter.cmp.6 = icmp ne i32 7, %xtraiter
  br i1 %prol.iter.cmp.6, label %for.body46.prol.7, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.7:                                ; preds = %for.body46.prol.6
  %idxprom47.prol.7 = sext i16 %coeff_pos.0.prol.6 to i32
  %arrayidx48.prol.7 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.7
  %26 = load i16, ptr %arrayidx48.prol.7, align 2, !tbaa !18
  %conv49.prol.7 = sext i16 %26 to i32
  %arrayidx51.prol.7 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.6
  %27 = load i16, ptr %arrayidx51.prol.7, align 2, !tbaa !18
  %conv52.prol.7 = sext i16 %27 to i32
  %mul.prol.7 = mul nsw i32 %conv52.prol.7, %conv49.prol.7
  %conv53.prol.7 = sext i32 %mul.prol.7 to i64
  %add.prol.7 = add nsw i64 %add.prol.6, %conv53.prol.7
  %inc55.prol.7 = add nsw i32 %conv39, 8
  %coeff_pos.0.prol.7 = add i16 %3, -9
  %prol.iter.cmp.7 = icmp ne i32 8, %xtraiter
  br i1 %prol.iter.cmp.7, label %for.body46.prol.8, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.8:                                ; preds = %for.body46.prol.7
  %idxprom47.prol.8 = sext i16 %coeff_pos.0.prol.7 to i32
  %arrayidx48.prol.8 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.8
  %28 = load i16, ptr %arrayidx48.prol.8, align 2, !tbaa !18
  %conv49.prol.8 = sext i16 %28 to i32
  %arrayidx51.prol.8 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.7
  %29 = load i16, ptr %arrayidx51.prol.8, align 2, !tbaa !18
  %conv52.prol.8 = sext i16 %29 to i32
  %mul.prol.8 = mul nsw i32 %conv52.prol.8, %conv49.prol.8
  %conv53.prol.8 = sext i32 %mul.prol.8 to i64
  %add.prol.8 = add nsw i64 %add.prol.7, %conv53.prol.8
  %inc55.prol.8 = add nsw i32 %conv39, 9
  %coeff_pos.0.prol.8 = add i16 %3, -10
  %prol.iter.cmp.8 = icmp ne i32 9, %xtraiter
  br i1 %prol.iter.cmp.8, label %for.body46.prol.9, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.9:                                ; preds = %for.body46.prol.8
  %idxprom47.prol.9 = sext i16 %coeff_pos.0.prol.8 to i32
  %arrayidx48.prol.9 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.9
  %30 = load i16, ptr %arrayidx48.prol.9, align 2, !tbaa !18
  %conv49.prol.9 = sext i16 %30 to i32
  %arrayidx51.prol.9 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.8
  %31 = load i16, ptr %arrayidx51.prol.9, align 2, !tbaa !18
  %conv52.prol.9 = sext i16 %31 to i32
  %mul.prol.9 = mul nsw i32 %conv52.prol.9, %conv49.prol.9
  %conv53.prol.9 = sext i32 %mul.prol.9 to i64
  %add.prol.9 = add nsw i64 %add.prol.8, %conv53.prol.9
  %inc55.prol.9 = add nsw i32 %conv39, 10
  %coeff_pos.0.prol.9 = add i16 %3, -11
  %prol.iter.cmp.9 = icmp ne i32 10, %xtraiter
  br i1 %prol.iter.cmp.9, label %for.body46.prol.10, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.10:                               ; preds = %for.body46.prol.9
  %idxprom47.prol.10 = sext i16 %coeff_pos.0.prol.9 to i32
  %arrayidx48.prol.10 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.10
  %32 = load i16, ptr %arrayidx48.prol.10, align 2, !tbaa !18
  %conv49.prol.10 = sext i16 %32 to i32
  %arrayidx51.prol.10 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.9
  %33 = load i16, ptr %arrayidx51.prol.10, align 2, !tbaa !18
  %conv52.prol.10 = sext i16 %33 to i32
  %mul.prol.10 = mul nsw i32 %conv52.prol.10, %conv49.prol.10
  %conv53.prol.10 = sext i32 %mul.prol.10 to i64
  %add.prol.10 = add nsw i64 %add.prol.9, %conv53.prol.10
  %inc55.prol.10 = add nsw i32 %conv39, 11
  %coeff_pos.0.prol.10 = add i16 %3, -12
  %prol.iter.cmp.10 = icmp ne i32 11, %xtraiter
  br i1 %prol.iter.cmp.10, label %for.body46.prol.11, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.11:                               ; preds = %for.body46.prol.10
  %idxprom47.prol.11 = sext i16 %coeff_pos.0.prol.10 to i32
  %arrayidx48.prol.11 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.11
  %34 = load i16, ptr %arrayidx48.prol.11, align 2, !tbaa !18
  %conv49.prol.11 = sext i16 %34 to i32
  %arrayidx51.prol.11 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.10
  %35 = load i16, ptr %arrayidx51.prol.11, align 2, !tbaa !18
  %conv52.prol.11 = sext i16 %35 to i32
  %mul.prol.11 = mul nsw i32 %conv52.prol.11, %conv49.prol.11
  %conv53.prol.11 = sext i32 %mul.prol.11 to i64
  %add.prol.11 = add nsw i64 %add.prol.10, %conv53.prol.11
  %inc55.prol.11 = add nsw i32 %conv39, 12
  %coeff_pos.0.prol.11 = add i16 %3, -13
  %prol.iter.cmp.11 = icmp ne i32 12, %xtraiter
  br i1 %prol.iter.cmp.11, label %for.body46.prol.12, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.12:                               ; preds = %for.body46.prol.11
  %idxprom47.prol.12 = sext i16 %coeff_pos.0.prol.11 to i32
  %arrayidx48.prol.12 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.12
  %36 = load i16, ptr %arrayidx48.prol.12, align 2, !tbaa !18
  %conv49.prol.12 = sext i16 %36 to i32
  %arrayidx51.prol.12 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.11
  %37 = load i16, ptr %arrayidx51.prol.12, align 2, !tbaa !18
  %conv52.prol.12 = sext i16 %37 to i32
  %mul.prol.12 = mul nsw i32 %conv52.prol.12, %conv49.prol.12
  %conv53.prol.12 = sext i32 %mul.prol.12 to i64
  %add.prol.12 = add nsw i64 %add.prol.11, %conv53.prol.12
  %inc55.prol.12 = add nsw i32 %conv39, 13
  %coeff_pos.0.prol.12 = add i16 %3, -14
  %prol.iter.cmp.12 = icmp ne i32 13, %xtraiter
  br i1 %prol.iter.cmp.12, label %for.body46.prol.13, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.13:                               ; preds = %for.body46.prol.12
  %idxprom47.prol.13 = sext i16 %coeff_pos.0.prol.12 to i32
  %arrayidx48.prol.13 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.13
  %38 = load i16, ptr %arrayidx48.prol.13, align 2, !tbaa !18
  %conv49.prol.13 = sext i16 %38 to i32
  %arrayidx51.prol.13 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.12
  %39 = load i16, ptr %arrayidx51.prol.13, align 2, !tbaa !18
  %conv52.prol.13 = sext i16 %39 to i32
  %mul.prol.13 = mul nsw i32 %conv52.prol.13, %conv49.prol.13
  %conv53.prol.13 = sext i32 %mul.prol.13 to i64
  %add.prol.13 = add nsw i64 %add.prol.12, %conv53.prol.13
  %inc55.prol.13 = add nsw i32 %conv39, 14
  %coeff_pos.0.prol.13 = add i16 %3, -15
  %prol.iter.cmp.13 = icmp ne i32 14, %xtraiter
  br i1 %prol.iter.cmp.13, label %for.body46.prol.14, label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.14:                               ; preds = %for.body46.prol.13
  %idxprom47.prol.14 = sext i16 %coeff_pos.0.prol.13 to i32
  %arrayidx48.prol.14 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.prol.14
  %40 = load i16, ptr %arrayidx48.prol.14, align 2, !tbaa !18
  %conv49.prol.14 = sext i16 %40 to i32
  %arrayidx51.prol.14 = getelementptr inbounds i16, ptr %4, i32 %inc55.prol.13
  %41 = load i16, ptr %arrayidx51.prol.14, align 2, !tbaa !18
  %conv52.prol.14 = sext i16 %41 to i32
  %mul.prol.14 = mul nsw i32 %conv52.prol.14, %conv49.prol.14
  %conv53.prol.14 = sext i32 %mul.prol.14 to i64
  %add.prol.14 = add nsw i64 %add.prol.13, %conv53.prol.14
  %inc55.prol.14 = add nsw i32 %conv39, 15
  %coeff_pos.0.prol.14 = add i16 %3, -16
  br label %for.body46.prol.loopexit.unr-lcssa

for.body46.prol.loopexit.unr-lcssa:               ; preds = %for.body46.prol.14, %for.body46.prol.13, %for.body46.prol.12, %for.body46.prol.11, %for.body46.prol.10, %for.body46.prol.9, %for.body46.prol.8, %for.body46.prol.7, %for.body46.prol.6, %for.body46.prol.5, %for.body46.prol.4, %for.body46.prol.3, %for.body46.prol.2, %for.body46.prol.1, %for.body46.prol
  %add.lcssa.unr.ph = phi i64 [ %add.prol, %for.body46.prol ], [ %add.prol.1, %for.body46.prol.1 ], [ %add.prol.2, %for.body46.prol.2 ], [ %add.prol.3, %for.body46.prol.3 ], [ %add.prol.4, %for.body46.prol.4 ], [ %add.prol.5, %for.body46.prol.5 ], [ %add.prol.6, %for.body46.prol.6 ], [ %add.prol.7, %for.body46.prol.7 ], [ %add.prol.8, %for.body46.prol.8 ], [ %add.prol.9, %for.body46.prol.9 ], [ %add.prol.10, %for.body46.prol.10 ], [ %add.prol.11, %for.body46.prol.11 ], [ %add.prol.12, %for.body46.prol.12 ], [ %add.prol.13, %for.body46.prol.13 ], [ %add.prol.14, %for.body46.prol.14 ]
  %coeff_pos.0145.unr.ph = phi i16 [ %coeff_pos.0.prol, %for.body46.prol ], [ %coeff_pos.0.prol.1, %for.body46.prol.1 ], [ %coeff_pos.0.prol.2, %for.body46.prol.2 ], [ %coeff_pos.0.prol.3, %for.body46.prol.3 ], [ %coeff_pos.0.prol.4, %for.body46.prol.4 ], [ %coeff_pos.0.prol.5, %for.body46.prol.5 ], [ %coeff_pos.0.prol.6, %for.body46.prol.6 ], [ %coeff_pos.0.prol.7, %for.body46.prol.7 ], [ %coeff_pos.0.prol.8, %for.body46.prol.8 ], [ %coeff_pos.0.prol.9, %for.body46.prol.9 ], [ %coeff_pos.0.prol.10, %for.body46.prol.10 ], [ %coeff_pos.0.prol.11, %for.body46.prol.11 ], [ %coeff_pos.0.prol.12, %for.body46.prol.12 ], [ %coeff_pos.0.prol.13, %for.body46.prol.13 ], [ %coeff_pos.0.prol.14, %for.body46.prol.14 ]
  %n.0144.unr.ph = phi i32 [ %inc55.prol, %for.body46.prol ], [ %inc55.prol.1, %for.body46.prol.1 ], [ %inc55.prol.2, %for.body46.prol.2 ], [ %inc55.prol.3, %for.body46.prol.3 ], [ %inc55.prol.4, %for.body46.prol.4 ], [ %inc55.prol.5, %for.body46.prol.5 ], [ %inc55.prol.6, %for.body46.prol.6 ], [ %inc55.prol.7, %for.body46.prol.7 ], [ %inc55.prol.8, %for.body46.prol.8 ], [ %inc55.prol.9, %for.body46.prol.9 ], [ %inc55.prol.10, %for.body46.prol.10 ], [ %inc55.prol.11, %for.body46.prol.11 ], [ %inc55.prol.12, %for.body46.prol.12 ], [ %inc55.prol.13, %for.body46.prol.13 ], [ %inc55.prol.14, %for.body46.prol.14 ]
  %acc.0143.unr.ph = phi i64 [ %add.prol, %for.body46.prol ], [ %add.prol.1, %for.body46.prol.1 ], [ %add.prol.2, %for.body46.prol.2 ], [ %add.prol.3, %for.body46.prol.3 ], [ %add.prol.4, %for.body46.prol.4 ], [ %add.prol.5, %for.body46.prol.5 ], [ %add.prol.6, %for.body46.prol.6 ], [ %add.prol.7, %for.body46.prol.7 ], [ %add.prol.8, %for.body46.prol.8 ], [ %add.prol.9, %for.body46.prol.9 ], [ %add.prol.10, %for.body46.prol.10 ], [ %add.prol.11, %for.body46.prol.11 ], [ %add.prol.12, %for.body46.prol.12 ], [ %add.prol.13, %for.body46.prol.13 ], [ %add.prol.14, %for.body46.prol.14 ]
  br label %for.body46.prol.loopexit

for.body46.prol.loopexit:                         ; preds = %for.body46.prol.loopexit.unr-lcssa, %for.body46.lr.ph
  %add.lcssa.unr = phi i64 [ undef, %for.body46.lr.ph ], [ %add.lcssa.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %coeff_pos.0145.unr = phi i16 [ %coeff_pos.0141, %for.body46.lr.ph ], [ %coeff_pos.0145.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %n.0144.unr = phi i32 [ %conv39, %for.body46.lr.ph ], [ %n.0144.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %acc.0143.unr = phi i64 [ %rounding.0, %for.body46.lr.ph ], [ %acc.0143.unr.ph, %for.body46.prol.loopexit.unr-lcssa ]
  %42 = icmp ult i32 %11, 15
  br i1 %42, label %for.cond58.preheader.loopexit, label %for.body46.lr.ph.new

for.body46.lr.ph.new:                             ; preds = %for.body46.prol.loopexit
  br label %for.body46

for.body21:                                       ; preds = %if.end28, %for.body21.lr.ph
  %j.0140 = phi i32 [ 0, %for.body21.lr.ph ], [ %inc32, %if.end28 ]
  %input_pos.1139 = phi i32 [ %input_pos.0154, %for.body21.lr.ph ], [ %inc, %if.end28 ]
  %43 = load i16, ptr %pos, align 2, !tbaa !16
  %cmp24.not = icmp slt i16 %43, %3
  br i1 %cmp24.not, label %if.end28, label %if.then26

if.then26:                                        ; preds = %for.body21
  store i16 0, ptr %pos, align 2, !tbaa !16
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %for.body21
  %44 = phi i16 [ 0, %if.then26 ], [ %43, %for.body21 ]
  %inc = add nsw i32 %input_pos.1139, 1
  %arrayidx = getelementptr inbounds i16, ptr %input, i32 %input_pos.1139
  %45 = load i16, ptr %arrayidx, align 2, !tbaa !18
  %inc30 = add nsw i16 %44, 1
  store i16 %inc30, ptr %pos, align 2, !tbaa !16
  %idxprom = sext i16 %44 to i32
  %arrayidx31 = getelementptr inbounds i16, ptr %4, i32 %idxprom
  store i16 %45, ptr %arrayidx31, align 2, !tbaa !18
  %inc32 = add nuw nsw i32 %j.0140, 1
  %conv15 = sext i16 %2 to i32
  %46 = load i16, ptr %d_pos, align 2, !tbaa !15
  %conv16 = sext i16 %46 to i32
  %sub17 = sub nsw i32 %conv15, %conv16
  %cmp18 = icmp slt i32 %inc32, %sub17
  br i1 %cmp18, label %for.body21, label %for.cond.cleanup20.loopexit, !llvm.loop !19

for.cond58.preheader.loopexit.unr-lcssa:          ; preds = %for.body46
  %add.lcssa.ph = phi i64 [ %add.15, %for.body46 ]
  br label %for.cond58.preheader.loopexit

for.cond58.preheader.loopexit:                    ; preds = %for.body46.prol.loopexit, %for.cond58.preheader.loopexit.unr-lcssa
  %add.lcssa = phi i64 [ %add.lcssa.unr, %for.body46.prol.loopexit ], [ %add.lcssa.ph, %for.cond58.preheader.loopexit.unr-lcssa ]
  %47 = add i16 %8, -1
  br label %for.cond58.preheader

for.cond58.preheader:                             ; preds = %for.cond58.preheader.loopexit, %for.cond.cleanup20
  %acc.0.lcssa = phi i64 [ %rounding.0, %for.cond.cleanup20 ], [ %add.lcssa, %for.cond58.preheader.loopexit ]
  %coeff_pos.0.lcssa = phi i16 [ %coeff_pos.0141, %for.cond.cleanup20 ], [ %47, %for.cond58.preheader.loopexit ]
  %cmp61148 = icmp sgt i16 %8, 0
  br i1 %cmp61148, label %for.body64.lr.ph, label %for.cond.cleanup63

for.body64.lr.ph:                                 ; preds = %for.cond58.preheader
  %48 = load ptr, ptr %fir, align 4, !tbaa !17
  %49 = add nsw i32 %conv39, -1
  %xtraiter1 = and i32 %conv39, 15
  %50 = icmp ult i32 %49, 15
  br i1 %50, label %for.cond.cleanup63.loopexit.unr-lcssa, label %for.body64.lr.ph.new

for.body64.lr.ph.new:                             ; preds = %for.body64.lr.ph
  %unroll_iter = sub i32 %conv39, %xtraiter1
  br label %for.body64

for.body46:                                       ; preds = %for.body46, %for.body46.lr.ph.new
  %coeff_pos.0145 = phi i16 [ %coeff_pos.0145.unr, %for.body46.lr.ph.new ], [ %coeff_pos.0.15, %for.body46 ]
  %n.0144 = phi i32 [ %n.0144.unr, %for.body46.lr.ph.new ], [ %inc55.15, %for.body46 ]
  %acc.0143 = phi i64 [ %acc.0143.unr, %for.body46.lr.ph.new ], [ %add.15, %for.body46 ]
  %idxprom47 = sext i16 %coeff_pos.0145 to i32
  %arrayidx48 = getelementptr inbounds i16, ptr %9, i32 %idxprom47
  %51 = load i16, ptr %arrayidx48, align 2, !tbaa !18
  %conv49 = sext i16 %51 to i32
  %arrayidx51 = getelementptr inbounds i16, ptr %4, i32 %n.0144
  %52 = load i16, ptr %arrayidx51, align 2, !tbaa !18
  %conv52 = sext i16 %52 to i32
  %mul = mul nsw i32 %conv52, %conv49
  %conv53 = sext i32 %mul to i64
  %add = add nsw i64 %acc.0143, %conv53
  %inc55 = add nsw i32 %n.0144, 1
  %coeff_pos.0 = add i16 %coeff_pos.0145, -1
  %idxprom47.1 = sext i16 %coeff_pos.0 to i32
  %arrayidx48.1 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.1
  %53 = load i16, ptr %arrayidx48.1, align 2, !tbaa !18
  %conv49.1 = sext i16 %53 to i32
  %arrayidx51.1 = getelementptr inbounds i16, ptr %4, i32 %inc55
  %54 = load i16, ptr %arrayidx51.1, align 2, !tbaa !18
  %conv52.1 = sext i16 %54 to i32
  %mul.1 = mul nsw i32 %conv52.1, %conv49.1
  %conv53.1 = sext i32 %mul.1 to i64
  %add.1 = add nsw i64 %add, %conv53.1
  %inc55.1 = add nsw i32 %n.0144, 2
  %coeff_pos.0.1 = add i16 %coeff_pos.0145, -2
  %idxprom47.2 = sext i16 %coeff_pos.0.1 to i32
  %arrayidx48.2 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.2
  %55 = load i16, ptr %arrayidx48.2, align 2, !tbaa !18
  %conv49.2 = sext i16 %55 to i32
  %arrayidx51.2 = getelementptr inbounds i16, ptr %4, i32 %inc55.1
  %56 = load i16, ptr %arrayidx51.2, align 2, !tbaa !18
  %conv52.2 = sext i16 %56 to i32
  %mul.2 = mul nsw i32 %conv52.2, %conv49.2
  %conv53.2 = sext i32 %mul.2 to i64
  %add.2 = add nsw i64 %add.1, %conv53.2
  %inc55.2 = add nsw i32 %n.0144, 3
  %coeff_pos.0.2 = add i16 %coeff_pos.0145, -3
  %idxprom47.3 = sext i16 %coeff_pos.0.2 to i32
  %arrayidx48.3 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.3
  %57 = load i16, ptr %arrayidx48.3, align 2, !tbaa !18
  %conv49.3 = sext i16 %57 to i32
  %arrayidx51.3 = getelementptr inbounds i16, ptr %4, i32 %inc55.2
  %58 = load i16, ptr %arrayidx51.3, align 2, !tbaa !18
  %conv52.3 = sext i16 %58 to i32
  %mul.3 = mul nsw i32 %conv52.3, %conv49.3
  %conv53.3 = sext i32 %mul.3 to i64
  %add.3 = add nsw i64 %add.2, %conv53.3
  %inc55.3 = add nsw i32 %n.0144, 4
  %coeff_pos.0.3 = add i16 %coeff_pos.0145, -4
  %idxprom47.4 = sext i16 %coeff_pos.0.3 to i32
  %arrayidx48.4 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.4
  %59 = load i16, ptr %arrayidx48.4, align 2, !tbaa !18
  %conv49.4 = sext i16 %59 to i32
  %arrayidx51.4 = getelementptr inbounds i16, ptr %4, i32 %inc55.3
  %60 = load i16, ptr %arrayidx51.4, align 2, !tbaa !18
  %conv52.4 = sext i16 %60 to i32
  %mul.4 = mul nsw i32 %conv52.4, %conv49.4
  %conv53.4 = sext i32 %mul.4 to i64
  %add.4 = add nsw i64 %add.3, %conv53.4
  %inc55.4 = add nsw i32 %n.0144, 5
  %coeff_pos.0.4 = add i16 %coeff_pos.0145, -5
  %idxprom47.5 = sext i16 %coeff_pos.0.4 to i32
  %arrayidx48.5 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.5
  %61 = load i16, ptr %arrayidx48.5, align 2, !tbaa !18
  %conv49.5 = sext i16 %61 to i32
  %arrayidx51.5 = getelementptr inbounds i16, ptr %4, i32 %inc55.4
  %62 = load i16, ptr %arrayidx51.5, align 2, !tbaa !18
  %conv52.5 = sext i16 %62 to i32
  %mul.5 = mul nsw i32 %conv52.5, %conv49.5
  %conv53.5 = sext i32 %mul.5 to i64
  %add.5 = add nsw i64 %add.4, %conv53.5
  %inc55.5 = add nsw i32 %n.0144, 6
  %coeff_pos.0.5 = add i16 %coeff_pos.0145, -6
  %idxprom47.6 = sext i16 %coeff_pos.0.5 to i32
  %arrayidx48.6 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.6
  %63 = load i16, ptr %arrayidx48.6, align 2, !tbaa !18
  %conv49.6 = sext i16 %63 to i32
  %arrayidx51.6 = getelementptr inbounds i16, ptr %4, i32 %inc55.5
  %64 = load i16, ptr %arrayidx51.6, align 2, !tbaa !18
  %conv52.6 = sext i16 %64 to i32
  %mul.6 = mul nsw i32 %conv52.6, %conv49.6
  %conv53.6 = sext i32 %mul.6 to i64
  %add.6 = add nsw i64 %add.5, %conv53.6
  %inc55.6 = add nsw i32 %n.0144, 7
  %coeff_pos.0.6 = add i16 %coeff_pos.0145, -7
  %idxprom47.7 = sext i16 %coeff_pos.0.6 to i32
  %arrayidx48.7 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.7
  %65 = load i16, ptr %arrayidx48.7, align 2, !tbaa !18
  %conv49.7 = sext i16 %65 to i32
  %arrayidx51.7 = getelementptr inbounds i16, ptr %4, i32 %inc55.6
  %66 = load i16, ptr %arrayidx51.7, align 2, !tbaa !18
  %conv52.7 = sext i16 %66 to i32
  %mul.7 = mul nsw i32 %conv52.7, %conv49.7
  %conv53.7 = sext i32 %mul.7 to i64
  %add.7 = add nsw i64 %add.6, %conv53.7
  %inc55.7 = add nsw i32 %n.0144, 8
  %coeff_pos.0.7 = add i16 %coeff_pos.0145, -8
  %idxprom47.8 = sext i16 %coeff_pos.0.7 to i32
  %arrayidx48.8 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.8
  %67 = load i16, ptr %arrayidx48.8, align 2, !tbaa !18
  %conv49.8 = sext i16 %67 to i32
  %arrayidx51.8 = getelementptr inbounds i16, ptr %4, i32 %inc55.7
  %68 = load i16, ptr %arrayidx51.8, align 2, !tbaa !18
  %conv52.8 = sext i16 %68 to i32
  %mul.8 = mul nsw i32 %conv52.8, %conv49.8
  %conv53.8 = sext i32 %mul.8 to i64
  %add.8 = add nsw i64 %add.7, %conv53.8
  %inc55.8 = add nsw i32 %n.0144, 9
  %coeff_pos.0.8 = add i16 %coeff_pos.0145, -9
  %idxprom47.9 = sext i16 %coeff_pos.0.8 to i32
  %arrayidx48.9 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.9
  %69 = load i16, ptr %arrayidx48.9, align 2, !tbaa !18
  %conv49.9 = sext i16 %69 to i32
  %arrayidx51.9 = getelementptr inbounds i16, ptr %4, i32 %inc55.8
  %70 = load i16, ptr %arrayidx51.9, align 2, !tbaa !18
  %conv52.9 = sext i16 %70 to i32
  %mul.9 = mul nsw i32 %conv52.9, %conv49.9
  %conv53.9 = sext i32 %mul.9 to i64
  %add.9 = add nsw i64 %add.8, %conv53.9
  %inc55.9 = add nsw i32 %n.0144, 10
  %coeff_pos.0.9 = add i16 %coeff_pos.0145, -10
  %idxprom47.10 = sext i16 %coeff_pos.0.9 to i32
  %arrayidx48.10 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.10
  %71 = load i16, ptr %arrayidx48.10, align 2, !tbaa !18
  %conv49.10 = sext i16 %71 to i32
  %arrayidx51.10 = getelementptr inbounds i16, ptr %4, i32 %inc55.9
  %72 = load i16, ptr %arrayidx51.10, align 2, !tbaa !18
  %conv52.10 = sext i16 %72 to i32
  %mul.10 = mul nsw i32 %conv52.10, %conv49.10
  %conv53.10 = sext i32 %mul.10 to i64
  %add.10 = add nsw i64 %add.9, %conv53.10
  %inc55.10 = add nsw i32 %n.0144, 11
  %coeff_pos.0.10 = add i16 %coeff_pos.0145, -11
  %idxprom47.11 = sext i16 %coeff_pos.0.10 to i32
  %arrayidx48.11 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.11
  %73 = load i16, ptr %arrayidx48.11, align 2, !tbaa !18
  %conv49.11 = sext i16 %73 to i32
  %arrayidx51.11 = getelementptr inbounds i16, ptr %4, i32 %inc55.10
  %74 = load i16, ptr %arrayidx51.11, align 2, !tbaa !18
  %conv52.11 = sext i16 %74 to i32
  %mul.11 = mul nsw i32 %conv52.11, %conv49.11
  %conv53.11 = sext i32 %mul.11 to i64
  %add.11 = add nsw i64 %add.10, %conv53.11
  %inc55.11 = add nsw i32 %n.0144, 12
  %coeff_pos.0.11 = add i16 %coeff_pos.0145, -12
  %idxprom47.12 = sext i16 %coeff_pos.0.11 to i32
  %arrayidx48.12 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.12
  %75 = load i16, ptr %arrayidx48.12, align 2, !tbaa !18
  %conv49.12 = sext i16 %75 to i32
  %arrayidx51.12 = getelementptr inbounds i16, ptr %4, i32 %inc55.11
  %76 = load i16, ptr %arrayidx51.12, align 2, !tbaa !18
  %conv52.12 = sext i16 %76 to i32
  %mul.12 = mul nsw i32 %conv52.12, %conv49.12
  %conv53.12 = sext i32 %mul.12 to i64
  %add.12 = add nsw i64 %add.11, %conv53.12
  %inc55.12 = add nsw i32 %n.0144, 13
  %coeff_pos.0.12 = add i16 %coeff_pos.0145, -13
  %idxprom47.13 = sext i16 %coeff_pos.0.12 to i32
  %arrayidx48.13 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.13
  %77 = load i16, ptr %arrayidx48.13, align 2, !tbaa !18
  %conv49.13 = sext i16 %77 to i32
  %arrayidx51.13 = getelementptr inbounds i16, ptr %4, i32 %inc55.12
  %78 = load i16, ptr %arrayidx51.13, align 2, !tbaa !18
  %conv52.13 = sext i16 %78 to i32
  %mul.13 = mul nsw i32 %conv52.13, %conv49.13
  %conv53.13 = sext i32 %mul.13 to i64
  %add.13 = add nsw i64 %add.12, %conv53.13
  %inc55.13 = add nsw i32 %n.0144, 14
  %coeff_pos.0.13 = add i16 %coeff_pos.0145, -14
  %idxprom47.14 = sext i16 %coeff_pos.0.13 to i32
  %arrayidx48.14 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.14
  %79 = load i16, ptr %arrayidx48.14, align 2, !tbaa !18
  %conv49.14 = sext i16 %79 to i32
  %arrayidx51.14 = getelementptr inbounds i16, ptr %4, i32 %inc55.13
  %80 = load i16, ptr %arrayidx51.14, align 2, !tbaa !18
  %conv52.14 = sext i16 %80 to i32
  %mul.14 = mul nsw i32 %conv52.14, %conv49.14
  %conv53.14 = sext i32 %mul.14 to i64
  %add.14 = add nsw i64 %add.13, %conv53.14
  %inc55.14 = add nsw i32 %n.0144, 15
  %coeff_pos.0.14 = add i16 %coeff_pos.0145, -15
  %idxprom47.15 = sext i16 %coeff_pos.0.14 to i32
  %arrayidx48.15 = getelementptr inbounds i16, ptr %9, i32 %idxprom47.15
  %81 = load i16, ptr %arrayidx48.15, align 2, !tbaa !18
  %conv49.15 = sext i16 %81 to i32
  %arrayidx51.15 = getelementptr inbounds i16, ptr %4, i32 %inc55.14
  %82 = load i16, ptr %arrayidx51.15, align 2, !tbaa !18
  %conv52.15 = sext i16 %82 to i32
  %mul.15 = mul nsw i32 %conv52.15, %conv49.15
  %conv53.15 = sext i32 %mul.15 to i64
  %add.15 = add nsw i64 %add.14, %conv53.15
  %inc55.15 = add nsw i32 %n.0144, 16
  %coeff_pos.0.15 = add i16 %coeff_pos.0145, -16
  %exitcond.not.15 = icmp eq i32 %inc55.15, %conv42
  br i1 %exitcond.not.15, label %for.cond58.preheader.loopexit.unr-lcssa, label %for.body46, !llvm.loop !21

for.cond.cleanup63.loopexit.unr-lcssa.loopexit:   ; preds = %for.body64
  %add75.lcssa.ph.ph = phi i64 [ %add75.15, %for.body64 ]
  %n57.0151.unr.ph = phi i32 [ %inc77.15, %for.body64 ]
  %coeff_pos.1150.unr.ph = phi i16 [ %dec66.15, %for.body64 ]
  %acc.1149.unr.ph = phi i64 [ %add75.15, %for.body64 ]
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
  %arrayidx68.epil = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil
  %83 = load i16, ptr %arrayidx68.epil, align 2, !tbaa !18
  %conv69.epil = sext i16 %83 to i32
  %arrayidx71.epil = getelementptr inbounds i16, ptr %4, i32 %n57.0151.unr
  %84 = load i16, ptr %arrayidx71.epil, align 2, !tbaa !18
  %conv72.epil = sext i16 %84 to i32
  %mul73.epil = mul nsw i32 %conv72.epil, %conv69.epil
  %conv74.epil = sext i32 %mul73.epil to i64
  %add75.epil = add nsw i64 %acc.1149.unr, %conv74.epil
  %inc77.epil = add nuw nsw i32 %n57.0151.unr, 1
  %epil.iter.cmp = icmp ne i32 1, %xtraiter1
  br i1 %epil.iter.cmp, label %for.body64.epil.1, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.1:                                ; preds = %for.body64.epil
  %dec66.epil.1 = add i16 %coeff_pos.1150.unr, -2
  %idxprom67.epil.1 = sext i16 %dec66.epil to i32
  %arrayidx68.epil.1 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.1
  %85 = load i16, ptr %arrayidx68.epil.1, align 2, !tbaa !18
  %conv69.epil.1 = sext i16 %85 to i32
  %arrayidx71.epil.1 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil
  %86 = load i16, ptr %arrayidx71.epil.1, align 2, !tbaa !18
  %conv72.epil.1 = sext i16 %86 to i32
  %mul73.epil.1 = mul nsw i32 %conv72.epil.1, %conv69.epil.1
  %conv74.epil.1 = sext i32 %mul73.epil.1 to i64
  %add75.epil.1 = add nsw i64 %add75.epil, %conv74.epil.1
  %inc77.epil.1 = add nuw nsw i32 %n57.0151.unr, 2
  %epil.iter.cmp.1 = icmp ne i32 2, %xtraiter1
  br i1 %epil.iter.cmp.1, label %for.body64.epil.2, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.2:                                ; preds = %for.body64.epil.1
  %dec66.epil.2 = add i16 %coeff_pos.1150.unr, -3
  %idxprom67.epil.2 = sext i16 %dec66.epil.1 to i32
  %arrayidx68.epil.2 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.2
  %87 = load i16, ptr %arrayidx68.epil.2, align 2, !tbaa !18
  %conv69.epil.2 = sext i16 %87 to i32
  %arrayidx71.epil.2 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.1
  %88 = load i16, ptr %arrayidx71.epil.2, align 2, !tbaa !18
  %conv72.epil.2 = sext i16 %88 to i32
  %mul73.epil.2 = mul nsw i32 %conv72.epil.2, %conv69.epil.2
  %conv74.epil.2 = sext i32 %mul73.epil.2 to i64
  %add75.epil.2 = add nsw i64 %add75.epil.1, %conv74.epil.2
  %inc77.epil.2 = add nuw nsw i32 %n57.0151.unr, 3
  %epil.iter.cmp.2 = icmp ne i32 3, %xtraiter1
  br i1 %epil.iter.cmp.2, label %for.body64.epil.3, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.3:                                ; preds = %for.body64.epil.2
  %dec66.epil.3 = add i16 %coeff_pos.1150.unr, -4
  %idxprom67.epil.3 = sext i16 %dec66.epil.2 to i32
  %arrayidx68.epil.3 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.3
  %89 = load i16, ptr %arrayidx68.epil.3, align 2, !tbaa !18
  %conv69.epil.3 = sext i16 %89 to i32
  %arrayidx71.epil.3 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.2
  %90 = load i16, ptr %arrayidx71.epil.3, align 2, !tbaa !18
  %conv72.epil.3 = sext i16 %90 to i32
  %mul73.epil.3 = mul nsw i32 %conv72.epil.3, %conv69.epil.3
  %conv74.epil.3 = sext i32 %mul73.epil.3 to i64
  %add75.epil.3 = add nsw i64 %add75.epil.2, %conv74.epil.3
  %inc77.epil.3 = add nuw nsw i32 %n57.0151.unr, 4
  %epil.iter.cmp.3 = icmp ne i32 4, %xtraiter1
  br i1 %epil.iter.cmp.3, label %for.body64.epil.4, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.4:                                ; preds = %for.body64.epil.3
  %dec66.epil.4 = add i16 %coeff_pos.1150.unr, -5
  %idxprom67.epil.4 = sext i16 %dec66.epil.3 to i32
  %arrayidx68.epil.4 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.4
  %91 = load i16, ptr %arrayidx68.epil.4, align 2, !tbaa !18
  %conv69.epil.4 = sext i16 %91 to i32
  %arrayidx71.epil.4 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.3
  %92 = load i16, ptr %arrayidx71.epil.4, align 2, !tbaa !18
  %conv72.epil.4 = sext i16 %92 to i32
  %mul73.epil.4 = mul nsw i32 %conv72.epil.4, %conv69.epil.4
  %conv74.epil.4 = sext i32 %mul73.epil.4 to i64
  %add75.epil.4 = add nsw i64 %add75.epil.3, %conv74.epil.4
  %inc77.epil.4 = add nuw nsw i32 %n57.0151.unr, 5
  %epil.iter.cmp.4 = icmp ne i32 5, %xtraiter1
  br i1 %epil.iter.cmp.4, label %for.body64.epil.5, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.5:                                ; preds = %for.body64.epil.4
  %dec66.epil.5 = add i16 %coeff_pos.1150.unr, -6
  %idxprom67.epil.5 = sext i16 %dec66.epil.4 to i32
  %arrayidx68.epil.5 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.5
  %93 = load i16, ptr %arrayidx68.epil.5, align 2, !tbaa !18
  %conv69.epil.5 = sext i16 %93 to i32
  %arrayidx71.epil.5 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.4
  %94 = load i16, ptr %arrayidx71.epil.5, align 2, !tbaa !18
  %conv72.epil.5 = sext i16 %94 to i32
  %mul73.epil.5 = mul nsw i32 %conv72.epil.5, %conv69.epil.5
  %conv74.epil.5 = sext i32 %mul73.epil.5 to i64
  %add75.epil.5 = add nsw i64 %add75.epil.4, %conv74.epil.5
  %inc77.epil.5 = add nuw nsw i32 %n57.0151.unr, 6
  %epil.iter.cmp.5 = icmp ne i32 6, %xtraiter1
  br i1 %epil.iter.cmp.5, label %for.body64.epil.6, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.6:                                ; preds = %for.body64.epil.5
  %dec66.epil.6 = add i16 %coeff_pos.1150.unr, -7
  %idxprom67.epil.6 = sext i16 %dec66.epil.5 to i32
  %arrayidx68.epil.6 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.6
  %95 = load i16, ptr %arrayidx68.epil.6, align 2, !tbaa !18
  %conv69.epil.6 = sext i16 %95 to i32
  %arrayidx71.epil.6 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.5
  %96 = load i16, ptr %arrayidx71.epil.6, align 2, !tbaa !18
  %conv72.epil.6 = sext i16 %96 to i32
  %mul73.epil.6 = mul nsw i32 %conv72.epil.6, %conv69.epil.6
  %conv74.epil.6 = sext i32 %mul73.epil.6 to i64
  %add75.epil.6 = add nsw i64 %add75.epil.5, %conv74.epil.6
  %inc77.epil.6 = add nuw nsw i32 %n57.0151.unr, 7
  %epil.iter.cmp.6 = icmp ne i32 7, %xtraiter1
  br i1 %epil.iter.cmp.6, label %for.body64.epil.7, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.7:                                ; preds = %for.body64.epil.6
  %dec66.epil.7 = add i16 %coeff_pos.1150.unr, -8
  %idxprom67.epil.7 = sext i16 %dec66.epil.6 to i32
  %arrayidx68.epil.7 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.7
  %97 = load i16, ptr %arrayidx68.epil.7, align 2, !tbaa !18
  %conv69.epil.7 = sext i16 %97 to i32
  %arrayidx71.epil.7 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.6
  %98 = load i16, ptr %arrayidx71.epil.7, align 2, !tbaa !18
  %conv72.epil.7 = sext i16 %98 to i32
  %mul73.epil.7 = mul nsw i32 %conv72.epil.7, %conv69.epil.7
  %conv74.epil.7 = sext i32 %mul73.epil.7 to i64
  %add75.epil.7 = add nsw i64 %add75.epil.6, %conv74.epil.7
  %inc77.epil.7 = add nuw nsw i32 %n57.0151.unr, 8
  %epil.iter.cmp.7 = icmp ne i32 8, %xtraiter1
  br i1 %epil.iter.cmp.7, label %for.body64.epil.8, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.8:                                ; preds = %for.body64.epil.7
  %dec66.epil.8 = add i16 %coeff_pos.1150.unr, -9
  %idxprom67.epil.8 = sext i16 %dec66.epil.7 to i32
  %arrayidx68.epil.8 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.8
  %99 = load i16, ptr %arrayidx68.epil.8, align 2, !tbaa !18
  %conv69.epil.8 = sext i16 %99 to i32
  %arrayidx71.epil.8 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.7
  %100 = load i16, ptr %arrayidx71.epil.8, align 2, !tbaa !18
  %conv72.epil.8 = sext i16 %100 to i32
  %mul73.epil.8 = mul nsw i32 %conv72.epil.8, %conv69.epil.8
  %conv74.epil.8 = sext i32 %mul73.epil.8 to i64
  %add75.epil.8 = add nsw i64 %add75.epil.7, %conv74.epil.8
  %inc77.epil.8 = add nuw nsw i32 %n57.0151.unr, 9
  %epil.iter.cmp.8 = icmp ne i32 9, %xtraiter1
  br i1 %epil.iter.cmp.8, label %for.body64.epil.9, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.9:                                ; preds = %for.body64.epil.8
  %dec66.epil.9 = add i16 %coeff_pos.1150.unr, -10
  %idxprom67.epil.9 = sext i16 %dec66.epil.8 to i32
  %arrayidx68.epil.9 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.9
  %101 = load i16, ptr %arrayidx68.epil.9, align 2, !tbaa !18
  %conv69.epil.9 = sext i16 %101 to i32
  %arrayidx71.epil.9 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.8
  %102 = load i16, ptr %arrayidx71.epil.9, align 2, !tbaa !18
  %conv72.epil.9 = sext i16 %102 to i32
  %mul73.epil.9 = mul nsw i32 %conv72.epil.9, %conv69.epil.9
  %conv74.epil.9 = sext i32 %mul73.epil.9 to i64
  %add75.epil.9 = add nsw i64 %add75.epil.8, %conv74.epil.9
  %inc77.epil.9 = add nuw nsw i32 %n57.0151.unr, 10
  %epil.iter.cmp.9 = icmp ne i32 10, %xtraiter1
  br i1 %epil.iter.cmp.9, label %for.body64.epil.10, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.10:                               ; preds = %for.body64.epil.9
  %dec66.epil.10 = add i16 %coeff_pos.1150.unr, -11
  %idxprom67.epil.10 = sext i16 %dec66.epil.9 to i32
  %arrayidx68.epil.10 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.10
  %103 = load i16, ptr %arrayidx68.epil.10, align 2, !tbaa !18
  %conv69.epil.10 = sext i16 %103 to i32
  %arrayidx71.epil.10 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.9
  %104 = load i16, ptr %arrayidx71.epil.10, align 2, !tbaa !18
  %conv72.epil.10 = sext i16 %104 to i32
  %mul73.epil.10 = mul nsw i32 %conv72.epil.10, %conv69.epil.10
  %conv74.epil.10 = sext i32 %mul73.epil.10 to i64
  %add75.epil.10 = add nsw i64 %add75.epil.9, %conv74.epil.10
  %inc77.epil.10 = add nuw nsw i32 %n57.0151.unr, 11
  %epil.iter.cmp.10 = icmp ne i32 11, %xtraiter1
  br i1 %epil.iter.cmp.10, label %for.body64.epil.11, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.11:                               ; preds = %for.body64.epil.10
  %dec66.epil.11 = add i16 %coeff_pos.1150.unr, -12
  %idxprom67.epil.11 = sext i16 %dec66.epil.10 to i32
  %arrayidx68.epil.11 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.11
  %105 = load i16, ptr %arrayidx68.epil.11, align 2, !tbaa !18
  %conv69.epil.11 = sext i16 %105 to i32
  %arrayidx71.epil.11 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.10
  %106 = load i16, ptr %arrayidx71.epil.11, align 2, !tbaa !18
  %conv72.epil.11 = sext i16 %106 to i32
  %mul73.epil.11 = mul nsw i32 %conv72.epil.11, %conv69.epil.11
  %conv74.epil.11 = sext i32 %mul73.epil.11 to i64
  %add75.epil.11 = add nsw i64 %add75.epil.10, %conv74.epil.11
  %inc77.epil.11 = add nuw nsw i32 %n57.0151.unr, 12
  %epil.iter.cmp.11 = icmp ne i32 12, %xtraiter1
  br i1 %epil.iter.cmp.11, label %for.body64.epil.12, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.12:                               ; preds = %for.body64.epil.11
  %dec66.epil.12 = add i16 %coeff_pos.1150.unr, -13
  %idxprom67.epil.12 = sext i16 %dec66.epil.11 to i32
  %arrayidx68.epil.12 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.12
  %107 = load i16, ptr %arrayidx68.epil.12, align 2, !tbaa !18
  %conv69.epil.12 = sext i16 %107 to i32
  %arrayidx71.epil.12 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.11
  %108 = load i16, ptr %arrayidx71.epil.12, align 2, !tbaa !18
  %conv72.epil.12 = sext i16 %108 to i32
  %mul73.epil.12 = mul nsw i32 %conv72.epil.12, %conv69.epil.12
  %conv74.epil.12 = sext i32 %mul73.epil.12 to i64
  %add75.epil.12 = add nsw i64 %add75.epil.11, %conv74.epil.12
  %inc77.epil.12 = add nuw nsw i32 %n57.0151.unr, 13
  %epil.iter.cmp.12 = icmp ne i32 13, %xtraiter1
  br i1 %epil.iter.cmp.12, label %for.body64.epil.13, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.13:                               ; preds = %for.body64.epil.12
  %dec66.epil.13 = add i16 %coeff_pos.1150.unr, -14
  %idxprom67.epil.13 = sext i16 %dec66.epil.12 to i32
  %arrayidx68.epil.13 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.13
  %109 = load i16, ptr %arrayidx68.epil.13, align 2, !tbaa !18
  %conv69.epil.13 = sext i16 %109 to i32
  %arrayidx71.epil.13 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.12
  %110 = load i16, ptr %arrayidx71.epil.13, align 2, !tbaa !18
  %conv72.epil.13 = sext i16 %110 to i32
  %mul73.epil.13 = mul nsw i32 %conv72.epil.13, %conv69.epil.13
  %conv74.epil.13 = sext i32 %mul73.epil.13 to i64
  %add75.epil.13 = add nsw i64 %add75.epil.12, %conv74.epil.13
  %inc77.epil.13 = add nuw nsw i32 %n57.0151.unr, 14
  %epil.iter.cmp.13 = icmp ne i32 14, %xtraiter1
  br i1 %epil.iter.cmp.13, label %for.body64.epil.14, label %for.cond.cleanup63.loopexit.epilog-lcssa

for.body64.epil.14:                               ; preds = %for.body64.epil.13
  %idxprom67.epil.14 = sext i16 %dec66.epil.13 to i32
  %arrayidx68.epil.14 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.epil.14
  %111 = load i16, ptr %arrayidx68.epil.14, align 2, !tbaa !18
  %conv69.epil.14 = sext i16 %111 to i32
  %arrayidx71.epil.14 = getelementptr inbounds i16, ptr %4, i32 %inc77.epil.13
  %112 = load i16, ptr %arrayidx71.epil.14, align 2, !tbaa !18
  %conv72.epil.14 = sext i16 %112 to i32
  %mul73.epil.14 = mul nsw i32 %conv72.epil.14, %conv69.epil.14
  %conv74.epil.14 = sext i32 %mul73.epil.14 to i64
  %add75.epil.14 = add nsw i64 %add75.epil.13, %conv74.epil.14
  br label %for.cond.cleanup63.loopexit.epilog-lcssa

for.cond.cleanup63.loopexit.epilog-lcssa:         ; preds = %for.body64.epil.14, %for.body64.epil.13, %for.body64.epil.12, %for.body64.epil.11, %for.body64.epil.10, %for.body64.epil.9, %for.body64.epil.8, %for.body64.epil.7, %for.body64.epil.6, %for.body64.epil.5, %for.body64.epil.4, %for.body64.epil.3, %for.body64.epil.2, %for.body64.epil.1, %for.body64.epil
  %add75.lcssa.ph3 = phi i64 [ %add75.epil, %for.body64.epil ], [ %add75.epil.1, %for.body64.epil.1 ], [ %add75.epil.2, %for.body64.epil.2 ], [ %add75.epil.3, %for.body64.epil.3 ], [ %add75.epil.4, %for.body64.epil.4 ], [ %add75.epil.5, %for.body64.epil.5 ], [ %add75.epil.6, %for.body64.epil.6 ], [ %add75.epil.7, %for.body64.epil.7 ], [ %add75.epil.8, %for.body64.epil.8 ], [ %add75.epil.9, %for.body64.epil.9 ], [ %add75.epil.10, %for.body64.epil.10 ], [ %add75.epil.11, %for.body64.epil.11 ], [ %add75.epil.12, %for.body64.epil.12 ], [ %add75.epil.13, %for.body64.epil.13 ], [ %add75.epil.14, %for.body64.epil.14 ]
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
  %113 = getelementptr inbounds i16, ptr %output, i32 %i.0156
  store i16 %conv91, ptr %113, align 2
  %inc96 = add nuw nsw i32 %i.0156, 1
  %exitcond160.not = icmp eq i32 %inc96, %len
  br i1 %exitcond160.not, label %for.cond.cleanup.loopexit, label %for.cond14.preheader, !llvm.loop !22

for.body64:                                       ; preds = %for.body64, %for.body64.lr.ph.new
  %n57.0151 = phi i32 [ 0, %for.body64.lr.ph.new ], [ %inc77.15, %for.body64 ]
  %coeff_pos.1150 = phi i16 [ %coeff_pos.0.lcssa, %for.body64.lr.ph.new ], [ %dec66.15, %for.body64 ]
  %acc.1149 = phi i64 [ %acc.0.lcssa, %for.body64.lr.ph.new ], [ %add75.15, %for.body64 ]
  %niter = phi i32 [ 0, %for.body64.lr.ph.new ], [ %niter.next.15, %for.body64 ]
  %dec66 = add i16 %coeff_pos.1150, -1
  %dec66.1 = add i16 %coeff_pos.1150, -2
  %dec66.2 = add i16 %coeff_pos.1150, -3
  %dec66.3 = add i16 %coeff_pos.1150, -4
  %dec66.4 = add i16 %coeff_pos.1150, -5
  %dec66.5 = add i16 %coeff_pos.1150, -6
  %dec66.6 = add i16 %coeff_pos.1150, -7
  %dec66.7 = add i16 %coeff_pos.1150, -8
  %dec66.8 = add i16 %coeff_pos.1150, -9
  %dec66.9 = add i16 %coeff_pos.1150, -10
  %dec66.10 = add i16 %coeff_pos.1150, -11
  %dec66.11 = add i16 %coeff_pos.1150, -12
  %dec66.12 = add i16 %coeff_pos.1150, -13
  %dec66.13 = add i16 %coeff_pos.1150, -14
  %dec66.14 = add i16 %coeff_pos.1150, -15
  %dec66.15 = add i16 %coeff_pos.1150, -16

  %inc77 = add nuw nsw i32 %n57.0151, 1
  %inc77.1 = add nuw nsw i32 %n57.0151, 2
  %inc77.2 = add nuw nsw i32 %n57.0151, 3
  %inc77.3 = add nuw nsw i32 %n57.0151, 4
  %inc77.4 = add nuw nsw i32 %n57.0151, 5
  %inc77.5 = add nuw nsw i32 %n57.0151, 6
  %inc77.6 = add nuw nsw i32 %n57.0151, 7
  %inc77.7 = add nuw nsw i32 %n57.0151, 8
  %inc77.8 = add nuw nsw i32 %n57.0151, 9
  %inc77.9 = add nuw nsw i32 %n57.0151, 10
  %inc77.10 = add nuw nsw i32 %n57.0151, 11
  %inc77.11 = add nuw nsw i32 %n57.0151, 12
  %inc77.12 = add nuw nsw i32 %n57.0151, 13
  %inc77.13 = add nuw nsw i32 %n57.0151, 14
  %inc77.14 = add nuw nsw i32 %n57.0151, 15
  %inc77.15 = add nuw nsw i32 %n57.0151, 16

  %idxprom67 = sext i16 %coeff_pos.1150 to i32
  %idxprom67.1 = sext i16 %dec66 to i32
  %idxprom67.2 = sext i16 %dec66.1 to i32
  %idxprom67.3 = sext i16 %dec66.2 to i32
  %idxprom67.4 = sext i16 %dec66.3 to i32
  %idxprom67.5 = sext i16 %dec66.4 to i32
  %idxprom67.6 = sext i16 %dec66.5 to i32
  %idxprom67.7 = sext i16 %dec66.6 to i32
  %idxprom67.8 = sext i16 %dec66.7 to i32
  %idxprom67.9 = sext i16 %dec66.8 to i32
  %idxprom67.10 = sext i16 %dec66.9 to i32
  %idxprom67.11 = sext i16 %dec66.10 to i32
  %idxprom67.12 = sext i16 %dec66.11 to i32
  %idxprom67.13 = sext i16 %dec66.12 to i32
  %idxprom67.14 = sext i16 %dec66.13 to i32
  %idxprom67.15 = sext i16 %dec66.14 to i32

  %arrayidx68 = getelementptr inbounds i16, ptr %48, i32 %idxprom67
  %arrayidx68.1 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.1
  %arrayidx68.2 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.2
  %arrayidx68.3 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.3
  %arrayidx68.4 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.4
  %arrayidx68.5 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.5
  %arrayidx68.6 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.6
  %arrayidx68.7 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.7
  %arrayidx68.8 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.8
  %arrayidx68.9 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.9
  %arrayidx68.10 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.10
  %arrayidx68.11 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.11
  %arrayidx68.12 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.12
  %arrayidx68.13 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.13
  %arrayidx68.14 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.14
  %arrayidx68.15 = getelementptr inbounds i16, ptr %48, i32 %idxprom67.15

  %arrayidx71 = getelementptr inbounds i16, ptr %4, i32 %n57.0151
  %arrayidx71.1 = getelementptr inbounds i16, ptr %4, i32 %inc77
  %arrayidx71.2 = getelementptr inbounds i16, ptr %4, i32 %inc77.1
  %arrayidx71.3 = getelementptr inbounds i16, ptr %4, i32 %inc77.2
  %arrayidx71.4 = getelementptr inbounds i16, ptr %4, i32 %inc77.3
  %arrayidx71.5 = getelementptr inbounds i16, ptr %4, i32 %inc77.4
  %arrayidx71.6 = getelementptr inbounds i16, ptr %4, i32 %inc77.5
  %arrayidx71.7 = getelementptr inbounds i16, ptr %4, i32 %inc77.6
  %arrayidx71.8 = getelementptr inbounds i16, ptr %4, i32 %inc77.7
  %arrayidx71.9 = getelementptr inbounds i16, ptr %4, i32 %inc77.8
  %arrayidx71.10 = getelementptr inbounds i16, ptr %4, i32 %inc77.9
  %arrayidx71.11 = getelementptr inbounds i16, ptr %4, i32 %inc77.10
  %arrayidx71.12 = getelementptr inbounds i16, ptr %4, i32 %inc77.11
  %arrayidx71.13 = getelementptr inbounds i16, ptr %4, i32 %inc77.12
  %arrayidx71.14 = getelementptr inbounds i16, ptr %4, i32 %inc77.13
  %arrayidx71.15 = getelementptr inbounds i16, ptr %4, i32 %inc77.14

  %114 = load i16, ptr %arrayidx68, align 2, !tbaa !18
  %115 = load i16, ptr %arrayidx71, align 2, !tbaa !18
  %116 = load i16, ptr %arrayidx68.1, align 2, !tbaa !18
  %117 = load i16, ptr %arrayidx71.1, align 2, !tbaa !18
  %118 = load i16, ptr %arrayidx68.2, align 2, !tbaa !18
  %119 = load i16, ptr %arrayidx71.2, align 2, !tbaa !18
  %120 = load i16, ptr %arrayidx68.3, align 2, !tbaa !18
  %121 = load i16, ptr %arrayidx71.3, align 2, !tbaa !18
  %122 = load i16, ptr %arrayidx68.4, align 2, !tbaa !18
  %123 = load i16, ptr %arrayidx71.4, align 2, !tbaa !18
  %124 = load i16, ptr %arrayidx68.5, align 2, !tbaa !18
  %125 = load i16, ptr %arrayidx71.5, align 2, !tbaa !18
  %126 = load i16, ptr %arrayidx68.6, align 2, !tbaa !18
  %127 = load i16, ptr %arrayidx71.6, align 2, !tbaa !18
  %128 = load i16, ptr %arrayidx68.7, align 2, !tbaa !18
  %129 = load i16, ptr %arrayidx71.7, align 2, !tbaa !18
  %130 = load i16, ptr %arrayidx68.8, align 2, !tbaa !18
  %131 = load i16, ptr %arrayidx71.8, align 2, !tbaa !18
  %132 = load i16, ptr %arrayidx68.9, align 2, !tbaa !18
  %133 = load i16, ptr %arrayidx71.9, align 2, !tbaa !18
  %134 = load i16, ptr %arrayidx68.10, align 2, !tbaa !18
  %135 = load i16, ptr %arrayidx71.10, align 2, !tbaa !18
  %136 = load i16, ptr %arrayidx68.11, align 2, !tbaa !18
  %137 = load i16, ptr %arrayidx71.11, align 2, !tbaa !18
  %138 = load i16, ptr %arrayidx68.12, align 2, !tbaa !18
  %139 = load i16, ptr %arrayidx71.12, align 2, !tbaa !18
  %140 = load i16, ptr %arrayidx68.13, align 2, !tbaa !18
  %141 = load i16, ptr %arrayidx71.13, align 2, !tbaa !18
  %142 = load i16, ptr %arrayidx68.14, align 2, !tbaa !18
  %143 = load i16, ptr %arrayidx71.14, align 2, !tbaa !18
  %144 = load i16, ptr %arrayidx68.15, align 2, !tbaa !18
  %145 = load i16, ptr %arrayidx71.15, align 2, !tbaa !18

  %conv69 = sext i16 %114 to i32
  %conv72 = sext i16 %115 to i32
  %conv69.1 = sext i16 %116 to i32
  %conv72.1 = sext i16 %117 to i32
  %conv69.2 = sext i16 %118 to i32
  %conv72.2 = sext i16 %119 to i32
  %conv69.3 = sext i16 %120 to i32
  %conv72.3 = sext i16 %121 to i32
  %conv69.4 = sext i16 %122 to i32
  %conv72.4 = sext i16 %123 to i32
  %conv69.5 = sext i16 %124 to i32
  %conv72.5 = sext i16 %125 to i32
  %conv69.6 = sext i16 %126 to i32
  %conv72.6 = sext i16 %127 to i32
  %conv69.7 = sext i16 %128 to i32
  %conv72.7 = sext i16 %129 to i32
  %conv69.8 = sext i16 %130 to i32
  %conv72.8 = sext i16 %131 to i32
  %conv69.9 = sext i16 %132 to i32
  %conv72.9 = sext i16 %133 to i32
  %conv69.10 = sext i16 %134 to i32
  %conv72.10 = sext i16 %135 to i32
  %conv69.11 = sext i16 %136 to i32
  %conv72.11 = sext i16 %137 to i32
  %conv69.12 = sext i16 %138 to i32
  %conv72.12 = sext i16 %139 to i32
  %conv69.13 = sext i16 %140 to i32
  %conv72.13 = sext i16 %141 to i32
  %conv69.14 = sext i16 %142 to i32
  %conv72.14 = sext i16 %143 to i32
  %conv69.15 = sext i16 %144 to i32
  %conv72.15 = sext i16 %145 to i32

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

  %add75 = add nsw i64 %acc.1149, %conv74
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
  %add75.15 = add nsw i64 %add75.14, %conv74.15

  %niter.next.15 = add i32 %niter, 16
  %niter.ncmp.15 = icmp eq i32 %niter.next.15, %unroll_iter
  br i1 %niter.ncmp.15, label %for.cond.cleanup63.loopexit.unr-lcssa.loopexit, label %for.body64, !llvm.loop !23
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d)"}
!4 = !{!5, !9, i64 16}
!5 = !{!"fir_s16_s", !6, i64 0, !6, i64 4, !9, i64 8, !9, i64 10, !9, i64 12, !9, i64 14, !9, i64 16, !6, i64 20, !10, i64 24, !9, i64 28}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"short", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!5, !10, i64 24}
!12 = !{!5, !9, i64 12}
!13 = !{!5, !9, i64 8}
!14 = !{!5, !6, i64 4}
!15 = !{!5, !9, i64 14}
!16 = !{!5, !9, i64 10}
!17 = !{!5, !6, i64 0}
!18 = !{!9, !9, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !20}
