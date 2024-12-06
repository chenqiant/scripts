; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_dotprode_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_dotprode_f32_ansi(ptr noalias nocapture noundef readonly %src1, ptr noalias nocapture noundef readonly %src2, ptr noalias nocapture noundef writeonly %dest, i32 noundef %len, i32 noundef %step1, i32 noundef %step2) local_unnamed_addr #0 {
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.cond.preheader1, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp47110 = icmp sgt i32 %len, 0
  br i1 %cmp47110, label %for.body.clone, label %if.end

if.end:                                           ; preds = %for.end37, %for.body.clone, %for.cond.preheader
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %add44, %for.end37 ], [ %31, %for.body.clone ]
  store float %acc.0.lcssa, ptr %dest, align 4, !tbaa !4
  ret i32 0

for.cond.preheader1:                              ; preds = %entry
  %sub = add nsw i32 %len, -7
  %cmp1113 = icmp ugt i32 %len, 7
  br i1 %cmp1113, label %for.body.preheader, label %for.cond31.preheader

for.body.preheader:                               ; preds = %for.cond.preheader1
  %1 = and i32 %len, 2147483640
  br label %for.body

for.cond31.preheader:                             ; preds = %for.body, %for.cond.preheader1
  %acc0.0.lcssa = phi float [ %4, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc1.0.lcssa = phi float [ %7, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc2.0.lcssa = phi float [ %10, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc3.0.lcssa = phi float [ %13, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc4.0.lcssa = phi float [ %16, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc5.0.lcssa = phi float [ %19, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc6.0.lcssa = phi float [ %22, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %acc7.0.lcssa = phi float [ %25, %for.body ], [ 0.000000e+00, %for.cond.preheader1 ]
  %i.0.lcssa = phi i32 [ 0, %for.cond.preheader1 ], [ %1, %for.body ]
  %cmp32132 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp32132, label %for.body33, label %for.end37

for.body:                                         ; preds = %for.body, %for.body.preheader
  %i.0122 = phi i32 [ %add30, %for.body ], [ 0, %for.body.preheader ]
  %acc.09 = phi float [ %4, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc1 = phi float [ %7, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc2 = phi float [ %10, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc3 = phi float [ %13, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc4 = phi float [ %16, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc5 = phi float [ %19, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc6 = phi float [ %22, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc7 = phi float [ %25, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %mul = mul nsw i32 %i.0122, %step1
  %arrayidx = getelementptr inbounds float, ptr %src1, i32 %mul
  %2 = load float, ptr %arrayidx, align 4, !tbaa !4
  %mul1 = mul nsw i32 %i.0122, %step2
  %arrayidx2 = getelementptr inbounds float, ptr %src2, i32 %mul1
  %3 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %4 = tail call float @llvm.fmuladd.f32(float %2, float %3, float %acc.09)
  %add1 = or disjoint i32 %i.0122, 1
  %arrayidx1_0 = getelementptr inbounds float, ptr %src1, i32 %add1
  %5 = load float, ptr %arrayidx1_0, align 4, !tbaa !4
  %arrayidx1_1 = getelementptr inbounds float, ptr %src2, i32 %add1
  %6 = load float, ptr %arrayidx1_1, align 4, !tbaa !4
  %7 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %acc1)
  %add2 = or disjoint i32 %i.0122, 2
  %arrayidx2_0 = getelementptr inbounds float, ptr %src1, i32 %add2
  %8 = load float, ptr %arrayidx2_0, align 4, !tbaa !4
  %arrayidx2_1 = getelementptr inbounds float, ptr %src2, i32 %add2
  %9 = load float, ptr %arrayidx2_1, align 4, !tbaa !4
  %10 = tail call float @llvm.fmuladd.f32(float %8, float %9, float %acc2)
  %add3 = or disjoint i32 %i.0122, 3
  %arrayidx3_0 = getelementptr inbounds float, ptr %src1, i32 %add3
  %11 = load float, ptr %arrayidx3_0, align 4, !tbaa !4
  %arrayidx3_1 = getelementptr inbounds float, ptr %src2, i32 %add3
  %12 = load float, ptr %arrayidx3_1, align 4, !tbaa !4
  %13 = tail call float @llvm.fmuladd.f32(float %11, float %12, float %acc3)
  %add4 = or disjoint i32 %i.0122, 4
  %arrayidx4_0 = getelementptr inbounds float, ptr %src1, i32 %add4
  %14 = load float, ptr %arrayidx4_0, align 4, !tbaa !4
  %arrayidx4_1 = getelementptr inbounds float, ptr %src2, i32 %add4
  %15 = load float, ptr %arrayidx4_1, align 4, !tbaa !4
  %16 = tail call float @llvm.fmuladd.f32(float %14, float %15, float %acc4)
  %add5 = or disjoint i32 %i.0122, 5
  %arrayidx5_0 = getelementptr inbounds float, ptr %src1, i32 %add5
  %17 = load float, ptr %arrayidx5_0, align 4, !tbaa !4
  %arrayidx5_1 = getelementptr inbounds float, ptr %src2, i32 %add5
  %18 = load float, ptr %arrayidx5_1, align 4, !tbaa !4
  %19 = tail call float @llvm.fmuladd.f32(float %17, float %18, float %acc5)
  %add6 = or disjoint i32 %i.0122, 6
  %arrayidx6_0 = getelementptr inbounds float, ptr %src1, i32 %add6
  %20 = load float, ptr %arrayidx6_0, align 4, !tbaa !4
  %arrayidx6_1 = getelementptr inbounds float, ptr %src2, i32 %add6
  %21 = load float, ptr %arrayidx6_1, align 4, !tbaa !4
  %22 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %acc6)
  %add7 = or disjoint i32 %i.0122, 7
  %arrayidx7_0 = getelementptr inbounds float, ptr %src1, i32 %add7
  %23 = load float, ptr %arrayidx7_0, align 4, !tbaa !4
  %arrayidx7_1 = getelementptr inbounds float, ptr %src2, i32 %add7
  %24 = load float, ptr %arrayidx7_1, align 4, !tbaa !4
  %25 = tail call float @llvm.fmuladd.f32(float %23, float %24, float %acc7)
  %add30 = add nuw nsw i32 %i.0122, 8
  %cmp1 = icmp slt i32 %add30, %sub
  br i1 %cmp1, label %for.body, label %for.cond31.preheader, !llvm.loop !8

for.body33:                                       ; preds = %for.body33, %for.cond31.preheader
  %i.01033 = phi i32 [ %inc33, %for.body33 ], [ %i.0.lcssa, %for.cond31.preheader ]
  %acc.0933 = phi float [ %28, %for.body33 ], [ %acc0.0.lcssa, %for.cond31.preheader ]
  %mul33 = mul nsw i32 %i.01033, %step1
  %arrayidx33 = getelementptr inbounds float, ptr %src1, i32 %mul33
  %26 = load float, ptr %arrayidx33, align 4, !tbaa !4
  %mul133 = mul nsw i32 %i.01033, %step2
  %arrayidx233 = getelementptr inbounds float, ptr %src2, i32 %mul133
  %27 = load float, ptr %arrayidx233, align 4, !tbaa !4
  %28 = tail call float @llvm.fmuladd.f32(float %26, float %27, float %acc.0933)
  %inc33 = add nuw nsw i32 %i.01033, 1
  %exitcond.not33 = icmp eq i32 %inc33, %len
  br i1 %exitcond.not33, label %for.end37, label %for.body33, !llvm.loop !8

for.end37:                                        ; preds = %for.body33, %for.cond31.preheader
  %acc0.1.lcssa = phi float [ %28, %for.body33 ], [ %acc0.0.lcssa, %for.cond31.preheader ]
  %sum01 = fadd float %acc1.0.lcssa, %acc0.1.lcssa
  %sum23 = fadd float %acc2.0.lcssa, %acc3.0.lcssa
  %sum45 = fadd float %acc4.0.lcssa, %acc5.0.lcssa
  %sum67 = fadd float %acc6.0.lcssa, %acc7.0.lcssa
  %sum0123 = fadd float %sum23, %sum01
  %sum4567 = fadd float %sum45, %sum67
  %add44 = fadd float %sum4567, %sum0123
  br label %if.end

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.010.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %acc.09.clone = phi float [ %31, %for.body.clone ], [ 0.000000e+00, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.010.clone, %step1
  %arrayidx.clone = getelementptr inbounds float, ptr %src1, i32 %mul.clone
  %29 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %mul1.clone = mul nsw i32 %i.010.clone, %step2
  %arrayidx2.clone = getelementptr inbounds float, ptr %src2, i32 %mul1.clone
  %30 = load float, ptr %arrayidx2.clone, align 4, !tbaa !4
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %acc.09.clone)
  %inc.clone = add nuw nsw i32 %i.010.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %if.end, label %for.body.clone, !llvm.loop !8
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
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
