; ModuleID = 'after_customlicm.ll'
source_filename = "dspm_mult_s16_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dspm_mult_s16_ansi(ptr noalias nocapture noundef readonly %A, ptr noalias nocapture noundef readonly %B, ptr noalias nocapture noundef writeonly %C, i32 noundef %m, i32 noundef %n, i32 noundef %k, i32 noundef %shift) local_unnamed_addr #0 {
entry:
  %cmp63 = icmp sgt i32 %m, 0
  br i1 %cmp63, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %shift, -15
  %cmp261 = icmp sgt i32 %k, 0
  %shr = lshr i32 32767, %shift
  %conv = zext nneg i32 %shr to i64
  %sub6 = add nsw i32 %n, -7
  %0 = and i32 %n, -8
  %cmp658 = icmp sgt i32 %n, 7
  %cmp18 = icmp sgt i32 %shift, 15
  %sub24 = sub nsw i32 15, %shift
  %sh_prom25 = zext nneg i32 %sub24 to i64
  %sh_prom = zext nneg i32 %sub to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %for.cond1.preheader.lr.ph
  %i.064 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc35, %for.cond.cleanup3 ]
  br i1 %cmp261, label %for.body4.lr.ph, label %for.cond.cleanup3

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  %mul = mul nsw i32 %i.064, %n
  %1 = getelementptr i16, ptr %A, i32 %mul
  %mul28 = mul nsw i32 %i.064, %k
  %2 = getelementptr i16, ptr %C, i32 %mul28
  br label %for.body4

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3, %entry
  ret i32 0

for.cond.cleanup3:                                ; preds = %for.cond.cleanup8, %for.cond1.preheader
  %inc35 = add nuw nsw i32 %i.064, 1
  %exitcond66.not = icmp eq i32 %inc35, %m
  br i1 %exitcond66.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !4

for.body4:                                        ; preds = %for.cond.cleanup8, %for.body4.lr.ph
  %j.062 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc32, %for.cond.cleanup8 ]
  %invariant.gep = getelementptr i16, ptr %B, i32 %j.062
  br i1 %cmp658, label %for.body9.7, label %for.cond110.preheader

for.cond110.preheader:                            ; preds = %for.body9.7, %for.body4
  %acc.0.lcssa1 = phi i64 [ %add17.7, %for.body9.7 ], [ %conv, %for.body4 ]
  %s.0.lcssa = phi i32 [ %0, %for.body9.7 ], [ 0, %for.body4 ]
  %cmp111262 = icmp slt i32 %s.0.lcssa, %n
  br i1 %cmp111262, label %for.body9.clone, label %for.cond.cleanup8

for.body9.7:                                      ; preds = %for.body9.7, %for.body4
  %s.060 = phi i32 [ %inc.7, %for.body9.7 ], [ 0, %for.body4 ]
  %acc.059 = phi i64 [ %add17.7, %for.body9.7 ], [ %conv, %for.body4 ]
  
  ; 计算所有的数组索引
  %inc = or disjoint i32 %s.060, 1
  %inc.1 = or disjoint i32 %s.060, 2  
  %inc.2 = or disjoint i32 %s.060, 3
  %inc.3 = or disjoint i32 %s.060, 4
  %inc.4 = or disjoint i32 %s.060, 5
  %inc.5 = or disjoint i32 %s.060, 6
  %inc.6 = or disjoint i32 %s.060, 7
  %inc.7 = add nuw nsw i32 %s.060, 8
  %arrayidx = getelementptr i16, ptr %1, i32 %s.060
  %arrayidx.1 = getelementptr i16, ptr %1, i32 %inc
  %arrayidx.2 = getelementptr i16, ptr %1, i32 %inc.1
  %arrayidx.3 = getelementptr i16, ptr %1, i32 %inc.2
  %arrayidx.4 = getelementptr i16, ptr %1, i32 %inc.3
  %arrayidx.5 = getelementptr i16, ptr %1, i32 %inc.4
  %arrayidx.6 = getelementptr i16, ptr %1, i32 %inc.5
  %arrayidx.7 = getelementptr i16, ptr %1, i32 %inc.6

  ; 计算所有的mul11
  %mul11 = mul nsw i32 %s.060, %k
  %mul11.1 = mul nsw i32 %inc, %k
  %mul11.2 = mul nsw i32 %inc.1, %k
  %mul11.3 = mul nsw i32 %inc.2, %k
  %mul11.4 = mul nsw i32 %inc.3, %k
  %mul11.5 = mul nsw i32 %inc.4, %k
  %mul11.6 = mul nsw i32 %inc.5, %k
  %mul11.7 = mul nsw i32 %inc.6, %k

  ; 计算所有的gep
  %gep = getelementptr i16, ptr %invariant.gep, i32 %mul11
  %gep.1 = getelementptr i16, ptr %invariant.gep, i32 %mul11.1
  %gep.2 = getelementptr i16, ptr %invariant.gep, i32 %mul11.2
  %gep.3 = getelementptr i16, ptr %invariant.gep, i32 %mul11.3
  %gep.4 = getelementptr i16, ptr %invariant.gep, i32 %mul11.4
  %gep.5 = getelementptr i16, ptr %invariant.gep, i32 %mul11.5
  %gep.6 = getelementptr i16, ptr %invariant.gep, i32 %mul11.6
  %gep.7 = getelementptr i16, ptr %invariant.gep, i32 %mul11.7

  ; 加载所有的数据
  %3 = load i16, ptr %arrayidx, align 2, !tbaa !6
  %4 = load i16, ptr %gep, align 2, !tbaa !6
  %5 = load i16, ptr %arrayidx.1, align 2, !tbaa !6
  %6 = load i16, ptr %gep.1, align 2, !tbaa !6
  %7 = load i16, ptr %arrayidx.2, align 2, !tbaa !6
  %8 = load i16, ptr %gep.2, align 2, !tbaa !6
  %9 = load i16, ptr %arrayidx.3, align 2, !tbaa !6
  %10 = load i16, ptr %gep.3, align 2, !tbaa !6
  %11 = load i16, ptr %arrayidx.4, align 2, !tbaa !6
  %12 = load i16, ptr %gep.4, align 2, !tbaa !6
  %13 = load i16, ptr %arrayidx.5, align 2, !tbaa !6
  %14 = load i16, ptr %gep.5, align 2, !tbaa !6
  %15 = load i16, ptr %arrayidx.6, align 2, !tbaa !6
  %16 = load i16, ptr %gep.6, align 2, !tbaa !6
  %17 = load i16, ptr %arrayidx.7, align 2, !tbaa !6
  %18 = load i16, ptr %gep.7, align 2, !tbaa !6

  ; 符号扩展
  %conv10 = sext i16 %3 to i32
  %conv14 = sext i16 %4 to i32
  %conv10.1 = sext i16 %5 to i32
  %conv14.1 = sext i16 %6 to i32
  %conv10.2 = sext i16 %7 to i32
  %conv14.2 = sext i16 %8 to i32
  %conv10.3 = sext i16 %9 to i32
  %conv14.3 = sext i16 %10 to i32
  %conv10.4 = sext i16 %11 to i32
  %conv14.4 = sext i16 %12 to i32
  %conv10.5 = sext i16 %13 to i32
  %conv14.5 = sext i16 %14 to i32
  %conv10.6 = sext i16 %15 to i32
  %conv14.6 = sext i16 %16 to i32
  %conv10.7 = sext i16 %17 to i32
  %conv14.7 = sext i16 %18 to i32

  ; 乘法运算
  %mul15 = mul nsw i32 %conv14, %conv10
  %mul15.1 = mul nsw i32 %conv14.1, %conv10.1
  %mul15.2 = mul nsw i32 %conv14.2, %conv10.2
  %mul15.3 = mul nsw i32 %conv14.3, %conv10.3
  %mul15.4 = mul nsw i32 %conv14.4, %conv10.4
  %mul15.5 = mul nsw i32 %conv14.5, %conv10.5
  %mul15.6 = mul nsw i32 %conv14.6, %conv10.6
  %mul15.7 = mul nsw i32 %conv14.7, %conv10.7

  ; 符号扩展乘法结果
  %conv16 = sext i32 %mul15 to i64
  %conv16.1 = sext i32 %mul15.1 to i64
  %conv16.2 = sext i32 %mul15.2 to i64
  %conv16.3 = sext i32 %mul15.3 to i64
  %conv16.4 = sext i32 %mul15.4 to i64
  %conv16.5 = sext i32 %mul15.5 to i64
  %conv16.6 = sext i32 %mul15.6 to i64
  %conv16.7 = sext i32 %mul15.7 to i64

  ; 累加运算
  %add17 = add nsw i64 %acc.059, %conv16
  %add17.1 = add nsw i64 %add17, %conv16.1
  %add17.2 = add nsw i64 %add17.1, %conv16.2
  %add17.3 = add nsw i64 %add17.2, %conv16.3
  %add17.4 = add nsw i64 %add17.3, %conv16.4
  %add17.5 = add nsw i64 %add17.4, %conv16.5
  %add17.6 = add nsw i64 %add17.5, %conv16.6
  %add17.7 = add nsw i64 %add17.6, %conv16.7

  ; 循环控制
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub6
  br i1 %exitcond.not.7, label %for.body9.7, label %for.cond110.preheader, !llvm.loop !10

for.body9.clone:                                  ; preds = %for.body9.clone, %for.cond110.preheader
  %s.060.clone = phi i32 [ %inc.clone, %for.body9.clone ], [ %s.0.lcssa, %for.cond110.preheader ]
  %acc.059.clone = phi i64 [ %add17.clone, %for.body9.clone ], [ %acc.0.lcssa1, %for.cond110.preheader ]
  %arrayidx.clone = getelementptr i16, ptr %1, i32 %s.060.clone
  %19 = load i16, ptr %arrayidx.clone, align 2, !tbaa !6
  %conv10.clone = sext i16 %19 to i32
  %mul11.clone = mul nsw i32 %s.060.clone, %k
  %gep.clone = getelementptr i16, ptr %invariant.gep, i32 %mul11.clone
  %20 = load i16, ptr %gep.clone, align 2, !tbaa !6
  %conv14.clone = sext i16 %20 to i32
  %mul15.clone = mul nsw i32 %conv14.clone, %conv10.clone
  %conv16.clone = sext i32 %mul15.clone to i64
  %add17.clone = add nsw i64 %acc.059.clone, %conv16.clone
  %inc.clone = add nuw nsw i32 %s.060.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %n
  br i1 %exitcond.not.clone, label %for.cond.cleanup8, label %for.body9.clone, !llvm.loop !10

for.cond.cleanup8:                                ; preds = %for.cond110.preheader, %for.body9.clone
  %acc.1.lcssa = phi i64 [ %add17.clone, %for.body9.clone ], [ %acc.0.lcssa1, %for.cond110.preheader ]
  %arrayidx23 = getelementptr i16, ptr %2, i32 %j.062
  %shr26 = ashr i64 %acc.1.lcssa, %sh_prom25
  %shl = shl i64 %acc.1.lcssa, %sh_prom
  %shr26.sink = select i1 %cmp18, i64 %shl, i64 %shr26
  %conv27 = trunc i64 %shr26.sink to i16
  store i16 %conv27, ptr %arrayidx23, align 2, !tbaa !6
  %inc32 = add nuw nsw i32 %j.062, 1
  %exitcond65.not = icmp eq i32 %inc32, %k
  br i1 %exitcond65.not, label %for.cond.cleanup3, label %for.body4, !llvm.loop !11
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
