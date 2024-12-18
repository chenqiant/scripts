; ModuleID = 'dspm_mult_s16_best.c'
source_filename = "dspm_mult_s16_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dspm_mult_s16_ansi(ptr nocapture noundef readonly %A, ptr nocapture noundef readonly %B, ptr nocapture noundef writeonly %C, i32 noundef %m, i32 noundef %n, i32 noundef %k, i32 noundef %shift) local_unnamed_addr #0 {
entry:
  %cmp268 = icmp sgt i32 %m, 0
  br i1 %cmp268, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %shift, -15
  %cmp2266 = icmp sgt i32 %k, 0
  %shr = lshr i32 32767, %shift
  %conv = zext nneg i32 %shr to i64
  %sub6 = add nsw i32 %n, -7
  %cmp7256 = icmp sgt i32 %n, 7
  %cmp127 = icmp sgt i32 %shift, 15
  %sub133 = sub nsw i32 15, %shift
  %sh_prom134 = zext nneg i32 %sub133 to i64
  %sh_prom = zext nneg i32 %sub to i64
  %0 = and i32 %n, -8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.cond.cleanup3
  %i.0269 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc144, %for.cond.cleanup3 ]
  br i1 %cmp2266, label %for.body4.lr.ph, label %for.cond.cleanup3

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  %mul = mul nsw i32 %i.0269, %n
  %1 = getelementptr i16, ptr %A, i32 %mul
  %mul137 = mul nsw i32 %i.0269, %k
  %2 = getelementptr i16, ptr %C, i32 %mul137
  br label %for.body4

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3, %entry
  ret i32 0

for.cond.cleanup3:                                ; preds = %for.end126, %for.cond1.preheader
  %inc144 = add nuw nsw i32 %i.0269, 1
  %exitcond271.not = icmp eq i32 %inc144, %m
  br i1 %exitcond271.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !4

for.body4:                                        ; preds = %for.body4.lr.ph, %for.end126
  %j.0267 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc141, %for.end126 ]
  %invariant.gep = getelementptr i16, ptr %B, i32 %j.0267
  br i1 %cmp7256, label %for.body9, label %for.cond110.preheader

for.cond110.preheader:                            ; preds = %for.body9, %for.body4
  %acc.0.lcssa = phi i64 [ %conv, %for.body4 ], [ %add108, %for.body9 ]
  %s.0.lcssa = phi i32 [ 0, %for.body4 ], [ %0, %for.body9 ]
  %cmp111262 = icmp slt i32 %s.0.lcssa, %n
  br i1 %cmp111262, label %for.body113, label %for.end126

for.body9:                                        ; preds = %for.body4, %for.body9
  %s.0258 = phi i32 [ %add109, %for.body9 ], [ 0, %for.body4 ]
  %acc.0257 = phi i64 [ %add108, %for.body9 ], [ %conv, %for.body4 ]
  %arrayidx = getelementptr i16, ptr %1, i32 %s.0258
  %3 = load i16, ptr %arrayidx, align 2, !tbaa !6
  %conv10 = sext i16 %3 to i32
  %mul11 = mul nsw i32 %s.0258, %k
  %gep = getelementptr i16, ptr %invariant.gep, i32 %mul11
  %4 = load i16, ptr %gep, align 2, !tbaa !6
  %conv14 = sext i16 %4 to i32
  %mul15 = mul nsw i32 %conv14, %conv10
  %conv16 = sext i32 %mul15 to i64
  %add17 = add nsw i64 %acc.0257, %conv16
  %arrayidx21 = getelementptr i16, ptr %arrayidx, i32 1
  %5 = load i16, ptr %arrayidx21, align 2, !tbaa !6
  %conv22 = sext i16 %5 to i32
  %add23 = or disjoint i32 %s.0258, 1
  %mul24 = mul nsw i32 %add23, %k
  %gep243 = getelementptr i16, ptr %invariant.gep, i32 %mul24
  %6 = load i16, ptr %gep243, align 2, !tbaa !6
  %conv27 = sext i16 %6 to i32
  %mul28 = mul nsw i32 %conv27, %conv22
  %conv29 = sext i32 %mul28 to i64
  %add30 = add nsw i64 %add17, %conv29
  %arrayidx34 = getelementptr i16, ptr %arrayidx, i32 2
  %7 = load i16, ptr %arrayidx34, align 2, !tbaa !6
  %conv35 = sext i16 %7 to i32
  %add36 = or disjoint i32 %s.0258, 2
  %mul37 = mul nsw i32 %add36, %k
  %gep245 = getelementptr i16, ptr %invariant.gep, i32 %mul37
  %8 = load i16, ptr %gep245, align 2, !tbaa !6
  %conv40 = sext i16 %8 to i32
  %mul41 = mul nsw i32 %conv40, %conv35
  %conv42 = sext i32 %mul41 to i64
  %add43 = add nsw i64 %add30, %conv42
  %arrayidx47 = getelementptr i16, ptr %arrayidx, i32 3
  %9 = load i16, ptr %arrayidx47, align 2, !tbaa !6
  %conv48 = sext i16 %9 to i32
  %add49 = or disjoint i32 %s.0258, 3
  %mul50 = mul nsw i32 %add49, %k
  %gep247 = getelementptr i16, ptr %invariant.gep, i32 %mul50
  %10 = load i16, ptr %gep247, align 2, !tbaa !6
  %conv53 = sext i16 %10 to i32
  %mul54 = mul nsw i32 %conv53, %conv48
  %conv55 = sext i32 %mul54 to i64
  %add56 = add nsw i64 %add43, %conv55
  %arrayidx60 = getelementptr i16, ptr %arrayidx, i32 4
  %11 = load i16, ptr %arrayidx60, align 2, !tbaa !6
  %conv61 = sext i16 %11 to i32
  %add62 = or disjoint i32 %s.0258, 4
  %mul63 = mul nsw i32 %add62, %k
  %gep249 = getelementptr i16, ptr %invariant.gep, i32 %mul63
  %12 = load i16, ptr %gep249, align 2, !tbaa !6
  %conv66 = sext i16 %12 to i32
  %mul67 = mul nsw i32 %conv66, %conv61
  %conv68 = sext i32 %mul67 to i64
  %add69 = add nsw i64 %add56, %conv68
  %arrayidx73 = getelementptr i16, ptr %arrayidx, i32 5
  %13 = load i16, ptr %arrayidx73, align 2, !tbaa !6
  %conv74 = sext i16 %13 to i32
  %add75 = or disjoint i32 %s.0258, 5
  %mul76 = mul nsw i32 %add75, %k
  %gep251 = getelementptr i16, ptr %invariant.gep, i32 %mul76
  %14 = load i16, ptr %gep251, align 2, !tbaa !6
  %conv79 = sext i16 %14 to i32
  %mul80 = mul nsw i32 %conv79, %conv74
  %conv81 = sext i32 %mul80 to i64
  %add82 = add nsw i64 %add69, %conv81
  %arrayidx86 = getelementptr i16, ptr %arrayidx, i32 6
  %15 = load i16, ptr %arrayidx86, align 2, !tbaa !6
  %conv87 = sext i16 %15 to i32
  %add88 = or disjoint i32 %s.0258, 6
  %mul89 = mul nsw i32 %add88, %k
  %gep253 = getelementptr i16, ptr %invariant.gep, i32 %mul89
  %16 = load i16, ptr %gep253, align 2, !tbaa !6
  %conv92 = sext i16 %16 to i32
  %mul93 = mul nsw i32 %conv92, %conv87
  %conv94 = sext i32 %mul93 to i64
  %add95 = add nsw i64 %add82, %conv94
  %arrayidx99 = getelementptr i16, ptr %arrayidx, i32 7
  %17 = load i16, ptr %arrayidx99, align 2, !tbaa !6
  %conv100 = sext i16 %17 to i32
  %add101 = or disjoint i32 %s.0258, 7
  %mul102 = mul nsw i32 %add101, %k
  %gep255 = getelementptr i16, ptr %invariant.gep, i32 %mul102
  %18 = load i16, ptr %gep255, align 2, !tbaa !6
  %conv105 = sext i16 %18 to i32
  %mul106 = mul nsw i32 %conv105, %conv100
  %conv107 = sext i32 %mul106 to i64
  %add108 = add nsw i64 %add95, %conv107
  %add109 = add nuw nsw i32 %s.0258, 8
  %cmp7 = icmp slt i32 %add109, %sub6
  br i1 %cmp7, label %for.body9, label %for.cond110.preheader, !llvm.loop !10

for.body113:                                      ; preds = %for.cond110.preheader, %for.body113
  %s.1264 = phi i32 [ %inc, %for.body113 ], [ %s.0.lcssa, %for.cond110.preheader ]
  %acc.1263 = phi i64 [ %add124, %for.body113 ], [ %acc.0.lcssa, %for.cond110.preheader ]
  %arrayidx116 = getelementptr i16, ptr %1, i32 %s.1264
  %19 = load i16, ptr %arrayidx116, align 2, !tbaa !6
  %conv117 = sext i16 %19 to i32
  %mul118 = mul nsw i32 %s.1264, %k
  %gep261 = getelementptr i16, ptr %invariant.gep, i32 %mul118
  %20 = load i16, ptr %gep261, align 2, !tbaa !6
  %conv121 = sext i16 %20 to i32
  %mul122 = mul nsw i32 %conv121, %conv117
  %conv123 = sext i32 %mul122 to i64
  %add124 = add nsw i64 %acc.1263, %conv123
  %inc = add nuw nsw i32 %s.1264, 1
  %exitcond.not = icmp eq i32 %inc, %n
  br i1 %exitcond.not, label %for.end126, label %for.body113, !llvm.loop !11

for.end126:                                       ; preds = %for.body113, %for.cond110.preheader
  %acc.1.lcssa = phi i64 [ %acc.0.lcssa, %for.cond110.preheader ], [ %add124, %for.body113 ]
  %arrayidx132 = getelementptr i16, ptr %2, i32 %j.0267
  %shr135 = ashr i64 %acc.1.lcssa, %sh_prom134
  %shl = shl i64 %acc.1.lcssa, %sh_prom
  %shr135.sink = select i1 %cmp127, i64 %shl, i64 %shr135
  %conv136 = trunc i64 %shr135.sink to i16
  store i16 %conv136, ptr %arrayidx132, align 2, !tbaa !6
  %inc141 = add nuw nsw i32 %j.0267, 1
  %exitcond270.not = icmp eq i32 %inc141, %k
  br i1 %exitcond270.not, label %for.cond.cleanup3, label %for.body4, !llvm.loop !12
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!7, !7, i64 0}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !5}
!11 = distinct !{!11, !5}
!12 = distinct !{!12, !5}
