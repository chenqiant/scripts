; ModuleID = 'after_customlicm.ll'
source_filename = "dspm_addc_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspm_addc_f32_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, float noundef %C, i32 noundef %rows, i32 noundef %cols, i32 noundef %padd_in, i32 noundef %padd_out, i32 noundef %step_in, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp slt i32 %rows, 1
  %or.cond51 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %cols, 1
  %or.cond52 = or i1 %or.cond51, %cmp7
  %0 = or i32 %padd_out, %padd_in
  %1 = icmp slt i32 %0, 0
  %or.cond54 = or i1 %or.cond52, %1
  %cmp16 = icmp slt i32 %step_in, 1
  %or.cond55 = or i1 %cmp16, %or.cond54
  %cmp19 = icmp slt i32 %step_out, 1
  %or.cond56 = or i1 %cmp19, %or.cond55
  br i1 %or.cond56, label %return, label %if.end21

if.end21:                                         ; preds = %entry
  %add = add nuw nsw i32 %padd_in, %cols
  %add22 = add nuw nsw i32 %padd_out, %cols
  %sub = add nuw i32 %cols, -7
  %cmp35236 = icmp ugt i32 %cols, 7
  br label %for.body27.preheader

for.body27.preheader:                             ; preds = %for.cond.cleanup26, %if.end21
  %row.061 = phi i32 [ 0, %if.end21 ], [ %inc33, %for.cond.cleanup26 ]
  %ptr_input.060 = phi ptr [ %input, %if.end21 ], [ %add.ptr31, %for.cond.cleanup26 ]
  %output.addr.059 = phi ptr [ %output, %if.end21 ], [ %add.ptr, %for.cond.cleanup26 ]
  br i1 %cmp35236, label %for.body27.7, label %forCond113Preheader

forCond113Preheader:                              ; preds = %for.body27.7, %for.body27.preheader
  %col.0.lcssa = phi i32 [ 0, %for.body27.preheader ], [ %inc.7, %for.body27.7 ]
  %cmp114238 = icmp slt i32 %col.0.lcssa, %cols
  br i1 %cmp114238, label %for.body27.clone, label %for.cond.cleanup26

for.body27.7:                                     ; preds = %for.body27.preheader, %for.body27.7
  %col.058 = phi i32 [ %inc.7, %for.body27.7 ], [ 0, %for.body27.preheader ]
  %inc = or disjoint i32 %col.058, 1
  %inc.1 = or disjoint i32 %col.058, 2
  %inc.2 = or disjoint i32 %col.058, 3
  %inc.3 = or disjoint i32 %col.058, 4
  %inc.4 = or disjoint i32 %col.058, 5
  %inc.5 = or disjoint i32 %col.058, 6
  %inc.6 = or disjoint i32 %col.058, 7
  %mul = mul nsw i32 %col.058, %step_in
  %mul29 = mul nsw i32 %col.058, %step_out
  %mul.1 = mul nsw i32 %inc, %step_in
  %mul29.1 = mul nsw i32 %inc, %step_out
  %mul.2 = mul nsw i32 %inc.1, %step_in
  %mul29.2 = mul nsw i32 %inc.1, %step_out
  %mul.3 = mul nsw i32 %inc.2, %step_in
  %mul29.3 = mul nsw i32 %inc.2, %step_out
  %mul.4 = mul nsw i32 %inc.3, %step_in
  %mul29.4 = mul nsw i32 %inc.3, %step_out
  %mul.5 = mul nsw i32 %inc.4, %step_in
  %mul29.5 = mul nsw i32 %inc.4, %step_out
  %mul.6 = mul nsw i32 %inc.5, %step_in
  %mul29.6 = mul nsw i32 %inc.5, %step_out
  %mul.7 = mul nsw i32 %inc.6, %step_in
  %mul29.7 = mul nsw i32 %inc.6, %step_out
  %arrayidx = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul
  %arrayidx30 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29
  %arrayidx.1 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.1
  %arrayidx30.1 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.1
  %arrayidx.2 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.2
  %arrayidx30.2 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.2
  %arrayidx.3 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.3
  %arrayidx30.3 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.3
  %arrayidx.4 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.4
  %arrayidx30.4 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.4
  %arrayidx.5 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.5
  %arrayidx30.5 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.5
  %arrayidx.6 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.6
  %arrayidx30.6 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.6
  %arrayidx.7 = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.7
  %arrayidx30.7 = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.7
  %2 = load float, ptr %arrayidx, align 4, !tbaa !4
  %3 = load float, ptr %arrayidx.1, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx.2, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx.3, align 4, !tbaa !4
  %6 = load float, ptr %arrayidx.4, align 4, !tbaa !4
  %7 = load float, ptr %arrayidx.5, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx.6, align 4, !tbaa !4
  %9 = load float, ptr %arrayidx.7, align 4, !tbaa !4
  %add28 = fadd float %2, %C
  %add28.1 = fadd float %3, %C
  %add28.2 = fadd float %4, %C
  %add28.3 = fadd float %5, %C
  %add28.4 = fadd float %6, %C
  %add28.5 = fadd float %7, %C
  %add28.6 = fadd float %8, %C
  %add28.7 = fadd float %9, %C
  store float %add28, ptr %arrayidx30, align 4, !tbaa !4
  store float %add28.1, ptr %arrayidx30.1, align 4, !tbaa !4
  store float %add28.2, ptr %arrayidx30.2, align 4, !tbaa !4
  store float %add28.3, ptr %arrayidx30.3, align 4, !tbaa !4
  store float %add28.4, ptr %arrayidx30.4, align 4, !tbaa !4
  store float %add28.5, ptr %arrayidx30.5, align 4, !tbaa !4
  store float %add28.6, ptr %arrayidx30.6, align 4, !tbaa !4
  store float %add28.7, ptr %arrayidx30.7, align 4, !tbaa !4
  %inc.7 = add nuw nsw i32 %col.058, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub
  br i1 %exitcond.not.7, label %for.body27.7, label %forCond113Preheader, !llvm.loop !8

for.body27.clone:                                 ; preds = %forCond113Preheader, %for.body27.clone
  %col.058.clone = phi i32 [ %inc.clone, %for.body27.clone ], [ %col.0.lcssa, %forCond113Preheader ]
  %mul.clone = mul nsw i32 %col.058.clone, %step_in
  %arrayidx.clone = getelementptr inbounds float, ptr %ptr_input.060, i32 %mul.clone
  %10 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %add28.clone = fadd float %10, %C
  %mul29.clone = mul nsw i32 %col.058.clone, %step_out
  %arrayidx30.clone = getelementptr inbounds float, ptr %output.addr.059, i32 %mul29.clone
  store float %add28.clone, ptr %arrayidx30.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %col.058.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %cols
  br i1 %exitcond.not.clone, label %for.cond.cleanup26, label %for.body27.clone, !llvm.loop !8

for.cond.cleanup26:                               ; preds = %for.body27.clone, %forCond113Preheader
  %add.ptr = getelementptr inbounds float, ptr %output.addr.059, i32 %add22
  %add.ptr31 = getelementptr inbounds float, ptr %ptr_input.060, i32 %add
  %inc33 = add nuw nsw i32 %row.061, 1
  %exitcond62.not = icmp eq i32 %inc33, %rows
  br i1 %exitcond62.not, label %return, label %for.body27.preheader, !llvm.loop !10

return:                                           ; preds = %for.cond.cleanup26, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.cleanup26 ]
  ret i32 %retval.0
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
