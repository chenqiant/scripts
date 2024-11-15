; ModuleID = 'after_customlicm.ll'
source_filename = "test.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define dso_local float @test_loop(ptr noalias nocapture noundef readonly %data1, ptr noalias nocapture noundef readonly %data2, i32 noundef %start_index, i32 noundef %end_index, i32 noundef %update1, i32 noundef %update2, float noundef %offset) local_unnamed_addr #0 {
entry:
  %invariant.gep = getelementptr float, ptr %data1, i32 %update1
  %invariant.gep8 = getelementptr float, ptr %data2, i32 %update2
  %sub = add nsw i32 %end_index, -8
  %cmp10 = icmp slt i32 %sub, %start_index
  br i1 %cmp10, label %for.cond.preheader, label %for.body.7

for.cond.preheader:                               ; preds = %for.body.7, %entry
  %result0.0.lcssa = phi i32 [ %start_index, %entry ], [ %inc.7, %for.body.7 ]
  %result0.0.lcssa1 = phi float [ 0.000000e+00, %entry ], [ %add3.7, %for.body.7 ]
  %result0.0.lcssa2 = phi float [ 0.000000e+00, %entry ], [ %add3.6, %for.body.7 ]
  %result0.0.lcssa3 = phi float [ 0.000000e+00, %entry ], [ %add3.5, %for.body.7 ]
  %result0.0.lcssa4 = phi float [ 0.000000e+00, %entry ], [ %add3.4, %for.body.7 ]
  %result0.0.lcssa5 = phi float [ 0.000000e+00, %entry ], [ %add3.3, %for.body.7 ]
  %result0.0.lcssa6 = phi float [ 0.000000e+00, %entry ], [ %add3.2, %for.body.7 ]
  %result0.0.lcssa7 = phi float [ 0.000000e+00, %entry ], [ %add3.1, %for.body.7 ]
  %result0.0.lcssa8 = phi float [ 0.000000e+00, %entry ], [ %add3, %for.body.7 ]
  %cmp = icmp slt i32 %result0.0.lcssa, %end_index
  br i1 %cmp, label %for.body.clone, label %for.end

for.body.7:                                       ; preds = %for.body.7, %entry
  %i.012 = phi i32 [ %start_index, %entry ], [ %inc.7, %for.body.7 ]
  %result6 = phi float [ 0.000000e+00, %entry ], [ %add3.6, %for.body.7 ]
  %result5 = phi float [ 0.000000e+00, %entry ], [ %add3.5, %for.body.7 ]
  %result4 = phi float [ 0.000000e+00, %entry ], [ %add3.4, %for.body.7 ]
  %result3 = phi float [ 0.000000e+00, %entry ], [ %add3.3, %for.body.7 ]
  %result2 = phi float [ 0.000000e+00, %entry ], [ %add3.2, %for.body.7 ]
  %result1 = phi float [ 0.000000e+00, %entry ], [ %add3.1, %for.body.7 ]
  %result0 = phi float [ 0.000000e+00, %entry ], [ %add3, %for.body.7 ]
  %gep = getelementptr float, ptr %invariant.gep, i32 %i.012
  %0 = load float, ptr %gep, align 4, !tbaa !4
  %gep9 = getelementptr float, ptr %invariant.gep8, i32 %i.012
  %1 = load float, ptr %gep9, align 4, !tbaa !4
  %2 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %offset)
  %add3 = fadd float %result0, %2
  %inc = add nsw i32 %i.012, 1
  %gep.1 = getelementptr float, ptr %invariant.gep, i32 %inc
  %3 = load float, ptr %gep.1, align 4, !tbaa !4
  %gep9.1 = getelementptr float, ptr %invariant.gep8, i32 %inc
  %4 = load float, ptr %gep9.1, align 4, !tbaa !4
  %5 = tail call float @llvm.fmuladd.f32(float %3, float %4, float %offset)
  %add3.1 = fadd float %result1, %5
  %inc.1 = add nsw i32 %i.012, 2
  %gep.2 = getelementptr float, ptr %invariant.gep, i32 %inc.1
  %6 = load float, ptr %gep.2, align 4, !tbaa !4
  %gep9.2 = getelementptr float, ptr %invariant.gep8, i32 %inc.1
  %7 = load float, ptr %gep9.2, align 4, !tbaa !4
  %8 = tail call float @llvm.fmuladd.f32(float %6, float %7, float %offset)
  %add3.2 = fadd float %result2, %8
  %inc.2 = add nsw i32 %i.012, 3
  %gep.3 = getelementptr float, ptr %invariant.gep, i32 %inc.2
  %9 = load float, ptr %gep.3, align 4, !tbaa !4
  %gep9.3 = getelementptr float, ptr %invariant.gep8, i32 %inc.2
  %10 = load float, ptr %gep9.3, align 4, !tbaa !4
  %11 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %offset)
  %add3.3 = fadd float %result3, %11
  %inc.3 = add nsw i32 %i.012, 4
  %gep.4 = getelementptr float, ptr %invariant.gep, i32 %inc.3
  %12 = load float, ptr %gep.4, align 4, !tbaa !4
  %gep9.4 = getelementptr float, ptr %invariant.gep8, i32 %inc.3
  %13 = load float, ptr %gep9.4, align 4, !tbaa !4
  %14 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %offset)
  %add3.4 = fadd float %result4, %14
  %inc.4 = add nsw i32 %i.012, 5
  %gep.5 = getelementptr float, ptr %invariant.gep, i32 %inc.4
  %15 = load float, ptr %gep.5, align 4, !tbaa !4
  %gep9.5 = getelementptr float, ptr %invariant.gep8, i32 %inc.4
  %16 = load float, ptr %gep9.5, align 4, !tbaa !4
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %offset)
  %add3.5 = fadd float %result5, %17
  %inc.5 = add nsw i32 %i.012, 6
  %gep.6 = getelementptr float, ptr %invariant.gep, i32 %inc.5
  %18 = load float, ptr %gep.6, align 4, !tbaa !4
  %gep9.6 = getelementptr float, ptr %invariant.gep8, i32 %inc.5
  %19 = load float, ptr %gep9.6, align 4, !tbaa !4
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %offset)
  %add3.6 = fadd float %result6, %20
  %inc.6 = add nsw i32 %i.012, 7
  %gep.7 = getelementptr float, ptr %invariant.gep, i32 %inc.6
  %21 = load float, ptr %gep.7, align 4, !tbaa !4
  %gep9.7 = getelementptr float, ptr %invariant.gep8, i32 %inc.6
  %22 = load float, ptr %gep9.7, align 4, !tbaa !4
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %offset)
  %add3.7 = fadd float %add3.6, %23
  %inc.7 = add nsw i32 %i.012, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub
  br i1 %exitcond.not.7, label %for.cond.preheader, label %for.body.7, !llvm.loop !8

for.body.clone:                                   ; preds = %for.cond.preheader, %for.body.clone
  %i.012.clone = phi i32 [ %result0.0.lcssa, %for.cond.preheader ], [ %inc.clone, %for.body.clone ]
  %result.011.clone = phi float [ %result0.0.lcssa8, %for.cond.preheader ], [ %add3.clone, %for.body.clone ]
  %gep.clone = getelementptr float, ptr %invariant.gep, i32 %i.012.clone
  %24 = load float, ptr %gep.clone, align 4, !tbaa !4
  %gep9.clone = getelementptr float, ptr %invariant.gep8, i32 %i.012.clone
  %25 = load float, ptr %gep9.clone, align 4, !tbaa !4
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %offset)
  %add3.clone = fadd float %result.011.clone, %26
  %inc.clone = add nsw i32 %i.012.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %end_index
  br i1 %exitcond.not.clone, label %for.end, label %for.body.clone, !llvm.loop !8

for.end:                                          ; preds = %for.cond.preheader, %for.body.clone
  %result.0.lcssa = phi float [ %add3.clone, %for.body.clone ], [ %result0.0.lcssa8, %for.cond.preheader ]
  %add0 = fadd float %result0.0.lcssa1, %result.0.lcssa
  %add1 = fadd float %result0.0.lcssa2, %add0
  %add2 = fadd float %result0.0.lcssa3, %add1
  %add39 = fadd float %result0.0.lcssa4, %add2
  %add4 = fadd float %result0.0.lcssa5, %add39
  %add5 = fadd float %result0.0.lcssa6, %add4
  %add6 = fadd float %result0.0.lcssa7, %add5
  ret float %add6
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
