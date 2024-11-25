; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_add_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_add_f32_ansi(ptr noalias noundef readonly %input1, ptr noalias noundef readonly %input2, ptr noalias noundef writeonly %output, i32 noundef %len, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input1, null
  %cmp1 = icmp eq ptr %input2, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %output, null
  %or.cond19 = or i1 %or.cond, %cmp4
  br i1 %or.cond19, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp41 = icmp sgt i32 %len, 2
  br i1 %cmp41, label %for.cond.preheader.new, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp720 = icmp sgt i32 %len, 0
  br i1 %cmp720, label %for.body.clone, label %return

for.cond.preheader.new:                           ; preds = %if.end
  %sub = add nsw i32 %len, -16
  %cmp6.not207 = icmp ult i32 %len, 16
  br i1 %cmp6.not207, label %for.cond.preheader.new2, label %for.body.modify

for.cond.preheader.new2:                          ; preds = %for.body.modify, %for.cond.preheader.new
  %0 = phi i32 [ %1, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %cmp85209 = icmp slt i32 %0, %len
  br i1 %cmp85209, label %for.body, label %return

for.body.modify:                                  ; preds = %for.cond.preheader.new, %for.body.modify
  %i.021.modify = phi i32 [ %1, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %1 = add nuw i32 %i.021.modify, 16
  %add2 = or disjoint i32 %i.021.modify, 1
  %add7 = or disjoint i32 %i.021.modify, 2
  %add13 = or disjoint i32 %i.021.modify, 3
  %add18 = or disjoint i32 %i.021.modify, 4
  %add23 = or disjoint i32 %i.021.modify, 5
  %add28 = or disjoint i32 %i.021.modify, 6
  %add33 = or disjoint i32 %i.021.modify, 7
  %add38 = or disjoint i32 %i.021.modify, 8
  %add43 = or disjoint i32 %i.021.modify, 9
  %add48 = or disjoint i32 %i.021.modify, 10
  %add53 = or disjoint i32 %i.021.modify, 11
  %add58 = or disjoint i32 %i.021.modify, 12
  %add63 = or disjoint i32 %i.021.modify, 13
  %add68 = or disjoint i32 %i.021.modify, 14
  %add73 = or disjoint i32 %i.021.modify, 15
  %arrayidx.modify = getelementptr inbounds float, ptr %input1, i32 %i.021.modify
  %arrayidx9.modify = getelementptr inbounds float, ptr %input2, i32 %i.021.modify
  %arrayidx11.modify = getelementptr inbounds float, ptr %output, i32 %i.021.modify
  %arrayidx3 = getelementptr inbounds float, ptr %input1, i32 %add2
  %arrayidx4 = getelementptr inbounds float, ptr %input2, i32 %add2
  %arrayidx6 = getelementptr inbounds float, ptr %output, i32 %add2
  %arrayidx8 = getelementptr inbounds float, ptr %input1, i32 %add7
  %arrayidx10 = getelementptr inbounds float, ptr %input2, i32 %add7
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %add7
  %arrayidx14 = getelementptr inbounds float, ptr %input1, i32 %add13
  %arrayidx15 = getelementptr inbounds float, ptr %input2, i32 %add13
  %arrayidx17 = getelementptr inbounds float, ptr %output, i32 %add13
  %arrayidx19 = getelementptr inbounds float, ptr %input1, i32 %add18
  %arrayidx20 = getelementptr inbounds float, ptr %input2, i32 %add18
  %arrayidx22 = getelementptr inbounds float, ptr %output, i32 %add18
  %arrayidx24 = getelementptr inbounds float, ptr %input1, i32 %add23
  %arrayidx25 = getelementptr inbounds float, ptr %input2, i32 %add23
  %arrayidx27 = getelementptr inbounds float, ptr %output, i32 %add23
  %arrayidx29 = getelementptr inbounds float, ptr %input1, i32 %add28
  %arrayidx30 = getelementptr inbounds float, ptr %input2, i32 %add28
  %arrayidx32 = getelementptr inbounds float, ptr %output, i32 %add28
  %arrayidx34 = getelementptr inbounds float, ptr %input1, i32 %add33
  %arrayidx35 = getelementptr inbounds float, ptr %input2, i32 %add33
  %arrayidx37 = getelementptr inbounds float, ptr %output, i32 %add33
  %arrayidx39 = getelementptr inbounds float, ptr %input1, i32 %add38
  %arrayidx40 = getelementptr inbounds float, ptr %input2, i32 %add38
  %arrayidx42 = getelementptr inbounds float, ptr %output, i32 %add38
  %arrayidx44 = getelementptr inbounds float, ptr %input1, i32 %add43
  %arrayidx45 = getelementptr inbounds float, ptr %input2, i32 %add43
  %arrayidx47 = getelementptr inbounds float, ptr %output, i32 %add43
  %arrayidx49 = getelementptr inbounds float, ptr %input1, i32 %add48
  %arrayidx50 = getelementptr inbounds float, ptr %input2, i32 %add48
  %arrayidx52 = getelementptr inbounds float, ptr %output, i32 %add48
  %arrayidx54 = getelementptr inbounds float, ptr %input1, i32 %add53
  %arrayidx55 = getelementptr inbounds float, ptr %input2, i32 %add53
  %arrayidx57 = getelementptr inbounds float, ptr %output, i32 %add53
  %arrayidx59 = getelementptr inbounds float, ptr %input1, i32 %add58
  %arrayidx60 = getelementptr inbounds float, ptr %input2, i32 %add58
  %arrayidx62 = getelementptr inbounds float, ptr %output, i32 %add58
  %arrayidx64 = getelementptr inbounds float, ptr %input1, i32 %add63
  %arrayidx65 = getelementptr inbounds float, ptr %input2, i32 %add63
  %arrayidx67 = getelementptr inbounds float, ptr %output, i32 %add63
  %arrayidx69 = getelementptr inbounds float, ptr %input1, i32 %add68
  %arrayidx70 = getelementptr inbounds float, ptr %input2, i32 %add68
  %arrayidx72 = getelementptr inbounds float, ptr %output, i32 %add68
  %arrayidx74 = getelementptr inbounds float, ptr %input1, i32 %add73
  %arrayidx75 = getelementptr inbounds float, ptr %input2, i32 %add73
  %arrayidx77 = getelementptr inbounds float, ptr %output, i32 %add73
  %2 = load float, ptr %arrayidx.modify, align 4, !tbaa !4
  %3 = load float, ptr %arrayidx9.modify, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx3, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %6 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %7 = load float, ptr %arrayidx10, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx14, align 4, !tbaa !4
  %9 = load float, ptr %arrayidx15, align 4, !tbaa !4
  %10 = load float, ptr %arrayidx19, align 4, !tbaa !4
  %11 = load float, ptr %arrayidx20, align 4, !tbaa !4
  %12 = load float, ptr %arrayidx24, align 4, !tbaa !4
  %13 = load float, ptr %arrayidx25, align 4, !tbaa !4
  %14 = load float, ptr %arrayidx29, align 4, !tbaa !4
  %15 = load float, ptr %arrayidx30, align 4, !tbaa !4
  %16 = load float, ptr %arrayidx34, align 4, !tbaa !4
  %17 = load float, ptr %arrayidx35, align 4, !tbaa !4
  %18 = load float, ptr %arrayidx39, align 4, !tbaa !4
  %19 = load float, ptr %arrayidx40, align 4, !tbaa !4
  %20 = load float, ptr %arrayidx44, align 4, !tbaa !4
  %21 = load float, ptr %arrayidx45, align 4, !tbaa !4
  %22 = load float, ptr %arrayidx49, align 4, !tbaa !4
  %23 = load float, ptr %arrayidx50, align 4, !tbaa !4
  %24 = load float, ptr %arrayidx54, align 4, !tbaa !4
  %25 = load float, ptr %arrayidx55, align 4, !tbaa !4
  %26 = load float, ptr %arrayidx59, align 4, !tbaa !4
  %27 = load float, ptr %arrayidx60, align 4, !tbaa !4
  %28 = load float, ptr %arrayidx64, align 4, !tbaa !4
  %29 = load float, ptr %arrayidx65, align 4, !tbaa !4
  %30 = load float, ptr %arrayidx69, align 4, !tbaa !4
  %31 = load float, ptr %arrayidx70, align 4, !tbaa !4
  %32 = load float, ptr %arrayidx74, align 4, !tbaa !4
  %33 = load float, ptr %arrayidx75, align 4, !tbaa !4
  %add.modify = fadd float %2, %3
  %add5 = fadd float %4, %5
  %add11 = fadd float %6, %7
  %add16 = fadd float %8, %9
  %add21 = fadd float %10, %11
  %add26 = fadd float %12, %13
  %add31 = fadd float %14, %15
  %add36 = fadd float %16, %17
  %add41 = fadd float %18, %19
  %add46 = fadd float %20, %21
  %add51 = fadd float %22, %23
  %add56 = fadd float %24, %25
  %add61 = fadd float %26, %27
  %add66 = fadd float %28, %29
  %add71 = fadd float %30, %31
  %add76 = fadd float %32, %33
  store float %add.modify, ptr %arrayidx11.modify, align 4, !tbaa !4
  store float %add5, ptr %arrayidx6, align 4, !tbaa !4
  store float %add11, ptr %arrayidx12, align 4, !tbaa !4
  store float %add16, ptr %arrayidx17, align 4, !tbaa !4
  store float %add21, ptr %arrayidx22, align 4, !tbaa !4
  store float %add26, ptr %arrayidx27, align 4, !tbaa !4
  store float %add31, ptr %arrayidx32, align 4, !tbaa !4
  store float %add36, ptr %arrayidx37, align 4, !tbaa !4
  store float %add41, ptr %arrayidx42, align 4, !tbaa !4
  store float %add46, ptr %arrayidx47, align 4, !tbaa !4
  store float %add51, ptr %arrayidx52, align 4, !tbaa !4
  store float %add56, ptr %arrayidx57, align 4, !tbaa !4
  store float %add61, ptr %arrayidx62, align 4, !tbaa !4
  store float %add66, ptr %arrayidx67, align 4, !tbaa !4
  store float %add71, ptr %arrayidx72, align 4, !tbaa !4
  store float %add76, ptr %arrayidx77, align 4, !tbaa !4
  %exitcond.not.modify = icmp sgt i32 %1, %sub
  br i1 %exitcond.not.modify, label %for.cond.preheader.new2, label %for.body.modify, !llvm.loop !8

for.body:                                         ; preds = %for.cond.preheader.new2, %for.body
  %i.021 = phi i32 [ %inc, %for.body ], [ %0, %for.cond.preheader.new2 ]
  %mul = mul nsw i32 %i.021, %step1
  %arrayidx = getelementptr inbounds float, ptr %input1, i32 %mul
  %34 = load float, ptr %arrayidx, align 4, !tbaa !4
  %mul8 = mul nsw i32 %i.021, %step2
  %arrayidx9 = getelementptr inbounds float, ptr %input2, i32 %mul8
  %35 = load float, ptr %arrayidx9, align 4, !tbaa !4
  %add = fadd float %34, %35
  %mul10 = mul nsw i32 %i.021, %step_out
  %arrayidx11 = getelementptr inbounds float, ptr %output, i32 %mul10
  store float %add, ptr %arrayidx11, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.021, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !8

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.021.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.021.clone, %step1
  %arrayidx.clone = getelementptr inbounds float, ptr %input1, i32 %mul.clone
  %36 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %mul8.clone = mul nsw i32 %i.021.clone, %step2
  %arrayidx9.clone = getelementptr inbounds float, ptr %input2, i32 %mul8.clone
  %37 = load float, ptr %arrayidx9.clone, align 4, !tbaa !4
  %add.clone = fadd float %36, %37
  %mul10.clone = mul nsw i32 %i.021.clone, %step_out
  %arrayidx11.clone = getelementptr inbounds float, ptr %output, i32 %mul10.clone
  store float %add.clone, ptr %arrayidx11.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %i.021.clone, 1
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
