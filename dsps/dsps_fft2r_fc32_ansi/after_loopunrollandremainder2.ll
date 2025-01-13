; ModuleID = 'after_loopunrollandremainder.ll'
source_filename = "dsps_fft2r_fc32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

@dsps_fft2r_initialized = external dso_local local_unnamed_addr global i8, align 1

; Function Attrs: nounwind
define dso_local noundef i32 @dsps_fft2r_fc32_arp4_(ptr noalias nocapture noundef %data, i32 noundef %N, ptr noalias nocapture noundef readonly %w) local_unnamed_addr #0 {
entry:
  %call = tail call zeroext i1 @dsp_is_power_of_two(i32 noundef %N) #3
  br i1 %call, label %if.end, label %return

if.end:                                           ; preds = %entry
  %0 = load i8, ptr @dsps_fft2r_initialized, align 1, !tbaa !4
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %return, label %if.end2

if.end2:                                          ; preds = %if.end
  %cmp103 = icmp sgt i32 %N, 1
  br i1 %cmp103, label %for.cond3.preheader, label %return

for.cond3.preheader:                              ; preds = %if.end2, %for.cond.cleanup5
  %N2.0105.in = phi i32 [ %N2.0105, %for.cond.cleanup5 ], [ %N, %if.end2 ]
  %ie.0104 = phi i32 [ %shl, %for.cond.cleanup5 ], [ 1, %if.end2 ]
  %N2.0105 = lshr i32 %N2.0105.in, 1
  %cmp4100 = icmp sgt i32 %ie.0104, 0
  br i1 %cmp4100, label %for.body6.lr.ph, label %for.cond.cleanup5

for.body6.lr.ph:                                  ; preds = %for.cond3.preheader
  %sub3 = add nsw i32 %N2.0105, -3
  %and = and i32 %N2.0105, 1073741820
  %cmp1097.not = icmp ugt i32 %N2.0105.in, 7
  br i1 %cmp1097.not, label %for.body6.lr.ph.split.us, label %for.body6.lr.ph.split

for.body6.lr.ph.split.us:                         ; preds = %for.body6.lr.ph
  %.not36 = icmp eq i32 %and, %N2.0105
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.cond.cleanup11.us, %for.body6.lr.ph.split.us
  %j.0102.us = phi i32 [ 0, %for.body6.lr.ph.split.us ], [ %inc54.us, %for.cond.cleanup11.us ]
  %ia.0101.us = phi i32 [ 0, %for.body6.lr.ph.split.us ], [ %add52.us, %for.cond.cleanup11.us ]
  %mul.us = shl nuw nsw i32 %j.0102.us, 1
  %arrayidx.us = getelementptr inbounds float, ptr %w, i32 %mul.us
  %1 = load float, ptr %arrayidx.us, align 4, !tbaa !7
  %add.us = or disjoint i32 %mul.us, 1
  %arrayidx8.us = getelementptr inbounds float, ptr %w, i32 %add.us
  %2 = load float, ptr %arrayidx8.us, align 4, !tbaa !7
  %3 = fneg float %2
  br label %for.body12.3.us

for.body12.3.us:                                  ; preds = %for.body6.us, %for.body12.3.us
  %i.099.us = phi i32 [ %inc51.3.us, %for.body12.3.us ], [ 0, %for.body6.us ]
  %ia.198.us = phi i32 [ %inc.3.us, %for.body12.3.us ], [ %ia.0101.us, %for.body6.us ]
  %add13.us = add nsw i32 %ia.198.us, %N2.0105
  %inc.us = add nsw i32 %ia.198.us, 1
  %add13.1.us = add nsw i32 %inc.us, %N2.0105
  %inc.1.us = add nsw i32 %ia.198.us, 2
  %add13.2.us = add nsw i32 %inc.1.us, %N2.0105
  %inc.2.us = add nsw i32 %ia.198.us, 3
  %add13.3.us = add nsw i32 %inc.2.us, %N2.0105
  %inc.3.us = add nsw i32 %ia.198.us, 4
  %inc51.3.us = add nuw nsw i32 %i.099.us, 4
  %mul14.us = shl nsw i32 %add13.us, 1
  %mul28.us = shl nsw i32 %ia.198.us, 1
  %mul14.1.us = shl nsw i32 %add13.1.us, 1
  %mul28.1.us = shl nsw i32 %inc.us, 1
  %mul14.2.us = shl nsw i32 %add13.2.us, 1
  %mul28.2.us = shl nsw i32 %inc.1.us, 1
  %mul14.3.us = shl nsw i32 %add13.3.us, 1
  %mul28.3.us = shl nsw i32 %inc.2.us, 1
  %add18.us = or disjoint i32 %mul14.us, 1
  %add33.us = or disjoint i32 %mul28.us, 1
  %add18.1.us = or disjoint i32 %mul14.1.us, 1
  %add33.1.us = or disjoint i32 %mul28.1.us, 1
  %add18.2.us = or disjoint i32 %mul14.2.us, 1
  %add33.2.us = or disjoint i32 %mul28.2.us, 1
  %add18.3.us = or disjoint i32 %mul14.3.us, 1
  %add33.3.us = or disjoint i32 %mul28.3.us, 1
  %arrayidx15.us = getelementptr inbounds float, ptr %data, i32 %mul14.us
  %arrayidx19.us = getelementptr inbounds float, ptr %data, i32 %add18.us
  %arrayidx29.us = getelementptr inbounds float, ptr %data, i32 %mul28.us
  %arrayidx34.us = getelementptr inbounds float, ptr %data, i32 %add33.us
  %arrayidx15.1.us = getelementptr inbounds float, ptr %data, i32 %mul14.1.us
  %arrayidx19.1.us = getelementptr inbounds float, ptr %data, i32 %add18.1.us
  %arrayidx29.1.us = getelementptr inbounds float, ptr %data, i32 %mul28.1.us
  %arrayidx34.1.us = getelementptr inbounds float, ptr %data, i32 %add33.1.us
  %arrayidx15.2.us = getelementptr inbounds float, ptr %data, i32 %mul14.2.us
  %arrayidx19.2.us = getelementptr inbounds float, ptr %data, i32 %add18.2.us
  %arrayidx29.2.us = getelementptr inbounds float, ptr %data, i32 %mul28.2.us
  %arrayidx34.2.us = getelementptr inbounds float, ptr %data, i32 %add33.2.us
  %arrayidx15.3.us = getelementptr inbounds float, ptr %data, i32 %mul14.3.us
  %arrayidx19.3.us = getelementptr inbounds float, ptr %data, i32 %add18.3.us
  %arrayidx29.3.us = getelementptr inbounds float, ptr %data, i32 %mul28.3.us
  %arrayidx34.3.us = getelementptr inbounds float, ptr %data, i32 %add33.3.us
  %4 = load float, ptr %arrayidx15.us, align 4, !tbaa !7
  %5 = load float, ptr %arrayidx19.us, align 4, !tbaa !7
  %6 = load float, ptr %arrayidx29.us, align 4, !tbaa !7
  %7 = load float, ptr %arrayidx34.us, align 4, !tbaa !7
  %8 = load float, ptr %arrayidx15.1.us, align 4, !tbaa !7
  %9 = load float, ptr %arrayidx19.1.us, align 4, !tbaa !7
  %10 = load float, ptr %arrayidx29.1.us, align 4, !tbaa !7
  %11 = load float, ptr %arrayidx34.1.us, align 4, !tbaa !7
  %12 = load float, ptr %arrayidx15.2.us, align 4, !tbaa !7
  %13 = load float, ptr %arrayidx19.2.us, align 4, !tbaa !7
  %14 = load float, ptr %arrayidx29.2.us, align 4, !tbaa !7
  %15 = load float, ptr %arrayidx34.2.us, align 4, !tbaa !7
  %16 = load float, ptr %arrayidx15.3.us, align 4, !tbaa !7
  %17 = load float, ptr %arrayidx19.3.us, align 4, !tbaa !7
  %18 = load float, ptr %arrayidx29.3.us, align 4, !tbaa !7
  %19 = load float, ptr %arrayidx34.3.us, align 4, !tbaa !7
  %mul20.us = fmul float %2, %5
  %neg.us = fmul float %4, %3
  %mul20.1.us = fmul float %2, %9
  %neg.1.us = fmul float %8, %3
  %mul20.2.us = fmul float %2, %13
  %neg.2.us = fmul float %12, %3
  %mul20.3.us = fmul float %2, %17
  %neg.3.us = fmul float %16, %3
  %20 = tail call float @llvm.fmuladd.f32(float %1, float %4, float %mul20.us)
  %21 = tail call float @llvm.fmuladd.f32(float %1, float %5, float %neg.us)
  %22 = tail call float @llvm.fmuladd.f32(float %1, float %8, float %mul20.1.us)
  %23 = tail call float @llvm.fmuladd.f32(float %1, float %9, float %neg.1.us)
  %24 = tail call float @llvm.fmuladd.f32(float %1, float %12, float %mul20.2.us)
  %25 = tail call float @llvm.fmuladd.f32(float %1, float %13, float %neg.2.us)
  %26 = tail call float @llvm.fmuladd.f32(float %1, float %16, float %mul20.3.us)
  %27 = tail call float @llvm.fmuladd.f32(float %1, float %17, float %neg.3.us)
  %add41.us = fadd float %6, %20
  %add47.us = fadd float %21, %7
  %add41.1.us = fadd float %10, %22
  %add47.1.us = fadd float %23, %11
  %add41.2.us = fadd float %14, %24
  %add47.2.us = fadd float %25, %15
  %add41.3.us = fadd float %18, %26
  %add47.3.us = fadd float %27, %19
  %sub.us = fsub float %6, %20
  %sub35.us = fsub float %7, %21
  %sub.1.us = fsub float %10, %22
  %sub35.1.us = fsub float %11, %23
  %sub.2.us = fsub float %14, %24
  %sub35.2.us = fsub float %15, %25
  %sub.3.us = fsub float %18, %26
  %sub35.3.us = fsub float %19, %27
  store float %sub.us, ptr %arrayidx15.us, align 4, !tbaa !7
  store float %sub35.us, ptr %arrayidx19.us, align 4, !tbaa !7
  store float %add41.us, ptr %arrayidx29.us, align 4, !tbaa !7
  store float %add47.us, ptr %arrayidx34.us, align 4, !tbaa !7
  store float %sub.1.us, ptr %arrayidx15.1.us, align 4, !tbaa !7
  store float %sub35.1.us, ptr %arrayidx19.1.us, align 4, !tbaa !7
  store float %add41.1.us, ptr %arrayidx29.1.us, align 4, !tbaa !7
  store float %add47.1.us, ptr %arrayidx34.1.us, align 4, !tbaa !7
  store float %sub.2.us, ptr %arrayidx15.2.us, align 4, !tbaa !7
  store float %sub35.2.us, ptr %arrayidx19.2.us, align 4, !tbaa !7
  store float %add41.2.us, ptr %arrayidx29.2.us, align 4, !tbaa !7
  store float %add47.2.us, ptr %arrayidx34.2.us, align 4, !tbaa !7
  store float %sub.3.us, ptr %arrayidx15.3.us, align 4, !tbaa !7
  store float %sub35.3.us, ptr %arrayidx19.3.us, align 4, !tbaa !7
  store float %add41.3.us, ptr %arrayidx29.3.us, align 4, !tbaa !7
  store float %add47.3.us, ptr %arrayidx34.3.us, align 4, !tbaa !7
  %exitcond.not.3.us = icmp slt i32 %inc51.3.us, %sub3
  br i1 %exitcond.not.3.us, label %for.body12.3.us, label %for.cond.preheader.loopexit.us, !llvm.loop !9

for.body12.clone.us:                              ; preds = %for.cond.preheader.loopexit.us, %for.body12.clone.us
  %i.099.clone.us = phi i32 [ %inc51.clone.us, %for.body12.clone.us ], [ %and, %for.cond.preheader.loopexit.us ]
  %ia.198.clone.us = phi i32 [ %inc.clone.us, %for.body12.clone.us ], [ %inc.3.us, %for.cond.preheader.loopexit.us ]
  %add13.clone.us = add nsw i32 %ia.198.clone.us, %N2.0105
  %inc.clone.us = add nsw i32 %ia.198.clone.us, 1
  %inc51.clone.us = add nuw nsw i32 %i.099.clone.us, 1
  %mul14.clone.us = shl nsw i32 %add13.clone.us, 1
  %mul28.clone.us = shl nsw i32 %ia.198.clone.us, 1
  %add18.clone.us = or disjoint i32 %mul14.clone.us, 1
  %add33.clone.us = or disjoint i32 %mul28.clone.us, 1
  %arrayidx15.clone.us = getelementptr inbounds float, ptr %data, i32 %mul14.clone.us
  %arrayidx19.clone.us = getelementptr inbounds float, ptr %data, i32 %add18.clone.us
  %arrayidx29.clone.us = getelementptr inbounds float, ptr %data, i32 %mul28.clone.us
  %arrayidx34.clone.us = getelementptr inbounds float, ptr %data, i32 %add33.clone.us
  %28 = load float, ptr %arrayidx15.clone.us, align 4, !tbaa !7
  %29 = load float, ptr %arrayidx19.clone.us, align 4, !tbaa !7
  %30 = load float, ptr %arrayidx29.clone.us, align 4, !tbaa !7
  %31 = load float, ptr %arrayidx34.clone.us, align 4, !tbaa !7
  %mul20.clone.us = fmul float %2, %29
  %neg.clone.us = fmul float %28, %3
  %32 = tail call float @llvm.fmuladd.f32(float %1, float %28, float %mul20.clone.us)
  %33 = tail call float @llvm.fmuladd.f32(float %1, float %29, float %neg.clone.us)
  %add41.clone.us = fadd float %30, %32
  %add47.clone.us = fadd float %33, %31
  %sub.clone.us = fsub float %30, %32
  %sub35.clone.us = fsub float %31, %33
  store float %sub.clone.us, ptr %arrayidx15.clone.us, align 4, !tbaa !7
  store float %sub35.clone.us, ptr %arrayidx19.clone.us, align 4, !tbaa !7
  store float %add41.clone.us, ptr %arrayidx29.clone.us, align 4, !tbaa !7
  store float %add47.clone.us, ptr %arrayidx34.clone.us, align 4, !tbaa !7
  %exitcond.not.clone.us = icmp eq i32 %inc51.clone.us, %N2.0105
  br i1 %exitcond.not.clone.us, label %for.cond.cleanup11.us, label %for.body12.clone.us

for.cond.cleanup11.us:                            ; preds = %for.body12.clone.us, %for.cond.preheader.loopexit.us
  %34 = phi i32 [ %inc.3.us, %for.cond.preheader.loopexit.us ], [ %inc.clone.us, %for.body12.clone.us ]
  %add52.us = add nsw i32 %34, %N2.0105
  %inc54.us = add nuw nsw i32 %j.0102.us, 1
  %exitcond106.not.us = icmp eq i32 %inc54.us, %ie.0104
  br i1 %exitcond106.not.us, label %for.cond.cleanup5, label %for.body6.us, !llvm.loop !11

for.cond.preheader.loopexit.us:                   ; preds = %for.body12.3.us
  br i1 %.not36, label %for.cond.cleanup11.us, label %for.body12.clone.us

for.body6.lr.ph.split:                            ; preds = %for.body6.lr.ph
  %.not = icmp ult i32 %N2.0105.in, 2
  br i1 %.not, label %return, label %for.body6.us1

for.body6.us1:                                    ; preds = %for.body6.lr.ph.split, %for.cond.cleanup11.loopexit.us34
  %j.0102.us2 = phi i32 [ %inc54.us31, %for.cond.cleanup11.loopexit.us34 ], [ 0, %for.body6.lr.ph.split ]
  %ia.0101.us3 = phi i32 [ %add52.us30, %for.cond.cleanup11.loopexit.us34 ], [ 0, %for.body6.lr.ph.split ]
  %mul.us4 = shl nuw nsw i32 %j.0102.us2, 1
  %arrayidx.us5 = getelementptr inbounds float, ptr %w, i32 %mul.us4
  %35 = load float, ptr %arrayidx.us5, align 4, !tbaa !7
  %add.us6 = or disjoint i32 %mul.us4, 1
  %arrayidx8.us7 = getelementptr inbounds float, ptr %w, i32 %add.us6
  %36 = load float, ptr %arrayidx8.us7, align 4, !tbaa !7
  %37 = fneg float %36
  br label %for.body12.clone.us8

for.body12.clone.us8:                             ; preds = %for.body6.us1, %for.body12.clone.us8
  %i.099.clone.us9 = phi i32 [ %inc51.clone.us13, %for.body12.clone.us8 ], [ 0, %for.body6.us1 ]
  %ia.198.clone.us10 = phi i32 [ %inc.clone.us12, %for.body12.clone.us8 ], [ %ia.0101.us3, %for.body6.us1 ]
  %add13.clone.us11 = add nsw i32 %ia.198.clone.us10, %N2.0105
  %inc.clone.us12 = add nsw i32 %ia.198.clone.us10, 1
  %inc51.clone.us13 = add nuw nsw i32 %i.099.clone.us9, 1
  %mul14.clone.us14 = shl nsw i32 %add13.clone.us11, 1
  %mul28.clone.us15 = shl nsw i32 %ia.198.clone.us10, 1
  %add18.clone.us16 = or disjoint i32 %mul14.clone.us14, 1
  %add33.clone.us17 = or disjoint i32 %mul28.clone.us15, 1
  %arrayidx15.clone.us18 = getelementptr inbounds float, ptr %data, i32 %mul14.clone.us14
  %arrayidx19.clone.us19 = getelementptr inbounds float, ptr %data, i32 %add18.clone.us16
  %arrayidx29.clone.us20 = getelementptr inbounds float, ptr %data, i32 %mul28.clone.us15
  %arrayidx34.clone.us21 = getelementptr inbounds float, ptr %data, i32 %add33.clone.us17
  %38 = load float, ptr %arrayidx15.clone.us18, align 4, !tbaa !7
  %39 = load float, ptr %arrayidx19.clone.us19, align 4, !tbaa !7
  %40 = load float, ptr %arrayidx29.clone.us20, align 4, !tbaa !7
  %41 = load float, ptr %arrayidx34.clone.us21, align 4, !tbaa !7
  %mul20.clone.us22 = fmul float %36, %39
  %neg.clone.us23 = fmul float %38, %37
  %42 = tail call float @llvm.fmuladd.f32(float %35, float %38, float %mul20.clone.us22)
  %43 = tail call float @llvm.fmuladd.f32(float %35, float %39, float %neg.clone.us23)
  %add41.clone.us24 = fadd float %40, %42
  %add47.clone.us25 = fadd float %43, %41
  %sub.clone.us26 = fsub float %40, %42
  %sub35.clone.us27 = fsub float %41, %43
  store float %sub.clone.us26, ptr %arrayidx15.clone.us18, align 4, !tbaa !7
  store float %sub35.clone.us27, ptr %arrayidx19.clone.us19, align 4, !tbaa !7
  store float %add41.clone.us24, ptr %arrayidx29.clone.us20, align 4, !tbaa !7
  store float %add47.clone.us25, ptr %arrayidx34.clone.us21, align 4, !tbaa !7
  %exitcond.not.clone.us28 = icmp eq i32 %inc51.clone.us13, %N2.0105
  br i1 %exitcond.not.clone.us28, label %for.cond.cleanup11.loopexit.us34, label %for.body12.clone.us8

for.cond.cleanup11.loopexit.us34:                 ; preds = %for.body12.clone.us8
  %add52.us30 = add nsw i32 %inc.clone.us12, %N2.0105
  %inc54.us31 = add nuw nsw i32 %j.0102.us2, 1
  %exitcond106.not.us32 = icmp eq i32 %inc54.us31, %ie.0104
  br i1 %exitcond106.not.us32, label %for.cond.cleanup5, label %for.body6.us1, !llvm.loop !11

for.cond.cleanup5:                                ; preds = %for.cond.cleanup11.loopexit.us34, %for.cond.cleanup11.us, %for.cond3.preheader
  %shl = shl i32 %ie.0104, 1
  %cmp.not = icmp ult i32 %N2.0105.in, 4
  br i1 %cmp.not, label %return, label %for.cond3.preheader, !llvm.loop !12

return:                                           ; preds = %for.body6.lr.ph.split, %for.cond.cleanup5, %if.end2, %if.end, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 458756, %if.end ], [ 0, %if.end2 ], [ 0, %for.cond.cleanup5 ], [ 0, %for.body6.lr.ph.split ]
  ret i32 %retval.0
}

declare dso_local zeroext i1 @dsp_is_power_of_two(i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !5, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
