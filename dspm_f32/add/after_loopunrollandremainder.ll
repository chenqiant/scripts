; ModuleID = 'after_customlicm.ll'
source_filename = "dspm_add_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspm_add_f32_ansi(ptr noalias noundef readonly %input1, ptr noalias noundef readonly %input2, ptr noalias noundef writeonly %output, i32 noundef %rows, i32 noundef %cols, i32 noundef %padd1, i32 noundef %padd2, i32 noundef %padd_out, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input1, null
  %cmp1 = icmp eq ptr %input2, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %output, null
  %or.cond70 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %rows, 1
  %or.cond71 = or i1 %or.cond70, %cmp7
  %cmp10 = icmp slt i32 %cols, 1
  %or.cond72 = or i1 %or.cond71, %cmp10
  %0 = or i32 %padd2, %padd1
  %1 = or i32 %0, %padd_out
  %2 = icmp slt i32 %1, 0
  %or.cond75 = or i1 %or.cond72, %2
  %cmp22 = icmp slt i32 %step1, 1
  %or.cond76 = or i1 %cmp22, %or.cond75
  %cmp25 = icmp slt i32 %step2, 1
  %or.cond77 = or i1 %cmp25, %or.cond76
  %cmp28 = icmp slt i32 %step_out, 1
  %or.cond78 = or i1 %cmp28, %or.cond77
  br i1 %or.cond78, label %return, label %if.end30

if.end30:                                         ; preds = %entry
  %add = add nuw nsw i32 %padd1, %cols
  %add31 = add nuw nsw i32 %padd2, %cols
  %add32 = add nuw nsw i32 %padd_out, %cols
  %cmp3381 = icmp sgt i32 %rows, 0
  %sub = add nuw i32 %cols, -7
  %cmp35236 = icmp ugt i32 %cols, 7
  br i1 %cmp3381, label %for.cond34.preheader, label %return

for.cond34.preheader:                             ; preds = %if.end30, %for.cond.cleanup36
  %row.085 = phi i32 [ %inc46, %for.cond.cleanup36 ], [ 0, %if.end30 ]
  %ptr_input2.084 = phi ptr [ %add.ptr43, %for.cond.cleanup36 ], [ %input2, %if.end30 ]
  %ptr_input1.083 = phi ptr [ %add.ptr, %for.cond.cleanup36 ], [ %input1, %if.end30 ]
  %output.addr.082 = phi ptr [ %add.ptr44, %for.cond.cleanup36 ], [ %output, %if.end30 ]
  br i1 %cmp35236, label %for.body37.7, label %forCond113Preheader

forCond113Preheader:                              ; preds = %for.body37.7, %for.cond34.preheader
  %col.0.lcssa = phi i32 [ 0, %for.cond34.preheader ], [ %inc.7, %for.body37.7 ]
  %cmp114238 = icmp slt i32 %col.0.lcssa, %cols
  br i1 %cmp114238, label %for.body37.clone, label %for.cond.cleanup36

for.body37.7:                                     ; preds = %for.cond34.preheader, %for.body37.7
  %col.080 = phi i32 [ %inc.7, %for.body37.7 ], [ 0, %for.cond34.preheader ]
  %inc = or disjoint i32 %col.080, 1
  %inc.1 = or disjoint i32 %col.080, 2
  %inc.2 = or disjoint i32 %col.080, 3
  %inc.3 = or disjoint i32 %col.080, 4
  %inc.4 = or disjoint i32 %col.080, 5
  %inc.5 = or disjoint i32 %col.080, 6
  %inc.6 = or disjoint i32 %col.080, 7
  %mul = mul nsw i32 %col.080, %step1
  %mul38 = mul nsw i32 %col.080, %step2
  %mul41 = mul nsw i32 %col.080, %step_out
  %mul.1 = mul nsw i32 %inc, %step1
  %mul38.1 = mul nsw i32 %inc, %step2
  %mul41.1 = mul nsw i32 %inc, %step_out
  %mul.2 = mul nsw i32 %inc.1, %step1
  %mul38.2 = mul nsw i32 %inc.1, %step2
  %mul41.2 = mul nsw i32 %inc.1, %step_out
  %mul.3 = mul nsw i32 %inc.2, %step1
  %mul38.3 = mul nsw i32 %inc.2, %step2
  %mul41.3 = mul nsw i32 %inc.2, %step_out
  %mul.4 = mul nsw i32 %inc.3, %step1
  %mul38.4 = mul nsw i32 %inc.3, %step2
  %mul41.4 = mul nsw i32 %inc.3, %step_out
  %mul.5 = mul nsw i32 %inc.4, %step1
  %mul38.5 = mul nsw i32 %inc.4, %step2
  %mul41.5 = mul nsw i32 %inc.4, %step_out
  %mul.6 = mul nsw i32 %inc.5, %step1
  %mul38.6 = mul nsw i32 %inc.5, %step2
  %mul41.6 = mul nsw i32 %inc.5, %step_out
  %mul.7 = mul nsw i32 %inc.6, %step1
  %mul38.7 = mul nsw i32 %inc.6, %step2
  %mul41.7 = mul nsw i32 %inc.6, %step_out
  %arrayidx = getelementptr inbounds float, ptr %ptr_input1.083, i32 %mul
  %arrayidx39 = getelementptr inbounds float, ptr %ptr_input2.084, i32 %mul38
  %arrayidx42 = getelementptr inbounds float, ptr %output.addr.082, i32 %mul41
  %arrayidx.1 = getelementptr inbounds float, ptr %ptr_input1.083, i32 %mul.1
  %arrayidx39.1 = getelementptr inbounds float, ptr %ptr_input2.084, i32 %mul38.1
  %arrayidx42.1 = getelementptr inbounds float, ptr %output.addr.082, i32 %mul41.1
  %arrayidx.2 = getelementptr inbounds float, ptr %ptr_input1.083, i32 %mul.2
  %arrayidx39.2 = getelementptr inbounds float, ptr %ptr_input2.084, i32 %mul38.2
  %arrayidx42.2 = getelementptr inbounds float, ptr %output.addr.082, i32 %mul41.2
  %arrayidx.3 = getelementptr inbounds float, ptr %ptr_input1.083, i32 %mul.3
  %arrayidx39.3 = getelementptr inbounds float, ptr %ptr_input2.084, i32 %mul38.3
  %arrayidx42.3 = getelementptr inbounds float, ptr %output.addr.082, i32 %mul41.3
  %arrayidx.4 = getelementptr inbounds float, ptr %ptr_input1.083, i32 %mul.4
  %arrayidx39.4 = getelementptr inbounds float, ptr %ptr_input2.084, i32 %mul38.4
  %arrayidx42.4 = getelementptr inbounds float, ptr %output.addr.082, i32 %mul41.4
  %arrayidx.5 = getelementptr inbounds float, ptr %ptr_input1.083, i32 %mul.5
  %arrayidx39.5 = getelementptr inbounds float, ptr %ptr_input2.084, i32 %mul38.5
  %arrayidx42.5 = getelementptr inbounds float, ptr %output.addr.082, i32 %mul41.5
  %arrayidx.6 = getelementptr inbounds float, ptr %ptr_input1.083, i32 %mul.6
  %arrayidx39.6 = getelementptr inbounds float, ptr %ptr_input2.084, i32 %mul38.6
  %arrayidx42.6 = getelementptr inbounds float, ptr %output.addr.082, i32 %mul41.6
  %arrayidx.7 = getelementptr inbounds float, ptr %ptr_input1.083, i32 %mul.7
  %arrayidx39.7 = getelementptr inbounds float, ptr %ptr_input2.084, i32 %mul38.7
  %arrayidx42.7 = getelementptr inbounds float, ptr %output.addr.082, i32 %mul41.7
  %3 = load float, ptr %arrayidx, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx39, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx.1, align 4, !tbaa !4
  %6 = load float, ptr %arrayidx39.1, align 4, !tbaa !4
  %7 = load float, ptr %arrayidx.2, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx39.2, align 4, !tbaa !4
  %9 = load float, ptr %arrayidx.3, align 4, !tbaa !4
  %10 = load float, ptr %arrayidx39.3, align 4, !tbaa !4
  %11 = load float, ptr %arrayidx.4, align 4, !tbaa !4
  %12 = load float, ptr %arrayidx39.4, align 4, !tbaa !4
  %13 = load float, ptr %arrayidx.5, align 4, !tbaa !4
  %14 = load float, ptr %arrayidx39.5, align 4, !tbaa !4
  %15 = load float, ptr %arrayidx.6, align 4, !tbaa !4
  %16 = load float, ptr %arrayidx39.6, align 4, !tbaa !4
  %17 = load float, ptr %arrayidx.7, align 4, !tbaa !4
  %18 = load float, ptr %arrayidx39.7, align 4, !tbaa !4
  %add40 = fadd float %3, %4
  %add40.1 = fadd float %5, %6
  %add40.2 = fadd float %7, %8
  %add40.3 = fadd float %9, %10
  %add40.4 = fadd float %11, %12
  %add40.5 = fadd float %13, %14
  %add40.6 = fadd float %15, %16
  %add40.7 = fadd float %17, %18
  store float %add40, ptr %arrayidx42, align 4, !tbaa !4
  store float %add40.1, ptr %arrayidx42.1, align 4, !tbaa !4
  store float %add40.2, ptr %arrayidx42.2, align 4, !tbaa !4
  store float %add40.3, ptr %arrayidx42.3, align 4, !tbaa !4
  store float %add40.4, ptr %arrayidx42.4, align 4, !tbaa !4
  store float %add40.5, ptr %arrayidx42.5, align 4, !tbaa !4
  store float %add40.6, ptr %arrayidx42.6, align 4, !tbaa !4
  store float %add40.7, ptr %arrayidx42.7, align 4, !tbaa !4
  %inc.7 = add nuw nsw i32 %col.080, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub
  br i1 %exitcond.not.7, label %for.body37.7, label %forCond113Preheader, !llvm.loop !8

for.body37.clone:                                 ; preds = %forCond113Preheader, %for.body37.clone
  %col.080.clone = phi i32 [ %inc.clone, %for.body37.clone ], [ %col.0.lcssa, %forCond113Preheader ]
  %mul.clone = mul nsw i32 %col.080.clone, %step1
  %arrayidx.clone = getelementptr inbounds float, ptr %ptr_input1.083, i32 %mul.clone
  %19 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %mul38.clone = mul nsw i32 %col.080.clone, %step2
  %arrayidx39.clone = getelementptr inbounds float, ptr %ptr_input2.084, i32 %mul38.clone
  %20 = load float, ptr %arrayidx39.clone, align 4, !tbaa !4
  %add40.clone = fadd float %19, %20
  %mul41.clone = mul nsw i32 %col.080.clone, %step_out
  %arrayidx42.clone = getelementptr inbounds float, ptr %output.addr.082, i32 %mul41.clone
  store float %add40.clone, ptr %arrayidx42.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %col.080.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %cols
  br i1 %exitcond.not.clone, label %for.cond.cleanup36, label %for.body37.clone, !llvm.loop !8

for.cond.cleanup36:                               ; preds = %for.body37.clone, %forCond113Preheader
  %add.ptr = getelementptr inbounds float, ptr %ptr_input1.083, i32 %add
  %add.ptr43 = getelementptr inbounds float, ptr %ptr_input2.084, i32 %add31
  %add.ptr44 = getelementptr inbounds float, ptr %output.addr.082, i32 %add32
  %inc46 = add nuw nsw i32 %row.085, 1
  %exitcond86.not = icmp eq i32 %inc46, %rows
  br i1 %exitcond86.not, label %return, label %for.cond34.preheader, !llvm.loop !10

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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
