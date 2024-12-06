; ModuleID = 'dsps_fft2r_sc16_ansi.ll'
source_filename = "dsps_fft2r_sc16_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

@dsps_fft2r_sc16_initialized = external dso_local local_unnamed_addr global i8, align 1

; Function Attrs: nounwind
define dso_local noundef i32 @dsps_fft2r_sc16_ansi_(ptr nocapture noundef %data, i32 noundef %N, ptr nocapture noundef readonly %sc_table) local_unnamed_addr #0 {
entry:
  %call = tail call zeroext i1 @dsp_is_power_of_two(i32 noundef %N) #2
  br i1 %call, label %if.end, label %return

if.end:                                           ; preds = %entry
  %0 = load i8, ptr @dsps_fft2r_sc16_initialized, align 1, !tbaa !4
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %return, label %if.end2

if.end2:                                          ; preds = %if.end
  %cmp122 = icmp sgt i32 %N, 1
  br i1 %cmp122, label %for.cond3.preheader.preheader, label %return

for.cond3.preheader.preheader:                    ; preds = %if.end2
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond3.preheader.preheader, %for.cond.cleanup5
  %ie.0125 = phi i32 [ %shl, %for.cond.cleanup5 ], [ 1, %for.cond3.preheader.preheader ]
  %N2.0123.in = phi i32 [ %N2.0123, %for.cond.cleanup5 ], [ %N, %for.cond3.preheader.preheader ]
  %N2.0123 = lshr i32 %N2.0123.in, 1
  %cmp4119 = icmp sgt i32 %ie.0125, 0
  %cmp8116 = icmp ugt i32 %N2.0123.in, 1
  %or.cond = select i1 %cmp4119, i1 %cmp8116, i1 false
  br i1 %or.cond, label %for.body6.us.preheader, label %for.cond.cleanup5

for.body6.us.preheader:                           ; preds = %for.cond3.preheader
  %1 = add nsw i32 %N2.0123, -1
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us.preheader, %for.cond7.for.cond.cleanup9_crit_edge.us
  %ia.0121.us = phi i32 [ %add42.us, %for.cond7.for.cond.cleanup9_crit_edge.us ], [ 0, %for.body6.us.preheader ]
  %j.0120.us = phi i32 [ %inc44.us, %for.cond7.for.cond.cleanup9_crit_edge.us ], [ 0, %for.body6.us.preheader ]
  %arrayidx.us = getelementptr inbounds i32, ptr %sc_table, i32 %j.0120.us
  %2 = load i32, ptr %arrayidx.us, align 4, !tbaa !7
  %sext111.us = shl i32 %2, 16
  %conv1.i.us = ashr exact i32 %sext111.us, 16
  %conv4.i.us = ashr i32 %2, 16
  %xtraiter = and i32 %N2.0123, 3
  %3 = icmp ult i32 %1, 3
  br i1 %3, label %for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa, label %for.body6.us.new

for.body6.us.new:                                 ; preds = %for.body6.us
  %unroll_iter = sub i32 %N2.0123, %xtraiter
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us, %for.body6.us.new
  %ia.1118.us = phi i32 [ %ia.0121.us, %for.body6.us.new ], [ %inc.us.3, %for.body10.us ]
  %i.0117.us = phi i32 [ 0, %for.body6.us.new ], [ %inc41.us.3, %for.body10.us ]
  %niter = phi i32 [ 0, %for.body6.us.new ], [ %niter.next.3, %for.body10.us ]
  %4 = getelementptr i32, ptr %data, i32 %ia.1118.us
  %arrayidx11.us = getelementptr i32, ptr %4, i32 %N2.0123
  %5 = load i32, ptr %arrayidx11.us, align 4, !tbaa !7
  %6 = load i32, ptr %4, align 4, !tbaa !7
  %sext.us = shl i32 %6, 16
  %conv.i.us = ashr exact i32 %sext.us, 16
  %mul.i.us = mul nsw i32 %conv.i.us, 32767
  %sext112.us = shl i32 %5, 16
  %conv2.i.us = ashr exact i32 %sext112.us, 16
  %conv5.i.us = ashr i32 %5, 16
  %mul3.neg.i.us = mul nsw i32 %conv2.i.us, %conv1.i.us
  %mul6.neg.i.us = mul nsw i32 %conv5.i.us, %conv4.i.us
  %sub.i.us = add nsw i32 %mul.i.us, 32767
  %7 = add i32 %mul3.neg.i.us, %mul6.neg.i.us
  %add7.i.us = sub i32 %sub.i.us, %7
  %shr.i.us = lshr i32 %add7.i.us, 16
  %conv.i79.us = ashr i32 %6, 16
  %mul.i80.us = mul nsw i32 %conv.i79.us, 32767
  %mul3.i.us = mul nsw i32 %conv5.i.us, %conv1.i.us
  %mul6.i.us = mul nsw i32 %conv2.i.us, %conv4.i.us
  %sub.neg.i.us = add nsw i32 %mul.i80.us, 32767
  %sub7.i.us = sub nsw i32 %mul6.i.us, %mul3.i.us
  %add.i.us = add i32 %sub7.i.us, %sub.neg.i.us
  %shr.i85.us = and i32 %add.i.us, -65536
  %m1.sroa.0.0.insert.insert.us = or disjoint i32 %shr.i85.us, %shr.i.us
  store i32 %m1.sroa.0.0.insert.insert.us, ptr %arrayidx11.us, align 4, !tbaa !7
  %add8.i.us = add i32 %7, %sub.i.us
  %shr.i97.us = lshr i32 %add8.i.us, 16
  %add.i107.us = sub nsw i32 %mul3.i.us, %mul6.i.us
  %add7.i108.us = add i32 %add.i107.us, %sub.neg.i.us
  %shr.i109.us = and i32 %add7.i108.us, -65536
  %m2.sroa.0.0.insert.insert.us = or disjoint i32 %shr.i97.us, %shr.i109.us
  store i32 %m2.sroa.0.0.insert.insert.us, ptr %4, align 4, !tbaa !7
  %inc.us = add nsw i32 %ia.1118.us, 1
  %8 = getelementptr i32, ptr %data, i32 %inc.us
  %arrayidx11.us.1 = getelementptr i32, ptr %8, i32 %N2.0123
  %9 = load i32, ptr %arrayidx11.us.1, align 4, !tbaa !7
  %10 = load i32, ptr %8, align 4, !tbaa !7
  %sext.us.1 = shl i32 %10, 16
  %conv.i.us.1 = ashr exact i32 %sext.us.1, 16
  %mul.i.us.1 = mul nsw i32 %conv.i.us.1, 32767
  %sext112.us.1 = shl i32 %9, 16
  %conv2.i.us.1 = ashr exact i32 %sext112.us.1, 16
  %conv5.i.us.1 = ashr i32 %9, 16
  %mul3.neg.i.us.1 = mul nsw i32 %conv2.i.us.1, %conv1.i.us
  %mul6.neg.i.us.1 = mul nsw i32 %conv5.i.us.1, %conv4.i.us
  %sub.i.us.1 = add nsw i32 %mul.i.us.1, 32767
  %11 = add i32 %mul3.neg.i.us.1, %mul6.neg.i.us.1
  %add7.i.us.1 = sub i32 %sub.i.us.1, %11
  %shr.i.us.1 = lshr i32 %add7.i.us.1, 16
  %conv.i79.us.1 = ashr i32 %10, 16
  %mul.i80.us.1 = mul nsw i32 %conv.i79.us.1, 32767
  %mul3.i.us.1 = mul nsw i32 %conv5.i.us.1, %conv1.i.us
  %mul6.i.us.1 = mul nsw i32 %conv2.i.us.1, %conv4.i.us
  %sub.neg.i.us.1 = add nsw i32 %mul.i80.us.1, 32767
  %sub7.i.us.1 = sub nsw i32 %mul6.i.us.1, %mul3.i.us.1
  %add.i.us.1 = add i32 %sub7.i.us.1, %sub.neg.i.us.1
  %shr.i85.us.1 = and i32 %add.i.us.1, -65536
  %m1.sroa.0.0.insert.insert.us.1 = or disjoint i32 %shr.i85.us.1, %shr.i.us.1
  store i32 %m1.sroa.0.0.insert.insert.us.1, ptr %arrayidx11.us.1, align 4, !tbaa !7
  %add8.i.us.1 = add i32 %11, %sub.i.us.1
  %shr.i97.us.1 = lshr i32 %add8.i.us.1, 16
  %add.i107.us.1 = sub nsw i32 %mul3.i.us.1, %mul6.i.us.1
  %add7.i108.us.1 = add i32 %add.i107.us.1, %sub.neg.i.us.1
  %shr.i109.us.1 = and i32 %add7.i108.us.1, -65536
  %m2.sroa.0.0.insert.insert.us.1 = or disjoint i32 %shr.i97.us.1, %shr.i109.us.1
  store i32 %m2.sroa.0.0.insert.insert.us.1, ptr %8, align 4, !tbaa !7
  %inc.us.1 = add nsw i32 %ia.1118.us, 2
  %12 = getelementptr i32, ptr %data, i32 %inc.us.1
  %arrayidx11.us.2 = getelementptr i32, ptr %12, i32 %N2.0123
  %13 = load i32, ptr %arrayidx11.us.2, align 4, !tbaa !7
  %14 = load i32, ptr %12, align 4, !tbaa !7
  %sext.us.2 = shl i32 %14, 16
  %conv.i.us.2 = ashr exact i32 %sext.us.2, 16
  %mul.i.us.2 = mul nsw i32 %conv.i.us.2, 32767
  %sext112.us.2 = shl i32 %13, 16
  %conv2.i.us.2 = ashr exact i32 %sext112.us.2, 16
  %conv5.i.us.2 = ashr i32 %13, 16
  %mul3.neg.i.us.2 = mul nsw i32 %conv2.i.us.2, %conv1.i.us
  %mul6.neg.i.us.2 = mul nsw i32 %conv5.i.us.2, %conv4.i.us
  %sub.i.us.2 = add nsw i32 %mul.i.us.2, 32767
  %15 = add i32 %mul3.neg.i.us.2, %mul6.neg.i.us.2
  %add7.i.us.2 = sub i32 %sub.i.us.2, %15
  %shr.i.us.2 = lshr i32 %add7.i.us.2, 16
  %conv.i79.us.2 = ashr i32 %14, 16
  %mul.i80.us.2 = mul nsw i32 %conv.i79.us.2, 32767
  %mul3.i.us.2 = mul nsw i32 %conv5.i.us.2, %conv1.i.us
  %mul6.i.us.2 = mul nsw i32 %conv2.i.us.2, %conv4.i.us
  %sub.neg.i.us.2 = add nsw i32 %mul.i80.us.2, 32767
  %sub7.i.us.2 = sub nsw i32 %mul6.i.us.2, %mul3.i.us.2
  %add.i.us.2 = add i32 %sub7.i.us.2, %sub.neg.i.us.2
  %shr.i85.us.2 = and i32 %add.i.us.2, -65536
  %m1.sroa.0.0.insert.insert.us.2 = or disjoint i32 %shr.i85.us.2, %shr.i.us.2
  store i32 %m1.sroa.0.0.insert.insert.us.2, ptr %arrayidx11.us.2, align 4, !tbaa !7
  %add8.i.us.2 = add i32 %15, %sub.i.us.2
  %shr.i97.us.2 = lshr i32 %add8.i.us.2, 16
  %add.i107.us.2 = sub nsw i32 %mul3.i.us.2, %mul6.i.us.2
  %add7.i108.us.2 = add i32 %add.i107.us.2, %sub.neg.i.us.2
  %shr.i109.us.2 = and i32 %add7.i108.us.2, -65536
  %m2.sroa.0.0.insert.insert.us.2 = or disjoint i32 %shr.i97.us.2, %shr.i109.us.2
  store i32 %m2.sroa.0.0.insert.insert.us.2, ptr %12, align 4, !tbaa !7
  %inc.us.2 = add nsw i32 %ia.1118.us, 3
  %16 = getelementptr i32, ptr %data, i32 %inc.us.2
  %arrayidx11.us.3 = getelementptr i32, ptr %16, i32 %N2.0123
  %17 = load i32, ptr %arrayidx11.us.3, align 4, !tbaa !7
  %18 = load i32, ptr %16, align 4, !tbaa !7
  %sext.us.3 = shl i32 %18, 16
  %conv.i.us.3 = ashr exact i32 %sext.us.3, 16
  %mul.i.us.3 = mul nsw i32 %conv.i.us.3, 32767
  %sext112.us.3 = shl i32 %17, 16
  %conv2.i.us.3 = ashr exact i32 %sext112.us.3, 16
  %conv5.i.us.3 = ashr i32 %17, 16
  %mul3.neg.i.us.3 = mul nsw i32 %conv2.i.us.3, %conv1.i.us
  %mul6.neg.i.us.3 = mul nsw i32 %conv5.i.us.3, %conv4.i.us
  %sub.i.us.3 = add nsw i32 %mul.i.us.3, 32767
  %19 = add i32 %mul3.neg.i.us.3, %mul6.neg.i.us.3
  %add7.i.us.3 = sub i32 %sub.i.us.3, %19
  %shr.i.us.3 = lshr i32 %add7.i.us.3, 16
  %conv.i79.us.3 = ashr i32 %18, 16
  %mul.i80.us.3 = mul nsw i32 %conv.i79.us.3, 32767
  %mul3.i.us.3 = mul nsw i32 %conv5.i.us.3, %conv1.i.us
  %mul6.i.us.3 = mul nsw i32 %conv2.i.us.3, %conv4.i.us
  %sub.neg.i.us.3 = add nsw i32 %mul.i80.us.3, 32767
  %sub7.i.us.3 = sub nsw i32 %mul6.i.us.3, %mul3.i.us.3
  %add.i.us.3 = add i32 %sub7.i.us.3, %sub.neg.i.us.3
  %shr.i85.us.3 = and i32 %add.i.us.3, -65536
  %m1.sroa.0.0.insert.insert.us.3 = or disjoint i32 %shr.i85.us.3, %shr.i.us.3
  store i32 %m1.sroa.0.0.insert.insert.us.3, ptr %arrayidx11.us.3, align 4, !tbaa !7
  %add8.i.us.3 = add i32 %19, %sub.i.us.3
  %shr.i97.us.3 = lshr i32 %add8.i.us.3, 16
  %add.i107.us.3 = sub nsw i32 %mul3.i.us.3, %mul6.i.us.3
  %add7.i108.us.3 = add i32 %add.i107.us.3, %sub.neg.i.us.3
  %shr.i109.us.3 = and i32 %add7.i108.us.3, -65536
  %m2.sroa.0.0.insert.insert.us.3 = or disjoint i32 %shr.i97.us.3, %shr.i109.us.3
  store i32 %m2.sroa.0.0.insert.insert.us.3, ptr %16, align 4, !tbaa !7
  %inc.us.3 = add nsw i32 %ia.1118.us, 4
  %inc41.us.3 = add nuw nsw i32 %i.0117.us, 4
  %niter.next.3 = add i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa.loopexit, label %for.body10.us, !llvm.loop !9

for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa.loopexit: ; preds = %for.body10.us
  %inc.us.lcssa.ph.ph = phi i32 [ %inc.us.3, %for.body10.us ]
  %ia.1118.us.unr.ph = phi i32 [ %inc.us.3, %for.body10.us ]
  %i.0117.us.unr.ph = phi i32 [ %inc41.us.3, %for.body10.us ]
  br label %for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa

for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa: ; preds = %for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa.loopexit, %for.body6.us
  %inc.us.lcssa.ph = phi i32 [ undef, %for.body6.us ], [ %inc.us.lcssa.ph.ph, %for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa.loopexit ]
  %ia.1118.us.unr = phi i32 [ %ia.0121.us, %for.body6.us ], [ %ia.1118.us.unr.ph, %for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa.loopexit ]
  %i.0117.us.unr = phi i32 [ 0, %for.body6.us ], [ %i.0117.us.unr.ph, %for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa.loopexit ]
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body10.us.epil.preheader, label %for.cond7.for.cond.cleanup9_crit_edge.us

for.body10.us.epil.preheader:                     ; preds = %for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa
  br label %for.body10.us.epil

for.body10.us.epil:                               ; preds = %for.body10.us.epil, %for.body10.us.epil.preheader
  %ia.1118.us.epil = phi i32 [ %ia.1118.us.unr, %for.body10.us.epil.preheader ], [ %inc.us.epil, %for.body10.us.epil ]
  %i.0117.us.epil = phi i32 [ %i.0117.us.unr, %for.body10.us.epil.preheader ], [ %inc41.us.epil, %for.body10.us.epil ]
  %epil.iter = phi i32 [ 0, %for.body10.us.epil.preheader ], [ %epil.iter.next, %for.body10.us.epil ]
  %20 = getelementptr i32, ptr %data, i32 %ia.1118.us.epil
  %arrayidx11.us.epil = getelementptr i32, ptr %20, i32 %N2.0123
  %21 = load i32, ptr %arrayidx11.us.epil, align 4, !tbaa !7
  %22 = load i32, ptr %20, align 4, !tbaa !7
  %sext.us.epil = shl i32 %22, 16
  %conv.i.us.epil = ashr exact i32 %sext.us.epil, 16
  %mul.i.us.epil = mul nsw i32 %conv.i.us.epil, 32767
  %sext112.us.epil = shl i32 %21, 16
  %conv2.i.us.epil = ashr exact i32 %sext112.us.epil, 16
  %conv5.i.us.epil = ashr i32 %21, 16
  %mul3.neg.i.us.epil = mul nsw i32 %conv2.i.us.epil, %conv1.i.us
  %mul6.neg.i.us.epil = mul nsw i32 %conv5.i.us.epil, %conv4.i.us
  %sub.i.us.epil = add nsw i32 %mul.i.us.epil, 32767
  %23 = add i32 %mul3.neg.i.us.epil, %mul6.neg.i.us.epil
  %add7.i.us.epil = sub i32 %sub.i.us.epil, %23
  %shr.i.us.epil = lshr i32 %add7.i.us.epil, 16
  %conv.i79.us.epil = ashr i32 %22, 16
  %mul.i80.us.epil = mul nsw i32 %conv.i79.us.epil, 32767
  %mul3.i.us.epil = mul nsw i32 %conv5.i.us.epil, %conv1.i.us
  %mul6.i.us.epil = mul nsw i32 %conv2.i.us.epil, %conv4.i.us
  %sub.neg.i.us.epil = add nsw i32 %mul.i80.us.epil, 32767
  %sub7.i.us.epil = sub nsw i32 %mul6.i.us.epil, %mul3.i.us.epil
  %add.i.us.epil = add i32 %sub7.i.us.epil, %sub.neg.i.us.epil
  %shr.i85.us.epil = and i32 %add.i.us.epil, -65536
  %m1.sroa.0.0.insert.insert.us.epil = or disjoint i32 %shr.i85.us.epil, %shr.i.us.epil
  store i32 %m1.sroa.0.0.insert.insert.us.epil, ptr %arrayidx11.us.epil, align 4, !tbaa !7
  %add8.i.us.epil = add i32 %23, %sub.i.us.epil
  %shr.i97.us.epil = lshr i32 %add8.i.us.epil, 16
  %add.i107.us.epil = sub nsw i32 %mul3.i.us.epil, %mul6.i.us.epil
  %add7.i108.us.epil = add i32 %add.i107.us.epil, %sub.neg.i.us.epil
  %shr.i109.us.epil = and i32 %add7.i108.us.epil, -65536
  %m2.sroa.0.0.insert.insert.us.epil = or disjoint i32 %shr.i97.us.epil, %shr.i109.us.epil
  store i32 %m2.sroa.0.0.insert.insert.us.epil, ptr %20, align 4, !tbaa !7
  %inc.us.epil = add nsw i32 %ia.1118.us.epil, 1
  %inc41.us.epil = add nuw nsw i32 %i.0117.us.epil, 1
  %exitcond.not.epil = icmp eq i32 %inc41.us.epil, %N2.0123
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp = icmp ne i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp, label %for.body10.us.epil, label %for.cond7.for.cond.cleanup9_crit_edge.us.epilog-lcssa, !llvm.loop !12

for.cond7.for.cond.cleanup9_crit_edge.us.epilog-lcssa: ; preds = %for.body10.us.epil
  %inc.us.lcssa.ph1 = phi i32 [ %inc.us.epil, %for.body10.us.epil ]
  br label %for.cond7.for.cond.cleanup9_crit_edge.us

for.cond7.for.cond.cleanup9_crit_edge.us:         ; preds = %for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa, %for.cond7.for.cond.cleanup9_crit_edge.us.epilog-lcssa
  %inc.us.lcssa = phi i32 [ %inc.us.lcssa.ph, %for.cond7.for.cond.cleanup9_crit_edge.us.unr-lcssa ], [ %inc.us.lcssa.ph1, %for.cond7.for.cond.cleanup9_crit_edge.us.epilog-lcssa ]
  %add42.us = add nsw i32 %inc.us.lcssa, %N2.0123
  %inc44.us = add nuw nsw i32 %j.0120.us, 1
  %exitcond128.not = icmp eq i32 %inc44.us, %ie.0125
  br i1 %exitcond128.not, label %for.cond.cleanup5.loopexit, label %for.body6.us, !llvm.loop !13

for.cond.cleanup5.loopexit:                       ; preds = %for.cond7.for.cond.cleanup9_crit_edge.us
  br label %for.cond.cleanup5

for.cond.cleanup5:                                ; preds = %for.cond.cleanup5.loopexit, %for.cond3.preheader
  %shl = shl i32 %ie.0125, 1
  %cmp.not = icmp ult i32 %N2.0123.in, 4
  br i1 %cmp.not, label %return.loopexit, label %for.cond3.preheader, !llvm.loop !14

return.loopexit:                                  ; preds = %for.cond.cleanup5
  br label %return

return:                                           ; preds = %return.loopexit, %if.end2, %if.end, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 458756, %if.end ], [ 0, %if.end2 ], [ 0, %return.loopexit ]
  ret i32 %retval.0
}

declare dso_local zeroext i1 @dsp_is_power_of_two(i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10, !15, !16}
!15 = !{!"llvm.loop.vectorize.enable", i1 true}
!16 = !{!"llvm.loop.vectorize.followup_all", !17}
!17 = distinct !{!17, !10, !18, !19}
!18 = !{!"llvm.loop.isvectorized"}
!19 = !{!"llvm.loop.unroll.enable"}
