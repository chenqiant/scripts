; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_ccorr_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_ccorr_f32_ansi(ptr noalias noundef readonly %Signal, i32 noundef %siglen, ptr noalias noundef readonly %Kernel, i32 noundef %kernlen, ptr noalias noundef writeonly %corrvout) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %Signal, null
  %cmp1 = icmp eq ptr %Kernel, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %corrvout, null
  %or.cond122 = or i1 %or.cond, %cmp4
  br i1 %or.cond122, label %return, label %if.end6

if.end6:                                          ; preds = %entry
  %cmp7 = icmp slt i32 %siglen, %kernlen
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6
  %lkern.0 = phi i32 [ %siglen, %if.then8 ], [ %kernlen, %if.end6 ]
  %lsig.0 = phi i32 [ %kernlen, %if.then8 ], [ %siglen, %if.end6 ]
  %kern.0 = phi ptr [ %Signal, %if.then8 ], [ %Kernel, %if.end6 ]
  %sig.0 = phi ptr [ %Kernel, %if.then8 ], [ %Signal, %if.end6 ]
  %cmp10124 = icmp sgt i32 %lkern.0, 0
  br i1 %cmp10124, label %for.body, label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond.for.end_crit_edge, %if.end9
  %cmp23128 = icmp slt i32 %lkern.0, %lsig.0
  br i1 %cmp23128, label %for.body25.preheader, label %for.cond45.preheader

for.body25.preheader:                             ; preds = %for.cond22.preheader
  %div536 = and i32 %lkern.0, -16
  br label %for.body25

for.body:                                         ; preds = %if.end9, %for.cond.for.end_crit_edge
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.cond.for.end_crit_edge ], [ 1, %if.end9 ]
  %n.0125 = phi i32 [ %inc19, %for.cond.for.end_crit_edge ], [ 0, %if.end9 ]
  %0 = and i32 %n.0125, -8
  %1 = and i32 %n.0125, 2147483640
  %2 = icmp eq i32 %1, 0
  %3 = xor i32 %n.0125, -1
  %sub11 = add nsw i32 %3, %lkern.0
  %arrayidx = getelementptr inbounds float, ptr %corrvout, i32 %n.0125
  br i1 %2, label %for.body14.clone, label %for.body14.7

for.body14.7:                                     ; preds = %for.body, %for.body14.7
  %k.0123 = phi i32 [ %inc.7, %for.body14.7 ], [ 0, %for.body ]
  %.phi = phi float [ %20, %for.body14.7 ], [ 0.000000e+00, %for.body ]
  %.phi1 = phi float [ %21, %for.body14.7 ], [ 0.000000e+00, %for.body ]
  %.phi2 = phi float [ %22, %for.body14.7 ], [ 0.000000e+00, %for.body ]
  %.phi3 = phi float [ %23, %for.body14.7 ], [ 0.000000e+00, %for.body ]
  %.phi4 = phi float [ %24, %for.body14.7 ], [ 0.000000e+00, %for.body ]
  %.phi5 = phi float [ %25, %for.body14.7 ], [ 0.000000e+00, %for.body ]
  %.phi6 = phi float [ %26, %for.body14.7 ], [ 0.000000e+00, %for.body ]
  %.phi7 = phi float [ %27, %for.body14.7 ], [ 0.000000e+00, %for.body ]
  %inc.7 = add nuw nsw i32 %k.0123, 8
  %add = or disjoint i32 %k.0123, %sub11
  %add10 = or disjoint i32 %k.0123, 1
  %add12 = or disjoint i32 %add10, %sub11
  %add14 = or disjoint i32 %k.0123, 2
  %add16 = or disjoint i32 %add14, %sub11
  %add18 = or disjoint i32 %k.0123, 3
  %add20 = or disjoint i32 %add18, %sub11
  %add22 = or disjoint i32 %k.0123, 4
  %add24 = or disjoint i32 %add22, %sub11
  %add26 = or disjoint i32 %k.0123, 5
  %add28 = or disjoint i32 %add26, %sub11
  %add31 = or disjoint i32 %k.0123, 6
  %add33 = or disjoint i32 %add31, %sub11
  %add35 = or disjoint i32 %k.0123, 7
  %add37 = or disjoint i32 %add35, %sub11
  %arrayidx15 = getelementptr inbounds float, ptr %sig.0, i32 %k.0123
  %arrayidx16 = getelementptr inbounds float, ptr %kern.0, i32 %add
  %arrayidx15.1 = getelementptr inbounds float, ptr %sig.0, i32 %add10
  %arrayidx16.1 = getelementptr inbounds float, ptr %kern.0, i32 %add12
  %arrayidx15.2 = getelementptr inbounds float, ptr %sig.0, i32 %add14
  %arrayidx16.2 = getelementptr inbounds float, ptr %kern.0, i32 %add16
  %arrayidx15.3 = getelementptr inbounds float, ptr %sig.0, i32 %add18
  %arrayidx16.3 = getelementptr inbounds float, ptr %kern.0, i32 %add20
  %arrayidx15.4 = getelementptr inbounds float, ptr %sig.0, i32 %add22
  %arrayidx16.4 = getelementptr inbounds float, ptr %kern.0, i32 %add24
  %arrayidx15.5 = getelementptr inbounds float, ptr %sig.0, i32 %add26
  %arrayidx16.5 = getelementptr inbounds float, ptr %kern.0, i32 %add28
  %arrayidx15.6 = getelementptr inbounds float, ptr %sig.0, i32 %add31
  %arrayidx16.6 = getelementptr inbounds float, ptr %kern.0, i32 %add33
  %arrayidx15.7 = getelementptr inbounds float, ptr %sig.0, i32 %add35
  %arrayidx16.7 = getelementptr inbounds float, ptr %kern.0, i32 %add37
  %4 = load float, ptr %arrayidx15, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx16, align 4, !tbaa !4
  %6 = load float, ptr %arrayidx15.1, align 4, !tbaa !4
  %7 = load float, ptr %arrayidx16.1, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx15.2, align 4, !tbaa !4
  %9 = load float, ptr %arrayidx16.2, align 4, !tbaa !4
  %10 = load float, ptr %arrayidx15.3, align 4, !tbaa !4
  %11 = load float, ptr %arrayidx16.3, align 4, !tbaa !4
  %12 = load float, ptr %arrayidx15.4, align 4, !tbaa !4
  %13 = load float, ptr %arrayidx16.4, align 4, !tbaa !4
  %14 = load float, ptr %arrayidx15.5, align 4, !tbaa !4
  %15 = load float, ptr %arrayidx16.5, align 4, !tbaa !4
  %16 = load float, ptr %arrayidx15.6, align 4, !tbaa !4
  %17 = load float, ptr %arrayidx16.6, align 4, !tbaa !4
  %18 = load float, ptr %arrayidx15.7, align 4, !tbaa !4
  %19 = load float, ptr %arrayidx16.7, align 4, !tbaa !4
  %20 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %.phi)
  %21 = tail call float @llvm.fmuladd.f32(float %6, float %7, float %.phi1)
  %22 = tail call float @llvm.fmuladd.f32(float %8, float %9, float %.phi2)
  %23 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %.phi3)
  %24 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %.phi4)
  %25 = tail call float @llvm.fmuladd.f32(float %14, float %15, float %.phi5)
  %26 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %.phi6)
  %27 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %.phi7)
  %exitcond.7 = icmp ult i32 %inc.7, %1
  br i1 %exitcond.7, label %for.body14.7, label %for.end38, !llvm.loop !8

for.end38:                                        ; preds = %for.body14.7
  %.lcssa147 = phi float [ %20, %for.body14.7 ]
  %.lcssa146 = phi float [ %21, %for.body14.7 ]
  %.lcssa145 = phi float [ %22, %for.body14.7 ]
  %.lcssa144 = phi float [ %23, %for.body14.7 ]
  %.lcssa143 = phi float [ %24, %for.body14.7 ]
  %.lcssa142 = phi float [ %25, %for.body14.7 ]
  %.lcssa141 = phi float [ %26, %for.body14.7 ]
  %.lcssa140 = phi float [ %27, %for.body14.7 ]
  %sum = fadd float %.lcssa147, %.lcssa146
  %sum23 = fadd float %.lcssa145, %.lcssa144
  %sum24 = fadd float %.lcssa143, %.lcssa142
  %sum25 = fadd float %.lcssa141, %.lcssa140
  %sum26 = fadd float %sum, %sum23
  %sum27 = fadd float %sum24, %sum25
  %sum28 = fadd float %sum26, %sum27
  store float %sum28, ptr %arrayidx, align 4
  br label %for.body14.clone

for.body14.clone:                                 ; preds = %for.body, %for.end38, %for.body14.clone
  %k.0123.clone = phi i32 [ %inc.clone, %for.body14.clone ], [ 0, %for.body ], [ %0, %for.end38 ]
  %28 = phi float [ %31, %for.body14.clone ], [ 0.000000e+00, %for.body ], [ %sum28, %for.end38 ]
  %arrayidx15.clone = getelementptr inbounds float, ptr %sig.0, i32 %k.0123.clone
  %29 = load float, ptr %arrayidx15.clone, align 4, !tbaa !4
  %add.clone = add i32 %k.0123.clone, %sub11
  %arrayidx16.clone = getelementptr inbounds float, ptr %kern.0, i32 %add.clone
  %30 = load float, ptr %arrayidx16.clone, align 4, !tbaa !4
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %28)
  %inc.clone = add nuw nsw i32 %k.0123.clone, 1
  %exitcond.clone = icmp eq i32 %inc.clone, %indvars.iv
  br i1 %exitcond.clone, label %for.cond.for.end_crit_edge, label %for.body14.clone, !llvm.loop !8

for.cond.for.end_crit_edge:                       ; preds = %for.body14.clone
  %.lcssa148 = phi float [ %31, %for.body14.clone ]
  store float %.lcssa148, ptr %arrayidx, align 4, !tbaa !4
  %inc19 = add nuw nsw i32 %n.0125, 1
  %indvars.iv.next = add nuw i32 %indvars.iv, 1
  %exitcond134.not = icmp eq i32 %inc19, %lkern.0
  br i1 %exitcond134.not, label %for.cond22.preheader, label %for.body, !llvm.loop !10

for.cond45.preheader:                             ; preds = %for.end40, %for.cond22.preheader
  %add46 = add i32 %siglen, -1
  %sub47 = add i32 %add46, %kernlen
  %cmp48132 = icmp slt i32 %lsig.0, %sub47
  br i1 %cmp48132, label %for.body50.lr.ph, label %return

for.body50.lr.ph:                                 ; preds = %for.cond45.preheader
  %sub57 = add nsw i32 %lsig.0, -1
  br label %for.body50

for.body25:                                       ; preds = %for.body25.preheader, %for.end40
  %n21.0129 = phi i32 [ %inc42, %for.end40 ], [ %lkern.0, %for.body25.preheader ]
  %arrayidx28 = getelementptr inbounds float, ptr %corrvout, i32 %n21.0129
  %sub29 = sub nuw nsw i32 %n21.0129, %lkern.0
  %add30 = add nsw i32 %sub29, 1
  %add60 = add i32 %add30, %div536
  %cmp32.not126 = icmp ult i32 %add30, %add60
  br i1 %cmp32.not126, label %for.body33.15, label %for.end164

for.body33.15:                                    ; preds = %for.body25, %for.body33.15
  %k27.0127 = phi i32 [ %inc39.15, %for.body33.15 ], [ %add30, %for.body25 ]
  %.phi39 = phi float [ %64, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi40 = phi float [ %65, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi41 = phi float [ %66, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi42 = phi float [ %67, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi43 = phi float [ %68, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi44 = phi float [ %69, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi45 = phi float [ %70, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi46 = phi float [ %71, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi47 = phi float [ %72, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi48 = phi float [ %73, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi49 = phi float [ %74, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi50 = phi float [ %75, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi51 = phi float [ %76, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi52 = phi float [ %77, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi53 = phi float [ %78, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %.phi54 = phi float [ %79, %for.body33.15 ], [ 0.000000e+00, %for.body25 ]
  %inc39.15 = add i32 %k27.0127, 16
  %add57 = or disjoint i32 %k27.0127, 1
  %add59 = or disjoint i32 %k27.0127, 2
  %add62 = or disjoint i32 %k27.0127, 3
  %add64 = or disjoint i32 %k27.0127, 4
  %add66 = or disjoint i32 %k27.0127, 5
  %add68 = or disjoint i32 %k27.0127, 6
  %add70 = or disjoint i32 %k27.0127, 7
  %add72 = or disjoint i32 %k27.0127, 8
  %add74 = or disjoint i32 %k27.0127, 9
  %add76 = or disjoint i32 %k27.0127, 10
  %add78 = or disjoint i32 %k27.0127, 11
  %add80 = or disjoint i32 %k27.0127, 12
  %add82 = or disjoint i32 %k27.0127, 13
  %add84 = or disjoint i32 %k27.0127, 14
  %add86 = or disjoint i32 %k27.0127, 15
  %sub35 = sub i32 %k27.0127, %add30
  %sub35.1 = sub i32 %add57, %add30
  %sub35.2 = sub i32 %add59, %add30
  %sub35.3 = sub i32 %add62, %add30
  %sub35.4 = sub i32 %add64, %add30
  %sub35.5 = sub i32 %add66, %add30
  %sub35.6 = sub i32 %add68, %add30
  %sub35.7 = sub i32 %add70, %add30
  %sub35.8 = sub i32 %add72, %add30
  %sub35.9 = sub i32 %add74, %add30
  %sub35.10 = sub i32 %add76, %add30
  %sub35.11 = sub i32 %add78, %add30
  %sub35.12 = sub i32 %add80, %add30
  %sub35.13 = sub i32 %add82, %add30
  %sub35.14 = sub i32 %add84, %add30
  %sub35.15 = sub i32 %add86, %add30
  %arrayidx34 = getelementptr inbounds float, ptr %sig.0, i32 %k27.0127
  %arrayidx36 = getelementptr inbounds float, ptr %kern.0, i32 %sub35
  %arrayidx34.1 = getelementptr inbounds float, ptr %sig.0, i32 %add57
  %arrayidx36.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.1
  %arrayidx34.2 = getelementptr inbounds float, ptr %sig.0, i32 %add59
  %arrayidx36.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.2
  %arrayidx34.3 = getelementptr inbounds float, ptr %sig.0, i32 %add62
  %arrayidx36.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.3
  %arrayidx34.4 = getelementptr inbounds float, ptr %sig.0, i32 %add64
  %arrayidx36.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.4
  %arrayidx34.5 = getelementptr inbounds float, ptr %sig.0, i32 %add66
  %arrayidx36.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.5
  %arrayidx34.6 = getelementptr inbounds float, ptr %sig.0, i32 %add68
  %arrayidx36.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.6
  %arrayidx34.7 = getelementptr inbounds float, ptr %sig.0, i32 %add70
  %arrayidx36.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.7
  %arrayidx34.8 = getelementptr inbounds float, ptr %sig.0, i32 %add72
  %arrayidx36.8 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.8
  %arrayidx34.9 = getelementptr inbounds float, ptr %sig.0, i32 %add74
  %arrayidx36.9 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.9
  %arrayidx34.10 = getelementptr inbounds float, ptr %sig.0, i32 %add76
  %arrayidx36.10 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.10
  %arrayidx34.11 = getelementptr inbounds float, ptr %sig.0, i32 %add78
  %arrayidx36.11 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.11
  %arrayidx34.12 = getelementptr inbounds float, ptr %sig.0, i32 %add80
  %arrayidx36.12 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.12
  %arrayidx34.13 = getelementptr inbounds float, ptr %sig.0, i32 %add82
  %arrayidx36.13 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.13
  %arrayidx34.14 = getelementptr inbounds float, ptr %sig.0, i32 %add84
  %arrayidx36.14 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.14
  %arrayidx34.15 = getelementptr inbounds float, ptr %sig.0, i32 %add86
  %arrayidx36.15 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.15
  %32 = load float, ptr %arrayidx34, align 4, !tbaa !4
  %33 = load float, ptr %arrayidx36, align 4, !tbaa !4
  %34 = load float, ptr %arrayidx34.1, align 4, !tbaa !4
  %35 = load float, ptr %arrayidx36.1, align 4, !tbaa !4
  %36 = load float, ptr %arrayidx34.2, align 4, !tbaa !4
  %37 = load float, ptr %arrayidx36.2, align 4, !tbaa !4
  %38 = load float, ptr %arrayidx34.3, align 4, !tbaa !4
  %39 = load float, ptr %arrayidx36.3, align 4, !tbaa !4
  %40 = load float, ptr %arrayidx34.4, align 4, !tbaa !4
  %41 = load float, ptr %arrayidx36.4, align 4, !tbaa !4
  %42 = load float, ptr %arrayidx34.5, align 4, !tbaa !4
  %43 = load float, ptr %arrayidx36.5, align 4, !tbaa !4
  %44 = load float, ptr %arrayidx34.6, align 4, !tbaa !4
  %45 = load float, ptr %arrayidx36.6, align 4, !tbaa !4
  %46 = load float, ptr %arrayidx34.7, align 4, !tbaa !4
  %47 = load float, ptr %arrayidx36.7, align 4, !tbaa !4
  %48 = load float, ptr %arrayidx34.8, align 4, !tbaa !4
  %49 = load float, ptr %arrayidx36.8, align 4, !tbaa !4
  %50 = load float, ptr %arrayidx34.9, align 4, !tbaa !4
  %51 = load float, ptr %arrayidx36.9, align 4, !tbaa !4
  %52 = load float, ptr %arrayidx34.10, align 4, !tbaa !4
  %53 = load float, ptr %arrayidx36.10, align 4, !tbaa !4
  %54 = load float, ptr %arrayidx34.11, align 4, !tbaa !4
  %55 = load float, ptr %arrayidx36.11, align 4, !tbaa !4
  %56 = load float, ptr %arrayidx34.12, align 4, !tbaa !4
  %57 = load float, ptr %arrayidx36.12, align 4, !tbaa !4
  %58 = load float, ptr %arrayidx34.13, align 4, !tbaa !4
  %59 = load float, ptr %arrayidx36.13, align 4, !tbaa !4
  %60 = load float, ptr %arrayidx34.14, align 4, !tbaa !4
  %61 = load float, ptr %arrayidx36.14, align 4, !tbaa !4
  %62 = load float, ptr %arrayidx34.15, align 4, !tbaa !4
  %63 = load float, ptr %arrayidx36.15, align 4, !tbaa !4
  %64 = tail call float @llvm.fmuladd.f32(float %32, float %33, float %.phi39)
  %65 = tail call float @llvm.fmuladd.f32(float %34, float %35, float %.phi40)
  %66 = tail call float @llvm.fmuladd.f32(float %36, float %37, float %.phi41)
  %67 = tail call float @llvm.fmuladd.f32(float %38, float %39, float %.phi42)
  %68 = tail call float @llvm.fmuladd.f32(float %40, float %41, float %.phi43)
  %69 = tail call float @llvm.fmuladd.f32(float %42, float %43, float %.phi44)
  %70 = tail call float @llvm.fmuladd.f32(float %44, float %45, float %.phi45)
  %71 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %.phi46)
  %72 = tail call float @llvm.fmuladd.f32(float %48, float %49, float %.phi47)
  %73 = tail call float @llvm.fmuladd.f32(float %50, float %51, float %.phi48)
  %74 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %.phi49)
  %75 = tail call float @llvm.fmuladd.f32(float %54, float %55, float %.phi50)
  %76 = tail call float @llvm.fmuladd.f32(float %56, float %57, float %.phi51)
  %77 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %.phi52)
  %78 = tail call float @llvm.fmuladd.f32(float %60, float %61, float %.phi53)
  %79 = tail call float @llvm.fmuladd.f32(float %62, float %63, float %.phi54)
  %cmp32.not.15 = icmp ult i32 %inc39.15, %add60
  br i1 %cmp32.not.15, label %for.body33.15, label %for.end40.loopexit, !llvm.loop !11

for.end40.loopexit:                               ; preds = %for.body33.15
  %inc39.15.lcssa = phi i32 [ %inc39.15, %for.body33.15 ]
  %.lcssa138 = phi float [ %64, %for.body33.15 ]
  %.lcssa137 = phi float [ %65, %for.body33.15 ]
  %.lcssa136 = phi float [ %66, %for.body33.15 ]
  %.lcssa135 = phi float [ %67, %for.body33.15 ]
  %.lcssa134 = phi float [ %68, %for.body33.15 ]
  %.lcssa133 = phi float [ %69, %for.body33.15 ]
  %.lcssa132 = phi float [ %70, %for.body33.15 ]
  %.lcssa131 = phi float [ %71, %for.body33.15 ]
  %.lcssa130 = phi float [ %72, %for.body33.15 ]
  %.lcssa129 = phi float [ %73, %for.body33.15 ]
  %.lcssa128 = phi float [ %74, %for.body33.15 ]
  %.lcssa127 = phi float [ %75, %for.body33.15 ]
  %.lcssa126 = phi float [ %76, %for.body33.15 ]
  %.lcssa125 = phi float [ %77, %for.body33.15 ]
  %.lcssa124 = phi float [ %78, %for.body33.15 ]
  %.lcssa123 = phi float [ %79, %for.body33.15 ]
  %sum45 = fadd float %.lcssa138, %.lcssa137
  %sum46 = fadd float %.lcssa136, %.lcssa135
  %sum47 = fadd float %.lcssa134, %.lcssa133
  %sum48 = fadd float %.lcssa132, %.lcssa131
  %sum49 = fadd float %.lcssa130, %.lcssa129
  %sum50 = fadd float %.lcssa128, %.lcssa127
  %sum51 = fadd float %.lcssa126, %.lcssa125
  %sum52 = fadd float %.lcssa124, %.lcssa123
  %sum53 = fadd float %sum45, %sum46
  %sum54 = fadd float %sum47, %sum48
  %sum55 = fadd float %sum49, %sum50
  %sum56 = fadd float %sum51, %sum52
  %sum57 = fadd float %sum53, %sum54
  %sum58 = fadd float %sum55, %sum56
  %sum59 = fadd float %sum57, %sum58
  br label %for.end164

for.end164:                                       ; preds = %for.body25, %for.end40.loopexit
  %phi.sum = phi i32 [ %add30, %for.body25 ], [ %inc39.15.lcssa, %for.end40.loopexit ]
  %phi.float = phi float [ 0.000000e+00, %for.body25 ], [ %sum59, %for.end40.loopexit ]
  store float %phi.float, ptr %arrayidx28, align 4
  %cmp182.not587 = icmp ugt i32 %phi.sum, %n21.0129
  br i1 %cmp182.not587, label %for.end40, label %for.body33.clone

for.body33.clone:                                 ; preds = %for.end164, %for.body33.clone
  %80 = phi float [ %83, %for.body33.clone ], [ %phi.float, %for.end164 ]
  %k27.0127.clone = phi i32 [ %inc39.clone, %for.body33.clone ], [ %phi.sum, %for.end164 ]
  %arrayidx34.clone = getelementptr inbounds float, ptr %sig.0, i32 %k27.0127.clone
  %81 = load float, ptr %arrayidx34.clone, align 4, !tbaa !4
  %sub35.clone = sub i32 %k27.0127.clone, %add30
  %arrayidx36.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub35.clone
  %82 = load float, ptr %arrayidx36.clone, align 4, !tbaa !4
  %83 = tail call float @llvm.fmuladd.f32(float %81, float %82, float %80)
  %inc39.clone = add i32 %k27.0127.clone, 1
  %cmp32.not.clone = icmp ugt i32 %inc39.clone, %n21.0129
  br i1 %cmp32.not.clone, label %for.cond.for.end_crit_edge87, label %for.body33.clone, !llvm.loop !11

for.cond.for.end_crit_edge87:                     ; preds = %for.body33.clone
  %.lcssa139 = phi float [ %83, %for.body33.clone ]
  store float %.lcssa139, ptr %arrayidx28, align 4, !tbaa !4
  br label %for.end40

for.end40:                                        ; preds = %for.cond.for.end_crit_edge87, %for.end164
  %inc42 = add nuw nsw i32 %n21.0129, 1
  %exitcond135.not = icmp eq i32 %inc42, %lsig.0
  br i1 %exitcond135.not, label %for.cond45.preheader, label %for.body25, !llvm.loop !12

for.body50:                                       ; preds = %for.end67, %for.body50.lr.ph
  %n44.0133 = phi i32 [ %lsig.0, %for.body50.lr.ph ], [ %inc69, %for.end67 ]
  %arrayidx54 = getelementptr inbounds float, ptr %corrvout, i32 %n44.0133
  %sub55 = sub nsw i32 %n44.0133, %lkern.0
  %add56 = add nsw i32 %sub55, 1
  %add207.neg = xor i32 %sub55, -1
  %add211 = add i32 %add207.neg, %lsig.0
  %div212535 = and i32 %add211, -8
  %add214 = add i32 %div212535, %add56
  %cmp59.not130 = icmp ult i32 %add56, %add214
  br i1 %cmp59.not130, label %for.body60.7, label %for.end164110

for.body60.7:                                     ; preds = %for.body50, %for.body60.7
  %k53.0131 = phi i32 [ %inc66.7, %for.body60.7 ], [ %add56, %for.body50 ]
  %.phi88 = phi float [ %100, %for.body60.7 ], [ 0.000000e+00, %for.body50 ]
  %.phi89 = phi float [ %101, %for.body60.7 ], [ 0.000000e+00, %for.body50 ]
  %.phi90 = phi float [ %102, %for.body60.7 ], [ 0.000000e+00, %for.body50 ]
  %.phi91 = phi float [ %103, %for.body60.7 ], [ 0.000000e+00, %for.body50 ]
  %.phi92 = phi float [ %104, %for.body60.7 ], [ 0.000000e+00, %for.body50 ]
  %.phi93 = phi float [ %105, %for.body60.7 ], [ 0.000000e+00, %for.body50 ]
  %.phi94 = phi float [ %106, %for.body60.7 ], [ 0.000000e+00, %for.body50 ]
  %.phi95 = phi float [ %107, %for.body60.7 ], [ 0.000000e+00, %for.body50 ]
  %inc66.7 = add i32 %k53.0131, 8
  %add97 = or disjoint i32 %k53.0131, 1
  %add99 = or disjoint i32 %k53.0131, 2
  %add101 = or disjoint i32 %k53.0131, 3
  %add103 = or disjoint i32 %k53.0131, 4
  %add105 = or disjoint i32 %k53.0131, 5
  %add107 = or disjoint i32 %k53.0131, 6
  %add109 = or disjoint i32 %k53.0131, 7
  %sub62 = sub i32 %k53.0131, %add56
  %sub62.1 = sub i32 %add97, %add56
  %sub62.2 = sub i32 %add99, %add56
  %sub62.3 = sub i32 %add101, %add56
  %sub62.4 = sub i32 %add103, %add56
  %sub62.5 = sub i32 %add105, %add56
  %sub62.6 = sub i32 %add107, %add56
  %sub62.7 = sub i32 %add109, %add56
  %arrayidx61 = getelementptr inbounds float, ptr %sig.0, i32 %k53.0131
  %arrayidx63 = getelementptr inbounds float, ptr %kern.0, i32 %sub62
  %arrayidx61.1 = getelementptr inbounds float, ptr %sig.0, i32 %add97
  %arrayidx63.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.1
  %arrayidx61.2 = getelementptr inbounds float, ptr %sig.0, i32 %add99
  %arrayidx63.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.2
  %arrayidx61.3 = getelementptr inbounds float, ptr %sig.0, i32 %add101
  %arrayidx63.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.3
  %arrayidx61.4 = getelementptr inbounds float, ptr %sig.0, i32 %add103
  %arrayidx63.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.4
  %arrayidx61.5 = getelementptr inbounds float, ptr %sig.0, i32 %add105
  %arrayidx63.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.5
  %arrayidx61.6 = getelementptr inbounds float, ptr %sig.0, i32 %add107
  %arrayidx63.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.6
  %arrayidx61.7 = getelementptr inbounds float, ptr %sig.0, i32 %add109
  %arrayidx63.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.7
  %84 = load float, ptr %arrayidx61, align 4, !tbaa !4
  %85 = load float, ptr %arrayidx63, align 4, !tbaa !4
  %86 = load float, ptr %arrayidx61.1, align 4, !tbaa !4
  %87 = load float, ptr %arrayidx63.1, align 4, !tbaa !4
  %88 = load float, ptr %arrayidx61.2, align 4, !tbaa !4
  %89 = load float, ptr %arrayidx63.2, align 4, !tbaa !4
  %90 = load float, ptr %arrayidx61.3, align 4, !tbaa !4
  %91 = load float, ptr %arrayidx63.3, align 4, !tbaa !4
  %92 = load float, ptr %arrayidx61.4, align 4, !tbaa !4
  %93 = load float, ptr %arrayidx63.4, align 4, !tbaa !4
  %94 = load float, ptr %arrayidx61.5, align 4, !tbaa !4
  %95 = load float, ptr %arrayidx63.5, align 4, !tbaa !4
  %96 = load float, ptr %arrayidx61.6, align 4, !tbaa !4
  %97 = load float, ptr %arrayidx63.6, align 4, !tbaa !4
  %98 = load float, ptr %arrayidx61.7, align 4, !tbaa !4
  %99 = load float, ptr %arrayidx63.7, align 4, !tbaa !4
  %100 = tail call float @llvm.fmuladd.f32(float %84, float %85, float %.phi88)
  %101 = tail call float @llvm.fmuladd.f32(float %86, float %87, float %.phi89)
  %102 = tail call float @llvm.fmuladd.f32(float %88, float %89, float %.phi90)
  %103 = tail call float @llvm.fmuladd.f32(float %90, float %91, float %.phi91)
  %104 = tail call float @llvm.fmuladd.f32(float %92, float %93, float %.phi92)
  %105 = tail call float @llvm.fmuladd.f32(float %94, float %95, float %.phi93)
  %106 = tail call float @llvm.fmuladd.f32(float %96, float %97, float %.phi94)
  %107 = tail call float @llvm.fmuladd.f32(float %98, float %99, float %.phi95)
  %cmp59.not.7 = icmp ult i32 %inc66.7, %add214
  br i1 %cmp59.not.7, label %for.body60.7, label %for.end67.loopexit, !llvm.loop !13

for.end67.loopexit:                               ; preds = %for.body60.7
  %inc66.7.lcssa = phi i32 [ %inc66.7, %for.body60.7 ]
  %.lcssa121 = phi float [ %100, %for.body60.7 ]
  %.lcssa120 = phi float [ %101, %for.body60.7 ]
  %.lcssa119 = phi float [ %102, %for.body60.7 ]
  %.lcssa118 = phi float [ %103, %for.body60.7 ]
  %.lcssa117 = phi float [ %104, %for.body60.7 ]
  %.lcssa116 = phi float [ %105, %for.body60.7 ]
  %.lcssa115 = phi float [ %106, %for.body60.7 ]
  %.lcssa = phi float [ %107, %for.body60.7 ]
  %sum60 = fadd float %.lcssa121, %.lcssa120
  %sum61 = fadd float %.lcssa119, %.lcssa118
  %sum62 = fadd float %.lcssa117, %.lcssa116
  %sum63 = fadd float %.lcssa115, %.lcssa
  %sum64 = fadd float %sum60, %sum61
  %sum65 = fadd float %sum62, %sum63
  %sum66 = fadd float %sum64, %sum65
  br label %for.end164110

for.end164110:                                    ; preds = %for.body50, %for.end67.loopexit
  %phi.sum111 = phi i32 [ %add56, %for.body50 ], [ %inc66.7.lcssa, %for.end67.loopexit ]
  %phi.float112 = phi float [ 0.000000e+00, %for.body50 ], [ %sum66, %for.end67.loopexit ]
  store float %phi.float112, ptr %arrayidx54, align 4
  %cmp182.not587113 = icmp ugt i32 %phi.sum111, %sub57
  br i1 %cmp182.not587113, label %for.end67, label %for.body60.clone

for.body60.clone:                                 ; preds = %for.end164110, %for.body60.clone
  %108 = phi float [ %111, %for.body60.clone ], [ %phi.float112, %for.end164110 ]
  %k53.0131.clone = phi i32 [ %inc66.clone, %for.body60.clone ], [ %phi.sum111, %for.end164110 ]
  %arrayidx61.clone = getelementptr inbounds float, ptr %sig.0, i32 %k53.0131.clone
  %109 = load float, ptr %arrayidx61.clone, align 4, !tbaa !4
  %sub62.clone = sub i32 %k53.0131.clone, %add56
  %arrayidx63.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub62.clone
  %110 = load float, ptr %arrayidx63.clone, align 4, !tbaa !4
  %111 = tail call float @llvm.fmuladd.f32(float %109, float %110, float %108)
  %inc66.clone = add i32 %k53.0131.clone, 1
  %cmp59.not.clone = icmp ugt i32 %inc66.clone, %sub57
  br i1 %cmp59.not.clone, label %for.cond.for.end_crit_edge114, label %for.body60.clone, !llvm.loop !13

for.cond.for.end_crit_edge114:                    ; preds = %for.body60.clone
  %.lcssa122 = phi float [ %111, %for.body60.clone ]
  store float %.lcssa122, ptr %arrayidx54, align 4, !tbaa !4
  br label %for.end67

for.end67:                                        ; preds = %for.cond.for.end_crit_edge114, %for.end164110
  %inc69 = add nsw i32 %n44.0133, 1
  %exitcond136.not = icmp eq i32 %inc69, %sub47
  br i1 %exitcond136.not, label %return, label %for.body50, !llvm.loop !14

return:                                           ; preds = %for.end67, %for.cond45.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond45.preheader ], [ 0, %for.end67 ]
  ret i32 %retval.0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
