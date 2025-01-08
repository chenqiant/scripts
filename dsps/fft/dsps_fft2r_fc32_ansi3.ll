; ModuleID = 'dsps_fft2r_fc32_ansi.c'
source_filename = "dsps_fft2r_fc32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

@dsps_fft2r_initialized = dso_local local_unnamed_addr global i8 0, align 1

; Function Attrs: nounwind
define dso_local noundef i32 @dsps_fft2r_fc32_ansi_(ptr nocapture noundef %data, i32 noundef %N, ptr nocapture noundef readonly %w) local_unnamed_addr #0 {
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
  %N2.0106.in = phi i32 [ %N2.0106, %for.cond.cleanup5 ], [ %N, %if.end2 ]
  %ie.0104 = phi i32 [ %shl, %for.cond.cleanup5 ], [ 1, %if.end2 ]
  %N2.0106 = lshr i32 %N2.0106.in, 1
  %cmp4100 = icmp sgt i32 %ie.0104, 0
  %cmp1097 = icmp ugt i32 %N2.0106.in, 1
  %or.cond = select i1 %cmp4100, i1 %cmp1097, i1 false
  br i1 %or.cond, label %for.body6.us, label %for.cond.cleanup5

for.body6.us:                                     ; preds = %for.cond3.preheader, %for.cond9.for.cond.cleanup11_crit_edge.us
  %j.0102.us = phi i32 [ %inc54.us, %for.cond9.for.cond.cleanup11_crit_edge.us ], [ 0, %for.cond3.preheader ]
  %ia.0101.us = phi i32 [ %add52.us, %for.cond9.for.cond.cleanup11_crit_edge.us ], [ 0, %for.cond3.preheader ]
  %mul.us = shl nuw nsw i32 %j.0102.us, 1
  %arrayidx.us = getelementptr inbounds float, ptr %w, i32 %mul.us
  %1 = load float, ptr %arrayidx.us, align 4, !tbaa !7
  %add.us = or disjoint i32 %mul.us, 1
  %arrayidx8.us = getelementptr inbounds float, ptr %w, i32 %add.us
  %2 = load float, ptr %arrayidx8.us, align 4, !tbaa !7
  %3 = fneg float %2
  br label %for.body12.us

for.body12.us:                                    ; preds = %for.body6.us, %for.body12.us
  %i.099.us = phi i32 [ 0, %for.body6.us ], [ %inc51.us, %for.body12.us ]
  %ia.198.us = phi i32 [ %ia.0101.us, %for.body6.us ], [ %inc.us, %for.body12.us ]
  %add13.us = add nsw i32 %ia.198.us, %N2.0106
  %mul14.us = shl nsw i32 %add13.us, 1
  %arrayidx15.us = getelementptr inbounds float, ptr %data, i32 %mul14.us
  %4 = load float, ptr %arrayidx15.us, align 4, !tbaa !7
  %add18.us = or disjoint i32 %mul14.us, 1
  %arrayidx19.us = getelementptr inbounds float, ptr %data, i32 %add18.us
  %5 = load float, ptr %arrayidx19.us, align 4, !tbaa !7
  %mul20.us = fmul float %2, %5
  %6 = tail call float @llvm.fmuladd.f32(float %1, float %4, float %mul20.us)
  %neg.us = fmul float %4, %3
  %7 = tail call float @llvm.fmuladd.f32(float %1, float %5, float %neg.us)
  %mul28.us = shl nsw i32 %ia.198.us, 1
  %arrayidx29.us = getelementptr inbounds float, ptr %data, i32 %mul28.us
  %8 = load float, ptr %arrayidx29.us, align 4, !tbaa !7
  %sub.us = fsub float %8, %6
  store float %sub.us, ptr %arrayidx15.us, align 4, !tbaa !7
  %add33.us = or disjoint i32 %mul28.us, 1
  %arrayidx34.us = getelementptr inbounds float, ptr %data, i32 %add33.us
  %9 = load float, ptr %arrayidx34.us, align 4, !tbaa !7
  %sub35.us = fsub float %9, %7
  store float %sub35.us, ptr %arrayidx19.us, align 4, !tbaa !7
  %add41.us = fadd float %8, %6
  store float %add41.us, ptr %arrayidx29.us, align 4, !tbaa !7
  %add47.us = fadd float %7, %9
  store float %add47.us, ptr %arrayidx34.us, align 4, !tbaa !7
  %inc.us = add nsw i32 %ia.198.us, 1
  %inc51.us = add nuw nsw i32 %i.099.us, 1
  %exitcond.not = icmp eq i32 %inc51.us, %N2.0106
  br i1 %exitcond.not, label %for.cond9.for.cond.cleanup11_crit_edge.us, label %for.body12.us, !llvm.loop !9

for.cond9.for.cond.cleanup11_crit_edge.us:        ; preds = %for.body12.us
  %add52.us = add nsw i32 %inc.us, %N2.0106
  %inc54.us = add nuw nsw i32 %j.0102.us, 1
  %exitcond109.not = icmp eq i32 %inc54.us, %ie.0104
  br i1 %exitcond109.not, label %for.cond.cleanup5, label %for.body6.us, !llvm.loop !11

for.cond.cleanup5:                                ; preds = %for.cond9.for.cond.cleanup11_crit_edge.us, %for.cond3.preheader
  %shl = shl i32 %ie.0104, 1
  %cmp.not = icmp ult i32 %N2.0106.in, 4
  br i1 %cmp.not, label %return, label %for.cond3.preheader, !llvm.loop !12

return:                                           ; preds = %for.cond.cleanup5, %if.end2, %if.end, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 458756, %if.end ], [ 0, %if.end2 ], [ 0, %for.cond.cleanup5 ]
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
