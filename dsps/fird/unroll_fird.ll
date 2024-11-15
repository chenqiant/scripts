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
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %14, %for.body14.7 ]
  %acc_1_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %17, %for.body14.7 ]
  %acc_2_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %20, %for.body14.7 ]
  %acc_3_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %23, %for.body14.7 ]
  %acc_4_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %26, %for.body14.7 ]
  %acc_5_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %29, %for.body14.7 ]
  %acc_6_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %32, %for.body14.7 ]
  %acc_7_lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %35, %for.body14.7 ]
  %coeff_pos.0.lcssa = phi i32 [ 0, %for.cond.cleanup3 ], [ %inc15.7, %for.body14.7 ]
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
  %coeff_pos.068 = phi i32 [ 0, %for.body14.lr.ph ], [ %inc15.7, %for.body14.7 ]
  %acc = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %14, %for.body14.7 ]
  %acc2 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %17, %for.body14.7 ]
  %acc3 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %20, %for.body14.7 ]
  %acc4 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %23, %for.body14.7 ]
  %acc5 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %26, %for.body14.7 ]
  %acc6 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %29, %for.body14.7 ]
  %acc7 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %32, %for.body14.7 ]
  %acc8 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %35, %for.body14.7 ]
  %add = or disjoint i32 %coeff_pos.068, 1
  %arrayidx16 = getelementptr inbounds float, ptr %5, i32 %coeff_pos.068
  %12 = load float, ptr %arrayidx16, align 4, !tbaa !15
  %arrayidx18 = getelementptr inbounds float, ptr %6, i32 %n.069
  %13 = load float, ptr %arrayidx18, align 4, !tbaa !15
  %14 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %acc)
  %add10 = or disjoint i32 %coeff_pos.068, 2
  %arrayidx16.1 = getelementptr inbounds float, ptr %5, i32 %add
  %15 = load float, ptr %arrayidx16.1, align 4, !tbaa !15
  %arrayidx18.1 = getelementptr inbounds float, ptr %arrayidx18, i32 1
  %16 = load float, ptr %arrayidx18.1, align 4, !tbaa !15
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %acc2)
  %add12 = or disjoint i32 %coeff_pos.068, 3
  %arrayidx16.2 = getelementptr inbounds float, ptr %5, i32 %add10
  %18 = load float, ptr %arrayidx16.2, align 4, !tbaa !15
  %arrayidx18.2 = getelementptr inbounds float, ptr %arrayidx18, i32 2
  %19 = load float, ptr %arrayidx18.2, align 4, !tbaa !15
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %acc3)
  %add14 = or disjoint i32 %coeff_pos.068, 4
  %arrayidx16.3 = getelementptr inbounds float, ptr %5, i32 %add12
  %21 = load float, ptr %arrayidx16.3, align 4, !tbaa !15
  %arrayidx18.3 = getelementptr inbounds float, ptr %arrayidx18, i32 3
  %22 = load float, ptr %arrayidx18.3, align 4, !tbaa !15
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %acc4)
  %add16 = or disjoint i32 %coeff_pos.068, 5
  %arrayidx16.4 = getelementptr inbounds float, ptr %5, i32 %add14
  %24 = load float, ptr %arrayidx16.4, align 4, !tbaa !15
  %arrayidx18.4 = getelementptr inbounds float, ptr %arrayidx18, i32 4
  %25 = load float, ptr %arrayidx18.4, align 4, !tbaa !15
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %acc5)
  %add18 = or disjoint i32 %coeff_pos.068, 6
  %arrayidx16.5 = getelementptr inbounds float, ptr %5, i32 %add16
  %27 = load float, ptr %arrayidx16.5, align 4, !tbaa !15
  %arrayidx18.5 = getelementptr inbounds float, ptr %arrayidx18, i32 5
  %28 = load float, ptr %arrayidx18.5, align 4, !tbaa !15
  %29 = tail call float @llvm.fmuladd.f32(float %27, float %28, float %acc6)
  %inc15.6 = add nuw nsw i32 %coeff_pos.068, 7
  %arrayidx16.6 = getelementptr inbounds float, ptr %5, i32 %add18
  %30 = load float, ptr %arrayidx16.6, align 4, !tbaa !15
  %arrayidx18.6 = getelementptr inbounds float, ptr %arrayidx18, i32 6
  %31 = load float, ptr %arrayidx18.6, align 4, !tbaa !15
  %32 = tail call float @llvm.fmuladd.f32(float %30, float %31, float %acc7)
  %inc15.7 = add nuw i32 %coeff_pos.068, 8
  %arrayidx16.7 = getelementptr inbounds float, ptr %5, i32 %inc15.6
  %33 = load float, ptr %arrayidx16.7, align 4, !tbaa !15
  %arrayidx18.7 = getelementptr inbounds float, ptr %arrayidx18, i32 7
  %34 = load float, ptr %arrayidx18.7, align 4, !tbaa !15
  %35 = tail call float @llvm.fmuladd.f32(float %33, float %34, float %acc8)
  %inc20.7 = add nsw i32 %add281, 8
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
  %acc.0.lcssa.clone = phi float [ %acc.1.lcssa, %for.cond.cleanup26 ], [ %45, %for.body27.7 ]
  %acc_1_lcssa.clone = phi float [ %acc_1_lcssa, %for.cond.cleanup26 ], [ %48, %for.body27.7 ]
  %acc_2_lcssa.clone = phi float [ %acc_2_lcssa, %for.cond.cleanup26 ], [ %51, %for.body27.7 ]
  %acc_3_lcssa.clone = phi float [ %acc_3_lcssa, %for.cond.cleanup26 ], [ %54, %for.body27.7 ]
  %acc_4_lcssa.clone = phi float [ %acc_4_lcssa, %for.cond.cleanup26 ], [ %57, %for.body27.7 ]
  %acc_5_lcssa.clone = phi float [ %acc_5_lcssa, %for.cond.cleanup26 ], [ %60, %for.body27.7 ]
  %acc_6_lcssa.clone = phi float [ %acc_6_lcssa, %for.cond.cleanup26 ], [ %63, %for.body27.7 ]
  %acc_7_lcssa.clone = phi float [ %acc_7_lcssa, %for.cond.cleanup26 ], [ %66, %for.body27.7 ]
  %coeff_pos.0.lcssa.clone = phi i32 [ %coeff_pos.1.lcssa, %for.cond.cleanup26 ], [ %add56, %for.body27.7 ]
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
  %coeff_pos.174 = phi i32 [ %coeff_pos.1.lcssa, %for.body79.lr.ph ], [ %add56, %for.body27.7 ]
  %acc19 = phi float [ %acc.1.lcssa, %for.body79.lr.ph ], [ %45, %for.body27.7 ]
  %acc20 = phi float [ %acc_1_lcssa, %for.body79.lr.ph ], [ %48, %for.body27.7 ]
  %acc21 = phi float [ %acc_2_lcssa, %for.body79.lr.ph ], [ %51, %for.body27.7 ]
  %acc22 = phi float [ %acc_3_lcssa, %for.body79.lr.ph ], [ %54, %for.body27.7 ]
  %acc23 = phi float [ %acc_4_lcssa, %for.body79.lr.ph ], [ %57, %for.body27.7 ]
  %acc24 = phi float [ %acc_5_lcssa, %for.body79.lr.ph ], [ %60, %for.body27.7 ]
  %acc25 = phi float [ %acc_6_lcssa, %for.body79.lr.ph ], [ %63, %for.body27.7 ]
  %acc26 = phi float [ %acc_7_lcssa, %for.body79.lr.ph ], [ %66, %for.body27.7 ]
  %arrayidx30 = getelementptr inbounds float, ptr %36, i32 %coeff_pos.174
  %43 = load float, ptr %arrayidx30, align 4, !tbaa !15
  %arrayidx32 = getelementptr inbounds float, ptr %37, i32 %n22.075
  %44 = load float, ptr %arrayidx32, align 4, !tbaa !15
  %45 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %acc19)
  %add30 = or disjoint i32 %n22.075, 1
  %arrayidx30.1 = getelementptr inbounds float, ptr %arrayidx30, i32 1
  %46 = load float, ptr %arrayidx30.1, align 4, !tbaa !15
  %arrayidx32.1 = getelementptr inbounds float, ptr %37, i32 %add30
  %47 = load float, ptr %arrayidx32.1, align 4, !tbaa !15
  %48 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %acc20)
  %add34 = or disjoint i32 %n22.075, 2
  %arrayidx30.2 = getelementptr inbounds float, ptr %arrayidx30, i32 2
  %49 = load float, ptr %arrayidx30.2, align 4, !tbaa !15
  %arrayidx32.2 = getelementptr inbounds float, ptr %37, i32 %add34
  %50 = load float, ptr %arrayidx32.2, align 4, !tbaa !15
  %51 = tail call float @llvm.fmuladd.f32(float %49, float %50, float %acc21)
  %add38 = or disjoint i32 %n22.075, 3
  %arrayidx30.3 = getelementptr inbounds float, ptr %arrayidx30, i32 3
  %52 = load float, ptr %arrayidx30.3, align 4, !tbaa !15
  %arrayidx32.3 = getelementptr inbounds float, ptr %37, i32 %add38
  %53 = load float, ptr %arrayidx32.3, align 4, !tbaa !15
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %acc22)
  %add42 = or disjoint i32 %n22.075, 4
  %arrayidx30.4 = getelementptr inbounds float, ptr %arrayidx30, i32 4
  %55 = load float, ptr %arrayidx30.4, align 4, !tbaa !15
  %arrayidx32.4 = getelementptr inbounds float, ptr %37, i32 %add42
  %56 = load float, ptr %arrayidx32.4, align 4, !tbaa !15
  %57 = tail call float @llvm.fmuladd.f32(float %55, float %56, float %acc23)
  %add46 = or disjoint i32 %n22.075, 5
  %arrayidx30.5 = getelementptr inbounds float, ptr %arrayidx30, i32 5
  %58 = load float, ptr %arrayidx30.5, align 4, !tbaa !15
  %arrayidx32.5 = getelementptr inbounds float, ptr %37, i32 %add46
  %59 = load float, ptr %arrayidx32.5, align 4, !tbaa !15
  %60 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %acc24)
  %add50 = or disjoint i32 %n22.075, 6
  %arrayidx30.6 = getelementptr inbounds float, ptr %arrayidx30, i32 6
  %61 = load float, ptr %arrayidx30.6, align 4, !tbaa !15
  %arrayidx32.6 = getelementptr inbounds float, ptr %37, i32 %add50
  %62 = load float, ptr %arrayidx32.6, align 4, !tbaa !15
  %63 = tail call float @llvm.fmuladd.f32(float %61, float %62, float %acc25)
  %add54 = or disjoint i32 %n22.075, 7
  %add56 = or disjoint i32 %coeff_pos.174, 8
  %arrayidx30.7 = getelementptr inbounds float, ptr %arrayidx30, i32 7
  %64 = load float, ptr %arrayidx30.7, align 4, !tbaa !15
  %arrayidx32.7 = getelementptr inbounds float, ptr %37, i32 %add54
  %65 = load float, ptr %arrayidx32.7, align 4, !tbaa !15
  %66 = tail call float @llvm.fmuladd.f32(float %64, float %65, float %acc26)
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
  %add59 = fadd float %acc_1_lcssa.clone, %acc0.3.lcssa
  %add60 = fadd float %acc_2_lcssa.clone, %add59
  %add61 = fadd float %acc_3_lcssa.clone, %add60
  %add62 = fadd float %acc_4_lcssa.clone, %add61
  %add63 = fadd float %acc_5_lcssa.clone, %add62
  %add64 = fadd float %acc_6_lcssa.clone, %add63
  %add65 = fadd float %acc_7_lcssa.clone, %add64
  %arrayidx37 = getelementptr inbounds float, ptr %output, i32 %i.080
  store float %add65, ptr %arrayidx37, align 4, !tbaa !15
  %inc152 = add nuw nsw i32 %i.080, 1
  %exitcond350.not = icmp eq i32 %inc152, %len
  br i1 %exitcond350.not, label %for.cond.cleanup, label %for.cond1.preheader
}
