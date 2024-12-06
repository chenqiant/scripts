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
  br i1 %cmp122, label %for.cond3.preheader, label %return

for.cond3.preheader:                              ; preds = %for.cond.cleanup5, %if.end2
  %ie.0125 = phi i32 [ %shl, %for.cond.cleanup5 ], [ 1, %if.end2 ]
  %N2.0123.in = phi i32 [ %N2.0123, %for.cond.cleanup5 ], [ %N, %if.end2 ]
  %N2.0123 = lshr i32 %N2.0123.in, 1
  %cmp4119 = icmp sgt i32 %ie.0125, 0
  %cmp8116 = icmp ugt i32 %N2.0123.in, 1
  %or.cond = select i1 %cmp4119, i1 %cmp8116, i1 false
  br i1 %or.cond, label %for.body6.us, label %for.cond.cleanup5

for.body6.us:                                     ; preds = %for.cond7.for.cond.cleanup9_crit_edge.us, %for.cond3.preheader
  %ia.0121.us = phi i32 [ %add42.us, %for.cond7.for.cond.cleanup9_crit_edge.us ], [ 0, %for.cond3.preheader ]
  %j.0120.us = phi i32 [ %inc44.us, %for.cond7.for.cond.cleanup9_crit_edge.us ], [ 0, %for.cond3.preheader ]
  %arrayidx.us = getelementptr inbounds i32, ptr %sc_table, i32 %j.0120.us
  %1 = load i32, ptr %arrayidx.us, align 4, !tbaa !7
  %sext111.us = shl i32 %1, 16
  %conv1.i.us = ashr exact i32 %sext111.us, 16
  %conv4.i.us = ashr i32 %1, 16
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us, %for.body6.us
  %ia.1118.us = phi i32 [ %ia.0121.us, %for.body6.us ], [ %inc.us, %for.body10.us ]
  %i.0117.us = phi i32 [ 0, %for.body6.us ], [ %inc41.us, %for.body10.us ]
  %2 = getelementptr i32, ptr %data, i32 %ia.1118.us
  %arrayidx11.us = getelementptr i32, ptr %2, i32 %N2.0123
  %3 = load i32, ptr %arrayidx11.us, align 4, !tbaa !7
  %4 = load i32, ptr %2, align 4, !tbaa !7
  %sext.us = shl i32 %4, 16
  %conv.i.us = ashr exact i32 %sext.us, 16
  %mul.i.us = mul nsw i32 %conv.i.us, 32767
  %sext112.us = shl i32 %3, 16
  %conv2.i.us = ashr exact i32 %sext112.us, 16
  %conv5.i.us = ashr i32 %3, 16
  %mul3.neg.i.us = mul nsw i32 %conv2.i.us, %conv1.i.us
  %mul6.neg.i.us = mul nsw i32 %conv5.i.us, %conv4.i.us
  %sub.i.us = add nsw i32 %mul.i.us, 32767
  %5 = add i32 %mul3.neg.i.us, %mul6.neg.i.us
  %add7.i.us = sub i32 %sub.i.us, %5
  %shr.i.us = lshr i32 %add7.i.us, 16
  %conv.i79.us = ashr i32 %4, 16
  %mul.i80.us = mul nsw i32 %conv.i79.us, 32767
  %mul3.i.us = mul nsw i32 %conv5.i.us, %conv1.i.us
  %mul6.i.us = mul nsw i32 %conv2.i.us, %conv4.i.us
  %sub.neg.i.us = add nsw i32 %mul.i80.us, 32767
  %sub7.i.us = sub nsw i32 %mul6.i.us, %mul3.i.us
  %add.i.us = add i32 %sub7.i.us, %sub.neg.i.us
  %shr.i85.us = and i32 %add.i.us, -65536
  %m1.sroa.0.0.insert.insert.us = or disjoint i32 %shr.i85.us, %shr.i.us
  store i32 %m1.sroa.0.0.insert.insert.us, ptr %arrayidx11.us, align 4, !tbaa !7
  %add8.i.us = add i32 %5, %sub.i.us
  %shr.i97.us = lshr i32 %add8.i.us, 16
  %add.i107.us = sub nsw i32 %mul3.i.us, %mul6.i.us
  %add7.i108.us = add i32 %add.i107.us, %sub.neg.i.us
  %shr.i109.us = and i32 %add7.i108.us, -65536
  %m2.sroa.0.0.insert.insert.us = or disjoint i32 %shr.i97.us, %shr.i109.us
  store i32 %m2.sroa.0.0.insert.insert.us, ptr %2, align 4, !tbaa !7
  %inc.us = add nsw i32 %ia.1118.us, 1
  %inc41.us = add nuw nsw i32 %i.0117.us, 1
  %exitcond.not = icmp eq i32 %inc41.us, %N2.0123
  br i1 %exitcond.not, label %for.cond7.for.cond.cleanup9_crit_edge.us, label %for.body10.us, !llvm.loop !9

for.cond7.for.cond.cleanup9_crit_edge.us:         ; preds = %for.body10.us
  %add42.us = add nsw i32 %inc.us, %N2.0123
  %inc44.us = add nuw nsw i32 %j.0120.us, 1
  %exitcond128.not = icmp eq i32 %inc44.us, %ie.0125
  br i1 %exitcond128.not, label %for.cond.cleanup5, label %for.body6.us, !llvm.loop !11

for.cond.cleanup5:                                ; preds = %for.cond7.for.cond.cleanup9_crit_edge.us, %for.cond3.preheader
  %shl = shl i32 %ie.0125, 1
  %cmp.not = icmp ult i32 %N2.0123.in, 4
  br i1 %cmp.not, label %return, label %for.cond3.preheader, !llvm.loop !12

return:                                           ; preds = %for.cond.cleanup5, %if.end2, %if.end, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 458756, %if.end ], [ 0, %if.end2 ], [ 0, %for.cond.cleanup5 ]
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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10, !13, !14}
!13 = !{!"llvm.loop.vectorize.enable", i1 true}
!14 = !{!"llvm.loop.vectorize.followup_all", !15}
!15 = distinct !{!15, !10, !16, !17}
!16 = !{!"llvm.loop.isvectorized"}
!17 = !{!"llvm.loop.unroll.enable"}
