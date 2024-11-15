; ModuleID = 'test_best.c'
source_filename = "test_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define dso_local float @test_loop(ptr nocapture noundef readonly %data1, ptr nocapture noundef readonly %data2, i32 noundef %start_index, i32 noundef %end_index, i32 noundef %update1, i32 noundef %update2, float noundef %offset) local_unnamed_addr #0 {
entry:
  %sub = add nsw i32 %end_index, -7
  %invariant.gep = getelementptr float, ptr %data1, i32 %update1
  %invariant.gep142 = getelementptr float, ptr %data2, i32 %update2
  %cmp172 = icmp sgt i32 %sub, %start_index
  br i1 %cmp172, label %for.body, label %for.cond54.preheader

for.cond54.preheader:                             ; preds = %for.body, %entry
  %result0.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add3, %for.body ]
  %result1.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add10, %for.body ]
  %result2.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add17, %for.body ]
  %result3.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add24, %for.body ]
  %result4.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add31, %for.body ]
  %result5.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add38, %for.body ]
  %result6.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add45, %for.body ]
  %result7.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add52, %for.body ]
  %i.0.lcssa = phi i32 [ %start_index, %entry ], [ %add53, %for.body ]
  %cmp55194 = icmp slt i32 %i.0.lcssa, %end_index
  br i1 %cmp55194, label %for.body56, label %for.end63

for.body:                                         ; preds = %entry, %for.body
  %i.0181 = phi i32 [ %add53, %for.body ], [ %start_index, %entry ]
  %result7.0180 = phi float [ %add52, %for.body ], [ 0.000000e+00, %entry ]
  %result6.0179 = phi float [ %add45, %for.body ], [ 0.000000e+00, %entry ]
  %result5.0178 = phi float [ %add38, %for.body ], [ 0.000000e+00, %entry ]
  %result4.0177 = phi float [ %add31, %for.body ], [ 0.000000e+00, %entry ]
  %result3.0176 = phi float [ %add24, %for.body ], [ 0.000000e+00, %entry ]
  %result2.0175 = phi float [ %add17, %for.body ], [ 0.000000e+00, %entry ]
  %result1.0174 = phi float [ %add10, %for.body ], [ 0.000000e+00, %entry ]
  %result0.0173 = phi float [ %add3, %for.body ], [ 0.000000e+00, %entry ]
  %gep = getelementptr float, ptr %invariant.gep, i32 %i.0181
  %0 = load float, ptr %gep, align 4, !tbaa !4
  %gep143 = getelementptr float, ptr %invariant.gep142, i32 %i.0181
  %1 = load float, ptr %gep143, align 4, !tbaa !4
  %2 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %offset)
  %add3 = fadd float %result0.0173, %2
  %add4 = add nsw i32 %i.0181, 1
  %gep145 = getelementptr float, ptr %invariant.gep, i32 %add4
  %3 = load float, ptr %gep145, align 4, !tbaa !4
  %gep147 = getelementptr float, ptr %invariant.gep142, i32 %add4
  %4 = load float, ptr %gep147, align 4, !tbaa !4
  %5 = tail call float @llvm.fmuladd.f32(float %3, float %4, float %offset)
  %add10 = fadd float %result1.0174, %5
  %add11 = add nsw i32 %i.0181, 2
  %gep149 = getelementptr float, ptr %invariant.gep, i32 %add11
  %6 = load float, ptr %gep149, align 4, !tbaa !4
  %gep151 = getelementptr float, ptr %invariant.gep142, i32 %add11
  %7 = load float, ptr %gep151, align 4, !tbaa !4
  %8 = tail call float @llvm.fmuladd.f32(float %6, float %7, float %offset)
  %add17 = fadd float %result2.0175, %8
  %add18 = add nsw i32 %i.0181, 3
  %gep153 = getelementptr float, ptr %invariant.gep, i32 %add18
  %9 = load float, ptr %gep153, align 4, !tbaa !4
  %gep155 = getelementptr float, ptr %invariant.gep142, i32 %add18
  %10 = load float, ptr %gep155, align 4, !tbaa !4
  %11 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %offset)
  %add24 = fadd float %result3.0176, %11
  %add25 = add nsw i32 %i.0181, 4
  %gep157 = getelementptr float, ptr %invariant.gep, i32 %add25
  %12 = load float, ptr %gep157, align 4, !tbaa !4
  %gep159 = getelementptr float, ptr %invariant.gep142, i32 %add25
  %13 = load float, ptr %gep159, align 4, !tbaa !4
  %14 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %offset)
  %add31 = fadd float %result4.0177, %14
  %add32 = add nsw i32 %i.0181, 5
  %gep161 = getelementptr float, ptr %invariant.gep, i32 %add32
  %15 = load float, ptr %gep161, align 4, !tbaa !4
  %gep163 = getelementptr float, ptr %invariant.gep142, i32 %add32
  %16 = load float, ptr %gep163, align 4, !tbaa !4
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %offset)
  %add38 = fadd float %result5.0178, %17
  %add39 = add nsw i32 %i.0181, 6
  %gep165 = getelementptr float, ptr %invariant.gep, i32 %add39
  %18 = load float, ptr %gep165, align 4, !tbaa !4
  %gep167 = getelementptr float, ptr %invariant.gep142, i32 %add39
  %19 = load float, ptr %gep167, align 4, !tbaa !4
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %offset)
  %add45 = fadd float %result6.0179, %20
  %add46 = add nsw i32 %i.0181, 7
  %gep169 = getelementptr float, ptr %invariant.gep, i32 %add46
  %21 = load float, ptr %gep169, align 4, !tbaa !4
  %gep171 = getelementptr float, ptr %invariant.gep142, i32 %add46
  %22 = load float, ptr %gep171, align 4, !tbaa !4
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %offset)
  %add52 = fadd float %result7.0180, %23
  %add53 = add nsw i32 %i.0181, 8
  %cmp = icmp slt i32 %add53, %sub
  br i1 %cmp, label %for.body, label %for.cond54.preheader, !llvm.loop !8

for.body56:                                       ; preds = %for.cond54.preheader, %for.body56
  %i.1196 = phi i32 [ %inc, %for.body56 ], [ %i.0.lcssa, %for.cond54.preheader ]
  %result0.1195 = phi float [ %add61, %for.body56 ], [ %result0.0.lcssa, %for.cond54.preheader ]
  %gep191 = getelementptr float, ptr %invariant.gep, i32 %i.1196
  %24 = load float, ptr %gep191, align 4, !tbaa !4
  %gep193 = getelementptr float, ptr %invariant.gep142, i32 %i.1196
  %25 = load float, ptr %gep193, align 4, !tbaa !4
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %offset)
  %add61 = fadd float %result0.1195, %26
  %inc = add nsw i32 %i.1196, 1
  %exitcond.not = icmp eq i32 %inc, %end_index
  br i1 %exitcond.not, label %for.end63, label %for.body56, !llvm.loop !10

for.end63:                                        ; preds = %for.body56, %for.cond54.preheader
  %result0.1.lcssa = phi float [ %result0.0.lcssa, %for.cond54.preheader ], [ %add61, %for.body56 ]
  %add64 = fadd float %result1.0.lcssa, %result0.1.lcssa
  %add65 = fadd float %result2.0.lcssa, %add64
  %add66 = fadd float %result3.0.lcssa, %add65
  %add67 = fadd float %result4.0.lcssa, %add66
  %add68 = fadd float %result5.0.lcssa, %add67
  %add69 = fadd float %result6.0.lcssa, %add68
  %add70 = fadd float %result7.0.lcssa, %add69
  ret float %add70
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
!10 = distinct !{!10, !9}
