; ModuleID = 'dspi_dotprod_off_s16_ansi.ll'
source_filename = "dspi_dotprod_off_s16_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.image2d_s = type { ptr, i32, i32, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_dotprod_off_s16_ansi(ptr noalias nocapture noundef readonly %in_image, ptr noalias nocapture noundef readonly %filter, ptr noalias nocapture noundef writeonly %out_value, i32 noundef %count_x, i32 noundef %count_y, i32 noundef %shift, i16 noundef signext %offset) local_unnamed_addr #0 {
entry:
  %step_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 1
  %0 = load i32, ptr %step_x, align 4, !tbaa !4
  %mul = mul nsw i32 %0, %count_x
  %stride_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 3
  %1 = load i32, ptr %stride_x, align 4, !tbaa !10
  %cmp = icmp sgt i32 %mul, %1
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %step_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 2
  %2 = load i32, ptr %step_y, align 4, !tbaa !11
  %mul1 = mul nsw i32 %2, %count_y
  %stride_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 4
  %3 = load i32, ptr %stride_y, align 4, !tbaa !12
  %cmp2 = icmp sgt i32 %mul1, %3
  br i1 %cmp2, label %return, label %if.end4

if.end4:                                          ; preds = %if.end
  %step_x5 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 1
  %4 = load i32, ptr %step_x5, align 4, !tbaa !4
  %mul6 = mul nsw i32 %4, %count_x
  %stride_x7 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 3
  %5 = load i32, ptr %stride_x7, align 4, !tbaa !10
  %cmp8 = icmp sgt i32 %mul6, %5
  br i1 %cmp8, label %return, label %if.end10

if.end10:                                         ; preds = %if.end4
  %step_y11 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 2
  %6 = load i32, ptr %step_y11, align 4, !tbaa !11
  %mul12 = mul nsw i32 %6, %count_y
  %stride_y13 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 4
  %7 = load i32, ptr %stride_y13, align 4, !tbaa !12
  %cmp14 = icmp sgt i32 %mul12, %7
  br i1 %cmp14, label %return, label %if.end16

if.end16:                                         ; preds = %if.end10
  %mul20 = mul nsw i32 %2, %1
  %mul23 = mul nsw i32 %6, %5
  %cmp24305 = icmp sgt i32 %count_y, 0
  br i1 %cmp24305, label %for.cond25.preheader.lr.ph, label %for.cond.cleanup

for.cond25.preheader.lr.ph:                       ; preds = %if.end16
  %8 = load ptr, ptr %filter, align 4, !tbaa !13
  %9 = load ptr, ptr %in_image, align 4, !tbaa !13
  %sub = add nsw i32 %count_x, -7
  %cmp26283 = icmp sgt i32 %count_x, 7
  %conv35 = sext i16 %offset to i32
  %10 = and i32 %count_x, -8
  br label %for.cond25.preheader

for.cond25.preheader:                             ; preds = %for.cond.cleanup27, %for.cond25.preheader.lr.ph
  %i_data.0309 = phi ptr [ %9, %for.cond25.preheader.lr.ph ], [ %add.ptr, %for.cond.cleanup27 ]
  %f_data.0308 = phi ptr [ %8, %for.cond25.preheader.lr.ph ], [ %add.ptr178, %for.cond.cleanup27 ]
  %acc.081 = phi i64 [ 0, %for.cond25.preheader.lr.ph ], [ %add177, %for.cond.cleanup27 ]
  %y.082 = phi i32 [ 0, %for.cond25.preheader.lr.ph ], [ %inc180, %for.cond.cleanup27 ]
  br i1 %cmp26283, label %for.body28.7, label %for.cond146.preheader

for.cond.cleanup:                                 ; preds = %for.cond.cleanup27, %if.end16
  %acc.0.lcssa = phi i64 [ 0, %if.end16 ], [ %add177, %for.cond.cleanup27 ]
  %sub182 = add nsw i32 %shift, -1
  %shl = shl nuw i32 1, %sub182
  %conv183 = sext i32 %shl to i64
  %add184 = add nsw i64 %acc.0.lcssa, %conv183
  %sh_prom = zext nneg i32 %shift to i64
  %shr = ashr i64 %add184, %sh_prom
  %conv185 = trunc i64 %shr to i16
  store i16 %conv185, ptr %out_value, align 2, !tbaa !14
  br label %return

for.cond146.preheader:                            ; preds = %for.body28.7, %for.cond25.preheader
  %acc2.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add69, %for.body28.7 ]
  %acc3.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add84, %for.body28.7 ]
  %acc4.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add99, %for.body28.7 ]
  %acc5.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add114, %for.body28.7 ]
  %acc6.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add129, %for.body28.7 ]
  %acc7.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add144, %for.body28.7 ]
  %x.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %10, %for.body28.7 ]
  %acc1.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add54, %for.body28.7 ]
  %acc0.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add39, %for.body28.7 ]

  %cmp129268 = icmp slt i32 %x.0.lcssa, %count_x
  br i1 %cmp129268, label %for.body28.clone, label %for.cond.cleanup27

for.body28.7:                                     ; preds = %for.cond25.preheader, %for.body28.7
  %acc0.0292 = phi i32 [ %add39, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc0.0291 = phi i32 [ %add54, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %x.0290 = phi i32 [ %inc.7, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc2.0284 = phi i32 [ %add69, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc2.0285 = phi i32 [ %add84, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc2.0286 = phi i32 [ %add99, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc5.0287 = phi i32 [ %add114, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc6.0288 = phi i32 [ %add129, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc7.0289 = phi i32 [ %add144, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %mul30 = mul nsw i32 %x.0290, %0
  %arrayidx = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul30
  %11 = load i16, ptr %arrayidx, align 2, !tbaa !14
  %conv = sext i16 %11 to i32
  %mul32 = mul nsw i32 %x.0290, %4
  %arrayidx33 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul32
  %12 = load i16, ptr %arrayidx33, align 2, !tbaa !14
  %conv34 = sext i16 %12 to i32
  %add = add nsw i32 %conv34, %conv35
  %mul36 = mul nsw i32 %add, %conv
  %add39 = add i32 %mul36, %acc0.0292
  %inc = or disjoint i32 %x.0290, 1
  %mul30.1 = mul nsw i32 %inc, %0
  %arrayidx.1 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul30.1
  %13 = load i16, ptr %arrayidx.1, align 2, !tbaa !14
  %conv.1 = sext i16 %13 to i32
  %mul32.1 = mul nsw i32 %inc, %4
  %arrayidx33.1 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul32.1
  %14 = load i16, ptr %arrayidx33.1, align 2, !tbaa !14
  %conv34.1 = sext i16 %14 to i32
  %add.1 = add nsw i32 %conv34.1, %conv35
  %mul36.1 = mul nsw i32 %add.1, %conv.1
  %add54 = add i32 %mul36.1, %acc0.0291
  %inc.1 = or disjoint i32 %x.0290, 2
  %mul30.2 = mul nsw i32 %inc.1, %0
  %arrayidx.2 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul30.2
  %15 = load i16, ptr %arrayidx.2, align 2, !tbaa !14
  %conv.2 = sext i16 %15 to i32
  %mul32.2 = mul nsw i32 %inc.1, %4
  %arrayidx33.2 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul32.2
  %16 = load i16, ptr %arrayidx33.2, align 2, !tbaa !14
  %conv34.2 = sext i16 %16 to i32
  %add.2 = add nsw i32 %conv34.2, %conv35
  %mul36.2 = mul nsw i32 %add.2, %conv.2
  %add69 = add i32 %mul36.2, %acc2.0284
  %inc.2 = or disjoint i32 %x.0290, 3
  %mul30.3 = mul nsw i32 %inc.2, %0
  %arrayidx.3 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul30.3
  %17 = load i16, ptr %arrayidx.3, align 2, !tbaa !14
  %conv.3 = sext i16 %17 to i32
  %mul32.3 = mul nsw i32 %inc.2, %4
  %arrayidx33.3 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul32.3
  %18 = load i16, ptr %arrayidx33.3, align 2, !tbaa !14
  %conv34.3 = sext i16 %18 to i32
  %add.3 = add nsw i32 %conv34.3, %conv35
  %mul36.3 = mul nsw i32 %add.3, %conv.3
  %add84 = add i32 %mul36.3, %acc2.0285
  %inc.3 = or disjoint i32 %x.0290, 4
  %mul30.4 = mul nsw i32 %inc.3, %0
  %arrayidx.4 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul30.4
  %19 = load i16, ptr %arrayidx.4, align 2, !tbaa !14
  %conv.4 = sext i16 %19 to i32
  %mul32.4 = mul nsw i32 %inc.3, %4
  %arrayidx33.4 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul32.4
  %20 = load i16, ptr %arrayidx33.4, align 2, !tbaa !14
  %conv34.4 = sext i16 %20 to i32
  %add.4 = add nsw i32 %conv34.4, %conv35
  %mul36.4 = mul nsw i32 %add.4, %conv.4
  %add99 = add i32 %mul36.4, %acc2.0286
  %inc.4 = or disjoint i32 %x.0290, 5
  %mul30.5 = mul nsw i32 %inc.4, %0
  %arrayidx.5 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul30.5
  %21 = load i16, ptr %arrayidx.5, align 2, !tbaa !14
  %conv.5 = sext i16 %21 to i32
  %mul32.5 = mul nsw i32 %inc.4, %4
  %arrayidx33.5 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul32.5
  %22 = load i16, ptr %arrayidx33.5, align 2, !tbaa !14
  %conv34.5 = sext i16 %22 to i32
  %add.5 = add nsw i32 %conv34.5, %conv35
  %mul36.5 = mul nsw i32 %add.5, %conv.5
  %add114 = add i32 %mul36.5, %acc5.0287
  %inc.5 = or disjoint i32 %x.0290, 6
  %mul30.6 = mul nsw i32 %inc.5, %0
  %arrayidx.6 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul30.6
  %23 = load i16, ptr %arrayidx.6, align 2, !tbaa !14
  %conv.6 = sext i16 %23 to i32
  %mul32.6 = mul nsw i32 %inc.5, %4
  %arrayidx33.6 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul32.6
  %24 = load i16, ptr %arrayidx33.6, align 2, !tbaa !14
  %conv34.6 = sext i16 %24 to i32
  %add.6 = add nsw i32 %conv34.6, %conv35
  %mul36.6 = mul nsw i32 %add.6, %conv.6
  %add129 = add i32 %mul36.6, %acc6.0288
  %inc.6 = or disjoint i32 %x.0290, 7
  %mul30.7 = mul nsw i32 %inc.6, %0
  %arrayidx.7 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul30.7
  %25 = load i16, ptr %arrayidx.7, align 2, !tbaa !14
  %conv.7 = sext i16 %25 to i32
  %mul32.7 = mul nsw i32 %inc.6, %4
  %arrayidx33.7 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul32.7
  %26 = load i16, ptr %arrayidx33.7, align 2, !tbaa !14
  %conv34.7 = sext i16 %26 to i32
  %add.7 = add nsw i32 %conv34.7, %conv35
  %mul36.7 = mul nsw i32 %add.7, %conv.7
  %add144 = add i32 %mul36.7, %acc7.0289
  %inc.7 = add nuw nsw i32 %x.0290, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub
  br i1 %exitcond.not.7, label %for.body28.7, label %for.cond146.preheader, !llvm.loop !16

for.body28.clone:                                 ; preds = %for.cond146.preheader, %for.body28.clone
  %acc.176.clone = phi i64 [ %add38.clone, %for.body28.clone ], [ %acc.081, %for.cond146.preheader ]
  %x.0290.clone = phi i32 [ %inc.clone, %for.body28.clone ], [ %x.0.lcssa, %for.cond146.preheader ]
  %mul30.clone = mul nsw i32 %x.0290.clone, %0
  %arrayidx.clone = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul30.clone
  %35 = load i16, ptr %arrayidx.clone, align 2, !tbaa !14
  %conv.clone = sext i16 %35 to i32
  %mul32.clone = mul nsw i32 %x.0290.clone, %4
  %arrayidx33.clone = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul32.clone
  %36 = load i16, ptr %arrayidx33.clone, align 2, !tbaa !14
  %conv34.clone = sext i16 %36 to i32
  %add.clone = add nsw i32 %conv34.clone, %conv35
  %mul36.clone = mul nsw i32 %add.clone, %conv.clone
  %conv37.clone = sext i32 %mul36.clone to i64
  %add38.clone = add nsw i64 %conv37.clone, %acc.176.clone
  %inc.clone = add nuw nsw i32 %x.0290.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %count_x
  br i1 %exitcond.not.clone, label %for.cond.cleanup27, label %for.body28.clone, !llvm.loop !16

for.cond.cleanup27:                               ; preds = %for.body28.clone, %for.cond146.preheader
  %37 = phi i64 [ %acc.081, %for.cond146.preheader ], [ %add38.clone, %for.body28.clone ]
  %pairwise.sum1 = add i32 %acc1.0.lcssa, %acc0.0.lcssa
  %pairwise.sum2 = add i32 %acc3.0.lcssa, %acc2.0.lcssa
  %pairwise.sum3 = add i32 %acc5.0.lcssa, %acc4.0.lcssa
  %pairwise.sum4 = add i32 %acc7.0.lcssa, %acc6.0.lcssa
  %pairwise.sum5 = add i32 %pairwise.sum1, %pairwise.sum2
  %pairwise.sum6 = add i32 %pairwise.sum3, %pairwise.sum4
  %pairwise.sum7 = add i32 %pairwise.sum5, %pairwise.sum6
  ;%pairwise.sum45 = add i32 %pairwise.sum44, %acc7.0.lcssa
  %38 = sext i32 %pairwise.sum7 to i64
  %add177 = add nsw i64 %37, %38
  %add.ptr = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul20
  %add.ptr178 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul23
  %inc180 = add nuw nsw i32 %y.082, 1
  %exitcond84.not = icmp eq i32 %inc180, %count_y
  br i1 %exitcond84.not, label %for.cond.cleanup, label %for.cond25.preheader, !llvm.loop !18

return:                                           ; preds = %for.cond.cleanup, %if.end10, %if.end4, %if.end, %entry
  %retval.0 = phi i32 [ 0, %for.cond.cleanup ], [ 458755, %entry ], [ 458755, %if.end ], [ 458755, %if.end4 ], [ 458755, %if.end10 ]
  ret i32 %retval.0
}

attributes #0 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zca,+zcmp,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"}
!4 = !{!5, !9, i64 4}
!5 = !{!"image2d_s", !6, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!5, !9, i64 12}
!11 = !{!5, !9, i64 8}
!12 = !{!5, !9, i64 16}
!13 = !{!5, !6, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"short", !7, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
