; ModuleID = 'after_splitloopbylength.ll'
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
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup26, %for.cond1.preheader.lr.ph
  %2 = phi i32 [ %pos9.promoted, %for.cond1.preheader.lr.ph ], [ %4, %for.cond.cleanup26 ]
  %i.080 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc39, %for.cond.cleanup26 ]
  %input.addr.078 = phi ptr [ %input, %for.cond1.preheader.lr.ph ], [ %input.addr.1.lcssa, %for.cond.cleanup26 ]
  br i1 %cmp263, label %for.body4.lr.ph, label %for.cond.cleanup3

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  %3 = load ptr, ptr %delay, align 4, !tbaa !13
  br label %for.body4

for.cond.cleanup:                                 ; preds = %for.cond.cleanup26, %entry
  %result.0.lcssa = phi i32 [ 0, %entry ], [ %len, %for.cond.cleanup26 ]
  ret i32 %result.0.lcssa

for.cond1.for.cond.cleanup3_crit_edge:            ; preds = %for.body4
  store i32 %spec.select, ptr %pos, align 4, !tbaa !12
  br label %for.cond.cleanup3

for.cond.cleanup3:                                ; preds = %for.cond1.for.cond.cleanup3_crit_edge, %for.cond1.preheader
  %4 = phi i32 [ %spec.select, %for.cond1.for.cond.cleanup3_crit_edge ], [ %2, %for.cond1.preheader ]
  %input.addr.1.lcssa = phi ptr [ %incdec.ptr, %for.cond1.for.cond.cleanup3_crit_edge ], [ %input.addr.078, %for.cond1.preheader ]
  %cmp1266 = icmp slt i32 %4, %1
  br i1 %cmp1266, label %for.body14.lr.ph, label %for.cond23.preheader

for.body14.lr.ph:                                 ; preds = %for.cond.cleanup3
  %5 = load ptr, ptr %fir, align 4, !tbaa !14
  %6 = load ptr, ptr %delay, align 4, !tbaa !13
  %7 = sub i32 %1, %4
  br label %for.body14

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph
  %8 = phi i32 [ %2, %for.body4.lr.ph ], [ %spec.select, %for.body4 ]
  %k.065 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc8, %for.body4 ]
  %input.addr.164 = phi ptr [ %input.addr.078, %for.body4.lr.ph ], [ %incdec.ptr, %for.body4 ]
  %incdec.ptr = getelementptr inbounds float, ptr %input.addr.164, i32 1
  %9 = load float, ptr %input.addr.164, align 4, !tbaa !15
  %inc = add nsw i32 %8, 1
  %arrayidx = getelementptr inbounds float, ptr %3, i32 %8
  store float %9, ptr %arrayidx, align 4, !tbaa !15
  %cmp6.not = icmp slt i32 %inc, %1
  %spec.select = select i1 %cmp6.not, i32 %inc, i32 0
  %inc8 = add nuw nsw i32 %k.065, 1
  %exitcond.not = icmp eq i32 %inc8, %0
  br i1 %exitcond.not, label %for.cond1.for.cond.cleanup3_crit_edge, label %for.body4, !llvm.loop !17

for.cond23.preheader:                             ; preds = %for.body14, %for.cond.cleanup3
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.cond.cleanup3 ], [ %14, %for.body14 ]
  %coeff_pos.0.lcssa = phi i32 [ 0, %for.cond.cleanup3 ], [ %7, %for.body14 ]
  %cmp2572 = icmp sgt i32 %4, 0
  br i1 %cmp2572, label %for.body27.lr.ph, label %for.cond.cleanup26

for.body27.lr.ph:                                 ; preds = %for.cond23.preheader
  %10 = load ptr, ptr %fir, align 4, !tbaa !14
  %11 = load ptr, ptr %delay, align 4, !tbaa !13
  br label %for.body27

for.body14:                                       ; preds = %for.body14, %for.body14.lr.ph
  %n.069 = phi i32 [ %4, %for.body14.lr.ph ], [ %inc20, %for.body14 ]
  %coeff_pos.068 = phi i32 [ 0, %for.body14.lr.ph ], [ %inc15, %for.body14 ]
  %acc.067 = phi float [ 0.000000e+00, %for.body14.lr.ph ], [ %14, %for.body14 ]
  %inc15 = add nuw i32 %coeff_pos.068, 1
  %arrayidx16 = getelementptr inbounds float, ptr %5, i32 %coeff_pos.068
  %12 = load float, ptr %arrayidx16, align 4, !tbaa !15
  %arrayidx18 = getelementptr inbounds float, ptr %6, i32 %n.069
  %13 = load float, ptr %arrayidx18, align 4, !tbaa !15
  %14 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %acc.067)
  %inc20 = add nsw i32 %n.069, 1
  %exitcond83.not = icmp eq i32 %inc15, %7
  br i1 %exitcond83.not, label %for.cond23.preheader, label %for.body14, !llvm.loop !19

for.cond.cleanup26:                               ; preds = %for.body27, %for.cond23.preheader
  %acc.1.lcssa = phi float [ %acc.0.lcssa, %for.cond23.preheader ], [ %17, %for.body27 ]
  %inc39 = add nuw nsw i32 %i.080, 1
  %arrayidx37 = getelementptr inbounds float, ptr %output, i32 %i.080
  store float %acc.1.lcssa, ptr %arrayidx37, align 4, !tbaa !15
  %exitcond85.not = icmp eq i32 %inc39, %len
  br i1 %exitcond85.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !20

for.body27:                                       ; preds = %for.body27, %for.body27.lr.ph
  %n22.075 = phi i32 [ 0, %for.body27.lr.ph ], [ %inc34, %for.body27 ]
  %coeff_pos.174 = phi i32 [ %coeff_pos.0.lcssa, %for.body27.lr.ph ], [ %inc29, %for.body27 ]
  %acc.173 = phi float [ %acc.0.lcssa, %for.body27.lr.ph ], [ %17, %for.body27 ]
  %inc29 = add nuw nsw i32 %coeff_pos.174, 1
  %arrayidx30 = getelementptr inbounds float, ptr %10, i32 %coeff_pos.174
  %15 = load float, ptr %arrayidx30, align 4, !tbaa !15
  %arrayidx32 = getelementptr inbounds float, ptr %11, i32 %n22.075
  %16 = load float, ptr %arrayidx32, align 4, !tbaa !15
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %acc.173)
  %inc34 = add nuw nsw i32 %n22.075, 1
  %exitcond84.not = icmp eq i32 %inc34, %4
  br i1 %exitcond84.not, label %for.cond.cleanup26, label %for.body27, !llvm.loop !21
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc)"}
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
!14 = !{!5, !6, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !7, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = distinct !{!19, !18}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
