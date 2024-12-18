; ModuleID = 'dspm_mult_f32_best.c'
source_filename = "dspm_mult_f32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dspm_mult_f32_ansi(ptr nocapture noundef readonly %A, ptr nocapture noundef readonly %B, ptr nocapture noundef writeonly %C, i32 noundef %m, i32 noundef %n, i32 noundef %k) local_unnamed_addr #0 {
entry:
  %cmp271 = icmp sgt i32 %m, 0
  br i1 %cmp271, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp2269 = icmp sgt i32 %k, 0
  %sub = add nsw i32 %n, -7
  %cmp10262 = icmp sgt i32 %n, 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.cond.cleanup3
  %i.0272 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc126, %for.cond.cleanup3 ]
  br i1 %cmp2269, label %for.body4.lr.ph, label %for.cond.cleanup3

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  %mul = mul nsw i32 %i.0272, %n
  %arrayidx = getelementptr float, ptr %A, i32 %mul
  %mul7 = mul nsw i32 %i.0272, %k
  %0 = getelementptr float, ptr %C, i32 %mul7
  br label %for.body4

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3, %entry
  ret i32 0

for.cond.cleanup3:                                ; preds = %for.end121, %for.cond1.preheader
  %inc126 = add nuw nsw i32 %i.0272, 1
  %exitcond274.not = icmp eq i32 %inc126, %m
  br i1 %exitcond274.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !4

for.body4:                                        ; preds = %for.body4.lr.ph, %for.end121
  %j.0270 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc123, %for.end121 ]
  %1 = load float, ptr %arrayidx, align 4, !tbaa !6
  %arrayidx5 = getelementptr float, ptr %B, i32 %j.0270
  %2 = load float, ptr %arrayidx5, align 4, !tbaa !6
  %mul6 = fmul float %1, %2
  %arrayidx8 = getelementptr float, ptr %0, i32 %j.0270
  store float %mul6, ptr %arrayidx8, align 4, !tbaa !6
  br i1 %cmp10262, label %for.body11, label %for.cond107.preheader

for.cond107.preheader:                            ; preds = %for.body11, %for.body4
  %arrayidx8.promoted268 = phi float [ %mul6, %for.body4 ], [ %27, %for.body11 ]
  %s.0.lcssa = phi i32 [ 1, %for.body4 ], [ %add106, %for.body11 ]
  %cmp108266 = icmp slt i32 %s.0.lcssa, %n
  br i1 %cmp108266, label %for.body109, label %for.end121

for.body11:                                       ; preds = %for.body4, %for.body11
  %3 = phi float [ %27, %for.body11 ], [ %mul6, %for.body4 ]
  %s.0263 = phi i32 [ %add106, %for.body11 ], [ 1, %for.body4 ]
  %arrayidx14 = getelementptr float, ptr %arrayidx, i32 %s.0263
  %4 = load float, ptr %arrayidx14, align 4, !tbaa !6
  %mul15 = mul nsw i32 %s.0263, %k
  %gep = getelementptr float, ptr %arrayidx5, i32 %mul15
  %5 = load float, ptr %gep, align 4, !tbaa !6
  %6 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %3)
  store float %6, ptr %arrayidx8, align 4, !tbaa !6
  %arrayidx25 = getelementptr float, ptr %arrayidx14, i32 1
  %7 = load float, ptr %arrayidx25, align 4, !tbaa !6
  %add26 = add nuw nsw i32 %s.0263, 1
  %mul27 = mul nsw i32 %add26, %k
  %gep249 = getelementptr float, ptr %arrayidx5, i32 %mul27
  %8 = load float, ptr %gep249, align 4, !tbaa !6
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %6)
  store float %9, ptr %arrayidx8, align 4, !tbaa !6
  %arrayidx37 = getelementptr float, ptr %arrayidx14, i32 2
  %10 = load float, ptr %arrayidx37, align 4, !tbaa !6
  %add38 = add nuw nsw i32 %s.0263, 2
  %mul39 = mul nsw i32 %add38, %k
  %gep251 = getelementptr float, ptr %arrayidx5, i32 %mul39
  %11 = load float, ptr %gep251, align 4, !tbaa !6
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %9)
  store float %12, ptr %arrayidx8, align 4, !tbaa !6
  %arrayidx49 = getelementptr float, ptr %arrayidx14, i32 3
  %13 = load float, ptr %arrayidx49, align 4, !tbaa !6
  %add50 = add nuw nsw i32 %s.0263, 3
  %mul51 = mul nsw i32 %add50, %k
  %gep253 = getelementptr float, ptr %arrayidx5, i32 %mul51
  %14 = load float, ptr %gep253, align 4, !tbaa !6
  %15 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %12)
  store float %15, ptr %arrayidx8, align 4, !tbaa !6
  %arrayidx61 = getelementptr float, ptr %arrayidx14, i32 4
  %16 = load float, ptr %arrayidx61, align 4, !tbaa !6
  %add62 = add nuw nsw i32 %s.0263, 4
  %mul63 = mul nsw i32 %add62, %k
  %gep255 = getelementptr float, ptr %arrayidx5, i32 %mul63
  %17 = load float, ptr %gep255, align 4, !tbaa !6
  %18 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %15)
  store float %18, ptr %arrayidx8, align 4, !tbaa !6
  %arrayidx73 = getelementptr float, ptr %arrayidx14, i32 5
  %19 = load float, ptr %arrayidx73, align 4, !tbaa !6
  %add74 = add nuw nsw i32 %s.0263, 5
  %mul75 = mul nsw i32 %add74, %k
  %gep257 = getelementptr float, ptr %arrayidx5, i32 %mul75
  %20 = load float, ptr %gep257, align 4, !tbaa !6
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %18)
  store float %21, ptr %arrayidx8, align 4, !tbaa !6
  %arrayidx85 = getelementptr float, ptr %arrayidx14, i32 6
  %22 = load float, ptr %arrayidx85, align 4, !tbaa !6
  %add86 = add nuw nsw i32 %s.0263, 6
  %mul87 = mul nsw i32 %add86, %k
  %gep259 = getelementptr float, ptr %arrayidx5, i32 %mul87
  %23 = load float, ptr %gep259, align 4, !tbaa !6
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %21)
  store float %24, ptr %arrayidx8, align 4, !tbaa !6
  %arrayidx97 = getelementptr float, ptr %arrayidx14, i32 7
  %25 = load float, ptr %arrayidx97, align 4, !tbaa !6
  %add98 = add nuw nsw i32 %s.0263, 7
  %mul99 = mul nsw i32 %add98, %k
  %gep261 = getelementptr float, ptr %arrayidx5, i32 %mul99
  %26 = load float, ptr %gep261, align 4, !tbaa !6
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %24)
  store float %27, ptr %arrayidx8, align 4, !tbaa !6
  %add106 = add nuw nsw i32 %s.0263, 8
  %cmp10 = icmp slt i32 %add106, %sub
  br i1 %cmp10, label %for.body11, label %for.cond107.preheader, !llvm.loop !10

for.body109:                                      ; preds = %for.cond107.preheader, %for.body109
  %28 = phi float [ %31, %for.body109 ], [ %arrayidx8.promoted268, %for.cond107.preheader ]
  %s.1267 = phi i32 [ %inc, %for.body109 ], [ %s.0.lcssa, %for.cond107.preheader ]
  %arrayidx112 = getelementptr float, ptr %arrayidx, i32 %s.1267
  %29 = load float, ptr %arrayidx112, align 4, !tbaa !6
  %mul113 = mul nsw i32 %s.1267, %k
  %gep265 = getelementptr float, ptr %arrayidx5, i32 %mul113
  %30 = load float, ptr %gep265, align 4, !tbaa !6
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %28)
  store float %31, ptr %arrayidx8, align 4, !tbaa !6
  %inc = add nuw nsw i32 %s.1267, 1
  %exitcond.not = icmp eq i32 %inc, %n
  br i1 %exitcond.not, label %for.end121, label %for.body109, !llvm.loop !11

for.end121:                                       ; preds = %for.body109, %for.cond107.preheader
  %inc123 = add nuw nsw i32 %j.0270, 1
  %exitcond273.not = icmp eq i32 %inc123, %k
  br i1 %exitcond273.not, label %for.cond.cleanup3, label %for.body4, !llvm.loop !12
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !5}
!11 = distinct !{!11, !5}
!12 = distinct !{!12, !5}
