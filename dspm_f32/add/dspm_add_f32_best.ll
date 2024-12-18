; ModuleID = 'dspm_add_f32_best.c'
source_filename = "dspm_add_f32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspm_add_f32_ansi(ptr noundef readonly %input1, ptr noundef readonly %input2, ptr noundef writeonly %output, i32 noundef %rows, i32 noundef %cols, i32 noundef %padd1, i32 noundef %padd2, i32 noundef %padd_out, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input1, null
  %cmp1 = icmp eq ptr %input2, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %output, null
  %or.cond227 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %rows, 1
  %or.cond228 = or i1 %or.cond227, %cmp7
  %cmp10 = icmp slt i32 %cols, 1
  %or.cond229 = or i1 %or.cond228, %cmp10
  %0 = or i32 %padd2, %padd1
  %1 = or i32 %0, %padd_out
  %2 = icmp slt i32 %1, 0
  %or.cond232 = or i1 %or.cond229, %2
  %cmp22 = icmp slt i32 %step1, 1
  %or.cond233 = or i1 %cmp22, %or.cond232
  %cmp25 = icmp slt i32 %step2, 1
  %or.cond234 = or i1 %cmp25, %or.cond233
  %cmp28 = icmp slt i32 %step_out, 1
  %or.cond235 = or i1 %cmp28, %or.cond234
  br i1 %or.cond235, label %return, label %if.end30

if.end30:                                         ; preds = %entry
  %add = add nuw nsw i32 %padd1, %cols
  %add31 = add nuw nsw i32 %padd2, %cols
  %add32 = add nuw nsw i32 %padd_out, %cols
  %cmp33240 = icmp sgt i32 %rows, 0
  br i1 %cmp33240, label %for.cond34.preheader.lr.ph, label %return

for.cond34.preheader.lr.ph:                       ; preds = %if.end30
  %sub = add nsw i32 %cols, -7
  %cmp35236 = icmp ugt i32 %cols, 7
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond34.preheader.lr.ph, %for.end124
  %row.0244 = phi i32 [ 0, %for.cond34.preheader.lr.ph ], [ %inc128, %for.end124 ]
  %ptr_input2.0243 = phi ptr [ %input2, %for.cond34.preheader.lr.ph ], [ %add.ptr125, %for.end124 ]
  %ptr_input1.0242 = phi ptr [ %input1, %for.cond34.preheader.lr.ph ], [ %add.ptr, %for.end124 ]
  %output.addr.0241 = phi ptr [ %output, %for.cond34.preheader.lr.ph ], [ %add.ptr126, %for.end124 ]
  br i1 %cmp35236, label %for.body36, label %for.cond113.preheader

for.cond113.preheader:                            ; preds = %for.body36, %for.cond34.preheader
  %col.0.lcssa = phi i32 [ 0, %for.cond34.preheader ], [ %add112, %for.body36 ]
  %cmp114238 = icmp slt i32 %col.0.lcssa, %cols
  br i1 %cmp114238, label %for.body115, label %for.end124

for.body36:                                       ; preds = %for.cond34.preheader, %for.body36
  %col.0237 = phi i32 [ %add112, %for.body36 ], [ 0, %for.cond34.preheader ]
  %mul = mul nsw i32 %col.0237, %step1
  %arrayidx = getelementptr inbounds float, ptr %ptr_input1.0242, i32 %mul
  %3 = load float, ptr %arrayidx, align 4, !tbaa !4
  %mul37 = mul nsw i32 %col.0237, %step2
  %arrayidx38 = getelementptr inbounds float, ptr %ptr_input2.0243, i32 %mul37
  %4 = load float, ptr %arrayidx38, align 4, !tbaa !4
  %add39 = fadd float %3, %4
  %mul40 = mul nsw i32 %col.0237, %step_out
  %arrayidx41 = getelementptr inbounds float, ptr %output.addr.0241, i32 %mul40
  store float %add39, ptr %arrayidx41, align 4, !tbaa !4
  %add42 = or disjoint i32 %col.0237, 1
  %mul43 = mul nsw i32 %add42, %step1
  %arrayidx44 = getelementptr inbounds float, ptr %ptr_input1.0242, i32 %mul43
  %5 = load float, ptr %arrayidx44, align 4, !tbaa !4
  %mul46 = mul nsw i32 %add42, %step2
  %arrayidx47 = getelementptr inbounds float, ptr %ptr_input2.0243, i32 %mul46
  %6 = load float, ptr %arrayidx47, align 4, !tbaa !4
  %add48 = fadd float %5, %6
  %mul50 = mul nsw i32 %add42, %step_out
  %arrayidx51 = getelementptr inbounds float, ptr %output.addr.0241, i32 %mul50
  store float %add48, ptr %arrayidx51, align 4, !tbaa !4
  %add52 = or disjoint i32 %col.0237, 2
  %mul53 = mul nsw i32 %add52, %step1
  %arrayidx54 = getelementptr inbounds float, ptr %ptr_input1.0242, i32 %mul53
  %7 = load float, ptr %arrayidx54, align 4, !tbaa !4
  %mul56 = mul nsw i32 %add52, %step2
  %arrayidx57 = getelementptr inbounds float, ptr %ptr_input2.0243, i32 %mul56
  %8 = load float, ptr %arrayidx57, align 4, !tbaa !4
  %add58 = fadd float %7, %8
  %mul60 = mul nsw i32 %add52, %step_out
  %arrayidx61 = getelementptr inbounds float, ptr %output.addr.0241, i32 %mul60
  store float %add58, ptr %arrayidx61, align 4, !tbaa !4
  %add62 = or disjoint i32 %col.0237, 3
  %mul63 = mul nsw i32 %add62, %step1
  %arrayidx64 = getelementptr inbounds float, ptr %ptr_input1.0242, i32 %mul63
  %9 = load float, ptr %arrayidx64, align 4, !tbaa !4
  %mul66 = mul nsw i32 %add62, %step2
  %arrayidx67 = getelementptr inbounds float, ptr %ptr_input2.0243, i32 %mul66
  %10 = load float, ptr %arrayidx67, align 4, !tbaa !4
  %add68 = fadd float %9, %10
  %mul70 = mul nsw i32 %add62, %step_out
  %arrayidx71 = getelementptr inbounds float, ptr %output.addr.0241, i32 %mul70
  store float %add68, ptr %arrayidx71, align 4, !tbaa !4
  %add72 = or disjoint i32 %col.0237, 4
  %mul73 = mul nsw i32 %add72, %step1
  %arrayidx74 = getelementptr inbounds float, ptr %ptr_input1.0242, i32 %mul73
  %11 = load float, ptr %arrayidx74, align 4, !tbaa !4
  %mul76 = mul nsw i32 %add72, %step2
  %arrayidx77 = getelementptr inbounds float, ptr %ptr_input2.0243, i32 %mul76
  %12 = load float, ptr %arrayidx77, align 4, !tbaa !4
  %add78 = fadd float %11, %12
  %mul80 = mul nsw i32 %add72, %step_out
  %arrayidx81 = getelementptr inbounds float, ptr %output.addr.0241, i32 %mul80
  store float %add78, ptr %arrayidx81, align 4, !tbaa !4
  %add82 = or disjoint i32 %col.0237, 5
  %mul83 = mul nsw i32 %add82, %step1
  %arrayidx84 = getelementptr inbounds float, ptr %ptr_input1.0242, i32 %mul83
  %13 = load float, ptr %arrayidx84, align 4, !tbaa !4
  %mul86 = mul nsw i32 %add82, %step2
  %arrayidx87 = getelementptr inbounds float, ptr %ptr_input2.0243, i32 %mul86
  %14 = load float, ptr %arrayidx87, align 4, !tbaa !4
  %add88 = fadd float %13, %14
  %mul90 = mul nsw i32 %add82, %step_out
  %arrayidx91 = getelementptr inbounds float, ptr %output.addr.0241, i32 %mul90
  store float %add88, ptr %arrayidx91, align 4, !tbaa !4
  %add92 = or disjoint i32 %col.0237, 6
  %mul93 = mul nsw i32 %add92, %step1
  %arrayidx94 = getelementptr inbounds float, ptr %ptr_input1.0242, i32 %mul93
  %15 = load float, ptr %arrayidx94, align 4, !tbaa !4
  %mul96 = mul nsw i32 %add92, %step2
  %arrayidx97 = getelementptr inbounds float, ptr %ptr_input2.0243, i32 %mul96
  %16 = load float, ptr %arrayidx97, align 4, !tbaa !4
  %add98 = fadd float %15, %16
  %mul100 = mul nsw i32 %add92, %step_out
  %arrayidx101 = getelementptr inbounds float, ptr %output.addr.0241, i32 %mul100
  store float %add98, ptr %arrayidx101, align 4, !tbaa !4
  %add102 = or disjoint i32 %col.0237, 7
  %mul103 = mul nsw i32 %add102, %step1
  %arrayidx104 = getelementptr inbounds float, ptr %ptr_input1.0242, i32 %mul103
  %17 = load float, ptr %arrayidx104, align 4, !tbaa !4
  %mul106 = mul nsw i32 %add102, %step2
  %arrayidx107 = getelementptr inbounds float, ptr %ptr_input2.0243, i32 %mul106
  %18 = load float, ptr %arrayidx107, align 4, !tbaa !4
  %add108 = fadd float %17, %18
  %mul110 = mul nsw i32 %add102, %step_out
  %arrayidx111 = getelementptr inbounds float, ptr %output.addr.0241, i32 %mul110
  store float %add108, ptr %arrayidx111, align 4, !tbaa !4
  %add112 = add nuw nsw i32 %col.0237, 8
  %cmp35 = icmp slt i32 %add112, %sub
  br i1 %cmp35, label %for.body36, label %for.cond113.preheader, !llvm.loop !8

for.body115:                                      ; preds = %for.cond113.preheader, %for.body115
  %col.1239 = phi i32 [ %inc, %for.body115 ], [ %col.0.lcssa, %for.cond113.preheader ]
  %mul116 = mul nsw i32 %col.1239, %step1
  %arrayidx117 = getelementptr inbounds float, ptr %ptr_input1.0242, i32 %mul116
  %19 = load float, ptr %arrayidx117, align 4, !tbaa !4
  %mul118 = mul nsw i32 %col.1239, %step2
  %arrayidx119 = getelementptr inbounds float, ptr %ptr_input2.0243, i32 %mul118
  %20 = load float, ptr %arrayidx119, align 4, !tbaa !4
  %add120 = fadd float %19, %20
  %mul121 = mul nsw i32 %col.1239, %step_out
  %arrayidx122 = getelementptr inbounds float, ptr %output.addr.0241, i32 %mul121
  store float %add120, ptr %arrayidx122, align 4, !tbaa !4
  %inc = add nuw nsw i32 %col.1239, 1
  %exitcond.not = icmp eq i32 %inc, %cols
  br i1 %exitcond.not, label %for.end124, label %for.body115, !llvm.loop !10

for.end124:                                       ; preds = %for.body115, %for.cond113.preheader
  %add.ptr = getelementptr inbounds float, ptr %ptr_input1.0242, i32 %add
  %add.ptr125 = getelementptr inbounds float, ptr %ptr_input2.0243, i32 %add31
  %add.ptr126 = getelementptr inbounds float, ptr %output.addr.0241, i32 %add32
  %inc128 = add nuw nsw i32 %row.0244, 1
  %exitcond245.not = icmp eq i32 %inc128, %rows
  br i1 %exitcond245.not, label %return, label %for.cond34.preheader, !llvm.loop !11

return:                                           ; preds = %for.end124, %if.end30, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %if.end30 ], [ 0, %for.end124 ]
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
!11 = distinct !{!11, !9}
