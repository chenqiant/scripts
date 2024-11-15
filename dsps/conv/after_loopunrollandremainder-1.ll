; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_conv_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_conv_f32_ansi(ptr noalias noundef readonly %Signal, i32 noundef %siglen, ptr noalias noundef readonly %Kernel, i32 noundef %kernlen, ptr noalias noundef writeonly %convout) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %Signal, null
  %cmp1 = icmp eq ptr %Kernel, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %convout, null
  %or.cond118 = or i1 %or.cond, %cmp4
  br i1 %or.cond118, label %return, label %if.end6

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
  %cmp10120 = icmp sgt i32 %lkern.0, 0
  br i1 %cmp10120, label %for.body, label %for.cond21.preheader

for.cond21.preheader:                             ; preds = %for.cond.for.end_crit_edge, %if.end9
  %cmp22125 = icmp slt i32 %lkern.0, %lsig.0
  br i1 %cmp22125, label %for.body24.preheader, label %for.cond42.preheader

for.body24.preheader:                             ; preds = %for.cond21.preheader
  %div536 = and i32 %lkern.0, -16
  br label %for.body24

for.body:                                         ; preds = %if.end9, %for.cond.for.end_crit_edge
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.cond.for.end_crit_edge ], [ 1, %if.end9 ]
  %n.0121 = phi i32 [ %inc18, %for.cond.for.end_crit_edge ], [ 0, %if.end9 ]
  %0 = and i32 %n.0121, -8
  %1 = and i32 %n.0121, 2147483640
  %2 = icmp eq i32 %1, 0
  %arrayidx = getelementptr inbounds float, ptr %convout, i32 %n.0121
  br i1 %2, label %for.body13.clone, label %for.body13.7

for.body13.7:                                     ; preds = %for.body, %for.body13.7
  %k.0119 = phi i32 [ %inc.7, %for.body13.7 ], [ 0, %for.body ]
  %.phi = phi float [ %19, %for.body13.7 ], [ 0.000000e+00, %for.body ]
  %.phi1 = phi float [ %20, %for.body13.7 ], [ 0.000000e+00, %for.body ]
  %.phi2 = phi float [ %21, %for.body13.7 ], [ 0.000000e+00, %for.body ]
  %.phi3 = phi float [ %22, %for.body13.7 ], [ 0.000000e+00, %for.body ]
  %.phi4 = phi float [ %23, %for.body13.7 ], [ 0.000000e+00, %for.body ]
  %.phi5 = phi float [ %24, %for.body13.7 ], [ 0.000000e+00, %for.body ]
  %.phi6 = phi float [ %25, %for.body13.7 ], [ 0.000000e+00, %for.body ]
  %.phi7 = phi float [ %26, %for.body13.7 ], [ 0.000000e+00, %for.body ]
  %inc.7 = add nuw nsw i32 %k.0119, 8
  %add = or disjoint i32 %k.0119, 1
  %add9 = or disjoint i32 %k.0119, 2
  %add11 = or disjoint i32 %k.0119, 3
  %add13 = or disjoint i32 %k.0119, 4
  %add15 = or disjoint i32 %k.0119, 5
  %add17 = or disjoint i32 %k.0119, 6
  %add19 = or disjoint i32 %k.0119, 7
  %sub = sub nsw i32 %n.0121, %k.0119
  %sub.1 = sub nsw i32 %n.0121, %add
  %sub.2 = sub nsw i32 %n.0121, %add9
  %sub.3 = sub nsw i32 %n.0121, %add11
  %sub.4 = sub nsw i32 %n.0121, %add13
  %sub.5 = sub nsw i32 %n.0121, %add15
  %sub.6 = sub nsw i32 %n.0121, %add17
  %sub.7 = sub nsw i32 %n.0121, %add19
  %arrayidx14 = getelementptr inbounds float, ptr %sig.0, i32 %k.0119
  %arrayidx15 = getelementptr inbounds float, ptr %kern.0, i32 %sub
  %arrayidx14.1 = getelementptr inbounds float, ptr %sig.0, i32 %add
  %arrayidx15.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub.1
  %arrayidx14.2 = getelementptr inbounds float, ptr %sig.0, i32 %add9
  %arrayidx15.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub.2
  %arrayidx14.3 = getelementptr inbounds float, ptr %sig.0, i32 %add11
  %arrayidx15.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub.3
  %arrayidx14.4 = getelementptr inbounds float, ptr %sig.0, i32 %add13
  %arrayidx15.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub.4
  %arrayidx14.5 = getelementptr inbounds float, ptr %sig.0, i32 %add15
  %arrayidx15.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub.5
  %arrayidx14.6 = getelementptr inbounds float, ptr %sig.0, i32 %add17
  %arrayidx15.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub.6
  %arrayidx14.7 = getelementptr inbounds float, ptr %sig.0, i32 %add19
  %arrayidx15.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub.7
  %3 = load float, ptr %arrayidx14, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx15, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx14.1, align 4, !tbaa !4
  %6 = load float, ptr %arrayidx15.1, align 4, !tbaa !4
  %7 = load float, ptr %arrayidx14.2, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx15.2, align 4, !tbaa !4
  %9 = load float, ptr %arrayidx14.3, align 4, !tbaa !4
  %10 = load float, ptr %arrayidx15.3, align 4, !tbaa !4
  %11 = load float, ptr %arrayidx14.4, align 4, !tbaa !4
  %12 = load float, ptr %arrayidx15.4, align 4, !tbaa !4
  %13 = load float, ptr %arrayidx14.5, align 4, !tbaa !4
  %14 = load float, ptr %arrayidx15.5, align 4, !tbaa !4
  %15 = load float, ptr %arrayidx14.6, align 4, !tbaa !4
  %16 = load float, ptr %arrayidx15.6, align 4, !tbaa !4
  %17 = load float, ptr %arrayidx14.7, align 4, !tbaa !4
  %18 = load float, ptr %arrayidx15.7, align 4, !tbaa !4
  %19 = tail call float @llvm.fmuladd.f32(float %3, float %4, float %.phi)
  %20 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %.phi1)
  %21 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %.phi2)
  %22 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %.phi3)
  %23 = tail call float @llvm.fmuladd.f32(float %11, float %12, float %.phi4)
  %24 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %.phi5)
  %25 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %.phi6)
  %26 = tail call float @llvm.fmuladd.f32(float %17, float %18, float %.phi7)
  %exitcond.7 = icmp ult i32 %inc.7, %1
  br i1 %exitcond.7, label %for.body13.7, label %for.end20, !llvm.loop !8

for.end20:                                        ; preds = %for.body13.7
  %.lcssa129 = phi float [ %19, %for.body13.7 ]
  %.lcssa128 = phi float [ %20, %for.body13.7 ]
  %.lcssa127 = phi float [ %21, %for.body13.7 ]
  %.lcssa126 = phi float [ %22, %for.body13.7 ]
  %.lcssa125 = phi float [ %23, %for.body13.7 ]
  %.lcssa124 = phi float [ %24, %for.body13.7 ]
  %.lcssa123 = phi float [ %25, %for.body13.7 ]
  %.lcssa122 = phi float [ %26, %for.body13.7 ]
  %sum = fadd float %.lcssa129, %.lcssa128
  %sum23 = fadd float %.lcssa127, %.lcssa126
  %sum24 = fadd float %.lcssa125, %.lcssa124
  %sum25 = fadd float %.lcssa123, %.lcssa122
  %sum26 = fadd float %sum, %sum23
  %sum27 = fadd float %sum24, %sum25
  %sum28 = fadd float %sum26, %sum27
  store float %sum28, ptr %arrayidx, align 4
  br label %for.body13.clone

for.body13.clone:                                 ; preds = %for.body, %for.end20, %for.body13.clone
  %k.0119.clone = phi i32 [ %inc.clone, %for.body13.clone ], [ 0, %for.body ], [ %0, %for.end20 ]
  %27 = phi float [ %30, %for.body13.clone ], [ 0.000000e+00, %for.body ], [ %sum28, %for.end20 ]
  %arrayidx14.clone = getelementptr inbounds float, ptr %sig.0, i32 %k.0119.clone
  %28 = load float, ptr %arrayidx14.clone, align 4, !tbaa !4
  %sub.clone = sub nsw i32 %n.0121, %k.0119.clone
  %arrayidx15.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub.clone
  %29 = load float, ptr %arrayidx15.clone, align 4, !tbaa !4
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float %27)
  %inc.clone = add nuw nsw i32 %k.0119.clone, 1
  %exitcond.clone = icmp eq i32 %inc.clone, %indvars.iv
  br i1 %exitcond.clone, label %for.cond.for.end_crit_edge, label %for.body13.clone, !llvm.loop !8

for.cond.for.end_crit_edge:                       ; preds = %for.body13.clone
  %.lcssa130 = phi float [ %30, %for.body13.clone ]
  store float %.lcssa130, ptr %arrayidx, align 4, !tbaa !4
  %inc18 = add nuw nsw i32 %n.0121, 1
  %indvars.iv.next = add nuw i32 %indvars.iv, 1
  %exitcond132.not = icmp eq i32 %inc18, %lkern.0
  br i1 %exitcond132.not, label %for.cond21.preheader, label %for.body, !llvm.loop !10

for.cond42.preheader:                             ; preds = %for.end37, %for.cond21.preheader
  %add43 = add i32 %siglen, -1
  %sub44 = add i32 %add43, %kernlen
  %cmp45130 = icmp slt i32 %lsig.0, %sub44
  br i1 %cmp45130, label %for.body47.lr.ph, label %return

for.body47.lr.ph:                                 ; preds = %for.cond42.preheader
  %sub54 = add nsw i32 %lsig.0, -1
  br label %for.body47

for.body24:                                       ; preds = %for.body24.preheader, %for.end37
  %n20.0126 = phi i32 [ %inc39, %for.end37 ], [ %lkern.0, %for.body24.preheader ]
  %arrayidx26 = getelementptr inbounds float, ptr %convout, i32 %n20.0126
  %sub27 = sub nuw nsw i32 %n20.0126, %lkern.0
  %k25.0122 = add i32 %sub27, 1
  %add60 = add i32 %k25.0122, %div536
  %cmp29.not123 = icmp ult i32 %k25.0122, %add60
  br i1 %cmp29.not123, label %for.body30.15, label %for.end164

for.body30.15:                                    ; preds = %for.body24, %for.body30.15
  %k25.0124 = phi i32 [ %k25.0.15, %for.body30.15 ], [ %k25.0122, %for.body24 ]
  %.phi21 = phi float [ %63, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi22 = phi float [ %64, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi23 = phi float [ %65, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi24 = phi float [ %66, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi25 = phi float [ %67, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi26 = phi float [ %68, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi27 = phi float [ %69, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi28 = phi float [ %70, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi29 = phi float [ %71, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi30 = phi float [ %72, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi31 = phi float [ %73, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi32 = phi float [ %74, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi33 = phi float [ %75, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi34 = phi float [ %76, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi35 = phi float [ %77, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %.phi36 = phi float [ %78, %for.body30.15 ], [ 0.000000e+00, %for.body24 ]
  %k25.0.15 = add i32 %k25.0124, 16
  %add38 = or disjoint i32 %k25.0124, 1
  %add40 = or disjoint i32 %k25.0124, 2
  %add42 = or disjoint i32 %k25.0124, 3
  %add45 = or disjoint i32 %k25.0124, 4
  %add47 = or disjoint i32 %k25.0124, 5
  %add49 = or disjoint i32 %k25.0124, 6
  %add51 = or disjoint i32 %k25.0124, 7
  %add53 = or disjoint i32 %k25.0124, 8
  %add55 = or disjoint i32 %k25.0124, 9
  %add57 = or disjoint i32 %k25.0124, 10
  %add59 = or disjoint i32 %k25.0124, 11
  %add62 = or disjoint i32 %k25.0124, 12
  %add64 = or disjoint i32 %k25.0124, 13
  %add66 = or disjoint i32 %k25.0124, 14
  %add68 = or disjoint i32 %k25.0124, 15
  %sub32 = sub i32 %n20.0126, %k25.0124
  %sub32.1 = sub i32 %n20.0126, %add38
  %sub32.2 = sub i32 %n20.0126, %add40
  %sub32.3 = sub i32 %n20.0126, %add42
  %sub32.4 = sub i32 %n20.0126, %add45
  %sub32.5 = sub i32 %n20.0126, %add47
  %sub32.6 = sub i32 %n20.0126, %add49
  %sub32.7 = sub i32 %n20.0126, %add51
  %sub32.8 = sub i32 %n20.0126, %add53
  %sub32.9 = sub i32 %n20.0126, %add55
  %sub32.10 = sub i32 %n20.0126, %add57
  %sub32.11 = sub i32 %n20.0126, %add59
  %sub32.12 = sub i32 %n20.0126, %add62
  %sub32.13 = sub i32 %n20.0126, %add64
  %sub32.14 = sub i32 %n20.0126, %add66
  %sub32.15 = sub i32 %n20.0126, %add68
  %arrayidx31 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0124
  %arrayidx33 = getelementptr inbounds float, ptr %kern.0, i32 %sub32
  %arrayidx31.1 = getelementptr inbounds float, ptr %sig.0, i32 %add38
  %arrayidx33.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.1
  %arrayidx31.2 = getelementptr inbounds float, ptr %sig.0, i32 %add40
  %arrayidx33.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.2
  %arrayidx31.3 = getelementptr inbounds float, ptr %sig.0, i32 %add42
  %arrayidx33.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.3
  %arrayidx31.4 = getelementptr inbounds float, ptr %sig.0, i32 %add45
  %arrayidx33.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.4
  %arrayidx31.5 = getelementptr inbounds float, ptr %sig.0, i32 %add47
  %arrayidx33.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.5
  %arrayidx31.6 = getelementptr inbounds float, ptr %sig.0, i32 %add49
  %arrayidx33.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.6
  %arrayidx31.7 = getelementptr inbounds float, ptr %sig.0, i32 %add51
  %arrayidx33.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.7
  %arrayidx31.8 = getelementptr inbounds float, ptr %sig.0, i32 %add53
  %arrayidx33.8 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.8
  %arrayidx31.9 = getelementptr inbounds float, ptr %sig.0, i32 %add55
  %arrayidx33.9 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.9
  %arrayidx31.10 = getelementptr inbounds float, ptr %sig.0, i32 %add57
  %arrayidx33.10 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.10
  %arrayidx31.11 = getelementptr inbounds float, ptr %sig.0, i32 %add59
  %arrayidx33.11 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.11
  %arrayidx31.12 = getelementptr inbounds float, ptr %sig.0, i32 %add62
  %arrayidx33.12 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.12
  %arrayidx31.13 = getelementptr inbounds float, ptr %sig.0, i32 %add64
  %arrayidx33.13 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.13
  %arrayidx31.14 = getelementptr inbounds float, ptr %sig.0, i32 %add66
  %arrayidx33.14 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.14
  %arrayidx31.15 = getelementptr inbounds float, ptr %sig.0, i32 %add68
  %arrayidx33.15 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.15
  %31 = load float, ptr %arrayidx31, align 4, !tbaa !4
  %32 = load float, ptr %arrayidx33, align 4, !tbaa !4
  %33 = load float, ptr %arrayidx31.1, align 4, !tbaa !4
  %34 = load float, ptr %arrayidx33.1, align 4, !tbaa !4
  %35 = load float, ptr %arrayidx31.2, align 4, !tbaa !4
  %36 = load float, ptr %arrayidx33.2, align 4, !tbaa !4
  %37 = load float, ptr %arrayidx31.3, align 4, !tbaa !4
  %38 = load float, ptr %arrayidx33.3, align 4, !tbaa !4
  %39 = load float, ptr %arrayidx31.4, align 4, !tbaa !4
  %40 = load float, ptr %arrayidx33.4, align 4, !tbaa !4
  %41 = load float, ptr %arrayidx31.5, align 4, !tbaa !4
  %42 = load float, ptr %arrayidx33.5, align 4, !tbaa !4
  %43 = load float, ptr %arrayidx31.6, align 4, !tbaa !4
  %44 = load float, ptr %arrayidx33.6, align 4, !tbaa !4
  %45 = load float, ptr %arrayidx31.7, align 4, !tbaa !4
  %46 = load float, ptr %arrayidx33.7, align 4, !tbaa !4
  %47 = load float, ptr %arrayidx31.8, align 4, !tbaa !4
  %48 = load float, ptr %arrayidx33.8, align 4, !tbaa !4
  %49 = load float, ptr %arrayidx31.9, align 4, !tbaa !4
  %50 = load float, ptr %arrayidx33.9, align 4, !tbaa !4
  %51 = load float, ptr %arrayidx31.10, align 4, !tbaa !4
  %52 = load float, ptr %arrayidx33.10, align 4, !tbaa !4
  %53 = load float, ptr %arrayidx31.11, align 4, !tbaa !4
  %54 = load float, ptr %arrayidx33.11, align 4, !tbaa !4
  %55 = load float, ptr %arrayidx31.12, align 4, !tbaa !4
  %56 = load float, ptr %arrayidx33.12, align 4, !tbaa !4
  %57 = load float, ptr %arrayidx31.13, align 4, !tbaa !4
  %58 = load float, ptr %arrayidx33.13, align 4, !tbaa !4
  %59 = load float, ptr %arrayidx31.14, align 4, !tbaa !4
  %60 = load float, ptr %arrayidx33.14, align 4, !tbaa !4
  %61 = load float, ptr %arrayidx31.15, align 4, !tbaa !4
  %62 = load float, ptr %arrayidx33.15, align 4, !tbaa !4
  %63 = tail call float @llvm.fmuladd.f32(float %31, float %32, float %.phi21)
  %64 = tail call float @llvm.fmuladd.f32(float %33, float %34, float %.phi22)
  %65 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %.phi23)
  %66 = tail call float @llvm.fmuladd.f32(float %37, float %38, float %.phi24)
  %67 = tail call float @llvm.fmuladd.f32(float %39, float %40, float %.phi25)
  %68 = tail call float @llvm.fmuladd.f32(float %41, float %42, float %.phi26)
  %69 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %.phi27)
  %70 = tail call float @llvm.fmuladd.f32(float %45, float %46, float %.phi28)
  %71 = tail call float @llvm.fmuladd.f32(float %47, float %48, float %.phi29)
  %72 = tail call float @llvm.fmuladd.f32(float %49, float %50, float %.phi30)
  %73 = tail call float @llvm.fmuladd.f32(float %51, float %52, float %.phi31)
  %74 = tail call float @llvm.fmuladd.f32(float %53, float %54, float %.phi32)
  %75 = tail call float @llvm.fmuladd.f32(float %55, float %56, float %.phi33)
  %76 = tail call float @llvm.fmuladd.f32(float %57, float %58, float %.phi34)
  %77 = tail call float @llvm.fmuladd.f32(float %59, float %60, float %.phi35)
  %78 = tail call float @llvm.fmuladd.f32(float %61, float %62, float %.phi36)
  %cmp29.not.15 = icmp ult i32 %k25.0.15, %add60
  br i1 %cmp29.not.15, label %for.body30.15, label %for.end37.loopexit, !llvm.loop !11

for.end37.loopexit:                               ; preds = %for.body30.15
  %k25.0.15.lcssa = phi i32 [ %k25.0.15, %for.body30.15 ]
  %.lcssa120 = phi float [ %63, %for.body30.15 ]
  %.lcssa119 = phi float [ %64, %for.body30.15 ]
  %.lcssa118 = phi float [ %65, %for.body30.15 ]
  %.lcssa117 = phi float [ %66, %for.body30.15 ]
  %.lcssa116 = phi float [ %67, %for.body30.15 ]
  %.lcssa115 = phi float [ %68, %for.body30.15 ]
  %.lcssa114 = phi float [ %69, %for.body30.15 ]
  %.lcssa113 = phi float [ %70, %for.body30.15 ]
  %.lcssa112 = phi float [ %71, %for.body30.15 ]
  %.lcssa111 = phi float [ %72, %for.body30.15 ]
  %.lcssa110 = phi float [ %73, %for.body30.15 ]
  %.lcssa109 = phi float [ %74, %for.body30.15 ]
  %.lcssa108 = phi float [ %75, %for.body30.15 ]
  %.lcssa107 = phi float [ %76, %for.body30.15 ]
  %.lcssa106 = phi float [ %77, %for.body30.15 ]
  %.lcssa105 = phi float [ %78, %for.body30.15 ]
  %sum45 = fadd float %.lcssa120, %.lcssa119
  %sum46 = fadd float %.lcssa118, %.lcssa117
  %sum47 = fadd float %.lcssa116, %.lcssa115
  %sum48 = fadd float %.lcssa114, %.lcssa113
  %sum49 = fadd float %.lcssa112, %.lcssa111
  %sum50 = fadd float %.lcssa110, %.lcssa109
  %sum51 = fadd float %.lcssa108, %.lcssa107
  %sum52 = fadd float %.lcssa106, %.lcssa105
  %sum53 = fadd float %sum45, %sum46
  %sum54 = fadd float %sum47, %sum48
  %sum55 = fadd float %sum49, %sum50
  %sum56 = fadd float %sum51, %sum52
  %sum57 = fadd float %sum53, %sum54
  %sum58 = fadd float %sum55, %sum56
  %sum59 = fadd float %sum57, %sum58
  br label %for.end164

for.end164:                                       ; preds = %for.body24, %for.end37.loopexit
  %phi.sum = phi i32 [ %k25.0122, %for.body24 ], [ %k25.0.15.lcssa, %for.end37.loopexit ]
  %phi.float = phi float [ 0.000000e+00, %for.body24 ], [ %sum59, %for.end37.loopexit ]
  store float %phi.float, ptr %arrayidx26, align 4
  %cmp182.not587 = icmp ugt i32 %phi.sum, %n20.0126
  br i1 %cmp182.not587, label %for.end37, label %for.body30.clone

for.body30.clone:                                 ; preds = %for.end164, %for.body30.clone
  %79 = phi float [ %82, %for.body30.clone ], [ %phi.float, %for.end164 ]
  %k25.0124.clone = phi i32 [ %k25.0.clone, %for.body30.clone ], [ %phi.sum, %for.end164 ]
  %arrayidx31.clone = getelementptr inbounds float, ptr %sig.0, i32 %k25.0124.clone
  %80 = load float, ptr %arrayidx31.clone, align 4, !tbaa !4
  %sub32.clone = sub i32 %n20.0126, %k25.0124.clone
  %arrayidx33.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub32.clone
  %81 = load float, ptr %arrayidx33.clone, align 4, !tbaa !4
  %82 = tail call float @llvm.fmuladd.f32(float %80, float %81, float %79)
  %k25.0.clone = add i32 %k25.0124.clone, 1
  %cmp29.not.clone = icmp ugt i32 %k25.0.clone, %n20.0126
  br i1 %cmp29.not.clone, label %for.cond.for.end_crit_edge69, label %for.body30.clone, !llvm.loop !11

for.cond.for.end_crit_edge69:                     ; preds = %for.body30.clone
  %.lcssa121 = phi float [ %82, %for.body30.clone ]
  store float %.lcssa121, ptr %arrayidx26, align 4, !tbaa !4
  br label %for.end37

for.end37:                                        ; preds = %for.cond.for.end_crit_edge69, %for.end164
  %inc39 = add nuw nsw i32 %n20.0126, 1
  %exitcond133.not = icmp eq i32 %inc39, %lsig.0
  br i1 %exitcond133.not, label %for.cond42.preheader, label %for.body24, !llvm.loop !12

for.body47:                                       ; preds = %for.end64, %for.body47.lr.ph
  %n41.0131 = phi i32 [ %lsig.0, %for.body47.lr.ph ], [ %inc66, %for.end64 ]
  %arrayidx51 = getelementptr inbounds float, ptr %convout, i32 %n41.0131
  %sub52 = sub nsw i32 %n41.0131, %lkern.0
  %k50.0127 = add i32 %sub52, 1
  %add207.neg = xor i32 %sub52, -1
  %add211 = add i32 %add207.neg, %lsig.0
  %div212535 = and i32 %add211, -8
  %add214 = add i32 %div212535, %k50.0127
  %cmp56.not128 = icmp ult i32 %k50.0127, %add214
  br i1 %cmp56.not128, label %for.body57.7, label %for.end16492

for.body57.7:                                     ; preds = %for.body47, %for.body57.7
  %k50.0129 = phi i32 [ %k50.0.7, %for.body57.7 ], [ %k50.0127, %for.body47 ]
  %.phi70 = phi float [ %99, %for.body57.7 ], [ 0.000000e+00, %for.body47 ]
  %.phi71 = phi float [ %100, %for.body57.7 ], [ 0.000000e+00, %for.body47 ]
  %.phi72 = phi float [ %101, %for.body57.7 ], [ 0.000000e+00, %for.body47 ]
  %.phi73 = phi float [ %102, %for.body57.7 ], [ 0.000000e+00, %for.body47 ]
  %.phi74 = phi float [ %103, %for.body57.7 ], [ 0.000000e+00, %for.body47 ]
  %.phi75 = phi float [ %104, %for.body57.7 ], [ 0.000000e+00, %for.body47 ]
  %.phi76 = phi float [ %105, %for.body57.7 ], [ 0.000000e+00, %for.body47 ]
  %.phi77 = phi float [ %106, %for.body57.7 ], [ 0.000000e+00, %for.body47 ]
  %k50.0.7 = add i32 %k50.0129, 8
  %add79 = or disjoint i32 %k50.0129, 1
  %add81 = or disjoint i32 %k50.0129, 2
  %add83 = or disjoint i32 %k50.0129, 3
  %add85 = or disjoint i32 %k50.0129, 4
  %add87 = or disjoint i32 %k50.0129, 5
  %add89 = or disjoint i32 %k50.0129, 6
  %add91 = or disjoint i32 %k50.0129, 7
  %sub59 = sub i32 %n41.0131, %k50.0129
  %sub59.1 = sub i32 %n41.0131, %add79
  %sub59.2 = sub i32 %n41.0131, %add81
  %sub59.3 = sub i32 %n41.0131, %add83
  %sub59.4 = sub i32 %n41.0131, %add85
  %sub59.5 = sub i32 %n41.0131, %add87
  %sub59.6 = sub i32 %n41.0131, %add89
  %sub59.7 = sub i32 %n41.0131, %add91
  %arrayidx58 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0129
  %arrayidx60 = getelementptr inbounds float, ptr %kern.0, i32 %sub59
  %arrayidx58.1 = getelementptr inbounds float, ptr %sig.0, i32 %add79
  %arrayidx60.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.1
  %arrayidx58.2 = getelementptr inbounds float, ptr %sig.0, i32 %add81
  %arrayidx60.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.2
  %arrayidx58.3 = getelementptr inbounds float, ptr %sig.0, i32 %add83
  %arrayidx60.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.3
  %arrayidx58.4 = getelementptr inbounds float, ptr %sig.0, i32 %add85
  %arrayidx60.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.4
  %arrayidx58.5 = getelementptr inbounds float, ptr %sig.0, i32 %add87
  %arrayidx60.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.5
  %arrayidx58.6 = getelementptr inbounds float, ptr %sig.0, i32 %add89
  %arrayidx60.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.6
  %arrayidx58.7 = getelementptr inbounds float, ptr %sig.0, i32 %add91
  %arrayidx60.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.7
  %83 = load float, ptr %arrayidx58, align 4, !tbaa !4
  %84 = load float, ptr %arrayidx60, align 4, !tbaa !4
  %85 = load float, ptr %arrayidx58.1, align 4, !tbaa !4
  %86 = load float, ptr %arrayidx60.1, align 4, !tbaa !4
  %87 = load float, ptr %arrayidx58.2, align 4, !tbaa !4
  %88 = load float, ptr %arrayidx60.2, align 4, !tbaa !4
  %89 = load float, ptr %arrayidx58.3, align 4, !tbaa !4
  %90 = load float, ptr %arrayidx60.3, align 4, !tbaa !4
  %91 = load float, ptr %arrayidx58.4, align 4, !tbaa !4
  %92 = load float, ptr %arrayidx60.4, align 4, !tbaa !4
  %93 = load float, ptr %arrayidx58.5, align 4, !tbaa !4
  %94 = load float, ptr %arrayidx60.5, align 4, !tbaa !4
  %95 = load float, ptr %arrayidx58.6, align 4, !tbaa !4
  %96 = load float, ptr %arrayidx60.6, align 4, !tbaa !4
  %97 = load float, ptr %arrayidx58.7, align 4, !tbaa !4
  %98 = load float, ptr %arrayidx60.7, align 4, !tbaa !4
  %99 = tail call float @llvm.fmuladd.f32(float %83, float %84, float %.phi70)
  %100 = tail call float @llvm.fmuladd.f32(float %85, float %86, float %.phi71)
  %101 = tail call float @llvm.fmuladd.f32(float %87, float %88, float %.phi72)
  %102 = tail call float @llvm.fmuladd.f32(float %89, float %90, float %.phi73)
  %103 = tail call float @llvm.fmuladd.f32(float %91, float %92, float %.phi74)
  %104 = tail call float @llvm.fmuladd.f32(float %93, float %94, float %.phi75)
  %105 = tail call float @llvm.fmuladd.f32(float %95, float %96, float %.phi76)
  %106 = tail call float @llvm.fmuladd.f32(float %97, float %98, float %.phi77)
  %cmp56.not.7 = icmp ult i32 %k50.0.7, %add214
  br i1 %cmp56.not.7, label %for.body57.7, label %for.end64.loopexit, !llvm.loop !13

for.end64.loopexit:                               ; preds = %for.body57.7
  %k50.0.7.lcssa = phi i32 [ %k50.0.7, %for.body57.7 ]
  %.lcssa103 = phi float [ %99, %for.body57.7 ]
  %.lcssa102 = phi float [ %100, %for.body57.7 ]
  %.lcssa101 = phi float [ %101, %for.body57.7 ]
  %.lcssa100 = phi float [ %102, %for.body57.7 ]
  %.lcssa99 = phi float [ %103, %for.body57.7 ]
  %.lcssa98 = phi float [ %104, %for.body57.7 ]
  %.lcssa97 = phi float [ %105, %for.body57.7 ]
  %.lcssa = phi float [ %106, %for.body57.7 ]
  %sum60 = fadd float %.lcssa103, %.lcssa102
  %sum61 = fadd float %.lcssa101, %.lcssa100
  %sum62 = fadd float %.lcssa99, %.lcssa98
  %sum63 = fadd float %.lcssa97, %.lcssa
  %sum64 = fadd float %sum60, %sum61
  %sum65 = fadd float %sum62, %sum63
  %sum66 = fadd float %sum64, %sum65
  br label %for.end16492

for.end16492:                                     ; preds = %for.body47, %for.end64.loopexit
  %phi.sum93 = phi i32 [ %k50.0127, %for.body47 ], [ %k50.0.7.lcssa, %for.end64.loopexit ]
  %phi.float94 = phi float [ 0.000000e+00, %for.body47 ], [ %sum66, %for.end64.loopexit ]
  store float %phi.float94, ptr %arrayidx51, align 4
  %cmp182.not58795 = icmp ugt i32 %phi.sum93, %sub54
  br i1 %cmp182.not58795, label %for.end64, label %for.body57.clone

for.body57.clone:                                 ; preds = %for.end16492, %for.body57.clone
  %107 = phi float [ %110, %for.body57.clone ], [ %phi.float94, %for.end16492 ]
  %k50.0129.clone = phi i32 [ %k50.0.clone, %for.body57.clone ], [ %phi.sum93, %for.end16492 ]
  %arrayidx58.clone = getelementptr inbounds float, ptr %sig.0, i32 %k50.0129.clone
  %108 = load float, ptr %arrayidx58.clone, align 4, !tbaa !4
  %sub59.clone = sub i32 %n41.0131, %k50.0129.clone
  %arrayidx60.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub59.clone
  %109 = load float, ptr %arrayidx60.clone, align 4, !tbaa !4
  %110 = tail call float @llvm.fmuladd.f32(float %108, float %109, float %107)
  %k50.0.clone = add i32 %k50.0129.clone, 1
  %cmp56.not.clone = icmp ugt i32 %k50.0.clone, %sub54
  br i1 %cmp56.not.clone, label %for.cond.for.end_crit_edge96, label %for.body57.clone, !llvm.loop !13

for.cond.for.end_crit_edge96:                     ; preds = %for.body57.clone
  %.lcssa104 = phi float [ %110, %for.body57.clone ]
  store float %.lcssa104, ptr %arrayidx51, align 4, !tbaa !4
  br label %for.end64

for.end64:                                        ; preds = %for.cond.for.end_crit_edge96, %for.end16492
  %inc66 = add nsw i32 %n41.0131, 1
  %exitcond134.not = icmp eq i32 %inc66, %sub44
  br i1 %exitcond134.not, label %return, label %for.body47, !llvm.loop !14

return:                                           ; preds = %for.end64, %for.cond42.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond42.preheader ], [ 0, %for.end64 ]
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
