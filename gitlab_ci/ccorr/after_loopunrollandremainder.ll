; ModuleID = 'after_customlicm.ll'
source_filename = "after_customlicm.ll"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

define dso_local noundef i32 @dsps_ccorr_f32_ansi(ptr noalias noundef readonly %Signal, i32 noundef %siglen, ptr noalias noundef readonly %Kernel, i32 noundef %kernlen, ptr noalias noundef writeonly %corrvout) local_unnamed_addr {
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
  br i1 %cmp10124, label %for.body.preheader, label %for.cond22.preheader

for.body.preheader:                               ; preds = %if.end9
  br label %for.body

for.cond22.preheader.loopexit:                    ; preds = %for.end
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.loopexit, %if.end9
  %cmp23128 = icmp slt i32 %lkern.0, %lsig.0
  br i1 %cmp23128, label %for.body25.preheader, label %for.cond45.preheader

for.body25.preheader:                             ; preds = %for.cond22.preheader
  %div536 = and i32 %lkern.0, -16
  br label %for.body25

for.body:                                         ; preds = %for.body.preheader, %for.end
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.end ], [ 1, %for.body.preheader ]
  %n.0125 = phi i32 [ %inc19, %for.end ], [ 0, %for.body.preheader ]
  %0 = and i32 %n.0125, 2147483640
  %1 = add nsw i32 %0, -1
  %2 = and i32 %1, -8
  %3 = add i32 %2, 8
  %4 = and i32 %n.0125, 2147483640
  %5 = icmp eq i32 %4, 0
  %6 = xor i32 %n.0125, -1
  %sub11 = add nsw i32 %lkern.0, %6
  %arrayidx = getelementptr inbounds float, ptr %corrvout, i32 %n.0125
  br i1 %5, label %for.body14.clone.preheader, label %for.body14.7

for.body14.7:                                     ; preds = %for.body14.7, %for.body
  %k.0123 = phi i32 [ 0, %for.body ], [ %inc.7, %for.body14.7 ]
  %.phi = phi float [ 0.000000e+00, %for.body ], [ %9, %for.body14.7 ]
  %.phi1 = phi float [ 0.000000e+00, %for.body ], [ %12, %for.body14.7 ]
  %.phi2 = phi float [ 0.000000e+00, %for.body ], [ %15, %for.body14.7 ]
  %.phi3 = phi float [ 0.000000e+00, %for.body ], [ %18, %for.body14.7 ]
  %.phi4 = phi float [ 0.000000e+00, %for.body ], [ %21, %for.body14.7 ]
  %.phi5 = phi float [ 0.000000e+00, %for.body ], [ %24, %for.body14.7 ]
  %.phi6 = phi float [ 0.000000e+00, %for.body ], [ %27, %for.body14.7 ]
  %.phi7 = phi float [ 0.000000e+00, %for.body ], [ %30, %for.body14.7 ]
  %arrayidx15 = getelementptr inbounds float, ptr %sig.0, i32 %k.0123
  %7 = load float, ptr %arrayidx15, align 4
  %add = add i32 %sub11, %k.0123
  %arrayidx16 = getelementptr inbounds float, ptr %kern.0, i32 %add
  %8 = load float, ptr %arrayidx16, align 4
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %.phi)
  %add9 = or disjoint i32 %k.0123, 1
  %arrayidx15.1 = getelementptr inbounds float, ptr %sig.0, i32 %add9
  %10 = load float, ptr %arrayidx15.1, align 4
  %add.1 = add i32 %sub11, %add9
  %arrayidx16.1 = getelementptr inbounds float, ptr %kern.0, i32 %add.1
  %11 = load float, ptr %arrayidx16.1, align 4
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %.phi1)
  %add11 = or disjoint i32 %k.0123, 2
  %arrayidx15.2 = getelementptr inbounds float, ptr %sig.0, i32 %add11
  %13 = load float, ptr %arrayidx15.2, align 4
  %add.2 = add i32 %sub11, %add11
  %arrayidx16.2 = getelementptr inbounds float, ptr %kern.0, i32 %add.2
  %14 = load float, ptr %arrayidx16.2, align 4
  %15 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %.phi2)
  %add13 = or disjoint i32 %k.0123, 3
  %arrayidx15.3 = getelementptr inbounds float, ptr %sig.0, i32 %add13
  %16 = load float, ptr %arrayidx15.3, align 4
  %add.3 = add i32 %sub11, %add13
  %arrayidx16.3 = getelementptr inbounds float, ptr %kern.0, i32 %add.3
  %17 = load float, ptr %arrayidx16.3, align 4
  %18 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %.phi3)
  %add15 = or disjoint i32 %k.0123, 4
  %arrayidx15.4 = getelementptr inbounds float, ptr %sig.0, i32 %add15
  %19 = load float, ptr %arrayidx15.4, align 4
  %add.4 = add i32 %sub11, %add15
  %arrayidx16.4 = getelementptr inbounds float, ptr %kern.0, i32 %add.4
  %20 = load float, ptr %arrayidx16.4, align 4
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %.phi4)
  %add17 = or disjoint i32 %k.0123, 5
  %arrayidx15.5 = getelementptr inbounds float, ptr %sig.0, i32 %add17
  %22 = load float, ptr %arrayidx15.5, align 4
  %add.5 = add i32 %sub11, %add17
  %arrayidx16.5 = getelementptr inbounds float, ptr %kern.0, i32 %add.5
  %23 = load float, ptr %arrayidx16.5, align 4
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %.phi5)
  %add19 = or disjoint i32 %k.0123, 6
  %arrayidx15.6 = getelementptr inbounds float, ptr %sig.0, i32 %add19
  %25 = load float, ptr %arrayidx15.6, align 4
  %add.6 = add i32 %sub11, %add19
  %arrayidx16.6 = getelementptr inbounds float, ptr %kern.0, i32 %add.6
  %26 = load float, ptr %arrayidx16.6, align 4
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %.phi6)
  %add21 = or disjoint i32 %k.0123, 7
  %arrayidx15.7 = getelementptr inbounds float, ptr %sig.0, i32 %add21
  %28 = load float, ptr %arrayidx15.7, align 4
  %add.7 = add i32 %sub11, %add21
  %arrayidx16.7 = getelementptr inbounds float, ptr %kern.0, i32 %add.7
  %29 = load float, ptr %arrayidx16.7, align 4
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float %.phi7)
  %inc.7 = add nuw nsw i32 %k.0123, 8
  %exitcond.7 = icmp ult i32 %inc.7, %4
  br i1 %exitcond.7, label %for.body14.7, label %for.end22

for.end22:                                        ; preds = %for.body14.7
  %sum = fadd float %9, %12
  %sum23 = fadd float %sum, %15
  %sum24 = fadd float %sum23, %18
  %sum25 = fadd float %sum24, %21
  %sum26 = fadd float %sum25, %24
  %sum27 = fadd float %sum26, %27
  %sum28 = fadd float %sum27, %30
  store float %sum28, ptr %arrayidx, align 4
  %cmp37.not548 = icmp ugt i32 %3, %n.0125
  br i1 %cmp37.not548, label %for.end, label %for.body14.clone.preheader

for.body14.clone.preheader:                       ; preds = %for.end22, %for.body
  %sum.phi = phi float [ 0.000000e+00, %for.body ], [ %sum28, %for.end22 ]
  %add.phi = phi i32 [ 0, %for.body ], [ %3, %for.end22 ]
  br label %for.body14.clone

for.body14.clone:                                 ; preds = %for.body14.clone, %for.body14.clone.preheader
  %k.0123.clone = phi i32 [ %add.phi, %for.body14.clone.preheader ], [ %inc.clone, %for.body14.clone ]
  %31 = phi float [ %sum.phi, %for.body14.clone.preheader ], [ %34, %for.body14.clone ]
  %arrayidx15.clone = getelementptr inbounds float, ptr %sig.0, i32 %k.0123.clone
  %32 = load float, ptr %arrayidx15.clone, align 4
  %add.clone = add i32 %sub11, %k.0123.clone
  %arrayidx16.clone = getelementptr inbounds float, ptr %kern.0, i32 %add.clone
  %33 = load float, ptr %arrayidx16.clone, align 4
  %34 = tail call float @llvm.fmuladd.f32(float %32, float %33, float %31)
  %inc.clone = add nuw nsw i32 %k.0123.clone, 1
  %exitcond.clone = icmp eq i32 %inc.clone, %indvars.iv
  br i1 %exitcond.clone, label %for.cond.for.end_crit_edge, label %for.body14.clone

for.cond.for.end_crit_edge:                       ; preds = %for.body14.clone
  store float %34, ptr %arrayidx, align 4
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %for.end22
  %inc19 = add nuw nsw i32 %n.0125, 1
  %indvars.iv.next = add nuw i32 %indvars.iv, 1
  %exitcond134.not = icmp eq i32 %inc19, %lkern.0
  br i1 %exitcond134.not, label %for.cond22.preheader.loopexit, label %for.body

for.cond45.preheader.loopexit:                    ; preds = %for.end40
  br label %for.cond45.preheader

for.cond45.preheader:                             ; preds = %for.cond45.preheader.loopexit, %for.cond22.preheader
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
  %add60 = add i32 %div536, %add30
  %cmp32.not126 = icmp ult i32 %add30, %add60
  br i1 %cmp32.not126, label %for.body33.preheader, label %for.end164

for.body33.preheader:                             ; preds = %for.body25
  br label %for.body33.15

for.body33.15:                                    ; preds = %for.body33.15, %for.body33.preheader
  %k27.0127 = phi i32 [ %add30, %for.body33.preheader ], [ %inc39.15, %for.body33.15 ]
  %.phi29 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %37, %for.body33.15 ]
  %.phi30 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %40, %for.body33.15 ]
  %.phi31 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %43, %for.body33.15 ]
  %.phi32 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %46, %for.body33.15 ]
  %.phi33 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %49, %for.body33.15 ]
  %.phi34 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %52, %for.body33.15 ]
  %.phi35 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %55, %for.body33.15 ]
  %.phi36 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %58, %for.body33.15 ]
  %.phi37 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %61, %for.body33.15 ]
  %.phi38 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %64, %for.body33.15 ]
  %.phi39 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %67, %for.body33.15 ]
  %.phi40 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %70, %for.body33.15 ]
  %.phi41 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %73, %for.body33.15 ]
  %.phi42 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %76, %for.body33.15 ]
  %.phi43 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %79, %for.body33.15 ]
  %.phi44 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %82, %for.body33.15 ]
  %arrayidx34 = getelementptr inbounds float, ptr %sig.0, i32 %k27.0127
  %35 = load float, ptr %arrayidx34, align 4
  %sub35 = sub i32 %k27.0127, %add30
  %arrayidx36 = getelementptr inbounds float, ptr %kern.0, i32 %sub35
  %36 = load float, ptr %arrayidx36, align 4
  %37 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %.phi29)
  %inc39 = add i32 %k27.0127, 1
  %arrayidx34.1 = getelementptr inbounds float, ptr %sig.0, i32 %inc39
  %38 = load float, ptr %arrayidx34.1, align 4
  %sub35.1 = sub i32 %inc39, %add30
  %arrayidx36.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.1
  %39 = load float, ptr %arrayidx36.1, align 4
  %40 = tail call float @llvm.fmuladd.f32(float %38, float %39, float %.phi30)
  %inc39.1 = add i32 %k27.0127, 2
  %arrayidx34.2 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.1
  %41 = load float, ptr %arrayidx34.2, align 4
  %sub35.2 = sub i32 %inc39.1, %add30
  %arrayidx36.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.2
  %42 = load float, ptr %arrayidx36.2, align 4
  %43 = tail call float @llvm.fmuladd.f32(float %41, float %42, float %.phi31)
  %inc39.2 = add i32 %k27.0127, 3
  %arrayidx34.3 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.2
  %44 = load float, ptr %arrayidx34.3, align 4
  %sub35.3 = sub i32 %inc39.2, %add30
  %arrayidx36.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.3
  %45 = load float, ptr %arrayidx36.3, align 4
  %46 = tail call float @llvm.fmuladd.f32(float %44, float %45, float %.phi32)
  %inc39.3 = add i32 %k27.0127, 4
  %arrayidx34.4 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.3
  %47 = load float, ptr %arrayidx34.4, align 4
  %sub35.4 = sub i32 %inc39.3, %add30
  %arrayidx36.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.4
  %48 = load float, ptr %arrayidx36.4, align 4
  %49 = tail call float @llvm.fmuladd.f32(float %47, float %48, float %.phi33)
  %inc39.4 = add i32 %k27.0127, 5
  %arrayidx34.5 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.4
  %50 = load float, ptr %arrayidx34.5, align 4
  %sub35.5 = sub i32 %inc39.4, %add30
  %arrayidx36.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.5
  %51 = load float, ptr %arrayidx36.5, align 4
  %52 = tail call float @llvm.fmuladd.f32(float %50, float %51, float %.phi34)
  %inc39.5 = add i32 %k27.0127, 6
  %arrayidx34.6 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.5
  %53 = load float, ptr %arrayidx34.6, align 4
  %sub35.6 = sub i32 %inc39.5, %add30
  %arrayidx36.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.6
  %54 = load float, ptr %arrayidx36.6, align 4
  %55 = tail call float @llvm.fmuladd.f32(float %53, float %54, float %.phi35)
  %inc39.6 = add i32 %k27.0127, 7
  %arrayidx34.7 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.6
  %56 = load float, ptr %arrayidx34.7, align 4
  %sub35.7 = sub i32 %inc39.6, %add30
  %arrayidx36.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.7
  %57 = load float, ptr %arrayidx36.7, align 4
  %58 = tail call float @llvm.fmuladd.f32(float %56, float %57, float %.phi36)
  %inc39.7 = add i32 %k27.0127, 8
  %arrayidx34.8 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.7
  %59 = load float, ptr %arrayidx34.8, align 4
  %sub35.8 = sub i32 %inc39.7, %add30
  %arrayidx36.8 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.8
  %60 = load float, ptr %arrayidx36.8, align 4
  %61 = tail call float @llvm.fmuladd.f32(float %59, float %60, float %.phi37)
  %inc39.8 = add i32 %k27.0127, 9
  %arrayidx34.9 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.8
  %62 = load float, ptr %arrayidx34.9, align 4
  %sub35.9 = sub i32 %inc39.8, %add30
  %arrayidx36.9 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.9
  %63 = load float, ptr %arrayidx36.9, align 4
  %64 = tail call float @llvm.fmuladd.f32(float %62, float %63, float %.phi38)
  %inc39.9 = add i32 %k27.0127, 10
  %arrayidx34.10 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.9
  %65 = load float, ptr %arrayidx34.10, align 4
  %sub35.10 = sub i32 %inc39.9, %add30
  %arrayidx36.10 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.10
  %66 = load float, ptr %arrayidx36.10, align 4
  %67 = tail call float @llvm.fmuladd.f32(float %65, float %66, float %.phi39)
  %inc39.10 = add i32 %k27.0127, 11
  %arrayidx34.11 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.10
  %68 = load float, ptr %arrayidx34.11, align 4
  %sub35.11 = sub i32 %inc39.10, %add30
  %arrayidx36.11 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.11
  %69 = load float, ptr %arrayidx36.11, align 4
  %70 = tail call float @llvm.fmuladd.f32(float %68, float %69, float %.phi40)
  %inc39.11 = add i32 %k27.0127, 12
  %arrayidx34.12 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.11
  %71 = load float, ptr %arrayidx34.12, align 4
  %sub35.12 = sub i32 %inc39.11, %add30
  %arrayidx36.12 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.12
  %72 = load float, ptr %arrayidx36.12, align 4
  %73 = tail call float @llvm.fmuladd.f32(float %71, float %72, float %.phi41)
  %inc39.12 = add i32 %k27.0127, 13
  %arrayidx34.13 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.12
  %74 = load float, ptr %arrayidx34.13, align 4
  %sub35.13 = sub i32 %inc39.12, %add30
  %arrayidx36.13 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.13
  %75 = load float, ptr %arrayidx36.13, align 4
  %76 = tail call float @llvm.fmuladd.f32(float %74, float %75, float %.phi42)
  %inc39.13 = add i32 %k27.0127, 14
  %arrayidx34.14 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.13
  %77 = load float, ptr %arrayidx34.14, align 4
  %sub35.14 = sub i32 %inc39.13, %add30
  %arrayidx36.14 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.14
  %78 = load float, ptr %arrayidx36.14, align 4
  %79 = tail call float @llvm.fmuladd.f32(float %77, float %78, float %.phi43)
  %inc39.14 = add i32 %k27.0127, 15
  %arrayidx34.15 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.14
  %80 = load float, ptr %arrayidx34.15, align 4
  %sub35.15 = sub i32 %inc39.14, %add30
  %arrayidx36.15 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.15
  %81 = load float, ptr %arrayidx36.15, align 4
  %82 = tail call float @llvm.fmuladd.f32(float %80, float %81, float %.phi44)
  %inc39.15 = add i32 %k27.0127, 16
  %cmp32.not.15 = icmp ult i32 %inc39.15, %add60
  br i1 %cmp32.not.15, label %for.body33.15, label %for.end40.loopexit

for.end40.loopexit:                               ; preds = %for.body33.15
  %sum45 = fadd float %37, %40
  %sum46 = fadd float %sum45, %43
  %sum47 = fadd float %sum46, %46
  %sum48 = fadd float %sum47, %49
  %sum49 = fadd float %sum48, %52
  %sum50 = fadd float %sum49, %55
  %sum51 = fadd float %sum50, %58
  %sum52 = fadd float %sum51, %61
  %sum53 = fadd float %sum52, %64
  %sum54 = fadd float %sum53, %67
  %sum55 = fadd float %sum54, %70
  %sum56 = fadd float %sum55, %73
  %sum57 = fadd float %sum56, %76
  %sum58 = fadd float %sum57, %79
  %sum59 = fadd float %sum58, %82
  br label %for.end164

for.end164:                                       ; preds = %for.body25, %for.end40.loopexit
  %phi.sum = phi i32 [ %add30, %for.body25 ], [ %inc39.15, %for.end40.loopexit ]
  %phi.float = phi float [ 0.000000e+00, %for.body25 ], [ %sum59, %for.end40.loopexit ]
  store float %phi.float, ptr %arrayidx28, align 4
  %cmp182.not587 = icmp ugt i32 %phi.sum, %n21.0129
  br i1 %cmp182.not587, label %for.end40, label %for.body33.clone

for.body33.clone:                                 ; preds = %for.body33.clone, %for.end164
  %83 = phi float [ %86, %for.body33.clone ], [ %phi.float, %for.end164 ]
  %k27.0127.clone = phi i32 [ %inc39.clone, %for.body33.clone ], [ %phi.sum, %for.end164 ]
  %arrayidx34.clone = getelementptr inbounds float, ptr %sig.0, i32 %k27.0127.clone
  %84 = load float, ptr %arrayidx34.clone, align 4
  %sub35.clone = sub i32 %k27.0127.clone, %add30
  %arrayidx36.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub35.clone
  %85 = load float, ptr %arrayidx36.clone, align 4
  %86 = tail call float @llvm.fmuladd.f32(float %84, float %85, float %83)
  %inc39.clone = add i32 %k27.0127.clone, 1
  %cmp32.not.clone = icmp ugt i32 %inc39.clone, %n21.0129
  br i1 %cmp32.not.clone, label %for.cond.for.end_crit_edge60, label %for.body33.clone

for.cond.for.end_crit_edge60:                     ; preds = %for.body33.clone
  store float %86, ptr %arrayidx28, align 4
  br label %for.end40

for.end40:                                        ; preds = %for.cond.for.end_crit_edge60, %for.end164
  %inc42 = add nuw nsw i32 %n21.0129, 1
  %exitcond135.not = icmp eq i32 %inc42, %lsig.0
  br i1 %exitcond135.not, label %for.cond45.preheader.loopexit, label %for.body25

for.body50:                                       ; preds = %for.end67, %for.body50.lr.ph
  %n44.0133 = phi i32 [ %lsig.0, %for.body50.lr.ph ], [ %inc69, %for.end67 ]
  %arrayidx54 = getelementptr inbounds float, ptr %corrvout, i32 %n44.0133
  %sub55 = sub nsw i32 %n44.0133, %lkern.0
  %add56 = add nsw i32 %sub55, 1
  %add207.neg = xor i32 %sub55, -1
  %add211 = add i32 %lsig.0, %add207.neg
  %div212535 = and i32 %add211, -8
  %add214 = add i32 %div212535, %add56
  %cmp59.not130 = icmp ult i32 %add56, %add214
  br i1 %cmp59.not130, label %for.body60.preheader, label %for.end16476

for.body60.preheader:                             ; preds = %for.body50
  br label %for.body60.7

for.body60.7:                                     ; preds = %for.body60.7, %for.body60.preheader
  %k53.0131 = phi i32 [ %add56, %for.body60.preheader ], [ %inc66.7, %for.body60.7 ]
  %.phi61 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %89, %for.body60.7 ]
  %.phi62 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %92, %for.body60.7 ]
  %.phi63 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %95, %for.body60.7 ]
  %.phi64 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %98, %for.body60.7 ]
  %.phi65 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %101, %for.body60.7 ]
  %.phi66 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %104, %for.body60.7 ]
  %.phi67 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %107, %for.body60.7 ]
  %.phi68 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %110, %for.body60.7 ]
  %arrayidx61 = getelementptr inbounds float, ptr %sig.0, i32 %k53.0131
  %87 = load float, ptr %arrayidx61, align 4
  %sub62 = sub i32 %k53.0131, %add56
  %arrayidx63 = getelementptr inbounds float, ptr %kern.0, i32 %sub62
  %88 = load float, ptr %arrayidx63, align 4
  %89 = tail call float @llvm.fmuladd.f32(float %87, float %88, float %.phi61)
  %inc66 = add i32 %k53.0131, 1
  %arrayidx61.1 = getelementptr inbounds float, ptr %sig.0, i32 %inc66
  %90 = load float, ptr %arrayidx61.1, align 4
  %sub62.1 = sub i32 %inc66, %add56
  %arrayidx63.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.1
  %91 = load float, ptr %arrayidx63.1, align 4
  %92 = tail call float @llvm.fmuladd.f32(float %90, float %91, float %.phi62)
  %inc66.1 = add i32 %k53.0131, 2
  %arrayidx61.2 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.1
  %93 = load float, ptr %arrayidx61.2, align 4
  %sub62.2 = sub i32 %inc66.1, %add56
  %arrayidx63.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.2
  %94 = load float, ptr %arrayidx63.2, align 4
  %95 = tail call float @llvm.fmuladd.f32(float %93, float %94, float %.phi63)
  %inc66.2 = add i32 %k53.0131, 3
  %arrayidx61.3 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.2
  %96 = load float, ptr %arrayidx61.3, align 4
  %sub62.3 = sub i32 %inc66.2, %add56
  %arrayidx63.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.3
  %97 = load float, ptr %arrayidx63.3, align 4
  %98 = tail call float @llvm.fmuladd.f32(float %96, float %97, float %.phi64)
  %inc66.3 = add i32 %k53.0131, 4
  %arrayidx61.4 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.3
  %99 = load float, ptr %arrayidx61.4, align 4
  %sub62.4 = sub i32 %inc66.3, %add56
  %arrayidx63.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.4
  %100 = load float, ptr %arrayidx63.4, align 4
  %101 = tail call float @llvm.fmuladd.f32(float %99, float %100, float %.phi65)
  %inc66.4 = add i32 %k53.0131, 5
  %arrayidx61.5 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.4
  %102 = load float, ptr %arrayidx61.5, align 4
  %sub62.5 = sub i32 %inc66.4, %add56
  %arrayidx63.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.5
  %103 = load float, ptr %arrayidx63.5, align 4
  %104 = tail call float @llvm.fmuladd.f32(float %102, float %103, float %.phi66)
  %inc66.5 = add i32 %k53.0131, 6
  %arrayidx61.6 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.5
  %105 = load float, ptr %arrayidx61.6, align 4
  %sub62.6 = sub i32 %inc66.5, %add56
  %arrayidx63.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.6
  %106 = load float, ptr %arrayidx63.6, align 4
  %107 = tail call float @llvm.fmuladd.f32(float %105, float %106, float %.phi67)
  %inc66.6 = add i32 %k53.0131, 7
  %arrayidx61.7 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.6
  %108 = load float, ptr %arrayidx61.7, align 4
  %sub62.7 = sub i32 %inc66.6, %add56
  %arrayidx63.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.7
  %109 = load float, ptr %arrayidx63.7, align 4
  %110 = tail call float @llvm.fmuladd.f32(float %108, float %109, float %.phi68)
  %inc66.7 = add i32 %k53.0131, 8
  %cmp59.not.7 = icmp ult i32 %inc66.7, %add214
  br i1 %cmp59.not.7, label %for.body60.7, label %for.end67.loopexit

for.end67.loopexit:                               ; preds = %for.body60.7
  %sum69 = fadd float %89, %92
  %sum70 = fadd float %sum69, %95
  %sum71 = fadd float %sum70, %98
  %sum72 = fadd float %sum71, %101
  %sum73 = fadd float %sum72, %104
  %sum74 = fadd float %sum73, %107
  %sum75 = fadd float %sum74, %110
  br label %for.end16476

for.end16476:                                     ; preds = %for.body50, %for.end67.loopexit
  %phi.sum77 = phi i32 [ %add56, %for.body50 ], [ %inc66.7, %for.end67.loopexit ]
  %phi.float78 = phi float [ 0.000000e+00, %for.body50 ], [ %sum75, %for.end67.loopexit ]
  store float %phi.float78, ptr %arrayidx54, align 4
  %cmp182.not58779 = icmp ugt i32 %phi.sum77, %sub57
  br i1 %cmp182.not58779, label %for.end67, label %for.body60.clone

for.body60.clone:                                 ; preds = %for.body60.clone, %for.end16476
  %111 = phi float [ %114, %for.body60.clone ], [ %phi.float78, %for.end16476 ]
  %k53.0131.clone = phi i32 [ %inc66.clone, %for.body60.clone ], [ %phi.sum77, %for.end16476 ]
  %arrayidx61.clone = getelementptr inbounds float, ptr %sig.0, i32 %k53.0131.clone
  %112 = load float, ptr %arrayidx61.clone, align 4
  %sub62.clone = sub i32 %k53.0131.clone, %add56
  %arrayidx63.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub62.clone
  %113 = load float, ptr %arrayidx63.clone, align 4
  %114 = tail call float @llvm.fmuladd.f32(float %112, float %113, float %111)
  %inc66.clone = add i32 %k53.0131.clone, 1
  %cmp59.not.clone = icmp ugt i32 %inc66.clone, %sub57
  br i1 %cmp59.not.clone, label %for.cond.for.end_crit_edge80, label %for.body60.clone

for.cond.for.end_crit_edge80:                     ; preds = %for.body60.clone
  store float %114, ptr %arrayidx54, align 4
  br label %for.end67

for.end67:                                        ; preds = %for.cond.for.end_crit_edge80, %for.end16476
  %inc69 = add nsw i32 %n44.0133, 1
  %exitcond136.not = icmp eq i32 %inc69, %sub47
  br i1 %exitcond136.not, label %return.loopexit, label %for.body50

return.loopexit:                                  ; preds = %for.end67
  %retval.0.ph = phi i32 [ 0, %for.end67 ]
  br label %return

return:                                           ; preds = %return.loopexit, %for.cond45.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond45.preheader ], [ %retval.0.ph, %return.loopexit ]
  ret i32 %retval.0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
