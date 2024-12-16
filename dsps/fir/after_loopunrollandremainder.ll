; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_fir_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fir_f32_ansi(ptr noalias nocapture noundef %fir, ptr noalias nocapture noundef readonly %input, ptr noalias nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.cond.preheader, label %for.body.lr.ph.clone.preheader

for.cond.preheader:                               ; preds = %entry
  %delay = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %1 = load ptr, ptr %delay, align 4, !tbaa !4
  %pos = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %2 = load i32, ptr %N, align 4, !tbaa !11
  %sub = add nsw i32 %2, -7
  %.pre = load i32, ptr %pos, align 4, !tbaa !12
  br label %for.body

for.body:                                         ; preds = %for.end, %for.cond.preheader
  %3 = phi i32 [ %.pre, %for.cond.preheader ], [ %spec.store.select, %for.end ]
  %i.068 = phi i32 [ 0, %for.cond.preheader ], [ %inc33.modify, %for.end ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.068
  %4 = load float, ptr %arrayidx, align 4, !tbaa !13
  %arrayidx1 = getelementptr inbounds float, ptr %1, i32 %3
  store float %4, ptr %arrayidx1, align 4, !tbaa !13
  %inc = add nsw i32 %3, 1
  %cmp4.not = icmp slt i32 %inc, %2
  %spec.store.select = select i1 %cmp4.not, i32 %inc, i32 0
  store i32 %spec.store.select, ptr %pos, align 4
  %cmp957 = icmp slt i32 %spec.store.select, %sub
  br i1 %cmp957, label %for.body11.lr.ph.modify, label %for.cond18.preheader.modify

for.cond18.preheader.modify:                      ; preds = %for.body11.modify, %for.body
  %n.060.modify.clone = phi i32 [ %spec.store.select, %for.body ], [ %inc16.modify, %for.body11.modify ]
  %coeff_pos.059.modify.clone = phi i32 [ 0, %for.body ], [ %inc12.modify, %for.body11.modify ]
  %acc.058.modify.clone = phi float [ 0.000000e+00, %for.body ], [ %23, %for.body11.modify ]
  %acc.clone = phi float [ 0.000000e+00, %for.body ], [ %24, %for.body11.modify ]
  %acc78.clone = phi float [ 0.000000e+00, %for.body ], [ %25, %for.body11.modify ]
  %acc81.clone = phi float [ 0.000000e+00, %for.body ], [ %26, %for.body11.modify ]
  %acc84.clone = phi float [ 0.000000e+00, %for.body ], [ %27, %for.body11.modify ]
  %acc87.clone = phi float [ 0.000000e+00, %for.body ], [ %28, %for.body11.modify ]
  %acc90.clone = phi float [ 0.000000e+00, %for.body ], [ %29, %for.body11.modify ]
  %acc93.clone = phi float [ 0.000000e+00, %for.body ], [ %30, %for.body11.modify ]
  %cmp_slt = icmp slt i32 %n.060.modify.clone, %2
  br i1 %cmp_slt, label %for.body11.lr.ph, label %for.cond18.preheader

for.body11.lr.ph:                                 ; preds = %for.cond18.preheader.modify
  %5 = load ptr, ptr %fir, align 4, !tbaa !15
  br label %for.body11

for.body11.lr.ph.modify:                          ; preds = %for.body
  %6 = load ptr, ptr %fir, align 4, !tbaa !15
  br label %for.body11.modify

for.body11.modify:                                ; preds = %for.body11.modify, %for.body11.lr.ph.modify
  %n.060.modify = phi i32 [ %spec.store.select, %for.body11.lr.ph.modify ], [ %inc16.modify, %for.body11.modify ]
  %coeff_pos.059.modify = phi i32 [ 0, %for.body11.lr.ph.modify ], [ %inc12.modify, %for.body11.modify ]
  %acc.058.modify = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %23, %for.body11.modify ]
  %acc = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %24, %for.body11.modify ]
  %acc78 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %25, %for.body11.modify ]
  %acc81 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %26, %for.body11.modify ]
  %acc84 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %27, %for.body11.modify ]
  %acc87 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %28, %for.body11.modify ]
  %acc90 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %29, %for.body11.modify ]
  %acc93 = phi float [ 0.000000e+00, %for.body11.lr.ph.modify ], [ %30, %for.body11.modify ]
  %inc12.modify = add nuw nsw i32 %coeff_pos.059.modify, 8
  %inc16.modify = add nsw i32 %n.060.modify, 8
  %add7 = or disjoint i32 %coeff_pos.059.modify, 7
  %arrayidx13.modify = getelementptr inbounds float, ptr %6, i32 %coeff_pos.059.modify
  %arrayidx15.modify = getelementptr inbounds float, ptr %1, i32 %n.060.modify
  %arrayidx76 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 1
  %arrayidx77 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 1
  %arrayidx79 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 2
  %arrayidx80 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 2
  %arrayidx82 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 3
  %arrayidx83 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 3
  %arrayidx85 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 4
  %arrayidx86 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 4
  %arrayidx88 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 5
  %arrayidx89 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 5
  %arrayidx91 = getelementptr inbounds float, ptr %arrayidx13.modify, i32 6
  %arrayidx92 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 6
  %arrayidx94 = getelementptr inbounds float, ptr %6, i32 %add7
  %arrayidx95 = getelementptr inbounds float, ptr %arrayidx15.modify, i32 7
  %7 = load float, ptr %arrayidx13.modify, align 4, !tbaa !13
  %8 = load float, ptr %arrayidx15.modify, align 4, !tbaa !13
  %9 = load float, ptr %arrayidx76, align 4, !tbaa !13
  %10 = load float, ptr %arrayidx77, align 4, !tbaa !13
  %11 = load float, ptr %arrayidx79, align 4, !tbaa !13
  %12 = load float, ptr %arrayidx80, align 4, !tbaa !13
  %13 = load float, ptr %arrayidx82, align 4, !tbaa !13
  %14 = load float, ptr %arrayidx83, align 4, !tbaa !13
  %15 = load float, ptr %arrayidx85, align 4, !tbaa !13
  %16 = load float, ptr %arrayidx86, align 4, !tbaa !13
  %17 = load float, ptr %arrayidx88, align 4, !tbaa !13
  %18 = load float, ptr %arrayidx89, align 4, !tbaa !13
  %19 = load float, ptr %arrayidx91, align 4, !tbaa !13
  %20 = load float, ptr %arrayidx92, align 4, !tbaa !13
  %21 = load float, ptr %arrayidx94, align 4, !tbaa !13
  %22 = load float, ptr %arrayidx95, align 4, !tbaa !13
  %23 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %acc.058.modify)
  %24 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %acc)
  %25 = tail call float @llvm.fmuladd.f32(float %11, float %12, float %acc78)
  %26 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %acc81)
  %27 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %acc84)
  %28 = tail call float @llvm.fmuladd.f32(float %17, float %18, float %acc87)
  %29 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %acc90)
  %30 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %acc93)
  %cmp11 = icmp slt i32 %inc16.modify, %sub
  br i1 %cmp11, label %for.body11.modify, label %for.cond18.preheader.modify, !llvm.loop !16

for.cond18.preheader.loopexit:                    ; preds = %for.body11
  %n.060.modify.clone.neg = sub i32 0, %n.060.modify.clone
  %31 = add i32 %n.060.modify.clone.neg, %2
  %32 = add i32 %31, %coeff_pos.059.modify.clone
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond18.preheader.loopexit, %for.cond18.preheader.modify
  %acc.0.lcssa = phi float [ %acc.058.modify.clone, %for.cond18.preheader.modify ], [ %37, %for.cond18.preheader.loopexit ]
  %coeff_pos.0.lcssa = phi i32 [ %coeff_pos.059.modify.clone, %for.cond18.preheader.modify ], [ %32, %for.cond18.preheader.loopexit ]
  %33 = add nsw i32 %spec.store.select, -7
  %cmp2062 = icmp sgt i32 %spec.store.select, 7
  br i1 %cmp2062, label %for.body22.lr.ph.modify, label %for.cond.cleanup21

for.body22.lr.ph:                                 ; preds = %for.cond.cleanup21
  %34 = load ptr, ptr %fir, align 4, !tbaa !15
  br label %for.body22

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph
  %n.060 = phi i32 [ %n.060.modify.clone, %for.body11.lr.ph ], [ %inc16, %for.body11 ]
  %coeff_pos.059 = phi i32 [ %coeff_pos.059.modify.clone, %for.body11.lr.ph ], [ %inc12, %for.body11 ]
  %acc.058 = phi float [ %acc.058.modify.clone, %for.body11.lr.ph ], [ %37, %for.body11 ]
  %inc12 = add nuw i32 %coeff_pos.059, 1
  %arrayidx13 = getelementptr inbounds float, ptr %5, i32 %coeff_pos.059
  %35 = load float, ptr %arrayidx13, align 4, !tbaa !13
  %arrayidx15 = getelementptr inbounds float, ptr %1, i32 %n.060
  %36 = load float, ptr %arrayidx15, align 4, !tbaa !13
  %37 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %acc.058)
  %inc16 = add nsw i32 %n.060, 1
  %exitcond.not = icmp eq i32 %inc16, %2
  br i1 %exitcond.not, label %for.cond18.preheader.loopexit, label %for.body11, !llvm.loop !16

for.cond.cleanup21:                               ; preds = %for.body22.modify, %for.cond18.preheader
  %n17.065.modify.clone = phi i32 [ 0, %for.cond18.preheader ], [ %39, %for.body22.modify ]
  %coeff_pos.164.modify.clone = phi i32 [ %coeff_pos.0.lcssa, %for.cond18.preheader ], [ %inc24.modify, %for.body22.modify ]
  %acc.163.modify.clone = phi float [ %acc.0.lcssa, %for.cond18.preheader ], [ %56, %for.body22.modify ]
  %acc96.clone = phi float [ %acc.clone, %for.cond18.preheader ], [ %57, %for.body22.modify ]
  %acc99.clone = phi float [ %acc78.clone, %for.cond18.preheader ], [ %58, %for.body22.modify ]
  %acc102.clone = phi float [ %acc81.clone, %for.cond18.preheader ], [ %59, %for.body22.modify ]
  %acc105.clone = phi float [ %acc84.clone, %for.cond18.preheader ], [ %60, %for.body22.modify ]
  %acc108.clone = phi float [ %acc87.clone, %for.cond18.preheader ], [ %61, %for.body22.modify ]
  %acc111.clone = phi float [ %acc90.clone, %for.cond18.preheader ], [ %62, %for.body22.modify ]
  %acc115.clone = phi float [ %acc93.clone, %for.cond18.preheader ], [ %63, %for.body22.modify ]
  %cmp118 = icmp slt i32 %n17.065.modify.clone, %spec.store.select
  br i1 %cmp118, label %for.body22.lr.ph, label %for.end, !llvm.loop !18

for.body22.lr.ph.modify:                          ; preds = %for.cond18.preheader
  %38 = load ptr, ptr %fir, align 4, !tbaa !15
  %39 = and i32 %spec.store.select, 2147483640
  br label %for.body22.modify

for.body22.modify:                                ; preds = %for.body22.modify, %for.body22.lr.ph.modify
  %n17.065.modify = phi i32 [ 0, %for.body22.lr.ph.modify ], [ %inc29.modify, %for.body22.modify ]
  %coeff_pos.164.modify = phi i32 [ %coeff_pos.0.lcssa, %for.body22.lr.ph.modify ], [ %inc24.modify, %for.body22.modify ]
  %acc.163.modify = phi float [ %acc.0.lcssa, %for.body22.lr.ph.modify ], [ %56, %for.body22.modify ]
  %acc96 = phi float [ %acc.clone, %for.body22.lr.ph.modify ], [ %57, %for.body22.modify ]
  %acc99 = phi float [ %acc78.clone, %for.body22.lr.ph.modify ], [ %58, %for.body22.modify ]
  %acc102 = phi float [ %acc81.clone, %for.body22.lr.ph.modify ], [ %59, %for.body22.modify ]
  %acc105 = phi float [ %acc84.clone, %for.body22.lr.ph.modify ], [ %60, %for.body22.modify ]
  %acc108 = phi float [ %acc87.clone, %for.body22.lr.ph.modify ], [ %61, %for.body22.modify ]
  %acc111 = phi float [ %acc90.clone, %for.body22.lr.ph.modify ], [ %62, %for.body22.modify ]
  %acc115 = phi float [ %acc93.clone, %for.body22.lr.ph.modify ], [ %63, %for.body22.modify ]
  %inc24.modify = add nuw nsw i32 %coeff_pos.164.modify, 8
  %inc29.modify = add nuw nsw i32 %n17.065.modify, 8
  %add1 = or disjoint i32 %n17.065.modify, 1
  %add2 = or disjoint i32 %n17.065.modify, 2
  %add3 = or disjoint i32 %n17.065.modify, 3
  %add4 = or disjoint i32 %n17.065.modify, 4
  %add5 = or disjoint i32 %n17.065.modify, 5
  %add6 = or disjoint i32 %n17.065.modify, 6
  %add7114 = or disjoint i32 %n17.065.modify, 7
  %arrayidx25.modify = getelementptr inbounds float, ptr %38, i32 %coeff_pos.164.modify
  %arrayidx27.modify = getelementptr inbounds float, ptr %1, i32 %n17.065.modify
  %arrayidx97 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 1
  %arrayidx98 = getelementptr inbounds float, ptr %1, i32 %add1
  %arrayidx100 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 2
  %arrayidx101 = getelementptr inbounds float, ptr %1, i32 %add2
  %arrayidx103 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 3
  %arrayidx104 = getelementptr inbounds float, ptr %1, i32 %add3
  %arrayidx106 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 4
  %arrayidx107 = getelementptr inbounds float, ptr %1, i32 %add4
  %arrayidx109 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 5
  %arrayidx110 = getelementptr inbounds float, ptr %1, i32 %add5
  %arrayidx112 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 6
  %arrayidx113 = getelementptr inbounds float, ptr %1, i32 %add6
  %arrayidx116 = getelementptr inbounds float, ptr %arrayidx25.modify, i32 7
  %arrayidx117 = getelementptr inbounds float, ptr %1, i32 %add7114
  %40 = load float, ptr %arrayidx25.modify, align 4, !tbaa !13
  %41 = load float, ptr %arrayidx27.modify, align 4, !tbaa !13
  %42 = load float, ptr %arrayidx97, align 4, !tbaa !13
  %43 = load float, ptr %arrayidx98, align 4, !tbaa !13
  %44 = load float, ptr %arrayidx100, align 4, !tbaa !13
  %45 = load float, ptr %arrayidx101, align 4, !tbaa !13
  %46 = load float, ptr %arrayidx103, align 4, !tbaa !13
  %47 = load float, ptr %arrayidx104, align 4, !tbaa !13
  %48 = load float, ptr %arrayidx106, align 4, !tbaa !13
  %49 = load float, ptr %arrayidx107, align 4, !tbaa !13
  %50 = load float, ptr %arrayidx109, align 4, !tbaa !13
  %51 = load float, ptr %arrayidx110, align 4, !tbaa !13
  %52 = load float, ptr %arrayidx112, align 4, !tbaa !13
  %53 = load float, ptr %arrayidx113, align 4, !tbaa !13
  %54 = load float, ptr %arrayidx116, align 4, !tbaa !13
  %55 = load float, ptr %arrayidx117, align 4, !tbaa !13
  %56 = tail call float @llvm.fmuladd.f32(float %40, float %41, float %acc.163.modify)
  %57 = tail call float @llvm.fmuladd.f32(float %42, float %43, float %acc96)
  %58 = tail call float @llvm.fmuladd.f32(float %44, float %45, float %acc99)
  %59 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %acc102)
  %60 = tail call float @llvm.fmuladd.f32(float %48, float %49, float %acc105)
  %61 = tail call float @llvm.fmuladd.f32(float %50, float %51, float %acc108)
  %62 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %acc111)
  %63 = tail call float @llvm.fmuladd.f32(float %54, float %55, float %acc115)
  %cmp = icmp slt i32 %inc29.modify, %33
  br i1 %cmp, label %for.body22.modify, label %for.cond.cleanup21, !llvm.loop !19

for.body22:                                       ; preds = %for.body22, %for.body22.lr.ph
  %n17.065 = phi i32 [ %n17.065.modify.clone, %for.body22.lr.ph ], [ %inc29, %for.body22 ]
  %coeff_pos.164 = phi i32 [ %coeff_pos.164.modify.clone, %for.body22.lr.ph ], [ %inc24, %for.body22 ]
  %acc.163 = phi float [ %acc.163.modify.clone, %for.body22.lr.ph ], [ %66, %for.body22 ]
  %inc24 = add nuw nsw i32 %coeff_pos.164, 1
  %arrayidx25 = getelementptr inbounds float, ptr %34, i32 %coeff_pos.164
  %64 = load float, ptr %arrayidx25, align 4, !tbaa !13
  %arrayidx27 = getelementptr inbounds float, ptr %1, i32 %n17.065
  %65 = load float, ptr %arrayidx27, align 4, !tbaa !13
  %66 = tail call float @llvm.fmuladd.f32(float %64, float %65, float %acc.163)
  %inc29 = add nuw nsw i32 %n17.065, 1
  %exitcond70.not = icmp eq i32 %inc29, %spec.store.select
  br i1 %exitcond70.not, label %for.end, label %for.body22, !llvm.loop !19

for.end:                                          ; preds = %for.body22, %for.cond.cleanup21
  %67 = phi float [ %acc.163.modify.clone, %for.cond.cleanup21 ], [ %66, %for.body22 ]
  %add139 = fadd float %acc96.clone, %67
  %add140 = fadd float %acc99.clone, %acc102.clone
  %add141 = fadd float %acc105.clone, %acc108.clone
  %add142 = fadd float %acc111.clone, %acc115.clone
  %add143 = fadd float %add140, %add139
  %add144 = fadd float %add141, %add142
  %add145 = fadd float %add144, %add143
  %arrayidx31.modify = getelementptr inbounds float, ptr %output, i32 %i.068
  store float %add145, ptr %arrayidx31.modify, align 4, !tbaa !13
  %inc33.modify = add nuw nsw i32 %i.068, 1
  %exitcond71.not.modify = icmp eq i32 %inc33.modify, %len
  br i1 %exitcond71.not.modify, label %if.end, label %for.body, !llvm.loop !18

for.body.lr.ph.clone.preheader:                   ; preds = %entry
  %cmp151349 = icmp sgt i32 %len, 0
  br i1 %cmp151349, label %for.body.lr.ph.clone, label %if.end

for.body.lr.ph.clone:                             ; preds = %for.body.lr.ph.clone.preheader
  %delay.clone = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %68 = load ptr, ptr %delay.clone, align 4, !tbaa !4
  %pos.clone = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N.clone = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %69 = load i32, ptr %N.clone, align 4, !tbaa !11
  %.pre.clone = load i32, ptr %pos.clone, align 4, !tbaa !12
  br label %for.body.clone

for.body.clone:                                   ; preds = %for.cond.cleanup21.clone, %for.body.lr.ph.clone
  %70 = phi i32 [ %.pre.clone, %for.body.lr.ph.clone ], [ %spec.store.select.clone, %for.cond.cleanup21.clone ]
  %i.068.clone = phi i32 [ 0, %for.body.lr.ph.clone ], [ %inc33.clone, %for.cond.cleanup21.clone ]
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %i.068.clone
  %71 = load float, ptr %arrayidx.clone, align 4, !tbaa !13
  %arrayidx1.clone = getelementptr inbounds float, ptr %68, i32 %70
  store float %71, ptr %arrayidx1.clone, align 4, !tbaa !13
  %inc.clone = add nsw i32 %70, 1
  %cmp4.not.clone = icmp slt i32 %inc.clone, %69
  %spec.store.select.clone = select i1 %cmp4.not.clone, i32 %inc.clone, i32 0
  store i32 %spec.store.select.clone, ptr %pos.clone, align 4
  %cmp957.clone = icmp slt i32 %spec.store.select.clone, %69
  br i1 %cmp957.clone, label %for.body11.lr.ph.clone, label %for.cond18.preheader.clone

for.body11.lr.ph.clone:                           ; preds = %for.body.clone
  %72 = load ptr, ptr %fir, align 4, !tbaa !15
  %73 = sub i32 %69, %spec.store.select.clone
  br label %for.body11.clone

for.body11.clone:                                 ; preds = %for.body11.clone, %for.body11.lr.ph.clone
  %n.060.clone = phi i32 [ %spec.store.select.clone, %for.body11.lr.ph.clone ], [ %inc16.clone, %for.body11.clone ]
  %coeff_pos.059.clone = phi i32 [ 0, %for.body11.lr.ph.clone ], [ %inc12.clone, %for.body11.clone ]
  %acc.058.clone = phi float [ 0.000000e+00, %for.body11.lr.ph.clone ], [ %76, %for.body11.clone ]
  %inc12.clone = add nuw i32 %coeff_pos.059.clone, 1
  %arrayidx13.clone = getelementptr inbounds float, ptr %72, i32 %coeff_pos.059.clone
  %74 = load float, ptr %arrayidx13.clone, align 4, !tbaa !13
  %arrayidx15.clone = getelementptr inbounds float, ptr %68, i32 %n.060.clone
  %75 = load float, ptr %arrayidx15.clone, align 4, !tbaa !13
  %76 = tail call float @llvm.fmuladd.f32(float %74, float %75, float %acc.058.clone)
  %inc16.clone = add nsw i32 %n.060.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc12.clone, %73
  br i1 %exitcond.not.clone, label %for.cond18.preheader.clone, label %for.body11.clone, !llvm.loop !16

for.cond18.preheader.clone:                       ; preds = %for.body11.clone, %for.body.clone
  %acc.0.lcssa.clone = phi float [ 0.000000e+00, %for.body.clone ], [ %76, %for.body11.clone ]
  %coeff_pos.0.lcssa.clone = phi i32 [ 0, %for.body.clone ], [ %73, %for.body11.clone ]
  %cmp2062.clone = icmp sgt i32 %spec.store.select.clone, 0
  br i1 %cmp2062.clone, label %for.body22.lr.ph.clone, label %for.cond.cleanup21.clone

for.body22.lr.ph.clone:                           ; preds = %for.cond18.preheader.clone
  %77 = load ptr, ptr %fir, align 4, !tbaa !15
  br label %for.body22.clone

for.body22.clone:                                 ; preds = %for.body22.clone, %for.body22.lr.ph.clone
  %n17.065.clone = phi i32 [ 0, %for.body22.lr.ph.clone ], [ %inc29.clone, %for.body22.clone ]
  %coeff_pos.164.clone = phi i32 [ %coeff_pos.0.lcssa.clone, %for.body22.lr.ph.clone ], [ %inc24.clone, %for.body22.clone ]
  %acc.163.clone = phi float [ %acc.0.lcssa.clone, %for.body22.lr.ph.clone ], [ %80, %for.body22.clone ]
  %inc24.clone = add nuw nsw i32 %coeff_pos.164.clone, 1
  %arrayidx25.clone = getelementptr inbounds float, ptr %77, i32 %coeff_pos.164.clone
  %78 = load float, ptr %arrayidx25.clone, align 4, !tbaa !13
  %arrayidx27.clone = getelementptr inbounds float, ptr %68, i32 %n17.065.clone
  %79 = load float, ptr %arrayidx27.clone, align 4, !tbaa !13
  %80 = tail call float @llvm.fmuladd.f32(float %78, float %79, float %acc.163.clone)
  %inc29.clone = add nuw nsw i32 %n17.065.clone, 1
  %exitcond70.not.clone = icmp eq i32 %inc29.clone, %spec.store.select.clone
  br i1 %exitcond70.not.clone, label %for.cond.cleanup21.clone, label %for.body22.clone, !llvm.loop !19

for.cond.cleanup21.clone:                         ; preds = %for.body22.clone, %for.cond18.preheader.clone
  %acc.1.lcssa.clone = phi float [ %acc.0.lcssa.clone, %for.cond18.preheader.clone ], [ %80, %for.body22.clone ]
  %arrayidx31.clone = getelementptr inbounds float, ptr %output, i32 %i.068.clone
  store float %acc.1.lcssa.clone, ptr %arrayidx31.clone, align 4, !tbaa !13
  %inc33.clone = add nuw nsw i32 %i.068.clone, 1
  %exitcond71.not.clone = icmp eq i32 %inc33.clone, %len
  br i1 %exitcond71.not.clone, label %if.end, label %for.body.clone, !llvm.loop !18

if.end:                                           ; preds = %for.cond.cleanup21.clone, %for.body.lr.ph.clone.preheader, %for.end
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197)"}
!4 = !{!5, !6, i64 4}
!5 = !{!"fir_f32_s", !6, i64 0, !6, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !10, i64 20}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"short", !7, i64 0}
!11 = !{!5, !9, i64 8}
!12 = !{!5, !9, i64 12}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !7, i64 0}
!15 = !{!5, !6, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
!19 = distinct !{!19, !17}
