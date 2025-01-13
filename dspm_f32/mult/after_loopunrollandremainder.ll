; ModuleID = 'after_customlicm.ll'
source_filename = "dspm_mult_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dspm_mult_f32_ansi(ptr noalias nocapture noundef readonly %A, ptr noalias nocapture noundef readonly %B, ptr noalias nocapture noundef writeonly %C, i32 noundef %m, i32 noundef %n, i32 noundef %k) local_unnamed_addr #0 {
entry:
  %cmp54 = icmp sgt i32 %m, 0
  br i1 %cmp54, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp252 = icmp sgt i32 %k, 0
  %sub6 = add nsw i32 %n, -7
  %cmp1050 = icmp sgt i32 %n, 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %for.cond1.preheader.lr.ph
  %i.055 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc27, %for.cond.cleanup3 ]
  br i1 %cmp252, label %for.body4.lr.ph, label %for.cond.cleanup3

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  %mul = mul nsw i32 %i.055, %n
  %arrayidx = getelementptr inbounds float, ptr %A, i32 %mul
  %mul7 = mul nsw i32 %i.055, %k
  %0 = getelementptr float, ptr %C, i32 %mul7
  br label %for.body4

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3, %entry
  ret i32 0

for.cond.cleanup3:                                ; preds = %for.cond.cleanup11, %for.cond1.preheader
  %inc27 = add nuw nsw i32 %i.055, 1
  %exitcond57.not = icmp eq i32 %inc27, %m
  br i1 %exitcond57.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !4

for.body4:                                        ; preds = %for.cond.cleanup11, %for.body4.lr.ph
  %j.053 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc24, %for.cond.cleanup11 ]
  %1 = load float, ptr %arrayidx, align 4, !tbaa !6
  %arrayidx5 = getelementptr float, ptr %B, i32 %j.053
  %2 = load float, ptr %arrayidx5, align 4, !tbaa !6
  %mul6 = fmul float %1, %2
  %arrayidx8 = getelementptr float, ptr %0, i32 %j.053
  store float %mul6, ptr %arrayidx8, align 4, !tbaa !6
  br i1 %cmp1050, label %for.body12.7, label %for.cond110.preheader

for.cond110.preheader:                            ; preds = %for.body12.7, %for.body4
  %s.0.lcssa = phi i32 [ %inc.7, %for.body12.7 ], [ 1, %for.body4 ]
  %acc.0.lcssa = phi float [ %27, %for.body12.7 ], [ %mul6, %for.body4 ]
  %cmp111262 = icmp slt i32 %s.0.lcssa, %n
  br i1 %cmp111262, label %for.body12.clone, label %for.cond.cleanup11

for.body12.7:                                     ; preds = %for.body12.7, %for.body4
  %3 = phi float [ %27, %for.body12.7 ], [ %mul6, %for.body4 ]
  %s.051 = phi i32 [ %inc.7, %for.body12.7 ], [ 1, %for.body4 ]
  %arrayidx15 = getelementptr float, ptr %arrayidx, i32 %s.051
  %4 = load float, ptr %arrayidx15, align 4, !tbaa !6
  %mul16 = mul nsw i32 %s.051, %k
  %gep = getelementptr float, ptr %arrayidx5, i32 %mul16
  %5 = load float, ptr %gep, align 4, !tbaa !6
  %6 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %3)
  store float %6, ptr %arrayidx8, align 4, !tbaa !6
  %inc = add nuw nsw i32 %s.051, 1
  %exitcond.not = icmp eq i32 %inc, %n
  %arrayidx15.1 = getelementptr float, ptr %arrayidx, i32 %inc
  %7 = load float, ptr %arrayidx15.1, align 4, !tbaa !6
  %mul16.1 = mul nsw i32 %inc, %k
  %gep.1 = getelementptr float, ptr %arrayidx5, i32 %mul16.1
  %8 = load float, ptr %gep.1, align 4, !tbaa !6
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %6)
  store float %9, ptr %arrayidx8, align 4, !tbaa !6
  %inc.1 = add nuw nsw i32 %s.051, 2
  %exitcond.not.1 = icmp eq i32 %inc.1, %n
  %arrayidx15.2 = getelementptr float, ptr %arrayidx, i32 %inc.1
  %10 = load float, ptr %arrayidx15.2, align 4, !tbaa !6
  %mul16.2 = mul nsw i32 %inc.1, %k
  %gep.2 = getelementptr float, ptr %arrayidx5, i32 %mul16.2
  %11 = load float, ptr %gep.2, align 4, !tbaa !6
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %9)
  store float %12, ptr %arrayidx8, align 4, !tbaa !6
  %inc.2 = add nuw nsw i32 %s.051, 3
  %exitcond.not.2 = icmp eq i32 %inc.2, %n
  %arrayidx15.3 = getelementptr float, ptr %arrayidx, i32 %inc.2
  %13 = load float, ptr %arrayidx15.3, align 4, !tbaa !6
  %mul16.3 = mul nsw i32 %inc.2, %k
  %gep.3 = getelementptr float, ptr %arrayidx5, i32 %mul16.3
  %14 = load float, ptr %gep.3, align 4, !tbaa !6
  %15 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %12)
  store float %15, ptr %arrayidx8, align 4, !tbaa !6
  %inc.3 = add nuw nsw i32 %s.051, 4
  %exitcond.not.3 = icmp eq i32 %inc.3, %n
  %arrayidx15.4 = getelementptr float, ptr %arrayidx, i32 %inc.3
  %16 = load float, ptr %arrayidx15.4, align 4, !tbaa !6
  %mul16.4 = mul nsw i32 %inc.3, %k
  %gep.4 = getelementptr float, ptr %arrayidx5, i32 %mul16.4
  %17 = load float, ptr %gep.4, align 4, !tbaa !6
  %18 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %15)
  store float %18, ptr %arrayidx8, align 4, !tbaa !6
  %inc.4 = add nuw nsw i32 %s.051, 5
  %exitcond.not.4 = icmp eq i32 %inc.4, %n
  %arrayidx15.5 = getelementptr float, ptr %arrayidx, i32 %inc.4
  %19 = load float, ptr %arrayidx15.5, align 4, !tbaa !6
  %mul16.5 = mul nsw i32 %inc.4, %k
  %gep.5 = getelementptr float, ptr %arrayidx5, i32 %mul16.5
  %20 = load float, ptr %gep.5, align 4, !tbaa !6
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %18)
  store float %21, ptr %arrayidx8, align 4, !tbaa !6
  %inc.5 = add nuw nsw i32 %s.051, 6
  %exitcond.not.5 = icmp eq i32 %inc.5, %n
  %arrayidx15.6 = getelementptr float, ptr %arrayidx, i32 %inc.5
  %22 = load float, ptr %arrayidx15.6, align 4, !tbaa !6
  %mul16.6 = mul nsw i32 %inc.5, %k
  %gep.6 = getelementptr float, ptr %arrayidx5, i32 %mul16.6
  %23 = load float, ptr %gep.6, align 4, !tbaa !6
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %21)
  store float %24, ptr %arrayidx8, align 4, !tbaa !6
  %inc.6 = add nuw nsw i32 %s.051, 7
  %exitcond.not.6 = icmp eq i32 %inc.6, %n
  %arrayidx15.7 = getelementptr float, ptr %arrayidx, i32 %inc.6
  %25 = load float, ptr %arrayidx15.7, align 4, !tbaa !6
  %mul16.7 = mul nsw i32 %inc.6, %k
  %gep.7 = getelementptr float, ptr %arrayidx5, i32 %mul16.7
  %26 = load float, ptr %gep.7, align 4, !tbaa !6
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %24)
  store float %27, ptr %arrayidx8, align 4, !tbaa !6
  %inc.7 = add nuw nsw i32 %s.051, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub6
  br i1 %exitcond.not.7, label %for.body12.7, label %for.cond110.preheader, !llvm.loop !10

for.body12.clone:                                 ; preds = %for.body12.clone, %for.cond110.preheader
  %28 = phi float [ %31, %for.body12.clone ], [ %acc.0.lcssa, %for.cond110.preheader ]
  %s.051.clone = phi i32 [ %inc.clone, %for.body12.clone ], [ %s.0.lcssa, %for.cond110.preheader ]
  %arrayidx15.clone = getelementptr float, ptr %arrayidx, i32 %s.051.clone
  %29 = load float, ptr %arrayidx15.clone, align 4, !tbaa !6
  %mul16.clone = mul nsw i32 %s.051.clone, %k
  %gep.clone = getelementptr float, ptr %arrayidx5, i32 %mul16.clone
  %30 = load float, ptr %gep.clone, align 4, !tbaa !6
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %28)
  store float %31, ptr %arrayidx8, align 4, !tbaa !6
  %inc.clone = add nuw nsw i32 %s.051.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %n
  br i1 %exitcond.not.clone, label %for.cond.cleanup11, label %for.body12.clone, !llvm.loop !10

for.cond.cleanup11:                               ; preds = %for.cond110.preheader, %for.body12.clone
  %inc24 = add nuw nsw i32 %j.053, 1
  %exitcond56.not = icmp eq i32 %inc24, %k
  br i1 %exitcond56.not, label %for.cond.cleanup3, label %for.body4, !llvm.loop !11
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !5}
!11 = distinct !{!11, !5}
