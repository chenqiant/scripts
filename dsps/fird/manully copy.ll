; ModuleID = 'after_splitloopbylength.ll'
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

; for.cond.cleanup.loopexit:                        ; No predecessors!
;   br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.end141, %for.cond.cleanup.loopexit, %entry
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
  ;%7 = sub i32 %1, %4
  br label %for.body14.7

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph
  %8 = phi i32 [ %2, %for.body4.lr.ph ], [ %spec.select, %for.body4 ]
  %k.065 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc8, %for.body4 ]
  %input.addr.164 = phi ptr [ %input.addr.078, %for.body4.lr.ph ], [ %incdec.ptr, %for.body4 ]
  %incdec.ptr = getelementptr inbounds float, ptr %input.addr.164, i32 1
  %9 = load float, ptr %input.addr.164, align 4, !tbaa !15
  %inc = add nsw i32 %8, 1
  %arrayidx = getelementptr inbounds float, ptr %3, i32 %8
  store float %9, ptr %arrayidx, align 4, !tbaa !15
  %cmp6.not = icmp slt i32 %inc, %1
  %spec.select = select i1 %cmp6.not, i32 %inc, i32 0
  %inc8 = add nuw nsw i32 %k.065, 1
  %exitcond.not = icmp eq i32 %inc8, %0
  br i1 %exitcond.not, label %for.cond1.for.cond.cleanup3_crit_edge, label %for.body4, !llvm.loop !17

; for.cond23.preheader.loopexit:                    ; preds = %for.body14.clone, %for.body14.7
  ;%.lcssa = phi float [ %15, %for.body14.7 ], [ %18, %for.body14.7 ], [ %21, %for.body14.7 ], [ %24, %for.body14.7 ], [ %27, %for.body14.7 ], [ %30, %for.body14.7 ], [ %33, %for.body14.7 ], [ %36, %for.body14.7 ]
;   br label %for.cond63.preheader

for.cond63.preheader:                             ; preds = %for.cond.cleanup3, %for.cond23.preheader.loopexit
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %15, %for.body14.7 ]
  %acc_1_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %18, %for.body14.7 ]
  %acc_2_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %21, %for.body14.7 ]
  %acc_3_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %24, %for.body14.7 ]
  %acc_4_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %27, %for.body14.7 ]
  %acc_5_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %30, %for.body14.7 ]
  %acc_6_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %33, %for.body14.7 ]
  %acc_7_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %36, %for.body14.7 ]
  %coeff_pos.0.lcssa = phi i32 [ 0, %for.cond.cleanup3 ], [ %inc15.7, %for.body14.7 ]
  %n.0.lcssa = phi i32 [ %4, %for.cond.cleanup3 ], [ %add281, %for.body14.7 ]
  %cmp2572 = icmp slt i32 %n.0.lcssa, %1
  br i1 %cmp2572, label %for.body27.lr.ph, label %for.cond.cleanup26

for.body27.lr.ph:                                 ; preds = %for.cond130.preheader, %for.cond63.preheader
  %10 = load ptr, ptr %fir, align 4, !tbaa !14
  %11 = load ptr, ptr %delay, align 4, !tbaa !13
  %12 = add i32 %1, %coeff_pos.0.lcssa
  br label %for.body14.clone

for.body14.7:                                     ; preds = %for.body79.lr.ph, %for.body14.lr.ph, %for.body14.7
  %add281 = phi i32 [ %add269, %for.body14.lr.ph ], [ %add, %for.body14.7 ]
  %n.069 = phi i32 [ %4, %for.body14.lr.ph ], [ %add281, %for.body14.7 ]
  %coeff_pos.068 = phi i32 [ 0, %for.body14.lr.ph ], [ %inc15.7, %for.body14.7 ]
  ;%acc.067 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %36, %for.body14.7 ]
  %acc = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %15, %for.body14.7 ]
  %acc2 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %18, %for.body14.7 ]
  %acc3 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %21, %for.body14.7 ]
  %acc4 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %24, %for.body14.7 ]
  %acc5 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %27, %for.body14.7 ]
  %acc6 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %30, %for.body14.7 ]
  %acc7 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %33, %for.body14.7 ]
  %acc8 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %36, %for.body14.7 ]
  %add1 = or disjoint i32 %coeff_pos.068, 1
  %arrayidx16 = getelementptr inbounds float, ptr %5, i32 %coeff_pos.068
  %13 = load float, ptr %arrayidx16, align 4, !tbaa !15
  %arrayidx18 = getelementptr inbounds float, ptr %6, i32 %n.069
  %14 = load float, ptr %arrayidx18, align 4, !tbaa !15
  %15 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %acc)
  ;%inc20 = add nsw i32 %n.069, 1
  ;%exitcond83.not = icmp eq i32 %add1, %inc20.7
  %add10 = or disjoint i32 %coeff_pos.068, 2
  %arrayidx16.1 = getelementptr inbounds float, ptr %5, i32 %add1
  %16 = load float, ptr %arrayidx16.1, align 4, !tbaa !15
  %arrayidx18.1 = getelementptr float, ptr %arrayidx18, i32 1
  %17 = load float, ptr %arrayidx18.1, align 4, !tbaa !15
  %18 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %acc2)
  ;%inc20.1 = add nsw i32 %n.069, 2
  ;%exitcond83.not.1 = icmp eq i32 %add10, %inc20.7
  %add12 = or disjoint i32 %coeff_pos.068, 3
  %arrayidx16.2 = getelementptr inbounds float, ptr %5, i32 %add10
  %19 = load float, ptr %arrayidx16.2, align 4, !tbaa !15
  %arrayidx18.2 = getelementptr float, ptr %arrayidx18, i32 2
  %20 = load float, ptr %arrayidx18.2, align 4, !tbaa !15
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %acc3)
  ;%inc20.2 = add nsw i32 %n.069, 3
  ;%exitcond83.not.2 = icmp eq i32 %add12, %inc20.7
  %add14 = or disjoint i32 %coeff_pos.068, 4
  %arrayidx16.3 = getelementptr inbounds float, ptr %5, i32 %add12
  %22 = load float, ptr %arrayidx16.3, align 4, !tbaa !15
  %arrayidx18.3 = getelementptr float, ptr %arrayidx18, i32 3
  %23 = load float, ptr %arrayidx18.3, align 4, !tbaa !15
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %acc4)
  ;%inc20.3 = add nsw i32 %n.069, 4
  ;%exitcond83.not.3 = icmp eq i32 %add14, %inc20.7
  %add16 = or disjoint i32 %coeff_pos.068, 5
  %arrayidx16.4 = getelementptr inbounds float, ptr %5, i32 %add14
  %25 = load float, ptr %arrayidx16.4, align 4, !tbaa !15
  %arrayidx18.4 = getelementptr float, ptr %arrayidx18, i32 4
  %26 = load float, ptr %arrayidx18.4, align 4, !tbaa !15
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %acc5)
  ;%inc20.4 = add nsw i32 %n.069, 5
  ;%exitcond83.not.4 = icmp eq i32 %add16, %inc20.7
  %add18 = or disjoint i32 %coeff_pos.068, 6
  %arrayidx16.5 = getelementptr inbounds float, ptr %5, i32 %add16
  %28 = load float, ptr %arrayidx16.5, align 4, !tbaa !15
  %arrayidx18.5 = getelementptr float, ptr %arrayidx18, i32 5
  %29 = load float, ptr %arrayidx18.5, align 4, !tbaa !15
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float %acc6)
  ;%inc20.5 = add nsw i32 %n.069, 6
  ;%exitcond83.not.5 = icmp eq i32 %add18, %inc20.7
  %inc15.6 = or disjoint i32 %coeff_pos.068, 7
  %arrayidx16.6 = getelementptr inbounds float, ptr %5, i32 %add18
  %31 = load float, ptr %arrayidx16.6, align 4, !tbaa !15
  %arrayidx18.6 = getelementptr float, ptr %arrayidx18, i32 6
  %32 = load float, ptr %arrayidx18.6, align 4, !tbaa !15
  %33 = tail call float @llvm.fmuladd.f32(float %31, float %32, float %acc7)
  ;%inc20.6 = add nsw i32 %n.069, 7
  ;%exitcond83.not.6 = icmp eq i32 %inc15.6, %inc20.7
  
  %arrayidx16.7 = getelementptr inbounds float, ptr %5, i32 %inc15.6
  %34 = load float, ptr %arrayidx16.7, align 4, !tbaa !15
  %arrayidx18.7 = getelementptr float, ptr %arrayidx18, i32 7
  %35 = load float, ptr %arrayidx18.7, align 4, !tbaa !15
  %36 = tail call float @llvm.fmuladd.f32(float %34, float %35, float %acc8)
  %inc15.7 = add nuw nsw i32 %coeff_pos.068, 8
;   %inc20.7 = add nsw i32 %coeff_pos.068, 8
  %add = add nsw i32 %add281, 8
  %exitcond83.not.7 = icmp sgt i32 %add, %1
  br i1 %exitcond83.not.7, label %for.cond63.preheader, label %for.body14.7, !llvm.loop !19

for.cond.cleanup26.loopexit:                      ; preds = %for.body27.clone, %for.body27.7
  ;%.lcssa1 = phi float [ %47, %for.body27.7 ], [ %50, %for.body27.7 ], [ %53, %for.body27.7 ], [ %56, %for.body27.7 ], [ %59, %for.body27.7 ], [ %62, %for.body27.7 ], [ %65, %for.body27.7 ], [ %68, %for.body27.7 ]
  %m44 = sub i32 %12, %n.0.lcssa
  br label %for.cond.cleanup26

for.cond.cleanup26:                               ; preds = %for.cond130.preheader, %for.cond.cleanup26.loopexit, %for.cond63.preheader
  %acc.1.lcssa = phi float [ %acc.0.lcssa, %for.cond63.preheader ], [ %43, %for.cond.cleanup26.loopexit ]
  %coeff_pos.1.lcssa = phi i32 [ %coeff_pos.0.lcssa, %for.cond63.preheader ], [ %m44, %for.cond.cleanup26.loopexit ]
  ;%inc39 = add nuw nsw i32 %i.080, 1
  ;%arrayidx37 = getelementptr inbounds float, ptr %output, i32 %i.080
  %exitcond85.not = icmp slt i32 %4, 8
  br i1 %exitcond85.not, label %for.cond130.preheader, label %for.body79.lr.ph

for.body79.lr.ph:                                 ; preds = %for.cond.cleanup26
  %37 = load ptr, ptr %fir, align 4, !tbaa !14
  %38 = load ptr, ptr %delay, align 4, !tbaa !13
  ;%39 = add i32 %1, %coeff_pos.0.lcssa
  %39 = and i32 %4, 2147483640
  br label %for.body27.7

for.body14.clone:                                 ; preds = %for.body14.clone, %for.body27.lr.ph
  %n.069.clone = phi i32 [ %n.0.lcssa, %for.body27.lr.ph ], [ %inc20.clone, %for.body14.clone ]
  %coeff_pos.068.clone = phi i32 [ %coeff_pos.0.lcssa, %for.body27.lr.ph ], [ %inc15.clone, %for.body14.clone ]
  %acc.067.clone = phi float [ %acc.0.lcssa, %for.body27.lr.ph ], [ %43, %for.body14.clone ]
  %inc15.clone = add nuw nsw i32 %coeff_pos.068.clone, 1
  %arrayidx16.clone = getelementptr inbounds float, ptr %10, i32 %coeff_pos.068.clone
  %41 = load float, ptr %arrayidx16.clone, align 4, !tbaa !15
  %arrayidx18.clone = getelementptr inbounds float, ptr %11, i32 %n.069.clone
  %42 = load float, ptr %arrayidx18.clone, align 4, !tbaa !15
  %43 = tail call float @llvm.fmuladd.f32(float %41, float %42, float %acc.067.clone)
  %inc20.clone = add nsw i32 %n.069.clone, 1
  %exitcond83.not.clone = icmp eq i32 %inc20.clone, %1
  br i1 %exitcond83.not.clone, label %for.cond.cleanup26.loopexit, label %for.body14.clone, !llvm.loop !19

for.cond130.preheader:                            ; preds = %for.cond.cleanup26
  %acc.0.lcssa.clone = phi float [ %acc.1.lcssa, %for.cond.cleanup26 ], [ %47, %for.body27.7 ]
  %acc_1_lcssa.clone = phi float [ %acc_1_lcssa, %for.cond.cleanup26 ], [ %50, %for.body27.7 ]
  %acc_2_lcssa.clone = phi float [ %acc_2_lcssa, %for.cond.cleanup26 ], [ %53, %for.body27.7 ]
  %acc_3_lcssa.clone = phi float [ %acc_3_lcssa, %for.cond.cleanup26 ], [ %56, %for.body27.7 ]
  %acc_4_lcssa.clone = phi float [ %acc_4_lcssa, %for.cond.cleanup26 ], [ %59, %for.body27.7 ]
  %acc_5_lcssa.clone = phi float [ %acc_5_lcssa, %for.cond.cleanup26 ], [ %62, %for.body27.7 ]
  %acc_6_lcssa.clone = phi float [ %acc_6_lcssa, %for.cond.cleanup26 ], [ %65, %for.body27.7 ]
  %acc_7_lcssa.clone = phi float [ %acc_7_lcssa, %for.cond.cleanup26 ], [ %68, %for.body27.7 ]
  %coeff_pos.0.lcssa.clone = phi i32 [ %coeff_pos.1.lcssa, %for.cond.cleanup26 ], [ %add126, %for.body27.7 ]
  %n.0.lcssa.clone = phi i32 [ 0, %for.cond.cleanup26 ], [ %39, %for.body27.7 ]
  %cmp2572.clone = icmp slt i32 %n.0.lcssa.clone, %4
  br i1 %cmp2572.clone, label %for.body133.lr.ph, label %for.end141

for.body133.lr.ph:                                ; preds = %for.cond130.preheader
  %n43 = load ptr, ptr %fir, align 4, !tbaa !14
  %n44 = load ptr, ptr %delay, align 4, !tbaa !13
  br label %for.body27.clone

for.body27.7:                                     ; preds = %for.body27.7, %for.body27.clone
  %add76310 = phi i32 [ 8, %for.body79.lr.ph ], [ %add76, %for.body27.7 ]
  %n22.075 = phi i32 [ 0, %for.body79.lr.ph ], [ %add76310, %for.body27.7 ]
  %coeff_pos.174 = phi i32 [ %coeff_pos.1.lcssa, %for.body79.lr.ph ], [ %add126, %for.body27.7 ]
  ;%acc.173 = phi float [ %acc.0.lcssa, %for.body79.lr.ph ], [ %68, %for.body27.7 ]
  %acc19 = phi float [ %acc.1.lcssa, %for.body79.lr.ph ], [ %47, %for.body27.7 ]
  %acc20 = phi float [ %acc_1_lcssa, %for.body79.lr.ph ], [ %50, %for.body27.7 ]
  %acc21 = phi float [ %acc_2_lcssa, %for.body79.lr.ph ], [ %53, %for.body27.7 ]
  %acc22 = phi float [ %acc_3_lcssa, %for.body79.lr.ph ], [ %56, %for.body27.7 ]
  %acc23 = phi float [ %acc_4_lcssa, %for.body79.lr.ph ], [ %59, %for.body27.7 ]
  %acc24 = phi float [ %acc_5_lcssa, %for.body79.lr.ph ], [ %62, %for.body27.7 ]
  %acc25 = phi float [ %acc_6_lcssa, %for.body79.lr.ph ], [ %65, %for.body27.7 ]
  %acc26 = phi float [ %acc_7_lcssa, %for.body79.lr.ph ], [ %68, %for.body27.7 ]
  
  %arrayidx30 = getelementptr inbounds float, ptr %37, i32 %coeff_pos.174
  %45 = load float, ptr %arrayidx30, align 4, !tbaa !15
  %arrayidx32 = getelementptr inbounds float, ptr %38, i32 %n22.075
  %46 = load float, ptr %arrayidx32, align 4, !tbaa !15
  %47 = tail call float @llvm.fmuladd.f32(float %45, float %46, float %acc19)
  ;%add30 = or disjoint i32 %n22.075, 1
  ;%exitcond84.not = icmp eq i32 %add30, %4
  
  %add28 = or disjoint i32 %n22.075, 1
  %arrayidx30.1 = getelementptr inbounds float, ptr %37, i32 %add28
  %48 = load float, ptr %arrayidx30.1, align 4, !tbaa !15
  %arrayidx32.1 = getelementptr float, ptr %arrayidx30, i32 1
  %49 = load float, ptr %arrayidx32.1, align 4, !tbaa !15
  %50 = tail call float @llvm.fmuladd.f32(float %49, float %48, float %acc20)
  ;%add34 = or disjoint i32 %n22.075, 2
  ;%exitcond84.not.1 = icmp eq i32 %add34, %4
  
  %add32 = or disjoint i32 %n22.075, 2
  %arrayidx30.2 = getelementptr inbounds float, ptr %37, i32 %add32
  %51 = load float, ptr %arrayidx30.2, align 4, !tbaa !15
  %arrayidx32.2 = getelementptr float, ptr %arrayidx30, i32 2
  %52 = load float, ptr %arrayidx32.2, align 4, !tbaa !15
  %53 = tail call float @llvm.fmuladd.f32(float %52, float %51, float %acc21)
  ;%add38 = or disjoint i32 %n22.075, 3
  ;%exitcond84.not.2 = icmp eq i32 %add38, %4
  
  %add36 = or disjoint i32 %n22.075, 3
  %arrayidx30.3 = getelementptr inbounds float, ptr %37, i32 %add36
  %54 = load float, ptr %arrayidx30.3, align 4, !tbaa !15
  %arrayidx32.3 = getelementptr float, ptr %arrayidx30, i32 3
  %55 = load float, ptr %arrayidx32.3, align 4, !tbaa !15
  %56 = tail call float @llvm.fmuladd.f32(float %55, float %54, float %acc22)
  ;%add42 = or disjoint i32 %n22.075, 4
  ;%exitcond84.not.3 = icmp eq i32 %add42, %4
  
  %add40 = or disjoint i32 %n22.075, 4
  %arrayidx30.4 = getelementptr inbounds float, ptr %37, i32 %add40
  %57 = load float, ptr %arrayidx30.4, align 4, !tbaa !15
  %arrayidx32.4 = getelementptr float, ptr %arrayidx30, i32 4
  %58 = load float, ptr %arrayidx32.4, align 4, !tbaa !15
  %59 = tail call float @llvm.fmuladd.f32(float %58, float %57, float %acc23)
  ;%add46 = or disjoint i32 %n22.075, 5
 ; %exitcond84.not.4 = icmp eq i32 %add46, %4
  
  %add44 = or disjoint i32 %n22.075, 5
  %arrayidx30.5 = getelementptr inbounds float, ptr %37, i32 %add44
  %60 = load float, ptr %arrayidx30.5, align 4, !tbaa !15
  %arrayidx32.5 = getelementptr float, ptr %arrayidx30, i32 5
  %61 = load float, ptr %arrayidx32.5, align 4, !tbaa !15
  %62 = tail call float @llvm.fmuladd.f32(float %61, float %60, float %acc24)
  ;%add50 = or disjoint i32 %n22.075, 6
  ;%exitcond84.not.5 = icmp eq i32 %add50, %4
  
  %add48 = or disjoint i32 %n22.075, 6
  %arrayidx30.6 = getelementptr inbounds float, ptr %37, i32 %add48
  %63 = load float, ptr %arrayidx30.6, align 4, !tbaa !15
  %arrayidx32.6 = getelementptr float, ptr %arrayidx30, i32 6
  %64 = load float, ptr %arrayidx32.6, align 4, !tbaa !15
  %65 = tail call float @llvm.fmuladd.f32(float %64, float %63, float %acc25)
  ;%add54 = or disjoint i32 %n22.075, 7
  ;%exitcond84.not.6 = icmp eq i32 %add54, %4
  ; %add56 = or disjoint i32 %n22.075, 8
  %add52 = or disjoint i32 %n22.075, 7
  %arrayidx30.7 = getelementptr inbounds float, ptr %37, i32 %add52
  %66 = load float, ptr %arrayidx30.7, align 4, !tbaa !15
  %arrayidx32.7 = getelementptr float, ptr %arrayidx30, i32 7
  %67 = load float, ptr %arrayidx32.7, align 4, !tbaa !15
  %68 = tail call float @llvm.fmuladd.f32(float %67, float %66, float %acc26)
;   %add58 = or disjoint i32 %n22.075, 8
  %add126 = add nuw nsw i32 %coeff_pos.174, 8
  %add76 = add nuw nsw i32 %add76310, 8
  %exitcond84.not.7 = icmp sgt i32 %add76, %4
  br i1 %exitcond84.not.7, label %for.cond130.preheader, label %for.body27.7, !llvm.loop !21

; for.body27.clone.preheader:                       ; No predecessors!
;   br label %for.body27.clone

for.body27.clone:                                 ; preds = %for.body27.clone.preheader
  %n22.075.clone = phi i32 [ %n.0.lcssa.clone, %for.body133.lr.ph ], [ %inc34.clone, %for.body27.clone ]
  %coeff_pos.174.clone = phi i32 [ %coeff_pos.0.lcssa.clone, %for.body133.lr.ph ], [ %inc29.clone, %for.body27.clone ]
  %acc.173.clone = phi float [ %acc.0.lcssa.clone, %for.body133.lr.ph ], [ %71, %for.body27.clone ]
  %inc29.clone = add nuw nsw i32 %coeff_pos.174.clone, 1
  %arrayidx30.clone = getelementptr inbounds float, ptr %n43, i32 %coeff_pos.174.clone
  %69 = load float, ptr %arrayidx30.clone, align 4, !tbaa !15
  %arrayidx32.clone = getelementptr inbounds float, ptr %n44, i32 %n22.075.clone
  %70 = load float, ptr %arrayidx32.clone, align 4, !tbaa !15
  %71 = tail call float @llvm.fmuladd.f32(float %69, float %70, float %acc.173.clone)
  %inc34.clone = add nuw nsw i32 %n22.075.clone, 1
  %exitcond84.not.clone = icmp eq i32 %inc34.clone, %4
  br i1 %exitcond84.not.clone, label %for.end141, label %for.body27.clone, !llvm.loop !21

for.end141:                                       ; No predecessors!
  %acc0.3.lcssa = phi float [ %acc.0.lcssa.clone, %for.cond130.preheader ], [ %71, %for.body27.clone ]
  %add142 = fadd float %acc_1_lcssa.clone, %acc0.3.lcssa
  %add143 = fadd float %acc_2_lcssa.clone, %add142
  %add144 = fadd float %acc_3_lcssa.clone, %add143
  %add145 = fadd float %acc_4_lcssa.clone, %add144
  %add146 = fadd float %acc_5_lcssa.clone, %add145
  %add147 = fadd float %acc_6_lcssa.clone, %add146
  %add148 = fadd float %acc_7_lcssa.clone, %add147
  %inc152 = add nuw nsw i32 %i.080, 1
  %arrayidx150 = getelementptr inbounds float, ptr %output, i32 %i.080
  store float %add148, ptr %arrayidx150, align 4, !tbaa !15
  %exitcond350.not = icmp eq i32 %inc152, %len
  br i1 %exitcond350.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !22
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15)"}
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
!22 = distinct !{!21, !18}