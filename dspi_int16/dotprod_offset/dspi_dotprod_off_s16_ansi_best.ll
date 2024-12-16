; ModuleID = 'dspi_dotprod_off_s16_ansi_best.c'
source_filename = "dspi_dotprod_off_s16_ansi_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.image2d_s = type { ptr, i32, i32, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_dotprod_off_s16_ansi(ptr nocapture noundef readonly %in_image, ptr nocapture noundef readonly %filter, ptr nocapture noundef writeonly %out_value, i32 noundef %count_x, i32 noundef %count_y, i32 noundef %shift, i16 noundef signext %offset) local_unnamed_addr #0 {
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

for.cond25.preheader:                             ; preds = %for.cond25.preheader.lr.ph, %for.end164
  %i_data.0309 = phi ptr [ %9, %for.cond25.preheader.lr.ph ], [ %add.ptr, %for.end164 ]
  %f_data.0308 = phi ptr [ %8, %for.cond25.preheader.lr.ph ], [ %add.ptr178, %for.end164 ]
  %acc.0307 = phi i64 [ 0, %for.cond25.preheader.lr.ph ], [ %add177, %for.end164 ]
  %y.0306 = phi i32 [ 0, %for.cond25.preheader.lr.ph ], [ %inc180, %for.end164 ]
  br i1 %cmp26283, label %for.body27, label %for.cond146.preheader

for.cond.cleanup:                                 ; preds = %for.end164, %if.end16
  %acc.0.lcssa = phi i64 [ 0, %if.end16 ], [ %add177, %for.end164 ]
  %sub182 = add nsw i32 %shift, -1
  %shl = shl nuw i32 1, %sub182
  %conv183 = sext i32 %shl to i64
  %add184 = add nsw i64 %acc.0.lcssa, %conv183
  %sh_prom = zext nneg i32 %shift to i64
  %shr = ashr i64 %add184, %sh_prom
  %conv185 = trunc i64 %shr to i16
  store i16 %conv185, ptr %out_value, align 2, !tbaa !14
  br label %return

for.cond146.preheader:                            ; preds = %for.body27, %for.cond25.preheader
  %acc2.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add69, %for.body27 ]
  %acc3.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add84, %for.body27 ]
  %acc4.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add99, %for.body27 ]
  %acc5.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add114, %for.body27 ]
  %acc6.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add129, %for.body27 ]
  %acc7.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add144, %for.body27 ]
  %x.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %10, %for.body27 ]
  %acc1.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add54, %for.body27 ]
  %acc0.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add39, %for.body27 ]
  %cmp147301 = icmp slt i32 %x.0.lcssa, %count_x
  br i1 %cmp147301, label %for.body149, label %for.end164

for.body27:                                       ; preds = %for.cond25.preheader, %for.body27
  %acc0.0292 = phi i32 [ %add39, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc1.0291 = phi i32 [ %add54, %for.body27 ], [ 0, %for.cond25.preheader ]
  %x.0290 = phi i32 [ %add145, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc7.0289 = phi i32 [ %add144, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc6.0288 = phi i32 [ %add129, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc5.0287 = phi i32 [ %add114, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc4.0286 = phi i32 [ %add99, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc3.0285 = phi i32 [ %add84, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc2.0284 = phi i32 [ %add69, %for.body27 ], [ 0, %for.cond25.preheader ]
  %mul29 = mul nsw i32 %x.0290, %0
  %arrayidx = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul29
  %11 = load i16, ptr %arrayidx, align 2, !tbaa !14
  %conv = sext i16 %11 to i32
  %mul32 = mul nsw i32 %x.0290, %4
  %arrayidx33 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul32
  %12 = load i16, ptr %arrayidx33, align 2, !tbaa !14
  %conv34 = sext i16 %12 to i32
  %add36 = add nsw i32 %conv34, %conv35
  %mul37 = mul nsw i32 %add36, %conv
  %add39 = add i32 %mul37, %acc0.0292
  %add41 = or disjoint i32 %x.0290, 1
  %mul42 = mul nsw i32 %add41, %0
  %arrayidx43 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul42
  %13 = load i16, ptr %arrayidx43, align 2, !tbaa !14
  %conv44 = sext i16 %13 to i32
  %mul47 = mul nsw i32 %add41, %4
  %arrayidx48 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul47
  %14 = load i16, ptr %arrayidx48, align 2, !tbaa !14
  %conv49 = sext i16 %14 to i32
  %add51 = add nsw i32 %conv49, %conv35
  %mul52 = mul nsw i32 %add51, %conv44
  %add54 = add i32 %mul52, %acc1.0291
  %add56 = or disjoint i32 %x.0290, 2
  %mul57 = mul nsw i32 %add56, %0
  %arrayidx58 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul57
  %15 = load i16, ptr %arrayidx58, align 2, !tbaa !14
  %conv59 = sext i16 %15 to i32
  %mul62 = mul nsw i32 %add56, %4
  %arrayidx63 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul62
  %16 = load i16, ptr %arrayidx63, align 2, !tbaa !14
  %conv64 = sext i16 %16 to i32
  %add66 = add nsw i32 %conv64, %conv35
  %mul67 = mul nsw i32 %add66, %conv59
  %add69 = add i32 %mul67, %acc2.0284
  %add71 = or disjoint i32 %x.0290, 3
  %mul72 = mul nsw i32 %add71, %0
  %arrayidx73 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul72
  %17 = load i16, ptr %arrayidx73, align 2, !tbaa !14
  %conv74 = sext i16 %17 to i32
  %mul77 = mul nsw i32 %add71, %4
  %arrayidx78 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul77
  %18 = load i16, ptr %arrayidx78, align 2, !tbaa !14
  %conv79 = sext i16 %18 to i32
  %add81 = add nsw i32 %conv79, %conv35
  %mul82 = mul nsw i32 %add81, %conv74
  %add84 = add i32 %mul82, %acc3.0285
  %add86 = or disjoint i32 %x.0290, 4
  %mul87 = mul nsw i32 %add86, %0
  %arrayidx88 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul87
  %19 = load i16, ptr %arrayidx88, align 2, !tbaa !14
  %conv89 = sext i16 %19 to i32
  %mul92 = mul nsw i32 %add86, %4
  %arrayidx93 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul92
  %20 = load i16, ptr %arrayidx93, align 2, !tbaa !14
  %conv94 = sext i16 %20 to i32
  %add96 = add nsw i32 %conv94, %conv35
  %mul97 = mul nsw i32 %add96, %conv89
  %add99 = add i32 %mul97, %acc4.0286
  %add101 = or disjoint i32 %x.0290, 5
  %mul102 = mul nsw i32 %add101, %0
  %arrayidx103 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul102
  %21 = load i16, ptr %arrayidx103, align 2, !tbaa !14
  %conv104 = sext i16 %21 to i32
  %mul107 = mul nsw i32 %add101, %4
  %arrayidx108 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul107
  %22 = load i16, ptr %arrayidx108, align 2, !tbaa !14
  %conv109 = sext i16 %22 to i32
  %add111 = add nsw i32 %conv109, %conv35
  %mul112 = mul nsw i32 %add111, %conv104
  %add114 = add i32 %mul112, %acc5.0287
  %add116 = or disjoint i32 %x.0290, 6
  %mul117 = mul nsw i32 %add116, %0
  %arrayidx118 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul117
  %23 = load i16, ptr %arrayidx118, align 2, !tbaa !14
  %conv119 = sext i16 %23 to i32
  %mul122 = mul nsw i32 %add116, %4
  %arrayidx123 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul122
  %24 = load i16, ptr %arrayidx123, align 2, !tbaa !14
  %conv124 = sext i16 %24 to i32
  %add126 = add nsw i32 %conv124, %conv35
  %mul127 = mul nsw i32 %add126, %conv119
  %add129 = add i32 %mul127, %acc6.0288
  %add131 = or disjoint i32 %x.0290, 7
  %mul132 = mul nsw i32 %add131, %0
  %arrayidx133 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul132
  %25 = load i16, ptr %arrayidx133, align 2, !tbaa !14
  %conv134 = sext i16 %25 to i32
  %mul137 = mul nsw i32 %add131, %4
  %arrayidx138 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul137
  %26 = load i16, ptr %arrayidx138, align 2, !tbaa !14
  %conv139 = sext i16 %26 to i32
  %add141 = add nsw i32 %conv139, %conv35
  %mul142 = mul nsw i32 %add141, %conv134
  %add144 = add i32 %mul142, %acc7.0289
  %add145 = add nuw nsw i32 %x.0290, 8
  %cmp26 = icmp slt i32 %add145, %sub
  br i1 %cmp26, label %for.body27, label %for.cond146.preheader, !llvm.loop !16

for.body149:                                      ; preds = %for.cond146.preheader, %for.body149
  %acc.1303 = phi i64 [ %add162, %for.body149 ], [ %acc.0307, %for.cond146.preheader ]
  %x.1302 = phi i32 [ %inc, %for.body149 ], [ %x.0.lcssa, %for.cond146.preheader ]
  %mul151 = mul nsw i32 %x.1302, %0
  %arrayidx152 = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul151
  %27 = load i16, ptr %arrayidx152, align 2, !tbaa !14
  %conv153 = sext i16 %27 to i32
  %mul155 = mul nsw i32 %x.1302, %4
  %arrayidx156 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul155
  %28 = load i16, ptr %arrayidx156, align 2, !tbaa !14
  %conv157 = sext i16 %28 to i32
  %add159 = add nsw i32 %conv157, %conv35
  %mul160 = mul nsw i32 %add159, %conv153
  %conv161 = sext i32 %mul160 to i64
  %add162 = add nsw i64 %acc.1303, %conv161
  %inc = add nuw nsw i32 %x.1302, 1
  %exitcond.not = icmp eq i32 %inc, %count_x
  br i1 %exitcond.not, label %for.end164, label %for.body149, !llvm.loop !18

for.end164:                                       ; preds = %for.body149, %for.cond146.preheader
  %acc.1.lcssa = phi i64 [ %acc.0307, %for.cond146.preheader ], [ %add162, %for.body149 ]
  ; %add165 = add i32 %acc3.0.lcssa, %acc2.0.lcssa
  ; %add167 = add i32 %add165, %acc4.0.lcssa
  ; %add173 = add i32 %add167, %acc5.0.lcssa
  ; %add171 = add i32 %add173, %acc6.0.lcssa
  ; %add169 = add i32 %add171, %acc7.0.lcssa
  ; %add174 = add i32 %add169, %acc1.0.lcssa
  ; %add175 = add i32 %add174, %acc0.0.lcssa
  %add165 = add i32 %acc1.0.lcssa, %acc0.0.lcssa
  %add166 = add i32 %acc3.0.lcssa, %acc2.0.lcssa
  %add167 = add i32 %acc5.0.lcssa, %acc4.0.lcssa
  %add168 = add i32 %acc7.0.lcssa, %acc6.0.lcssa
  %add169 = add i32 %add165, %add166
  %add170 = add i32 %add167, %add168
  %add171 = add i32 %add169, %add170
  %conv176 = sext i32 %add171 to i64
  %add177 = add nsw i64 %acc.1.lcssa, %conv176
  %add.ptr = getelementptr inbounds i16, ptr %i_data.0309, i32 %mul20
  %add.ptr178 = getelementptr inbounds i16, ptr %f_data.0308, i32 %mul23
  %inc180 = add nuw nsw i32 %y.0306, 1
  %exitcond311.not = icmp eq i32 %inc180, %count_y
  br i1 %exitcond311.not, label %for.cond.cleanup, label %for.cond25.preheader, !llvm.loop !19

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
!19 = distinct !{!19, !17}
