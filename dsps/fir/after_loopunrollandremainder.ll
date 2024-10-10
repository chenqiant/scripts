; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_fir_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fir_f32_ansi(ptr noalias nocapture noundef %fir, ptr noalias nocapture noundef readonly %input, ptr noalias nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 !esp32_p4_metadata !4 {
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.cond.preheader, label %for.body.lr.ph.clone.preheader

for.cond.preheader:                               ; preds = %entry
  %delay = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %1 = load ptr, ptr %delay, align 4, !tbaa !5
  %pos = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %2 = load i32, ptr %N, align 4, !tbaa !12
  %sub = add nsw i32 %2, -7
  %.pre = load i32, ptr %pos, align 4, !tbaa !13
  br label %for.body

for.body:                                         ; preds = %for.end, %for.cond.preheader
  %3 = phi i32 [ %.pre, %for.cond.preheader ], [ %spec.store.select, %for.end ]
  %i.068 = phi i32 [ 0, %for.cond.preheader ], [ %inc33.modify, %for.end ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.068
  %4 = load float, ptr %arrayidx, align 4, !tbaa !14
  %arrayidx1 = getelementptr inbounds float, ptr %1, i32 %3
  store float %4, ptr %arrayidx1, align 4, !tbaa !14
  %inc = add nsw i32 %3, 1
  %cmp4.not = icmp slt i32 %inc, %2
  %spec.store.select = select i1 %cmp4.not, i32 %inc, i32 0
  store i32 %spec.store.select, ptr %pos, align 4
  %cmp957 = icmp slt i32 %spec.store.select, %sub
  br i1 %cmp957, label %for.body11.lr.ph.modify, label %for.cond18.preheader.modify

for.cond18.preheader.modify:                      ; preds = %for.body11.modify, %for.body
  %n.060.modify.clone = phi i32 [ %spec.store.select, %for.body ], [ %inc16.modify, %for.body11.modify ]
  %coeff_pos.059.modify.clone = phi i32 [ 0, %for.body ], [ %inc12.modify, %for.body11.modify ]
  %acc.058.modify.clone = phi float [ 0.000000e+00, %for.body ], [ %24, %for.body11.modify ]
  %acc.clone = phi float [ 0.000000e+00, %for.body ], [ %25, %for.body11.modify ]
  %acc4.clone = phi float [ 0.000000e+00, %for.body ], [ %26, %for.body11.modify ]
  %acc7.clone = phi float [ 0.000000e+00, %for.body ], [ %27, %for.body11.modify ]
  %acc10.clone = phi float [ 0.000000e+00, %for.body ], [ %28, %for.body11.modify ]
  %acc13.clone = phi float [ 0.000000e+00, %for.body ], [ %29, %for.body11.modify ]
  %acc17.clone = phi float [ 0.000000e+00, %for.body ], [ %30, %for.body11.modify ]
  %acc20.clone = phi float [ 0.000000e+00, %for.body ], [ %31, %for.body11.modify ]
  %cmp_slt = icmp slt i32 %n.060.modify.clone, %2
  br i1 %cmp_slt, label %for.body11.lr.ph, label %for.cond18.preheader

for.body11.lr.ph:                                 ; preds = %for.cond18.preheader.modify
  %5 = load ptr, ptr %fir, align 4, !tbaa !16
  %6 = add i32 %2, %coeff_pos.059.modify.clone
  br label %for.body11

for.body11.lr.ph.modify:                          ; preds = %for.body
  %7 = load ptr, ptr %fir, align 4, !tbaa !16
  br label %for.body11.modify

for.body11.modify:                                ; preds = %for.body11.modify, %for.body11.lr.ph.modify
  %n.060.modify = phi i32 [ %spec.store.select, %for.body11.lr.ph.modify ], [ %inc16.modify, %for.body11.modify ]
  %coeff_pos.059.modify = phi i32 [ 0, %for.body11.lr.ph.modify ], [ %inc12.modify, %for.body11.modify ]
  %acc.058.modify = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %24, %for.body11.modify ]
  %acc = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %25, %for.body11.modify ]
  %acc4 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %26, %for.body11.modify ]
  %acc7 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %27, %for.body11.modify ]
  %acc10 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %28, %for.body11.modify ]
  %acc13 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %29, %for.body11.modify ]
  %acc17 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %30, %for.body11.modify ]
  %acc20 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %31, %for.body11.modify ]
  %add7 = or disjoint i32 %coeff_pos.059.modify, 7
  %arrayidx13.modify = getelementptr inbounds float, ptr %7, i32 %coeff_pos.059.modify
  %arrayidx15.modify = getelementptr inbounds float, ptr %1, i32 %n.060.modify
  %arrayidx2 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 1
  %arrayidx3 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 1
  %arrayidx5 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 2
  %arrayidx6 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 2
  %arrayidx8 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 3
  %arrayidx9 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 3
  %arrayidx11 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 4
  %arrayidx12 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 4
  %arrayidx14 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 5
  %arrayidx16 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 5
  %arrayidx18 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 6
  %arrayidx19 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 6
  %arrayidx21 = getelementptr inbounds float, ptr %7, i32 %add7
  %arrayidx22 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 7
  %8 = load float, ptr %arrayidx13.modify, align 4, !tbaa !14
  %9 = load float, ptr %arrayidx15.modify, align 4, !tbaa !14
  %10 = load float, ptr %arrayidx2, align 4, !tbaa !14
  %11 = load float, ptr %arrayidx3, align 4, !tbaa !14
  %12 = load float, ptr %arrayidx5, align 4, !tbaa !14
  %13 = load float, ptr %arrayidx6, align 4, !tbaa !14
  %14 = load float, ptr %arrayidx8, align 4, !tbaa !14
  %15 = load float, ptr %arrayidx9, align 4, !tbaa !14
  %16 = load float, ptr %arrayidx11, align 4, !tbaa !14
  %17 = load float, ptr %arrayidx12, align 4, !tbaa !14
  %18 = load float, ptr %arrayidx14, align 4, !tbaa !14
  %19 = load float, ptr %arrayidx16, align 4, !tbaa !14
  %20 = load float, ptr %arrayidx18, align 4, !tbaa !14
  %21 = load float, ptr %arrayidx19, align 4, !tbaa !14
  %22 = load float, ptr %arrayidx21, align 4, !tbaa !14
  %23 = load float, ptr %arrayidx22, align 4, !tbaa !14
  %24 = tail call float @llvm.fmuladd.f32(float %8, float %9, float %acc.058.modify)
  %25 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %acc)
  %26 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %acc4)
  %27 = tail call float @llvm.fmuladd.f32(float %14, float %15, float %acc7)
  %28 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %acc10)
  %29 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %acc13)
  %30 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %acc17)
  %31 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %acc20)
  %inc12.modify = add nuw nsw i32 %coeff_pos.059.modify, 8
  %inc16.modify = add nsw i32 %n.060.modify, 8
  %cmp11 = icmp slt i32 %inc16.modify, %sub
  br i1 %cmp11, label %for.body11.modify, label %for.cond18.preheader.modify, !llvm.loop !17

for.cond18.preheader.loopexit:                    ; preds = %for.body11
  %32 = sub i32 %6, %n.060.modify.clone
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond18.preheader.loopexit, %for.cond18.preheader.modify
  %acc.0.lcssa = phi float [ %acc.058.modify.clone, %for.cond18.preheader.modify ], [ %37, %for.cond18.preheader.loopexit ]
  %coeff_pos.0.lcssa = phi i32 [ %coeff_pos.059.modify.clone, %for.cond18.preheader.modify ], [ %32, %for.cond18.preheader.loopexit ]
  %33 = add nsw i32 %spec.store.select, -7
  %cmp2062 = icmp sgt i32 %spec.store.select, 7
  br i1 %cmp2062, label %for.body22.lr.ph.modify, label %for.cond.cleanup21

for.body22.lr.ph:                                 ; preds = %for.cond.cleanup21
  %34 = load ptr, ptr %fir, align 4, !tbaa !16
  br label %for.body22

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph
  %n.060 = phi i32 [ %n.060.modify.clone, %for.body11.lr.ph ], [ %inc16, %for.body11 ]
  %coeff_pos.059 = phi i32 [ %coeff_pos.059.modify.clone, %for.body11.lr.ph ], [ %inc12, %for.body11 ]
  %acc.058 = phi float [ %acc.058.modify.clone, %for.body11.lr.ph ], [ %37, %for.body11 ]
  %inc12 = add nuw i32 %coeff_pos.059, 1
  %arrayidx13 = getelementptr inbounds float, ptr %5, i32 %coeff_pos.059
  %35 = load float, ptr %arrayidx13, align 4, !tbaa !14
  %arrayidx15 = getelementptr inbounds float, ptr %1, i32 %n.060
  %36 = load float, ptr %arrayidx15, align 4, !tbaa !14
  %37 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %acc.058)
  %inc16 = add nsw i32 %n.060, 1
  %exitcond.not = icmp eq i32 %inc16, %2
  br i1 %exitcond.not, label %for.cond18.preheader.loopexit, label %for.body11, !llvm.loop !17

for.cond.cleanup21:                               ; preds = %for.body22.modify, %for.cond18.preheader
  %n17.065.modify.clone = phi i32 [ 0, %for.cond18.preheader ], [ %39, %for.body22.modify ]
  %coeff_pos.164.modify.clone = phi i32 [ %coeff_pos.0.lcssa, %for.cond18.preheader ], [ %inc24.modify, %for.body22.modify ]
  %acc.163.modify.clone = phi float [ %acc.0.lcssa, %for.cond18.preheader ], [ %56, %for.body22.modify ]
  %acc24.clone = phi float [ %acc.clone, %for.cond18.preheader ], [ %57, %for.body22.modify ]
  %acc30.clone = phi float [ %acc4.clone, %for.cond18.preheader ], [ %58, %for.body22.modify ]
  %acc35.clone = phi float [ %acc7.clone, %for.cond18.preheader ], [ %59, %for.body22.modify ]
  %acc39.clone = phi float [ %acc10.clone, %for.cond18.preheader ], [ %60, %for.body22.modify ]
  %acc43.clone = phi float [ %acc13.clone, %for.cond18.preheader ], [ %61, %for.body22.modify ]
  %acc47.clone = phi float [ %acc17.clone, %for.cond18.preheader ], [ %62, %for.body22.modify ]
  %acc51.clone = phi float [ %acc20.clone, %for.cond18.preheader ], [ %63, %for.body22.modify ]
  %cmp54 = icmp slt i32 %n17.065.modify.clone, %spec.store.select
  br i1 %cmp54, label %for.body22.lr.ph, label %for.end, !llvm.loop !19

for.body22.lr.ph.modify:                          ; preds = %for.cond18.preheader
  %38 = load ptr, ptr %fir, align 4, !tbaa !16
  %39 = and i32 %spec.store.select, 2147483640
  br label %for.body22.modify

for.body22.modify:                                ; preds = %for.body22.modify, %for.body22.lr.ph.modify
  %n17.065.modify = phi i32 [ 0, %for.body22.lr.ph.modify ], [ %inc29.modify, %for.body22.modify ]
  %coeff_pos.164.modify = phi i32 [ %coeff_pos.0.lcssa, %for.body22.lr.ph.modify ], [ %inc24.modify, %for.body22.modify ]
  %acc.163.modify = phi float [ %acc.0.lcssa, %for.body22.lr.ph.modify ], [ %56, %for.body22.modify ]
  %acc24 = phi float [ %acc.clone, %for.body22.lr.ph.modify ], [ %57, %for.body22.modify ]
  %acc30 = phi float [ %acc4.clone, %for.body22.lr.ph.modify ], [ %58, %for.body22.modify ]
  %acc35 = phi float [ %acc7.clone, %for.body22.lr.ph.modify ], [ %59, %for.body22.modify ]
  %acc39 = phi float [ %acc10.clone, %for.body22.lr.ph.modify ], [ %60, %for.body22.modify ]
  %acc43 = phi float [ %acc13.clone, %for.body22.lr.ph.modify ], [ %61, %for.body22.modify ]
  %acc47 = phi float [ %acc17.clone, %for.body22.lr.ph.modify ], [ %62, %for.body22.modify ]
  %acc51 = phi float [ %acc20.clone, %for.body22.lr.ph.modify ], [ %63, %for.body22.modify ]
  %add123 = or disjoint i32 %n17.065.modify, 1
  %add229 = or disjoint i32 %n17.065.modify, 2
  %add334 = or disjoint i32 %n17.065.modify, 3
  %add438 = or disjoint i32 %n17.065.modify, 4
  %add542 = or disjoint i32 %n17.065.modify, 5
  %add646 = or disjoint i32 %n17.065.modify, 6
  %add750 = or disjoint i32 %n17.065.modify, 7
  %arrayidx25.modify = getelementptr inbounds float, ptr %38, i32 %coeff_pos.164.modify
  %arrayidx27.modify = getelementptr inbounds float, ptr %1, i32 %n17.065.modify
  %arrayidx26 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 1
  %arrayidx28 = getelementptr inbounds float, ptr %1, i32 %add123
  %arrayidx32 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 2
  %arrayidx33 = getelementptr inbounds float, ptr %1, i32 %add229
  %arrayidx36 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 3
  %arrayidx37 = getelementptr inbounds float, ptr %1, i32 %add334
  %arrayidx40 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 4
  %arrayidx41 = getelementptr inbounds float, ptr %1, i32 %add438
  %arrayidx44 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 5
  %arrayidx45 = getelementptr inbounds float, ptr %1, i32 %add542
  %arrayidx48 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 6
  %arrayidx49 = getelementptr inbounds float, ptr %1, i32 %add646
  %arrayidx52 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 7
  %arrayidx53 = getelementptr inbounds float, ptr %1, i32 %add750
  %40 = load float, ptr %arrayidx25.modify, align 4, !tbaa !14
  %41 = load float, ptr %arrayidx27.modify, align 4, !tbaa !14
  %42 = load float, ptr %arrayidx26, align 4, !tbaa !14
  %43 = load float, ptr %arrayidx28, align 4, !tbaa !14
  %44 = load float, ptr %arrayidx32, align 4, !tbaa !14
  %45 = load float, ptr %arrayidx33, align 4, !tbaa !14
  %46 = load float, ptr %arrayidx36, align 4, !tbaa !14
  %47 = load float, ptr %arrayidx37, align 4, !tbaa !14
  %48 = load float, ptr %arrayidx40, align 4, !tbaa !14
  %49 = load float, ptr %arrayidx41, align 4, !tbaa !14
  %50 = load float, ptr %arrayidx44, align 4, !tbaa !14
  %51 = load float, ptr %arrayidx45, align 4, !tbaa !14
  %52 = load float, ptr %arrayidx48, align 4, !tbaa !14
  %53 = load float, ptr %arrayidx49, align 4, !tbaa !14
  %54 = load float, ptr %arrayidx52, align 4, !tbaa !14
  %55 = load float, ptr %arrayidx53, align 4, !tbaa !14
  %56 = tail call float @llvm.fmuladd.f32(float %40, float %41, float %acc.163.modify)
  %57 = tail call float @llvm.fmuladd.f32(float %42, float %43, float %acc24)
  %58 = tail call float @llvm.fmuladd.f32(float %44, float %45, float %acc30)
  %59 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %acc35)
  %60 = tail call float @llvm.fmuladd.f32(float %48, float %49, float %acc39)
  %61 = tail call float @llvm.fmuladd.f32(float %50, float %51, float %acc43)
  %62 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %acc47)
  %63 = tail call float @llvm.fmuladd.f32(float %54, float %55, float %acc51)
  %inc24.modify = add nuw nsw i32 %coeff_pos.164.modify, 8
  %inc29.modify = add nuw nsw i32 %n17.065.modify, 8
  %cmp = icmp slt i32 %inc29.modify, %33
  br i1 %cmp, label %for.body22.modify, label %for.cond.cleanup21, !llvm.loop !20

for.body22:                                       ; preds = %for.body22, %for.body22.lr.ph
  %n17.065 = phi i32 [ %n17.065.modify.clone, %for.body22.lr.ph ], [ %inc29, %for.body22 ]
  %coeff_pos.164 = phi i32 [ %coeff_pos.164.modify.clone, %for.body22.lr.ph ], [ %inc24, %for.body22 ]
  %acc.163 = phi float [ %acc.163.modify.clone, %for.body22.lr.ph ], [ %66, %for.body22 ]
  %inc24 = add nuw nsw i32 %coeff_pos.164, 1
  %arrayidx25 = getelementptr inbounds float, ptr %34, i32 %coeff_pos.164
  %64 = load float, ptr %arrayidx25, align 4, !tbaa !14
  %arrayidx27 = getelementptr inbounds float, ptr %1, i32 %n17.065
  %65 = load float, ptr %arrayidx27, align 4, !tbaa !14
  %66 = tail call float @llvm.fmuladd.f32(float %64, float %65, float %acc.163)
  %inc29 = add nuw nsw i32 %n17.065, 1
  %exitcond70.not = icmp eq i32 %inc29, %spec.store.select
  br i1 %exitcond70.not, label %for.end, label %for.body22, !llvm.loop !20

for.end:                                          ; preds = %for.body22, %for.cond.cleanup21
  %67 = phi float [ %acc.163.modify.clone, %for.cond.cleanup21 ], [ %66, %for.body22 ]
  %add139 = fadd float %acc24.clone, %67
  %add140 = fadd float %acc30.clone, %add139
  %add141 = fadd float %acc35.clone, %add140
  %add142 = fadd float %acc39.clone, %add141
  %add143 = fadd float %acc43.clone, %add142
  %add144 = fadd float %acc47.clone, %add143
  %add145 = fadd float %acc51.clone, %add144
  %arrayidx31.modify = getelementptr inbounds float, ptr %output, i32 %i.068
  store float %add145, ptr %arrayidx31.modify, align 4, !tbaa !14
  %inc33.modify = add nuw nsw i32 %i.068, 1
  %exitcond71.not.modify = icmp eq i32 %inc33.modify, %len
  br i1 %exitcond71.not.modify, label %if.end, label %for.body, !llvm.loop !19

for.body.lr.ph.clone.preheader:                   ; preds = %entry
  %cmp151349 = icmp sgt i32 %len, 0
  br i1 %cmp151349, label %for.body.lr.ph.clone, label %if.end

for.body.lr.ph.clone:                             ; preds = %for.body.lr.ph.clone.preheader
  %delay.clone = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %68 = load ptr, ptr %delay.clone, align 4, !tbaa !5
  %pos.clone = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N.clone = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %69 = load i32, ptr %N.clone, align 4, !tbaa !12
  %.pre.clone = load i32, ptr %pos.clone, align 4, !tbaa !13
  br label %for.body.clone

for.body.clone:                                   ; preds = %for.cond.cleanup21.clone, %for.body.lr.ph.clone
  %70 = phi i32 [ %.pre.clone, %for.body.lr.ph.clone ], [ %spec.store.select.clone, %for.cond.cleanup21.clone ]
  %i.068.clone = phi i32 [ 0, %for.body.lr.ph.clone ], [ %inc33.clone, %for.cond.cleanup21.clone ]
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %i.068.clone
  %71 = load float, ptr %arrayidx.clone, align 4, !tbaa !14
  %arrayidx1.clone = getelementptr inbounds float, ptr %68, i32 %70
  store float %71, ptr %arrayidx1.clone, align 4, !tbaa !14
  %inc.clone = add nsw i32 %70, 1
  %cmp4.not.clone = icmp slt i32 %inc.clone, %69
  %spec.store.select.clone = select i1 %cmp4.not.clone, i32 %inc.clone, i32 0
  store i32 %spec.store.select.clone, ptr %pos.clone, align 4
  %cmp957.clone = icmp slt i32 %spec.store.select.clone, %69
  br i1 %cmp957.clone, label %for.body11.lr.ph.clone, label %for.cond18.preheader.clone

for.body11.lr.ph.clone:                           ; preds = %for.body.clone
  %72 = load ptr, ptr %fir, align 4, !tbaa !16
  %73 = sub i32 %69, %spec.store.select.clone
  br label %for.body11.clone

for.body11.clone:                                 ; preds = %for.body11.clone, %for.body11.lr.ph.clone
  %n.060.clone = phi i32 [ %spec.store.select.clone, %for.body11.lr.ph.clone ], [ %inc16.clone, %for.body11.clone ]
  %coeff_pos.059.clone = phi i32 [ 0, %for.body11.lr.ph.clone ], [ %inc12.clone, %for.body11.clone ]
  %acc.058.clone = phi float [ 0.000000e+00, %for.body11.lr.ph.clone ], [ %76, %for.body11.clone ]
  %inc12.clone = add nuw i32 %coeff_pos.059.clone, 1
  %arrayidx13.clone = getelementptr inbounds float, ptr %72, i32 %coeff_pos.059.clone
  %74 = load float, ptr %arrayidx13.clone, align 4, !tbaa !14
  %arrayidx15.clone = getelementptr inbounds float, ptr %68, i32 %n.060.clone
  %75 = load float, ptr %arrayidx15.clone, align 4, !tbaa !14
  %76 = tail call float @llvm.fmuladd.f32(float %74, float %75, float %acc.058.clone)
  %inc16.clone = add nsw i32 %n.060.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc12.clone, %73
  br i1 %exitcond.not.clone, label %for.cond18.preheader.clone, label %for.body11.clone, !llvm.loop !17

for.cond18.preheader.clone:                       ; preds = %for.body11.clone, %for.body.clone
  %acc.0.lcssa.clone = phi float [ 0.000000e+00, %for.body.clone ], [ %76, %for.body11.clone ]
  %coeff_pos.0.lcssa.clone = phi i32 [ 0, %for.body.clone ], [ %73, %for.body11.clone ]
  %cmp2062.clone = icmp sgt i32 %spec.store.select.clone, 0
  br i1 %cmp2062.clone, label %for.body22.lr.ph.clone, label %for.cond.cleanup21.clone

for.body22.lr.ph.clone:                           ; preds = %for.cond18.preheader.clone
  %77 = load ptr, ptr %fir, align 4, !tbaa !16
  br label %for.body22.clone

for.body22.clone:                                 ; preds = %for.body22.clone, %for.body22.lr.ph.clone
  %n17.065.clone = phi i32 [ 0, %for.body22.lr.ph.clone ], [ %inc29.clone, %for.body22.clone ]
  %coeff_pos.164.clone = phi i32 [ %coeff_pos.0.lcssa.clone, %for.body22.lr.ph.clone ], [ %inc24.clone, %for.body22.clone ]
  %acc.163.clone = phi float [ %acc.0.lcssa.clone, %for.body22.lr.ph.clone ], [ %80, %for.body22.clone ]
  %inc24.clone = add nuw nsw i32 %coeff_pos.164.clone, 1
  %arrayidx25.clone = getelementptr inbounds float, ptr %77, i32 %coeff_pos.164.clone
  %78 = load float, ptr %arrayidx25.clone, align 4, !tbaa !14
  %arrayidx27.clone = getelementptr inbounds float, ptr %68, i32 %n17.065.clone
  %79 = load float, ptr %arrayidx27.clone, align 4, !tbaa !14
  %80 = tail call float @llvm.fmuladd.f32(float %78, float %79, float %acc.163.clone)
  %inc29.clone = add nuw nsw i32 %n17.065.clone, 1
  %exitcond70.not.clone = icmp eq i32 %inc29.clone, %spec.store.select.clone
  br i1 %exitcond70.not.clone, label %for.cond.cleanup21.clone, label %for.body22.clone, !llvm.loop !20

for.cond.cleanup21.clone:                         ; preds = %for.body22.clone, %for.cond18.preheader.clone
  %acc.1.lcssa.clone = phi float [ %acc.0.lcssa.clone, %for.cond18.preheader.clone ], [ %80, %for.body22.clone ]
  %arrayidx31.clone = getelementptr inbounds float, ptr %output, i32 %i.068.clone
  store float %acc.1.lcssa.clone, ptr %arrayidx31.clone, align 4, !tbaa !14
  %inc33.clone = add nuw nsw i32 %i.068.clone, 1
  %exitcond71.not.clone = icmp eq i32 %inc33.clone, %len
  br i1 %exitcond71.not.clone, label %if.end, label %for.body.clone, !llvm.loop !19

if.end:                                           ; preds = %for.end, %for.body.lr.ph.clone.preheader, %for.cond.cleanup21.clone
  ret i32 0
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-172-g9dacbc0)"}
!4 = !{!"unroll_fir_like"}
!5 = !{!6, !7, i64 4}
!6 = !{!"fir_f32_s", !7, i64 0, !7, i64 4, !10, i64 8, !10, i64 12, !10, i64 16, !11, i64 20}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"short", !8, i64 0}
!12 = !{!6, !10, i64 8}
!13 = !{!6, !10, i64 12}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !8, i64 0}
!16 = !{!6, !7, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = distinct !{!19, !18}
!20 = distinct !{!20, !18}
