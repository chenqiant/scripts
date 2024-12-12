; ModuleID = 'dspi_dotprod_s16_ansi_best.ll'
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
  %cmp24272 = icmp sgt i32 %count_y, 0
  br i1 %cmp24272, label %for.cond25.preheader.lr.ph, label %for.cond.cleanup

for.cond25.preheader.lr.ph:                       ; preds = %if.end16
  %8 = load ptr, ptr %filter, align 4, !tbaa !13
  %9 = load ptr, ptr %in_image, align 4, !tbaa !13
  %sub = add nsw i32 %count_x, -7
  %cmp26250 = icmp sgt i32 %count_x, 7
  %10 = and i32 %count_x, -8
  br i1 %cmp26250, label %for.cond25.preheader.lr.ph.split.us, label %for.cond25.preheader.lr.ph.split

for.cond25.preheader.lr.ph.split.us:              ; preds = %for.cond25.preheader.lr.ph
  %cmp129268.us = icmp slt i32 %10, %count_x
  br label %for.cond25.preheader.us

for.cond25.preheader.us:                          ; preds = %for.end144.us, %for.cond25.preheader.lr.ph.split.us
  %y.0276.us = phi i32 [ 0, %for.cond25.preheader.lr.ph.split.us ], [ %inc155.us, %for.end144.us ]
  %acc.0275.us = phi i64 [ 0, %for.cond25.preheader.lr.ph.split.us ], [ %add152.us, %for.end144.us ]
  %i_data.0274.us = phi ptr [ %9, %for.cond25.preheader.lr.ph.split.us ], [ %add.ptr.us, %for.end144.us ]
  %f_data.0273.us = phi ptr [ %8, %for.cond25.preheader.lr.ph.split.us ], [ %add.ptr153.us, %for.end144.us ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.cond25.preheader.us, %for.body27.us
  %x.0259.us = phi i32 [ %add127.us, %for.body27.us ], [ 0, %for.cond25.preheader.us ]
  %acc7.0258.us = phi i64 [ %add126.us, %for.body27.us ], [ 0, %for.cond25.preheader.us ]
  %acc6.0257.us = phi i64 [ %add113.us, %for.body27.us ], [ 0, %for.cond25.preheader.us ]
  %acc5.0256.us = phi i64 [ %add100.us, %for.body27.us ], [ 0, %for.cond25.preheader.us ]
  %acc4.0255.us = phi i64 [ %add87.us, %for.body27.us ], [ 0, %for.cond25.preheader.us ]
  %acc3.0254.us = phi i64 [ %add74.us, %for.body27.us ], [ 0, %for.cond25.preheader.us ]
  %acc2.0253.us = phi i64 [ %add61.us, %for.body27.us ], [ 0, %for.cond25.preheader.us ]
  %acc1.0252.us = phi i64 [ %add48.us, %for.body27.us ], [ 0, %for.cond25.preheader.us ]
  %acc0.0251.us = phi i64 [ %add.us, %for.body27.us ], [ 0, %for.cond25.preheader.us ]
  %mul29.us = mul nsw i32 %x.0259.us, %0
  %arrayidx.us = getelementptr inbounds i16, ptr %i_data.0274.us, i32 %mul29.us
  %11 = load i16, ptr %arrayidx.us, align 2, !tbaa !14
  %conv.us = sext i16 %11 to i32
  %mul31.us = mul nsw i32 %x.0259.us, %4
  %arrayidx32.us = getelementptr inbounds i16, ptr %f_data.0273.us, i32 %mul31.us
  %12 = load i16, ptr %arrayidx32.us, align 2, !tbaa !14
  %conv33.us = sext i16 %12 to i32
  %mul34.us = mul nsw i32 %conv33.us, %conv.us
  %conv35.us = sext i32 %mul34.us to i64
  %add.us = add nsw i64 %acc0.0251.us, %conv35.us
  %add37.us = or disjoint i32 %x.0259.us, 1
  %mul38.us = mul nsw i32 %add37.us, %0
  %arrayidx39.us = getelementptr inbounds i16, ptr %i_data.0274.us, i32 %mul38.us
  %13 = load i16, ptr %arrayidx39.us, align 2, !tbaa !14
  %conv40.us = sext i16 %13 to i32
  %mul43.us = mul nsw i32 %add37.us, %4
  %arrayidx44.us = getelementptr inbounds i16, ptr %f_data.0273.us, i32 %mul43.us
  %14 = load i16, ptr %arrayidx44.us, align 2, !tbaa !14
  %conv45.us = sext i16 %14 to i32
  %mul46.us = mul nsw i32 %conv45.us, %conv40.us
  %conv47.us = sext i32 %mul46.us to i64
  %add48.us = add nsw i64 %acc1.0252.us, %conv47.us
  %add50.us = or disjoint i32 %x.0259.us, 2
  %mul51.us = mul nsw i32 %add50.us, %0
  %arrayidx52.us = getelementptr inbounds i16, ptr %i_data.0274.us, i32 %mul51.us
  %15 = load i16, ptr %arrayidx52.us, align 2, !tbaa !14
  %conv53.us = sext i16 %15 to i32
  %mul56.us = mul nsw i32 %add50.us, %4
  %arrayidx57.us = getelementptr inbounds i16, ptr %f_data.0273.us, i32 %mul56.us
  %16 = load i16, ptr %arrayidx57.us, align 2, !tbaa !14
  %conv58.us = sext i16 %16 to i32
  %mul59.us = mul nsw i32 %conv58.us, %conv53.us
  %conv60.us = sext i32 %mul59.us to i64
  %add61.us = add nsw i64 %acc2.0253.us, %conv60.us
  %add63.us = or disjoint i32 %x.0259.us, 3
  %mul64.us = mul nsw i32 %add63.us, %0
  %arrayidx65.us = getelementptr inbounds i16, ptr %i_data.0274.us, i32 %mul64.us
  %17 = load i16, ptr %arrayidx65.us, align 2, !tbaa !14
  %conv66.us = sext i16 %17 to i32
  %mul69.us = mul nsw i32 %add63.us, %4
  %arrayidx70.us = getelementptr inbounds i16, ptr %f_data.0273.us, i32 %mul69.us
  %18 = load i16, ptr %arrayidx70.us, align 2, !tbaa !14
  %conv71.us = sext i16 %18 to i32
  %mul72.us = mul nsw i32 %conv71.us, %conv66.us
  %conv73.us = sext i32 %mul72.us to i64
  %add74.us = add nsw i64 %acc3.0254.us, %conv73.us
  %add76.us = or disjoint i32 %x.0259.us, 4
  %mul77.us = mul nsw i32 %add76.us, %0
  %arrayidx78.us = getelementptr inbounds i16, ptr %i_data.0274.us, i32 %mul77.us
  %19 = load i16, ptr %arrayidx78.us, align 2, !tbaa !14
  %conv79.us = sext i16 %19 to i32
  %mul82.us = mul nsw i32 %add76.us, %4
  %arrayidx83.us = getelementptr inbounds i16, ptr %f_data.0273.us, i32 %mul82.us
  %20 = load i16, ptr %arrayidx83.us, align 2, !tbaa !14
  %conv84.us = sext i16 %20 to i32
  %mul85.us = mul nsw i32 %conv84.us, %conv79.us
  %conv86.us = sext i32 %mul85.us to i64
  %add87.us = add nsw i64 %acc4.0255.us, %conv86.us
  %add89.us = or disjoint i32 %x.0259.us, 5
  %mul90.us = mul nsw i32 %add89.us, %0
  %arrayidx91.us = getelementptr inbounds i16, ptr %i_data.0274.us, i32 %mul90.us
  %21 = load i16, ptr %arrayidx91.us, align 2, !tbaa !14
  %conv92.us = sext i16 %21 to i32
  %mul95.us = mul nsw i32 %add89.us, %4
  %arrayidx96.us = getelementptr inbounds i16, ptr %f_data.0273.us, i32 %mul95.us
  %22 = load i16, ptr %arrayidx96.us, align 2, !tbaa !14
  %conv97.us = sext i16 %22 to i32
  %mul98.us = mul nsw i32 %conv97.us, %conv92.us
  %conv99.us = sext i32 %mul98.us to i64
  %add100.us = add nsw i64 %acc5.0256.us, %conv99.us
  %add102.us = or disjoint i32 %x.0259.us, 6
  %mul103.us = mul nsw i32 %add102.us, %0
  %arrayidx104.us = getelementptr inbounds i16, ptr %i_data.0274.us, i32 %mul103.us
  %23 = load i16, ptr %arrayidx104.us, align 2, !tbaa !14
  %conv105.us = sext i16 %23 to i32
  %mul108.us = mul nsw i32 %add102.us, %4
  %arrayidx109.us = getelementptr inbounds i16, ptr %f_data.0273.us, i32 %mul108.us
  %24 = load i16, ptr %arrayidx109.us, align 2, !tbaa !14
  %conv110.us = sext i16 %24 to i32
  %mul111.us = mul nsw i32 %conv110.us, %conv105.us
  %conv112.us = sext i32 %mul111.us to i64
  %add113.us = add nsw i64 %acc6.0257.us, %conv112.us
  %add115.us = or disjoint i32 %x.0259.us, 7
  %mul116.us = mul nsw i32 %add115.us, %0
  %arrayidx117.us = getelementptr inbounds i16, ptr %i_data.0274.us, i32 %mul116.us
  %25 = load i16, ptr %arrayidx117.us, align 2, !tbaa !14
  %conv118.us = sext i16 %25 to i32
  %mul121.us = mul nsw i32 %add115.us, %4
  %arrayidx122.us = getelementptr inbounds i16, ptr %f_data.0273.us, i32 %mul121.us
  %26 = load i16, ptr %arrayidx122.us, align 2, !tbaa !14
  %conv123.us = sext i16 %26 to i32
  %mul124.us = mul nsw i32 %conv123.us, %conv118.us
  %conv125.us = sext i32 %mul124.us to i64
  %add126.us = add nsw i64 %acc7.0258.us, %conv125.us
  %add127.us = add nuw nsw i32 %x.0259.us, 8
  %cmp26.us = icmp slt i32 %add127.us, %sub
  br i1 %cmp26.us, label %for.body27.us, label %for.cond128.preheader.loopexit.us, !llvm.loop !16

for.body131.us:                                   ; preds = %for.cond128.preheader.loopexit.us, %for.body131.us
  %x.1270.us = phi i32 [ %inc.us, %for.body131.us ], [ %10, %for.cond128.preheader.loopexit.us ]
  %acc.1269.us = phi i64 [ %add142.us, %for.body131.us ], [ %acc.0275.us, %for.cond128.preheader.loopexit.us ]
  %mul133.us = mul nsw i32 %x.1270.us, %0
  %arrayidx134.us = getelementptr inbounds i16, ptr %i_data.0274.us, i32 %mul133.us
  %27 = load i16, ptr %arrayidx134.us, align 2, !tbaa !14
  %conv135.us = sext i16 %27 to i32
  %mul137.us = mul nsw i32 %x.1270.us, %4
  %arrayidx138.us = getelementptr inbounds i16, ptr %f_data.0273.us, i32 %mul137.us
  %28 = load i16, ptr %arrayidx138.us, align 2, !tbaa !14
  %conv139.us = sext i16 %28 to i32
  %mul140.us = mul nsw i32 %conv139.us, %conv135.us
  %conv141.us = sext i32 %mul140.us to i64
  %add142.us = add nsw i64 %acc.1269.us, %conv141.us
  %inc.us = add nuw nsw i32 %x.1270.us, 1
  %exitcond.not.us = icmp eq i32 %inc.us, %count_x
  br i1 %exitcond.not.us, label %for.end144.us, label %for.body131.us, !llvm.loop !18

for.end144.us:                                    ; preds = %for.body131.us, %for.cond128.preheader.loopexit.us
  %acc.1.lcssa.us = phi i64 [ %acc.0275.us, %for.cond128.preheader.loopexit.us ], [ %add142.us, %for.body131.us ]
  %add145.us = add nsw i64 %add48.us, %add.us
  %add146.us = add nsw i64 %add145.us, %add61.us
  %add147.us = add nsw i64 %add146.us, %add74.us
  %add148.us = add nsw i64 %add147.us, %add87.us
  %add149.us = add nsw i64 %add148.us, %add100.us
  %add150.us = add nsw i64 %add149.us, %add113.us
  %add151.us = add nsw i64 %add150.us, %add126.us
  %add152.us = add nsw i64 %add151.us, %acc.1.lcssa.us
  %add.ptr.us = getelementptr inbounds i16, ptr %i_data.0274.us, i32 %mul20
  %add.ptr153.us = getelementptr inbounds i16, ptr %f_data.0273.us, i32 %mul23
  %inc155.us = add nuw nsw i32 %y.0276.us, 1
  %exitcond278.not.us = icmp eq i32 %inc155.us, %count_y
  br i1 %exitcond278.not.us, label %for.cond.cleanup, label %for.cond25.preheader.us, !llvm.loop !19

for.cond128.preheader.loopexit.us:                ; preds = %for.body27.us
  br i1 %cmp129268.us, label %for.body131.us, label %for.end144.us

for.cond25.preheader.lr.ph.split:                 ; preds = %for.cond25.preheader.lr.ph
  %cmp129268 = icmp sgt i32 %count_x, 0
  br i1 %cmp129268, label %for.cond25.preheader.us2, label %for.cond.cleanup

for.cond25.preheader.us2:                         ; preds = %for.cond25.preheader.lr.ph.split, %for.end144.loopexit.us28
  %y.0276.us3 = phi i32 [ %inc155.us25, %for.end144.loopexit.us28 ], [ 0, %for.cond25.preheader.lr.ph.split ]
  %acc.0275.us4 = phi i64 [ %add142.us18, %for.end144.loopexit.us28 ], [ 0, %for.cond25.preheader.lr.ph.split ]
  %i_data.0274.us5 = phi ptr [ %add.ptr.us23, %for.end144.loopexit.us28 ], [ %9, %for.cond25.preheader.lr.ph.split ]
  %f_data.0273.us6 = phi ptr [ %add.ptr153.us24, %for.end144.loopexit.us28 ], [ %8, %for.cond25.preheader.lr.ph.split ]
  br label %for.body131.us7

for.body131.us7:                                  ; preds = %for.cond25.preheader.us2, %for.body131.us7
  %x.1270.us8 = phi i32 [ %inc.us19, %for.body131.us7 ], [ 0, %for.cond25.preheader.us2 ]
  %acc.1269.us9 = phi i64 [ %add142.us18, %for.body131.us7 ], [ %acc.0275.us4, %for.cond25.preheader.us2 ]
  %mul133.us10 = mul nsw i32 %x.1270.us8, %0
  %arrayidx134.us11 = getelementptr inbounds i16, ptr %i_data.0274.us5, i32 %mul133.us10
  %29 = load i16, ptr %arrayidx134.us11, align 2, !tbaa !14
  %conv135.us12 = sext i16 %29 to i32
  %mul137.us13 = mul nsw i32 %x.1270.us8, %4
  %arrayidx138.us14 = getelementptr inbounds i16, ptr %f_data.0273.us6, i32 %mul137.us13
  %30 = load i16, ptr %arrayidx138.us14, align 2, !tbaa !14
  %conv139.us15 = sext i16 %30 to i32
  %mul140.us16 = mul nsw i32 %conv139.us15, %conv135.us12
  %conv141.us17 = sext i32 %mul140.us16 to i64
  %add142.us18 = add nsw i64 %acc.1269.us9, %conv141.us17
  %inc.us19 = add nuw nsw i32 %x.1270.us8, 1
  %exitcond.not.us20 = icmp eq i32 %inc.us19, %count_x
  br i1 %exitcond.not.us20, label %for.end144.loopexit.us28, label %for.body131.us7, !llvm.loop !18

for.end144.loopexit.us28:                         ; preds = %for.body131.us7
  %add.ptr.us23 = getelementptr inbounds i16, ptr %i_data.0274.us5, i32 %mul20
  %add.ptr153.us24 = getelementptr inbounds i16, ptr %f_data.0273.us6, i32 %mul23
  %inc155.us25 = add nuw nsw i32 %y.0276.us3, 1
  %exitcond278.not.us26 = icmp eq i32 %inc155.us25, %count_y
  br i1 %exitcond278.not.us26, label %for.cond.cleanup, label %for.cond25.preheader.us2, !llvm.loop !19

for.cond.cleanup:                                 ; preds = %for.end144.loopexit.us28, %for.end144.us, %for.cond25.preheader.lr.ph.split, %if.end16
  %acc.0.lcssa = phi i64 [ 0, %if.end16 ], [ 0, %for.cond25.preheader.lr.ph.split ], [ %add152.us, %for.end144.us ], [ %add142.us18, %for.end144.loopexit.us28 ]
  %sub157 = add nsw i32 %shift, -1
  %shl = shl nuw i32 1, %sub157
  %conv158 = sext i32 %shl to i64
  %add159 = add nsw i64 %acc.0.lcssa, %conv158
  %sh_prom = zext nneg i32 %shift to i64
  %shr = ashr i64 %add159, %sh_prom
  %conv160 = trunc i64 %shr to i16
  store i16 %conv160, ptr %out_value, align 2, !tbaa !14
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
!19 = distinct !{!19, !17}
