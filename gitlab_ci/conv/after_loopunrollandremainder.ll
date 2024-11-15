; ModuleID = 'after_customlicm.ll'
source_filename = "after_customlicm.ll"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

define dso_local noundef i32 @dsps_conv_f32_ansi(ptr noalias noundef readonly %Signal, i32 noundef %siglen, ptr noalias noundef readonly %Kernel, i32 noundef %kernlen, ptr noalias noundef writeonly %convout) local_unnamed_addr {
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
  %0 = and i32 %n.0121, 2147483640
  %1 = add nsw i32 %0, -1
  %2 = and i32 %1, -8
  %3 = add i32 %2, 8
  %4 = and i32 %n.0121, 2147483640
  %5 = icmp eq i32 %4, 0
  %arrayidx = getelementptr inbounds float, ptr %convout, i32 %n.0121
  br i1 %5, label %for.body13.clone.preheader, label %for.body13.7

for.body13.7:                                     ; preds = %for.body13.7, %for.body
  %k.0119 = phi i32 [ 0, %for.body ], [ %inc.7, %for.body13.7 ]
  %.phi = phi float [ 0.000000e+00, %for.body ], [ %8, %for.body13.7 ]
  %.phi1 = phi float [ 0.000000e+00, %for.body ], [ %11, %for.body13.7 ]
  %.phi2 = phi float [ 0.000000e+00, %for.body ], [ %14, %for.body13.7 ]
  %.phi3 = phi float [ 0.000000e+00, %for.body ], [ %17, %for.body13.7 ]
  %.phi4 = phi float [ 0.000000e+00, %for.body ], [ %20, %for.body13.7 ]
  %.phi5 = phi float [ 0.000000e+00, %for.body ], [ %23, %for.body13.7 ]
  %.phi6 = phi float [ 0.000000e+00, %for.body ], [ %26, %for.body13.7 ]
  %.phi7 = phi float [ 0.000000e+00, %for.body ], [ %29, %for.body13.7 ]
  %arrayidx14 = getelementptr inbounds float, ptr %sig.0, i32 %k.0119
  %6 = load float, ptr %arrayidx14, align 4
  %sub = sub nsw i32 %n.0121, %k.0119
  %arrayidx15 = getelementptr inbounds float, ptr %kern.0, i32 %sub
  %7 = load float, ptr %arrayidx15, align 4
  %8 = tail call float @llvm.fmuladd.f32(float %6, float %7, float %.phi)
  %add = or disjoint i32 %k.0119, 1
  %arrayidx14.1 = getelementptr inbounds float, ptr %sig.0, i32 %add
  %9 = load float, ptr %arrayidx14.1, align 4
  %sub.1 = sub nsw i32 %n.0121, %add
  %arrayidx15.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub.1
  %10 = load float, ptr %arrayidx15.1, align 4
  %11 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %.phi1)
  %add9 = or disjoint i32 %k.0119, 2
  %arrayidx14.2 = getelementptr inbounds float, ptr %sig.0, i32 %add9
  %12 = load float, ptr %arrayidx14.2, align 4
  %sub.2 = sub nsw i32 %n.0121, %add9
  %arrayidx15.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub.2
  %13 = load float, ptr %arrayidx15.2, align 4
  %14 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %.phi2)
  %add11 = or disjoint i32 %k.0119, 3
  %arrayidx14.3 = getelementptr inbounds float, ptr %sig.0, i32 %add11
  %15 = load float, ptr %arrayidx14.3, align 4
  %sub.3 = sub nsw i32 %n.0121, %add11
  %arrayidx15.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub.3
  %16 = load float, ptr %arrayidx15.3, align 4
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %.phi3)
  %add13 = or disjoint i32 %k.0119, 4
  %arrayidx14.4 = getelementptr inbounds float, ptr %sig.0, i32 %add13
  %18 = load float, ptr %arrayidx14.4, align 4
  %sub.4 = sub nsw i32 %n.0121, %add13
  %arrayidx15.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub.4
  %19 = load float, ptr %arrayidx15.4, align 4
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %.phi4)
  %add15 = or disjoint i32 %k.0119, 5
  %arrayidx14.5 = getelementptr inbounds float, ptr %sig.0, i32 %add15
  %21 = load float, ptr %arrayidx14.5, align 4
  %sub.5 = sub nsw i32 %n.0121, %add15
  %arrayidx15.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub.5
  %22 = load float, ptr %arrayidx15.5, align 4
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %.phi5)
  %add17 = or disjoint i32 %k.0119, 6
  %arrayidx14.6 = getelementptr inbounds float, ptr %sig.0, i32 %add17
  %24 = load float, ptr %arrayidx14.6, align 4
  %sub.6 = sub nsw i32 %n.0121, %add17
  %arrayidx15.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub.6
  %25 = load float, ptr %arrayidx15.6, align 4
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %.phi6)
  %add19 = or disjoint i32 %k.0119, 7
  %arrayidx14.7 = getelementptr inbounds float, ptr %sig.0, i32 %add19
  %27 = load float, ptr %arrayidx14.7, align 4
  %sub.7 = sub nsw i32 %n.0121, %add19
  %arrayidx15.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub.7
  %28 = load float, ptr %arrayidx15.7, align 4
  %29 = tail call float @llvm.fmuladd.f32(float %27, float %28, float %.phi7)
  %inc.7 = add nuw nsw i32 %k.0119, 8
  %exitcond.7 = icmp ult i32 %inc.7, %4
  br i1 %exitcond.7, label %for.body13.7, label %for.end20

for.end20:                                        ; preds = %for.body13.7
  %sum = fadd float %8, %11
  %sum21 = fadd float %sum, %14
  %sum22 = fadd float %sum21, %17
  %sum23 = fadd float %sum22, %20
  %sum24 = fadd float %sum23, %23
  %sum25 = fadd float %sum24, %26
  %sum26 = fadd float %sum25, %29
  store float %sum26, ptr %arrayidx, align 4
  %cmp37.not548 = icmp ugt i32 %3, %n.0121
  br i1 %cmp37.not548, label %for.end, label %for.body13.clone.preheader

for.body13.clone.preheader:                       ; preds = %for.end20, %for.body
  %sum.phi = phi float [ 0.000000e+00, %for.body ], [ %sum26, %for.end20 ]
  %add.phi = phi i32 [ 0, %for.body ], [ %3, %for.end20 ]
  br label %for.body13.clone

for.body13.clone:                                 ; preds = %for.body13.clone, %for.body13.clone.preheader
  %k.0119.clone = phi i32 [ %add.phi, %for.body13.clone.preheader ], [ %inc.clone, %for.body13.clone ]
  %30 = phi float [ %sum.phi, %for.body13.clone.preheader ], [ %33, %for.body13.clone ]
  %arrayidx14.clone = getelementptr inbounds float, ptr %sig.0, i32 %k.0119.clone
  %31 = load float, ptr %arrayidx14.clone, align 4
  %sub.clone = sub nsw i32 %n.0121, %k.0119.clone
  %arrayidx15.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub.clone
  %32 = load float, ptr %arrayidx15.clone, align 4
  %33 = tail call float @llvm.fmuladd.f32(float %31, float %32, float %30)
  %inc.clone = add nuw nsw i32 %k.0119.clone, 1
  %exitcond.clone = icmp eq i32 %inc.clone, %indvars.iv
  br i1 %exitcond.clone, label %for.cond.for.end_crit_edge, label %for.body13.clone

for.cond.for.end_crit_edge:                       ; preds = %for.body13.clone
  store float %33, ptr %arrayidx, align 4
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %for.end20
  %inc18 = add nuw nsw i32 %n.0121, 1
  %indvars.iv.next = add nuw i32 %indvars.iv, 1
  %exitcond132.not = icmp eq i32 %inc18, %lkern.0
  br i1 %exitcond132.not, label %for.cond21.preheader.loopexit, label %for.body

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
  %.phi27 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %36, %for.body30.15 ]
  %.phi28 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %39, %for.body30.15 ]
  %.phi29 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %42, %for.body30.15 ]
  %.phi30 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %45, %for.body30.15 ]
  %.phi31 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %48, %for.body30.15 ]
  %.phi32 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %51, %for.body30.15 ]
  %.phi33 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %54, %for.body30.15 ]
  %.phi34 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %57, %for.body30.15 ]
  %.phi35 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %60, %for.body30.15 ]
  %.phi36 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %63, %for.body30.15 ]
  %.phi37 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %66, %for.body30.15 ]
  %.phi38 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %69, %for.body30.15 ]
  %.phi39 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %72, %for.body30.15 ]
  %.phi40 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %75, %for.body30.15 ]
  %.phi41 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %78, %for.body30.15 ]
  %.phi42 = phi float [ 0.000000e+00, %for.body30.preheader ], [ %81, %for.body30.15 ]
  %arrayidx31 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0124
  %34 = load float, ptr %arrayidx31, align 4
  %sub32 = sub i32 %n20.0126, %k25.0124
  %arrayidx33 = getelementptr inbounds float, ptr %kern.0, i32 %sub32
  %35 = load float, ptr %arrayidx33, align 4
  %36 = tail call float @llvm.fmuladd.f32(float %34, float %35, float %.phi27)
  %k25.0 = add i32 %k25.0124, 1
  %arrayidx31.1 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0
  %37 = load float, ptr %arrayidx31.1, align 4
  %sub32.1 = sub i32 %n20.0126, %k25.0
  %arrayidx33.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.1
  %38 = load float, ptr %arrayidx33.1, align 4
  %39 = tail call float @llvm.fmuladd.f32(float %37, float %38, float %.phi28)
  %k25.0.1 = add i32 %k25.0124, 2
  %arrayidx31.2 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.1
  %40 = load float, ptr %arrayidx31.2, align 4
  %sub32.2 = sub i32 %n20.0126, %k25.0.1
  %arrayidx33.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.2
  %41 = load float, ptr %arrayidx33.2, align 4
  %42 = tail call float @llvm.fmuladd.f32(float %40, float %41, float %.phi29)
  %k25.0.2 = add i32 %k25.0124, 3
  %arrayidx31.3 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.2
  %43 = load float, ptr %arrayidx31.3, align 4
  %sub32.3 = sub i32 %n20.0126, %k25.0.2
  %arrayidx33.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.3
  %44 = load float, ptr %arrayidx33.3, align 4
  %45 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %.phi30)
  %k25.0.3 = add i32 %k25.0124, 4
  %arrayidx31.4 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.3
  %46 = load float, ptr %arrayidx31.4, align 4
  %sub32.4 = sub i32 %n20.0126, %k25.0.3
  %arrayidx33.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.4
  %47 = load float, ptr %arrayidx33.4, align 4
  %48 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %.phi31)
  %k25.0.4 = add i32 %k25.0124, 5
  %arrayidx31.5 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.4
  %49 = load float, ptr %arrayidx31.5, align 4
  %sub32.5 = sub i32 %n20.0126, %k25.0.4
  %arrayidx33.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.5
  %50 = load float, ptr %arrayidx33.5, align 4
  %51 = tail call float @llvm.fmuladd.f32(float %49, float %50, float %.phi32)
  %k25.0.5 = add i32 %k25.0124, 6
  %arrayidx31.6 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.5
  %52 = load float, ptr %arrayidx31.6, align 4
  %sub32.6 = sub i32 %n20.0126, %k25.0.5
  %arrayidx33.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.6
  %53 = load float, ptr %arrayidx33.6, align 4
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %.phi33)
  %k25.0.6 = add i32 %k25.0124, 7
  %arrayidx31.7 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.6
  %55 = load float, ptr %arrayidx31.7, align 4
  %sub32.7 = sub i32 %n20.0126, %k25.0.6
  %arrayidx33.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.7
  %56 = load float, ptr %arrayidx33.7, align 4
  %57 = tail call float @llvm.fmuladd.f32(float %55, float %56, float %.phi34)
  %k25.0.7 = add i32 %k25.0124, 8
  %arrayidx31.8 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.7
  %58 = load float, ptr %arrayidx31.8, align 4
  %sub32.8 = sub i32 %n20.0126, %k25.0.7
  %arrayidx33.8 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.8
  %59 = load float, ptr %arrayidx33.8, align 4
  %60 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %.phi35)
  %k25.0.8 = add i32 %k25.0124, 9
  %arrayidx31.9 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.8
  %61 = load float, ptr %arrayidx31.9, align 4
  %sub32.9 = sub i32 %n20.0126, %k25.0.8
  %arrayidx33.9 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.9
  %62 = load float, ptr %arrayidx33.9, align 4
  %63 = tail call float @llvm.fmuladd.f32(float %61, float %62, float %.phi36)
  %k25.0.9 = add i32 %k25.0124, 10
  %arrayidx31.10 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.9
  %64 = load float, ptr %arrayidx31.10, align 4
  %sub32.10 = sub i32 %n20.0126, %k25.0.9
  %arrayidx33.10 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.10
  %65 = load float, ptr %arrayidx33.10, align 4
  %66 = tail call float @llvm.fmuladd.f32(float %64, float %65, float %.phi37)
  %k25.0.10 = add i32 %k25.0124, 11
  %arrayidx31.11 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.10
  %67 = load float, ptr %arrayidx31.11, align 4
  %sub32.11 = sub i32 %n20.0126, %k25.0.10
  %arrayidx33.11 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.11
  %68 = load float, ptr %arrayidx33.11, align 4
  %69 = tail call float @llvm.fmuladd.f32(float %67, float %68, float %.phi38)
  %k25.0.11 = add i32 %k25.0124, 12
  %arrayidx31.12 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.11
  %70 = load float, ptr %arrayidx31.12, align 4
  %sub32.12 = sub i32 %n20.0126, %k25.0.11
  %arrayidx33.12 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.12
  %71 = load float, ptr %arrayidx33.12, align 4
  %72 = tail call float @llvm.fmuladd.f32(float %70, float %71, float %.phi39)
  %k25.0.12 = add i32 %k25.0124, 13
  %arrayidx31.13 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.12
  %73 = load float, ptr %arrayidx31.13, align 4
  %sub32.13 = sub i32 %n20.0126, %k25.0.12
  %arrayidx33.13 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.13
  %74 = load float, ptr %arrayidx33.13, align 4
  %75 = tail call float @llvm.fmuladd.f32(float %73, float %74, float %.phi40)
  %k25.0.13 = add i32 %k25.0124, 14
  %arrayidx31.14 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.13
  %76 = load float, ptr %arrayidx31.14, align 4
  %sub32.14 = sub i32 %n20.0126, %k25.0.13
  %arrayidx33.14 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.14
  %77 = load float, ptr %arrayidx33.14, align 4
  %78 = tail call float @llvm.fmuladd.f32(float %76, float %77, float %.phi41)
  %k25.0.14 = add i32 %k25.0124, 15
  %arrayidx31.15 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0.14
  %79 = load float, ptr %arrayidx31.15, align 4
  %sub32.15 = sub i32 %n20.0126, %k25.0.14
  %arrayidx33.15 = getelementptr inbounds float, ptr %kern.0, i32 %sub32.15
  %80 = load float, ptr %arrayidx33.15, align 4
  %81 = tail call float @llvm.fmuladd.f32(float %79, float %80, float %.phi42)
  %k25.0.15 = add i32 %k25.0124, 16
  %cmp29.not.15 = icmp ult i32 %k25.0.15, %add60
  br i1 %cmp29.not.15, label %for.body30.15, label %for.end37.loopexit

for.end37.loopexit:                               ; preds = %for.body30.15
  %sum43 = fadd float %36, %39
  %sum44 = fadd float %sum43, %42
  %sum45 = fadd float %sum44, %45
  %sum46 = fadd float %sum45, %48
  %sum47 = fadd float %sum46, %51
  %sum48 = fadd float %sum47, %54
  %sum49 = fadd float %sum48, %57
  %sum50 = fadd float %sum49, %60
  %sum51 = fadd float %sum50, %63
  %sum52 = fadd float %sum51, %66
  %sum53 = fadd float %sum52, %69
  %sum54 = fadd float %sum53, %72
  %sum55 = fadd float %sum54, %75
  %sum56 = fadd float %sum55, %78
  %sum57 = fadd float %sum56, %81
  br label %for.end164

for.end164:                                       ; preds = %for.body24, %for.end37.loopexit
  %phi.sum = phi i32 [ %k25.0122, %for.body24 ], [ %k25.0.15, %for.end37.loopexit ]
  %phi.float = phi float [ 0.000000e+00, %for.body24 ], [ %sum57, %for.end37.loopexit ]
  store float %phi.float, ptr %arrayidx26, align 4
  %cmp182.not587 = icmp ugt i32 %phi.sum, %n20.0126
  br i1 %cmp182.not587, label %for.end37, label %for.body30.clone

for.body30.clone:                                 ; preds = %for.body30.clone, %for.end164
  %82 = phi float [ %85, %for.body30.clone ], [ %phi.float, %for.end164 ]
  %k25.0124.clone = phi i32 [ %k25.0.clone, %for.body30.clone ], [ %phi.sum, %for.end164 ]
  %arrayidx31.clone = getelementptr inbounds float, ptr %sig.0, i32 %k25.0124.clone
  %83 = load float, ptr %arrayidx31.clone, align 4
  %sub32.clone = sub i32 %n20.0126, %k25.0124.clone
  %arrayidx33.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub32.clone
  %84 = load float, ptr %arrayidx33.clone, align 4
  %85 = tail call float @llvm.fmuladd.f32(float %83, float %84, float %82)
  %k25.0.clone = add i32 %k25.0124.clone, 1
  %cmp29.not.clone = icmp ugt i32 %k25.0.clone, %n20.0126
  br i1 %cmp29.not.clone, label %for.cond.for.end_crit_edge58, label %for.body30.clone

for.cond.for.end_crit_edge58:                     ; preds = %for.body30.clone
  store float %85, ptr %arrayidx26, align 4
  br label %for.end37

for.end37:                                        ; preds = %for.cond.for.end_crit_edge58, %for.end164
  %inc39 = add nuw nsw i32 %n20.0126, 1
  %exitcond133.not = icmp eq i32 %inc39, %lsig.0
  br i1 %exitcond133.not, label %for.cond42.preheader.loopexit, label %for.body24

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
  br i1 %cmp56.not128, label %for.body57.preheader, label %for.end16474

for.body57.preheader:                             ; preds = %for.body47
  br label %for.body57.7

for.body57.7:                                     ; preds = %for.body57.7, %for.body57.preheader
  %k50.0129 = phi i32 [ %k50.0127, %for.body57.preheader ], [ %k50.0.7, %for.body57.7 ]
  %.phi59 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %88, %for.body57.7 ]
  %.phi60 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %91, %for.body57.7 ]
  %.phi61 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %94, %for.body57.7 ]
  %.phi62 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %97, %for.body57.7 ]
  %.phi63 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %100, %for.body57.7 ]
  %.phi64 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %103, %for.body57.7 ]
  %.phi65 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %106, %for.body57.7 ]
  %.phi66 = phi float [ 0.000000e+00, %for.body57.preheader ], [ %109, %for.body57.7 ]
  %arrayidx58 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0129
  %86 = load float, ptr %arrayidx58, align 4
  %sub59 = sub i32 %n41.0131, %k50.0129
  %arrayidx60 = getelementptr inbounds float, ptr %kern.0, i32 %sub59
  %87 = load float, ptr %arrayidx60, align 4
  %88 = tail call float @llvm.fmuladd.f32(float %86, float %87, float %.phi59)
  %k50.0 = add i32 %k50.0129, 1
  %arrayidx58.1 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0
  %89 = load float, ptr %arrayidx58.1, align 4
  %sub59.1 = sub i32 %n41.0131, %k50.0
  %arrayidx60.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.1
  %90 = load float, ptr %arrayidx60.1, align 4
  %91 = tail call float @llvm.fmuladd.f32(float %89, float %90, float %.phi60)
  %k50.0.1 = add i32 %k50.0129, 2
  %arrayidx58.2 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.1
  %92 = load float, ptr %arrayidx58.2, align 4
  %sub59.2 = sub i32 %n41.0131, %k50.0.1
  %arrayidx60.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.2
  %93 = load float, ptr %arrayidx60.2, align 4
  %94 = tail call float @llvm.fmuladd.f32(float %92, float %93, float %.phi61)
  %k50.0.2 = add i32 %k50.0129, 3
  %arrayidx58.3 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.2
  %95 = load float, ptr %arrayidx58.3, align 4
  %sub59.3 = sub i32 %n41.0131, %k50.0.2
  %arrayidx60.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.3
  %96 = load float, ptr %arrayidx60.3, align 4
  %97 = tail call float @llvm.fmuladd.f32(float %95, float %96, float %.phi62)
  %k50.0.3 = add i32 %k50.0129, 4
  %arrayidx58.4 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.3
  %98 = load float, ptr %arrayidx58.4, align 4
  %sub59.4 = sub i32 %n41.0131, %k50.0.3
  %arrayidx60.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.4
  %99 = load float, ptr %arrayidx60.4, align 4
  %100 = tail call float @llvm.fmuladd.f32(float %98, float %99, float %.phi63)
  %k50.0.4 = add i32 %k50.0129, 5
  %arrayidx58.5 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.4
  %101 = load float, ptr %arrayidx58.5, align 4
  %sub59.5 = sub i32 %n41.0131, %k50.0.4
  %arrayidx60.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.5
  %102 = load float, ptr %arrayidx60.5, align 4
  %103 = tail call float @llvm.fmuladd.f32(float %101, float %102, float %.phi64)
  %k50.0.5 = add i32 %k50.0129, 6
  %arrayidx58.6 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.5
  %104 = load float, ptr %arrayidx58.6, align 4
  %sub59.6 = sub i32 %n41.0131, %k50.0.5
  %arrayidx60.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.6
  %105 = load float, ptr %arrayidx60.6, align 4
  %106 = tail call float @llvm.fmuladd.f32(float %104, float %105, float %.phi65)
  %k50.0.6 = add i32 %k50.0129, 7
  %arrayidx58.7 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0.6
  %107 = load float, ptr %arrayidx58.7, align 4
  %sub59.7 = sub i32 %n41.0131, %k50.0.6
  %arrayidx60.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub59.7
  %108 = load float, ptr %arrayidx60.7, align 4
  %109 = tail call float @llvm.fmuladd.f32(float %107, float %108, float %.phi66)
  %k50.0.7 = add i32 %k50.0129, 8
  %cmp56.not.7 = icmp ult i32 %k50.0.7, %add214
  br i1 %cmp56.not.7, label %for.body57.7, label %for.end64.loopexit

for.end64.loopexit:                               ; preds = %for.body57.7
  %sum67 = fadd float %88, %91
  %sum68 = fadd float %sum67, %94
  %sum69 = fadd float %sum68, %97
  %sum70 = fadd float %sum69, %100
  %sum71 = fadd float %sum70, %103
  %sum72 = fadd float %sum71, %106
  %sum73 = fadd float %sum72, %109
  br label %for.end16474

for.end16474:                                     ; preds = %for.body47, %for.end64.loopexit
  %phi.sum75 = phi i32 [ %k50.0127, %for.body47 ], [ %k50.0.7, %for.end64.loopexit ]
  %phi.float76 = phi float [ 0.000000e+00, %for.body47 ], [ %sum73, %for.end64.loopexit ]
  store float %phi.float76, ptr %arrayidx51, align 4
  %cmp182.not58777 = icmp ugt i32 %phi.sum75, %sub54
  br i1 %cmp182.not58777, label %for.end64, label %for.body57.clone

for.body57.clone:                                 ; preds = %for.body57.clone, %for.end16474
  %110 = phi float [ %113, %for.body57.clone ], [ %phi.float76, %for.end16474 ]
  %k50.0129.clone = phi i32 [ %k50.0.clone, %for.body57.clone ], [ %phi.sum75, %for.end16474 ]
  %arrayidx58.clone = getelementptr inbounds float, ptr %sig.0, i32 %k50.0129.clone
  %111 = load float, ptr %arrayidx58.clone, align 4
  %sub59.clone = sub i32 %n41.0131, %k50.0129.clone
  %arrayidx60.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub59.clone
  %112 = load float, ptr %arrayidx60.clone, align 4
  %113 = tail call float @llvm.fmuladd.f32(float %111, float %112, float %110)
  %k50.0.clone = add i32 %k50.0129.clone, 1
  %cmp56.not.clone = icmp ugt i32 %k50.0.clone, %sub54
  br i1 %cmp56.not.clone, label %for.cond.for.end_crit_edge78, label %for.body57.clone

for.cond.for.end_crit_edge78:                     ; preds = %for.body57.clone
  store float %113, ptr %arrayidx51, align 4
  br label %for.end64

for.end64:                                        ; preds = %for.cond.for.end_crit_edge78, %for.end16474
  %inc66 = add nsw i32 %n41.0131, 1
  %exitcond134.not = icmp eq i32 %inc66, %sub44
  br i1 %exitcond134.not, label %return.loopexit, label %for.body47

return.loopexit:                                  ; preds = %for.end64
  %retval.0.ph = phi i32 [ 0, %for.end64 ]
  br label %return

return:                                           ; preds = %return.loopexit, %for.cond42.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond42.preheader ], [ %retval.0.ph, %return.loopexit ]
  ret i32 %retval.0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
