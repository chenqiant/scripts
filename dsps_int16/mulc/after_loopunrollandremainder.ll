; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_mulc_s16_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_mulc_s16_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, i32 noundef %len, i16 noundef signext %C, i32 noundef %step_in, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %conv5 = sext i16 %C to i32
  %and = and i32 %len, -15
  %cmp415 = icmp sgt i32 %and, 0
  br i1 %cmp415, label %for.body.15, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.15, %for.cond.preheader
  %i.0.lcssa = phi i32 [ 0, %for.cond.preheader ], [ %inc.15, %for.body.15 ]
  %cmp226415 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp226415, label %for.body.clone, label %return

for.body.15:                                      ; preds = %for.body.15, %for.cond.preheader
  %i.016 = phi i32 [ 0, %for.cond.preheader ], [ %inc.15, %for.body.15 ]
  %mul = mul nsw i32 %i.016, %step_in
  %arrayidx = getelementptr inbounds i16, ptr %input, i32 %mul
  %0 = load i16, ptr %arrayidx, align 2, !tbaa !4
  %conv = sext i16 %0 to i32
  %mul6 = mul nsw i32 %conv, %conv5
  %shr = lshr i32 %mul6, 15
  %conv7 = trunc i32 %shr to i16
  %mul8 = mul nsw i32 %i.016, %step_out
  %arrayidx9 = getelementptr inbounds i16, ptr %output, i32 %mul8
  store i16 %conv7, ptr %arrayidx9, align 2, !tbaa !4
  %add = or disjoint i32 %i.016, 1
  %mul.1 = mul nsw i32 %add, %step_in
  %arrayidx.1 = getelementptr inbounds i16, ptr %input, i32 %mul.1
  %1 = load i16, ptr %arrayidx.1, align 2, !tbaa !4
  %conv.1 = sext i16 %1 to i32
  %mul6.1 = mul nsw i32 %conv.1, %conv5
  %shr.1 = lshr i32 %mul6.1, 15
  %conv7.1 = trunc i32 %shr.1 to i16
  %mul8.1 = mul nsw i32 %add, %step_out
  %arrayidx9.1 = getelementptr inbounds i16, ptr %output, i32 %mul8.1
  store i16 %conv7.1, ptr %arrayidx9.1, align 2, !tbaa !4
  %add2 = or disjoint i32 %i.016, 2
  %mul.2 = mul nsw i32 %add2, %step_in
  %arrayidx.2 = getelementptr inbounds i16, ptr %input, i32 %mul.2
  %2 = load i16, ptr %arrayidx.2, align 2, !tbaa !4
  %conv.2 = sext i16 %2 to i32
  %mul6.2 = mul nsw i32 %conv.2, %conv5
  %shr.2 = lshr i32 %mul6.2, 15
  %conv7.2 = trunc i32 %shr.2 to i16
  %mul8.2 = mul nsw i32 %add2, %step_out
  %arrayidx9.2 = getelementptr inbounds i16, ptr %output, i32 %mul8.2
  store i16 %conv7.2, ptr %arrayidx9.2, align 2, !tbaa !4
  %add4 = or disjoint i32 %i.016, 3
  %mul.3 = mul nsw i32 %add4, %step_in
  %arrayidx.3 = getelementptr inbounds i16, ptr %input, i32 %mul.3
  %3 = load i16, ptr %arrayidx.3, align 2, !tbaa !4
  %conv.3 = sext i16 %3 to i32
  %mul6.3 = mul nsw i32 %conv.3, %conv5
  %shr.3 = lshr i32 %mul6.3, 15
  %conv7.3 = trunc i32 %shr.3 to i16
  %mul8.3 = mul nsw i32 %add4, %step_out
  %arrayidx9.3 = getelementptr inbounds i16, ptr %output, i32 %mul8.3
  store i16 %conv7.3, ptr %arrayidx9.3, align 2, !tbaa !4
  %add6 = or disjoint i32 %i.016, 4
  %mul.4 = mul nsw i32 %add6, %step_in
  %arrayidx.4 = getelementptr inbounds i16, ptr %input, i32 %mul.4
  %4 = load i16, ptr %arrayidx.4, align 2, !tbaa !4
  %conv.4 = sext i16 %4 to i32
  %mul6.4 = mul nsw i32 %conv.4, %conv5
  %shr.4 = lshr i32 %mul6.4, 15
  %conv7.4 = trunc i32 %shr.4 to i16
  %mul8.4 = mul nsw i32 %add6, %step_out
  %arrayidx9.4 = getelementptr inbounds i16, ptr %output, i32 %mul8.4
  store i16 %conv7.4, ptr %arrayidx9.4, align 2, !tbaa !4
  %add8 = or disjoint i32 %i.016, 5
  %mul.5 = mul nsw i32 %add8, %step_in
  %arrayidx.5 = getelementptr inbounds i16, ptr %input, i32 %mul.5
  %5 = load i16, ptr %arrayidx.5, align 2, !tbaa !4
  %conv.5 = sext i16 %5 to i32
  %mul6.5 = mul nsw i32 %conv.5, %conv5
  %shr.5 = lshr i32 %mul6.5, 15
  %conv7.5 = trunc i32 %shr.5 to i16
  %mul8.5 = mul nsw i32 %add8, %step_out
  %arrayidx9.5 = getelementptr inbounds i16, ptr %output, i32 %mul8.5
  store i16 %conv7.5, ptr %arrayidx9.5, align 2, !tbaa !4
  %add10 = or disjoint i32 %i.016, 6
  %mul.6 = mul nsw i32 %add10, %step_in
  %arrayidx.6 = getelementptr inbounds i16, ptr %input, i32 %mul.6
  %6 = load i16, ptr %arrayidx.6, align 2, !tbaa !4
  %conv.6 = sext i16 %6 to i32
  %mul6.6 = mul nsw i32 %conv.6, %conv5
  %shr.6 = lshr i32 %mul6.6, 15
  %conv7.6 = trunc i32 %shr.6 to i16
  %mul8.6 = mul nsw i32 %add10, %step_out
  %arrayidx9.6 = getelementptr inbounds i16, ptr %output, i32 %mul8.6
  store i16 %conv7.6, ptr %arrayidx9.6, align 2, !tbaa !4
  %add12 = or disjoint i32 %i.016, 7
  %mul.7 = mul nsw i32 %add12, %step_in
  %arrayidx.7 = getelementptr inbounds i16, ptr %input, i32 %mul.7
  %7 = load i16, ptr %arrayidx.7, align 2, !tbaa !4
  %conv.7 = sext i16 %7 to i32
  %mul6.7 = mul nsw i32 %conv.7, %conv5
  %shr.7 = lshr i32 %mul6.7, 15
  %conv7.7 = trunc i32 %shr.7 to i16
  %mul8.7 = mul nsw i32 %add12, %step_out
  %arrayidx9.7 = getelementptr inbounds i16, ptr %output, i32 %mul8.7
  store i16 %conv7.7, ptr %arrayidx9.7, align 2, !tbaa !4
  %add14 = or disjoint i32 %i.016, 8
  %mul.8 = mul nsw i32 %add14, %step_in
  %arrayidx.8 = getelementptr inbounds i16, ptr %input, i32 %mul.8
  %8 = load i16, ptr %arrayidx.8, align 2, !tbaa !4
  %conv.8 = sext i16 %8 to i32
  %mul6.8 = mul nsw i32 %conv.8, %conv5
  %shr.8 = lshr i32 %mul6.8, 15
  %conv7.8 = trunc i32 %shr.8 to i16
  %mul8.8 = mul nsw i32 %add14, %step_out
  %arrayidx9.8 = getelementptr inbounds i16, ptr %output, i32 %mul8.8
  store i16 %conv7.8, ptr %arrayidx9.8, align 2, !tbaa !4
  %add16 = or disjoint i32 %i.016, 9
  %mul.9 = mul nsw i32 %add16, %step_in
  %arrayidx.9 = getelementptr inbounds i16, ptr %input, i32 %mul.9
  %9 = load i16, ptr %arrayidx.9, align 2, !tbaa !4
  %conv.9 = sext i16 %9 to i32
  %mul6.9 = mul nsw i32 %conv.9, %conv5
  %shr.9 = lshr i32 %mul6.9, 15
  %conv7.9 = trunc i32 %shr.9 to i16
  %mul8.9 = mul nsw i32 %add16, %step_out
  %arrayidx9.9 = getelementptr inbounds i16, ptr %output, i32 %mul8.9
  store i16 %conv7.9, ptr %arrayidx9.9, align 2, !tbaa !4
  %add18 = or disjoint i32 %i.016, 10
  %mul.10 = mul nsw i32 %add18, %step_in
  %arrayidx.10 = getelementptr inbounds i16, ptr %input, i32 %mul.10
  %10 = load i16, ptr %arrayidx.10, align 2, !tbaa !4
  %conv.10 = sext i16 %10 to i32
  %mul6.10 = mul nsw i32 %conv.10, %conv5
  %shr.10 = lshr i32 %mul6.10, 15
  %conv7.10 = trunc i32 %shr.10 to i16
  %mul8.10 = mul nsw i32 %add18, %step_out
  %arrayidx9.10 = getelementptr inbounds i16, ptr %output, i32 %mul8.10
  store i16 %conv7.10, ptr %arrayidx9.10, align 2, !tbaa !4
  %add20 = or disjoint i32 %i.016, 11
  %mul.11 = mul nsw i32 %add20, %step_in
  %arrayidx.11 = getelementptr inbounds i16, ptr %input, i32 %mul.11
  %11 = load i16, ptr %arrayidx.11, align 2, !tbaa !4
  %conv.11 = sext i16 %11 to i32
  %mul6.11 = mul nsw i32 %conv.11, %conv5
  %shr.11 = lshr i32 %mul6.11, 15
  %conv7.11 = trunc i32 %shr.11 to i16
  %mul8.11 = mul nsw i32 %add20, %step_out
  %arrayidx9.11 = getelementptr inbounds i16, ptr %output, i32 %mul8.11
  store i16 %conv7.11, ptr %arrayidx9.11, align 2, !tbaa !4
  %add22 = or disjoint i32 %i.016, 12
  %mul.12 = mul nsw i32 %add22, %step_in
  %arrayidx.12 = getelementptr inbounds i16, ptr %input, i32 %mul.12
  %12 = load i16, ptr %arrayidx.12, align 2, !tbaa !4
  %conv.12 = sext i16 %12 to i32
  %mul6.12 = mul nsw i32 %conv.12, %conv5
  %shr.12 = lshr i32 %mul6.12, 15
  %conv7.12 = trunc i32 %shr.12 to i16
  %mul8.12 = mul nsw i32 %add22, %step_out
  %arrayidx9.12 = getelementptr inbounds i16, ptr %output, i32 %mul8.12
  store i16 %conv7.12, ptr %arrayidx9.12, align 2, !tbaa !4
  %add24 = or disjoint i32 %i.016, 13
  %mul.13 = mul nsw i32 %add24, %step_in
  %arrayidx.13 = getelementptr inbounds i16, ptr %input, i32 %mul.13
  %13 = load i16, ptr %arrayidx.13, align 2, !tbaa !4
  %conv.13 = sext i16 %13 to i32
  %mul6.13 = mul nsw i32 %conv.13, %conv5
  %shr.13 = lshr i32 %mul6.13, 15
  %conv7.13 = trunc i32 %shr.13 to i16
  %mul8.13 = mul nsw i32 %add24, %step_out
  %arrayidx9.13 = getelementptr inbounds i16, ptr %output, i32 %mul8.13
  store i16 %conv7.13, ptr %arrayidx9.13, align 2, !tbaa !4
  %add26 = or disjoint i32 %i.016, 14
  %mul.14 = mul nsw i32 %add26, %step_in
  %arrayidx.14 = getelementptr inbounds i16, ptr %input, i32 %mul.14
  %14 = load i16, ptr %arrayidx.14, align 2, !tbaa !4
  %conv.14 = sext i16 %14 to i32
  %mul6.14 = mul nsw i32 %conv.14, %conv5
  %shr.14 = lshr i32 %mul6.14, 15
  %conv7.14 = trunc i32 %shr.14 to i16
  %mul8.14 = mul nsw i32 %add26, %step_out
  %arrayidx9.14 = getelementptr inbounds i16, ptr %output, i32 %mul8.14
  store i16 %conv7.14, ptr %arrayidx9.14, align 2, !tbaa !4
  %add28 = or disjoint i32 %i.016, 15
  %mul.15 = mul nsw i32 %add28, %step_in
  %arrayidx.15 = getelementptr inbounds i16, ptr %input, i32 %mul.15
  %15 = load i16, ptr %arrayidx.15, align 2, !tbaa !4
  %conv.15 = sext i16 %15 to i32
  %mul6.15 = mul nsw i32 %conv.15, %conv5
  %shr.15 = lshr i32 %mul6.15, 15
  %conv7.15 = trunc i32 %shr.15 to i16
  %mul8.15 = mul nsw i32 %add28, %step_out
  %arrayidx9.15 = getelementptr inbounds i16, ptr %output, i32 %mul8.15
  store i16 %conv7.15, ptr %arrayidx9.15, align 2, !tbaa !4
  %inc.15 = add nuw nsw i32 %i.016, 16
  %exitcond.not.15 = icmp slt i32 %inc.15, %and
  br i1 %exitcond.not.15, label %for.body.15, label %for.body.preheader, !llvm.loop !8

for.body.clone:                                   ; preds = %for.body.clone, %for.body.preheader
  %i.016.clone = phi i32 [ %i.0.lcssa, %for.body.preheader ], [ %inc.clone, %for.body.clone ]
  %mul.clone = mul nsw i32 %i.016.clone, %step_in
  %arrayidx.clone = getelementptr inbounds i16, ptr %input, i32 %mul.clone
  %16 = load i16, ptr %arrayidx.clone, align 2, !tbaa !4
  %conv.clone = sext i16 %16 to i32
  %mul6.clone = mul nsw i32 %conv.clone, %conv5
  %shr.clone = lshr i32 %mul6.clone, 15
  %conv7.clone = trunc i32 %shr.clone to i16
  %mul8.clone = mul nsw i32 %i.016.clone, %step_out
  %arrayidx9.clone = getelementptr inbounds i16, ptr %output, i32 %mul8.clone
  store i16 %conv7.clone, ptr %arrayidx9.clone, align 2, !tbaa !4
  %inc.clone = add nuw nsw i32 %i.016.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone, !llvm.loop !8

return:                                           ; preds = %for.body.clone, %for.body.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.body.preheader ], [ 0, %for.body.clone ]
  ret i32 %retval.0
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"short", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
