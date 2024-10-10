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
  %0 = and i32 %n.0121, 2147483644
  %1 = add nsw i32 %0, -1
  %2 = and i32 %1, -4
  %3 = add i32 %2, 4
  %4 = and i32 %n.0121, 2147483644
  %5 = icmp eq i32 %4, 0
  %arrayidx = getelementptr inbounds float, ptr %convout, i32 %n.0121
  br i1 %5, label %for.body13.clone.preheader, label %for.body13.3

for.body13.3:                                     ; preds = %for.body13.3, %for.body
  %k.0119 = phi i32 [ 0, %for.body ], [ %inc.3, %for.body13.3 ]
  %.phi = phi float [ 0.000000e+00, %for.body ], [ %8, %for.body13.3 ]
  %.phi1 = phi float [ 0.000000e+00, %for.body ], [ %11, %for.body13.3 ]
  %.phi2 = phi float [ 0.000000e+00, %for.body ], [ %14, %for.body13.3 ]
  %.phi3 = phi float [ 0.000000e+00, %for.body ], [ %17, %for.body13.3 ]
  %arrayidx14 = getelementptr inbounds float, ptr %sig.0, i32 %k.0119
  %6 = load float, ptr %arrayidx14, align 4, !tbaa !4
  %sub = sub nsw i32 %n.0121, %k.0119
  %arrayidx15 = getelementptr inbounds float, ptr %kern.0, i32 %sub
  %7 = load float, ptr %arrayidx15, align 4, !tbaa !4
  %8 = tail call float @llvm.fmuladd.f32(float %6, float %7, float %.phi)
  %add = or disjoint i32 %k.0119, 1
  %arrayidx14.1 = getelementptr inbounds float, ptr %sig.0, i32 %add
  %9 = load float, ptr %arrayidx14.1, align 4, !tbaa !4
  %sub.1 = sub nsw i32 %n.0121, %add
  %arrayidx15.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub.1
  %10 = load float, ptr %arrayidx15.1, align 4, !tbaa !4
  %11 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %.phi1)
  %add5 = or disjoint i32 %k.0119, 2
  %arrayidx14.2 = getelementptr inbounds float, ptr %sig.0, i32 %add5
  %12 = load float, ptr %arrayidx14.2, align 4, !tbaa !4
  %sub.2 = sub nsw i32 %n.0121, %add5
  %arrayidx15.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub.2
  %13 = load float, ptr %arrayidx15.2, align 4, !tbaa !4
  %14 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %.phi2)
  %add7 = or disjoint i32 %k.0119, 3
  %arrayidx14.3 = getelementptr inbounds float, ptr %sig.0, i32 %add7
  %15 = load float, ptr %arrayidx14.3, align 4, !tbaa !4
  %sub.3 = sub nsw i32 %n.0121, %add7
  %arrayidx15.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub.3
  %16 = load float, ptr %arrayidx15.3, align 4, !tbaa !4
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %.phi3)
  %inc.3 = add nuw nsw i32 %k.0119, 4
  %exitcond.3 = icmp ult i32 %inc.3, %4
  br i1 %exitcond.3, label %for.body13.3, label %for.end8, !llvm.loop !8

for.end8:                                         ; preds = %for.body13.3
  %sum = fadd float %8, %11
  %sum9 = fadd float %sum, %14
  %sum10 = fadd float %sum9, %17
  store float %sum10, ptr %arrayidx, align 4
  %cmp37.not548 = icmp ugt i32 %3, %n.0121
  br i1 %cmp37.not548, label %for.end, label %for.body13.clone.preheader

for.body13.clone.preheader:                       ; preds = %for.end8, %for.body
  %sum.phi = phi float [ 0.000000e+00, %for.body ], [ %sum10, %for.end8 ]
  %add.phi = phi i32 [ 0, %for.body ], [ %3, %for.end8 ]
  br label %for.body13.clone

for.body13.clone:                                 ; preds = %for.body13.clone, %for.body13.clone.preheader
  %k.0119.clone = phi i32 [ %add.phi, %for.body13.clone.preheader ], [ %inc.clone, %for.body13.clone ]
  %18 = phi float [ %sum.phi, %for.body13.clone.preheader ], [ %21, %for.body13.clone ]
  %arrayidx14.clone = getelementptr inbounds float, ptr %sig.0, i32 %k.0119.clone
  %19 = load float, ptr %arrayidx14.clone, align 4, !tbaa !4
  %sub.clone = sub nsw i32 %n.0121, %k.0119.clone
  %arrayidx15.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub.clone
  %20 = load float, ptr %arrayidx15.clone, align 4, !tbaa !4
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %18)
  %inc.clone = add nuw nsw i32 %k.0119.clone, 1
  %exitcond.clone = icmp eq i32 %inc.clone, %indvars.iv
  br i1 %exitcond.clone, label %for.cond.for.end_crit_edge, label %for.body13.clone, !llvm.loop !8

for.cond.for.end_crit_edge:                       ; preds = %for.body13.clone
  store float %21, ptr %arrayidx, align 4, !tbaa !4
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
  %add60 = add i32 %div536, %k25.0122
  %cmp29.not123 = icmp ult i32 %k25.0122, %add60
  br i1 %cmp29.not123, label %for.body30.preheader, label %for.end164

for.body30.preheader:                             ; preds = %for.body24
  br label %for.body30.15

for.body30.15:                                    ; preds = %for.body30.15, %for.body30.preheader
  %k25.0124 = phi i32 [ %k25.0122, %for.body30.preheader ], [ %k25.0.15, %for.body30.15 ]
  %.phi11 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %24, %for.body30.15 ]
  %.phi12 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %27, %for.body30.15 ]
  %.phi13 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %30, %for.body30.15 ]
  %.phi14 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %33, %for.body30.15 ]
  %.phi15 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %36, %for.body30.15 ]
  %.phi16 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %39, %for.body30.15 ]
  %.phi17 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %42, %for.body30.15 ]
  %.phi18 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %45, %for.body30.15 ]
  %.phi19 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %48, %for.body30.15 ]
  %.phi20 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %51, %for.body30.15 ]
  %.phi21 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %54, %for.body30.15 ]
  %.phi22 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %57, %for.body30.15 ]
  %.phi23 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %60, %for.body30.15 ]
  %.phi24 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %63, %for.body30.15 ]
  %.phi25 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %66, %for.body30.15 ]
  %.phi26 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %69, %for.body30.15 ]
  %arrayidx31 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0124
  %22 = load float, ptr %arrayidx31, align 4, !tbaa !4
  %sub32 = sub i32 %n20.0126, %k25.0124
  %arrayidx33 = getelementptr inbounds float, ptr %kern.0, i32 %sub32
  %23 = load float, ptr %arrayidx33, align 4, !tbaa !4
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %.phi11)
  %k25.0 = add i32 %k25.0124, 1
  %arrayidx31.1 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0
  %25 = load float, ptr %arrayidx31.1, align 4, !tbaa !4
  %sub32.1 = sub i32 %n20.0126, %k25.0
  %arrayidx33.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.1
  %26 = load float, ptr %arrayidx33.1, align 4, !tbaa !4
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %.phi12)
  %k25.0.1 = add i32 %k25.0124, 2
  %arrayidx31.2 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.1
  %28 = load float, ptr %arrayidx31.2, align 4, !tbaa !4
  %sub32.2 = sub i32 %n20.0126, %k25.0.1
  %arrayidx33.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.2
  %29 = load float, ptr %arrayidx33.2, align 4, !tbaa !4
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float %.phi13)
  %k25.0.2 = add i32 %k25.0124, 3
  %arrayidx31.3 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.2
  %31 = load float, ptr %arrayidx31.3, align 4, !tbaa !4
  %sub32.3 = sub i32 %n20.0126, %k25.0.2
  %arrayidx33.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.3
  %32 = load float, ptr %arrayidx33.3, align 4, !tbaa !4
  %33 = tail call float @llvm.fmuladd.f32(float %31, float %32, float %.phi14)
  %k25.0.3 = add i32 %k25.0124, 4
  %arrayidx31.4 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.3
  %34 = load float, ptr %arrayidx31.4, align 4, !tbaa !4
  %sub32.4 = sub i32 %n20.0126, %k25.0.3
  %arrayidx33.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.4
  %35 = load float, ptr %arrayidx33.4, align 4, !tbaa !4
  %36 = tail call float @llvm.fmuladd.f32(float %34, float %35, float %.phi15)
  %k25.0.4 = add i32 %k25.0124, 5
  %arrayidx31.5 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.4
  %37 = load float, ptr %arrayidx31.5, align 4, !tbaa !4
  %sub32.5 = sub i32 %n20.0126, %k25.0.4
  %arrayidx33.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.5
  %38 = load float, ptr %arrayidx33.5, align 4, !tbaa !4
  %39 = tail call float @llvm.fmuladd.f32(float %37, float %38, float %.phi16)
  %k25.0.5 = add i32 %k25.0124, 6
  %arrayidx31.6 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.5
  %40 = load float, ptr %arrayidx31.6, align 4, !tbaa !4
  %sub32.6 = sub i32 %n20.0126, %k25.0.5
  %arrayidx33.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.6
  %41 = load float, ptr %arrayidx33.6, align 4, !tbaa !4
  %42 = tail call float @llvm.fmuladd.f32(float %40, float %41, float %.phi17)
  %k25.0.6 = add i32 %k25.0124, 7
  %arrayidx31.7 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.6
  %43 = load float, ptr %arrayidx31.7, align 4, !tbaa !4
  %sub32.7 = sub i32 %n20.0126, %k25.0.6
  %arrayidx33.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.7
  %44 = load float, ptr %arrayidx33.7, align 4, !tbaa !4
  %45 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %.phi18)
  %k25.0.7 = add i32 %k25.0124, 8
  %arrayidx31.8 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.7
  %46 = load float, ptr %arrayidx31.8, align 4, !tbaa !4
  %sub32.8 = sub i32 %n20.0126, %k25.0.7
  %arrayidx33.8 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.8
  %47 = load float, ptr %arrayidx33.8, align 4, !tbaa !4
  %48 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %.phi19)
  %k25.0.8 = add i32 %k25.0124, 9
  %arrayidx31.9 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.8
  %49 = load float, ptr %arrayidx31.9, align 4, !tbaa !4
  %sub32.9 = sub i32 %n20.0126, %k25.0.8
  %arrayidx33.9 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.9
  %50 = load float, ptr %arrayidx33.9, align 4, !tbaa !4
  %51 = tail call float @llvm.fmuladd.f32(float %49, float %50, float %.phi20)
  %k25.0.9 = add i32 %k25.0124, 10
  %arrayidx31.10 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.9
  %52 = load float, ptr %arrayidx31.10, align 4, !tbaa !4
  %sub32.10 = sub i32 %n20.0126, %k25.0.9
  %arrayidx33.10 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.10
  %53 = load float, ptr %arrayidx33.10, align 4, !tbaa !4
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %.phi21)
  %k25.0.10 = add i32 %k25.0124, 11
  %arrayidx31.11 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.10
  %55 = load float, ptr %arrayidx31.11, align 4, !tbaa !4
  %sub32.11 = sub i32 %n20.0126, %k25.0.10
  %arrayidx33.11 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.11
  %56 = load float, ptr %arrayidx33.11, align 4, !tbaa !4
  %57 = tail call float @llvm.fmuladd.f32(float %55, float %56, float %.phi22)
  %k25.0.11 = add i32 %k25.0124, 12
  %arrayidx31.12 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.11
  %58 = load float, ptr %arrayidx31.12, align 4, !tbaa !4
  %sub32.12 = sub i32 %n20.0126, %k25.0.11
  %arrayidx33.12 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.12
  %59 = load float, ptr %arrayidx33.12, align 4, !tbaa !4
  %60 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %.phi23)
  %k25.0.12 = add i32 %k25.0124, 13
  %arrayidx31.13 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.12
  %61 = load float, ptr %arrayidx31.13, align 4, !tbaa !4
  %sub32.13 = sub i32 %n20.0126, %k25.0.12
  %arrayidx33.13 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.13
  %62 = load float, ptr %arrayidx33.13, align 4, !tbaa !4
  %63 = tail call float @llvm.fmuladd.f32(float %61, float %62, float %.phi24)
  %k25.0.13 = add i32 %k25.0124, 14
  %arrayidx31.14 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.13
  %64 = load float, ptr %arrayidx31.14, align 4, !tbaa !4
  %sub32.14 = sub i32 %n20.0126, %k25.0.13
  %arrayidx33.14 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.14
  %65 = load float, ptr %arrayidx33.14, align 4, !tbaa !4
  %66 = tail call float @llvm.fmuladd.f32(float %64, float %65, float %.phi25)
  %k25.0.14 = add i32 %k25.0124, 15
  %arrayidx31.15 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.14
  %67 = load float, ptr %arrayidx31.15, align 4, !tbaa !4
  %sub32.15 = sub i32 %n20.0126, %k25.0.14
  %arrayidx33.15 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.15
  %68 = load float, ptr %arrayidx33.15, align 4, !tbaa !4
  %69 = tail call float @llvm.fmuladd.f32(float %67, float %68, float %.phi26)
  %k25.0.15 = add i32 %k25.0124, 16
  %cmp29.not.15 = icmp ult i32 %k25.0.15, %add60
  br i1 %cmp29.not.15, label %for.body30.15, label %for.end37.loopexit, !llvm.loop !11

for.end37.loopexit:                               ; preds = %for.body30.15
  %sum27 = fadd float %24, %27
  %sum28 = fadd float %sum27, %30
  %sum29 = fadd float %sum28, %33
  %sum30 = fadd float %sum29, %36
  %sum31 = fadd float %sum30, %39
  %sum32 = fadd float %sum31, %42
  %sum33 = fadd float %sum32, %45
  %sum34 = fadd float %sum33, %48
  %sum35 = fadd float %sum34, %51
  %sum36 = fadd float %sum35, %54
  %sum37 = fadd float %sum36, %57
  %sum38 = fadd float %sum37, %60
  %sum39 = fadd float %sum38, %63
  %sum40 = fadd float %sum39, %66
  %sum41 = fadd float %sum40, %69
  br label %for.end164

for.end164:                                       ; preds = %for.body24, %for.end37.loopexit
  %phi.sum = phi i32 [ %k25.0122, %for.body24 ], [ %k25.0.15, %for.end37.loopexit ]
  %phi.float = phi float [ 0.000000e+00, %for.body24 ], [ %sum41, %for.end37.loopexit ]
  store float %phi.float, ptr %arrayidx26, align 4
  %cmp182.not587 = icmp ugt i32 %phi.sum, %n20.0126
  br i1 %cmp182.not587, label %for.end37, label %for.body30.clone

for.body30.clone:                                 ; preds = %for.body30.clone, %for.end164
  %70 = phi float [ %73, %for.body30.clone ], [ %phi.float, %for.end164 ]
  %k25.0124.clone = phi i32 [ %k25.0.clone, %for.body30.clone ], [ %phi.sum, %for.end164 ]
  %arrayidx31.clone = getelementptr inbounds float, ptr %sig.0, i32 %k25.0124.clone
  %71 = load float, ptr %arrayidx31.clone, align 4, !tbaa !4
  %sub32.clone = sub i32 %n20.0126, %k25.0124.clone
  %arrayidx33.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub32.clone
  %72 = load float, ptr %arrayidx33.clone, align 4, !tbaa !4
  %73 = tail call float @llvm.fmuladd.f32(float %71, float %72, float %70)
  %k25.0.clone = add i32 %k25.0124.clone, 1
  %cmp29.not.clone = icmp ugt i32 %k25.0.clone, %n20.0126
  br i1 %cmp29.not.clone, label %for.cond.for.end_crit_edge42, label %for.body30.clone, !llvm.loop !11

for.cond.for.end_crit_edge42:                     ; preds = %for.body30.clone
  store float %73, ptr %arrayidx26, align 4, !tbaa !4
  br label %for.end37

for.end37:                                        ; preds = %for.cond.for.end_crit_edge42, %for.end164
  %inc39 = add nuw nsw i32 %n20.0126, 1
  %exitcond133.not = icmp eq i32 %inc39, %lsig.0
  br i1 %exitcond133.not, label %for.cond42.preheader.loopexit, label %for.body24, !llvm.loop !12

for.body47:                                       ; preds = %for.end64, %for.body47.lr.ph
  %n41.0131 = phi i32 [ %lsig.0, %for.body47.lr.ph ], [ %inc66, %for.end64 ]
  %arrayidx51 = getelementptr inbounds float, ptr %convout, i32 %n41.0131
  %sub52 = sub nsw i32 %n41.0131, %lkern.0
  %k50.0127 = add i32 %sub52, 1
  %add207.neg = xor i32 %sub52, -1
  %add211 = add i32 %lsig.0, %add207.neg
  %div212535 = and i32 %add211, -8
  %add214 = add i32 %div212535, %k50.0127
  %cmp56.not128 = icmp ult i32 %k50.0127, %add214
  br i1 %cmp56.not128, label %for.body57.preheader, label %for.end274

for.body57.preheader:                             ; preds = %for.body47
  br label %for.body57.7

for.body57.7:                                     ; preds = %for.body57.7, %for.body57.preheader
  %k50.0129 = phi i32 [ %k50.0127, %for.body57.preheader ], [ %k50.0.7, %for.body57.7 ]
  %.phi43 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %76, %for.body57.7 ]
  %.phi44 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %79, %for.body57.7 ]
  %.phi45 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %82, %for.body57.7 ]
  %.phi46 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %85, %for.body57.7 ]
  %.phi47 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %88, %for.body57.7 ]
  %.phi48 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %91, %for.body57.7 ]
  %.phi49 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %94, %for.body57.7 ]
  %.phi50 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %97, %for.body57.7 ]
  %arrayidx58 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0129
  %74 = load float, ptr %arrayidx58, align 4, !tbaa !4
  %sub59 = sub i32 %n41.0131, %k50.0129
  %arrayidx60 = getelementptr inbounds float, ptr %kern.0, i32 %sub59
  %75 = load float, ptr %arrayidx60, align 4, !tbaa !4
  %76 = tail call float @llvm.fmuladd.f32(float %74, float %75, float %.phi43)
  %k50.0 = add i32 %k50.0129, 1
  %arrayidx58.1 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0
  %77 = load float, ptr %arrayidx58.1, align 4, !tbaa !4
  %sub59.1 = sub i32 %n41.0131, %k50.0
  %arrayidx60.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.1
  %78 = load float, ptr %arrayidx60.1, align 4, !tbaa !4
  %79 = tail call float @llvm.fmuladd.f32(float %77, float %78, float %.phi44)
  %k50.0.1 = add i32 %k50.0129, 2
  %arrayidx58.2 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.1
  %80 = load float, ptr %arrayidx58.2, align 4, !tbaa !4
  %sub59.2 = sub i32 %n41.0131, %k50.0.1
  %arrayidx60.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.2
  %81 = load float, ptr %arrayidx60.2, align 4, !tbaa !4
  %82 = tail call float @llvm.fmuladd.f32(float %80, float %81, float %.phi45)
  %k50.0.2 = add i32 %k50.0129, 3
  %arrayidx58.3 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.2
  %83 = load float, ptr %arrayidx58.3, align 4, !tbaa !4
  %sub59.3 = sub i32 %n41.0131, %k50.0.2
  %arrayidx60.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.3
  %84 = load float, ptr %arrayidx60.3, align 4, !tbaa !4
  %85 = tail call float @llvm.fmuladd.f32(float %83, float %84, float %.phi46)
  %k50.0.3 = add i32 %k50.0129, 4
  %arrayidx58.4 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.3
  %86 = load float, ptr %arrayidx58.4, align 4, !tbaa !4
  %sub59.4 = sub i32 %n41.0131, %k50.0.3
  %arrayidx60.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.4
  %87 = load float, ptr %arrayidx60.4, align 4, !tbaa !4
  %88 = tail call float @llvm.fmuladd.f32(float %86, float %87, float %.phi47)
  %k50.0.4 = add i32 %k50.0129, 5
  %arrayidx58.5 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.4
  %89 = load float, ptr %arrayidx58.5, align 4, !tbaa !4
  %sub59.5 = sub i32 %n41.0131, %k50.0.4
  %arrayidx60.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.5
  %90 = load float, ptr %arrayidx60.5, align 4, !tbaa !4
  %91 = tail call float @llvm.fmuladd.f32(float %89, float %90, float %.phi48)
  %k50.0.5 = add i32 %k50.0129, 6
  %arrayidx58.6 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.5
  %92 = load float, ptr %arrayidx58.6, align 4, !tbaa !4
  %sub59.6 = sub i32 %n41.0131, %k50.0.5
  %arrayidx60.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.6
  %93 = load float, ptr %arrayidx60.6, align 4, !tbaa !4
  %94 = tail call float @llvm.fmuladd.f32(float %92, float %93, float %.phi49)
  %k50.0.6 = add i32 %k50.0129, 7
  %arrayidx58.7 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.6
  %95 = load float, ptr %arrayidx58.7, align 4, !tbaa !4
  %sub59.7 = sub i32 %n41.0131, %k50.0.6
  %arrayidx60.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.7
  %96 = load float, ptr %arrayidx60.7, align 4, !tbaa !4
  %97 = tail call float @llvm.fmuladd.f32(float %95, float %96, float %.phi50)
  %k50.0.7 = add i32 %k50.0129, 8
  %cmp56.not.7 = icmp ult i32 %k50.0.7, %add214
  br i1 %cmp56.not.7, label %for.body57.7, label %for.end64.loopexit, !llvm.loop !13

for.end64.loopexit:                               ; preds = %for.body57.7
  %sum51 = fadd float %76, %79
  %sum52 = fadd float %sum51, %82
  %sum53 = fadd float %sum52, %85
  %sum54 = fadd float %sum53, %88
  %sum55 = fadd float %sum54, %91
  %sum56 = fadd float %sum55, %94
  %sum57 = fadd float %sum56, %97
  br label %for.end274

for.end274:                                       ; preds = %for.body47, %for.end64.loopexit
  %phi.sum58 = phi i32 [ %k50.0127, %for.body47 ], [ %k50.0.7, %for.end64.loopexit ]
  %phi.float59 = phi float [ 0.000000e+00, %for.body47 ], [ %sum57, %for.end64.loopexit ]
  store float %phi.float59, ptr %arrayidx51, align 4
  %cmp182.not58760 = icmp ugt i32 %phi.sum58, %sub54
  br i1 %cmp182.not58760, label %for.end64, label %for.body57.clone

for.body57.clone:                                 ; preds = %for.body57.clone, %for.end274
  %98 = phi float [ %101, %for.body57.clone ], [ %phi.float59, %for.end274 ]
  %k50.0129.clone = phi i32 [ %k50.0.clone, %for.body57.clone ], [ %phi.sum58, %for.end274 ]
  %arrayidx58.clone = getelementptr inbounds float, ptr %sig.0, i32 %k50.0129.clone
  %99 = load float, ptr %arrayidx58.clone, align 4, !tbaa !4
  %sub59.clone = sub i32 %n41.0131, %k50.0129.clone
  %arrayidx60.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub59.clone
  %100 = load float, ptr %arrayidx60.clone, align 4, !tbaa !4
  %101 = tail call float @llvm.fmuladd.f32(float %99, float %100, float %98)
  %k50.0.clone = add i32 %k50.0129.clone, 1
  %cmp56.not.clone = icmp ugt i32 %k50.0.clone, %sub54
  br i1 %cmp56.not.clone, label %for.cond.for.end_crit_edge61, label %for.body57.clone, !llvm.loop !13

for.cond.for.end_crit_edge61:                     ; preds = %for.body57.clone
  store float %101, ptr %arrayidx51, align 4, !tbaa !4
  br label %for.end64

for.end64:                                        ; preds = %for.cond.for.end_crit_edge61, %for.end274
  %inc66 = add nsw i32 %n41.0131, 1
  %exitcond134.not = icmp eq i32 %inc66, %sub44
  br i1 %exitcond134.not, label %return.loopexit, label %for.body47, !llvm.loop !14

return.loopexit:                                  ; preds = %for.end64
  %retval.0.ph = phi i32 [ 0, %for.end64 ]
  br label %return

return:                                           ; preds = %return.loopexit, %for.cond42.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond42.preheader ], [ %retval.0.ph, %return.loopexit ]
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-172-g9dacbc0)"}
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
