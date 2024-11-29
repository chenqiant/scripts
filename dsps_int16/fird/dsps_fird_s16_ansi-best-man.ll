; ModuleID = 'dsps_fird_s16_ansi-best.c'
source_filename = "dsps_fird_s16_ansi-best.c"
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
  %coeffs_len12 = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 2
  %2 = load i16, ptr %coeffs_len12, align 4, !tbaa !12
  %3 = load ptr, ptr %fir, align 4, !tbaa !13
  %delay15 = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 1
  %4 = load ptr, ptr %delay15, align 4, !tbaa !14
  %cmp16671 = icmp sgt i32 %len, 0
  br i1 %cmp16671, label %for.cond18.preheader.lr.ph, label %for.cond.cleanup

for.cond18.preheader.lr.ph:                       ; preds = %if.end
  %decim13 = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 4
  %5 = load i16, ptr %decim13, align 4, !tbaa !15
  %conv19 = sext i16 %5 to i32
  %d_pos = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 5
  %pos = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 3
  %conv38 = sext i16 %2 to i32
  %sub39 = add i16 %2, -1
  %sub45 = add nsw i32 %conv38, -15
  %cmp416 = icmp sgt i16 %0, 15
  %sub425 = sub nsw i32 15, %conv
  %sh_prom426 = zext nneg i32 %sub425 to i64
  %sh_prom419 = zext nneg i32 %sub to i64
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond18.preheader.lr.ph, %for.end415
  %i.0674 = phi i32 [ 0, %for.cond18.preheader.lr.ph ], [ %inc433, %for.end415 ]
  %input_pos.0672 = phi i32 [ 0, %for.cond18.preheader.lr.ph ], [ %input_pos.1.lcssa, %for.end415 ]
  %6 = load i16, ptr %d_pos, align 2, !tbaa !16
  %cmp22643 = icmp slt i16 %6, %5
  br i1 %cmp22643, label %for.body25, label %for.cond.cleanup24

for.cond.cleanup:                                 ; preds = %for.end415, %if.end
  %result.0.lcssa = phi i32 [ 0, %if.end ], [ %len, %for.end415 ]
  ret i32 %result.0.lcssa

for.cond.cleanup24:                               ; preds = %if.end32, %for.cond18.preheader
  %input_pos.1.lcssa = phi i32 [ %input_pos.0672, %for.cond18.preheader ], [ %inc, %if.end32 ]
  store i16 0, ptr %d_pos, align 2, !tbaa !16
  %7 = load i16, ptr %pos, align 2, !tbaa !17
  %conv42 = sext i16 %7 to i32
  %cmp46646 = icmp sgt i32 %sub45, %conv42
  br i1 %cmp46646, label %for.body48, label %for.cond211.preheader

for.body25:                                       ; preds = %for.cond18.preheader, %if.end32
  %j.0645 = phi i32 [ %inc36, %if.end32 ], [ 0, %for.cond18.preheader ]
  %input_pos.1644 = phi i32 [ %inc, %if.end32 ], [ %input_pos.0672, %for.cond18.preheader ]
  %8 = load i16, ptr %pos, align 2, !tbaa !17
  %cmp28.not = icmp slt i16 %8, %2
  br i1 %cmp28.not, label %if.end32, label %if.then30

if.then30:                                        ; preds = %for.body25
  store i16 0, ptr %pos, align 2, !tbaa !17
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %for.body25
  %9 = phi i16 [ 0, %if.then30 ], [ %8, %for.body25 ]
  %inc = add nsw i32 %input_pos.1644, 1
  %arrayidx = getelementptr inbounds i16, ptr %input, i32 %input_pos.1644
  %10 = load i16, ptr %arrayidx, align 2, !tbaa !18
  %inc34 = add nsw i16 %9, 1
  store i16 %inc34, ptr %pos, align 2, !tbaa !17
  %idxprom = sext i16 %9 to i32
  %arrayidx35 = getelementptr inbounds i16, ptr %4, i32 %idxprom
  store i16 %10, ptr %arrayidx35, align 2, !tbaa !18
  %inc36 = add nuw nsw i32 %j.0645, 1
  %11 = load i16, ptr %d_pos, align 2, !tbaa !16
  %conv20 = sext i16 %11 to i32
  %sub21 = sub nsw i32 %conv19, %conv20
  %cmp22 = icmp slt i32 %inc36, %sub21
  br i1 %cmp22, label %for.body25, label %for.cond.cleanup24, !llvm.loop !19

for.cond211.preheader:                            ; preds = %for.body48, %for.cond.cleanup24
  %acc.0.lcssa = phi i64 [ %rounding.0, %for.cond.cleanup24 ], [ %add204, %for.body48 ]
  %coeff_pos.0.lcssa = phi i16 [ %sub39, %for.cond.cleanup24 ], [ %sub206, %for.body48 ]
  %n.0.lcssa = phi i32 [ %conv42, %for.cond.cleanup24 ], [ %add209, %for.body48 ]
  %cmp213653 = icmp slt i32 %n.0.lcssa, %conv38
  br i1 %cmp213653, label %for.body215.preheader, label %for.cond227.preheader

for.body215.preheader:                            ; preds = %for.cond211.preheader
  %12 = trunc i32 %n.0.lcssa to i16
  br label %for.body215

for.body48:                                       ; preds = %for.cond.cleanup24, %for.body48
  %n.0649 = phi i32 [ %add209, %for.body48 ], [ %conv42, %for.cond.cleanup24 ]
  %coeff_pos.0648 = phi i16 [ %sub206, %for.body48 ], [ %sub39, %for.cond.cleanup24 ]
  %acc.0647 = phi i64 [ %add204, %for.body48 ], [ %rounding.0, %for.cond.cleanup24 ]
  %idxprom49 = sext i16 %coeff_pos.0648 to i32
  %arrayidx50 = getelementptr inbounds i16, ptr %3, i32 %idxprom49
  %13 = load i16, ptr %arrayidx50, align 2, !tbaa !18
  %conv51 = sext i16 %13 to i32
  %arrayidx52 = getelementptr inbounds i16, ptr %4, i32 %n.0649
  %14 = load i16, ptr %arrayidx52, align 2, !tbaa !18
  %conv53 = sext i16 %14 to i32
  %mul = mul nsw i32 %conv53, %conv51
  %conv54 = sext i32 %mul to i64
  %add = add nsw i64 %acc.0647, %conv54
  %arrayidx57 = getelementptr i16, ptr %arrayidx50, i32 -1
  %15 = load i16, ptr %arrayidx57, align 2, !tbaa !18
  %conv58 = sext i16 %15 to i32
  %arrayidx60 = getelementptr i16, ptr %arrayidx52, i32 1
  %16 = load i16, ptr %arrayidx60, align 2, !tbaa !18
  %conv61 = sext i16 %16 to i32
  %mul62 = mul nsw i32 %conv61, %conv58
  %conv63 = sext i32 %mul62 to i64
  %add64 = add nsw i64 %add, %conv63
  %arrayidx67 = getelementptr i16, ptr %arrayidx50, i32 -2
  %17 = load i16, ptr %arrayidx67, align 2, !tbaa !18
  %conv68 = sext i16 %17 to i32
  %arrayidx70 = getelementptr i16, ptr %arrayidx52, i32 2
  %18 = load i16, ptr %arrayidx70, align 2, !tbaa !18
  %conv71 = sext i16 %18 to i32
  %mul72 = mul nsw i32 %conv71, %conv68
  %conv73 = sext i32 %mul72 to i64
  %add74 = add nsw i64 %add64, %conv73
  %arrayidx77 = getelementptr i16, ptr %arrayidx50, i32 -3
  %19 = load i16, ptr %arrayidx77, align 2, !tbaa !18
  %conv78 = sext i16 %19 to i32
  %arrayidx80 = getelementptr i16, ptr %arrayidx52, i32 3
  %20 = load i16, ptr %arrayidx80, align 2, !tbaa !18
  %conv81 = sext i16 %20 to i32
  %mul82 = mul nsw i32 %conv81, %conv78
  %conv83 = sext i32 %mul82 to i64
  %add84 = add nsw i64 %add74, %conv83
  %arrayidx87 = getelementptr i16, ptr %arrayidx50, i32 -4
  %21 = load i16, ptr %arrayidx87, align 2, !tbaa !18
  %conv88 = sext i16 %21 to i32
  %arrayidx90 = getelementptr i16, ptr %arrayidx52, i32 4
  %22 = load i16, ptr %arrayidx90, align 2, !tbaa !18
  %conv91 = sext i16 %22 to i32
  %mul92 = mul nsw i32 %conv91, %conv88
  %conv93 = sext i32 %mul92 to i64
  %add94 = add nsw i64 %add84, %conv93
  %arrayidx97 = getelementptr i16, ptr %arrayidx50, i32 -5
  %23 = load i16, ptr %arrayidx97, align 2, !tbaa !18
  %conv98 = sext i16 %23 to i32
  %arrayidx100 = getelementptr i16, ptr %arrayidx52, i32 5
  %24 = load i16, ptr %arrayidx100, align 2, !tbaa !18
  %conv101 = sext i16 %24 to i32
  %mul102 = mul nsw i32 %conv101, %conv98
  %conv103 = sext i32 %mul102 to i64
  %add104 = add nsw i64 %add94, %conv103
  %arrayidx107 = getelementptr i16, ptr %arrayidx50, i32 -6
  %25 = load i16, ptr %arrayidx107, align 2, !tbaa !18
  %conv108 = sext i16 %25 to i32
  %arrayidx110 = getelementptr i16, ptr %arrayidx52, i32 6
  %26 = load i16, ptr %arrayidx110, align 2, !tbaa !18
  %conv111 = sext i16 %26 to i32
  %mul112 = mul nsw i32 %conv111, %conv108
  %conv113 = sext i32 %mul112 to i64
  %add114 = add nsw i64 %add104, %conv113
  %arrayidx117 = getelementptr i16, ptr %arrayidx50, i32 -7
  %27 = load i16, ptr %arrayidx117, align 2, !tbaa !18
  %conv118 = sext i16 %27 to i32
  %arrayidx120 = getelementptr i16, ptr %arrayidx52, i32 7
  %28 = load i16, ptr %arrayidx120, align 2, !tbaa !18
  %conv121 = sext i16 %28 to i32
  %mul122 = mul nsw i32 %conv121, %conv118
  %conv123 = sext i32 %mul122 to i64
  %add124 = add nsw i64 %add114, %conv123
  %arrayidx127 = getelementptr i16, ptr %arrayidx50, i32 -8
  %29 = load i16, ptr %arrayidx127, align 2, !tbaa !18
  %conv128 = sext i16 %29 to i32
  %arrayidx130 = getelementptr i16, ptr %arrayidx52, i32 8
  %30 = load i16, ptr %arrayidx130, align 2, !tbaa !18
  %conv131 = sext i16 %30 to i32
  %mul132 = mul nsw i32 %conv131, %conv128
  %conv133 = sext i32 %mul132 to i64
  %add134 = add nsw i64 %add124, %conv133
  %arrayidx137 = getelementptr i16, ptr %arrayidx50, i32 -9
  %31 = load i16, ptr %arrayidx137, align 2, !tbaa !18
  %conv138 = sext i16 %31 to i32
  %arrayidx140 = getelementptr i16, ptr %arrayidx52, i32 9
  %32 = load i16, ptr %arrayidx140, align 2, !tbaa !18
  %conv141 = sext i16 %32 to i32
  %mul142 = mul nsw i32 %conv141, %conv138
  %conv143 = sext i32 %mul142 to i64
  %add144 = add nsw i64 %add134, %conv143
  %arrayidx147 = getelementptr i16, ptr %arrayidx50, i32 -10
  %33 = load i16, ptr %arrayidx147, align 2, !tbaa !18
  %conv148 = sext i16 %33 to i32
  %arrayidx150 = getelementptr i16, ptr %arrayidx52, i32 10
  %34 = load i16, ptr %arrayidx150, align 2, !tbaa !18
  %conv151 = sext i16 %34 to i32
  %mul152 = mul nsw i32 %conv151, %conv148
  %conv153 = sext i32 %mul152 to i64
  %add154 = add nsw i64 %add144, %conv153
  %arrayidx157 = getelementptr i16, ptr %arrayidx50, i32 -11
  %35 = load i16, ptr %arrayidx157, align 2, !tbaa !18
  %conv158 = sext i16 %35 to i32
  %arrayidx160 = getelementptr i16, ptr %arrayidx52, i32 11
  %36 = load i16, ptr %arrayidx160, align 2, !tbaa !18
  %conv161 = sext i16 %36 to i32
  %mul162 = mul nsw i32 %conv161, %conv158
  %conv163 = sext i32 %mul162 to i64
  %add164 = add nsw i64 %add154, %conv163
  %arrayidx167 = getelementptr i16, ptr %arrayidx50, i32 -12
  %37 = load i16, ptr %arrayidx167, align 2, !tbaa !18
  %conv168 = sext i16 %37 to i32
  %arrayidx170 = getelementptr i16, ptr %arrayidx52, i32 12
  %38 = load i16, ptr %arrayidx170, align 2, !tbaa !18
  %conv171 = sext i16 %38 to i32
  %mul172 = mul nsw i32 %conv171, %conv168
  %conv173 = sext i32 %mul172 to i64
  %add174 = add nsw i64 %add164, %conv173
  %arrayidx177 = getelementptr i16, ptr %arrayidx50, i32 -13
  %39 = load i16, ptr %arrayidx177, align 2, !tbaa !18
  %conv178 = sext i16 %39 to i32
  %arrayidx180 = getelementptr i16, ptr %arrayidx52, i32 13
  %40 = load i16, ptr %arrayidx180, align 2, !tbaa !18
  %conv181 = sext i16 %40 to i32
  %mul182 = mul nsw i32 %conv181, %conv178
  %conv183 = sext i32 %mul182 to i64
  %add184 = add nsw i64 %add174, %conv183
  %arrayidx187 = getelementptr i16, ptr %arrayidx50, i32 -14
  %41 = load i16, ptr %arrayidx187, align 2, !tbaa !18
  %conv188 = sext i16 %41 to i32
  %arrayidx190 = getelementptr i16, ptr %arrayidx52, i32 14
  %42 = load i16, ptr %arrayidx190, align 2, !tbaa !18
  %conv191 = sext i16 %42 to i32
  %mul192 = mul nsw i32 %conv191, %conv188
  %conv193 = sext i32 %mul192 to i64
  %add194 = add nsw i64 %add184, %conv193
  %arrayidx197 = getelementptr i16, ptr %arrayidx50, i32 -15
  %43 = load i16, ptr %arrayidx197, align 2, !tbaa !18
  %conv198 = sext i16 %43 to i32
  %arrayidx200 = getelementptr i16, ptr %arrayidx52, i32 15
  %44 = load i16, ptr %arrayidx200, align 2, !tbaa !18
  %conv201 = sext i16 %44 to i32
  %mul202 = mul nsw i32 %conv201, %conv198
  %conv203 = sext i32 %mul202 to i64
  %add204 = add nsw i64 %add194, %conv203
  %sub206 = add i16 %coeff_pos.0648, -16
  %add209 = add nsw i32 %n.0649, 16
  %cmp46 = icmp slt i32 %add209, %sub45
  br i1 %cmp46, label %for.body48, label %for.cond211.preheader, !llvm.loop !21

for.cond227.preheader.loopexit:                   ; preds = %for.body215
  %45 = sub i16 %coeff_pos.0.lcssa, %2
  %46 = add i16 %45, %12
  br label %for.cond227.preheader

for.cond227.preheader:                            ; preds = %for.cond227.preheader.loopexit, %for.cond211.preheader
  %acc.1.lcssa = phi i64 [ %acc.0.lcssa, %for.cond211.preheader ], [ %add223, %for.cond227.preheader.loopexit ]
  %coeff_pos.1.lcssa = phi i16 [ %coeff_pos.0.lcssa, %for.cond211.preheader ], [ %46, %for.cond227.preheader.loopexit ]
  %sub230 = add nsw i32 %conv42, -15
  %cmp231659 = icmp sgt i16 %7, 15
  br i1 %cmp231659, label %for.body233.preheader, label %for.cond398.preheader

for.body233.preheader:                            ; preds = %for.cond227.preheader
  %47 = and i32 %conv42, 32752
  br label %for.body233

for.body215:                                      ; preds = %for.body215.preheader, %for.body215
  %n.1656 = phi i32 [ %inc225, %for.body215 ], [ %n.0.lcssa, %for.body215.preheader ]
  %coeff_pos.1655 = phi i16 [ %dec, %for.body215 ], [ %coeff_pos.0.lcssa, %for.body215.preheader ]
  %acc.1654 = phi i64 [ %add223, %for.body215 ], [ %acc.0.lcssa, %for.body215.preheader ]
  %dec = add i16 %coeff_pos.1655, -1
  %idxprom216 = sext i16 %coeff_pos.1655 to i32
  %arrayidx217 = getelementptr inbounds i16, ptr %3, i32 %idxprom216
  %48 = load i16, ptr %arrayidx217, align 2, !tbaa !18
  %conv218 = sext i16 %48 to i32
  %arrayidx219 = getelementptr inbounds i16, ptr %4, i32 %n.1656
  %49 = load i16, ptr %arrayidx219, align 2, !tbaa !18
  %conv220 = sext i16 %49 to i32
  %mul221 = mul nsw i32 %conv220, %conv218
  %conv222 = sext i32 %mul221 to i64
  %add223 = add nsw i64 %acc.1654, %conv222
  %inc225 = add nsw i32 %n.1656, 1
  %exitcond.not = icmp eq i32 %inc225, %conv38
  br i1 %exitcond.not, label %for.cond227.preheader.loopexit, label %for.body215, !llvm.loop !22

for.cond398.preheader:                            ; preds = %for.body233, %for.cond227.preheader
  %acc.2.lcssa = phi i64 [ %acc.1.lcssa, %for.cond227.preheader ], [ %add391, %for.body233 ]
  %coeff_pos.2.lcssa = phi i16 [ %coeff_pos.1.lcssa, %for.cond227.preheader ], [ %sub393, %for.body233 ]
  %n.2.lcssa = phi i32 [ 0, %for.cond227.preheader ], [ %47, %for.body233 ]
  %cmp401666 = icmp slt i32 %n.2.lcssa, %conv42
  br i1 %cmp401666, label %for.body403, label %for.end415

for.body233:                                      ; preds = %for.body233.preheader, %for.body233
  %n.2662 = phi i32 [ %add396, %for.body233 ], [ 0, %for.body233.preheader ]
  %coeff_pos.2661 = phi i16 [ %sub393, %for.body233 ], [ %coeff_pos.1.lcssa, %for.body233.preheader ]
  %acc.2660 = phi i64 [ %add391, %for.body233 ], [ %acc.1.lcssa, %for.body233.preheader ]
  %idxprom234 = sext i16 %coeff_pos.2661 to i32
  %arrayidx235 = getelementptr inbounds i16, ptr %3, i32 %idxprom234
  %50 = load i16, ptr %arrayidx235, align 2, !tbaa !18
  %conv236 = sext i16 %50 to i32
  %arrayidx237 = getelementptr inbounds i16, ptr %4, i32 %n.2662
  %51 = load i16, ptr %arrayidx237, align 2, !tbaa !18
  %conv238 = sext i16 %51 to i32
  %mul239 = mul nsw i32 %conv238, %conv236
  %conv240 = sext i32 %mul239 to i64
  %add241 = add nsw i64 %acc.2660, %conv240
  %arrayidx244 = getelementptr i16, ptr %arrayidx235, i32 -1
  %52 = load i16, ptr %arrayidx244, align 2, !tbaa !18
  %conv245 = sext i16 %52 to i32
  %add246 = or disjoint i32 %n.2662, 1
  %arrayidx247 = getelementptr inbounds i16, ptr %4, i32 %add246
  %53 = load i16, ptr %arrayidx247, align 2, !tbaa !18
  %conv248 = sext i16 %53 to i32
  %mul249 = mul nsw i32 %conv248, %conv245
  %conv250 = sext i32 %mul249 to i64
  %add251 = add nsw i64 %add241, %conv250
  %arrayidx254 = getelementptr i16, ptr %arrayidx235, i32 -2
  %54 = load i16, ptr %arrayidx254, align 2, !tbaa !18
  %conv255 = sext i16 %54 to i32
  %add256 = or disjoint i32 %n.2662, 2
  %arrayidx257 = getelementptr inbounds i16, ptr %4, i32 %add256
  %55 = load i16, ptr %arrayidx257, align 2, !tbaa !18
  %conv258 = sext i16 %55 to i32
  %mul259 = mul nsw i32 %conv258, %conv255
  %conv260 = sext i32 %mul259 to i64
  %add261 = add nsw i64 %add251, %conv260
  %arrayidx264 = getelementptr i16, ptr %arrayidx235, i32 -3
  %56 = load i16, ptr %arrayidx264, align 2, !tbaa !18
  %conv265 = sext i16 %56 to i32
  %add266 = or disjoint i32 %n.2662, 3
  %arrayidx267 = getelementptr inbounds i16, ptr %4, i32 %add266
  %57 = load i16, ptr %arrayidx267, align 2, !tbaa !18
  %conv268 = sext i16 %57 to i32
  %mul269 = mul nsw i32 %conv268, %conv265
  %conv270 = sext i32 %mul269 to i64
  %add271 = add nsw i64 %add261, %conv270
  %arrayidx274 = getelementptr i16, ptr %arrayidx235, i32 -4
  %58 = load i16, ptr %arrayidx274, align 2, !tbaa !18
  %conv275 = sext i16 %58 to i32
  %add276 = or disjoint i32 %n.2662, 4
  %arrayidx277 = getelementptr inbounds i16, ptr %4, i32 %add276
  %59 = load i16, ptr %arrayidx277, align 2, !tbaa !18
  %conv278 = sext i16 %59 to i32
  %mul279 = mul nsw i32 %conv278, %conv275
  %conv280 = sext i32 %mul279 to i64
  %add281 = add nsw i64 %add271, %conv280
  %arrayidx284 = getelementptr i16, ptr %arrayidx235, i32 -5
  %60 = load i16, ptr %arrayidx284, align 2, !tbaa !18
  %conv285 = sext i16 %60 to i32
  %add286 = or disjoint i32 %n.2662, 5
  %arrayidx287 = getelementptr inbounds i16, ptr %4, i32 %add286
  %61 = load i16, ptr %arrayidx287, align 2, !tbaa !18
  %conv288 = sext i16 %61 to i32
  %mul289 = mul nsw i32 %conv288, %conv285
  %conv290 = sext i32 %mul289 to i64
  %add291 = add nsw i64 %add281, %conv290
  %arrayidx294 = getelementptr i16, ptr %arrayidx235, i32 -6
  %62 = load i16, ptr %arrayidx294, align 2, !tbaa !18
  %conv295 = sext i16 %62 to i32
  %add296 = or disjoint i32 %n.2662, 6
  %arrayidx297 = getelementptr inbounds i16, ptr %4, i32 %add296
  %63 = load i16, ptr %arrayidx297, align 2, !tbaa !18
  %conv298 = sext i16 %63 to i32
  %mul299 = mul nsw i32 %conv298, %conv295
  %conv300 = sext i32 %mul299 to i64
  %add301 = add nsw i64 %add291, %conv300
  %arrayidx304 = getelementptr i16, ptr %arrayidx235, i32 -7
  %64 = load i16, ptr %arrayidx304, align 2, !tbaa !18
  %conv305 = sext i16 %64 to i32
  %add306 = or disjoint i32 %n.2662, 7
  %arrayidx307 = getelementptr inbounds i16, ptr %4, i32 %add306
  %65 = load i16, ptr %arrayidx307, align 2, !tbaa !18
  %conv308 = sext i16 %65 to i32
  %mul309 = mul nsw i32 %conv308, %conv305
  %conv310 = sext i32 %mul309 to i64
  %add311 = add nsw i64 %add301, %conv310
  %arrayidx314 = getelementptr i16, ptr %arrayidx235, i32 -8
  %66 = load i16, ptr %arrayidx314, align 2, !tbaa !18
  %conv315 = sext i16 %66 to i32
  %add316 = or disjoint i32 %n.2662, 8
  %arrayidx317 = getelementptr inbounds i16, ptr %4, i32 %add316
  %67 = load i16, ptr %arrayidx317, align 2, !tbaa !18
  %conv318 = sext i16 %67 to i32
  %mul319 = mul nsw i32 %conv318, %conv315
  %conv320 = sext i32 %mul319 to i64
  %add321 = add nsw i64 %add311, %conv320
  %arrayidx324 = getelementptr i16, ptr %arrayidx235, i32 -9
  %68 = load i16, ptr %arrayidx324, align 2, !tbaa !18
  %conv325 = sext i16 %68 to i32
  %add326 = or disjoint i32 %n.2662, 9
  %arrayidx327 = getelementptr inbounds i16, ptr %4, i32 %add326
  %69 = load i16, ptr %arrayidx327, align 2, !tbaa !18
  %conv328 = sext i16 %69 to i32
  %mul329 = mul nsw i32 %conv328, %conv325
  %conv330 = sext i32 %mul329 to i64
  %add331 = add nsw i64 %add321, %conv330
  %arrayidx334 = getelementptr i16, ptr %arrayidx235, i32 -10
  %70 = load i16, ptr %arrayidx334, align 2, !tbaa !18
  %conv335 = sext i16 %70 to i32
  %add336 = or disjoint i32 %n.2662, 10
  %arrayidx337 = getelementptr inbounds i16, ptr %4, i32 %add336
  %71 = load i16, ptr %arrayidx337, align 2, !tbaa !18
  %conv338 = sext i16 %71 to i32
  %mul339 = mul nsw i32 %conv338, %conv335
  %conv340 = sext i32 %mul339 to i64
  %add341 = add nsw i64 %add331, %conv340
  %arrayidx344 = getelementptr i16, ptr %arrayidx235, i32 -11
  %72 = load i16, ptr %arrayidx344, align 2, !tbaa !18
  %conv345 = sext i16 %72 to i32
  %add346 = or disjoint i32 %n.2662, 11
  %arrayidx347 = getelementptr inbounds i16, ptr %4, i32 %add346
  %73 = load i16, ptr %arrayidx347, align 2, !tbaa !18
  %conv348 = sext i16 %73 to i32
  %mul349 = mul nsw i32 %conv348, %conv345
  %conv350 = sext i32 %mul349 to i64
  %add351 = add nsw i64 %add341, %conv350
  %arrayidx354 = getelementptr i16, ptr %arrayidx235, i32 -12
  %74 = load i16, ptr %arrayidx354, align 2, !tbaa !18
  %conv355 = sext i16 %74 to i32
  %add356 = or disjoint i32 %n.2662, 12
  %arrayidx357 = getelementptr inbounds i16, ptr %4, i32 %add356
  %75 = load i16, ptr %arrayidx357, align 2, !tbaa !18
  %conv358 = sext i16 %75 to i32
  %mul359 = mul nsw i32 %conv358, %conv355
  %conv360 = sext i32 %mul359 to i64
  %add361 = add nsw i64 %add351, %conv360
  %arrayidx364 = getelementptr i16, ptr %arrayidx235, i32 -13
  %76 = load i16, ptr %arrayidx364, align 2, !tbaa !18
  %conv365 = sext i16 %76 to i32
  %add366 = or disjoint i32 %n.2662, 13
  %arrayidx367 = getelementptr inbounds i16, ptr %4, i32 %add366
  %77 = load i16, ptr %arrayidx367, align 2, !tbaa !18
  %conv368 = sext i16 %77 to i32
  %mul369 = mul nsw i32 %conv368, %conv365
  %conv370 = sext i32 %mul369 to i64
  %add371 = add nsw i64 %add361, %conv370
  %arrayidx374 = getelementptr i16, ptr %arrayidx235, i32 -14
  %78 = load i16, ptr %arrayidx374, align 2, !tbaa !18
  %conv375 = sext i16 %78 to i32
  %add376 = or disjoint i32 %n.2662, 14
  %arrayidx377 = getelementptr inbounds i16, ptr %4, i32 %add376
  %79 = load i16, ptr %arrayidx377, align 2, !tbaa !18
  %conv378 = sext i16 %79 to i32
  %mul379 = mul nsw i32 %conv378, %conv375
  %conv380 = sext i32 %mul379 to i64
  %add381 = add nsw i64 %add371, %conv380
  %arrayidx384 = getelementptr i16, ptr %arrayidx235, i32 -15
  %80 = load i16, ptr %arrayidx384, align 2, !tbaa !18
  %conv385 = sext i16 %80 to i32
  %add386 = or disjoint i32 %n.2662, 15
  %arrayidx387 = getelementptr inbounds i16, ptr %4, i32 %add386
  %81 = load i16, ptr %arrayidx387, align 2, !tbaa !18
  %conv388 = sext i16 %81 to i32
  %mul389 = mul nsw i32 %conv388, %conv385
  %conv390 = sext i32 %mul389 to i64
  %add391 = add nsw i64 %add381, %conv390
  %sub393 = add i16 %coeff_pos.2661, -16
  %add396 = add nuw nsw i32 %n.2662, 16
  %cmp231 = icmp slt i32 %add396, %sub230
  br i1 %cmp231, label %for.body233, label %for.cond398.preheader, !llvm.loop !23

for.body403:                                      ; preds = %for.cond398.preheader, %for.body403
  %n.3669 = phi i32 [ %inc414, %for.body403 ], [ %n.2.lcssa, %for.cond398.preheader ]
  %coeff_pos.3668 = phi i16 [ %dec404, %for.body403 ], [ %coeff_pos.2.lcssa, %for.cond398.preheader ]
  %acc.3667 = phi i64 [ %add412, %for.body403 ], [ %acc.2.lcssa, %for.cond398.preheader ]
  %dec404 = add i16 %coeff_pos.3668, -1
  %idxprom405 = sext i16 %coeff_pos.3668 to i32
  %arrayidx406 = getelementptr inbounds i16, ptr %3, i32 %idxprom405
  %82 = load i16, ptr %arrayidx406, align 2, !tbaa !18
  %conv407 = sext i16 %82 to i32
  %arrayidx408 = getelementptr inbounds i16, ptr %4, i32 %n.3669
  %83 = load i16, ptr %arrayidx408, align 2, !tbaa !18
  %conv409 = sext i16 %83 to i32
  %mul410 = mul nsw i32 %conv409, %conv407
  %conv411 = sext i32 %mul410 to i64
  %add412 = add nsw i64 %acc.3667, %conv411
  %inc414 = add nuw nsw i32 %n.3669, 1
  %exitcond676.not = icmp eq i32 %inc414, %conv42
  br i1 %exitcond676.not, label %for.end415, label %for.body403, !llvm.loop !24

for.end415:                                       ; preds = %for.body403, %for.cond398.preheader
  %acc.3.lcssa = phi i64 [ %acc.2.lcssa, %for.cond398.preheader ], [ %add412, %for.body403 ]
  %shr427 = ashr i64 %acc.3.lcssa, %sh_prom426
  %shl420 = shl i64 %acc.3.lcssa, %sh_prom419
  %shr427.sink = select i1 %cmp416, i64 %shl420, i64 %shr427
  %conv428 = trunc i64 %shr427.sink to i16
  %84 = getelementptr inbounds i16, ptr %output, i32 %i.0674
  store i16 %conv428, ptr %84, align 2
  %inc433 = add nuw nsw i32 %i.0674, 1
  %exitcond677.not = icmp eq i32 %inc433, %len
  br i1 %exitcond677.not, label %for.cond.cleanup, label %for.cond18.preheader, !llvm.loop !25
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a)"}
!4 = !{!5, !9, i64 16}
!5 = !{!"fir_s16_s", !6, i64 0, !6, i64 4, !9, i64 8, !9, i64 10, !9, i64 12, !9, i64 14, !9, i64 16, !6, i64 20, !10, i64 24, !9, i64 28}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"short", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!5, !10, i64 24}
!12 = !{!5, !9, i64 8}
!13 = !{!5, !6, i64 0}
!14 = !{!5, !6, i64 4}
!15 = !{!5, !9, i64 12}
!16 = !{!5, !9, i64 14}
!17 = !{!5, !9, i64 10}
!18 = !{!9, !9, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !20}
!24 = distinct !{!24, !20}
!25 = distinct !{!25, !20}
