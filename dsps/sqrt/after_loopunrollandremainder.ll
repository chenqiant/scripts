; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_sqrt_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local float @dsps_sqrtf_f32_ansi(float noundef %f) local_unnamed_addr #0 {
entry:
  %0 = bitcast float %f to i32
  %shr = ashr i32 %0, 1
  %add = add nsw i32 %shr, 532365312
  %1 = bitcast i32 %add to float
  ret float %1
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_sqrt_f32_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, i32 noundef %len) local_unnamed_addr #1 {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp4 = icmp sgt i32 %len, 2
  br i1 %cmp4, label %for.cond.preheader.new, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp411 = icmp sgt i32 %len, 0
  br i1 %cmp411, label %for.body.clone, label %return

for.cond.preheader.new:                           ; preds = %if.end
  %sub = add nsw i32 %len, -16
  %cmp6.not207 = icmp ult i32 %len, 16
  br i1 %cmp6.not207, label %for.cond.preheader.new2, label %for.body.modify

for.cond.preheader.new2:                          ; preds = %for.body.modify, %for.cond.preheader.new
  %0 = phi i32 [ %47, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %cmp85209 = icmp slt i32 %0, %len
  br i1 %cmp85209, label %for.body, label %return

for.body.modify:                                  ; preds = %for.cond.preheader.new, %for.body.modify
  %i.012.modify = phi i32 [ %47, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %arrayidx.modify = getelementptr inbounds float, ptr %input, i32 %i.012.modify
  %1 = load i32, ptr %arrayidx.modify, align 4, !tbaa !4
  %shr.i.modify = ashr i32 %1, 1
  %add.i.modify = add nsw i32 %shr.i.modify, 532365312
  %arrayidx5.modify = getelementptr inbounds float, ptr %output, i32 %i.012.modify
  store i32 %add.i.modify, ptr %arrayidx5.modify, align 4, !tbaa !4
  %add = or disjoint i32 %i.012.modify, 1
  %arrayidx1 = getelementptr inbounds float, ptr %input, i32 %add
  %2 = load i32, ptr %arrayidx1, align 4, !tbaa !4
  %3 = ashr i32 %2, 1
  %4 = add nsw i32 %3, 532365312
  %arrayidx2 = getelementptr inbounds float, ptr %output, i32 %add
  store i32 %4, ptr %arrayidx2, align 4, !tbaa !4
  %add3 = or disjoint i32 %i.012.modify, 2
  %arrayidx4 = getelementptr inbounds float, ptr %input, i32 %add3
  %5 = load i32, ptr %arrayidx4, align 4, !tbaa !4
  %6 = ashr i32 %5, 1
  %7 = add nsw i32 %6, 532365312
  %arrayidx6 = getelementptr inbounds float, ptr %output, i32 %add3
  store i32 %7, ptr %arrayidx6, align 4, !tbaa !4
  %add7 = or disjoint i32 %i.012.modify, 3
  %arrayidx8 = getelementptr inbounds float, ptr %input, i32 %add7
  %8 = load i32, ptr %arrayidx8, align 4, !tbaa !4
  %9 = ashr i32 %8, 1
  %10 = add nsw i32 %9, 532365312
  %arrayidx9 = getelementptr inbounds float, ptr %output, i32 %add7
  store i32 %10, ptr %arrayidx9, align 4, !tbaa !4
  %add10 = or disjoint i32 %i.012.modify, 4
  %arrayidx11 = getelementptr inbounds float, ptr %input, i32 %add10
  %11 = load i32, ptr %arrayidx11, align 4, !tbaa !4
  %12 = ashr i32 %11, 1
  %13 = add nsw i32 %12, 532365312
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %add10
  store i32 %13, ptr %arrayidx12, align 4, !tbaa !4
  %add13 = or disjoint i32 %i.012.modify, 5
  %arrayidx14 = getelementptr inbounds float, ptr %input, i32 %add13
  %14 = load i32, ptr %arrayidx14, align 4, !tbaa !4
  %15 = ashr i32 %14, 1
  %16 = add nsw i32 %15, 532365312
  %arrayidx15 = getelementptr inbounds float, ptr %output, i32 %add13
  store i32 %16, ptr %arrayidx15, align 4, !tbaa !4
  %add16 = or disjoint i32 %i.012.modify, 6
  %arrayidx17 = getelementptr inbounds float, ptr %input, i32 %add16
  %17 = load i32, ptr %arrayidx17, align 4, !tbaa !4
  %18 = ashr i32 %17, 1
  %19 = add nsw i32 %18, 532365312
  %arrayidx18 = getelementptr inbounds float, ptr %output, i32 %add16
  store i32 %19, ptr %arrayidx18, align 4, !tbaa !4
  %add19 = or disjoint i32 %i.012.modify, 7
  %arrayidx20 = getelementptr inbounds float, ptr %input, i32 %add19
  %20 = load i32, ptr %arrayidx20, align 4, !tbaa !4
  %21 = ashr i32 %20, 1
  %22 = add nsw i32 %21, 532365312
  %arrayidx21 = getelementptr inbounds float, ptr %output, i32 %add19
  store i32 %22, ptr %arrayidx21, align 4, !tbaa !4
  %add22 = or disjoint i32 %i.012.modify, 8
  %arrayidx23 = getelementptr inbounds float, ptr %input, i32 %add22
  %23 = load i32, ptr %arrayidx23, align 4, !tbaa !4
  %24 = ashr i32 %23, 1
  %25 = add nsw i32 %24, 532365312
  %arrayidx24 = getelementptr inbounds float, ptr %output, i32 %add22
  store i32 %25, ptr %arrayidx24, align 4, !tbaa !4
  %add25 = or disjoint i32 %i.012.modify, 9
  %arrayidx26 = getelementptr inbounds float, ptr %input, i32 %add25
  %26 = load i32, ptr %arrayidx26, align 4, !tbaa !4
  %27 = ashr i32 %26, 1
  %28 = add nsw i32 %27, 532365312
  %arrayidx27 = getelementptr inbounds float, ptr %output, i32 %add25
  store i32 %28, ptr %arrayidx27, align 4, !tbaa !4
  %add28 = or disjoint i32 %i.012.modify, 10
  %arrayidx29 = getelementptr inbounds float, ptr %input, i32 %add28
  %29 = load i32, ptr %arrayidx29, align 4, !tbaa !4
  %30 = ashr i32 %29, 1
  %31 = add nsw i32 %30, 532365312
  %arrayidx30 = getelementptr inbounds float, ptr %output, i32 %add28
  store i32 %31, ptr %arrayidx30, align 4, !tbaa !4
  %add31 = or disjoint i32 %i.012.modify, 11
  %arrayidx32 = getelementptr inbounds float, ptr %input, i32 %add31
  %32 = load i32, ptr %arrayidx32, align 4, !tbaa !4
  %33 = ashr i32 %32, 1
  %34 = add nsw i32 %33, 532365312
  %arrayidx33 = getelementptr inbounds float, ptr %output, i32 %add31
  store i32 %34, ptr %arrayidx33, align 4, !tbaa !4
  %add34 = or disjoint i32 %i.012.modify, 12
  %arrayidx35 = getelementptr inbounds float, ptr %input, i32 %add34
  %35 = load i32, ptr %arrayidx35, align 4, !tbaa !4
  %36 = ashr i32 %35, 1
  %37 = add nsw i32 %36, 532365312
  %arrayidx36 = getelementptr inbounds float, ptr %output, i32 %add34
  store i32 %37, ptr %arrayidx36, align 4, !tbaa !4
  %add37 = or disjoint i32 %i.012.modify, 13
  %arrayidx38 = getelementptr inbounds float, ptr %input, i32 %add37
  %38 = load i32, ptr %arrayidx38, align 4, !tbaa !4
  %39 = ashr i32 %38, 1
  %40 = add nsw i32 %39, 532365312
  %arrayidx39 = getelementptr inbounds float, ptr %output, i32 %add37
  store i32 %40, ptr %arrayidx39, align 4, !tbaa !4
  %add40 = or disjoint i32 %i.012.modify, 14
  %arrayidx41 = getelementptr inbounds float, ptr %input, i32 %add40
  %41 = load i32, ptr %arrayidx41, align 4, !tbaa !4
  %42 = ashr i32 %41, 1
  %43 = add nsw i32 %42, 532365312
  %arrayidx42 = getelementptr inbounds float, ptr %output, i32 %add40
  store i32 %43, ptr %arrayidx42, align 4, !tbaa !4
  %add43 = or disjoint i32 %i.012.modify, 15
  %arrayidx44 = getelementptr inbounds float, ptr %input, i32 %add43
  %44 = load i32, ptr %arrayidx44, align 4, !tbaa !4
  %45 = ashr i32 %44, 1
  %46 = add nsw i32 %45, 532365312
  %arrayidx45 = getelementptr inbounds float, ptr %output, i32 %add43
  store i32 %46, ptr %arrayidx45, align 4, !tbaa !4
  %47 = add nuw i32 %i.012.modify, 16
  %exitcond.not.modify = icmp sgt i32 %47, %sub
  br i1 %exitcond.not.modify, label %for.cond.preheader.new2, label %for.body.modify, !llvm.loop !8

for.body:                                         ; preds = %for.cond.preheader.new2, %for.body
  %i.012 = phi i32 [ %inc, %for.body ], [ %0, %for.cond.preheader.new2 ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.012
  %48 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %shr.i = ashr i32 %48, 1
  %add.i = add nsw i32 %shr.i, 532365312
  %arrayidx5 = getelementptr inbounds float, ptr %output, i32 %i.012
  store i32 %add.i, ptr %arrayidx5, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.012, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !8

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.012.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %i.012.clone
  %49 = load i32, ptr %arrayidx.clone, align 4, !tbaa !4
  %shr.i.clone = ashr i32 %49, 1
  %add.i.clone = add nsw i32 %shr.i.clone, 532365312
  %arrayidx5.clone = getelementptr inbounds float, ptr %output, i32 %i.012.clone
  store i32 %add.i.clone, ptr %arrayidx5.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %i.012.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone, !llvm.loop !8

return:                                           ; preds = %for.cond.preheader.new2, %for.body.clone, %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ], [ 0, %for.body.clone ], [ 0, %for.cond.preheader.new2 ]
  ret i32 %retval.0
}

attributes #0 = { inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
