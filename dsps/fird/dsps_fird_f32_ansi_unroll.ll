; ModuleID = 'dsps_fird_f32_ansi.ll'
source_filename = "dsps_fird_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fird_f32_ansi(ptr nocapture noundef %fir, ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp77 = icmp sgt i32 %len, 0
  br i1 %cmp77, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %decim = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 4
  %0 = load i32, ptr %decim, align 4, !tbaa !4
  %cmp263 = icmp sgt i32 %0, 0
  %delay = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %pos = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %1 = load i32, ptr %N, align 4, !tbaa !11
  %pos9.promoted = load i32, ptr %pos, align 4, !tbaa !12
  %2 = add i32 %0, -1
  %3 = add i32 %1, -1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup26, %for.cond1.preheader.lr.ph
  %4 = phi i32 [ %pos9.promoted, %for.cond1.preheader.lr.ph ], [ %9, %for.cond.cleanup26 ]
  %i.080 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc39, %for.cond.cleanup26 ]
  %input.addr.078 = phi ptr [ %input, %for.cond1.preheader.lr.ph ], [ %input.addr.1.lcssa, %for.cond.cleanup26 ]
  br i1 %cmp263, label %for.body4.lr.ph, label %for.cond.cleanup3

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  %5 = load ptr, ptr %delay, align 4, !tbaa !13
  %xtraiter = and i32 %0, 7
  %6 = icmp ult i32 %2, 7
  br i1 %6, label %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa, label %for.body4.lr.ph.new

for.body4.lr.ph.new:                              ; preds = %for.body4.lr.ph
  %unroll_iter = sub i32 %0, %xtraiter
  br label %for.body4

for.cond.cleanup.loopexit:                        ; preds = %for.cond.cleanup26
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %result.0.lcssa = phi i32 [ 0, %entry ], [ %len, %for.cond.cleanup.loopexit ]
  ret i32 %result.0.lcssa

for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa.loopexit: ; preds = %for.body4
  %incdec.ptr.lcssa.ph.ph = phi ptr [ %incdec.ptr.7, %for.body4 ]
  %spec.select.lcssa.ph.ph = phi i32 [ %spec.select.7, %for.body4 ]
  %.unr.ph = phi i32 [ %spec.select.7, %for.body4 ]
  %k.065.unr.ph = phi i32 [ %inc8.7, %for.body4 ]
  %input.addr.164.unr.ph = phi ptr [ %incdec.ptr.7, %for.body4 ]
  br label %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa

for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa:  ; preds = %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa.loopexit, %for.body4.lr.ph
  %incdec.ptr.lcssa.ph = phi ptr [ undef, %for.body4.lr.ph ], [ %incdec.ptr.lcssa.ph.ph, %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa.loopexit ]
  %spec.select.lcssa.ph = phi i32 [ undef, %for.body4.lr.ph ], [ %spec.select.lcssa.ph.ph, %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa.loopexit ]
  %.unr = phi i32 [ %4, %for.body4.lr.ph ], [ %.unr.ph, %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa.loopexit ]
  %k.065.unr = phi i32 [ 0, %for.body4.lr.ph ], [ %k.065.unr.ph, %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa.loopexit ]
  %input.addr.164.unr = phi ptr [ %input.addr.078, %for.body4.lr.ph ], [ %input.addr.164.unr.ph, %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa.loopexit ]
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body4.epil.preheader, label %for.cond1.for.cond.cleanup3_crit_edge

for.body4.epil.preheader:                         ; preds = %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa
  br label %for.body4.epil

for.body4.epil:                                   ; preds = %for.body4.epil, %for.body4.epil.preheader
  %7 = phi i32 [ %.unr, %for.body4.epil.preheader ], [ %spec.select.epil, %for.body4.epil ]
  %k.065.epil = phi i32 [ %k.065.unr, %for.body4.epil.preheader ], [ %inc8.epil, %for.body4.epil ]
  %input.addr.164.epil = phi ptr [ %input.addr.164.unr, %for.body4.epil.preheader ], [ %incdec.ptr.epil, %for.body4.epil ]
  %epil.iter = phi i32 [ 0, %for.body4.epil.preheader ], [ %epil.iter.next, %for.body4.epil ]
  %incdec.ptr.epil = getelementptr inbounds float, ptr %input.addr.164.epil, i32 1
  %8 = load float, ptr %input.addr.164.epil, align 4, !tbaa !14
  %inc.epil = add nsw i32 %7, 1
  %arrayidx.epil = getelementptr inbounds float, ptr %5, i32 %7
  store float %8, ptr %arrayidx.epil, align 4, !tbaa !14
  %cmp6.not.epil = icmp slt i32 %inc.epil, %1
  %spec.select.epil = select i1 %cmp6.not.epil, i32 %inc.epil, i32 0
  %inc8.epil = add nuw nsw i32 %k.065.epil, 1
  %exitcond.not.epil = icmp eq i32 %inc8.epil, %0
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp = icmp ne i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp, label %for.body4.epil, label %for.cond1.for.cond.cleanup3_crit_edge.epilog-lcssa, !llvm.loop !16

for.cond1.for.cond.cleanup3_crit_edge.epilog-lcssa: ; preds = %for.body4.epil
  %incdec.ptr.lcssa.ph2 = phi ptr [ %incdec.ptr.epil, %for.body4.epil ]
  %spec.select.lcssa.ph3 = phi i32 [ %spec.select.epil, %for.body4.epil ]
  br label %for.cond1.for.cond.cleanup3_crit_edge

for.cond1.for.cond.cleanup3_crit_edge:            ; preds = %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa, %for.cond1.for.cond.cleanup3_crit_edge.epilog-lcssa
  %incdec.ptr.lcssa = phi ptr [ %incdec.ptr.lcssa.ph, %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa ], [ %incdec.ptr.lcssa.ph2, %for.cond1.for.cond.cleanup3_crit_edge.epilog-lcssa ]
  %spec.select.lcssa = phi i32 [ %spec.select.lcssa.ph, %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa ], [ %spec.select.lcssa.ph3, %for.cond1.for.cond.cleanup3_crit_edge.epilog-lcssa ]
  store i32 %spec.select.lcssa, ptr %pos, align 4, !tbaa !12
  br label %for.cond.cleanup3

for.cond.cleanup3:                                ; preds = %for.cond1.for.cond.cleanup3_crit_edge, %for.cond1.preheader
  %9 = phi i32 [ %spec.select.lcssa, %for.cond1.for.cond.cleanup3_crit_edge ], [ %4, %for.cond1.preheader ]
  %input.addr.1.lcssa = phi ptr [ %incdec.ptr.lcssa, %for.cond1.for.cond.cleanup3_crit_edge ], [ %input.addr.078, %for.cond1.preheader ]
  %cmp1266 = icmp slt i32 %9, %1
  br i1 %cmp1266, label %for.body14.lr.ph, label %for.cond23.preheader

for.body14.lr.ph:                                 ; preds = %for.cond.cleanup3
  %10 = load ptr, ptr %fir, align 4, !tbaa !18
  %11 = load ptr, ptr %delay, align 4, !tbaa !13
  %12 = sub i32 %1, %9
  %13 = sub i32 %3, %9
  %xtraiter4 = and i32 %12, 7
  %14 = icmp ult i32 %13, 7
  br i1 %14, label %for.cond23.preheader.loopexit.unr-lcssa, label %for.body14.lr.ph.new

for.body14.lr.ph.new:                             ; preds = %for.body14.lr.ph
  %unroll_iter8 = sub i32 %12, %xtraiter4
  br label %for.body14

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph.new
  %15 = phi i32 [ %4, %for.body4.lr.ph.new ], [ %spec.select.7, %for.body4 ]
  %k.065 = phi i32 [ 0, %for.body4.lr.ph.new ], [ %inc8.7, %for.body4 ]
  %input.addr.164 = phi ptr [ %input.addr.078, %for.body4.lr.ph.new ], [ %incdec.ptr.7, %for.body4 ]
  %niter = phi i32 [ 0, %for.body4.lr.ph.new ], [ %niter.next.7, %for.body4 ]
  %incdec.ptr = getelementptr inbounds float, ptr %input.addr.164, i32 1
  %16 = load float, ptr %input.addr.164, align 4, !tbaa !14
  %inc = add nsw i32 %15, 1
  %arrayidx = getelementptr inbounds float, ptr %5, i32 %15
  store float %16, ptr %arrayidx, align 4, !tbaa !14
  %cmp6.not = icmp slt i32 %inc, %1
  %spec.select = select i1 %cmp6.not, i32 %inc, i32 0
  %incdec.ptr.1 = getelementptr inbounds float, ptr %incdec.ptr, i32 1
  %17 = load float, ptr %incdec.ptr, align 4, !tbaa !14
  %inc.1 = add nsw i32 %spec.select, 1
  %arrayidx.1 = getelementptr inbounds float, ptr %5, i32 %spec.select
  store float %17, ptr %arrayidx.1, align 4, !tbaa !14
  %cmp6.not.1 = icmp slt i32 %inc.1, %1
  %spec.select.1 = select i1 %cmp6.not.1, i32 %inc.1, i32 0
  %incdec.ptr.2 = getelementptr inbounds float, ptr %incdec.ptr.1, i32 1
  %18 = load float, ptr %incdec.ptr.1, align 4, !tbaa !14
  %inc.2 = add nsw i32 %spec.select.1, 1
  %arrayidx.2 = getelementptr inbounds float, ptr %5, i32 %spec.select.1
  store float %18, ptr %arrayidx.2, align 4, !tbaa !14
  %cmp6.not.2 = icmp slt i32 %inc.2, %1
  %spec.select.2 = select i1 %cmp6.not.2, i32 %inc.2, i32 0
  %incdec.ptr.3 = getelementptr inbounds float, ptr %incdec.ptr.2, i32 1
  %19 = load float, ptr %incdec.ptr.2, align 4, !tbaa !14
  %inc.3 = add nsw i32 %spec.select.2, 1
  %arrayidx.3 = getelementptr inbounds float, ptr %5, i32 %spec.select.2
  store float %19, ptr %arrayidx.3, align 4, !tbaa !14
  %cmp6.not.3 = icmp slt i32 %inc.3, %1
  %spec.select.3 = select i1 %cmp6.not.3, i32 %inc.3, i32 0
  %incdec.ptr.4 = getelementptr inbounds float, ptr %incdec.ptr.3, i32 1
  %20 = load float, ptr %incdec.ptr.3, align 4, !tbaa !14
  %inc.4 = add nsw i32 %spec.select.3, 1
  %arrayidx.4 = getelementptr inbounds float, ptr %5, i32 %spec.select.3
  store float %20, ptr %arrayidx.4, align 4, !tbaa !14
  %cmp6.not.4 = icmp slt i32 %inc.4, %1
  %spec.select.4 = select i1 %cmp6.not.4, i32 %inc.4, i32 0
  %incdec.ptr.5 = getelementptr inbounds float, ptr %incdec.ptr.4, i32 1
  %21 = load float, ptr %incdec.ptr.4, align 4, !tbaa !14
  %inc.5 = add nsw i32 %spec.select.4, 1
  %arrayidx.5 = getelementptr inbounds float, ptr %5, i32 %spec.select.4
  store float %21, ptr %arrayidx.5, align 4, !tbaa !14
  %cmp6.not.5 = icmp slt i32 %inc.5, %1
  %spec.select.5 = select i1 %cmp6.not.5, i32 %inc.5, i32 0
  %incdec.ptr.6 = getelementptr inbounds float, ptr %incdec.ptr.5, i32 1
  %22 = load float, ptr %incdec.ptr.5, align 4, !tbaa !14
  %inc.6 = add nsw i32 %spec.select.5, 1
  %arrayidx.6 = getelementptr inbounds float, ptr %5, i32 %spec.select.5
  store float %22, ptr %arrayidx.6, align 4, !tbaa !14
  %cmp6.not.6 = icmp slt i32 %inc.6, %1
  %spec.select.6 = select i1 %cmp6.not.6, i32 %inc.6, i32 0
  %incdec.ptr.7 = getelementptr inbounds float, ptr %incdec.ptr.6, i32 1
  %23 = load float, ptr %incdec.ptr.6, align 4, !tbaa !14
  %inc.7 = add nsw i32 %spec.select.6, 1
  %arrayidx.7 = getelementptr inbounds float, ptr %5, i32 %spec.select.6
  store float %23, ptr %arrayidx.7, align 4, !tbaa !14
  %cmp6.not.7 = icmp slt i32 %inc.7, %1
  %spec.select.7 = select i1 %cmp6.not.7, i32 %inc.7, i32 0
  %inc8.7 = add nuw nsw i32 %k.065, 8
  %niter.next.7 = add i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa.loopexit, label %for.body4, !llvm.loop !19

for.cond23.preheader.loopexit.unr-lcssa.loopexit: ; preds = %for.body14
  %.lcssa.ph.ph = phi float [ %54, %for.body14 ]
  %n.069.unr.ph = phi i32 [ %inc20.7, %for.body14 ]
  %coeff_pos.068.unr.ph = phi i32 [ %inc15.7, %for.body14 ]
  %acc.067.unr.ph = phi float [ %54, %for.body14 ]
  br label %for.cond23.preheader.loopexit.unr-lcssa

for.cond23.preheader.loopexit.unr-lcssa:          ; preds = %for.cond23.preheader.loopexit.unr-lcssa.loopexit, %for.body14.lr.ph
  %.lcssa.ph = phi float [ undef, %for.body14.lr.ph ], [ %.lcssa.ph.ph, %for.cond23.preheader.loopexit.unr-lcssa.loopexit ]
  %n.069.unr = phi i32 [ %9, %for.body14.lr.ph ], [ %n.069.unr.ph, %for.cond23.preheader.loopexit.unr-lcssa.loopexit ]
  %coeff_pos.068.unr = phi i32 [ 0, %for.body14.lr.ph ], [ %coeff_pos.068.unr.ph, %for.cond23.preheader.loopexit.unr-lcssa.loopexit ]
  %acc.067.unr = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %acc.067.unr.ph, %for.cond23.preheader.loopexit.unr-lcssa.loopexit ]
  %lcmp.mod6 = icmp ne i32 %xtraiter4, 0
  br i1 %lcmp.mod6, label %for.body14.epil.preheader, label %for.cond23.preheader.loopexit

for.body14.epil.preheader:                        ; preds = %for.cond23.preheader.loopexit.unr-lcssa
  br label %for.body14.epil

for.body14.epil:                                  ; preds = %for.body14.epil, %for.body14.epil.preheader
  %n.069.epil = phi i32 [ %n.069.unr, %for.body14.epil.preheader ], [ %inc20.epil, %for.body14.epil ]
  %coeff_pos.068.epil = phi i32 [ %coeff_pos.068.unr, %for.body14.epil.preheader ], [ %inc15.epil, %for.body14.epil ]
  %acc.067.epil = phi float [ %acc.067.unr, %for.body14.epil.preheader ], [ %26, %for.body14.epil ]
  %epil.iter5 = phi i32 [ 0, %for.body14.epil.preheader ], [ %epil.iter5.next, %for.body14.epil ]
  %inc15.epil = add nuw i32 %coeff_pos.068.epil, 1
  %arrayidx16.epil = getelementptr inbounds float, ptr %10, i32 %coeff_pos.068.epil
  %24 = load float, ptr %arrayidx16.epil, align 4, !tbaa !14
  %arrayidx18.epil = getelementptr inbounds float, ptr %11, i32 %n.069.epil
  %25 = load float, ptr %arrayidx18.epil, align 4, !tbaa !14
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %acc.067.epil)
  %inc20.epil = add nsw i32 %n.069.epil, 1
  %exitcond83.not.epil = icmp eq i32 %inc15.epil, %12
  %epil.iter5.next = add i32 %epil.iter5, 1
  %epil.iter5.cmp = icmp ne i32 %epil.iter5.next, %xtraiter4
  br i1 %epil.iter5.cmp, label %for.body14.epil, label %for.cond23.preheader.loopexit.epilog-lcssa, !llvm.loop !21

for.cond23.preheader.loopexit.epilog-lcssa:       ; preds = %for.body14.epil
  %.lcssa.ph7 = phi float [ %26, %for.body14.epil ]
  br label %for.cond23.preheader.loopexit

for.cond23.preheader.loopexit:                    ; preds = %for.cond23.preheader.loopexit.unr-lcssa, %for.cond23.preheader.loopexit.epilog-lcssa
  %.lcssa = phi float [ %.lcssa.ph, %for.cond23.preheader.loopexit.unr-lcssa ], [ %.lcssa.ph7, %for.cond23.preheader.loopexit.epilog-lcssa ]
  br label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.cond23.preheader.loopexit, %for.cond.cleanup3
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %.lcssa, %for.cond23.preheader.loopexit ]
  %coeff_pos.0.lcssa = phi i32 [ 0, %for.cond.cleanup3 ], [ %12, %for.cond23.preheader.loopexit ]
  %cmp2572 = icmp sgt i32 %9, 0
  br i1 %cmp2572, label %for.body27.lr.ph, label %for.cond.cleanup26

for.body27.lr.ph:                                 ; preds = %for.cond23.preheader
  %27 = load ptr, ptr %fir, align 4, !tbaa !18
  %28 = load ptr, ptr %delay, align 4, !tbaa !13
  %29 = add i32 %9, -1
  %xtraiter10 = and i32 %9, 7
  %30 = icmp ult i32 %29, 7
  br i1 %30, label %for.cond.cleanup26.loopexit.unr-lcssa, label %for.body27.lr.ph.new

for.body27.lr.ph.new:                             ; preds = %for.body27.lr.ph
  %unroll_iter14 = sub i32 %9, %xtraiter10
  br label %for.body27

for.body14:                                       ; preds = %for.body14, %for.body14.lr.ph.new
  %n.069 = phi i32 [ %9, %for.body14.lr.ph.new ], [ %inc20.7, %for.body14 ]
  %coeff_pos.068 = phi i32 [ 0, %for.body14.lr.ph.new ], [ %inc15.7, %for.body14 ]
  %acc.067 = phi float [ 0.000000e+00, %for.body14.lr.ph.new ], [ %54, %for.body14 ]
  %niter9 = phi i32 [ 0, %for.body14.lr.ph.new ], [ %niter9.next.7, %for.body14 ]
  %inc15 = add nuw nsw i32 %coeff_pos.068, 1
  %arrayidx16 = getelementptr inbounds float, ptr %10, i32 %coeff_pos.068
  %31 = load float, ptr %arrayidx16, align 4, !tbaa !14
  %arrayidx18 = getelementptr inbounds float, ptr %11, i32 %n.069
  %32 = load float, ptr %arrayidx18, align 4, !tbaa !14
  %33 = tail call float @llvm.fmuladd.f32(float %31, float %32, float %acc.067)
  %inc20 = add nsw i32 %n.069, 1
  %inc15.1 = add nuw nsw i32 %coeff_pos.068, 2
  %arrayidx16.1 = getelementptr inbounds float, ptr %10, i32 %inc15
  %34 = load float, ptr %arrayidx16.1, align 4, !tbaa !14
  %arrayidx18.1 = getelementptr inbounds float, ptr %11, i32 %inc20
  %35 = load float, ptr %arrayidx18.1, align 4, !tbaa !14
  %36 = tail call float @llvm.fmuladd.f32(float %34, float %35, float %33)
  %inc20.1 = add nsw i32 %n.069, 2
  %inc15.2 = add nuw nsw i32 %coeff_pos.068, 3
  %arrayidx16.2 = getelementptr inbounds float, ptr %10, i32 %inc15.1
  %37 = load float, ptr %arrayidx16.2, align 4, !tbaa !14
  %arrayidx18.2 = getelementptr inbounds float, ptr %11, i32 %inc20.1
  %38 = load float, ptr %arrayidx18.2, align 4, !tbaa !14
  %39 = tail call float @llvm.fmuladd.f32(float %37, float %38, float %36)
  %inc20.2 = add nsw i32 %n.069, 3
  %inc15.3 = add nuw nsw i32 %coeff_pos.068, 4
  %arrayidx16.3 = getelementptr inbounds float, ptr %10, i32 %inc15.2
  %40 = load float, ptr %arrayidx16.3, align 4, !tbaa !14
  %arrayidx18.3 = getelementptr inbounds float, ptr %11, i32 %inc20.2
  %41 = load float, ptr %arrayidx18.3, align 4, !tbaa !14
  %42 = tail call float @llvm.fmuladd.f32(float %40, float %41, float %39)
  %inc20.3 = add nsw i32 %n.069, 4
  %inc15.4 = add nuw nsw i32 %coeff_pos.068, 5
  %arrayidx16.4 = getelementptr inbounds float, ptr %10, i32 %inc15.3
  %43 = load float, ptr %arrayidx16.4, align 4, !tbaa !14
  %arrayidx18.4 = getelementptr inbounds float, ptr %11, i32 %inc20.3
  %44 = load float, ptr %arrayidx18.4, align 4, !tbaa !14
  %45 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %42)
  %inc20.4 = add nsw i32 %n.069, 5
  %inc15.5 = add nuw nsw i32 %coeff_pos.068, 6
  %arrayidx16.5 = getelementptr inbounds float, ptr %10, i32 %inc15.4
  %46 = load float, ptr %arrayidx16.5, align 4, !tbaa !14
  %arrayidx18.5 = getelementptr inbounds float, ptr %11, i32 %inc20.4
  %47 = load float, ptr %arrayidx18.5, align 4, !tbaa !14
  %48 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %45)
  %inc20.5 = add nsw i32 %n.069, 6
  %inc15.6 = add nuw nsw i32 %coeff_pos.068, 7
  %arrayidx16.6 = getelementptr inbounds float, ptr %10, i32 %inc15.5
  %49 = load float, ptr %arrayidx16.6, align 4, !tbaa !14
  %arrayidx18.6 = getelementptr inbounds float, ptr %11, i32 %inc20.5
  %50 = load float, ptr %arrayidx18.6, align 4, !tbaa !14
  %51 = tail call float @llvm.fmuladd.f32(float %49, float %50, float %48)
  %inc20.6 = add nsw i32 %n.069, 7
  %inc15.7 = add nuw i32 %coeff_pos.068, 8
  %arrayidx16.7 = getelementptr inbounds float, ptr %10, i32 %inc15.6
  %52 = load float, ptr %arrayidx16.7, align 4, !tbaa !14
  %arrayidx18.7 = getelementptr inbounds float, ptr %11, i32 %inc20.6
  %53 = load float, ptr %arrayidx18.7, align 4, !tbaa !14
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %51)
  %inc20.7 = add nsw i32 %n.069, 8
  %niter9.next.7 = add i32 %niter9, 8
  %niter9.ncmp.7 = icmp eq i32 %niter9.next.7, %unroll_iter8
  br i1 %niter9.ncmp.7, label %for.cond23.preheader.loopexit.unr-lcssa.loopexit, label %for.body14, !llvm.loop !22

for.cond.cleanup26.loopexit.unr-lcssa.loopexit:   ; preds = %for.body27
  %.lcssa1.ph.ph = phi float [ %81, %for.body27 ]
  %n22.075.unr.ph = phi i32 [ %inc34.7, %for.body27 ]
  %coeff_pos.174.unr.ph = phi i32 [ %inc29.7, %for.body27 ]
  %acc.173.unr.ph = phi float [ %81, %for.body27 ]
  br label %for.cond.cleanup26.loopexit.unr-lcssa

for.cond.cleanup26.loopexit.unr-lcssa:            ; preds = %for.cond.cleanup26.loopexit.unr-lcssa.loopexit, %for.body27.lr.ph
  %.lcssa1.ph = phi float [ undef, %for.body27.lr.ph ], [ %.lcssa1.ph.ph, %for.cond.cleanup26.loopexit.unr-lcssa.loopexit ]
  %n22.075.unr = phi i32 [ 0, %for.body27.lr.ph ], [ %n22.075.unr.ph, %for.cond.cleanup26.loopexit.unr-lcssa.loopexit ]
  %coeff_pos.174.unr = phi i32 [ %coeff_pos.0.lcssa, %for.body27.lr.ph ], [ %coeff_pos.174.unr.ph, %for.cond.cleanup26.loopexit.unr-lcssa.loopexit ]
  %acc.173.unr = phi float [ %acc.0.lcssa, %for.body27.lr.ph ], [ %acc.173.unr.ph, %for.cond.cleanup26.loopexit.unr-lcssa.loopexit ]
  %lcmp.mod12 = icmp ne i32 %xtraiter10, 0
  br i1 %lcmp.mod12, label %for.body27.epil.preheader, label %for.cond.cleanup26.loopexit

for.body27.epil.preheader:                        ; preds = %for.cond.cleanup26.loopexit.unr-lcssa
  br label %for.body27.epil

for.body27.epil:                                  ; preds = %for.body27.epil, %for.body27.epil.preheader
  %n22.075.epil = phi i32 [ %n22.075.unr, %for.body27.epil.preheader ], [ %inc34.epil, %for.body27.epil ]
  %coeff_pos.174.epil = phi i32 [ %coeff_pos.174.unr, %for.body27.epil.preheader ], [ %inc29.epil, %for.body27.epil ]
  %acc.173.epil = phi float [ %acc.173.unr, %for.body27.epil.preheader ], [ %57, %for.body27.epil ]
  %epil.iter11 = phi i32 [ 0, %for.body27.epil.preheader ], [ %epil.iter11.next, %for.body27.epil ]
  %inc29.epil = add nuw nsw i32 %coeff_pos.174.epil, 1
  %arrayidx30.epil = getelementptr inbounds float, ptr %27, i32 %coeff_pos.174.epil
  %55 = load float, ptr %arrayidx30.epil, align 4, !tbaa !14
  %arrayidx32.epil = getelementptr inbounds float, ptr %28, i32 %n22.075.epil
  %56 = load float, ptr %arrayidx32.epil, align 4, !tbaa !14
  %57 = tail call float @llvm.fmuladd.f32(float %55, float %56, float %acc.173.epil)
  %inc34.epil = add nuw nsw i32 %n22.075.epil, 1
  %exitcond84.not.epil = icmp eq i32 %inc34.epil, %9
  %epil.iter11.next = add i32 %epil.iter11, 1
  %epil.iter11.cmp = icmp ne i32 %epil.iter11.next, %xtraiter10
  br i1 %epil.iter11.cmp, label %for.body27.epil, label %for.cond.cleanup26.loopexit.epilog-lcssa, !llvm.loop !23

for.cond.cleanup26.loopexit.epilog-lcssa:         ; preds = %for.body27.epil
  %.lcssa1.ph13 = phi float [ %57, %for.body27.epil ]
  br label %for.cond.cleanup26.loopexit

for.cond.cleanup26.loopexit:                      ; preds = %for.cond.cleanup26.loopexit.unr-lcssa, %for.cond.cleanup26.loopexit.epilog-lcssa
  %.lcssa1 = phi float [ %.lcssa1.ph, %for.cond.cleanup26.loopexit.unr-lcssa ], [ %.lcssa1.ph13, %for.cond.cleanup26.loopexit.epilog-lcssa ]
  br label %for.cond.cleanup26

for.cond.cleanup26:                               ; preds = %for.cond.cleanup26.loopexit, %for.cond23.preheader
  %acc.1.lcssa = phi float [ %acc.0.lcssa, %for.cond23.preheader ], [ %.lcssa1, %for.cond.cleanup26.loopexit ]
  %inc39 = add nuw nsw i32 %i.080, 1
  %arrayidx37 = getelementptr inbounds float, ptr %output, i32 %i.080
  store float %acc.1.lcssa, ptr %arrayidx37, align 4, !tbaa !14
  %exitcond85.not = icmp eq i32 %inc39, %len
  br i1 %exitcond85.not, label %for.cond.cleanup.loopexit, label %for.cond1.preheader, !llvm.loop !24

for.body27:                                       ; preds = %for.body27, %for.body27.lr.ph.new
  %n22.075 = phi i32 [ 0, %for.body27.lr.ph.new ], [ %inc34.7, %for.body27 ]
  %coeff_pos.174 = phi i32 [ %coeff_pos.0.lcssa, %for.body27.lr.ph.new ], [ %inc29.7, %for.body27 ]
  %acc.173 = phi float [ %acc.0.lcssa, %for.body27.lr.ph.new ], [ %81, %for.body27 ]
  %niter15 = phi i32 [ 0, %for.body27.lr.ph.new ], [ %niter15.next.7, %for.body27 ]
  %inc29 = add nuw nsw i32 %coeff_pos.174, 1
  %arrayidx30 = getelementptr inbounds float, ptr %27, i32 %coeff_pos.174
  %58 = load float, ptr %arrayidx30, align 4, !tbaa !14
  %arrayidx32 = getelementptr inbounds float, ptr %28, i32 %n22.075
  %59 = load float, ptr %arrayidx32, align 4, !tbaa !14
  %60 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %acc.173)
  %inc34 = add nuw nsw i32 %n22.075, 1
  %inc29.1 = add nuw nsw i32 %coeff_pos.174, 2
  %arrayidx30.1 = getelementptr inbounds float, ptr %27, i32 %inc29
  %61 = load float, ptr %arrayidx30.1, align 4, !tbaa !14
  %arrayidx32.1 = getelementptr inbounds float, ptr %28, i32 %inc34
  %62 = load float, ptr %arrayidx32.1, align 4, !tbaa !14
  %63 = tail call float @llvm.fmuladd.f32(float %61, float %62, float %60)
  %inc34.1 = add nuw nsw i32 %n22.075, 2
  %inc29.2 = add nuw nsw i32 %coeff_pos.174, 3
  %arrayidx30.2 = getelementptr inbounds float, ptr %27, i32 %inc29.1
  %64 = load float, ptr %arrayidx30.2, align 4, !tbaa !14
  %arrayidx32.2 = getelementptr inbounds float, ptr %28, i32 %inc34.1
  %65 = load float, ptr %arrayidx32.2, align 4, !tbaa !14
  %66 = tail call float @llvm.fmuladd.f32(float %64, float %65, float %63)
  %inc34.2 = add nuw nsw i32 %n22.075, 3
  %inc29.3 = add nuw nsw i32 %coeff_pos.174, 4
  %arrayidx30.3 = getelementptr inbounds float, ptr %27, i32 %inc29.2
  %67 = load float, ptr %arrayidx30.3, align 4, !tbaa !14
  %arrayidx32.3 = getelementptr inbounds float, ptr %28, i32 %inc34.2
  %68 = load float, ptr %arrayidx32.3, align 4, !tbaa !14
  %69 = tail call float @llvm.fmuladd.f32(float %67, float %68, float %66)
  %inc34.3 = add nuw nsw i32 %n22.075, 4
  %inc29.4 = add nuw nsw i32 %coeff_pos.174, 5
  %arrayidx30.4 = getelementptr inbounds float, ptr %27, i32 %inc29.3
  %70 = load float, ptr %arrayidx30.4, align 4, !tbaa !14
  %arrayidx32.4 = getelementptr inbounds float, ptr %28, i32 %inc34.3
  %71 = load float, ptr %arrayidx32.4, align 4, !tbaa !14
  %72 = tail call float @llvm.fmuladd.f32(float %70, float %71, float %69)
  %inc34.4 = add nuw nsw i32 %n22.075, 5
  %inc29.5 = add nuw nsw i32 %coeff_pos.174, 6
  %arrayidx30.5 = getelementptr inbounds float, ptr %27, i32 %inc29.4
  %73 = load float, ptr %arrayidx30.5, align 4, !tbaa !14
  %arrayidx32.5 = getelementptr inbounds float, ptr %28, i32 %inc34.4
  %74 = load float, ptr %arrayidx32.5, align 4, !tbaa !14
  %75 = tail call float @llvm.fmuladd.f32(float %73, float %74, float %72)
  %inc34.5 = add nuw nsw i32 %n22.075, 6
  %inc29.6 = add nuw nsw i32 %coeff_pos.174, 7
  %arrayidx30.6 = getelementptr inbounds float, ptr %27, i32 %inc29.5
  %76 = load float, ptr %arrayidx30.6, align 4, !tbaa !14
  %arrayidx32.6 = getelementptr inbounds float, ptr %28, i32 %inc34.5
  %77 = load float, ptr %arrayidx32.6, align 4, !tbaa !14
  %78 = tail call float @llvm.fmuladd.f32(float %76, float %77, float %75)
  %inc34.6 = add nuw nsw i32 %n22.075, 7
  %inc29.7 = add nuw nsw i32 %coeff_pos.174, 8
  %arrayidx30.7 = getelementptr inbounds float, ptr %27, i32 %inc29.6
  %79 = load float, ptr %arrayidx30.7, align 4, !tbaa !14
  %arrayidx32.7 = getelementptr inbounds float, ptr %28, i32 %inc34.6
  %80 = load float, ptr %arrayidx32.7, align 4, !tbaa !14
  %81 = tail call float @llvm.fmuladd.f32(float %79, float %80, float %78)
  %inc34.7 = add nuw nsw i32 %n22.075, 8
  %niter15.next.7 = add i32 %niter15, 8
  %niter15.ncmp.7 = icmp eq i32 %niter15.next.7, %unroll_iter14
  br i1 %niter15.ncmp.7, label %for.cond.cleanup26.loopexit.unr-lcssa.loopexit, label %for.body27, !llvm.loop !25
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb)"}
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
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !7, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = !{!5, !6, i64 0}
!19 = distinct !{!19, !20, !17}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !17}
!22 = distinct !{!22, !20, !17}
!23 = distinct !{!23, !17}
!24 = distinct !{!24, !20}
!25 = distinct !{!25, !20, !17}
