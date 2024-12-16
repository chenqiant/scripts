; ModuleID = 'dspi_dotprod_s16_ansi_best.c'
source_filename = "dspi_dotprod_s16_ansi_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.image2d_s = type { ptr, i32, i32, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_dotprod_s16_ansi(ptr nocapture noundef readonly %in_image, ptr nocapture noundef readonly %filter, ptr nocapture noundef writeonly %out_value, i32 noundef %count_x, i32 noundef %count_y, i32 noundef %shift) local_unnamed_addr #0 {
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
  %cmp24277 = icmp sgt i32 %count_y, 0
  br i1 %cmp24277, label %for.cond25.preheader.lr.ph, label %for.cond.cleanup

for.cond25.preheader.lr.ph:                       ; preds = %if.end16
  %8 = load ptr, ptr %filter, align 4, !tbaa !13
  %9 = load ptr, ptr %in_image, align 4, !tbaa !13
  %sub = add nsw i32 %count_x, -7
  %cmp26255 = icmp sgt i32 %count_x, 7
  %10 = and i32 %count_x, -8
  br label %for.cond25.preheader

for.cond25.preheader:                             ; preds = %for.cond25.preheader.lr.ph, %for.end144
  %i_data.0281 = phi ptr [ %9, %for.cond25.preheader.lr.ph ], [ %add.ptr, %for.end144 ]
  %f_data.0280 = phi ptr [ %8, %for.cond25.preheader.lr.ph ], [ %add.ptr158, %for.end144 ]
  %acc.0279 = phi i64 [ 0, %for.cond25.preheader.lr.ph ], [ %add157, %for.end144 ]
  %y.0278 = phi i32 [ 0, %for.cond25.preheader.lr.ph ], [ %inc160, %for.end144 ]
  br i1 %cmp26255, label %for.body27, label %for.cond128.preheader

for.cond.cleanup:                                 ; preds = %for.end144, %if.end16
  %acc.0.lcssa = phi i64 [ 0, %if.end16 ], [ %add157, %for.end144 ]
  %sub162 = add nsw i32 %shift, -1
  %shl = shl nuw i32 1, %sub162
  %conv163 = sext i32 %shl to i64
  %add164 = add nsw i64 %acc.0.lcssa, %conv163
  %sh_prom = zext nneg i32 %shift to i64
  %shr = ashr i64 %add164, %sh_prom
  %conv165 = trunc i64 %shr to i16
  store i16 %conv165, ptr %out_value, align 2, !tbaa !14
  br label %return

for.cond128.preheader:                            ; preds = %for.body27, %for.cond25.preheader
  %acc2.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add61, %for.body27 ]
  %acc3.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add74, %for.body27 ]
  %acc4.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add87, %for.body27 ]
  %acc5.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add100, %for.body27 ]
  %acc6.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add113, %for.body27 ]
  %acc7.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add126, %for.body27 ]
  %x.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %10, %for.body27 ]
  %acc1.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add48, %for.body27 ]
  %acc0.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %add, %for.body27 ]
  %cmp129273 = icmp slt i32 %x.0.lcssa, %count_x
  br i1 %cmp129273, label %for.body131, label %for.end144

for.body27:                                       ; preds = %for.cond25.preheader, %for.body27
  %acc0.0264 = phi i32 [ %add, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc1.0263 = phi i32 [ %add48, %for.body27 ], [ 0, %for.cond25.preheader ]
  %x.0262 = phi i32 [ %add127, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc7.0261 = phi i32 [ %add126, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc6.0260 = phi i32 [ %add113, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc5.0259 = phi i32 [ %add100, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc4.0258 = phi i32 [ %add87, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc3.0257 = phi i32 [ %add74, %for.body27 ], [ 0, %for.cond25.preheader ]
  %acc2.0256 = phi i32 [ %add61, %for.body27 ], [ 0, %for.cond25.preheader ]
  %mul29 = mul nsw i32 %x.0262, %0
  %arrayidx = getelementptr inbounds i16, ptr %i_data.0281, i32 %mul29
  %11 = load i16, ptr %arrayidx, align 2, !tbaa !14
  %conv = sext i16 %11 to i32
  %mul31 = mul nsw i32 %x.0262, %4
  %arrayidx32 = getelementptr inbounds i16, ptr %f_data.0280, i32 %mul31
  %12 = load i16, ptr %arrayidx32, align 2, !tbaa !14
  %conv33 = sext i16 %12 to i32
  %mul34 = mul nsw i32 %conv33, %conv
  %add = add i32 %mul34, %acc0.0264
  %add37 = or disjoint i32 %x.0262, 1
  %mul38 = mul nsw i32 %add37, %0
  %arrayidx39 = getelementptr inbounds i16, ptr %i_data.0281, i32 %mul38
  %13 = load i16, ptr %arrayidx39, align 2, !tbaa !14
  %conv40 = sext i16 %13 to i32
  %mul43 = mul nsw i32 %add37, %4
  %arrayidx44 = getelementptr inbounds i16, ptr %f_data.0280, i32 %mul43
  %14 = load i16, ptr %arrayidx44, align 2, !tbaa !14
  %conv45 = sext i16 %14 to i32
  %mul46 = mul nsw i32 %conv45, %conv40
  %add48 = add i32 %mul46, %acc1.0263
  %add50 = or disjoint i32 %x.0262, 2
  %mul51 = mul nsw i32 %add50, %0
  %arrayidx52 = getelementptr inbounds i16, ptr %i_data.0281, i32 %mul51
  %15 = load i16, ptr %arrayidx52, align 2, !tbaa !14
  %conv53 = sext i16 %15 to i32
  %mul56 = mul nsw i32 %add50, %4
  %arrayidx57 = getelementptr inbounds i16, ptr %f_data.0280, i32 %mul56
  %16 = load i16, ptr %arrayidx57, align 2, !tbaa !14
  %conv58 = sext i16 %16 to i32
  %mul59 = mul nsw i32 %conv58, %conv53
  %add61 = add i32 %mul59, %acc2.0256
  %add63 = or disjoint i32 %x.0262, 3
  %mul64 = mul nsw i32 %add63, %0
  %arrayidx65 = getelementptr inbounds i16, ptr %i_data.0281, i32 %mul64
  %17 = load i16, ptr %arrayidx65, align 2, !tbaa !14
  %conv66 = sext i16 %17 to i32
  %mul69 = mul nsw i32 %add63, %4
  %arrayidx70 = getelementptr inbounds i16, ptr %f_data.0280, i32 %mul69
  %18 = load i16, ptr %arrayidx70, align 2, !tbaa !14
  %conv71 = sext i16 %18 to i32
  %mul72 = mul nsw i32 %conv71, %conv66
  %add74 = add i32 %mul72, %acc3.0257
  %add76 = or disjoint i32 %x.0262, 4
  %mul77 = mul nsw i32 %add76, %0
  %arrayidx78 = getelementptr inbounds i16, ptr %i_data.0281, i32 %mul77
  %19 = load i16, ptr %arrayidx78, align 2, !tbaa !14
  %conv79 = sext i16 %19 to i32
  %mul82 = mul nsw i32 %add76, %4
  %arrayidx83 = getelementptr inbounds i16, ptr %f_data.0280, i32 %mul82
  %20 = load i16, ptr %arrayidx83, align 2, !tbaa !14
  %conv84 = sext i16 %20 to i32
  %mul85 = mul nsw i32 %conv84, %conv79
  %add87 = add i32 %mul85, %acc4.0258
  %add89 = or disjoint i32 %x.0262, 5
  %mul90 = mul nsw i32 %add89, %0
  %arrayidx91 = getelementptr inbounds i16, ptr %i_data.0281, i32 %mul90
  %21 = load i16, ptr %arrayidx91, align 2, !tbaa !14
  %conv92 = sext i16 %21 to i32
  %mul95 = mul nsw i32 %add89, %4
  %arrayidx96 = getelementptr inbounds i16, ptr %f_data.0280, i32 %mul95
  %22 = load i16, ptr %arrayidx96, align 2, !tbaa !14
  %conv97 = sext i16 %22 to i32
  %mul98 = mul nsw i32 %conv97, %conv92
  %add100 = add i32 %mul98, %acc5.0259
  %add102 = or disjoint i32 %x.0262, 6
  %mul103 = mul nsw i32 %add102, %0
  %arrayidx104 = getelementptr inbounds i16, ptr %i_data.0281, i32 %mul103
  %23 = load i16, ptr %arrayidx104, align 2, !tbaa !14
  %conv105 = sext i16 %23 to i32
  %mul108 = mul nsw i32 %add102, %4
  %arrayidx109 = getelementptr inbounds i16, ptr %f_data.0280, i32 %mul108
  %24 = load i16, ptr %arrayidx109, align 2, !tbaa !14
  %conv110 = sext i16 %24 to i32
  %mul111 = mul nsw i32 %conv110, %conv105
  %add113 = add i32 %mul111, %acc6.0260
  %add115 = or disjoint i32 %x.0262, 7
  %mul116 = mul nsw i32 %add115, %0
  %arrayidx117 = getelementptr inbounds i16, ptr %i_data.0281, i32 %mul116
  %25 = load i16, ptr %arrayidx117, align 2, !tbaa !14
  %conv118 = sext i16 %25 to i32
  %mul121 = mul nsw i32 %add115, %4
  %arrayidx122 = getelementptr inbounds i16, ptr %f_data.0280, i32 %mul121
  %26 = load i16, ptr %arrayidx122, align 2, !tbaa !14
  %conv123 = sext i16 %26 to i32
  %mul124 = mul nsw i32 %conv123, %conv118
  %add126 = add i32 %mul124, %acc7.0261
  %add127 = add nuw nsw i32 %x.0262, 8
  %cmp26 = icmp slt i32 %add127, %sub
  br i1 %cmp26, label %for.body27, label %for.cond128.preheader, !llvm.loop !16

for.body131:                                      ; preds = %for.cond128.preheader, %for.body131
  %acc.1275 = phi i64 [ %add142, %for.body131 ], [ %acc.0279, %for.cond128.preheader ]
  %x.1274 = phi i32 [ %inc, %for.body131 ], [ %x.0.lcssa, %for.cond128.preheader ]
  %mul133 = mul nsw i32 %x.1274, %0
  %arrayidx134 = getelementptr inbounds i16, ptr %i_data.0281, i32 %mul133
  %27 = load i16, ptr %arrayidx134, align 2, !tbaa !14
  %conv135 = sext i16 %27 to i32
  %mul137 = mul nsw i32 %x.1274, %4
  %arrayidx138 = getelementptr inbounds i16, ptr %f_data.0280, i32 %mul137
  %28 = load i16, ptr %arrayidx138, align 2, !tbaa !14
  %conv139 = sext i16 %28 to i32
  %mul140 = mul nsw i32 %conv139, %conv135
  %conv141 = sext i32 %mul140 to i64
  %add142 = add nsw i64 %acc.1275, %conv141
  %inc = add nuw nsw i32 %x.1274, 1
  %exitcond.not = icmp eq i32 %inc, %count_x
  br i1 %exitcond.not, label %for.end144, label %for.body131, !llvm.loop !18

for.end144:                                       ; preds = %for.body131, %for.cond128.preheader
  %acc.1.lcssa = phi i64 [ %acc.0279, %for.cond128.preheader ], [ %add142, %for.body131 ]
  %add145 = add i32 %acc3.0.lcssa, %acc2.0.lcssa
  %add147 = add i32 %add145, %acc4.0.lcssa
  %add153 = add i32 %add147, %acc5.0.lcssa
  %add151 = add i32 %add153, %acc6.0.lcssa
  %add149 = add i32 %add151, %acc7.0.lcssa
  %add154 = add i32 %add149, %acc1.0.lcssa
  %add155 = add i32 %add154, %acc0.0.lcssa
  %conv156 = sext i32 %add155 to i64
  %add157 = add nsw i64 %acc.1.lcssa, %conv156
  %add.ptr = getelementptr inbounds i16, ptr %i_data.0281, i32 %mul20
  %add.ptr158 = getelementptr inbounds i16, ptr %f_data.0280, i32 %mul23
  %inc160 = add nuw nsw i32 %y.0278, 1
  %exitcond283.not = icmp eq i32 %inc160, %count_y
  br i1 %exitcond283.not, label %for.cond.cleanup, label %for.cond25.preheader, !llvm.loop !19

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
