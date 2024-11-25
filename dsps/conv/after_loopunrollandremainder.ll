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
  br i1 %cmp10120, label %for.body.preheader, label %for.cond21.preheader

for.body.preheader:                               ; preds = %if.end9
  br label %for.body

for.cond21.preheader.loopexit:                    ; preds = %for.end
  br label %for.cond21.preheader

for.cond21.preheader:                             ; preds = %for.cond21.preheader.loopexit, %if.end9
  %cmp22125 = icmp slt i32 %lkern.0, %lsig.0
  br i1 %cmp22125, label %for.body24.preheader, label %for.cond42.preheader

for.body24.preheader:                             ; preds = %for.cond21.preheader
  %div536 = and i32 %lkern.0, -16
  br label %for.body24

for.body:                                         ; preds = %for.body.preheader, %for.end
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.end ], [ 1, %for.body.preheader ]
  %n.0121 = phi i32 [ %inc18, %for.end ], [ 0, %for.body.preheader ]
  %0 = and i32 %n.0121, -8
  %1 = and i32 %n.0121, 2147483640
  %2 = icmp eq i32 %1, 0
  %arrayidx = getelementptr inbounds float, ptr %convout, i32 %n.0121
  br i1 %2, label %for.body13.clone.preheader, label %for.body13.7

for.body13.7:                                     ; preds = %for.body13.7, %for.body
  %k.0119 = phi i32 [ 0, %for.body ], [ %inc.7, %for.body13.7 ]
  %.phi = phi float [ 0.000000e+00, %for.body ], [ %19, %for.body13.7 ]
  %.phi1 = phi float [ 0.000000e+00, %for.body ], [ %20, %for.body13.7 ]
  %.phi2 = phi float [ 0.000000e+00, %for.body ], [ %21, %for.body13.7 ]
  %.phi3 = phi float [ 0.000000e+00, %for.body ], [ %22, %for.body13.7 ]
  %.phi4 = phi float [ 0.000000e+00, %for.body ], [ %23, %for.body13.7 ]
  %.phi5 = phi float [ 0.000000e+00, %for.body ], [ %24, %for.body13.7 ]
  %.phi6 = phi float [ 0.000000e+00, %for.body ], [ %25, %for.body13.7 ]
  %.phi7 = phi float [ 0.000000e+00, %for.body ], [ %26, %for.body13.7 ]
  %inc = add nuw nsw i32 %k.0119, 1
  %inc.1 = add nuw nsw i32 %k.0119, 2
  %inc.2 = add nuw nsw i32 %k.0119, 3
  %inc.3 = add nuw nsw i32 %k.0119, 4
  %inc.4 = add nuw nsw i32 %k.0119, 5
  %inc.5 = add nuw nsw i32 %k.0119, 6
  %inc.6 = add nuw nsw i32 %k.0119, 7
  %inc.7 = add nuw nsw i32 %k.0119, 8
  %sub = sub nsw i32 %n.0121, %k.0119
  %sub.1 = sub nsw i32 %n.0121, %inc
  %sub.2 = sub nsw i32 %n.0121, %inc.1
  %sub.3 = sub nsw i32 %n.0121, %inc.2
  %sub.4 = sub nsw i32 %n.0121, %inc.3
  %sub.5 = sub nsw i32 %n.0121, %inc.4
  %sub.6 = sub nsw i32 %n.0121, %inc.5
  %sub.7 = sub nsw i32 %n.0121, %inc.6
  %arrayidx14 = getelementptr inbounds float, ptr %sig.0, i32 %k.0119
  %arrayidx15 = getelementptr inbounds float, ptr %kern.0, i32 %sub
  %arrayidx14.1 = getelementptr inbounds float, ptr %sig.0, i32 %inc
  %arrayidx15.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub.1
  %arrayidx14.2 = getelementptr inbounds float, ptr %sig.0, i32 %inc.1
  %arrayidx15.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub.2
  %arrayidx14.3 = getelementptr inbounds float, ptr %sig.0, i32 %inc.2
  %arrayidx15.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub.3
  %arrayidx14.4 = getelementptr inbounds float, ptr %sig.0, i32 %inc.3
  %arrayidx15.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub.4
  %arrayidx14.5 = getelementptr inbounds float, ptr %sig.0, i32 %inc.4
  %arrayidx15.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub.5
  %arrayidx14.6 = getelementptr inbounds float, ptr %sig.0, i32 %inc.5
  %arrayidx15.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub.6
  %arrayidx14.7 = getelementptr inbounds float, ptr %sig.0, i32 %inc.6
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
  br i1 %exitcond.7, label %for.body13.7, label %for.end8, !llvm.loop !8

for.end8:                                         ; preds = %for.body13.7
  %sum = fadd float %19, %20
  %sum23 = fadd float %21, %22
  %sum24 = fadd float %23, %24
  %sum25 = fadd float %25, %26
  %sum26 = fadd float %sum, %sum23
  %sum27 = fadd float %sum24, %sum25
  %sum28 = fadd float %sum26, %sum27
  store float %sum28, ptr %arrayidx, align 4
  br i1 false, label %for.end, label %for.body13.clone.preheader

for.body13.clone.preheader:                       ; preds = %for.end8, %for.body
  %sum.phi = phi float [ 0.000000e+00, %for.body ], [ %sum28, %for.end8 ]
  %add.phi = phi i32 [ 0, %for.body ], [ %0, %for.end8 ]
  br label %for.body13.clone

for.body13.clone:                                 ; preds = %for.body13.clone, %for.body13.clone.preheader
  %k.0119.clone = phi i32 [ %add.phi, %for.body13.clone.preheader ], [ %inc.clone, %for.body13.clone ]
  %27 = phi float [ %sum.phi, %for.body13.clone.preheader ], [ %30, %for.body13.clone ]
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
  store float %30, ptr %arrayidx, align 4, !tbaa !4
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %for.end8
  %inc18 = add nuw nsw i32 %n.0121, 1
  %indvars.iv.next = add nuw i32 %indvars.iv, 1
  %exitcond132.not = icmp eq i32 %inc18, %lkern.0
  br i1 %exitcond132.not, label %for.cond21.preheader.loopexit, label %for.body, !llvm.loop !10

for.cond42.preheader.loopexit:                    ; preds = %for.end37
  br label %for.cond42.preheader

for.cond42.preheader:                             ; preds = %for.cond42.preheader.loopexit, %for.cond21.preheader
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
  br i1 %cmp29.not123, label %for.body30.preheader, label %for.end164

for.body30.preheader:                             ; preds = %for.body24
  br label %for.body30.15

for.body30.15:                                    ; preds = %for.body30.15, %for.body30.preheader
  %k25.0124 = phi i32 [ %k25.0122, %for.body30.preheader ], [ %k25.0.15, %for.body30.15 ]
  %.phi9 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %63, %for.body30.15 ]
  %.phi10 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %64, %for.body30.15 ]
  %.phi11 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %65, %for.body30.15 ]
  %.phi12 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %66, %for.body30.15 ]
  %.phi13 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %67, %for.body30.15 ]
  %.phi14 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %68, %for.body30.15 ]
  %.phi15 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %69, %for.body30.15 ]
  %.phi16 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %70, %for.body30.15 ]
  %.phi17 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %71, %for.body30.15 ]
  %.phi18 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %72, %for.body30.15 ]
  %.phi19 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %73, %for.body30.15 ]
  %.phi20 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %74, %for.body30.15 ]
  %.phi21 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %75, %for.body30.15 ]
  %.phi22 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %76, %for.body30.15 ]
  %.phi23 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %77, %for.body30.15 ]
  %.phi24 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %78, %for.body30.15 ]
  %k25.0 = add i32 %k25.0124, 1
  %k25.0.1 = add i32 %k25.0124, 2
  %k25.0.2 = add i32 %k25.0124, 3
  %k25.0.3 = add i32 %k25.0124, 4
  %k25.0.4 = add i32 %k25.0124, 5
  %k25.0.5 = add i32 %k25.0124, 6
  %k25.0.6 = add i32 %k25.0124, 7
  %k25.0.7 = add i32 %k25.0124, 8
  %k25.0.8 = add i32 %k25.0124, 9
  %k25.0.9 = add i32 %k25.0124, 10
  %k25.0.10 = add i32 %k25.0124, 11
  %k25.0.11 = add i32 %k25.0124, 12
  %k25.0.12 = add i32 %k25.0124, 13
  %k25.0.13 = add i32 %k25.0124, 14
  %k25.0.14 = add i32 %k25.0124, 15
  %k25.0.15 = add i32 %k25.0124, 16
  %sub32 = sub i32 %n20.0126, %k25.0124
  %sub32.1 = sub i32 %n20.0126, %k25.0
  %sub32.2 = sub i32 %n20.0126, %k25.0.1
  %sub32.3 = sub i32 %n20.0126, %k25.0.2
  %sub32.4 = sub i32 %n20.0126, %k25.0.3
  %sub32.5 = sub i32 %n20.0126, %k25.0.4
  %sub32.6 = sub i32 %n20.0126, %k25.0.5
  %sub32.7 = sub i32 %n20.0126, %k25.0.6
  %sub32.8 = sub i32 %n20.0126, %k25.0.7
  %sub32.9 = sub i32 %n20.0126, %k25.0.8
  %sub32.10 = sub i32 %n20.0126, %k25.0.9
  %sub32.11 = sub i32 %n20.0126, %k25.0.10
  %sub32.12 = sub i32 %n20.0126, %k25.0.11
  %sub32.13 = sub i32 %n20.0126, %k25.0.12
  %sub32.14 = sub i32 %n20.0126, %k25.0.13
  %sub32.15 = sub i32 %n20.0126, %k25.0.14
  %arrayidx31 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0124
  %arrayidx33 = getelementptr inbounds float, ptr %kern.0, i32 %sub32
  %arrayidx31.1 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0
  %arrayidx33.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.1
  %arrayidx31.2 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.1
  %arrayidx33.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.2
  %arrayidx31.3 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.2
  %arrayidx33.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.3
  %arrayidx31.4 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.3
  %arrayidx33.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.4
  %arrayidx31.5 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.4
  %arrayidx33.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.5
  %arrayidx31.6 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.5
  %arrayidx33.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.6
  %arrayidx31.7 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.6
  %arrayidx33.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.7
  %arrayidx31.8 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.7
  %arrayidx33.8 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.8
  %arrayidx31.9 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.8
  %arrayidx33.9 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.9
  %arrayidx31.10 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.9
  %arrayidx33.10 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.10
  %arrayidx31.11 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.10
  %arrayidx33.11 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.11
  %arrayidx31.12 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.11
  %arrayidx33.12 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.12
  %arrayidx31.13 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.12
  %arrayidx33.13 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.13
  %arrayidx31.14 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.13
  %arrayidx33.14 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.14
  %arrayidx31.15 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.14
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
  %63 = tail call float @llvm.fmuladd.f32(float %31, float %32, float %.phi9)
  %64 = tail call float @llvm.fmuladd.f32(float %33, float %34, float %.phi10)
  %65 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %.phi11)
  %66 = tail call float @llvm.fmuladd.f32(float %37, float %38, float %.phi12)
  %67 = tail call float @llvm.fmuladd.f32(float %39, float %40, float %.phi13)
  %68 = tail call float @llvm.fmuladd.f32(float %41, float %42, float %.phi14)
  %69 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %.phi15)
  %70 = tail call float @llvm.fmuladd.f32(float %45, float %46, float %.phi16)
  %71 = tail call float @llvm.fmuladd.f32(float %47, float %48, float %.phi17)
  %72 = tail call float @llvm.fmuladd.f32(float %49, float %50, float %.phi18)
  %73 = tail call float @llvm.fmuladd.f32(float %51, float %52, float %.phi19)
  %74 = tail call float @llvm.fmuladd.f32(float %53, float %54, float %.phi20)
  %75 = tail call float @llvm.fmuladd.f32(float %55, float %56, float %.phi21)
  %76 = tail call float @llvm.fmuladd.f32(float %57, float %58, float %.phi22)
  %77 = tail call float @llvm.fmuladd.f32(float %59, float %60, float %.phi23)
  %78 = tail call float @llvm.fmuladd.f32(float %61, float %62, float %.phi24)
  %cmp29.not.15 = icmp ult i32 %k25.0.15, %add60
  br i1 %cmp29.not.15, label %for.body30.15, label %for.end37.loopexit, !llvm.loop !11

for.end37.loopexit:                               ; preds = %for.body30.15
  %sum45 = fadd float %63, %64
  %sum46 = fadd float %65, %66
  %sum47 = fadd float %67, %68
  %sum48 = fadd float %69, %70
  %sum49 = fadd float %71, %72
  %sum50 = fadd float %73, %74
  %sum51 = fadd float %75, %76
  %sum52 = fadd float %77, %78
  %sum53 = fadd float %sum45, %sum46
  %sum54 = fadd float %sum47, %sum48
  %sum55 = fadd float %sum49, %sum50
  %sum56 = fadd float %sum51, %sum52
  %sum57 = fadd float %sum53, %sum54
  %sum58 = fadd float %sum55, %sum56
  %sum59 = fadd float %sum57, %sum58
  br label %for.end164

for.end164:                                       ; preds = %for.body24, %for.end37.loopexit
  %phi.sum = phi i32 [ %k25.0122, %for.body24 ], [ %k25.0.15, %for.end37.loopexit ]
  %phi.float = phi float [ 0.000000e+00, %for.body24 ], [ %sum59, %for.end37.loopexit ]
  store float %phi.float, ptr %arrayidx26, align 4
  %cmp182.not587 = icmp ugt i32 %phi.sum, %n20.0126
  br i1 %cmp182.not587, label %for.end37, label %for.body30.clone

for.body30.clone:                                 ; preds = %for.body30.clone, %for.end164
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
  br i1 %cmp29.not.clone, label %for.cond.for.end_crit_edge25, label %for.body30.clone, !llvm.loop !11

for.cond.for.end_crit_edge25:                     ; preds = %for.body30.clone
  store float %82, ptr %arrayidx26, align 4, !tbaa !4
  br label %for.end37

for.end37:                                        ; preds = %for.cond.for.end_crit_edge25, %for.end164
  %inc39 = add nuw nsw i32 %n20.0126, 1
  %exitcond133.not = icmp eq i32 %inc39, %lsig.0
  br i1 %exitcond133.not, label %for.cond42.preheader.loopexit, label %for.body24, !llvm.loop !12

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
  br i1 %cmp56.not128, label %for.body57.preheader, label %for.end16434

for.body57.preheader:                             ; preds = %for.body47
  br label %for.body57.7

for.body57.7:                                     ; preds = %for.body57.7, %for.body57.preheader
  %k50.0129 = phi i32 [ %k50.0127, %for.body57.preheader ], [ %k50.0.7, %for.body57.7 ]
  %.phi26 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %99, %for.body57.7 ]
  %.phi27 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %100, %for.body57.7 ]
  %.phi28 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %101, %for.body57.7 ]
  %.phi29 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %102, %for.body57.7 ]
  %.phi30 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %103, %for.body57.7 ]
  %.phi31 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %104, %for.body57.7 ]
  %.phi32 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %105, %for.body57.7 ]
  %.phi33 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %106, %for.body57.7 ]
  %k50.0 = add i32 %k50.0129, 1
  %k50.0.1 = add i32 %k50.0129, 2
  %k50.0.2 = add i32 %k50.0129, 3
  %k50.0.3 = add i32 %k50.0129, 4
  %k50.0.4 = add i32 %k50.0129, 5
  %k50.0.5 = add i32 %k50.0129, 6
  %k50.0.6 = add i32 %k50.0129, 7
  %k50.0.7 = add i32 %k50.0129, 8
  %sub59 = sub i32 %n41.0131, %k50.0129
  %sub59.1 = sub i32 %n41.0131, %k50.0
  %sub59.2 = sub i32 %n41.0131, %k50.0.1
  %sub59.3 = sub i32 %n41.0131, %k50.0.2
  %sub59.4 = sub i32 %n41.0131, %k50.0.3
  %sub59.5 = sub i32 %n41.0131, %k50.0.4
  %sub59.6 = sub i32 %n41.0131, %k50.0.5
  %sub59.7 = sub i32 %n41.0131, %k50.0.6
  %arrayidx58 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0129
  %arrayidx60 = getelementptr inbounds float, ptr %kern.0, i32 %sub59
  %arrayidx58.1 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0
  %arrayidx60.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.1
  %arrayidx58.2 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.1
  %arrayidx60.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.2
  %arrayidx58.3 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.2
  %arrayidx60.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.3
  %arrayidx58.4 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.3
  %arrayidx60.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.4
  %arrayidx58.5 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.4
  %arrayidx60.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.5
  %arrayidx58.6 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.5
  %arrayidx60.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.6
  %arrayidx58.7 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.6
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
  %99 = tail call float @llvm.fmuladd.f32(float %83, float %84, float %.phi26)
  %100 = tail call float @llvm.fmuladd.f32(float %85, float %86, float %.phi27)
  %101 = tail call float @llvm.fmuladd.f32(float %87, float %88, float %.phi28)
  %102 = tail call float @llvm.fmuladd.f32(float %89, float %90, float %.phi29)
  %103 = tail call float @llvm.fmuladd.f32(float %91, float %92, float %.phi30)
  %104 = tail call float @llvm.fmuladd.f32(float %93, float %94, float %.phi31)
  %105 = tail call float @llvm.fmuladd.f32(float %95, float %96, float %.phi32)
  %106 = tail call float @llvm.fmuladd.f32(float %97, float %98, float %.phi33)
  %cmp56.not.7 = icmp ult i32 %k50.0.7, %add214
  br i1 %cmp56.not.7, label %for.body57.7, label %for.end64.loopexit, !llvm.loop !13

for.end64.loopexit:                               ; preds = %for.body57.7
  %sum60 = fadd float %99, %100
  %sum61 = fadd float %101, %102
  %sum62 = fadd float %103, %104
  %sum63 = fadd float %105, %106
  %sum64 = fadd float %sum60, %sum61
  %sum65 = fadd float %sum62, %sum63
  %sum66 = fadd float %sum64, %sum65
  br label %for.end16434

for.end16434:                                     ; preds = %for.body47, %for.end64.loopexit
  %phi.sum35 = phi i32 [ %k50.0127, %for.body47 ], [ %k50.0.7, %for.end64.loopexit ]
  %phi.float36 = phi float [ 0.000000e+00, %for.body47 ], [ %sum66, %for.end64.loopexit ]
  store float %phi.float36, ptr %arrayidx51, align 4
  %cmp182.not58737 = icmp ugt i32 %phi.sum35, %sub54
  br i1 %cmp182.not58737, label %for.end64, label %for.body57.clone

for.body57.clone:                                 ; preds = %for.body57.clone, %for.end16434
  %107 = phi float [ %110, %for.body57.clone ], [ %phi.float36, %for.end16434 ]
  %k50.0129.clone = phi i32 [ %k50.0.clone, %for.body57.clone ], [ %phi.sum35, %for.end16434 ]
  %arrayidx58.clone = getelementptr inbounds float, ptr %sig.0, i32 %k50.0129.clone
  %108 = load float, ptr %arrayidx58.clone, align 4, !tbaa !4
  %sub59.clone = sub i32 %n41.0131, %k50.0129.clone
  %arrayidx60.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub59.clone
  %109 = load float, ptr %arrayidx60.clone, align 4, !tbaa !4
  %110 = tail call float @llvm.fmuladd.f32(float %108, float %109, float %107)
  %k50.0.clone = add i32 %k50.0129.clone, 1
  %cmp56.not.clone = icmp ugt i32 %k50.0.clone, %sub54
  br i1 %cmp56.not.clone, label %for.cond.for.end_crit_edge38, label %for.body57.clone, !llvm.loop !13

for.cond.for.end_crit_edge38:                     ; preds = %for.body57.clone
  store float %110, ptr %arrayidx51, align 4, !tbaa !4
  br label %for.end64

for.end64:                                        ; preds = %for.cond.for.end_crit_edge38, %for.end16434
  %inc66 = add nsw i32 %n41.0131, 1
  %exitcond134.not = icmp eq i32 %inc66, %sub44
  br i1 %exitcond134.not, label %return.loopexit, label %for.body47, !llvm.loop !14

return.loopexit:                                  ; preds = %for.end64
  br label %return

return:                                           ; preds = %return.loopexit, %for.cond42.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond42.preheader ], [ 0, %return.loopexit ]
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c)"}
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
