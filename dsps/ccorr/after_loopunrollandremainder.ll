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
  %0 = and i32 %n.0125, -8
  %1 = and i32 %n.0125, 2147483640
  %2 = icmp eq i32 %1, 0
  %3 = xor i32 %n.0125, -1
  %sub11 = add nsw i32 %3, %lkern.0
  %arrayidx = getelementptr inbounds float, ptr %corrvout, i32 %n.0125
  br i1 %2, label %for.body14.clone.preheader, label %for.body14.7

for.body14.7:                                     ; preds = %for.body14.7, %for.body
  %k.0123 = phi i32 [ 0, %for.body ], [ %inc.7, %for.body14.7 ]
  %.phi = phi float [ 0.000000e+00, %for.body ], [ %20, %for.body14.7 ]
  %.phi1 = phi float [ 0.000000e+00, %for.body ], [ %21, %for.body14.7 ]
  %.phi2 = phi float [ 0.000000e+00, %for.body ], [ %22, %for.body14.7 ]
  %.phi3 = phi float [ 0.000000e+00, %for.body ], [ %23, %for.body14.7 ]
  %.phi4 = phi float [ 0.000000e+00, %for.body ], [ %24, %for.body14.7 ]
  %.phi5 = phi float [ 0.000000e+00, %for.body ], [ %25, %for.body14.7 ]
  %.phi6 = phi float [ 0.000000e+00, %for.body ], [ %26, %for.body14.7 ]
  %.phi7 = phi float [ 0.000000e+00, %for.body ], [ %27, %for.body14.7 ]
  %add = add i32 %k.0123, %sub11
  %inc = add nuw nsw i32 %k.0123, 1
  %add.1 = add i32 %inc, %sub11
  %inc.1 = add nuw nsw i32 %k.0123, 2
  %add.2 = add i32 %inc.1, %sub11
  %inc.2 = add nuw nsw i32 %k.0123, 3
  %add.3 = add i32 %inc.2, %sub11
  %inc.3 = add nuw nsw i32 %k.0123, 4
  %add.4 = add i32 %inc.3, %sub11
  %inc.4 = add nuw nsw i32 %k.0123, 5
  %add.5 = add i32 %inc.4, %sub11
  %inc.5 = add nuw nsw i32 %k.0123, 6
  %add.6 = add i32 %inc.5, %sub11
  %inc.6 = add nuw nsw i32 %k.0123, 7
  %add.7 = add i32 %inc.6, %sub11
  %inc.7 = add nuw nsw i32 %k.0123, 8
  %arrayidx15 = getelementptr inbounds float, ptr %sig.0, i32 %k.0123
  %arrayidx16 = getelementptr inbounds float, ptr %kern.0, i32 %add
  %arrayidx15.1 = getelementptr inbounds float, ptr %sig.0, i32 %inc
  %arrayidx16.1 = getelementptr inbounds float, ptr %kern.0, i32 %add.1
  %arrayidx15.2 = getelementptr inbounds float, ptr %sig.0, i32 %inc.1
  %arrayidx16.2 = getelementptr inbounds float, ptr %kern.0, i32 %add.2
  %arrayidx15.3 = getelementptr inbounds float, ptr %sig.0, i32 %inc.2
  %arrayidx16.3 = getelementptr inbounds float, ptr %kern.0, i32 %add.3
  %arrayidx15.4 = getelementptr inbounds float, ptr %sig.0, i32 %inc.3
  %arrayidx16.4 = getelementptr inbounds float, ptr %kern.0, i32 %add.4
  %arrayidx15.5 = getelementptr inbounds float, ptr %sig.0, i32 %inc.4
  %arrayidx16.5 = getelementptr inbounds float, ptr %kern.0, i32 %add.5
  %arrayidx15.6 = getelementptr inbounds float, ptr %sig.0, i32 %inc.5
  %arrayidx16.6 = getelementptr inbounds float, ptr %kern.0, i32 %add.6
  %arrayidx15.7 = getelementptr inbounds float, ptr %sig.0, i32 %inc.6
  %arrayidx16.7 = getelementptr inbounds float, ptr %kern.0, i32 %add.7
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
  br i1 %exitcond.7, label %for.body14.7, label %for.end8, !llvm.loop !8

for.end8:                                         ; preds = %for.body14.7
  %sum = fadd float %20, %21
  %sum23 = fadd float %22, %23
  %sum24 = fadd float %24, %25
  %sum25 = fadd float %26, %27
  %sum26 = fadd float %sum, %sum23
  %sum27 = fadd float %sum24, %sum25
  %sum28 = fadd float %sum26, %sum27
  store float %sum28, ptr %arrayidx, align 4
  br i1 false, label %for.end, label %for.body14.clone.preheader

for.body14.clone.preheader:                       ; preds = %for.end8, %for.body
  %sum.phi = phi float [ 0.000000e+00, %for.body ], [ %sum28, %for.end8 ]
  %add.phi = phi i32 [ 0, %for.body ], [ %0, %for.end8 ]
  br label %for.body14.clone

for.body14.clone:                                 ; preds = %for.body14.clone, %for.body14.clone.preheader
  %k.0123.clone = phi i32 [ %add.phi, %for.body14.clone.preheader ], [ %inc.clone, %for.body14.clone ]
  %28 = phi float [ %sum.phi, %for.body14.clone.preheader ], [ %31, %for.body14.clone ]
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
  store float %31, ptr %arrayidx, align 4, !tbaa !4
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %for.end8
  %inc19 = add nuw nsw i32 %n.0125, 1
  %indvars.iv.next = add nuw i32 %indvars.iv, 1
  %exitcond134.not = icmp eq i32 %inc19, %lkern.0
  br i1 %exitcond134.not, label %for.cond22.preheader.loopexit, label %for.body, !llvm.loop !10

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
  %add60 = add i32 %add30, %div536
  %cmp32.not126 = icmp ult i32 %add30, %add60
  br i1 %cmp32.not126, label %for.body33.preheader, label %for.end164

for.body33.preheader:                             ; preds = %for.body25
  br label %for.body33.15

for.body33.15:                                    ; preds = %for.body33.15, %for.body33.preheader
  %k27.0127 = phi i32 [ %add30, %for.body33.preheader ], [ %inc39.15, %for.body33.15 ]
  %.phi9 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %64, %for.body33.15 ]
  %.phi10 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %65, %for.body33.15 ]
  %.phi11 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %66, %for.body33.15 ]
  %.phi12 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %67, %for.body33.15 ]
  %.phi13 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %68, %for.body33.15 ]
  %.phi14 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %69, %for.body33.15 ]
  %.phi15 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %70, %for.body33.15 ]
  %.phi16 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %71, %for.body33.15 ]
  %.phi17 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %72, %for.body33.15 ]
  %.phi18 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %73, %for.body33.15 ]
  %.phi19 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %74, %for.body33.15 ]
  %.phi20 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %75, %for.body33.15 ]
  %.phi21 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %76, %for.body33.15 ]
  %.phi22 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %77, %for.body33.15 ]
  %.phi23 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %78, %for.body33.15 ]
  %.phi24 = phi float [ 0.000000e+00, %for.body33.preheader ], [ %79, %for.body33.15 ]
  %inc39 = add i32 %k27.0127, 1
  %inc39.1 = add i32 %k27.0127, 2
  %inc39.2 = add i32 %k27.0127, 3
  %inc39.3 = add i32 %k27.0127, 4
  %inc39.4 = add i32 %k27.0127, 5
  %inc39.5 = add i32 %k27.0127, 6
  %inc39.6 = add i32 %k27.0127, 7
  %inc39.7 = add i32 %k27.0127, 8
  %inc39.8 = add i32 %k27.0127, 9
  %inc39.9 = add i32 %k27.0127, 10
  %inc39.10 = add i32 %k27.0127, 11
  %inc39.11 = add i32 %k27.0127, 12
  %inc39.12 = add i32 %k27.0127, 13
  %inc39.13 = add i32 %k27.0127, 14
  %inc39.14 = add i32 %k27.0127, 15
  %inc39.15 = add i32 %k27.0127, 16
  %sub35 = sub i32 %k27.0127, %add30
  %sub35.1 = sub i32 %inc39, %add30
  %sub35.2 = sub i32 %inc39.1, %add30
  %sub35.3 = sub i32 %inc39.2, %add30
  %sub35.4 = sub i32 %inc39.3, %add30
  %sub35.5 = sub i32 %inc39.4, %add30
  %sub35.6 = sub i32 %inc39.5, %add30
  %sub35.7 = sub i32 %inc39.6, %add30
  %sub35.8 = sub i32 %inc39.7, %add30
  %sub35.9 = sub i32 %inc39.8, %add30
  %sub35.10 = sub i32 %inc39.9, %add30
  %sub35.11 = sub i32 %inc39.10, %add30
  %sub35.12 = sub i32 %inc39.11, %add30
  %sub35.13 = sub i32 %inc39.12, %add30
  %sub35.14 = sub i32 %inc39.13, %add30
  %sub35.15 = sub i32 %inc39.14, %add30
  %arrayidx34 = getelementptr inbounds float, ptr %sig.0, i32 %k27.0127
  %arrayidx36 = getelementptr inbounds float, ptr %kern.0, i32 %sub35
  %arrayidx34.1 = getelementptr inbounds float, ptr %sig.0, i32 %inc39
  %arrayidx36.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.1
  %arrayidx34.2 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.1
  %arrayidx36.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.2
  %arrayidx34.3 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.2
  %arrayidx36.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.3
  %arrayidx34.4 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.3
  %arrayidx36.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.4
  %arrayidx34.5 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.4
  %arrayidx36.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.5
  %arrayidx34.6 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.5
  %arrayidx36.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.6
  %arrayidx34.7 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.6
  %arrayidx36.7 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.7
  %arrayidx34.8 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.7
  %arrayidx36.8 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.8
  %arrayidx34.9 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.8
  %arrayidx36.9 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.9
  %arrayidx34.10 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.9
  %arrayidx36.10 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.10
  %arrayidx34.11 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.10
  %arrayidx36.11 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.11
  %arrayidx34.12 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.11
  %arrayidx36.12 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.12
  %arrayidx34.13 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.12
  %arrayidx36.13 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.13
  %arrayidx34.14 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.13
  %arrayidx36.14 = getelementptr inbounds float, ptr %kern.0, i32 %sub35.14
  %arrayidx34.15 = getelementptr inbounds float, ptr %sig.0, i32 %inc39.14
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
  %64 = tail call float @llvm.fmuladd.f32(float %32, float %33, float %.phi9)
  %65 = tail call float @llvm.fmuladd.f32(float %34, float %35, float %.phi10)
  %66 = tail call float @llvm.fmuladd.f32(float %36, float %37, float %.phi11)
  %67 = tail call float @llvm.fmuladd.f32(float %38, float %39, float %.phi12)
  %68 = tail call float @llvm.fmuladd.f32(float %40, float %41, float %.phi13)
  %69 = tail call float @llvm.fmuladd.f32(float %42, float %43, float %.phi14)
  %70 = tail call float @llvm.fmuladd.f32(float %44, float %45, float %.phi15)
  %71 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %.phi16)
  %72 = tail call float @llvm.fmuladd.f32(float %48, float %49, float %.phi17)
  %73 = tail call float @llvm.fmuladd.f32(float %50, float %51, float %.phi18)
  %74 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %.phi19)
  %75 = tail call float @llvm.fmuladd.f32(float %54, float %55, float %.phi20)
  %76 = tail call float @llvm.fmuladd.f32(float %56, float %57, float %.phi21)
  %77 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %.phi22)
  %78 = tail call float @llvm.fmuladd.f32(float %60, float %61, float %.phi23)
  %79 = tail call float @llvm.fmuladd.f32(float %62, float %63, float %.phi24)
  %cmp32.not.15 = icmp ult i32 %inc39.15, %add60
  br i1 %cmp32.not.15, label %for.body33.15, label %for.end40.loopexit, !llvm.loop !11

for.end40.loopexit:                               ; preds = %for.body33.15
  %sum45 = fadd float %64, %65
  %sum46 = fadd float %66, %67
  %sum47 = fadd float %68, %69
  %sum48 = fadd float %70, %71
  %sum49 = fadd float %72, %73
  %sum50 = fadd float %74, %75
  %sum51 = fadd float %76, %77
  %sum52 = fadd float %78, %79
  %sum53 = fadd float %sum45, %sum46
  %sum54 = fadd float %sum47, %sum48
  %sum55 = fadd float %sum49, %sum50
  %sum56 = fadd float %sum51, %sum52
  %sum57 = fadd float %sum53, %sum54
  %sum58 = fadd float %sum55, %sum56
  %sum59 = fadd float %sum57, %sum58
  br label %for.end164

for.end164:                                       ; preds = %for.body25, %for.end40.loopexit
  %phi.sum = phi i32 [ %add30, %for.body25 ], [ %inc39.15, %for.end40.loopexit ]
  %phi.float = phi float [ 0.000000e+00, %for.body25 ], [ %sum59, %for.end40.loopexit ]
  store float %phi.float, ptr %arrayidx28, align 4
  %cmp182.not587 = icmp ugt i32 %phi.sum, %n21.0129
  br i1 %cmp182.not587, label %for.end40, label %for.body33.clone

for.body33.clone:                                 ; preds = %for.body33.clone, %for.end164
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
  br i1 %cmp32.not.clone, label %for.cond.for.end_crit_edge25, label %for.body33.clone, !llvm.loop !11

for.cond.for.end_crit_edge25:                     ; preds = %for.body33.clone
  store float %83, ptr %arrayidx28, align 4, !tbaa !4
  br label %for.end40

for.end40:                                        ; preds = %for.cond.for.end_crit_edge25, %for.end164
  %inc42 = add nuw nsw i32 %n21.0129, 1
  %exitcond135.not = icmp eq i32 %inc42, %lsig.0
  br i1 %exitcond135.not, label %for.cond45.preheader.loopexit, label %for.body25, !llvm.loop !12

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
  br i1 %cmp59.not130, label %for.body60.preheader, label %for.end16434

for.body60.preheader:                             ; preds = %for.body50
  br label %for.body60.7

for.body60.7:                                     ; preds = %for.body60.7, %for.body60.preheader
  %k53.0131 = phi i32 [ %add56, %for.body60.preheader ], [ %inc66.7, %for.body60.7 ]
  %.phi26 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %100, %for.body60.7 ]
  %.phi27 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %101, %for.body60.7 ]
  %.phi28 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %102, %for.body60.7 ]
  %.phi29 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %103, %for.body60.7 ]
  %.phi30 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %104, %for.body60.7 ]
  %.phi31 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %105, %for.body60.7 ]
  %.phi32 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %106, %for.body60.7 ]
  %.phi33 = phi float [ 0.000000e+00, %for.body60.preheader ], [ %107, %for.body60.7 ]
  %inc66 = add i32 %k53.0131, 1
  %inc66.1 = add i32 %k53.0131, 2
  %inc66.2 = add i32 %k53.0131, 3
  %inc66.3 = add i32 %k53.0131, 4
  %inc66.4 = add i32 %k53.0131, 5
  %inc66.5 = add i32 %k53.0131, 6
  %inc66.6 = add i32 %k53.0131, 7
  %inc66.7 = add i32 %k53.0131, 8
  %sub62 = sub i32 %k53.0131, %add56
  %sub62.1 = sub i32 %inc66, %add56
  %sub62.2 = sub i32 %inc66.1, %add56
  %sub62.3 = sub i32 %inc66.2, %add56
  %sub62.4 = sub i32 %inc66.3, %add56
  %sub62.5 = sub i32 %inc66.4, %add56
  %sub62.6 = sub i32 %inc66.5, %add56
  %sub62.7 = sub i32 %inc66.6, %add56
  %arrayidx61 = getelementptr inbounds float, ptr %sig.0, i32 %k53.0131
  %arrayidx63 = getelementptr inbounds float, ptr %kern.0, i32 %sub62
  %arrayidx61.1 = getelementptr inbounds float, ptr %sig.0, i32 %inc66
  %arrayidx63.1 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.1
  %arrayidx61.2 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.1
  %arrayidx63.2 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.2
  %arrayidx61.3 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.2
  %arrayidx63.3 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.3
  %arrayidx61.4 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.3
  %arrayidx63.4 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.4
  %arrayidx61.5 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.4
  %arrayidx63.5 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.5
  %arrayidx61.6 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.5
  %arrayidx63.6 = getelementptr inbounds float, ptr %kern.0, i32 %sub62.6
  %arrayidx61.7 = getelementptr inbounds float, ptr %sig.0, i32 %inc66.6
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
  %100 = tail call float @llvm.fmuladd.f32(float %84, float %85, float %.phi26)
  %101 = tail call float @llvm.fmuladd.f32(float %86, float %87, float %.phi27)
  %102 = tail call float @llvm.fmuladd.f32(float %88, float %89, float %.phi28)
  %103 = tail call float @llvm.fmuladd.f32(float %90, float %91, float %.phi29)
  %104 = tail call float @llvm.fmuladd.f32(float %92, float %93, float %.phi30)
  %105 = tail call float @llvm.fmuladd.f32(float %94, float %95, float %.phi31)
  %106 = tail call float @llvm.fmuladd.f32(float %96, float %97, float %.phi32)
  %107 = tail call float @llvm.fmuladd.f32(float %98, float %99, float %.phi33)
  %cmp59.not.7 = icmp ult i32 %inc66.7, %add214
  br i1 %cmp59.not.7, label %for.body60.7, label %for.end67.loopexit, !llvm.loop !13

for.end67.loopexit:                               ; preds = %for.body60.7
  %sum60 = fadd float %100, %101
  %sum61 = fadd float %102, %103
  %sum62 = fadd float %104, %105
  %sum63 = fadd float %106, %107
  %sum64 = fadd float %sum60, %sum61
  %sum65 = fadd float %sum62, %sum63
  %sum66 = fadd float %sum64, %sum65
  br label %for.end16434

for.end16434:                                     ; preds = %for.body50, %for.end67.loopexit
  %phi.sum35 = phi i32 [ %add56, %for.body50 ], [ %inc66.7, %for.end67.loopexit ]
  %phi.float36 = phi float [ 0.000000e+00, %for.body50 ], [ %sum66, %for.end67.loopexit ]
  store float %phi.float36, ptr %arrayidx54, align 4
  %cmp182.not58737 = icmp ugt i32 %phi.sum35, %sub57
  br i1 %cmp182.not58737, label %for.end67, label %for.body60.clone

for.body60.clone:                                 ; preds = %for.body60.clone, %for.end16434
  %108 = phi float [ %111, %for.body60.clone ], [ %phi.float36, %for.end16434 ]
  %k53.0131.clone = phi i32 [ %inc66.clone, %for.body60.clone ], [ %phi.sum35, %for.end16434 ]
  %arrayidx61.clone = getelementptr inbounds float, ptr %sig.0, i32 %k53.0131.clone
  %109 = load float, ptr %arrayidx61.clone, align 4, !tbaa !4
  %sub62.clone = sub i32 %k53.0131.clone, %add56
  %arrayidx63.clone = getelementptr inbounds float, ptr %kern.0, i32 %sub62.clone
  %110 = load float, ptr %arrayidx63.clone, align 4, !tbaa !4
  %111 = tail call float @llvm.fmuladd.f32(float %109, float %110, float %108)
  %inc66.clone = add i32 %k53.0131.clone, 1
  %cmp59.not.clone = icmp ugt i32 %inc66.clone, %sub57
  br i1 %cmp59.not.clone, label %for.cond.for.end_crit_edge38, label %for.body60.clone, !llvm.loop !13

for.cond.for.end_crit_edge38:                     ; preds = %for.body60.clone
  store float %111, ptr %arrayidx54, align 4, !tbaa !4
  br label %for.end67

for.end67:                                        ; preds = %for.cond.for.end_crit_edge38, %for.end16434
  %inc69 = add nsw i32 %n44.0133, 1
  %exitcond136.not = icmp eq i32 %inc69, %sub47
  br i1 %exitcond136.not, label %return.loopexit, label %for.body50, !llvm.loop !14

return.loopexit:                                  ; preds = %for.end67
  br label %return

return:                                           ; preds = %return.loopexit, %for.cond45.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond45.preheader ], [ 0, %return.loopexit ]
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
