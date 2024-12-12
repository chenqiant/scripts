; ModuleID = 'dspi_dotprod_s16_ansi_licm.c'
source_filename = "dspi_dotprod_s16_ansi_licm.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.image2d_s = type { ptr, i32, i32, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_dotprod_s16_ansi(ptr nocapture noundef readonly %in_image, ptr nocapture noundef readonly %filter, ptr nocapture noundef writeonly %out_value, i32 noundef %count_x, i32 noundef %count_y, i32 noundef %shift) local_unnamed_addr #0 {
entry:
  %step_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 1
  %0 = load i32, ptr %step_x, align 4, !tbaa !4
  %stride_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 3
  %1 = load i32, ptr %stride_x, align 4, !tbaa !10
  %mul = mul nsw i32 %0, %count_x
  %cmp = icmp sgt i32 %mul, %1
  br i1 %cmp, label %cleanup43, label %if.end

if.end:                                           ; preds = %entry
  %step_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 2
  %2 = load i32, ptr %step_y, align 4, !tbaa !11
  %stride_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 4
  %3 = load i32, ptr %stride_y, align 4, !tbaa !12
  %mul1 = mul nsw i32 %2, %count_y
  %cmp2 = icmp sgt i32 %mul1, %3
  br i1 %cmp2, label %cleanup43, label %if.end4

if.end4:                                          ; preds = %if.end
  %step_x5 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 1
  %4 = load i32, ptr %step_x5, align 4, !tbaa !4
  %stride_x6 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 3
  %5 = load i32, ptr %stride_x6, align 4, !tbaa !10
  %mul7 = mul nsw i32 %4, %count_x
  %cmp8 = icmp sgt i32 %mul7, %5
  br i1 %cmp8, label %cleanup43, label %if.end10

if.end10:                                         ; preds = %if.end4
  %step_y11 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 2
  %6 = load i32, ptr %step_y11, align 4, !tbaa !11
  %stride_y12 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 4
  %7 = load i32, ptr %stride_y12, align 4, !tbaa !12
  %mul13 = mul nsw i32 %6, %count_y
  %cmp14 = icmp sgt i32 %mul13, %7
  br i1 %cmp14, label %cleanup43, label %if.end16

if.end16:                                         ; preds = %if.end10
  %mul18 = mul nsw i32 %2, %1
  %mul19 = mul nsw i32 %6, %5
  %cmp2077 = icmp sgt i32 %count_y, 0
  %cmp2274 = icmp sgt i32 %count_x, 0
  %or.cond = and i1 %cmp2077, %cmp2274
  br i1 %or.cond, label %for.cond21.preheader.us.preheader, label %for.cond.cleanup

for.cond21.preheader.us.preheader:                ; preds = %if.end16
  %8 = load ptr, ptr %in_image, align 4, !tbaa !13
  %9 = load ptr, ptr %filter, align 4, !tbaa !13
  br label %for.cond21.preheader.us

for.cond21.preheader.us:                          ; preds = %for.cond21.preheader.us.preheader, %for.cond21.for.cond.cleanup23_crit_edge.us
  %y.081.us = phi i32 [ %inc33.us, %for.cond21.for.cond.cleanup23_crit_edge.us ], [ 0, %for.cond21.preheader.us.preheader ]
  %acc.080.us = phi i64 [ %add.us, %for.cond21.for.cond.cleanup23_crit_edge.us ], [ 0, %for.cond21.preheader.us.preheader ]
  %f_data.079.us = phi ptr [ %add.ptr31.us, %for.cond21.for.cond.cleanup23_crit_edge.us ], [ %9, %for.cond21.preheader.us.preheader ]
  %i_data.078.us = phi ptr [ %add.ptr.us, %for.cond21.for.cond.cleanup23_crit_edge.us ], [ %8, %for.cond21.preheader.us.preheader ]
  br label %for.body24.us

for.body24.us:                                    ; preds = %for.cond21.preheader.us, %for.body24.us
  %x.076.us = phi i32 [ 0, %for.cond21.preheader.us ], [ %inc.us, %for.body24.us ]
  %acc.175.us = phi i64 [ %acc.080.us, %for.cond21.preheader.us ], [ %add.us, %for.body24.us ]
  %mul25.us = mul nsw i32 %x.076.us, %0
  %arrayidx.us = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul25.us
  %10 = load i16, ptr %arrayidx.us, align 2, !tbaa !14
  %conv.us = sext i16 %10 to i32
  %mul26.us = mul nsw i32 %x.076.us, %4
  %arrayidx27.us = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul26.us
  %11 = load i16, ptr %arrayidx27.us, align 2, !tbaa !14
  %conv28.us = sext i16 %11 to i32
  %mul29.us = mul nsw i32 %conv28.us, %conv.us
  %conv30.us = sext i32 %mul29.us to i64
  %add.us = add nsw i64 %acc.175.us, %conv30.us
  %inc.us = add nuw nsw i32 %x.076.us, 1
  %exitcond.not = icmp eq i32 %inc.us, %count_x
  br i1 %exitcond.not, label %for.cond21.for.cond.cleanup23_crit_edge.us, label %for.body24.us, !llvm.loop !16

for.cond21.for.cond.cleanup23_crit_edge.us:       ; preds = %for.body24.us
  %add.ptr.us = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul18
  %add.ptr31.us = getelementptr inbounds i16, ptr %f_data.079.us, i32 %mul19
  %inc33.us = add nuw nsw i32 %y.081.us, 1
  %exitcond84.not = icmp eq i32 %inc33.us, %count_y
  br i1 %exitcond84.not, label %for.cond.cleanup, label %for.cond21.preheader.us, !llvm.loop !18

for.cond.cleanup:                                 ; preds = %for.cond21.for.cond.cleanup23_crit_edge.us, %if.end16
  %acc.0.lcssa = phi i64 [ 0, %if.end16 ], [ %add.us, %for.cond21.for.cond.cleanup23_crit_edge.us ]
  %sub = add nsw i32 %shift, -1
  %shl = shl nuw i32 1, %sub
  %conv35 = sext i32 %shl to i64
  %add36 = add nsw i64 %acc.0.lcssa, %conv35
  %sh_prom = zext nneg i32 %shift to i64
  %shr = ashr i64 %add36, %sh_prom
  %conv37 = trunc i64 %shr to i16
  store i16 %conv37, ptr %out_value, align 2, !tbaa !14
  br label %cleanup43

cleanup43:                                        ; preds = %if.end, %for.cond.cleanup, %if.end10, %if.end4, %entry
  %retval.3 = phi i32 [ 458755, %entry ], [ 458755, %if.end ], [ 458755, %if.end4 ], [ 0, %for.cond.cleanup ], [ 458755, %if.end10 ]
  ret i32 %retval.3
}

attributes #0 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zca,+zcmp,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"}
!4 = !{!5, !9, i64 4}
!5 = !{!"image2d_s", !6, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!5, !9, i64 12}
!11 = !{!5, !9, i64 8}
!12 = !{!5, !9, i64 16}
!13 = !{!5, !6, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"short", !7, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
