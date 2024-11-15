; ModuleID = 'dsps_fir_f32_best.c'
source_filename = "dsps_fir_f32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fir_f32_ansi(ptr noalias nocapture noundef %fir, ptr noalias nocapture noundef readonly %input, ptr noalias nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i32 %len, 2
  br i1 %cmp, label %for.cond.preheader, label %for.cond150.preheader

for.cond150.preheader:                            ; preds = %entry
  %cmp151349 = icmp sgt i32 %len, 0
  br i1 %cmp151349, label %for.body153.lr.ph, label %if.end200

for.body153.lr.ph:                                ; preds = %for.cond150.preheader
  %delay156 = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %0 = load ptr, ptr %delay156, align 4, !tbaa !4
  %pos157 = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N162 = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %1 = load i32, ptr %N162, align 4, !tbaa !11
  %pos157.promoted = load i32, ptr %pos157, align 4
  br label %for.body153

for.cond.preheader:                               ; preds = %entry
  %delay = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %2 = load ptr, ptr %delay, align 4, !tbaa !4
  %pos = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %3 = load i32, ptr %N, align 4, !tbaa !11
  %sub = add nsw i32 %3, -7
  %pos.promoted = load i32, ptr %pos, align 4
  br label %for.body

for.body:                                         ; preds = %for.cond.preheader, %for.end137
  %spec.store.select406 = phi i32 [ %pos.promoted, %for.cond.preheader ], [ %spec.store.select, %for.end137 ]
  %i.0405 = phi i32 [ 0, %for.cond.preheader ], [ %inc147, %for.end137 ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.0405
  %4 = load float, ptr %arrayidx, align 4, !tbaa !12
  %arrayidx2 = getelementptr inbounds float, ptr %2, i32 %spec.store.select406
  store float %4, ptr %arrayidx2, align 4, !tbaa !12
  %inc = add nsw i32 %spec.store.select406, 1
  %cmp5.not = icmp slt i32 %inc, %3
  %spec.store.select = select i1 %cmp5.not, i32 %inc, i32 0
  %cmp11352 = icmp slt i32 %spec.store.select, %sub
  br i1 %cmp11352, label %for.body12.lr.ph, label %for.cond59.preheader

for.body12.lr.ph:                                 ; preds = %for.body
  %5 = load ptr, ptr %fir, align 4, !tbaa !14
  br label %for.body12

for.cond59.preheader:                             ; preds = %for.body12, %for.body
  %acc0.0.lcssa = phi float [ 0.000000e+00, %for.body ], [ %10, %for.body12 ]
  %acc1.0.lcssa = phi float [ 0.000000e+00, %for.body ], [ %13, %for.body12 ]
  %acc2.0.lcssa = phi float [ 0.000000e+00, %for.body ], [ %16, %for.body12 ]
  %acc3.0.lcssa = phi float [ 0.000000e+00, %for.body ], [ %19, %for.body12 ]
  %acc4.0.lcssa = phi float [ 0.000000e+00, %for.body ], [ %22, %for.body12 ]
  %acc5.0.lcssa = phi float [ 0.000000e+00, %for.body ], [ %25, %for.body12 ]
  %acc6.0.lcssa = phi float [ 0.000000e+00, %for.body ], [ %28, %for.body12 ]
  %acc7.0.lcssa = phi float [ 0.000000e+00, %for.body ], [ %31, %for.body12 ]
  %coeff_pos.0.lcssa = phi i32 [ 0, %for.body ], [ %inc53, %for.body12 ]
  %n.0.lcssa = phi i32 [ %spec.store.select, %for.body ], [ %add58, %for.body12 ]
  %cmp61373 = icmp slt i32 %n.0.lcssa, %3
  br i1 %cmp61373, label %for.body62.lr.ph, label %for.cond71.preheader

for.body62.lr.ph:                                 ; preds = %for.cond59.preheader
  %6 = load ptr, ptr %fir, align 4, !tbaa !14
  %7 = add i32 %3, %coeff_pos.0.lcssa
  br label %for.body62

for.body12:                                       ; preds = %for.body12.lr.ph, %for.body12
  %n.0362 = phi i32 [ %spec.store.select, %for.body12.lr.ph ], [ %add58, %for.body12 ]
  %coeff_pos.0361 = phi i32 [ 0, %for.body12.lr.ph ], [ %inc53, %for.body12 ]
  %acc7.0360 = phi float [ 0.000000e+00, %for.body12.lr.ph ], [ %31, %for.body12 ]
  %acc6.0359 = phi float [ 0.000000e+00, %for.body12.lr.ph ], [ %28, %for.body12 ]
  %acc5.0358 = phi float [ 0.000000e+00, %for.body12.lr.ph ], [ %25, %for.body12 ]
  %acc4.0357 = phi float [ 0.000000e+00, %for.body12.lr.ph ], [ %22, %for.body12 ]
  %acc3.0356 = phi float [ 0.000000e+00, %for.body12.lr.ph ], [ %19, %for.body12 ]
  %acc2.0355 = phi float [ 0.000000e+00, %for.body12.lr.ph ], [ %16, %for.body12 ]
  %acc1.0354 = phi float [ 0.000000e+00, %for.body12.lr.ph ], [ %13, %for.body12 ]
  %acc0.0353 = phi float [ 0.000000e+00, %for.body12.lr.ph ], [ %10, %for.body12 ]
  %arrayidx14 = getelementptr inbounds float, ptr %5, i32 %coeff_pos.0361
  %8 = load float, ptr %arrayidx14, align 4, !tbaa !12
  %arrayidx16 = getelementptr inbounds float, ptr %2, i32 %n.0362
  %9 = load float, ptr %arrayidx16, align 4, !tbaa !12
  %10 = tail call float @llvm.fmuladd.f32(float %8, float %9, float %acc0.0353)
  %arrayidx19 = getelementptr float, ptr %arrayidx14, i32 1
  %11 = load float, ptr %arrayidx19, align 4, !tbaa !12
  %arrayidx21 = getelementptr float, ptr %arrayidx16, i32 1
  %12 = load float, ptr %arrayidx21, align 4, !tbaa !12
  %13 = tail call float @llvm.fmuladd.f32(float %11, float %12, float %acc1.0354)
  %arrayidx24 = getelementptr float, ptr %arrayidx14, i32 2
  %14 = load float, ptr %arrayidx24, align 4, !tbaa !12
  %arrayidx27 = getelementptr float, ptr %arrayidx16, i32 2
  %15 = load float, ptr %arrayidx27, align 4, !tbaa !12
  %16 = tail call float @llvm.fmuladd.f32(float %14, float %15, float %acc2.0355)
  %arrayidx30 = getelementptr float, ptr %arrayidx14, i32 3
  %17 = load float, ptr %arrayidx30, align 4, !tbaa !12
  %arrayidx33 = getelementptr float, ptr %arrayidx16, i32 3
  %18 = load float, ptr %arrayidx33, align 4, !tbaa !12
  %19 = tail call float @llvm.fmuladd.f32(float %17, float %18, float %acc3.0356)
  %arrayidx36 = getelementptr float, ptr %arrayidx14, i32 4
  %20 = load float, ptr %arrayidx36, align 4, !tbaa !12
  %arrayidx39 = getelementptr float, ptr %arrayidx16, i32 4
  %21 = load float, ptr %arrayidx39, align 4, !tbaa !12
  %22 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %acc4.0357)
  %arrayidx42 = getelementptr float, ptr %arrayidx14, i32 5
  %23 = load float, ptr %arrayidx42, align 4, !tbaa !12
  %arrayidx45 = getelementptr float, ptr %arrayidx16, i32 5
  %24 = load float, ptr %arrayidx45, align 4, !tbaa !12
  %25 = tail call float @llvm.fmuladd.f32(float %23, float %24, float %acc5.0358)
  %inc47 = or disjoint i32 %coeff_pos.0361, 7
  %arrayidx48 = getelementptr float, ptr %arrayidx14, i32 6
  %26 = load float, ptr %arrayidx48, align 4, !tbaa !12
  %arrayidx51 = getelementptr float, ptr %arrayidx16, i32 6
  %27 = load float, ptr %arrayidx51, align 4, !tbaa !12
  %28 = tail call float @llvm.fmuladd.f32(float %26, float %27, float %acc6.0359)
  %inc53 = add nuw nsw i32 %coeff_pos.0361, 8
  %arrayidx54 = getelementptr inbounds float, ptr %5, i32 %inc47
  %29 = load float, ptr %arrayidx54, align 4, !tbaa !12
  %arrayidx57 = getelementptr float, ptr %arrayidx16, i32 7
  %30 = load float, ptr %arrayidx57, align 4, !tbaa !12
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %acc7.0360)
  %add58 = add nsw i32 %n.0362, 8
  %cmp11 = icmp slt i32 %add58, %sub
  br i1 %cmp11, label %for.body12, label %for.cond59.preheader, !llvm.loop !15

for.cond71.preheader.loopexit:                    ; preds = %for.body62
  %32 = sub i32 %7, %n.0.lcssa
  br label %for.cond71.preheader

for.cond71.preheader:                             ; preds = %for.cond71.preheader.loopexit, %for.cond59.preheader
  %acc0.1.lcssa = phi float [ %acc0.0.lcssa, %for.cond59.preheader ], [ %37, %for.cond71.preheader.loopexit ]
  %coeff_pos.1.lcssa = phi i32 [ %coeff_pos.0.lcssa, %for.cond59.preheader ], [ %32, %for.cond71.preheader.loopexit ]
  %sub73 = add nsw i32 %spec.store.select, -7
  %cmp74379 = icmp sgt i32 %spec.store.select, 7
  br i1 %cmp74379, label %for.body75.lr.ph, label %for.cond126.preheader

for.body75.lr.ph:                                 ; preds = %for.cond71.preheader
  %33 = load ptr, ptr %fir, align 4, !tbaa !14
  %34 = and i32 %spec.store.select, 2147483640
  br label %for.body75

for.body62:                                       ; preds = %for.body62.lr.ph, %for.body62
  %n.1376 = phi i32 [ %n.0.lcssa, %for.body62.lr.ph ], [ %inc69, %for.body62 ]
  %coeff_pos.1375 = phi i32 [ %coeff_pos.0.lcssa, %for.body62.lr.ph ], [ %inc64, %for.body62 ]
  %acc0.1374 = phi float [ %acc0.0.lcssa, %for.body62.lr.ph ], [ %37, %for.body62 ]
  %inc64 = add nuw nsw i32 %coeff_pos.1375, 1
  %arrayidx65 = getelementptr inbounds float, ptr %6, i32 %coeff_pos.1375
  %35 = load float, ptr %arrayidx65, align 4, !tbaa !12
  %arrayidx67 = getelementptr inbounds float, ptr %2, i32 %n.1376
  %36 = load float, ptr %arrayidx67, align 4, !tbaa !12
  %37 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %acc0.1374)
  %inc69 = add nsw i32 %n.1376, 1
  %exitcond428.not = icmp eq i32 %inc69, %3
  br i1 %exitcond428.not, label %for.cond71.preheader.loopexit, label %for.body62, !llvm.loop !17

for.cond126.preheader:                            ; preds = %for.body75, %for.cond71.preheader
  %acc0.2.lcssa = phi float [ %acc0.1.lcssa, %for.cond71.preheader ], [ %41, %for.body75 ]
  %acc1.1.lcssa = phi float [ %acc1.0.lcssa, %for.cond71.preheader ], [ %44, %for.body75 ]
  %acc2.1.lcssa = phi float [ %acc2.0.lcssa, %for.cond71.preheader ], [ %47, %for.body75 ]
  %acc3.1.lcssa = phi float [ %acc3.0.lcssa, %for.cond71.preheader ], [ %50, %for.body75 ]
  %acc4.1.lcssa = phi float [ %acc4.0.lcssa, %for.cond71.preheader ], [ %53, %for.body75 ]
  %acc5.1.lcssa = phi float [ %acc5.0.lcssa, %for.cond71.preheader ], [ %56, %for.body75 ]
  %acc6.1.lcssa = phi float [ %acc6.0.lcssa, %for.cond71.preheader ], [ %59, %for.body75 ]
  %acc7.1.lcssa = phi float [ %acc7.0.lcssa, %for.cond71.preheader ], [ %62, %for.body75 ]
  %coeff_pos.2.lcssa = phi i32 [ %coeff_pos.1.lcssa, %for.cond71.preheader ], [ %inc118, %for.body75 ]
  %n.2.lcssa = phi i32 [ 0, %for.cond71.preheader ], [ %34, %for.body75 ]
  %cmp128400 = icmp slt i32 %n.2.lcssa, %spec.store.select
  br i1 %cmp128400, label %for.body129.lr.ph, label %for.end137

for.body129.lr.ph:                                ; preds = %for.cond126.preheader
  %38 = load ptr, ptr %fir, align 4, !tbaa !14
  br label %for.body129

for.body75:                                       ; preds = %for.body75.lr.ph, %for.body75
  %n.2389 = phi i32 [ 0, %for.body75.lr.ph ], [ %add124, %for.body75 ]
  %coeff_pos.2388 = phi i32 [ %coeff_pos.1.lcssa, %for.body75.lr.ph ], [ %inc118, %for.body75 ]
  %acc7.1387 = phi float [ %acc7.0.lcssa, %for.body75.lr.ph ], [ %62, %for.body75 ]
  %acc6.1386 = phi float [ %acc6.0.lcssa, %for.body75.lr.ph ], [ %59, %for.body75 ]
  %acc5.1385 = phi float [ %acc5.0.lcssa, %for.body75.lr.ph ], [ %56, %for.body75 ]
  %acc4.1384 = phi float [ %acc4.0.lcssa, %for.body75.lr.ph ], [ %53, %for.body75 ]
  %acc3.1383 = phi float [ %acc3.0.lcssa, %for.body75.lr.ph ], [ %50, %for.body75 ]
  %acc2.1382 = phi float [ %acc2.0.lcssa, %for.body75.lr.ph ], [ %47, %for.body75 ]
  %acc1.1381 = phi float [ %acc1.0.lcssa, %for.body75.lr.ph ], [ %44, %for.body75 ]
  %acc0.2380 = phi float [ %acc0.1.lcssa, %for.body75.lr.ph ], [ %41, %for.body75 ]
  %arrayidx78 = getelementptr inbounds float, ptr %33, i32 %coeff_pos.2388
  %39 = load float, ptr %arrayidx78, align 4, !tbaa !12
  %arrayidx80 = getelementptr inbounds float, ptr %2, i32 %n.2389
  %40 = load float, ptr %arrayidx80, align 4, !tbaa !12
  %41 = tail call float @llvm.fmuladd.f32(float %39, float %40, float %acc0.2380)
  %arrayidx83 = getelementptr float, ptr %arrayidx78, i32 1
  %42 = load float, ptr %arrayidx83, align 4, !tbaa !12
  %add85 = or disjoint i32 %n.2389, 1
  %arrayidx86 = getelementptr inbounds float, ptr %2, i32 %add85
  %43 = load float, ptr %arrayidx86, align 4, !tbaa !12
  %44 = tail call float @llvm.fmuladd.f32(float %42, float %43, float %acc1.1381)
  %arrayidx89 = getelementptr float, ptr %arrayidx78, i32 2
  %45 = load float, ptr %arrayidx89, align 4, !tbaa !12
  %add91 = or disjoint i32 %n.2389, 2
  %arrayidx92 = getelementptr inbounds float, ptr %2, i32 %add91
  %46 = load float, ptr %arrayidx92, align 4, !tbaa !12
  %47 = tail call float @llvm.fmuladd.f32(float %45, float %46, float %acc2.1382)
  %arrayidx95 = getelementptr float, ptr %arrayidx78, i32 3
  %48 = load float, ptr %arrayidx95, align 4, !tbaa !12
  %add97 = or disjoint i32 %n.2389, 3
  %arrayidx98 = getelementptr inbounds float, ptr %2, i32 %add97
  %49 = load float, ptr %arrayidx98, align 4, !tbaa !12
  %50 = tail call float @llvm.fmuladd.f32(float %48, float %49, float %acc3.1383)
  %arrayidx101 = getelementptr float, ptr %arrayidx78, i32 4
  %51 = load float, ptr %arrayidx101, align 4, !tbaa !12
  %add103 = or disjoint i32 %n.2389, 4
  %arrayidx104 = getelementptr inbounds float, ptr %2, i32 %add103
  %52 = load float, ptr %arrayidx104, align 4, !tbaa !12
  %53 = tail call float @llvm.fmuladd.f32(float %51, float %52, float %acc4.1384)
  %arrayidx107 = getelementptr float, ptr %arrayidx78, i32 5
  %54 = load float, ptr %arrayidx107, align 4, !tbaa !12
  %add109 = or disjoint i32 %n.2389, 5
  %arrayidx110 = getelementptr inbounds float, ptr %2, i32 %add109
  %55 = load float, ptr %arrayidx110, align 4, !tbaa !12
  %56 = tail call float @llvm.fmuladd.f32(float %54, float %55, float %acc5.1385)
  %arrayidx113 = getelementptr float, ptr %arrayidx78, i32 6
  %57 = load float, ptr %arrayidx113, align 4, !tbaa !12
  %add115 = or disjoint i32 %n.2389, 6
  %arrayidx116 = getelementptr inbounds float, ptr %2, i32 %add115
  %58 = load float, ptr %arrayidx116, align 4, !tbaa !12
  %59 = tail call float @llvm.fmuladd.f32(float %57, float %58, float %acc6.1386)
  %inc118 = add nuw nsw i32 %coeff_pos.2388, 8
  %arrayidx119 = getelementptr float, ptr %arrayidx78, i32 7
  %60 = load float, ptr %arrayidx119, align 4, !tbaa !12
  %add121 = or disjoint i32 %n.2389, 7
  %arrayidx122 = getelementptr inbounds float, ptr %2, i32 %add121
  %61 = load float, ptr %arrayidx122, align 4, !tbaa !12
  %62 = tail call float @llvm.fmuladd.f32(float %60, float %61, float %acc7.1387)
  %add124 = add nuw nsw i32 %n.2389, 8
  %cmp74 = icmp slt i32 %add124, %sub73
  br i1 %cmp74, label %for.body75, label %for.cond126.preheader, !llvm.loop !18

for.body129:                                      ; preds = %for.body129.lr.ph, %for.body129
  %n.3403 = phi i32 [ %n.2.lcssa, %for.body129.lr.ph ], [ %inc136, %for.body129 ]
  %coeff_pos.3402 = phi i32 [ %coeff_pos.2.lcssa, %for.body129.lr.ph ], [ %inc131, %for.body129 ]
  %acc0.3401 = phi float [ %acc0.2.lcssa, %for.body129.lr.ph ], [ %65, %for.body129 ]
  %inc131 = add nuw nsw i32 %coeff_pos.3402, 1
  %arrayidx132 = getelementptr inbounds float, ptr %38, i32 %coeff_pos.3402
  %63 = load float, ptr %arrayidx132, align 4, !tbaa !12
  %arrayidx134 = getelementptr inbounds float, ptr %2, i32 %n.3403
  %64 = load float, ptr %arrayidx134, align 4, !tbaa !12
  %65 = tail call float @llvm.fmuladd.f32(float %63, float %64, float %acc0.3401)
  %inc136 = add nuw nsw i32 %n.3403, 1
  %exitcond429.not = icmp eq i32 %inc136, %spec.store.select
  br i1 %exitcond429.not, label %for.end137, label %for.body129, !llvm.loop !19

for.end137:                                       ; preds = %for.body129, %for.cond126.preheader
  %acc0.3.lcssa = phi float [ %acc0.2.lcssa, %for.cond126.preheader ], [ %65, %for.body129 ]
  %add138 = fadd float %acc1.1.lcssa, %acc0.3.lcssa
  %add139 = fadd float %acc2.1.lcssa, %add138
  %add140 = fadd float %acc3.1.lcssa, %add139
  %add141 = fadd float %acc4.1.lcssa, %add140
  %add142 = fadd float %acc5.1.lcssa, %add141
  %add143 = fadd float %acc6.1.lcssa, %add142
  %add144 = fadd float %acc7.1.lcssa, %add143
  %arrayidx145 = getelementptr inbounds float, ptr %output, i32 %i.0405
  store float %add144, ptr %arrayidx145, align 4, !tbaa !12
  %inc147 = add nuw nsw i32 %i.0405, 1
  %exitcond430.not = icmp eq i32 %inc147, %len
  br i1 %exitcond430.not, label %if.end200.loopexit, label %for.body, !llvm.loop !20

for.body153:                                      ; preds = %for.body153.lr.ph, %for.cond.cleanup186
  %spec.store.select337351 = phi i32 [ %pos157.promoted, %for.body153.lr.ph ], [ %spec.store.select337, %for.cond.cleanup186 ]
  %i149.0350 = phi i32 [ 0, %for.body153.lr.ph ], [ %inc198, %for.cond.cleanup186 ]
  %arrayidx155 = getelementptr inbounds float, ptr %input, i32 %i149.0350
  %66 = load float, ptr %arrayidx155, align 4, !tbaa !12
  %arrayidx158 = getelementptr inbounds float, ptr %0, i32 %spec.store.select337351
  store float %66, ptr %arrayidx158, align 4, !tbaa !12
  %inc160 = add nsw i32 %spec.store.select337351, 1
  %cmp163.not = icmp slt i32 %inc160, %1
  %spec.store.select337 = select i1 %cmp163.not, i32 %inc160, i32 0
  %cmp171339 = icmp slt i32 %spec.store.select337, %1
  br i1 %cmp171339, label %for.body173.lr.ph, label %for.cond183.preheader

for.body173.lr.ph:                                ; preds = %for.body153
  %67 = load ptr, ptr %fir, align 4, !tbaa !14
  %68 = sub i32 %1, %spec.store.select337
  br label %for.body173

for.cond183.preheader:                            ; preds = %for.body173, %for.body153
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.body153 ], [ %72, %for.body173 ]
  %coeff_pos154.0.lcssa = phi i32 [ 0, %for.body153 ], [ %68, %for.body173 ]
  %cmp185344 = icmp sgt i32 %spec.store.select337, 0
  br i1 %cmp185344, label %for.body187.lr.ph, label %for.cond.cleanup186

for.body187.lr.ph:                                ; preds = %for.cond183.preheader
  %69 = load ptr, ptr %fir, align 4, !tbaa !14
  br label %for.body187

for.body173:                                      ; preds = %for.body173.lr.ph, %for.body173
  %n167.0342 = phi i32 [ %spec.store.select337, %for.body173.lr.ph ], [ %inc180, %for.body173 ]
  %coeff_pos154.0341 = phi i32 [ 0, %for.body173.lr.ph ], [ %inc175, %for.body173 ]
  %acc.0340 = phi float [ 0.000000e+00, %for.body173.lr.ph ], [ %72, %for.body173 ]
  %inc175 = add nuw i32 %coeff_pos154.0341, 1
  %arrayidx176 = getelementptr inbounds float, ptr %67, i32 %coeff_pos154.0341
  %70 = load float, ptr %arrayidx176, align 4, !tbaa !12
  %arrayidx178 = getelementptr inbounds float, ptr %0, i32 %n167.0342
  %71 = load float, ptr %arrayidx178, align 4, !tbaa !12
  %72 = tail call float @llvm.fmuladd.f32(float %70, float %71, float %acc.0340)
  %inc180 = add nsw i32 %n167.0342, 1
  %exitcond.not = icmp eq i32 %inc175, %68
  br i1 %exitcond.not, label %for.cond183.preheader, label %for.body173, !llvm.loop !21

for.cond.cleanup186:                              ; preds = %for.body187, %for.cond183.preheader
  %acc.1.lcssa = phi float [ %acc.0.lcssa, %for.cond183.preheader ], [ %75, %for.body187 ]
  %arrayidx196 = getelementptr inbounds float, ptr %output, i32 %i149.0350
  store float %acc.1.lcssa, ptr %arrayidx196, align 4, !tbaa !12
  %inc198 = add nuw nsw i32 %i149.0350, 1
  %exitcond427.not = icmp eq i32 %inc198, %len
  br i1 %exitcond427.not, label %for.cond150.if.end200.loopexit338_crit_edge, label %for.body153, !llvm.loop !22

for.body187:                                      ; preds = %for.body187.lr.ph, %for.body187
  %n182.0347 = phi i32 [ 0, %for.body187.lr.ph ], [ %inc194, %for.body187 ]
  %coeff_pos154.1346 = phi i32 [ %coeff_pos154.0.lcssa, %for.body187.lr.ph ], [ %inc189, %for.body187 ]
  %acc.1345 = phi float [ %acc.0.lcssa, %for.body187.lr.ph ], [ %75, %for.body187 ]
  %inc189 = add nuw nsw i32 %coeff_pos154.1346, 1
  %arrayidx190 = getelementptr inbounds float, ptr %69, i32 %coeff_pos154.1346
  %73 = load float, ptr %arrayidx190, align 4, !tbaa !12
  %arrayidx192 = getelementptr inbounds float, ptr %0, i32 %n182.0347
  %74 = load float, ptr %arrayidx192, align 4, !tbaa !12
  %75 = tail call float @llvm.fmuladd.f32(float %73, float %74, float %acc.1345)
  %inc194 = add nuw nsw i32 %n182.0347, 1
  %exitcond426.not = icmp eq i32 %inc194, %spec.store.select337
  br i1 %exitcond426.not, label %for.cond.cleanup186, label %for.body187, !llvm.loop !23

if.end200.loopexit:                               ; preds = %for.end137
  store i32 %spec.store.select, ptr %pos, align 4
  br label %if.end200

for.cond150.if.end200.loopexit338_crit_edge:      ; preds = %for.cond.cleanup186
  store i32 %spec.store.select337, ptr %pos157, align 4
  br label %if.end200

if.end200:                                        ; preds = %for.cond150.preheader, %for.cond150.if.end200.loopexit338_crit_edge, %if.end200.loopexit
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333)"}
!4 = !{!5, !6, i64 4}
!5 = !{!"fir_f32_s", !6, i64 0, !6, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !10, i64 20}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"short", !7, i64 0}
!11 = !{!5, !9, i64 8}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !7, i64 0}
!14 = !{!5, !6, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !16}
!20 = distinct !{!20, !16}
!21 = distinct !{!21, !16}
!22 = distinct !{!22, !16}
!23 = distinct !{!23, !16}
