; ModuleID = 'dspi_dotprod_s8_best.c'
source_filename = "dspi_dotprod_s8_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.image2d_s = type { ptr, i32, i32, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_dotprod_s8_ansi(ptr nocapture noundef readonly %in_image, ptr nocapture noundef readonly %filter, ptr nocapture noundef writeonly %out_value, i32 noundef %count_x, i32 noundef %count_y, i32 noundef %shift) local_unnamed_addr #0 {
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
  %cmp24280 = icmp sgt i32 %count_y, 0
  br i1 %cmp24280, label %for.cond25.preheader.lr.ph, label %for.cond.cleanup

for.cond25.preheader.lr.ph:                       ; preds = %if.end16
  %8 = load ptr, ptr %filter, align 4, !tbaa !13
  %9 = load ptr, ptr %in_image, align 4, !tbaa !13
  %sub = add nsw i32 %count_x, -7
  %cmp26258 = icmp sgt i32 %count_x, 7
  %10 = and i32 %count_x, -8
  br label %for.cond25.preheader

for.cond25.preheader:                             ; preds = %for.cond25.preheader.lr.ph, %for.end153
  %i_data.0284 = phi ptr [ %9, %for.cond25.preheader.lr.ph ], [ %add.ptr, %for.end153 ]
  %f_data.0283 = phi ptr [ %8, %for.cond25.preheader.lr.ph ], [ %add.ptr162, %for.end153 ]
  %acc.0282 = phi i32 [ 0, %for.cond25.preheader.lr.ph ], [ %add161, %for.end153 ]
  %y.0281 = phi i32 [ 0, %for.cond25.preheader.lr.ph ], [ %inc164, %for.end153 ]
  br i1 %cmp26258, label %for.body27, label %for.cond136.preheader

for.cond.cleanup:                                 ; preds = %for.end153, %if.end16
  %acc.0.lcssa = phi i32 [ 0, %if.end16 ], [ %add161, %for.end153 ]
  %sub166 = add nsw i32 %shift, -1
  %shl = shl nuw i32 1, %sub166
  %add167 = add nsw i32 %acc.0.lcssa, %shl
  %shr = ashr i32 %add167, %shift
  %conv168 = trunc i32 %shr to i8
  store i8 %conv168, ptr %out_value, align 1, !tbaa !14
  br label %return

for.cond136.preheader:                            ; preds = %for.body27, %for.cond25.preheader
  %acc2.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add64, %for.body27 ]
  %acc3.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add78, %for.body27 ]
  %acc4.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add92, %for.body27 ]
  %acc5.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add106, %for.body27 ]
  %acc6.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add120, %for.body27 ]
  %acc7.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add134, %for.body27 ]
  %x.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %10, %for.body27 ]
  %acc1.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add50, %for.body27 ]
  %acc0.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add, %for.body27 ]
  %cmp137276 = icmp slt i32 %x.0.lcssa, %count_x
  br i1 %cmp137276, label %for.body139, label %for.end153

for.body27:                                       ; preds = %for.cond25.preheader, %for.body27
  %acc0.0267 = phi i32 [ %add, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc1.0266 = phi i32 [ %add50, %for.body27 ], [ 0, %for.cond25.preheader ]
  %x.0265 = phi i32 [ %add135, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc7.0264 = phi i32 [ %add134, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc6.0263 = phi i32 [ %add120, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc5.0262 = phi i32 [ %add106, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc4.0261 = phi i32 [ %add92, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc3.0260 = phi i32 [ %add78, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc2.0259 = phi i32 [ %add64, %for.body27 ], [ 0, %for.cond25.preheader ]
  %mul29 = mul nsw i32 %x.0265, %0
  %arrayidx = getelementptr inbounds i8, ptr %i_data.0284, i32 %mul29
  %11 = load i8, ptr %arrayidx, align 1, !tbaa !14
  %conv30 = sext i8 %11 to i32
  %mul32 = mul nsw i32 %x.0265, %4
  %arrayidx33 = getelementptr inbounds i8, ptr %f_data.0283, i32 %mul32
  %12 = load i8, ptr %arrayidx33, align 1, !tbaa !14
  %conv35 = sext i8 %12 to i32
  %mul36 = mul nsw i32 %conv35, %conv30
  %add = add nsw i32 %mul36, %acc0.0267
  %add38 = or disjoint i32 %x.0265, 1
  %mul39 = mul nsw i32 %add38, %0
  %arrayidx40 = getelementptr inbounds i8, ptr %i_data.0284, i32 %mul39
  %13 = load i8, ptr %arrayidx40, align 1, !tbaa !14
  %conv42 = sext i8 %13 to i32
  %mul45 = mul nsw i32 %add38, %4
  %arrayidx46 = getelementptr inbounds i8, ptr %f_data.0283, i32 %mul45
  %14 = load i8, ptr %arrayidx46, align 1, !tbaa !14
  %conv48 = sext i8 %14 to i32
  %mul49 = mul nsw i32 %conv48, %conv42
  %add50 = add nsw i32 %mul49, %acc1.0266
  %add52 = or disjoint i32 %x.0265, 2
  %mul53 = mul nsw i32 %add52, %0
  %arrayidx54 = getelementptr inbounds i8, ptr %i_data.0284, i32 %mul53
  %15 = load i8, ptr %arrayidx54, align 1, !tbaa !14
  %conv56 = sext i8 %15 to i32
  %mul59 = mul nsw i32 %add52, %4
  %arrayidx60 = getelementptr inbounds i8, ptr %f_data.0283, i32 %mul59
  %16 = load i8, ptr %arrayidx60, align 1, !tbaa !14
  %conv62 = sext i8 %16 to i32
  %mul63 = mul nsw i32 %conv62, %conv56
  %add64 = add nsw i32 %mul63, %acc2.0259
  %add66 = or disjoint i32 %x.0265, 3
  %mul67 = mul nsw i32 %add66, %0
  %arrayidx68 = getelementptr inbounds i8, ptr %i_data.0284, i32 %mul67
  %17 = load i8, ptr %arrayidx68, align 1, !tbaa !14
  %conv70 = sext i8 %17 to i32
  %mul73 = mul nsw i32 %add66, %4
  %arrayidx74 = getelementptr inbounds i8, ptr %f_data.0283, i32 %mul73
  %18 = load i8, ptr %arrayidx74, align 1, !tbaa !14
  %conv76 = sext i8 %18 to i32
  %mul77 = mul nsw i32 %conv76, %conv70
  %add78 = add nsw i32 %mul77, %acc3.0260
  %add80 = or disjoint i32 %x.0265, 4
  %mul81 = mul nsw i32 %add80, %0
  %arrayidx82 = getelementptr inbounds i8, ptr %i_data.0284, i32 %mul81
  %19 = load i8, ptr %arrayidx82, align 1, !tbaa !14
  %conv84 = sext i8 %19 to i32
  %mul87 = mul nsw i32 %add80, %4
  %arrayidx88 = getelementptr inbounds i8, ptr %f_data.0283, i32 %mul87
  %20 = load i8, ptr %arrayidx88, align 1, !tbaa !14
  %conv90 = sext i8 %20 to i32
  %mul91 = mul nsw i32 %conv90, %conv84
  %add92 = add nsw i32 %mul91, %acc4.0261
  %add94 = or disjoint i32 %x.0265, 5
  %mul95 = mul nsw i32 %add94, %0
  %arrayidx96 = getelementptr inbounds i8, ptr %i_data.0284, i32 %mul95
  %21 = load i8, ptr %arrayidx96, align 1, !tbaa !14
  %conv98 = sext i8 %21 to i32
  %mul101 = mul nsw i32 %add94, %4
  %arrayidx102 = getelementptr inbounds i8, ptr %f_data.0283, i32 %mul101
  %22 = load i8, ptr %arrayidx102, align 1, !tbaa !14
  %conv104 = sext i8 %22 to i32
  %mul105 = mul nsw i32 %conv104, %conv98
  %add106 = add nsw i32 %mul105, %acc5.0262
  %add108 = or disjoint i32 %x.0265, 6
  %mul109 = mul nsw i32 %add108, %0
  %arrayidx110 = getelementptr inbounds i8, ptr %i_data.0284, i32 %mul109
  %23 = load i8, ptr %arrayidx110, align 1, !tbaa !14
  %conv112 = sext i8 %23 to i32
  %mul115 = mul nsw i32 %add108, %4
  %arrayidx116 = getelementptr inbounds i8, ptr %f_data.0283, i32 %mul115
  %24 = load i8, ptr %arrayidx116, align 1, !tbaa !14
  %conv118 = sext i8 %24 to i32
  %mul119 = mul nsw i32 %conv118, %conv112
  %add120 = add nsw i32 %mul119, %acc6.0263
  %add122 = or disjoint i32 %x.0265, 7
  %mul123 = mul nsw i32 %add122, %0
  %arrayidx124 = getelementptr inbounds i8, ptr %i_data.0284, i32 %mul123
  %25 = load i8, ptr %arrayidx124, align 1, !tbaa !14
  %conv126 = sext i8 %25 to i32
  %mul129 = mul nsw i32 %add122, %4
  %arrayidx130 = getelementptr inbounds i8, ptr %f_data.0283, i32 %mul129
  %26 = load i8, ptr %arrayidx130, align 1, !tbaa !14
  %conv132 = sext i8 %26 to i32
  %mul133 = mul nsw i32 %conv132, %conv126
  %add134 = add nsw i32 %mul133, %acc7.0264
  %add135 = add nuw nsw i32 %x.0265, 8
  %cmp26 = icmp slt i32 %add135, %sub
  br i1 %cmp26, label %for.body27, label %for.cond136.preheader, !llvm.loop !15

for.body139:                                      ; preds = %for.cond136.preheader, %for.body139
  %acc.1278 = phi i32 [ %add151, %for.body139 ], [ %acc.0282, %for.cond136.preheader ]
  %x.1277 = phi i32 [ %inc, %for.body139 ], [ %x.0.lcssa, %for.cond136.preheader ]
  %mul141 = mul nsw i32 %x.1277, %0
  %arrayidx142 = getelementptr inbounds i8, ptr %i_data.0284, i32 %mul141
  %27 = load i8, ptr %arrayidx142, align 1, !tbaa !14
  %conv144 = sext i8 %27 to i32
  %mul146 = mul nsw i32 %x.1277, %4
  %arrayidx147 = getelementptr inbounds i8, ptr %f_data.0283, i32 %mul146
  %28 = load i8, ptr %arrayidx147, align 1, !tbaa !14
  %conv149 = sext i8 %28 to i32
  %mul150 = mul nsw i32 %conv149, %conv144
  %add151 = add nsw i32 %mul150, %acc.1278
  %inc = add nuw nsw i32 %x.1277, 1
  %exitcond.not = icmp eq i32 %inc, %count_x
  br i1 %exitcond.not, label %for.end153, label %for.body139, !llvm.loop !17

for.end153:                                       ; preds = %for.body139, %for.cond136.preheader
  %acc.1.lcssa = phi i32 [ %acc.0282, %for.cond136.preheader ], [ %add151, %for.body139 ]
  %add154 = add i32 %acc3.0.lcssa, %acc2.0.lcssa
  %add155 = add i32 %add154, %acc4.0.lcssa
  %add158 = add i32 %add155, %acc5.0.lcssa
  %add157 = add i32 %add158, %acc6.0.lcssa
  %add156 = add i32 %add157, %acc7.0.lcssa
  %add159 = add i32 %add156, %acc1.0.lcssa
  %add160 = add i32 %add159, %acc0.0.lcssa
  %add161 = add nsw i32 %add160, %acc.1.lcssa
  %add.ptr = getelementptr inbounds i8, ptr %i_data.0284, i32 %mul20
  %add.ptr162 = getelementptr inbounds i8, ptr %f_data.0283, i32 %mul23
  %inc164 = add nuw nsw i32 %y.0281, 1
  %exitcond286.not = icmp eq i32 %inc164, %count_y
  br i1 %exitcond286.not, label %for.cond.cleanup, label %for.cond25.preheader, !llvm.loop !18

return:                                           ; preds = %if.end10, %if.end4, %if.end, %entry, %for.cond.cleanup
  %retval.0 = phi i32 [ 0, %for.cond.cleanup ], [ 458755, %entry ], [ 458755, %if.end ], [ 458755, %if.end4 ], [ 458755, %if.end10 ]
  ret i32 %retval.0
}

attributes #0 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zca,+zcmp,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"}
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
!14 = !{!7, !7, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !16}
