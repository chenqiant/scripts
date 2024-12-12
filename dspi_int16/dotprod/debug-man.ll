; ModuleID = 'after_customlicm.ll'
source_filename = "dspi_dotprod_s16_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.image2d_s = type { ptr, i32, i32, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_dotprod_s16_ansi(ptr noalias nocapture noundef readonly %in_image, ptr noalias nocapture noundef readonly %filter, ptr noalias nocapture noundef writeonly %out_value, i32 noundef %count_x, i32 noundef %count_y, i32 noundef %shift) local_unnamed_addr #0 {
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
  %8 = load ptr, ptr %in_image, align 4, !tbaa !13
  %9 = load ptr, ptr %filter, align 4, !tbaa !13
  %mul20 = mul nsw i32 %2, %1
  %mul23 = mul nsw i32 %6, %5
  %cmp2673 = icmp sgt i32 %count_x, 0
  br i1 %cmp2673, label %for.cond25.preheader.lr.ph, label %for.cond.cleanup

for.cond25.preheader.lr.ph:
  %sub = add nsw i32 %count_x, -7
  %cmp28239 = icmp sgt i32 %count_x, 7
  br i1 %cmp28239, label %for.cond25.preheader.us.preheader, label %for.cond27.preheader.lr.ph.split

for.cond25.preheader.us.preheader:                ; preds = %for.cond25.preheader.lr.ph
  %m10 = and i32 %count_x, 2147483640
  %cmp115257.us = icmp slt i32 %m10, %count_x
  br label %for.cond25.preheader.us

for.cond25.preheader.us:                          ; preds = %for.cond25.for.cond.cleanup27_crit_edge.us, %for.cond25.preheader.us.preheader
  %y.080.us = phi i32 [ %inc39.us, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ 0, %for.cond25.preheader.us.preheader ]
  %acc.079.us = phi i64 [ %add.us.lcssa, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ 0, %for.cond25.preheader.us.preheader ]
  %i_data.078.us = phi ptr [ %add.ptr.us, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ %8, %for.cond25.preheader.us.preheader ]
  %f_data.077.us = phi ptr [ %add.ptr37.us, %for.cond25.for.cond.cleanup27_crit_edge.us ], [ %9, %for.cond25.preheader.us.preheader ]
  br label %for.body28.us.7

for.end128.us:
  %acc0.1.lcssa.us = phi i32 [ %add.us, %for.cond27.for.cond114.preheader_crit_edge.us ], [ %add126.us, %for.body117.us ]
  %add129.us = add i32 %add57.us, %add46.us
  %add131.us = add i32 %add129.us, %add68.us
  %add137.us = add i32 %add131.us, %add79.us
  %add135.us = add i32 %add137.us, %add90.us
  %add133.us = add i32 %add135.us, %add101.us
  %add138.us = add i32 %add133.us, %add112.us
  %add139.us = add i32 %add138.us, %acc0.1.lcssa.us
  %conv140.us = sext i32 %add139.us to i64
  %add141.us = add nsw i64 %acc.0263.us, %conv140.us
  %add.ptr.us = getelementptr inbounds i16, ptr %i_data.0265.us, i32 %mul20
  %add.ptr142.us = getelementptr inbounds i16, ptr %f_data.0264.us, i32 %mul23
  %inc144.us = add nuw nsw i32 %y.0262.us, 1
  %exitcond302.not = icmp eq i32 %inc144.us, %count_y
  br i1 %exitcond302.not, label %for.cond.cleanup, label %for.cond27.preheader.us, !llvm.loop !14

for.body28.us.clone:                              ; No predecessors!
  %x.075.us.clone = phi i32 [ 0, %for.cond25.preheader.us ], [ %inc.us.7, %for.body28.us.7 ]
  %acc.174.us.clone = phi i64 [ %acc.079.us, %for.cond25.preheader.us ], [ %add.us.7, %for.body28.us.7 ]
  %mul30.us.clone = mul nsw i32 %x.075.us.clone, %0
  %arrayidx.us.clone = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.clone
  %26 = load i16, ptr %arrayidx.us.clone, align 2, !tbaa !14
  %conv.us.clone = sext i16 %26 to i32
  %mul32.us.clone = mul nsw i32 %x.075.us.clone, %4
  %arrayidx33.us.clone = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.clone
  %27 = load i16, ptr %arrayidx33.us.clone, align 2, !tbaa !14
  %conv34.us.clone = sext i16 %27 to i32
  %mul35.us.clone = mul nsw i32 %conv34.us.clone, %conv.us.clone
  %conv36.us.clone = sext i32 %mul35.us.clone to i64
  %add.us.clone = add nsw i64 %acc.174.us.clone, %conv36.us.clone
  %inc.us.clone = add nuw nsw i32 %x.075.us.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.us.clone, %count_x
  br i1 %exitcond.not.clone, label %for.cond25.for.cond.cleanup27_crit_edge.us, label %for.body28.us.7, !llvm.loop !16


for.body28.us.7:                                  ; preds = %for.cond25.preheader.us, %for.body28.us.7, %for.body28.us.clone
  %x.075.us = phi i32 [ 0, %for.cond25.preheader.us ], [ %inc.us.7, %for.body28.us.7 ]
  %acc.174.us = phi i64 [ %acc.079.us, %for.cond25.preheader.us ], [ %add.us.7, %for.body28.us.7 ]
  %mul30.us = mul nsw i32 %x.075.us, %0
  %arrayidx.us = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us
  %10 = load i16, ptr %arrayidx.us, align 2, !tbaa !14
  %conv.us = sext i16 %10 to i32
  %mul32.us = mul nsw i32 %x.075.us, %4
  %arrayidx33.us = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us
  %11 = load i16, ptr %arrayidx33.us, align 2, !tbaa !14
  %conv34.us = sext i16 %11 to i32
  %mul35.us = mul nsw i32 %conv34.us, %conv.us
  %conv36.us = sext i32 %mul35.us to i64
  %add.us = add nsw i64 %acc.174.us, %conv36.us
  %inc.us = add nuw nsw i32 %x.075.us, 1
  %exitcond.not = icmp eq i32 %inc.us, %count_x
  %mul30.us.1 = mul nsw i32 %inc.us, %0
  %arrayidx.us.1 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.1
  %12 = load i16, ptr %arrayidx.us.1, align 2, !tbaa !14
  %conv.us.1 = sext i16 %12 to i32
  %mul32.us.1 = mul nsw i32 %inc.us, %4
  %arrayidx33.us.1 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.1
  %13 = load i16, ptr %arrayidx33.us.1, align 2, !tbaa !14
  %conv34.us.1 = sext i16 %13 to i32
  %mul35.us.1 = mul nsw i32 %conv34.us.1, %conv.us.1
  %conv36.us.1 = sext i32 %mul35.us.1 to i64
  %add.us.1 = add nsw i64 %add.us, %conv36.us.1
  %inc.us.1 = add nuw nsw i32 %x.075.us, 2
  %exitcond.not.1 = icmp eq i32 %inc.us.1, %count_x
  %mul30.us.2 = mul nsw i32 %inc.us.1, %0
  %arrayidx.us.2 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.2
  %14 = load i16, ptr %arrayidx.us.2, align 2, !tbaa !14
  %conv.us.2 = sext i16 %14 to i32
  %mul32.us.2 = mul nsw i32 %inc.us.1, %4
  %arrayidx33.us.2 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.2
  %15 = load i16, ptr %arrayidx33.us.2, align 2, !tbaa !14
  %conv34.us.2 = sext i16 %15 to i32
  %mul35.us.2 = mul nsw i32 %conv34.us.2, %conv.us.2
  %conv36.us.2 = sext i32 %mul35.us.2 to i64
  %add.us.2 = add nsw i64 %add.us.1, %conv36.us.2
  %inc.us.2 = add nuw nsw i32 %x.075.us, 3
  %exitcond.not.2 = icmp eq i32 %inc.us.2, %count_x
  %mul30.us.3 = mul nsw i32 %inc.us.2, %0
  %arrayidx.us.3 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.3
  %16 = load i16, ptr %arrayidx.us.3, align 2, !tbaa !14
  %conv.us.3 = sext i16 %16 to i32
  %mul32.us.3 = mul nsw i32 %inc.us.2, %4
  %arrayidx33.us.3 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.3
  %17 = load i16, ptr %arrayidx33.us.3, align 2, !tbaa !14
  %conv34.us.3 = sext i16 %17 to i32
  %mul35.us.3 = mul nsw i32 %conv34.us.3, %conv.us.3
  %conv36.us.3 = sext i32 %mul35.us.3 to i64
  %add.us.3 = add nsw i64 %add.us.2, %conv36.us.3
  %inc.us.3 = add nuw nsw i32 %x.075.us, 4
  %exitcond.not.3 = icmp eq i32 %inc.us.3, %count_x
  %mul30.us.4 = mul nsw i32 %inc.us.3, %0
  %arrayidx.us.4 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.4
  %18 = load i16, ptr %arrayidx.us.4, align 2, !tbaa !14
  %conv.us.4 = sext i16 %18 to i32
  %mul32.us.4 = mul nsw i32 %inc.us.3, %4
  %arrayidx33.us.4 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.4
  %19 = load i16, ptr %arrayidx33.us.4, align 2, !tbaa !14
  %conv34.us.4 = sext i16 %19 to i32
  %mul35.us.4 = mul nsw i32 %conv34.us.4, %conv.us.4
  %conv36.us.4 = sext i32 %mul35.us.4 to i64
  %add.us.4 = add nsw i64 %add.us.3, %conv36.us.4
  %inc.us.4 = add nuw nsw i32 %x.075.us, 5
  %exitcond.not.4 = icmp eq i32 %inc.us.4, %count_x
  %mul30.us.5 = mul nsw i32 %inc.us.4, %0
  %arrayidx.us.5 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.5
  %20 = load i16, ptr %arrayidx.us.5, align 2, !tbaa !14
  %conv.us.5 = sext i16 %20 to i32
  %mul32.us.5 = mul nsw i32 %inc.us.4, %4
  %arrayidx33.us.5 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.5
  %21 = load i16, ptr %arrayidx33.us.5, align 2, !tbaa !14
  %conv34.us.5 = sext i16 %21 to i32
  %mul35.us.5 = mul nsw i32 %conv34.us.5, %conv.us.5
  %conv36.us.5 = sext i32 %mul35.us.5 to i64
  %add.us.5 = add nsw i64 %add.us.4, %conv36.us.5
  %inc.us.5 = add nuw nsw i32 %x.075.us, 6
  %exitcond.not.5 = icmp eq i32 %inc.us.5, %count_x
  %mul30.us.6 = mul nsw i32 %inc.us.5, %0
  %arrayidx.us.6 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.6
  %22 = load i16, ptr %arrayidx.us.6, align 2, !tbaa !14
  %conv.us.6 = sext i16 %22 to i32
  %mul32.us.6 = mul nsw i32 %inc.us.5, %4
  %arrayidx33.us.6 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.6
  %23 = load i16, ptr %arrayidx33.us.6, align 2, !tbaa !14
  %conv34.us.6 = sext i16 %23 to i32
  %mul35.us.6 = mul nsw i32 %conv34.us.6, %conv.us.6
  %conv36.us.6 = sext i32 %mul35.us.6 to i64
  %add.us.6 = add nsw i64 %add.us.5, %conv36.us.6
  %inc.us.6 = add nuw nsw i32 %x.075.us, 7
  %exitcond.not.6 = icmp eq i32 %inc.us.6, %count_x
  %mul30.us.7 = mul nsw i32 %inc.us.6, %0
  %arrayidx.us.7 = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul30.us.7
  %24 = load i16, ptr %arrayidx.us.7, align 2, !tbaa !14
  %conv.us.7 = sext i16 %24 to i32
  %mul32.us.7 = mul nsw i32 %inc.us.6, %4
  %arrayidx33.us.7 = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul32.us.7
  %25 = load i16, ptr %arrayidx33.us.7, align 2, !tbaa !14
  %conv34.us.7 = sext i16 %25 to i32
  %mul35.us.7 = mul nsw i32 %conv34.us.7, %conv.us.7
  %conv36.us.7 = sext i32 %mul35.us.7 to i64
  %add.us.7 = add nsw i64 %add.us.6, %conv36.us.7
  %inc.us.7 = add nuw nsw i32 %x.075.us, 8
  %exitcond.not.7 = icmp eq i32 %inc.us.7, %count_x
  br i1 %exitcond.not.7, label %for.cond25.for.cond.cleanup27_crit_edge.us, label %for.body28.us.7, !llvm.loop !16

for.cond25.for.cond.cleanup27_crit_edge.us:       ; preds = %for.body28.us.clone, %for.body28.us.7
  %add.us.lcssa = phi i64 [ %add.us, %for.body28.us.7 ], [ %add.us.1, %for.body28.us.7 ], [ %add.us.2, %for.body28.us.7 ], [ %add.us.3, %for.body28.us.7 ], [ %add.us.4, %for.body28.us.7 ], [ %add.us.5, %for.body28.us.7 ], [ %add.us.6, %for.body28.us.7 ], [ %add.us.7, %for.body28.us.7 ]
  %add.ptr.us = getelementptr inbounds i16, ptr %i_data.078.us, i32 %mul20
  %add.ptr37.us = getelementptr inbounds i16, ptr %f_data.077.us, i32 %mul23
  %inc39.us = add nuw nsw i32 %y.080.us, 1
  %exitcond83.not = icmp eq i32 %inc39.us, %count_y
  br i1 %exitcond83.not, label %for.cond.cleanup, label %for.cond25.preheader.us, !llvm.loop !18

for.cond.cleanup:                                 ; preds = %for.cond25.for.cond.cleanup27_crit_edge.us, %if.end16
  %acc.0.lcssa = phi i64 [ 0, %if.end16 ], [ %add.us.lcssa, %for.cond25.for.cond.cleanup27_crit_edge.us ]
  %sub = add nsw i32 %shift, -1
  %shl = shl nuw i32 1, %sub
  %conv41 = sext i32 %shl to i64
  %add42 = add nsw i64 %acc.0.lcssa, %conv41
  %sh_prom = zext nneg i32 %shift to i64
  %shr = ashr i64 %add42, %sh_prom
  %conv43 = trunc i64 %shr to i16
  store i16 %conv43, ptr %out_value, align 2, !tbaa !14
  br label %return

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