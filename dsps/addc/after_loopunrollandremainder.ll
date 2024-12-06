; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_addc_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_addc_f32_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, i32 noundef %len, float noundef %C, i32 noundef %step_in, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp4 = icmp sgt i32 %len, 2
  br i1 %cmp4, label %for.cond.preheader.new, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp412 = icmp sgt i32 %len, 0
  br i1 %cmp412, label %for.body.clone, label %return

for.cond.preheader.new:                           ; preds = %if.end
  %sub = add nsw i32 %len, -16
  %cmp6.not207 = icmp ult i32 %len, 16
  br i1 %cmp6.not207, label %for.cond.preheader.new2, label %for.body.modify

for.cond.preheader.new2:                          ; preds = %for.body.modify, %for.cond.preheader.new
  %0 = phi i32 [ %1, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %cmp85209 = icmp slt i32 %0, %len
  br i1 %cmp85209, label %for.body, label %return

for.body.modify:                                  ; preds = %for.cond.preheader.new, %for.body.modify
  %i.013.modify = phi i32 [ %1, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %1 = add nuw i32 %i.013.modify, 16
  %add2 = or disjoint i32 %i.013.modify, 1
  %add6 = or disjoint i32 %i.013.modify, 2
  %add10 = or disjoint i32 %i.013.modify, 3
  %add14 = or disjoint i32 %i.013.modify, 4
  %add18 = or disjoint i32 %i.013.modify, 5
  %add22 = or disjoint i32 %i.013.modify, 6
  %add26 = or disjoint i32 %i.013.modify, 7
  %add30 = or disjoint i32 %i.013.modify, 8
  %add34 = or disjoint i32 %i.013.modify, 9
  %add38 = or disjoint i32 %i.013.modify, 10
  %add42 = or disjoint i32 %i.013.modify, 11
  %add46 = or disjoint i32 %i.013.modify, 12
  %add50 = or disjoint i32 %i.013.modify, 13
  %add54 = or disjoint i32 %i.013.modify, 14
  %add58 = or disjoint i32 %i.013.modify, 15
  %arrayidx.modify = getelementptr inbounds float, ptr %input, i32 %i.013.modify
  %arrayidx6.modify = getelementptr inbounds float, ptr %output, i32 %i.013.modify
  %arrayidx3 = getelementptr inbounds float, ptr %input, i32 %add2
  %arrayidx5 = getelementptr inbounds float, ptr %output, i32 %add2
  %arrayidx7 = getelementptr inbounds float, ptr %input, i32 %add6
  %arrayidx9 = getelementptr inbounds float, ptr %output, i32 %add6
  %arrayidx11 = getelementptr inbounds float, ptr %input, i32 %add10
  %arrayidx13 = getelementptr inbounds float, ptr %output, i32 %add10
  %arrayidx15 = getelementptr inbounds float, ptr %input, i32 %add14
  %arrayidx17 = getelementptr inbounds float, ptr %output, i32 %add14
  %arrayidx19 = getelementptr inbounds float, ptr %input, i32 %add18
  %arrayidx21 = getelementptr inbounds float, ptr %output, i32 %add18
  %arrayidx23 = getelementptr inbounds float, ptr %input, i32 %add22
  %arrayidx25 = getelementptr inbounds float, ptr %output, i32 %add22
  %arrayidx27 = getelementptr inbounds float, ptr %input, i32 %add26
  %arrayidx29 = getelementptr inbounds float, ptr %output, i32 %add26
  %arrayidx31 = getelementptr inbounds float, ptr %input, i32 %add30
  %arrayidx33 = getelementptr inbounds float, ptr %output, i32 %add30
  %arrayidx35 = getelementptr inbounds float, ptr %input, i32 %add34
  %arrayidx37 = getelementptr inbounds float, ptr %output, i32 %add34
  %arrayidx39 = getelementptr inbounds float, ptr %input, i32 %add38
  %arrayidx41 = getelementptr inbounds float, ptr %output, i32 %add38
  %arrayidx43 = getelementptr inbounds float, ptr %input, i32 %add42
  %arrayidx45 = getelementptr inbounds float, ptr %output, i32 %add42
  %arrayidx47 = getelementptr inbounds float, ptr %input, i32 %add46
  %arrayidx49 = getelementptr inbounds float, ptr %output, i32 %add46
  %arrayidx51 = getelementptr inbounds float, ptr %input, i32 %add50
  %arrayidx53 = getelementptr inbounds float, ptr %output, i32 %add50
  %arrayidx55 = getelementptr inbounds float, ptr %input, i32 %add54
  %arrayidx57 = getelementptr inbounds float, ptr %output, i32 %add54
  %arrayidx59 = getelementptr inbounds float, ptr %input, i32 %add58
  %arrayidx61 = getelementptr inbounds float, ptr %output, i32 %add58
  %2 = load float, ptr %arrayidx.modify, align 4, !tbaa !4
  %3 = load float, ptr %arrayidx3, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx7, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %6 = load float, ptr %arrayidx15, align 4, !tbaa !4
  %7 = load float, ptr %arrayidx19, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx23, align 4, !tbaa !4
  %9 = load float, ptr %arrayidx27, align 4, !tbaa !4
  %10 = load float, ptr %arrayidx31, align 4, !tbaa !4
  %11 = load float, ptr %arrayidx35, align 4, !tbaa !4
  %12 = load float, ptr %arrayidx39, align 4, !tbaa !4
  %13 = load float, ptr %arrayidx43, align 4, !tbaa !4
  %14 = load float, ptr %arrayidx47, align 4, !tbaa !4
  %15 = load float, ptr %arrayidx51, align 4, !tbaa !4
  %16 = load float, ptr %arrayidx55, align 4, !tbaa !4
  %17 = load float, ptr %arrayidx59, align 4, !tbaa !4
  %add.modify = fadd float %C, %2
  %add4 = fadd float %C, %3
  %add8 = fadd float %C, %4
  %add12 = fadd float %C, %5
  %add16 = fadd float %C, %6
  %add20 = fadd float %C, %7
  %add24 = fadd float %C, %8
  %add28 = fadd float %C, %9
  %add32 = fadd float %C, %10
  %add36 = fadd float %C, %11
  %add40 = fadd float %C, %12
  %add44 = fadd float %C, %13
  %add48 = fadd float %C, %14
  %add52 = fadd float %C, %15
  %add56 = fadd float %C, %16
  %add60 = fadd float %C, %17
  store float %add.modify, ptr %arrayidx6.modify, align 4, !tbaa !4
  store float %add4, ptr %arrayidx5, align 4, !tbaa !4
  store float %add8, ptr %arrayidx9, align 4, !tbaa !4
  store float %add12, ptr %arrayidx13, align 4, !tbaa !4
  store float %add16, ptr %arrayidx17, align 4, !tbaa !4
  store float %add20, ptr %arrayidx21, align 4, !tbaa !4
  store float %add24, ptr %arrayidx25, align 4, !tbaa !4
  store float %add28, ptr %arrayidx29, align 4, !tbaa !4
  store float %add32, ptr %arrayidx33, align 4, !tbaa !4
  store float %add36, ptr %arrayidx37, align 4, !tbaa !4
  store float %add40, ptr %arrayidx41, align 4, !tbaa !4
  store float %add44, ptr %arrayidx45, align 4, !tbaa !4
  store float %add48, ptr %arrayidx49, align 4, !tbaa !4
  store float %add52, ptr %arrayidx53, align 4, !tbaa !4
  store float %add56, ptr %arrayidx57, align 4, !tbaa !4
  store float %add60, ptr %arrayidx61, align 4, !tbaa !4
  %exitcond.not.modify = icmp sgt i32 %1, %sub
  br i1 %exitcond.not.modify, label %for.cond.preheader.new2, label %for.body.modify, !llvm.loop !8

for.body:                                         ; preds = %for.cond.preheader.new2, %for.body
  %i.013 = phi i32 [ %inc, %for.body ], [ %0, %for.cond.preheader.new2 ]
  %mul = mul nsw i32 %i.013, %step_in
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %mul
  %18 = load float, ptr %arrayidx, align 4, !tbaa !4
  %add = fadd float %C, %18
  %mul5 = mul nsw i32 %i.013, %step_out
  %arrayidx6 = getelementptr inbounds float, ptr %output, i32 %mul5
  store float %add, ptr %arrayidx6, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.013, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !8

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.013.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.013.clone, %step_in
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %mul.clone
  %19 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %add.clone = fadd float %C, %19
  %mul5.clone = mul nsw i32 %i.013.clone, %step_out
  %arrayidx6.clone = getelementptr inbounds float, ptr %output, i32 %mul5.clone
  store float %add.clone, ptr %arrayidx6.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %i.013.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone, !llvm.loop !8

return:                                           ; preds = %for.cond.preheader.new2, %for.body.clone, %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ], [ 0, %for.body.clone ], [ 0, %for.cond.preheader.new2 ]
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
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
