; ModuleID = 'dspm_sub_f32_ansi.ll'
source_filename = "dspm_sub_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspm_sub_f32_ansi(ptr noundef readonly %input1, ptr noundef readonly %input2, ptr noundef writeonly %output, i32 noundef %rows, i32 noundef %cols, i32 noundef %padd1, i32 noundef %padd2, i32 noundef %padd_out, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input1, null
  %cmp1 = icmp eq ptr %input2, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %output, null
  %or.cond69 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %rows, 1
  %or.cond70 = or i1 %or.cond69, %cmp7
  %cmp10 = icmp slt i32 %cols, 1
  %or.cond71 = or i1 %or.cond70, %cmp10
  %0 = or i32 %padd2, %padd1
  %1 = or i32 %0, %padd_out
  %2 = icmp slt i32 %1, 0
  %or.cond74 = or i1 %or.cond71, %2
  %cmp22 = icmp slt i32 %step1, 1
  %or.cond75 = or i1 %cmp22, %or.cond74
  %cmp25 = icmp slt i32 %step2, 1
  %or.cond76 = or i1 %cmp25, %or.cond75
  %cmp28 = icmp slt i32 %step_out, 1
  %or.cond77 = or i1 %cmp28, %or.cond76
  br i1 %or.cond77, label %return, label %if.end30

if.end30:                                         ; preds = %entry
  %add = add nuw nsw i32 %padd1, %cols
  %add31 = add nuw nsw i32 %padd2, %cols
  %add32 = add nuw nsw i32 %padd_out, %cols
  %cmp3380 = icmp sgt i32 %rows, 0
  br i1 %cmp3380, label %for.cond34.preheader, label %return

for.cond34.preheader:                             ; preds = %for.cond.cleanup36, %if.end30
  %row.084 = phi i32 [ %inc45, %for.cond.cleanup36 ], [ 0, %if.end30 ]
  %ptr_input2.083 = phi ptr [ %add.ptr42, %for.cond.cleanup36 ], [ %input2, %if.end30 ]
  %ptr_input1.082 = phi ptr [ %add.ptr, %for.cond.cleanup36 ], [ %input1, %if.end30 ]
  %output.addr.081 = phi ptr [ %add.ptr43, %for.cond.cleanup36 ], [ %output, %if.end30 ]
  br label %for.body37

for.cond.cleanup36:                               ; preds = %for.body37
  %add.ptr = getelementptr inbounds float, ptr %ptr_input1.082, i32 %add
  %add.ptr42 = getelementptr inbounds float, ptr %ptr_input2.083, i32 %add31
  %add.ptr43 = getelementptr inbounds float, ptr %output.addr.081, i32 %add32
  %inc45 = add nuw nsw i32 %row.084, 1
  %exitcond85.not = icmp eq i32 %inc45, %rows
  br i1 %exitcond85.not, label %return, label %for.cond34.preheader, !llvm.loop !4

for.body37:                                       ; preds = %for.body37, %for.cond34.preheader
  %col.079 = phi i32 [ %inc, %for.body37 ], [ 0, %for.cond34.preheader ]
  %mul = mul nsw i32 %col.079, %step1
  %arrayidx = getelementptr inbounds float, ptr %ptr_input1.082, i32 %mul
  %3 = load float, ptr %arrayidx, align 4, !tbaa !6
  %mul38 = mul nsw i32 %col.079, %step2
  %arrayidx39 = getelementptr inbounds float, ptr %ptr_input2.083, i32 %mul38
  %4 = load float, ptr %arrayidx39, align 4, !tbaa !6
  %sub = fsub float %3, %4
  %mul40 = mul nsw i32 %col.079, %step_out
  %arrayidx41 = getelementptr inbounds float, ptr %output.addr.081, i32 %mul40
  store float %sub, ptr %arrayidx41, align 4, !tbaa !6
  %inc = add nuw nsw i32 %col.079, 1
  %exitcond.not = icmp eq i32 %inc, %cols
  br i1 %exitcond.not, label %for.cond.cleanup36, label %for.body37, !llvm.loop !10

return:                                           ; preds = %for.cond.cleanup36, %if.end30, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %if.end30 ], [ 0, %for.cond.cleanup36 ]
  ret i32 %retval.0
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !5}
