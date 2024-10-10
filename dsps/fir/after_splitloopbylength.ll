; ModuleID = 'dsps_fir_f32_ansi.ll'
source_filename = "dsps_fir_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fir_f32_ansi(ptr nocapture noundef %fir, ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 !esp32_p4_metadata !4 {
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.cond.preheader, label %for.body.lr.ph.clone

for.cond.preheader:                               ; preds = %entry
  %cmp67 = icmp sgt i32 %len, 0
  br i1 %cmp67, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %delay = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %1 = load ptr, ptr %delay, align 4, !tbaa !5
  %pos = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %2 = load i32, ptr %N, align 4, !tbaa !12
  %.pre = load i32, ptr %pos, align 4, !tbaa !13
  br label %for.body

if.end:                                           ; preds = %for.cond.cleanup21.clone, %for.cond.cleanup21, %for.cond.preheader
  ret i32 0

for.body:                                         ; preds = %for.cond.cleanup21, %for.body.lr.ph
  %3 = phi i32 [ %.pre, %for.body.lr.ph ], [ %spec.store.select, %for.cond.cleanup21 ]
  %i.068 = phi i32 [ 0, %for.body.lr.ph ], [ %inc33, %for.cond.cleanup21 ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.068
  %4 = load float, ptr %arrayidx, align 4, !tbaa !14
  %arrayidx1 = getelementptr inbounds float, ptr %1, i32 %3
  store float %4, ptr %arrayidx1, align 4, !tbaa !14
  %inc = add nsw i32 %3, 1
  %cmp4.not = icmp slt i32 %inc, %2
  %spec.store.select = select i1 %cmp4.not, i32 %inc, i32 0
  store i32 %spec.store.select, ptr %pos, align 4
  %cmp957 = icmp slt i32 %spec.store.select, %2
  br i1 %cmp957, label %for.body11.lr.ph, label %for.cond18.preheader

for.body11.lr.ph:                                 ; preds = %for.body
  %5 = load ptr, ptr %fir, align 4, !tbaa !16
  %6 = sub i32 %2, %spec.store.select
  br label %for.body11

for.cond18.preheader:                             ; preds = %for.body11, %for.body
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.body ], [ %10, %for.body11 ]
  %coeff_pos.0.lcssa = phi i32 [ 0, %for.body ], [ %6, %for.body11 ]
  %cmp2062 = icmp sgt i32 %spec.store.select, 0
  br i1 %cmp2062, label %for.body22.lr.ph, label %for.cond.cleanup21

for.body22.lr.ph:                                 ; preds = %for.cond18.preheader
  %7 = load ptr, ptr %fir, align 4, !tbaa !16
  br label %for.body22

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph
  %n.060 = phi i32 [ %spec.store.select, %for.body11.lr.ph ], [ %inc16, %for.body11 ]
  %coeff_pos.059 = phi i32 [ 0, %for.body11.lr.ph ], [ %inc12, %for.body11 ]
  %acc.058 = phi float [ 0.000000e+00, %for.body11.lr.ph ], [ %10, %for.body11 ]
  %inc12 = add nuw i32 %coeff_pos.059, 1
  %arrayidx13 = getelementptr inbounds float, ptr %5, i32 %coeff_pos.059
  %8 = load float, ptr %arrayidx13, align 4, !tbaa !14
  %arrayidx15 = getelementptr inbounds float, ptr %1, i32 %n.060
  %9 = load float, ptr %arrayidx15, align 4, !tbaa !14
  %10 = tail call float @llvm.fmuladd.f32(float %8, float %9, float %acc.058)
  %inc16 = add nsw i32 %n.060, 1
  %exitcond.not = icmp eq i32 %inc12, %6
  br i1 %exitcond.not, label %for.cond18.preheader, label %for.body11, !llvm.loop !17

for.cond.cleanup21:                               ; preds = %for.body22, %for.cond18.preheader
  %acc.1.lcssa = phi float [ %acc.0.lcssa, %for.cond18.preheader ], [ %13, %for.body22 ]
  %arrayidx31 = getelementptr inbounds float, ptr %output, i32 %i.068
  store float %acc.1.lcssa, ptr %arrayidx31, align 4, !tbaa !14
  %inc33 = add nuw nsw i32 %i.068, 1
  %exitcond71.not = icmp eq i32 %inc33, %len
  br i1 %exitcond71.not, label %if.end, label %for.body, !llvm.loop !19

for.body22:                                       ; preds = %for.body22, %for.body22.lr.ph
  %n17.065 = phi i32 [ 0, %for.body22.lr.ph ], [ %inc29, %for.body22 ]
  %coeff_pos.164 = phi i32 [ %coeff_pos.0.lcssa, %for.body22.lr.ph ], [ %inc24, %for.body22 ]
  %acc.163 = phi float [ %acc.0.lcssa, %for.body22.lr.ph ], [ %13, %for.body22 ]
  %inc24 = add nuw nsw i32 %coeff_pos.164, 1
  %arrayidx25 = getelementptr inbounds float, ptr %7, i32 %coeff_pos.164
  %11 = load float, ptr %arrayidx25, align 4, !tbaa !14
  %arrayidx27 = getelementptr inbounds float, ptr %1, i32 %n17.065
  %12 = load float, ptr %arrayidx27, align 4, !tbaa !14
  %13 = tail call float @llvm.fmuladd.f32(float %11, float %12, float %acc.163)
  %inc29 = add nuw nsw i32 %n17.065, 1
  %exitcond70.not = icmp eq i32 %inc29, %spec.store.select
  br i1 %exitcond70.not, label %for.cond.cleanup21, label %for.body22, !llvm.loop !20

for.body.lr.ph.clone:                             ; preds = %entry
  %delay.clone = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %14 = load ptr, ptr %delay.clone, align 4, !tbaa !5
  %pos.clone = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N.clone = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %15 = load i32, ptr %N.clone, align 4, !tbaa !12
  %.pre.clone = load i32, ptr %pos.clone, align 4, !tbaa !13
  br label %for.body.clone

for.body.clone:                                   ; preds = %for.cond.cleanup21.clone, %for.body.lr.ph.clone
  %16 = phi i32 [ %.pre.clone, %for.body.lr.ph.clone ], [ %spec.store.select.clone, %for.cond.cleanup21.clone ]
  %i.068.clone = phi i32 [ 0, %for.body.lr.ph.clone ], [ %inc33.clone, %for.cond.cleanup21.clone ]
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %i.068.clone
  %17 = load float, ptr %arrayidx.clone, align 4, !tbaa !14
  %arrayidx1.clone = getelementptr inbounds float, ptr %14, i32 %16
  store float %17, ptr %arrayidx1.clone, align 4, !tbaa !14
  %inc.clone = add nsw i32 %16, 1
  %cmp4.not.clone = icmp slt i32 %inc.clone, %15
  %spec.store.select.clone = select i1 %cmp4.not.clone, i32 %inc.clone, i32 0
  store i32 %spec.store.select.clone, ptr %pos.clone, align 4
  %cmp957.clone = icmp slt i32 %spec.store.select.clone, %15
  br i1 %cmp957.clone, label %for.body11.lr.ph.clone, label %for.cond18.preheader.clone

for.body11.lr.ph.clone:                           ; preds = %for.body.clone
  %18 = load ptr, ptr %fir, align 4, !tbaa !16
  %19 = sub i32 %15, %spec.store.select.clone
  br label %for.body11.clone

for.body11.clone:                                 ; preds = %for.body11.clone, %for.body11.lr.ph.clone
  %n.060.clone = phi i32 [ %spec.store.select.clone, %for.body11.lr.ph.clone ], [ %inc16.clone, %for.body11.clone ]
  %coeff_pos.059.clone = phi i32 [ 0, %for.body11.lr.ph.clone ], [ %inc12.clone, %for.body11.clone ]
  %acc.058.clone = phi float [ 0.000000e+00, %for.body11.lr.ph.clone ], [ %22, %for.body11.clone ]
  %inc12.clone = add nuw i32 %coeff_pos.059.clone, 1
  %arrayidx13.clone = getelementptr inbounds float, ptr %18, i32 %coeff_pos.059.clone
  %20 = load float, ptr %arrayidx13.clone, align 4, !tbaa !14
  %arrayidx15.clone = getelementptr inbounds float, ptr %14, i32 %n.060.clone
  %21 = load float, ptr %arrayidx15.clone, align 4, !tbaa !14
  %22 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %acc.058.clone)
  %inc16.clone = add nsw i32 %n.060.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc12.clone, %19
  br i1 %exitcond.not.clone, label %for.cond18.preheader.clone, label %for.body11.clone, !llvm.loop !17

for.cond18.preheader.clone:                       ; preds = %for.body11.clone, %for.body.clone
  %acc.0.lcssa.clone = phi float [ 0.000000e+00, %for.body.clone ], [ %22, %for.body11.clone ]
  %coeff_pos.0.lcssa.clone = phi i32 [ 0, %for.body.clone ], [ %19, %for.body11.clone ]
  %cmp2062.clone = icmp sgt i32 %spec.store.select.clone, 0
  br i1 %cmp2062.clone, label %for.body22.lr.ph.clone, label %for.cond.cleanup21.clone

for.body22.lr.ph.clone:                           ; preds = %for.cond18.preheader.clone
  %23 = load ptr, ptr %fir, align 4, !tbaa !16
  br label %for.body22.clone

for.body22.clone:                                 ; preds = %for.body22.clone, %for.body22.lr.ph.clone
  %n17.065.clone = phi i32 [ 0, %for.body22.lr.ph.clone ], [ %inc29.clone, %for.body22.clone ]
  %coeff_pos.164.clone = phi i32 [ %coeff_pos.0.lcssa.clone, %for.body22.lr.ph.clone ], [ %inc24.clone, %for.body22.clone ]
  %acc.163.clone = phi float [ %acc.0.lcssa.clone, %for.body22.lr.ph.clone ], [ %26, %for.body22.clone ]
  %inc24.clone = add nuw nsw i32 %coeff_pos.164.clone, 1
  %arrayidx25.clone = getelementptr inbounds float, ptr %23, i32 %coeff_pos.164.clone
  %24 = load float, ptr %arrayidx25.clone, align 4, !tbaa !14
  %arrayidx27.clone = getelementptr inbounds float, ptr %14, i32 %n17.065.clone
  %25 = load float, ptr %arrayidx27.clone, align 4, !tbaa !14
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %acc.163.clone)
  %inc29.clone = add nuw nsw i32 %n17.065.clone, 1
  %exitcond70.not.clone = icmp eq i32 %inc29.clone, %spec.store.select.clone
  br i1 %exitcond70.not.clone, label %for.cond.cleanup21.clone, label %for.body22.clone, !llvm.loop !20

for.cond.cleanup21.clone:                         ; preds = %for.body22.clone, %for.cond18.preheader.clone
  %acc.1.lcssa.clone = phi float [ %acc.0.lcssa.clone, %for.cond18.preheader.clone ], [ %26, %for.body22.clone ]
  %arrayidx31.clone = getelementptr inbounds float, ptr %output, i32 %i.068.clone
  store float %acc.1.lcssa.clone, ptr %arrayidx31.clone, align 4, !tbaa !14
  %inc33.clone = add nuw nsw i32 %i.068.clone, 1
  %exitcond71.not.clone = icmp eq i32 %inc33.clone, %len
  br i1 %exitcond71.not.clone, label %if.end, label %for.body.clone, !llvm.loop !19
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-172-g9dacbc0)"}
!4 = !{!"unroll_fir_like"}
!5 = !{!6, !7, i64 4}
!6 = !{!"fir_f32_s", !7, i64 0, !7, i64 4, !10, i64 8, !10, i64 12, !10, i64 16, !11, i64 20}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"short", !8, i64 0}
!12 = !{!6, !10, i64 8}
!13 = !{!6, !10, i64 12}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !8, i64 0}
!16 = !{!6, !7, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = distinct !{!19, !18}
!20 = distinct !{!20, !18}
