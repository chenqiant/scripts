; ModuleID = 'dsps_dotprod_f32_best.c'
source_filename = "dsps_dotprod_f32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_dotprod_f32_ansi(ptr noalias nocapture noundef readonly %src1, ptr noalias nocapture noundef readonly %src2, ptr noalias nocapture noundef writeonly %dest, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i32 %len, 2
  br i1 %cmp, label %for.cond.preheader, label %for.cond46.preheader

for.cond46.preheader:                             ; preds = %entry
  %cmp47110 = icmp sgt i32 %len, 0
  br i1 %cmp47110, label %for.body48, label %if.end

for.cond.preheader:                               ; preds = %entry
  %sub = add nsw i32 %len, -7
  %cmp1113 = icmp ugt i32 %len, 7
  br i1 %cmp1113, label %for.body.preheader, label %for.cond31.preheader

for.body.preheader:                               ; preds = %for.cond.preheader
  %0 = and i32 %len, 2147483640
  br label %for.body

for.cond31.preheader:                             ; preds = %for.body, %for.cond.preheader
  %acc6.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %21, %for.body ]
  %acc7.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %24, %for.body ]
  %i.0.lcssa = phi i32 [ 0, %for.cond.preheader ], [ %0, %for.body ]
  %acc5.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %18, %for.body ]
  %acc4.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %15, %for.body ]
  %acc3.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %12, %for.body ]
  %acc2.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %9, %for.body ]
  %acc1.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %6, %for.body ]
  %acc0.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %3, %for.body ]
  %cmp32132 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp32132, label %for.body33, label %for.end37

for.body:                                         ; preds = %for.body.preheader, %for.body
  %acc0.0122 = phi float [ %3, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc1.0121 = phi float [ %6, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc2.0120 = phi float [ %9, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc3.0119 = phi float [ %12, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc4.0118 = phi float [ %15, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc5.0117 = phi float [ %18, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %i.0116 = phi i32 [ %add30, %for.body ], [ 0, %for.body.preheader ]
  %acc7.0115 = phi float [ %24, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc6.0114 = phi float [ %21, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %arrayidx = getelementptr inbounds float, ptr %src1, i32 %i.0116
  %1 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx2 = getelementptr inbounds float, ptr %src2, i32 %i.0116
  %2 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %3 = tail call float @llvm.fmuladd.f32(float %1, float %2, float %acc0.0122)
  %add = or disjoint i32 %i.0116, 1
  %arrayidx3 = getelementptr inbounds float, ptr %src1, i32 %add
  %4 = load float, ptr %arrayidx3, align 4, !tbaa !4
  %arrayidx5 = getelementptr inbounds float, ptr %src2, i32 %add
  %5 = load float, ptr %arrayidx5, align 4, !tbaa !4
  %6 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %acc1.0121)
  %add6 = or disjoint i32 %i.0116, 2
  %arrayidx7 = getelementptr inbounds float, ptr %src1, i32 %add6
  %7 = load float, ptr %arrayidx7, align 4, !tbaa !4
  %arrayidx9 = getelementptr inbounds float, ptr %src2, i32 %add6
  %8 = load float, ptr %arrayidx9, align 4, !tbaa !4
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %acc2.0120)
  %add10 = or disjoint i32 %i.0116, 3
  %arrayidx11 = getelementptr inbounds float, ptr %src1, i32 %add10
  %10 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %arrayidx13 = getelementptr inbounds float, ptr %src2, i32 %add10
  %11 = load float, ptr %arrayidx13, align 4, !tbaa !4
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %acc3.0119)
  %add14 = or disjoint i32 %i.0116, 4
  %arrayidx15 = getelementptr inbounds float, ptr %src1, i32 %add14
  %13 = load float, ptr %arrayidx15, align 4, !tbaa !4
  %arrayidx17 = getelementptr inbounds float, ptr %src2, i32 %add14
  %14 = load float, ptr %arrayidx17, align 4, !tbaa !4
  %15 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %acc4.0118)
  %add18 = or disjoint i32 %i.0116, 5
  %arrayidx19 = getelementptr inbounds float, ptr %src1, i32 %add18
  %16 = load float, ptr %arrayidx19, align 4, !tbaa !4
  %arrayidx21 = getelementptr inbounds float, ptr %src2, i32 %add18
  %17 = load float, ptr %arrayidx21, align 4, !tbaa !4
  %18 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %acc5.0117)
  %add22 = or disjoint i32 %i.0116, 6
  %arrayidx23 = getelementptr inbounds float, ptr %src1, i32 %add22
  %19 = load float, ptr %arrayidx23, align 4, !tbaa !4
  %arrayidx25 = getelementptr inbounds float, ptr %src2, i32 %add22
  %20 = load float, ptr %arrayidx25, align 4, !tbaa !4
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %acc6.0114)
  %add26 = or disjoint i32 %i.0116, 7
  %arrayidx27 = getelementptr inbounds float, ptr %src1, i32 %add26
  %22 = load float, ptr %arrayidx27, align 4, !tbaa !4
  %arrayidx29 = getelementptr inbounds float, ptr %src2, i32 %add26
  %23 = load float, ptr %arrayidx29, align 4, !tbaa !4
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %acc7.0115)
  %add30 = add nuw nsw i32 %i.0116, 8
  %cmp1 = icmp slt i32 %add30, %sub
  br i1 %cmp1, label %for.body, label %for.cond31.preheader, !llvm.loop !8

for.body33:                                       ; preds = %for.cond31.preheader, %for.body33
  %acc0.1134 = phi float [ %27, %for.body33 ], [ %acc0.0.lcssa, %for.cond31.preheader ]
  %i.1133 = phi i32 [ %inc, %for.body33 ], [ %i.0.lcssa, %for.cond31.preheader ]
  %arrayidx34 = getelementptr inbounds float, ptr %src1, i32 %i.1133
  %25 = load float, ptr %arrayidx34, align 4, !tbaa !4
  %arrayidx35 = getelementptr inbounds float, ptr %src2, i32 %i.1133
  %26 = load float, ptr %arrayidx35, align 4, !tbaa !4
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %acc0.1134)
  %inc = add nuw nsw i32 %i.1133, 1
  %exitcond145.not = icmp eq i32 %inc, %len
  br i1 %exitcond145.not, label %for.end37, label %for.body33, !llvm.loop !10

for.end37:                                        ; preds = %for.body33, %for.cond31.preheader
  %acc0.1.lcssa = phi float [ %acc0.0.lcssa, %for.cond31.preheader ], [ %27, %for.body33 ]
  %add38 = fadd float %acc1.0.lcssa, %acc0.1.lcssa
  %add39 = fadd float %acc3.0.lcssa, %acc2.0.lcssa
  %add40 = fadd float %acc5.0.lcssa, %acc4.0.lcssa
  %add41 = fadd float %acc6.0.lcssa, %acc7.0.lcssa
  %add42 = fadd float %add39, %add38
  %add43 = fadd float %add41, %add40
  %add44 = fadd float %add43, %add42
  br label %if.end

for.body48:                                       ; preds = %for.cond46.preheader, %for.body48
  %i45.0112 = phi i32 [ %inc52, %for.body48 ], [ 0, %for.cond46.preheader ]
  %acc.0111 = phi float [ %30, %for.body48 ], [ 0.000000e+00, %for.cond46.preheader ]
  %arrayidx49 = getelementptr inbounds float, ptr %src1, i32 %i45.0112
  %28 = load float, ptr %arrayidx49, align 4, !tbaa !4
  %arrayidx50 = getelementptr inbounds float, ptr %src2, i32 %i45.0112
  %29 = load float, ptr %arrayidx50, align 4, !tbaa !4
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float %acc.0111)
  %inc52 = add nuw nsw i32 %i45.0112, 1
  %exitcond.not = icmp eq i32 %inc52, %len
  br i1 %exitcond.not, label %if.end, label %for.body48, !llvm.loop !11

if.end:                                           ; preds = %for.body48, %for.cond46.preheader, %for.end37
  %storemerge = phi float [ %add44, %for.end37 ], [ 0.000000e+00, %for.cond46.preheader ], [ %30, %for.body48 ]
  store float %storemerge, ptr %dest, align 4, !tbaa !4
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zca,+zcmp,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
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
!11 = distinct !{!11, !9}
