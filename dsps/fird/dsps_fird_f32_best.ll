; ModuleID = 'dsps_fird_f32_best.c'
source_filename = "dsps_fird_f32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fird_f32_ansi(ptr noalias nocapture noundef %fir, ptr noalias nocapture noundef readonly %input, ptr noalias nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp326 = icmp sgt i32 %len, 0
  br i1 %cmp326, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %decim = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 4
  %0 = load i32, ptr %decim, align 4, !tbaa !4
  %cmp2265 = icmp sgt i32 %0, 0
  %delay = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %pos = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %1 = load i32, ptr %N, align 4, !tbaa !11
  %pos9.promoted = load i32, ptr %pos, align 4, !tbaa !12
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.end141
  %2 = phi i32 [ %pos9.promoted, %for.cond1.preheader.lr.ph ], [ %4, %for.end141 ]
  %i.0329 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc152, %for.end141 ]
  %input.addr.0327 = phi ptr [ %input, %for.cond1.preheader.lr.ph ], [ %input.addr.1.lcssa, %for.end141 ]
  br i1 %cmp2265, label %for.body4.lr.ph, label %for.cond.cleanup3

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
  %input.addr.1.lcssa = phi ptr [ %incdec.ptr, %for.cond1.for.cond.cleanup3_crit_edge ], [ %input.addr.0327, %for.cond1.preheader ]
  %add269 = add nsw i32 %4, 8
  %cmp12.not270 = icmp sgt i32 %add269, %1
  br i1 %cmp12.not270, label %for.cond63.preheader, label %for.body13.lr.ph

for.body13.lr.ph:                                 ; preds = %for.cond.cleanup3
  %5 = load ptr, ptr %fir, align 4, !tbaa !14
  %6 = load ptr, ptr %delay, align 4, !tbaa !13
  br label %for.body13

for.body4:                                        ; preds = %for.body4.lr.ph, %for.body4
  %7 = phi i32 [ %2, %for.body4.lr.ph ], [ %spec.select, %for.body4 ]
  %k.0267 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc8, %for.body4 ]
  %input.addr.1266 = phi ptr [ %input.addr.0327, %for.body4.lr.ph ], [ %incdec.ptr, %for.body4 ]
  %incdec.ptr = getelementptr inbounds float, ptr %input.addr.1266, i32 1
  %8 = load float, ptr %input.addr.1266, align 4, !tbaa !15
  %inc = add nsw i32 %7, 1
  %arrayidx = getelementptr inbounds float, ptr %3, i32 %7
  store float %8, ptr %arrayidx, align 4, !tbaa !15
  %cmp6.not = icmp slt i32 %inc, %1
  %spec.select = select i1 %cmp6.not, i32 %inc, i32 0
  %inc8 = add nuw nsw i32 %k.0267, 1
  %exitcond.not = icmp eq i32 %inc8, %0
  br i1 %exitcond.not, label %for.cond1.for.cond.cleanup3_crit_edge, label %for.body4, !llvm.loop !17

for.cond63.preheader:                             ; preds = %for.body13, %for.cond.cleanup3
  %acc0.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %14, %for.body13 ]
  %acc1.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %17, %for.body13 ]
  %acc2.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %20, %for.body13 ]
  %acc3.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %23, %for.body13 ]
  %acc4.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %26, %for.body13 ]
  %acc5.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %29, %for.body13 ]
  %acc6.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %32, %for.body13 ]
  %acc7.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %35, %for.body13 ]
  %coeff_pos.0.lcssa = phi i32 [ 0, %for.cond.cleanup3 ], [ %add59, %for.body13 ]
  %n.0.lcssa = phi i32 [ %4, %for.cond.cleanup3 ], [ %add281, %for.body13 ]
  %cmp65293 = icmp slt i32 %n.0.lcssa, %1
  br i1 %cmp65293, label %for.body66.lr.ph, label %for.cond75.preheader

for.body66.lr.ph:                                 ; preds = %for.cond63.preheader
  %9 = load ptr, ptr %fir, align 4, !tbaa !14
  %10 = load ptr, ptr %delay, align 4, !tbaa !13
  %11 = add i32 %1, %coeff_pos.0.lcssa
  br label %for.body66

for.body13:                                       ; preds = %for.body13.lr.ph, %for.body13
  %add281 = phi i32 [ %add269, %for.body13.lr.ph ], [ %add, %for.body13 ]
  %n.0280 = phi i32 [ %4, %for.body13.lr.ph ], [ %add281, %for.body13 ]
  %coeff_pos.0279 = phi i32 [ 0, %for.body13.lr.ph ], [ %add59, %for.body13 ]
  %acc7.0278 = phi float [ 0.000000e+00, %for.body13.lr.ph ], [ %35, %for.body13 ]
  %acc6.0277 = phi float [ 0.000000e+00, %for.body13.lr.ph ], [ %32, %for.body13 ]
  %acc5.0276 = phi float [ 0.000000e+00, %for.body13.lr.ph ], [ %29, %for.body13 ]
  %acc4.0275 = phi float [ 0.000000e+00, %for.body13.lr.ph ], [ %26, %for.body13 ]
  %acc3.0274 = phi float [ 0.000000e+00, %for.body13.lr.ph ], [ %23, %for.body13 ]
  %acc2.0273 = phi float [ 0.000000e+00, %for.body13.lr.ph ], [ %20, %for.body13 ]
  %acc1.0272 = phi float [ 0.000000e+00, %for.body13.lr.ph ], [ %17, %for.body13 ]
  %acc0.0271 = phi float [ 0.000000e+00, %for.body13.lr.ph ], [ %14, %for.body13 ]
  %arrayidx14 = getelementptr inbounds float, ptr %5, i32 %coeff_pos.0279
  %12 = load float, ptr %arrayidx14, align 4, !tbaa !15
  %arrayidx16 = getelementptr inbounds float, ptr %6, i32 %n.0280
  %13 = load float, ptr %arrayidx16, align 4, !tbaa !15
  %14 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %acc0.0271)
  %add18 = or disjoint i32 %coeff_pos.0279, 1
  %arrayidx19 = getelementptr inbounds float, ptr %5, i32 %add18
  %15 = load float, ptr %arrayidx19, align 4, !tbaa !15
  %arrayidx22 = getelementptr float, ptr %arrayidx16, i32 1
  %16 = load float, ptr %arrayidx22, align 4, !tbaa !15
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %acc1.0272)
  %add24 = or disjoint i32 %coeff_pos.0279, 2
  %arrayidx25 = getelementptr inbounds float, ptr %5, i32 %add24
  %18 = load float, ptr %arrayidx25, align 4, !tbaa !15
  %arrayidx28 = getelementptr float, ptr %arrayidx16, i32 2
  %19 = load float, ptr %arrayidx28, align 4, !tbaa !15
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %acc2.0273)
  %add30 = or disjoint i32 %coeff_pos.0279, 3
  %arrayidx31 = getelementptr inbounds float, ptr %5, i32 %add30
  %21 = load float, ptr %arrayidx31, align 4, !tbaa !15
  %arrayidx34 = getelementptr float, ptr %arrayidx16, i32 3
  %22 = load float, ptr %arrayidx34, align 4, !tbaa !15
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %acc3.0274)
  %add36 = or disjoint i32 %coeff_pos.0279, 4
  %arrayidx37 = getelementptr inbounds float, ptr %5, i32 %add36
  %24 = load float, ptr %arrayidx37, align 4, !tbaa !15
  %arrayidx40 = getelementptr float, ptr %arrayidx16, i32 4
  %25 = load float, ptr %arrayidx40, align 4, !tbaa !15
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %acc4.0275)
  %add42 = or disjoint i32 %coeff_pos.0279, 5
  %arrayidx43 = getelementptr inbounds float, ptr %5, i32 %add42
  %27 = load float, ptr %arrayidx43, align 4, !tbaa !15
  %arrayidx46 = getelementptr float, ptr %arrayidx16, i32 5
  %28 = load float, ptr %arrayidx46, align 4, !tbaa !15
  %29 = tail call float @llvm.fmuladd.f32(float %27, float %28, float %acc5.0276)
  %add48 = or disjoint i32 %coeff_pos.0279, 6
  %arrayidx49 = getelementptr inbounds float, ptr %5, i32 %add48
  %30 = load float, ptr %arrayidx49, align 4, !tbaa !15
  %arrayidx52 = getelementptr float, ptr %arrayidx16, i32 6
  %31 = load float, ptr %arrayidx52, align 4, !tbaa !15
  %32 = tail call float @llvm.fmuladd.f32(float %30, float %31, float %acc6.0277)
  %add54 = or disjoint i32 %coeff_pos.0279, 7
  %arrayidx55 = getelementptr inbounds float, ptr %5, i32 %add54
  %33 = load float, ptr %arrayidx55, align 4, !tbaa !15
  %arrayidx58 = getelementptr float, ptr %arrayidx16, i32 7
  %34 = load float, ptr %arrayidx58, align 4, !tbaa !15
  %35 = tail call float @llvm.fmuladd.f32(float %33, float %34, float %acc7.0278)
  %add59 = add nuw nsw i32 %coeff_pos.0279, 8
  %add = add nsw i32 %add281, 8
  %cmp12.not = icmp sgt i32 %add, %1
  br i1 %cmp12.not, label %for.cond63.preheader, label %for.body13, !llvm.loop !19

for.cond75.preheader.loopexit:                    ; preds = %for.body66
  %36 = sub i32 %11, %n.0.lcssa
  br label %for.cond75.preheader

for.cond75.preheader:                             ; preds = %for.cond75.preheader.loopexit, %for.cond63.preheader
  %acc0.1.lcssa = phi float [ %acc0.0.lcssa, %for.cond63.preheader ], [ %42, %for.cond75.preheader.loopexit ]
  %coeff_pos.1.lcssa = phi i32 [ %coeff_pos.0.lcssa, %for.cond63.preheader ], [ %36, %for.cond75.preheader.loopexit ]
  %cmp78.not299 = icmp slt i32 %4, 8
  br i1 %cmp78.not299, label %for.cond130.preheader, label %for.body79.lr.ph

for.body79.lr.ph:                                 ; preds = %for.cond75.preheader
  %37 = load ptr, ptr %fir, align 4, !tbaa !14
  %38 = load ptr, ptr %delay, align 4, !tbaa !13
  %39 = and i32 %4, 2147483640
  br label %for.body79

for.body66:                                       ; preds = %for.body66.lr.ph, %for.body66
  %n.1296 = phi i32 [ %n.0.lcssa, %for.body66.lr.ph ], [ %inc73, %for.body66 ]
  %coeff_pos.1295 = phi i32 [ %coeff_pos.0.lcssa, %for.body66.lr.ph ], [ %inc68, %for.body66 ]
  %acc0.1294 = phi float [ %acc0.0.lcssa, %for.body66.lr.ph ], [ %42, %for.body66 ]
  %inc68 = add nuw nsw i32 %coeff_pos.1295, 1
  %arrayidx69 = getelementptr inbounds float, ptr %9, i32 %coeff_pos.1295
  %40 = load float, ptr %arrayidx69, align 4, !tbaa !15
  %arrayidx71 = getelementptr inbounds float, ptr %10, i32 %n.1296
  %41 = load float, ptr %arrayidx71, align 4, !tbaa !15
  %42 = tail call float @llvm.fmuladd.f32(float %40, float %41, float %acc0.1294)
  %inc73 = add nsw i32 %n.1296, 1
  %exitcond348.not = icmp eq i32 %inc73, %1
  br i1 %exitcond348.not, label %for.cond75.preheader.loopexit, label %for.body66, !llvm.loop !20

for.cond130.preheader:                            ; preds = %for.body79, %for.cond75.preheader
  %acc0.2.lcssa = phi float [ %acc0.1.lcssa, %for.cond75.preheader ], [ %47, %for.body79 ]
  %acc1.1.lcssa = phi float [ %acc1.0.lcssa, %for.cond75.preheader ], [ %50, %for.body79 ]
  %acc2.1.lcssa = phi float [ %acc2.0.lcssa, %for.cond75.preheader ], [ %53, %for.body79 ]
  %acc3.1.lcssa = phi float [ %acc3.0.lcssa, %for.cond75.preheader ], [ %56, %for.body79 ]
  %acc4.1.lcssa = phi float [ %acc4.0.lcssa, %for.cond75.preheader ], [ %59, %for.body79 ]
  %acc5.1.lcssa = phi float [ %acc5.0.lcssa, %for.cond75.preheader ], [ %62, %for.body79 ]
  %acc6.1.lcssa = phi float [ %acc6.0.lcssa, %for.cond75.preheader ], [ %65, %for.body79 ]
  %acc7.1.lcssa = phi float [ %acc7.0.lcssa, %for.cond75.preheader ], [ %68, %for.body79 ]
  %coeff_pos.2.lcssa = phi i32 [ %coeff_pos.1.lcssa, %for.cond75.preheader ], [ %add126, %for.body79 ]
  %n.2.lcssa = phi i32 [ 0, %for.cond75.preheader ], [ %39, %for.body79 ]
  %cmp132321 = icmp slt i32 %n.2.lcssa, %4
  br i1 %cmp132321, label %for.body133.lr.ph, label %for.end141

for.body133.lr.ph:                                ; preds = %for.cond130.preheader
  %43 = load ptr, ptr %fir, align 4, !tbaa !14
  %44 = load ptr, ptr %delay, align 4, !tbaa !13
  br label %for.body133

for.body79:                                       ; preds = %for.body79.lr.ph, %for.body79
  %add76310 = phi i32 [ 8, %for.body79.lr.ph ], [ %add76, %for.body79 ]
  %n.2309 = phi i32 [ 0, %for.body79.lr.ph ], [ %add76310, %for.body79 ]
  %coeff_pos.2308 = phi i32 [ %coeff_pos.1.lcssa, %for.body79.lr.ph ], [ %add126, %for.body79 ]
  %acc7.1307 = phi float [ %acc7.0.lcssa, %for.body79.lr.ph ], [ %68, %for.body79 ]
  %acc6.1306 = phi float [ %acc6.0.lcssa, %for.body79.lr.ph ], [ %65, %for.body79 ]
  %acc5.1305 = phi float [ %acc5.0.lcssa, %for.body79.lr.ph ], [ %62, %for.body79 ]
  %acc4.1304 = phi float [ %acc4.0.lcssa, %for.body79.lr.ph ], [ %59, %for.body79 ]
  %acc3.1303 = phi float [ %acc3.0.lcssa, %for.body79.lr.ph ], [ %56, %for.body79 ]
  %acc2.1302 = phi float [ %acc2.0.lcssa, %for.body79.lr.ph ], [ %53, %for.body79 ]
  %acc1.1301 = phi float [ %acc1.0.lcssa, %for.body79.lr.ph ], [ %50, %for.body79 ]
  %acc0.2300 = phi float [ %acc0.1.lcssa, %for.body79.lr.ph ], [ %47, %for.body79 ]
  %arrayidx81 = getelementptr inbounds float, ptr %37, i32 %coeff_pos.2308
  %45 = load float, ptr %arrayidx81, align 4, !tbaa !15
  %arrayidx83 = getelementptr inbounds float, ptr %38, i32 %n.2309
  %46 = load float, ptr %arrayidx83, align 4, !tbaa !15
  %47 = tail call float @llvm.fmuladd.f32(float %45, float %46, float %acc0.2300)
  %arrayidx86 = getelementptr float, ptr %arrayidx81, i32 1
  %48 = load float, ptr %arrayidx86, align 4, !tbaa !15
  %add88 = or disjoint i32 %n.2309, 1
  %arrayidx89 = getelementptr inbounds float, ptr %38, i32 %add88
  %49 = load float, ptr %arrayidx89, align 4, !tbaa !15
  %50 = tail call float @llvm.fmuladd.f32(float %48, float %49, float %acc1.1301)
  %arrayidx92 = getelementptr float, ptr %arrayidx81, i32 2
  %51 = load float, ptr %arrayidx92, align 4, !tbaa !15
  %add94 = or disjoint i32 %n.2309, 2
  %arrayidx95 = getelementptr inbounds float, ptr %38, i32 %add94
  %52 = load float, ptr %arrayidx95, align 4, !tbaa !15
  %53 = tail call float @llvm.fmuladd.f32(float %51, float %52, float %acc2.1302)
  %arrayidx98 = getelementptr float, ptr %arrayidx81, i32 3
  %54 = load float, ptr %arrayidx98, align 4, !tbaa !15
  %add100 = or disjoint i32 %n.2309, 3
  %arrayidx101 = getelementptr inbounds float, ptr %38, i32 %add100
  %55 = load float, ptr %arrayidx101, align 4, !tbaa !15
  %56 = tail call float @llvm.fmuladd.f32(float %54, float %55, float %acc3.1303)
  %arrayidx104 = getelementptr float, ptr %arrayidx81, i32 4
  %57 = load float, ptr %arrayidx104, align 4, !tbaa !15
  %add106 = or disjoint i32 %n.2309, 4
  %arrayidx107 = getelementptr inbounds float, ptr %38, i32 %add106
  %58 = load float, ptr %arrayidx107, align 4, !tbaa !15
  %59 = tail call float @llvm.fmuladd.f32(float %57, float %58, float %acc4.1304)
  %arrayidx110 = getelementptr float, ptr %arrayidx81, i32 5
  %60 = load float, ptr %arrayidx110, align 4, !tbaa !15
  %add112 = or disjoint i32 %n.2309, 5
  %arrayidx113 = getelementptr inbounds float, ptr %38, i32 %add112
  %61 = load float, ptr %arrayidx113, align 4, !tbaa !15
  %62 = tail call float @llvm.fmuladd.f32(float %60, float %61, float %acc5.1305)
  %arrayidx116 = getelementptr float, ptr %arrayidx81, i32 6
  %63 = load float, ptr %arrayidx116, align 4, !tbaa !15
  %add118 = or disjoint i32 %n.2309, 6
  %arrayidx119 = getelementptr inbounds float, ptr %38, i32 %add118
  %64 = load float, ptr %arrayidx119, align 4, !tbaa !15
  %65 = tail call float @llvm.fmuladd.f32(float %63, float %64, float %acc6.1306)
  %arrayidx122 = getelementptr float, ptr %arrayidx81, i32 7
  %66 = load float, ptr %arrayidx122, align 4, !tbaa !15
  %add124 = or disjoint i32 %n.2309, 7
  %arrayidx125 = getelementptr inbounds float, ptr %38, i32 %add124
  %67 = load float, ptr %arrayidx125, align 4, !tbaa !15
  %68 = tail call float @llvm.fmuladd.f32(float %66, float %67, float %acc7.1307)
  %add126 = add nuw nsw i32 %coeff_pos.2308, 8
  %add76 = add nuw nsw i32 %add76310, 8
  %cmp78.not = icmp sgt i32 %add76, %4
  br i1 %cmp78.not, label %for.cond130.preheader, label %for.body79, !llvm.loop !21

for.body133:                                      ; preds = %for.body133.lr.ph, %for.body133
  %n.3324 = phi i32 [ %n.2.lcssa, %for.body133.lr.ph ], [ %inc140, %for.body133 ]
  %coeff_pos.3323 = phi i32 [ %coeff_pos.2.lcssa, %for.body133.lr.ph ], [ %inc135, %for.body133 ]
  %acc0.3322 = phi float [ %acc0.2.lcssa, %for.body133.lr.ph ], [ %71, %for.body133 ]
  %inc135 = add nuw nsw i32 %coeff_pos.3323, 1
  %arrayidx136 = getelementptr inbounds float, ptr %43, i32 %coeff_pos.3323
  %69 = load float, ptr %arrayidx136, align 4, !tbaa !15
  %arrayidx138 = getelementptr inbounds float, ptr %44, i32 %n.3324
  %70 = load float, ptr %arrayidx138, align 4, !tbaa !15
  %71 = tail call float @llvm.fmuladd.f32(float %69, float %70, float %acc0.3322)
  %inc140 = add nuw nsw i32 %n.3324, 1
  %exitcond349.not = icmp eq i32 %inc140, %4
  br i1 %exitcond349.not, label %for.end141, label %for.body133, !llvm.loop !22

for.end141:                                       ; preds = %for.body133, %for.cond130.preheader
  %acc0.3.lcssa = phi float [ %acc0.2.lcssa, %for.cond130.preheader ], [ %71, %for.body133 ]
  %add142 = fadd float %acc1.1.lcssa, %acc0.3.lcssa
  %add143 = fadd float %acc2.1.lcssa, %add142
  %add144 = fadd float %acc3.1.lcssa, %add143
  %add145 = fadd float %acc4.1.lcssa, %add144
  %add146 = fadd float %acc5.1.lcssa, %add145
  %add147 = fadd float %acc6.1.lcssa, %add146
  %add148 = fadd float %acc7.1.lcssa, %add147
  %inc152 = add nuw nsw i32 %i.0329, 1
  %arrayidx150 = getelementptr inbounds float, ptr %output, i32 %i.0329
  store float %add148, ptr %arrayidx150, align 4, !tbaa !15
  %exitcond350.not = icmp eq i32 %inc152, %len
  br i1 %exitcond350.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !23
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
!22 = distinct !{!22, !18}
!23 = distinct !{!23, !18}
