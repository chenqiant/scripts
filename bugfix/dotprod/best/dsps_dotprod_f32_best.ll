; ModuleID = 'dsps_dotprod_f32_best.c'
source_filename = "dsps_dotprod_f32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_dotprod_f32_ansi(ptr nocapture noundef readonly %src1, ptr nocapture noundef readonly %src2, ptr nocapture noundef writeonly %dest, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i32 %len, 2
  br i1 %cmp, label %for.cond.preheader, label %for.cond26.preheader

for.cond26.preheader:                             ; preds = %entry
  %cmp2770 = icmp sgt i32 %len, 0
  br i1 %cmp2770, label %for.body28, label %if.end

for.cond.preheader:                               ; preds = %entry
  %sub = add nsw i32 %len, -3
  %cmp173.not = icmp eq i32 %len, 3
  br i1 %cmp173.not, label %for.cond15.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.cond.preheader
  %0 = and i32 %len, 2147483644
  br label %for.body

for.cond15.preheader:                             ; preds = %for.body, %for.cond.preheader
  %acc0.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %3, %for.body ]
  %acc1.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %6, %for.body ]
  %acc2.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %9, %for.body ]
  %acc3.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %12, %for.body ]
  %i.0.lcssa = phi i32 [ 0, %for.cond.preheader ], [ %0, %for.body ]
  %cmp1684 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp1684, label %for.body17, label %for.end21

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.078 = phi i32 [ %add14, %for.body ], [ 0, %for.body.preheader ]
  %acc3.077 = phi float [ %12, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc2.076 = phi float [ %9, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc1.075 = phi float [ %6, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %acc0.074 = phi float [ %3, %for.body ], [ 0.000000e+00, %for.body.preheader ]
  %arrayidx = getelementptr inbounds float, ptr %src1, i32 %i.078
  %1 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx2 = getelementptr inbounds float, ptr %src2, i32 %i.078
  %2 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %3 = tail call float @llvm.fmuladd.f32(float %1, float %2, float %acc0.074)
  %add = or disjoint i32 %i.078, 1
  %arrayidx3 = getelementptr inbounds float, ptr %src1, i32 %add
  %4 = load float, ptr %arrayidx3, align 4, !tbaa !4
  %arrayidx5 = getelementptr inbounds float, ptr %src2, i32 %add
  %5 = load float, ptr %arrayidx5, align 4, !tbaa !4
  %6 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %acc1.075)
  %add6 = or disjoint i32 %i.078, 2
  %arrayidx7 = getelementptr inbounds float, ptr %src1, i32 %add6
  %7 = load float, ptr %arrayidx7, align 4, !tbaa !4
  %arrayidx9 = getelementptr inbounds float, ptr %src2, i32 %add6
  %8 = load float, ptr %arrayidx9, align 4, !tbaa !4
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %acc2.076)
  %add10 = or disjoint i32 %i.078, 3
  %arrayidx11 = getelementptr inbounds float, ptr %src1, i32 %add10
  %10 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %arrayidx13 = getelementptr inbounds float, ptr %src2, i32 %add10
  %11 = load float, ptr %arrayidx13, align 4, !tbaa !4
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %acc3.077)
  %add14 = add nuw nsw i32 %i.078, 4
  %cmp1 = icmp slt i32 %add14, %sub
  br i1 %cmp1, label %for.body, label %for.cond15.preheader, !llvm.loop !8

for.body17:                                       ; preds = %for.cond15.preheader, %for.body17
  %i.186 = phi i32 [ %inc, %for.body17 ], [ %i.0.lcssa, %for.cond15.preheader ]
  %acc0.185 = phi float [ %15, %for.body17 ], [ %acc0.0.lcssa, %for.cond15.preheader ]
  %arrayidx18 = getelementptr inbounds float, ptr %src1, i32 %i.186
  %13 = load float, ptr %arrayidx18, align 4, !tbaa !4
  %arrayidx19 = getelementptr inbounds float, ptr %src2, i32 %i.186
  %14 = load float, ptr %arrayidx19, align 4, !tbaa !4
  %15 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %acc0.185)
  %inc = add nuw nsw i32 %i.186, 1
  %exitcond93.not = icmp eq i32 %inc, %len
  br i1 %exitcond93.not, label %for.end21, label %for.body17, !llvm.loop !10

for.end21:                                        ; preds = %for.body17, %for.cond15.preheader
  %acc0.1.lcssa = phi float [ %acc0.0.lcssa, %for.cond15.preheader ], [ %15, %for.body17 ]
  %add22 = fadd float %acc1.0.lcssa, %acc0.1.lcssa
  %add23 = fadd float %acc2.0.lcssa, %add22
  %add24 = fadd float %acc3.0.lcssa, %add23
  br label %if.end

for.body28:                                       ; preds = %for.cond26.preheader, %for.body28
  %i25.072 = phi i32 [ %inc32, %for.body28 ], [ 0, %for.cond26.preheader ]
  %acc.071 = phi float [ %18, %for.body28 ], [ 0.000000e+00, %for.cond26.preheader ]
  %arrayidx29 = getelementptr inbounds float, ptr %src1, i32 %i25.072
  %16 = load float, ptr %arrayidx29, align 4, !tbaa !4
  %arrayidx30 = getelementptr inbounds float, ptr %src2, i32 %i25.072
  %17 = load float, ptr %arrayidx30, align 4, !tbaa !4
  %18 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %acc.071)
  %inc32 = add nuw nsw i32 %i25.072, 1
  %exitcond.not = icmp eq i32 %inc32, %len
  br i1 %exitcond.not, label %if.end, label %for.body28, !llvm.loop !11

if.end:                                           ; preds = %for.body28, %for.cond26.preheader, %for.end21
  %storemerge = phi float [ %add24, %for.end21 ], [ 0.000000e+00, %for.cond26.preheader ], [ %18, %for.body28 ]
  store float %storemerge, ptr %dest, align 4, !tbaa !4
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
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
