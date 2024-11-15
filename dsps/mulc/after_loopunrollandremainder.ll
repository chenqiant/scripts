; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_mulc_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_mulc_f32_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, i32 noundef %len, float noundef %C, i32 noundef %step_in, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp4 = icmp sgt i32 %len, 2
  br i1 %cmp4, label %for.cond.preheader.new, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp413 = icmp sgt i32 %len, 0
  br i1 %cmp413, label %for.body.clone, label %return

for.cond.preheader.new:                           ; preds = %if.end
  %sub = add nsw i32 %len, -16
  %cmp6.not207 = icmp ult i32 %len, 16
  br i1 %cmp6.not207, label %for.cond.preheader.new2, label %for.body.modify

for.cond.preheader.new2:                          ; preds = %for.body.modify, %for.cond.preheader.new
  %0 = phi i32 [ %1, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %cmp85209 = icmp slt i32 %0, %len
  br i1 %cmp85209, label %for.body, label %return

for.body.modify:                                  ; preds = %for.cond.preheader.new, %for.body.modify
  %i.014.modify = phi i32 [ %1, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %1 = add nuw i32 %i.014.modify, 16
  %add = or disjoint i32 %i.014.modify, 1
  %add3 = or disjoint i32 %i.014.modify, 2
  %add6 = or disjoint i32 %i.014.modify, 3
  %add10 = or disjoint i32 %i.014.modify, 4
  %add13 = or disjoint i32 %i.014.modify, 5
  %add16 = or disjoint i32 %i.014.modify, 6
  %add19 = or disjoint i32 %i.014.modify, 7
  %add22 = or disjoint i32 %i.014.modify, 8
  %add25 = or disjoint i32 %i.014.modify, 9
  %add28 = or disjoint i32 %i.014.modify, 10
  %add31 = or disjoint i32 %i.014.modify, 11
  %add34 = or disjoint i32 %i.014.modify, 12
  %add37 = or disjoint i32 %i.014.modify, 13
  %add40 = or disjoint i32 %i.014.modify, 14
  %add43 = or disjoint i32 %i.014.modify, 15
  %arrayidx.modify = getelementptr inbounds float, ptr %input, i32 %i.014.modify
  %arrayidx7.modify = getelementptr inbounds float, ptr %output, i32 %i.014.modify
  %arrayidx1 = getelementptr inbounds float, ptr %input, i32 %add
  %arrayidx2 = getelementptr inbounds float, ptr %output, i32 %add
  %arrayidx4 = getelementptr inbounds float, ptr %input, i32 %add3
  %arrayidx5 = getelementptr inbounds float, ptr %output, i32 %add3
  %arrayidx8 = getelementptr inbounds float, ptr %input, i32 %add6
  %arrayidx9 = getelementptr inbounds float, ptr %output, i32 %add6
  %arrayidx11 = getelementptr inbounds float, ptr %input, i32 %add10
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %add10
  %arrayidx14 = getelementptr inbounds float, ptr %input, i32 %add13
  %arrayidx15 = getelementptr inbounds float, ptr %output, i32 %add13
  %arrayidx17 = getelementptr inbounds float, ptr %input, i32 %add16
  %arrayidx18 = getelementptr inbounds float, ptr %output, i32 %add16
  %arrayidx20 = getelementptr inbounds float, ptr %input, i32 %add19
  %arrayidx21 = getelementptr inbounds float, ptr %output, i32 %add19
  %arrayidx23 = getelementptr inbounds float, ptr %input, i32 %add22
  %arrayidx24 = getelementptr inbounds float, ptr %output, i32 %add22
  %arrayidx26 = getelementptr inbounds float, ptr %input, i32 %add25
  %arrayidx27 = getelementptr inbounds float, ptr %output, i32 %add25
  %arrayidx29 = getelementptr inbounds float, ptr %input, i32 %add28
  %arrayidx30 = getelementptr inbounds float, ptr %output, i32 %add28
  %arrayidx32 = getelementptr inbounds float, ptr %input, i32 %add31
  %arrayidx33 = getelementptr inbounds float, ptr %output, i32 %add31
  %arrayidx35 = getelementptr inbounds float, ptr %input, i32 %add34
  %arrayidx36 = getelementptr inbounds float, ptr %output, i32 %add34
  %arrayidx38 = getelementptr inbounds float, ptr %input, i32 %add37
  %arrayidx39 = getelementptr inbounds float, ptr %output, i32 %add37
  %arrayidx41 = getelementptr inbounds float, ptr %input, i32 %add40
  %arrayidx42 = getelementptr inbounds float, ptr %output, i32 %add40
  %arrayidx44 = getelementptr inbounds float, ptr %input, i32 %add43
  %arrayidx45 = getelementptr inbounds float, ptr %output, i32 %add43
  %2 = load float, ptr %arrayidx.modify, align 4, !tbaa !4
  %3 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %6 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %7 = load float, ptr %arrayidx14, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx17, align 4, !tbaa !4
  %9 = load float, ptr %arrayidx20, align 4, !tbaa !4
  %10 = load float, ptr %arrayidx23, align 4, !tbaa !4
  %11 = load float, ptr %arrayidx26, align 4, !tbaa !4
  %12 = load float, ptr %arrayidx29, align 4, !tbaa !4
  %13 = load float, ptr %arrayidx32, align 4, !tbaa !4
  %14 = load float, ptr %arrayidx35, align 4, !tbaa !4
  %15 = load float, ptr %arrayidx38, align 4, !tbaa !4
  %16 = load float, ptr %arrayidx41, align 4, !tbaa !4
  %17 = load float, ptr %arrayidx44, align 4, !tbaa !4
  %mul5.modify = fmul float %C, %2
  %18 = fmul float %C, %3
  %19 = fmul float %C, %4
  %20 = fmul float %C, %5
  %21 = fmul float %C, %6
  %22 = fmul float %C, %7
  %23 = fmul float %C, %8
  %24 = fmul float %C, %9
  %25 = fmul float %C, %10
  %26 = fmul float %C, %11
  %27 = fmul float %C, %12
  %28 = fmul float %C, %13
  %29 = fmul float %C, %14
  %30 = fmul float %C, %15
  %31 = fmul float %C, %16
  %32 = fmul float %C, %17
  store float %mul5.modify, ptr %arrayidx7.modify, align 4, !tbaa !4
  store float %18, ptr %arrayidx2, align 4, !tbaa !4
  store float %19, ptr %arrayidx5, align 4, !tbaa !4
  store float %20, ptr %arrayidx9, align 4, !tbaa !4
  store float %21, ptr %arrayidx12, align 4, !tbaa !4
  store float %22, ptr %arrayidx15, align 4, !tbaa !4
  store float %23, ptr %arrayidx18, align 4, !tbaa !4
  store float %24, ptr %arrayidx21, align 4, !tbaa !4
  store float %25, ptr %arrayidx24, align 4, !tbaa !4
  store float %26, ptr %arrayidx27, align 4, !tbaa !4
  store float %27, ptr %arrayidx30, align 4, !tbaa !4
  store float %28, ptr %arrayidx33, align 4, !tbaa !4
  store float %29, ptr %arrayidx36, align 4, !tbaa !4
  store float %30, ptr %arrayidx39, align 4, !tbaa !4
  store float %31, ptr %arrayidx42, align 4, !tbaa !4
  store float %32, ptr %arrayidx45, align 4, !tbaa !4
  %exitcond.not.modify = icmp sgt i32 %1, %sub
  br i1 %exitcond.not.modify, label %for.cond.preheader.new2, label %for.body.modify, !llvm.loop !8

for.body:                                         ; preds = %for.cond.preheader.new2, %for.body
  %i.014 = phi i32 [ %inc, %for.body ], [ %0, %for.cond.preheader.new2 ]
  %mul = mul nsw i32 %i.014, %step_in
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %mul
  %33 = load float, ptr %arrayidx, align 4, !tbaa !4
  %mul5 = fmul float %C, %33
  %mul6 = mul nsw i32 %i.014, %step_out
  %arrayidx7 = getelementptr inbounds float, ptr %output, i32 %mul6
  store float %mul5, ptr %arrayidx7, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.014, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !8

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.014.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.014.clone, %step_in
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %mul.clone
  %34 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %mul5.clone = fmul float %C, %34
  %mul6.clone = mul nsw i32 %i.014.clone, %step_out
  %arrayidx7.clone = getelementptr inbounds float, ptr %output, i32 %mul6.clone
  store float %mul5.clone, ptr %arrayidx7.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %i.014.clone, 1
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
