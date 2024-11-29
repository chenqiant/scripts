; ModuleID = 'dsps_dotprod_f32_best.c'
source_filename = "dsps_dotprod_f32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_dotprod_f32_ansi(ptr nocapture noundef readonly %src1, ptr nocapture noundef readonly %src2, ptr nocapture noundef writeonly %dest, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %sub = add nsw i32 %len, -7
  %cmp84 = icmp sgt i32 %len, 7
  br i1 %cmp84, label %for.body.preheader, label %for.cond30.preheader

for.body.preheader:                               ; preds = %entry
  %0 = and i32 %len, 2147483640
  br label %for.body

for.cond30.preheader:                             ; preds = %for.body, %entry
  %acc.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %24, %for.body ]
  %i.0.lcssa = phi i32 [ 0, %entry ], [ %0, %for.body ]
  %cmp3188 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp3188, label %for.body32, label %for.end36

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.086 = phi i32 [ %add29, %for.body ], [ 0, %for.body.preheader ]
  %acc.085 = phi float [ %24, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %add = or disjoint i32 %i.086, 1
  %add5 = or disjoint i32 %i.086, 2  
  %add9 = or disjoint i32 %i.086, 3
  %add13 = or disjoint i32 %i.086, 4
  %add17 = or disjoint i32 %i.086, 5
  %add21 = or disjoint i32 %i.086, 6
  %add25 = or disjoint i32 %i.086, 7
  %arrayidx = getelementptr inbounds float, ptr %src1, i32 %i.086
  %arrayidx1 = getelementptr inbounds float, ptr %src2, i32 %i.086
  %arrayidx2 = getelementptr inbounds float, ptr %src1, i32 %add
  %arrayidx4 = getelementptr inbounds float, ptr %src2, i32 %add
  %arrayidx6 = getelementptr inbounds float, ptr %src1, i32 %add5
  %arrayidx8 = getelementptr inbounds float, ptr %src2, i32 %add5
  %arrayidx10 = getelementptr inbounds float, ptr %src1, i32 %add9
  %arrayidx12 = getelementptr inbounds float, ptr %src2, i32 %add9
  %arrayidx14 = getelementptr inbounds float, ptr %src1, i32 %add13
  %arrayidx16 = getelementptr inbounds float, ptr %src2, i32 %add13
  %arrayidx18 = getelementptr inbounds float, ptr %src1, i32 %add17
  %arrayidx20 = getelementptr inbounds float, ptr %src2, i32 %add17
  %arrayidx22 = getelementptr inbounds float, ptr %src1, i32 %add21
  %arrayidx24 = getelementptr inbounds float, ptr %src2, i32 %add21
  %arrayidx26 = getelementptr inbounds float, ptr %src1, i32 %add25
  %arrayidx28 = getelementptr inbounds float, ptr %src2, i32 %add25
  %1 = load float, ptr %arrayidx, align 4, !tbaa !4
  %2 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %3 = load float, ptr %arrayidx6, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx10, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx14, align 4, !tbaa !4
  %6 = load float, ptr %arrayidx18, align 4, !tbaa !4
  %7 = load float, ptr %arrayidx22, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx26, align 4, !tbaa !4
  %9 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %10 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %11 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %12 = load float, ptr %arrayidx12, align 4, !tbaa !4
  %13 = load float, ptr %arrayidx16, align 4, !tbaa !4
  %14 = load float, ptr %arrayidx20, align 4, !tbaa !4
  %15 = load float, ptr %arrayidx24, align 4, !tbaa !4
  %16 = load float, ptr %arrayidx28, align 4, !tbaa !4
  %17 = tail call float @llvm.fmuladd.f32(float %1, float %9, float %acc.085)
  %18 = tail call float @llvm.fmuladd.f32(float %2, float %10, float %17)
  %19 = tail call float @llvm.fmuladd.f32(float %3, float %11, float %18)
  %20 = tail call float @llvm.fmuladd.f32(float %4, float %12, float %19)
  %21 = tail call float @llvm.fmuladd.f32(float %5, float %13, float %20)
  %22 = tail call float @llvm.fmuladd.f32(float %6, float %14, float %21)
  %23 = tail call float @llvm.fmuladd.f32(float %7, float %15, float %22)
  %24 = tail call float @llvm.fmuladd.f32(float %8, float %16, float %23)
  %add29 = add nuw nsw i32 %i.086, 8
  %cmp = icmp slt i32 %add29, %sub
  br i1 %cmp, label %for.body, label %for.cond30.preheader, !llvm.loop !8

for.body32:                                       ; preds = %for.cond30.preheader, %for.body32
  %i.190 = phi i32 [ %inc, %for.body32 ], [ %i.0.lcssa, %for.cond30.preheader ]
  %acc.189 = phi float [ %27, %for.body32 ], [ %acc.0.lcssa, %for.cond30.preheader ]
  %arrayidx33 = getelementptr inbounds float, ptr %src1, i32 %i.190
  %25 = load float, ptr %arrayidx33, align 4, !tbaa !4
  %arrayidx34 = getelementptr inbounds float, ptr %src2, i32 %i.190
  %26 = load float, ptr %arrayidx34, align 4, !tbaa !4
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %acc.189)
  %inc = add nuw nsw i32 %i.190, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %for.end36, label %for.body32, !llvm.loop !10

for.end36:                                        ; preds = %for.body32, %for.cond30.preheader
  %acc.1.lcssa = phi float [ %acc.0.lcssa, %for.cond30.preheader ], [ %27, %for.body32 ]
  store float %acc.1.lcssa, ptr %dest, align 4, !tbaa !4
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
