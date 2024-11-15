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
  store i32 %spec.select, ptr %pos, align 4, !tbaa !12
  br label %for.cond.cleanup3

for.cond.cleanup3:                                ; preds = %for.cond1.for.cond.cleanup3_crit_edge, %for.cond1.preheader
  %4 = phi i32 [ %spec.select, %for.cond1.for.cond.cleanup3_crit_edge ], [ %2, %for.cond1.preheader ]
  %input.addr.1.lcssa = phi ptr [ %incdec.ptr, %for.cond1.for.cond.cleanup3_crit_edge ], [ %input.addr.078, %for.cond1.preheader ]
  %add269 = add nsw i32 %4, 8
  %cmp1266 = icmp sgt i32 %add269, %1
  br i1 %cmp1266, label %for.cond63.preheader, label %for.body14.lr.ph

for.body14.lr.ph:                                 ; preds = %for.cond.cleanup3
  %5 = load ptr, ptr %fir, align 4, !tbaa !14
  %6 = load ptr, ptr %delay, align 4, !tbaa !13
  br label %for.body14.7

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph
  %7 = phi i32 [ %2, %for.body4.lr.ph ], [ %spec.select, %for.body4 ]
  %k.065 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc8, %for.body4 ]
  %input.addr.164 = phi ptr [ %input.addr.078, %for.body4.lr.ph ], [ %incdec.ptr, %for.body4 ]
  %incdec.ptr = getelementptr inbounds float, ptr %input.addr.164, i32 1
  %8 = load float, ptr %input.addr.164, align 4, !tbaa !15
  %inc = add nsw i32 %7, 1
  %arrayidx = getelementptr inbounds float, ptr %3, i32 %7
  store float %8, ptr %arrayidx, align 4, !tbaa !15
  %cmp6.not = icmp slt i32 %inc, %1
  %spec.select = select i1 %cmp6.not, i32 %inc, i32 0
  %inc8 = add nuw nsw i32 %k.065, 1
  %exitcond.not = icmp eq i32 %inc8, %0
  br i1 %exitcond.not, label %for.cond1.for.cond.cleanup3_crit_edge, label %for.body4, !llvm.loop !17

for.cond63.preheader:                             ; preds = %for.body14.7, %for.cond.cleanup3
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %28, %for.body14.7 ]
  %acc.1.lcssa2 = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %29, %for.body14.7 ]
  %acc.2.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %30, %for.body14.7 ]
  %acc.3.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %31, %for.body14.7 ]
  %acc.4.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %32, %for.body14.7 ]
  %acc.5.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %33, %for.body14.7 ]
  %acc.6.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %34, %for.body14.7 ]
  %acc.7.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %35, %for.body14.7 ]
  %coeff_pos.0.lcssa = phi i32 [ 0, %for.cond.cleanup3 ], [ 8, %for.body14.7 ]
  %n.0.lcssa = phi i32 [ %4, %for.cond.cleanup3 ], [ %add281, %for.body14.7 ]
  %cmp2572 = icmp slt i32 %n.0.lcssa, %1
  br i1 %cmp2572, label %for.body27.lr.ph, label %for.cond.cleanup26

for.body27.lr.ph:                                 ; preds = %for.cond63.preheader
  %9 = load ptr, ptr %fir, align 4, !tbaa !14
  %10 = load ptr, ptr %delay, align 4, !tbaa !13
  %11 = add i32 %1, %coeff_pos.0.lcssa
  br label %for.body14.clone

for.body14.7:                                     ; preds = %for.body14.lr.ph, %for.body14.7
  %add281 = phi i32 [ %add269, %for.body14.lr.ph ], [ %inc20.7, %for.body14.7 ]
  %n.069 = phi i32 [ %4, %for.body14.lr.ph ], [ %add281, %for.body14.7 ]
  %coeff_pos.068 = phi i32 [ 0, %for.body14.lr.ph ], [ 8, %for.body14.7 ]
  %acc = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %28, %for.body14.7 ]
  %acc3 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %29, %for.body14.7 ]
  %acc4 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %30, %for.body14.7 ]
  %acc5 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %31, %for.body14.7 ]
  %acc6 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %32, %for.body14.7 ]
  %acc7 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %33, %for.body14.7 ]
  %acc8 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %34, %for.body14.7 ]
  %acc9 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %35, %for.body14.7 ]
  %inc20.7 = add nsw i32 %add281, 8
  %add = or disjoint i32 %coeff_pos.068, 1
  %add13 = or disjoint i32 %coeff_pos.068, 2
  %add17 = or disjoint i32 %coeff_pos.068, 3
  %add21 = or disjoint i32 %coeff_pos.068, 4
  %add25 = or disjoint i32 %coeff_pos.068, 5
  %add29 = or disjoint i32 %coeff_pos.068, 6
  %add33 = or disjoint i32 %coeff_pos.068, 7
  %arrayidx16 = getelementptr inbounds float, ptr %5, i32 %coeff_pos.068
  %arrayidx18 = getelementptr inbounds float, ptr %6, i32 %n.069
  %arrayidx16.1 = getelementptr inbounds float, ptr %5, i32 %add
  %arrayidx18.1 = getelementptr inbounds float, ptr %arrayidx18, i32 1
  %arrayidx16.2 = getelementptr inbounds float, ptr %5, i32 %add13
  %arrayidx18.2 = getelementptr inbounds float, ptr %arrayidx18, i32 2
  %arrayidx16.3 = getelementptr inbounds float, ptr %5, i32 %add17
  %arrayidx18.3 = getelementptr inbounds float, ptr %arrayidx18, i32 3
  %arrayidx16.4 = getelementptr inbounds float, ptr %5, i32 %add21
  %arrayidx18.4 = getelementptr inbounds float, ptr %arrayidx18, i32 4
  %arrayidx16.5 = getelementptr inbounds float, ptr %5, i32 %add25
  %arrayidx18.5 = getelementptr inbounds float, ptr %arrayidx18, i32 5
  %arrayidx16.6 = getelementptr inbounds float, ptr %5, i32 %add29
  %arrayidx18.6 = getelementptr inbounds float, ptr %arrayidx18, i32 6
  %arrayidx16.7 = getelementptr inbounds float, ptr %5, i32 %add33
  %arrayidx18.7 = getelementptr inbounds float, ptr %arrayidx18, i32 7
  %12 = load float, ptr %arrayidx16, align 4, !tbaa !15
  %13 = load float, ptr %arrayidx18, align 4, !tbaa !15
  %14 = load float, ptr %arrayidx16.1, align 4, !tbaa !15
  %15 = load float, ptr %arrayidx18.1, align 4, !tbaa !15
  %16 = load float, ptr %arrayidx16.2, align 4, !tbaa !15
  %17 = load float, ptr %arrayidx18.2, align 4, !tbaa !15
  %18 = load float, ptr %arrayidx16.3, align 4, !tbaa !15
  %19 = load float, ptr %arrayidx18.3, align 4, !tbaa !15
  %20 = load float, ptr %arrayidx16.4, align 4, !tbaa !15
  %21 = load float, ptr %arrayidx18.4, align 4, !tbaa !15
  %22 = load float, ptr %arrayidx16.5, align 4, !tbaa !15
  %23 = load float, ptr %arrayidx18.5, align 4, !tbaa !15
  %24 = load float, ptr %arrayidx16.6, align 4, !tbaa !15
  %25 = load float, ptr %arrayidx18.6, align 4, !tbaa !15
  %26 = load float, ptr %arrayidx16.7, align 4, !tbaa !15
  %27 = load float, ptr %arrayidx18.7, align 4, !tbaa !15
  %28 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %acc)
  %29 = tail call float @llvm.fmuladd.f32(float %14, float %15, float %acc3)
  %30 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %acc4)
  %31 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %acc5)
  %32 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %acc6)
  %33 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %acc7)
  %34 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %acc8)
  %35 = tail call float @llvm.fmuladd.f32(float %26, float %27, float %acc9)
  %exitcond83.not.7 = icmp sgt i32 %inc20.7, %1
  br i1 %exitcond83.not.7, label %for.cond63.preheader, label %for.body14.7, !llvm.loop !19

for.body79.lr.ph:                                 ; preds = %for.cond.cleanup26
  %36 = load ptr, ptr %fir, align 4, !tbaa !14
  %37 = load ptr, ptr %delay, align 4, !tbaa !13
  %38 = and i32 %4, 2147483640
  br label %for.body27.7

for.body14.clone:                                 ; preds = %for.body14.clone, %for.body27.lr.ph
  %n.069.clone = phi i32 [ %n.0.lcssa, %for.body27.lr.ph ], [ %inc20.clone, %for.body14.clone ]
  %coeff_pos.068.clone = phi i32 [ %coeff_pos.0.lcssa, %for.body27.lr.ph ], [ %inc15.clone, %for.body14.clone ]
  %acc.067.clone = phi float [ %acc.0.lcssa, %for.body27.lr.ph ], [ %41, %for.body14.clone ]
  %inc15.clone = add nuw nsw i32 %coeff_pos.068.clone, 1
  %arrayidx16.clone = getelementptr inbounds float, ptr %9, i32 %coeff_pos.068.clone
  %39 = load float, ptr %arrayidx16.clone, align 4, !tbaa !15
  %arrayidx18.clone = getelementptr inbounds float, ptr %10, i32 %n.069.clone
  %40 = load float, ptr %arrayidx18.clone, align 4, !tbaa !15
  %41 = tail call float @llvm.fmuladd.f32(float %39, float %40, float %acc.067.clone)
  %inc20.clone = add nsw i32 %n.069.clone, 1
  %exitcond83.not.clone = icmp eq i32 %inc20.clone, %1
  br i1 %exitcond83.not.clone, label %for.cond.cleanup26.loopexit, label %for.body14.clone, !llvm.loop !19

for.cond130.preheader:                            ; preds = %for.body27.7, %for.cond.cleanup26
  %acc.0.lcssa.clone = phi float [ %acc.1.lcssa, %for.cond.cleanup26 ], [ %59, %for.body27.7 ]
  %acc.1.lcssa2.clone = phi float [ %acc.1.lcssa2, %for.cond.cleanup26 ], [ %60, %for.body27.7 ]
  %acc.2.lcssa.clone = phi float [ %acc.2.lcssa, %for.cond.cleanup26 ], [ %61, %for.body27.7 ]
  %acc.3.lcssa.clone = phi float [ %acc.3.lcssa, %for.cond.cleanup26 ], [ %62, %for.body27.7 ]
  %acc.4.lcssa.clone = phi float [ %acc.4.lcssa, %for.cond.cleanup26 ], [ %63, %for.body27.7 ]
  %acc.5.lcssa.clone = phi float [ %acc.5.lcssa, %for.cond.cleanup26 ], [ %64, %for.body27.7 ]
  %acc.6.lcssa.clone = phi float [ %acc.6.lcssa, %for.cond.cleanup26 ], [ %65, %for.body27.7 ]
  %acc.7.lcssa.clone = phi float [ %acc.7.lcssa, %for.cond.cleanup26 ], [ %66, %for.body27.7 ]
  %coeff_pos.0.lcssa.clone = phi i32 [ %coeff_pos.1.lcssa, %for.cond.cleanup26 ], [ %add75, %for.body27.7 ]
  %n.0.lcssa.clone = phi i32 [ 0, %for.cond.cleanup26 ], [ %38, %for.body27.7 ]
  %cmp2572.clone = icmp slt i32 %n.0.lcssa.clone, %4
  br i1 %cmp2572.clone, label %for.body133.lr.ph, label %for.end141

for.cond.cleanup26.loopexit:                      ; preds = %for.body14.clone
  %42 = sub i32 %11, %n.0.lcssa
  br label %for.cond.cleanup26

for.cond.cleanup26:                               ; preds = %for.cond.cleanup26.loopexit, %for.cond63.preheader
  %coeff_pos.1.lcssa = phi i32 [ %coeff_pos.0.lcssa, %for.cond63.preheader ], [ %42, %for.cond.cleanup26.loopexit ]
  %acc.1.lcssa = phi float [ %acc.0.lcssa, %for.cond63.preheader ], [ %41, %for.cond.cleanup26.loopexit ]
  %exitcond85.not = icmp slt i32 %4, 8
  br i1 %exitcond85.not, label %for.cond130.preheader, label %for.body79.lr.ph, !llvm.loop !20

for.body27.7:                                     ; preds = %for.body79.lr.ph, %for.body27.7
  %add76310 = phi i32 [ 8, %for.body79.lr.ph ], [ %add76, %for.body27.7 ]
  %n22.075 = phi i32 [ 0, %for.body79.lr.ph ], [ %add76310, %for.body27.7 ]
  %coeff_pos.174 = phi i32 [ %coeff_pos.1.lcssa, %for.body79.lr.ph ], [ %add75, %for.body27.7 ]
  %acc38 = phi float [ %acc.1.lcssa, %for.body79.lr.ph ], [ %59, %for.body27.7 ]
  %acc39 = phi float [ %acc.1.lcssa2, %for.body79.lr.ph ], [ %60, %for.body27.7 ]
  %acc40 = phi float [ %acc.2.lcssa, %for.body79.lr.ph ], [ %61, %for.body27.7 ]
  %acc41 = phi float [ %acc.3.lcssa, %for.body79.lr.ph ], [ %62, %for.body27.7 ]
  %acc42 = phi float [ %acc.4.lcssa, %for.body79.lr.ph ], [ %63, %for.body27.7 ]
  %acc43 = phi float [ %acc.5.lcssa, %for.body79.lr.ph ], [ %64, %for.body27.7 ]
  %acc44 = phi float [ %acc.6.lcssa, %for.body79.lr.ph ], [ %65, %for.body27.7 ]
  %acc45 = phi float [ %acc.7.lcssa, %for.body79.lr.ph ], [ %66, %for.body27.7 ]
  %add49 = or disjoint i32 %n22.075, 1
  %add53 = or disjoint i32 %n22.075, 2
  %add57 = or disjoint i32 %n22.075, 3
  %add61 = or disjoint i32 %n22.075, 4
  %add65 = or disjoint i32 %n22.075, 5
  %add69 = or disjoint i32 %n22.075, 6
  %add73 = or disjoint i32 %n22.075, 7
  %add75 = add i32 %coeff_pos.1.lcssa, 8
  %arrayidx30 = getelementptr inbounds float, ptr %36, i32 %coeff_pos.174
  %arrayidx32 = getelementptr inbounds float, ptr %37, i32 %n22.075
  %arrayidx30.1 = getelementptr inbounds float, ptr %arrayidx30, i32 1
  %arrayidx32.1 = getelementptr inbounds float, ptr %37, i32 %add49
  %arrayidx30.2 = getelementptr inbounds float, ptr %arrayidx30, i32 2
  %arrayidx32.2 = getelementptr inbounds float, ptr %37, i32 %add53
  %arrayidx30.3 = getelementptr inbounds float, ptr %arrayidx30, i32 3
  %arrayidx32.3 = getelementptr inbounds float, ptr %37, i32 %add57
  %arrayidx30.4 = getelementptr inbounds float, ptr %arrayidx30, i32 4
  %arrayidx32.4 = getelementptr inbounds float, ptr %37, i32 %add61
  %arrayidx30.5 = getelementptr inbounds float, ptr %arrayidx30, i32 5
  %arrayidx32.5 = getelementptr inbounds float, ptr %37, i32 %add65
  %arrayidx30.6 = getelementptr inbounds float, ptr %arrayidx30, i32 6
  %arrayidx32.6 = getelementptr inbounds float, ptr %37, i32 %add69
  %arrayidx30.7 = getelementptr inbounds float, ptr %arrayidx30, i32 7
  %arrayidx32.7 = getelementptr inbounds float, ptr %37, i32 %add73
  %43 = load float, ptr %arrayidx30, align 4, !tbaa !15
  %44 = load float, ptr %arrayidx32, align 4, !tbaa !15
  %45 = load float, ptr %arrayidx30.1, align 4, !tbaa !15
  %46 = load float, ptr %arrayidx32.1, align 4, !tbaa !15
  %47 = load float, ptr %arrayidx30.2, align 4, !tbaa !15
  %48 = load float, ptr %arrayidx32.2, align 4, !tbaa !15
  %49 = load float, ptr %arrayidx30.3, align 4, !tbaa !15
  %50 = load float, ptr %arrayidx32.3, align 4, !tbaa !15
  %51 = load float, ptr %arrayidx30.4, align 4, !tbaa !15
  %52 = load float, ptr %arrayidx32.4, align 4, !tbaa !15
  %53 = load float, ptr %arrayidx30.5, align 4, !tbaa !15
  %54 = load float, ptr %arrayidx32.5, align 4, !tbaa !15
  %55 = load float, ptr %arrayidx30.6, align 4, !tbaa !15
  %56 = load float, ptr %arrayidx32.6, align 4, !tbaa !15
  %57 = load float, ptr %arrayidx30.7, align 4, !tbaa !15
  %58 = load float, ptr %arrayidx32.7, align 4, !tbaa !15
  %59 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %acc38)
  %60 = tail call float @llvm.fmuladd.f32(float %45, float %46, float %acc39)
  %61 = tail call float @llvm.fmuladd.f32(float %47, float %48, float %acc40)
  %62 = tail call float @llvm.fmuladd.f32(float %49, float %50, float %acc41)
  %63 = tail call float @llvm.fmuladd.f32(float %51, float %52, float %acc42)
  %64 = tail call float @llvm.fmuladd.f32(float %53, float %54, float %acc43)
  %65 = tail call float @llvm.fmuladd.f32(float %55, float %56, float %acc44)
  %66 = tail call float @llvm.fmuladd.f32(float %57, float %58, float %acc45)
  %add76 = add nuw nsw i32 %add76310, 8
  %exitcond84.not.7 = icmp sgt i32 %add76, %4
  br i1 %exitcond84.not.7, label %for.cond130.preheader, label %for.body27.7, !llvm.loop !21

for.body133.lr.ph:                                ; preds = %for.cond130.preheader
  %67 = load ptr, ptr %fir, align 4, !tbaa !14
  %68 = load ptr, ptr %delay, align 4, !tbaa !13
  br label %for.body27.clone

for.body27.clone:                                 ; preds = %for.body27.clone, %for.body133.lr.ph
  %n22.075.clone = phi i32 [ %n.0.lcssa.clone, %for.body133.lr.ph ], [ %inc34.clone, %for.body27.clone ]
  %coeff_pos.174.clone = phi i32 [ %coeff_pos.0.lcssa.clone, %for.body133.lr.ph ], [ %inc29.clone, %for.body27.clone ]
  %acc.173.clone = phi float [ %acc.0.lcssa.clone, %for.body133.lr.ph ], [ %71, %for.body27.clone ]
  %inc29.clone = add nuw nsw i32 %coeff_pos.174.clone, 1
  %arrayidx30.clone = getelementptr inbounds float, ptr %67, i32 %coeff_pos.174.clone
  %69 = load float, ptr %arrayidx30.clone, align 4, !tbaa !15
  %arrayidx32.clone = getelementptr inbounds float, ptr %68, i32 %n22.075.clone
  %70 = load float, ptr %arrayidx32.clone, align 4, !tbaa !15
  %71 = tail call float @llvm.fmuladd.f32(float %69, float %70, float %acc.173.clone)
  %inc34.clone = add nuw nsw i32 %n22.075.clone, 1
  %exitcond84.not.clone = icmp eq i32 %inc34.clone, %4
  br i1 %exitcond84.not.clone, label %for.end141, label %for.body27.clone, !llvm.loop !21

for.end141:                                       ; preds = %for.body27.clone, %for.cond130.preheader
  %acc0.3.lcssa = phi float [ %acc.0.lcssa.clone, %for.cond130.preheader ], [ %71, %for.body27.clone ]
  %add60 = fadd float %acc.1.lcssa2.clone, %acc0.3.lcssa
  %add6179 = fadd float %acc.2.lcssa.clone, %acc.3.lcssa.clone
  %add62 = fadd float %acc.4.lcssa.clone, %acc.5.lcssa.clone
  %add6380 = fadd float %acc.6.lcssa.clone, %acc.7.lcssa.clone
  %add64 = fadd float %add60, %add6179
  %add6581 = fadd float %add62, %add6380
  %add66 = fadd float %add64, %add6581
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333)"}
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
