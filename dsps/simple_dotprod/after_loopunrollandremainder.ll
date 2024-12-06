; ModuleID = 'after_customlicm.ll'
source_filename = "test.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define dso_local float @test_loop(ptr noalias nocapture noundef readonly %data1, ptr noalias nocapture noundef readonly %data2) local_unnamed_addr #0 {
entry:
  br label %for.body

for.end:                                          ; preds = %for.body
  %add37 = fadd float %16, %17
  %add38 = fadd float %18, %19
  %add39 = fadd float %20, %21
  %add40 = fadd float %22, %23
  %add41 = fadd float %add37, %add38
  %add42 = fadd float %add39, %add40
  %add43 = fadd float %add41, %add42
  ret float %add43

for.body:                                         ; preds = %for.body, %entry
  %i.07 = phi i32 [ 0, %entry ], [ %inc.7, %for.body ]
  %.phi = phi float [ 0.000000e+00, %entry ], [ %16, %for.body ]
  %.phi1 = phi float [ 0.000000e+00, %entry ], [ %17, %for.body ]
  %.phi2 = phi float [ 0.000000e+00, %entry ], [ %18, %for.body ]
  %.phi3 = phi float [ 0.000000e+00, %entry ], [ %19, %for.body ]
  %.phi4 = phi float [ 0.000000e+00, %entry ], [ %20, %for.body ]
  %.phi5 = phi float [ 0.000000e+00, %entry ], [ %21, %for.body ]
  %.phi6 = phi float [ 0.000000e+00, %entry ], [ %22, %for.body ]
  %.phi7 = phi float [ 0.000000e+00, %entry ], [ %23, %for.body ]
  %inc.7 = add nuw nsw i32 %i.07, 8
  %add = or disjoint i32 %i.07, 1
  %add9 = or disjoint i32 %i.07, 2
  %add11 = or disjoint i32 %i.07, 3
  %add13 = or disjoint i32 %i.07, 4
  %add15 = or disjoint i32 %i.07, 5
  %add17 = or disjoint i32 %i.07, 6
  %add19 = or disjoint i32 %i.07, 7
  %arrayidx = getelementptr inbounds float, ptr %data1, i32 %i.07
  %arrayidx1 = getelementptr inbounds float, ptr %data2, i32 %i.07
  %arrayidx.1 = getelementptr inbounds float, ptr %data1, i32 %add
  %arrayidx1.1 = getelementptr inbounds float, ptr %data2, i32 %add
  %arrayidx.2 = getelementptr inbounds float, ptr %data1, i32 %add9
  %arrayidx1.2 = getelementptr inbounds float, ptr %data2, i32 %add9
  %arrayidx.3 = getelementptr inbounds float, ptr %data1, i32 %add11
  %arrayidx1.3 = getelementptr inbounds float, ptr %data2, i32 %add11
  %arrayidx.4 = getelementptr inbounds float, ptr %data1, i32 %add13
  %arrayidx1.4 = getelementptr inbounds float, ptr %data2, i32 %add13
  %arrayidx.5 = getelementptr inbounds float, ptr %data1, i32 %add15
  %arrayidx1.5 = getelementptr inbounds float, ptr %data2, i32 %add15
  %arrayidx.6 = getelementptr inbounds float, ptr %data1, i32 %add17
  %arrayidx1.6 = getelementptr inbounds float, ptr %data2, i32 %add17
  %arrayidx.7 = getelementptr inbounds float, ptr %data1, i32 %add19
  %arrayidx1.7 = getelementptr inbounds float, ptr %data2, i32 %add19
  %0 = load float, ptr %arrayidx, align 4, !tbaa !4
  %1 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %2 = load float, ptr %arrayidx.1, align 4, !tbaa !4
  %3 = load float, ptr %arrayidx1.1, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx.2, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx1.2, align 4, !tbaa !4
  %6 = load float, ptr %arrayidx.3, align 4, !tbaa !4
  %7 = load float, ptr %arrayidx1.3, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx.4, align 4, !tbaa !4
  %9 = load float, ptr %arrayidx1.4, align 4, !tbaa !4
  %10 = load float, ptr %arrayidx.5, align 4, !tbaa !4
  %11 = load float, ptr %arrayidx1.5, align 4, !tbaa !4
  %12 = load float, ptr %arrayidx.6, align 4, !tbaa !4
  %13 = load float, ptr %arrayidx1.6, align 4, !tbaa !4
  %14 = load float, ptr %arrayidx.7, align 4, !tbaa !4
  %15 = load float, ptr %arrayidx1.7, align 4, !tbaa !4
  %16 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %.phi)
  %17 = tail call float @llvm.fmuladd.f32(float %2, float %3, float %.phi1)
  %18 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %.phi2)
  %19 = tail call float @llvm.fmuladd.f32(float %6, float %7, float %.phi3)
  %20 = tail call float @llvm.fmuladd.f32(float %8, float %9, float %.phi4)
  %21 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %.phi5)
  %22 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %.phi6)
  %23 = tail call float @llvm.fmuladd.f32(float %14, float %15, float %.phi7)
  %cmp = icmp ult i32 %inc.7, 1009
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !8
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
