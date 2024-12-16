; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_fird_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fird_f32_ansi(ptr noalias nocapture noundef %fir, ptr noalias nocapture noundef readonly %input, ptr noalias nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp77 = icmp sgt i32 %len, 0
  br i1 %cmp77, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %decim = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 4
  %0 = load i32, ptr %decim, align 4, !tbaa !4
  %cmp263 = icmp sgt i32 %0, 0
  %delay = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %pos = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %1 = load i32, ptr %N, align 4, !tbaa !11
  %pos9.promoted = load i32, ptr %pos, align 4, !tbaa !12
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end141, %for.cond1.preheader.lr.ph
  %2 = phi i32 [ %pos9.promoted, %for.cond1.preheader.lr.ph ], [ %4, %for.end141 ]
  %i.080 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc152, %for.end141 ]
  %input.addr.078 = phi ptr [ %input, %for.cond1.preheader.lr.ph ], [ %input.addr.1.lcssa, %for.end141 ]
  br i1 %cmp263, label %for.body4.lr.ph, label %for.cond.cleanup3

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  %3 = load ptr, ptr %delay, align 4, !tbaa !13
  br label %for.body4

for.cond.cleanup:                                 ; preds = %for.end141, %entry
  %result.0.lcssa = phi i32 [ 0, %entry ], [ %len, %for.end141 ]
  ret i32 %result.0.lcssa

for.cond1.for.cond.cleanup3_crit_edge:            ; preds = %for.body4
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr, %for.body4 ]
  %spec.select.lcssa = phi i32 [ %spec.select, %for.body4 ]
  store i32 %spec.select.lcssa, ptr %pos, align 4, !tbaa !12
  br label %for.cond.cleanup3

for.cond.cleanup3:                                ; preds = %for.cond1.for.cond.cleanup3_crit_edge, %for.cond1.preheader
  %4 = phi i32 [ %spec.select.lcssa, %for.cond1.for.cond.cleanup3_crit_edge ], [ %2, %for.cond1.preheader ]
  %input.addr.1.lcssa = phi ptr [ %incdec.ptr.lcssa, %for.cond1.for.cond.cleanup3_crit_edge ], [ %input.addr.078, %for.cond1.preheader ]
  %add269 = add nsw i32 %4, 8
  %cmp1266 = icmp sgt i32 %add269, %1
  br i1 %cmp1266, label %for.cond63.preheader, label %for.body14.lr.ph

for.body14.lr.ph:                                 ; preds = %for.cond.cleanup3
  %5 = load ptr, ptr %fir, align 4, !tbaa !14
  %6 = load ptr, ptr %delay, align 4, !tbaa !13
  %scevgep = getelementptr i8, ptr %6, i32 28
  %7 = shl i32 %4, 2
  %scevgep79 = getelementptr i8, ptr %scevgep, i32 %7
  %scevgep83 = getelementptr i8, ptr %6, i32 24
  %scevgep84 = getelementptr i8, ptr %scevgep83, i32 %7
  %scevgep86 = getelementptr i8, ptr %6, i32 20
  %scevgep87 = getelementptr i8, ptr %scevgep86, i32 %7
  %scevgep89 = getelementptr i8, ptr %6, i32 16
  %scevgep90 = getelementptr i8, ptr %scevgep89, i32 %7
  %scevgep92 = getelementptr i8, ptr %6, i32 12
  %scevgep93 = getelementptr i8, ptr %scevgep92, i32 %7
  %scevgep95 = getelementptr i8, ptr %6, i32 8
  %scevgep96 = getelementptr i8, ptr %scevgep95, i32 %7
  %scevgep98 = getelementptr i8, ptr %6, i32 4
  %scevgep99 = getelementptr i8, ptr %scevgep98, i32 %7
  %scevgep101 = getelementptr i8, ptr %6, i32 %7
  %scevgep103 = getelementptr i8, ptr %5, i32 24
  %scevgep105 = getelementptr i8, ptr %5, i32 20
  %scevgep107 = getelementptr i8, ptr %5, i32 16
  %scevgep109 = getelementptr i8, ptr %5, i32 12
  %scevgep111 = getelementptr i8, ptr %5, i32 8
  %scevgep113 = getelementptr i8, ptr %5, i32 4
  %scevgep115 = getelementptr i8, ptr %5, i32 28
  br label %for.body14.7

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph
  %lsr.iv = phi i32 [ %lsr.iv.next, %for.body4 ], [ %0, %for.body4.lr.ph ]
  %8 = phi i32 [ %2, %for.body4.lr.ph ], [ %spec.select, %for.body4 ]
  %input.addr.164 = phi ptr [ %input.addr.078, %for.body4.lr.ph ], [ %incdec.ptr, %for.body4 ]
  %incdec.ptr = getelementptr inbounds float, ptr %input.addr.164, i32 1
  %9 = load float, ptr %input.addr.164, align 4, !tbaa !15
  %inc = add nsw i32 %8, 1
  %arrayidx = getelementptr inbounds float, ptr %3, i32 %8
  store float %9, ptr %arrayidx, align 4, !tbaa !15
  %cmp6.not = icmp slt i32 %inc, %1
  %spec.select = select i1 %cmp6.not, i32 %inc, i32 0
  %lsr.iv.next = add i32 %lsr.iv, -1
  %exitcond.not = icmp eq i32 %lsr.iv.next, 0
  br i1 %exitcond.not, label %for.cond1.for.cond.cleanup3_crit_edge, label %for.body4, !llvm.loop !17

for.cond63.preheader:                             ; preds = %for.body14.7, %for.cond.cleanup3
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %18, %for.body14.7 ]
  %acc.1.lcssa2 = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %21, %for.body14.7 ]
  %acc.2.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %24, %for.body14.7 ]
  %acc.3.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %27, %for.body14.7 ]
  %acc.4.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %30, %for.body14.7 ]
  %acc.5.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %33, %for.body14.7 ]
  %acc.6.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %36, %for.body14.7 ]
  %acc.7.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %39, %for.body14.7 ]
  %coeff_pos.0.lcssa = phi i32 [ 0, %for.cond.cleanup3 ], [ %inc15.7, %for.body14.7 ]
  %n.0.lcssa = phi i32 [ %4, %for.cond.cleanup3 ], [ %lsr.iv.next78, %for.body14.7 ]
  %cmp2572 = icmp slt i32 %n.0.lcssa, %1
  br i1 %cmp2572, label %for.body27.lr.ph, label %for.cond.cleanup26

for.body27.lr.ph:                                 ; preds = %for.cond63.preheader
  %10 = load ptr, ptr %fir, align 4, !tbaa !14
  %11 = load ptr, ptr %delay, align 4, !tbaa !13
  %12 = add i32 %coeff_pos.0.lcssa, %1
  %13 = sub i32 %1, %n.0.lcssa
  %14 = shl i32 %n.0.lcssa, 2
  %scevgep120 = getelementptr i8, ptr %11, i32 %14
  %15 = shl i32 %coeff_pos.0.lcssa, 2
  %scevgep123 = getelementptr i8, ptr %10, i32 %15
  br label %for.body14.clone

for.body14.7:                                     ; preds = %for.body14.lr.ph, %for.body14.7
  %lsr.iv80 = phi i32 [ 0, %for.body14.lr.ph ], [ %lsr.iv.next81, %for.body14.7 ]
  %lsr.iv77 = phi i32 [ %4, %for.body14.lr.ph ], [ %lsr.iv.next78, %for.body14.7 ]
  %coeff_pos.068 = phi i32 [ 0, %for.body14.lr.ph ], [ %inc15.7, %for.body14.7 ]
  %acc = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %18, %for.body14.7 ]
  %acc3 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %21, %for.body14.7 ]
  %acc4 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %24, %for.body14.7 ]
  %acc5 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %27, %for.body14.7 ]
  %acc6 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %30, %for.body14.7 ]
  %acc7 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %33, %for.body14.7 ]
  %acc8 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %36, %for.body14.7 ]
  %acc9 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %39, %for.body14.7 ]
  %scevgep117 = getelementptr i8, ptr %5, i32 %lsr.iv80
  %16 = load float, ptr %scevgep117, align 4, !tbaa !15
  %scevgep102 = getelementptr i8, ptr %scevgep101, i32 %lsr.iv80
  %17 = load float, ptr %scevgep102, align 4, !tbaa !15
  %18 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %acc)
  %scevgep114 = getelementptr i8, ptr %scevgep113, i32 %lsr.iv80
  %19 = load float, ptr %scevgep114, align 4, !tbaa !15
  %scevgep100 = getelementptr i8, ptr %scevgep99, i32 %lsr.iv80
  %20 = load float, ptr %scevgep100, align 4, !tbaa !15
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %acc3)
  %scevgep112 = getelementptr i8, ptr %scevgep111, i32 %lsr.iv80
  %22 = load float, ptr %scevgep112, align 4, !tbaa !15
  %scevgep97 = getelementptr i8, ptr %scevgep96, i32 %lsr.iv80
  %23 = load float, ptr %scevgep97, align 4, !tbaa !15
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %acc4)
  %scevgep110 = getelementptr i8, ptr %scevgep109, i32 %lsr.iv80
  %25 = load float, ptr %scevgep110, align 4, !tbaa !15
  %scevgep94 = getelementptr i8, ptr %scevgep93, i32 %lsr.iv80
  %26 = load float, ptr %scevgep94, align 4, !tbaa !15
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %acc5)
  %scevgep108 = getelementptr i8, ptr %scevgep107, i32 %lsr.iv80
  %28 = load float, ptr %scevgep108, align 4, !tbaa !15
  %scevgep91 = getelementptr i8, ptr %scevgep90, i32 %lsr.iv80
  %29 = load float, ptr %scevgep91, align 4, !tbaa !15
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float %acc6)
  %scevgep106 = getelementptr i8, ptr %scevgep105, i32 %lsr.iv80
  %31 = load float, ptr %scevgep106, align 4, !tbaa !15
  %scevgep88 = getelementptr i8, ptr %scevgep87, i32 %lsr.iv80
  %32 = load float, ptr %scevgep88, align 4, !tbaa !15
  %33 = tail call float @llvm.fmuladd.f32(float %31, float %32, float %acc7)
  %scevgep104 = getelementptr i8, ptr %scevgep103, i32 %lsr.iv80
  %34 = load float, ptr %scevgep104, align 4, !tbaa !15
  %scevgep85 = getelementptr i8, ptr %scevgep84, i32 %lsr.iv80
  %35 = load float, ptr %scevgep85, align 4, !tbaa !15
  %36 = tail call float @llvm.fmuladd.f32(float %34, float %35, float %acc8)
  %inc15.7 = add i32 %coeff_pos.068, 8
  %scevgep116 = getelementptr i8, ptr %scevgep115, i32 %lsr.iv80
  %37 = load float, ptr %scevgep116, align 4, !tbaa !15
  %scevgep82 = getelementptr i8, ptr %scevgep79, i32 %lsr.iv80
  %38 = load float, ptr %scevgep82, align 4, !tbaa !15
  %39 = tail call float @llvm.fmuladd.f32(float %37, float %38, float %acc9)
  %lsr.iv.next78 = add nsw i32 %lsr.iv77, 8
  %40 = add i32 %lsr.iv.next78, 8
  %lsr.iv.next81 = add i32 %lsr.iv80, 32
  %exitcond83.not.7 = icmp sgt i32 %40, %1
  br i1 %exitcond83.not.7, label %for.cond63.preheader, label %for.body14.7, !llvm.loop !19

for.body79.lr.ph:                                 ; preds = %for.cond.cleanup26
  %41 = load ptr, ptr %fir, align 4, !tbaa !14
  %42 = load ptr, ptr %delay, align 4, !tbaa !13
  %43 = and i32 %4, 2147483640
  %scevgep126 = getelementptr i8, ptr %42, i32 28
  %scevgep130 = getelementptr i8, ptr %42, i32 24
  %scevgep132 = getelementptr i8, ptr %42, i32 20
  %scevgep134 = getelementptr i8, ptr %42, i32 16
  %scevgep136 = getelementptr i8, ptr %42, i32 12
  %scevgep138 = getelementptr i8, ptr %42, i32 8
  %scevgep140 = getelementptr i8, ptr %42, i32 4
  %scevgep145 = getelementptr i8, ptr %41, i32 28
  %44 = shl i32 %coeff_pos.1.lcssa, 2
  %scevgep146 = getelementptr i8, ptr %scevgep145, i32 %44
  %scevgep148 = getelementptr i8, ptr %41, i32 24
  %scevgep149 = getelementptr i8, ptr %scevgep148, i32 %44
  %scevgep151 = getelementptr i8, ptr %41, i32 20
  %scevgep152 = getelementptr i8, ptr %scevgep151, i32 %44
  %scevgep154 = getelementptr i8, ptr %41, i32 16
  %scevgep155 = getelementptr i8, ptr %scevgep154, i32 %44
  %scevgep157 = getelementptr i8, ptr %41, i32 12
  %scevgep158 = getelementptr i8, ptr %scevgep157, i32 %44
  %scevgep160 = getelementptr i8, ptr %41, i32 8
  %scevgep161 = getelementptr i8, ptr %scevgep160, i32 %44
  %scevgep163 = getelementptr i8, ptr %41, i32 4
  %scevgep164 = getelementptr i8, ptr %scevgep163, i32 %44
  %scevgep166 = getelementptr i8, ptr %41, i32 %44
  br label %for.body27.7

for.body14.clone:                                 ; preds = %for.body14.clone, %for.body27.lr.ph
  %lsr.iv124 = phi ptr [ %scevgep125, %for.body14.clone ], [ %scevgep123, %for.body27.lr.ph ]
  %lsr.iv121 = phi ptr [ %scevgep122, %for.body14.clone ], [ %scevgep120, %for.body27.lr.ph ]
  %lsr.iv118 = phi i32 [ %lsr.iv.next119, %for.body14.clone ], [ %13, %for.body27.lr.ph ]
  %acc.067.clone = phi float [ %acc.0.lcssa, %for.body27.lr.ph ], [ %47, %for.body14.clone ]
  %45 = load float, ptr %lsr.iv124, align 4, !tbaa !15
  %46 = load float, ptr %lsr.iv121, align 4, !tbaa !15
  %47 = tail call float @llvm.fmuladd.f32(float %45, float %46, float %acc.067.clone)
  %lsr.iv.next119 = add i32 %lsr.iv118, -1
  %scevgep122 = getelementptr i8, ptr %lsr.iv121, i32 4
  %scevgep125 = getelementptr i8, ptr %lsr.iv124, i32 4
  %exitcond83.not.clone = icmp eq i32 %lsr.iv.next119, 0
  br i1 %exitcond83.not.clone, label %for.cond.cleanup26.loopexit, label %for.body14.clone, !llvm.loop !19

for.cond130.preheader:                            ; preds = %for.body27.7, %for.cond.cleanup26
  %acc.0.lcssa.clone = phi float [ %acc.1.lcssa, %for.cond.cleanup26 ], [ %51, %for.body27.7 ]
  %acc.1.lcssa2.clone = phi float [ %acc.1.lcssa2, %for.cond.cleanup26 ], [ %54, %for.body27.7 ]
  %acc.2.lcssa.clone = phi float [ %acc.2.lcssa, %for.cond.cleanup26 ], [ %57, %for.body27.7 ]
  %acc.3.lcssa.clone = phi float [ %acc.3.lcssa, %for.cond.cleanup26 ], [ %60, %for.body27.7 ]
  %acc.4.lcssa.clone = phi float [ %acc.4.lcssa, %for.cond.cleanup26 ], [ %63, %for.body27.7 ]
  %acc.5.lcssa.clone = phi float [ %acc.5.lcssa, %for.cond.cleanup26 ], [ %66, %for.body27.7 ]
  %acc.6.lcssa.clone = phi float [ %acc.6.lcssa, %for.cond.cleanup26 ], [ %69, %for.body27.7 ]
  %acc.7.lcssa.clone = phi float [ %acc.7.lcssa, %for.cond.cleanup26 ], [ %72, %for.body27.7 ]
  %coeff_pos.0.lcssa.clone = phi i32 [ %coeff_pos.1.lcssa, %for.cond.cleanup26 ], [ %lsr.iv.next144, %for.body27.7 ]
  %n.0.lcssa.clone = phi i32 [ 0, %for.cond.cleanup26 ], [ %43, %for.body27.7 ]
  %cmp2572.clone = icmp slt i32 %n.0.lcssa.clone, %4
  br i1 %cmp2572.clone, label %for.body133.lr.ph, label %for.end141

for.cond.cleanup26.loopexit:                      ; preds = %for.body14.clone
  %.lcssa183 = phi float [ %47, %for.body14.clone ]
  %n.0.lcssa.neg = sub i32 0, %n.0.lcssa
  %48 = add i32 %12, %n.0.lcssa.neg
  br label %for.cond.cleanup26

for.cond.cleanup26:                               ; preds = %for.cond.cleanup26.loopexit, %for.cond63.preheader
  %coeff_pos.1.lcssa = phi i32 [ %coeff_pos.0.lcssa, %for.cond63.preheader ], [ %48, %for.cond.cleanup26.loopexit ]
  %acc.1.lcssa = phi float [ %acc.0.lcssa, %for.cond63.preheader ], [ %.lcssa183, %for.cond.cleanup26.loopexit ]
  %exitcond85.not = icmp slt i32 %4, 8
  br i1 %exitcond85.not, label %for.cond130.preheader, label %for.body79.lr.ph, !llvm.loop !20

for.body27.7:                                     ; preds = %for.body79.lr.ph, %for.body27.7
  %lsr.iv143 = phi i32 [ %coeff_pos.1.lcssa, %for.body79.lr.ph ], [ %lsr.iv.next144, %for.body27.7 ]
  %lsr.iv127 = phi i32 [ 0, %for.body79.lr.ph ], [ %lsr.iv.next128, %for.body27.7 ]
  %add76310 = phi i32 [ 8, %for.body79.lr.ph ], [ %add76, %for.body27.7 ]
  %acc20 = phi float [ %acc.1.lcssa, %for.body79.lr.ph ], [ %51, %for.body27.7 ]
  %acc21 = phi float [ %acc.1.lcssa2, %for.body79.lr.ph ], [ %54, %for.body27.7 ]
  %acc22 = phi float [ %acc.2.lcssa, %for.body79.lr.ph ], [ %57, %for.body27.7 ]
  %acc23 = phi float [ %acc.3.lcssa, %for.body79.lr.ph ], [ %60, %for.body27.7 ]
  %acc24 = phi float [ %acc.4.lcssa, %for.body79.lr.ph ], [ %63, %for.body27.7 ]
  %acc25 = phi float [ %acc.5.lcssa, %for.body79.lr.ph ], [ %66, %for.body27.7 ]
  %acc26 = phi float [ %acc.6.lcssa, %for.body79.lr.ph ], [ %69, %for.body27.7 ]
  %acc27 = phi float [ %acc.7.lcssa, %for.body79.lr.ph ], [ %72, %for.body27.7 ]
  %scevgep167 = getelementptr i8, ptr %scevgep166, i32 %lsr.iv127
  %49 = load float, ptr %scevgep167, align 4, !tbaa !15
  %scevgep142 = getelementptr i8, ptr %42, i32 %lsr.iv127
  %50 = load float, ptr %scevgep142, align 4, !tbaa !15
  %51 = tail call float @llvm.fmuladd.f32(float %49, float %50, float %acc20)
  %scevgep165 = getelementptr i8, ptr %scevgep164, i32 %lsr.iv127
  %52 = load float, ptr %scevgep165, align 4, !tbaa !15
  %scevgep141 = getelementptr i8, ptr %scevgep140, i32 %lsr.iv127
  %53 = load float, ptr %scevgep141, align 4, !tbaa !15
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %acc21)
  %scevgep162 = getelementptr i8, ptr %scevgep161, i32 %lsr.iv127
  %55 = load float, ptr %scevgep162, align 4, !tbaa !15
  %scevgep139 = getelementptr i8, ptr %scevgep138, i32 %lsr.iv127
  %56 = load float, ptr %scevgep139, align 4, !tbaa !15
  %57 = tail call float @llvm.fmuladd.f32(float %55, float %56, float %acc22)
  %scevgep159 = getelementptr i8, ptr %scevgep158, i32 %lsr.iv127
  %58 = load float, ptr %scevgep159, align 4, !tbaa !15
  %scevgep137 = getelementptr i8, ptr %scevgep136, i32 %lsr.iv127
  %59 = load float, ptr %scevgep137, align 4, !tbaa !15
  %60 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %acc23)
  %scevgep156 = getelementptr i8, ptr %scevgep155, i32 %lsr.iv127
  %61 = load float, ptr %scevgep156, align 4, !tbaa !15
  %scevgep135 = getelementptr i8, ptr %scevgep134, i32 %lsr.iv127
  %62 = load float, ptr %scevgep135, align 4, !tbaa !15
  %63 = tail call float @llvm.fmuladd.f32(float %61, float %62, float %acc24)
  %scevgep153 = getelementptr i8, ptr %scevgep152, i32 %lsr.iv127
  %64 = load float, ptr %scevgep153, align 4, !tbaa !15
  %scevgep133 = getelementptr i8, ptr %scevgep132, i32 %lsr.iv127
  %65 = load float, ptr %scevgep133, align 4, !tbaa !15
  %66 = tail call float @llvm.fmuladd.f32(float %64, float %65, float %acc25)
  %scevgep150 = getelementptr i8, ptr %scevgep149, i32 %lsr.iv127
  %67 = load float, ptr %scevgep150, align 4, !tbaa !15
  %scevgep131 = getelementptr i8, ptr %scevgep130, i32 %lsr.iv127
  %68 = load float, ptr %scevgep131, align 4, !tbaa !15
  %69 = tail call float @llvm.fmuladd.f32(float %67, float %68, float %acc26)
  %scevgep147 = getelementptr i8, ptr %scevgep146, i32 %lsr.iv127
  %70 = load float, ptr %scevgep147, align 4, !tbaa !15
  %scevgep129 = getelementptr i8, ptr %scevgep126, i32 %lsr.iv127
  %71 = load float, ptr %scevgep129, align 4, !tbaa !15
  %72 = tail call float @llvm.fmuladd.f32(float %70, float %71, float %acc27)
  %add76 = add nuw nsw i32 %add76310, 8
  %lsr.iv.next128 = add nuw i32 %lsr.iv127, 32
  %lsr.iv.next144 = add i32 %lsr.iv143, 8
  %exitcond84.not.7 = icmp sgt i32 %add76, %4
  br i1 %exitcond84.not.7, label %for.cond130.preheader, label %for.body27.7, !llvm.loop !21

for.body133.lr.ph:                                ; preds = %for.cond130.preheader
  %73 = load ptr, ptr %fir, align 4, !tbaa !14
  %74 = load ptr, ptr %delay, align 4, !tbaa !13
  %75 = sub i32 %4, %n.0.lcssa.clone
  %76 = shl i32 %n.0.lcssa.clone, 2
  %scevgep170 = getelementptr i8, ptr %74, i32 %76
  %77 = shl i32 %coeff_pos.0.lcssa.clone, 2
  %scevgep173 = getelementptr i8, ptr %73, i32 %77
  br label %for.body27.clone

for.body27.clone:                                 ; preds = %for.body27.clone, %for.body133.lr.ph
  %lsr.iv174 = phi ptr [ %scevgep175, %for.body27.clone ], [ %scevgep173, %for.body133.lr.ph ]
  %lsr.iv171 = phi ptr [ %scevgep172, %for.body27.clone ], [ %scevgep170, %for.body133.lr.ph ]
  %lsr.iv168 = phi i32 [ %lsr.iv.next169, %for.body27.clone ], [ %75, %for.body133.lr.ph ]
  %acc.173.clone = phi float [ %acc.0.lcssa.clone, %for.body133.lr.ph ], [ %80, %for.body27.clone ]
  %78 = load float, ptr %lsr.iv174, align 4, !tbaa !15
  %79 = load float, ptr %lsr.iv171, align 4, !tbaa !15
  %80 = tail call float @llvm.fmuladd.f32(float %78, float %79, float %acc.173.clone)
  %lsr.iv.next169 = add i32 %lsr.iv168, -1
  %scevgep172 = getelementptr i8, ptr %lsr.iv171, i32 4
  %scevgep175 = getelementptr i8, ptr %lsr.iv174, i32 4
  %exitcond84.not.clone = icmp eq i32 %lsr.iv.next169, 0
  br i1 %exitcond84.not.clone, label %for.end141, label %for.body27.clone, !llvm.loop !21

for.end141:                                       ; preds = %for.body27.clone, %for.cond130.preheader
  %acc0.3.lcssa = phi float [ %acc.0.lcssa.clone, %for.cond130.preheader ], [ %80, %for.body27.clone ]
  %add60 = fadd float %acc.1.lcssa2.clone, %acc0.3.lcssa
  %add61 = fadd float %acc.2.lcssa.clone, %acc.3.lcssa.clone
  %add62 = fadd float %acc.4.lcssa.clone, %acc.5.lcssa.clone
  %add63 = fadd float %acc.6.lcssa.clone, %acc.7.lcssa.clone
  %add64 = fadd float %add61, %add60
  %add65 = fadd float %add62, %add63
  %add66 = fadd float %add65, %add64
  %arrayidx37 = getelementptr inbounds float, ptr %output, i32 %i.080
  store float %add66, ptr %arrayidx37, align 4, !tbaa !15
  %inc152 = add nuw nsw i32 %i.080, 1
  %exitcond350.not = icmp eq i32 %inc152, %len
  br i1 %exitcond350.not, label %for.cond.cleanup, label %for.cond1.preheader
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197)"}
!4 = !{!5, !9, i64 16}
!5 = !{!"fir_f32_s", !6, i64 0, !6, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !10, i64 20}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"short", !7, i64 0}
!11 = !{!5, !9, i64 8}
!12 = !{!5, !9, i64 12}
!13 = !{!5, !6, i64 4}
!14 = !{!5, !6, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !7, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = distinct !{!19, !18}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
