; ModuleID = 'dspi_conv_f32_best.c'
source_filename = "dspi_conv_f32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.image2d_s = type { ptr, i32, i32, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_conv_f32_ansi(ptr nocapture noundef readonly %in_image, ptr nocapture noundef readonly %filter, ptr nocapture noundef readonly %out_image) local_unnamed_addr #0 {
entry:
  %step_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 1
  %0 = load i32, ptr %step_x, align 4, !tbaa !4
  %step_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 2
  %1 = load i32, ptr %step_y, align 4, !tbaa !10
  %stride_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 3
  %2 = load i32, ptr %stride_x, align 4, !tbaa !11
  %size_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 5
  %3 = load i32, ptr %size_x, align 4, !tbaa !12
  %size_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 6
  %4 = load i32, ptr %size_y, align 4, !tbaa !13
  %step_x1 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 1
  %5 = load i32, ptr %step_x1, align 4, !tbaa !4
  %step_y2 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 2
  %6 = load i32, ptr %step_y2, align 4, !tbaa !10
  %stride_x3 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 3
  %7 = load i32, ptr %stride_x3, align 4, !tbaa !11
  %size_x4 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 5
  %8 = load i32, ptr %size_x4, align 4, !tbaa !12
  %size_y5 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 6
  %9 = load i32, ptr %size_y5, align 4, !tbaa !13
  %step_x6 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 1
  %10 = load i32, ptr %step_x6, align 4, !tbaa !4
  %step_y7 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 2
  %11 = load i32, ptr %step_y7, align 4, !tbaa !10
  %stride_x8 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 3
  %12 = load i32, ptr %stride_x8, align 4, !tbaa !11
  %13 = load ptr, ptr %in_image, align 4, !tbaa !14
  %14 = load ptr, ptr %out_image, align 4, !tbaa !14
  %15 = load ptr, ptr %filter, align 4, !tbaa !14
  %sub = add i32 %8, -1
  %shr = ashr i32 %sub, 1
  %sub11 = add nsw i32 %9, -1
  %shr12 = ashr i32 %sub11, 1
  %mul = mul nsw i32 %2, %1
  %mul13 = mul nsw i32 %7, %6
  %mul14 = mul nsw i32 %12, %11
  %div.neg = sdiv i32 %8, -2
  %sub15 = add i32 %div.neg, %3
  %div16.neg = sdiv i32 %9, -2
  %sub17 = add i32 %div16.neg, %4
  %add = add nsw i32 %sub17, %9
  %sub20 = add i32 %sub, %sub15
  %sub21 = add nsw i32 %sub15, -1
  %cmp718 = icmp sgt i32 %shr12, 0
  br i1 %cmp718, label %for.body.lr.ph, label %for.cond137.preheader

for.body.lr.ph:                                   ; preds = %entry
  %cmp25683 = icmp sgt i32 %shr, 0
  %cmp55699 = icmp slt i32 %shr, %sub15
  %cmp68687 = icmp sgt i32 %8, 0
  %cmp94715.not = icmp sgt i32 %sub15, %3
  br label %for.body

for.cond137.preheader:                            ; preds = %for.cond.cleanup95, %entry
  %cmp138752 = icmp slt i32 %shr12, %sub17
  br i1 %cmp138752, label %for.body140.lr.ph, label %for.cond229.preheader

for.body140.lr.ph:                                ; preds = %for.cond137.preheader
  %cmp146733 = icmp sgt i32 %shr, 0
  %cmp155725 = icmp sgt i32 %9, 0
  %cmp186749.not = icmp sgt i32 %sub15, %3
  br label %for.body140

for.body:                                         ; preds = %for.body.lr.ph, %for.cond.cleanup95
  %i_pos.0720 = phi i32 [ 0, %for.body.lr.ph ], [ %add132, %for.cond.cleanup95 ]
  %y.0719 = phi i32 [ 0, %for.body.lr.ph ], [ %inc134, %for.cond.cleanup95 ]
  %sub22 = sub nsw i32 %shr12, %y.0719
  %mul23 = mul nsw i32 %y.0719, %mul14
  %invariant.gep = getelementptr float, ptr %14, i32 %mul23
  br i1 %cmp25683, label %for.body27.lr.ph, label %for.cond54.preheader

for.body27.lr.ph:                                 ; preds = %for.body
  %cmp30677 = icmp slt i32 %sub22, %9
  br label %for.body27

for.cond54.preheader:                             ; preds = %for.cond.cleanup31, %for.body
  %i_pos_y.0.lcssa = phi i32 [ %i_pos.0720, %for.body ], [ %add46, %for.cond.cleanup31 ]
  br i1 %cmp55699, label %for.cond62.preheader.lr.ph, label %for.cond93.preheader

for.cond62.preheader.lr.ph:                       ; preds = %for.cond54.preheader
  %cmp63691 = icmp slt i32 %sub22, %9
  br label %for.cond62.preheader

for.body27:                                       ; preds = %for.body27.lr.ph, %for.cond.cleanup31
  %i_pos_y.0685 = phi i32 [ %i_pos.0720, %for.body27.lr.ph ], [ %add46, %for.cond.cleanup31 ]
  %x.0684 = phi i32 [ 0, %for.body27.lr.ph ], [ %inc51, %for.cond.cleanup31 ]
  %sub28 = sub nsw i32 %shr, %x.0684
  br i1 %cmp30677, label %for.cond33.preheader.lr.ph, label %for.cond.cleanup31

for.cond33.preheader.lr.ph:                       ; preds = %for.body27
  %cmp34674 = icmp slt i32 %sub28, %8
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.lr.ph, %for.cond.cleanup35
  %i_pos_x.0681 = phi i32 [ %i_pos_y.0685, %for.cond33.preheader.lr.ph ], [ %add42, %for.cond.cleanup35 ]
  %acc.0680 = phi float [ 0.000000e+00, %for.cond33.preheader.lr.ph ], [ %acc.1.lcssa, %for.cond.cleanup35 ]
  %f_data.0679 = phi ptr [ %15, %for.cond33.preheader.lr.ph ], [ %add.ptr, %for.cond.cleanup35 ]
  %m.0678 = phi i32 [ %sub22, %for.cond33.preheader.lr.ph ], [ %inc44, %for.cond.cleanup35 ]
  br i1 %cmp34674, label %for.body36.lr.ph, label %for.cond.cleanup35

for.body36.lr.ph:                                 ; preds = %for.cond33.preheader
  %16 = getelementptr float, ptr %13, i32 %i_pos_x.0681
  br label %for.body36

for.cond.cleanup31:                               ; preds = %for.cond.cleanup35, %for.body27
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.body27 ], [ %acc.1.lcssa, %for.cond.cleanup35 ]
  %add46 = add nsw i32 %i_pos_y.0685, %0
  %mul47 = mul nsw i32 %x.0684, %10
  %gep = getelementptr float, ptr %invariant.gep, i32 %mul47
  store float %acc.0.lcssa, ptr %gep, align 4, !tbaa !15
  %inc51 = add nuw nsw i32 %x.0684, 1
  %exitcond.not = icmp eq i32 %inc51, %shr
  br i1 %exitcond.not, label %for.cond54.preheader, label %for.body27, !llvm.loop !17

for.cond.cleanup35:                               ; preds = %for.body36, %for.cond33.preheader
  %acc.1.lcssa = phi float [ %acc.0680, %for.cond33.preheader ], [ %19, %for.body36 ]
  %add.ptr = getelementptr inbounds float, ptr %f_data.0679, i32 %mul13
  %add42 = add nsw i32 %i_pos_x.0681, %mul
  %inc44 = add nsw i32 %m.0678, 1
  %cmp30 = icmp slt i32 %inc44, %9
  br i1 %cmp30, label %for.cond33.preheader, label %for.cond.cleanup31, !llvm.loop !19

for.body36:                                       ; preds = %for.body36.lr.ph, %for.body36
  %acc.1676 = phi float [ %acc.0680, %for.body36.lr.ph ], [ %19, %for.body36 ]
  %n.0675 = phi i32 [ %sub28, %for.body36.lr.ph ], [ %inc, %for.body36 ]
  %mul37 = mul nsw i32 %n.0675, %0
  %arrayidx = getelementptr float, ptr %16, i32 %mul37
  %17 = load float, ptr %arrayidx, align 4, !tbaa !15
  %mul39 = mul nsw i32 %n.0675, %5
  %arrayidx40 = getelementptr inbounds float, ptr %f_data.0679, i32 %mul39
  %18 = load float, ptr %arrayidx40, align 4, !tbaa !15
  %19 = tail call float @llvm.fmuladd.f32(float %17, float %18, float %acc.1676)
  %inc = add nsw i32 %n.0675, 1
  %cmp34 = icmp slt i32 %inc, %8
  br i1 %cmp34, label %for.body36, label %for.cond.cleanup35, !llvm.loop !20

for.cond93.preheader:                             ; preds = %for.cond.cleanup64, %for.cond54.preheader
  %i_pos_y.1.lcssa = phi i32 [ %i_pos_y.0.lcssa, %for.cond54.preheader ], [ %add85, %for.cond.cleanup64 ]
  br i1 %cmp94715.not, label %for.cond.cleanup95, label %for.body96.lr.ph

for.body96.lr.ph:                                 ; preds = %for.cond93.preheader
  %cmp103707 = icmp slt i32 %sub22, %9
  br label %for.body96

for.cond62.preheader:                             ; preds = %for.cond62.preheader.lr.ph, %for.cond.cleanup64
  %i_pos_y.1701 = phi i32 [ %i_pos_y.0.lcssa, %for.cond62.preheader.lr.ph ], [ %add85, %for.cond.cleanup64 ]
  %x53.0700 = phi i32 [ %shr, %for.cond62.preheader.lr.ph ], [ %inc90, %for.cond.cleanup64 ]
  br i1 %cmp63691, label %for.cond67.preheader, label %for.cond.cleanup64

for.cond67.preheader:                             ; preds = %for.cond62.preheader, %for.cond.cleanup69
  %m61.0695 = phi i32 [ %inc83, %for.cond.cleanup69 ], [ %sub22, %for.cond62.preheader ]
  %f_data60.0694 = phi ptr [ %add.ptr80, %for.cond.cleanup69 ], [ %15, %for.cond62.preheader ]
  %acc59.0693 = phi float [ %acc59.1.lcssa, %for.cond.cleanup69 ], [ 0.000000e+00, %for.cond62.preheader ]
  %i_pos_x58.0692 = phi i32 [ %add81, %for.cond.cleanup69 ], [ %i_pos_y.1701, %for.cond62.preheader ]
  br i1 %cmp68687, label %for.body70.lr.ph, label %for.cond.cleanup69

for.body70.lr.ph:                                 ; preds = %for.cond67.preheader
  %20 = getelementptr float, ptr %13, i32 %i_pos_x58.0692
  br label %for.body70

for.cond.cleanup64:                               ; preds = %for.cond.cleanup69, %for.cond62.preheader
  %acc59.0.lcssa = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %acc59.1.lcssa, %for.cond.cleanup69 ]
  %add85 = add nsw i32 %i_pos_y.1701, %0
  %mul86 = mul nsw i32 %x53.0700, %10
  %gep698 = getelementptr float, ptr %invariant.gep, i32 %mul86
  store float %acc59.0.lcssa, ptr %gep698, align 4, !tbaa !15
  %inc90 = add nsw i32 %x53.0700, 1
  %exitcond832.not = icmp eq i32 %inc90, %sub15
  br i1 %exitcond832.not, label %for.cond93.preheader, label %for.cond62.preheader, !llvm.loop !21

for.cond.cleanup69:                               ; preds = %for.body70, %for.cond67.preheader
  %acc59.1.lcssa = phi float [ %acc59.0693, %for.cond67.preheader ], [ %23, %for.body70 ]
  %add.ptr80 = getelementptr inbounds float, ptr %f_data60.0694, i32 %mul13
  %add81 = add nsw i32 %i_pos_x58.0692, %mul
  %inc83 = add nsw i32 %m61.0695, 1
  %cmp63 = icmp slt i32 %inc83, %9
  br i1 %cmp63, label %for.cond67.preheader, label %for.cond.cleanup64, !llvm.loop !22

for.body70:                                       ; preds = %for.body70.lr.ph, %for.body70
  %n66.0689 = phi i32 [ 0, %for.body70.lr.ph ], [ %inc78, %for.body70 ]
  %acc59.1688 = phi float [ %acc59.0693, %for.body70.lr.ph ], [ %23, %for.body70 ]
  %mul71 = mul nsw i32 %n66.0689, %0
  %arrayidx73 = getelementptr float, ptr %20, i32 %mul71
  %21 = load float, ptr %arrayidx73, align 4, !tbaa !15
  %mul74 = mul nsw i32 %n66.0689, %5
  %arrayidx75 = getelementptr inbounds float, ptr %f_data60.0694, i32 %mul74
  %22 = load float, ptr %arrayidx75, align 4, !tbaa !15
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %acc59.1688)
  %inc78 = add nuw nsw i32 %n66.0689, 1
  %exitcond831.not = icmp eq i32 %inc78, %8
  br i1 %exitcond831.not, label %for.cond.cleanup69, label %for.body70, !llvm.loop !23

for.cond.cleanup95:                               ; preds = %for.cond.cleanup104, %for.cond93.preheader
  %add132 = add nsw i32 %i_pos.0720, %mul
  %inc134 = add nuw nsw i32 %y.0719, 1
  %exitcond835.not = icmp eq i32 %inc134, %shr12
  br i1 %exitcond835.not, label %for.cond137.preheader, label %for.body, !llvm.loop !24

for.body96:                                       ; preds = %for.body96.lr.ph, %for.cond.cleanup104
  %indvars.iv = phi i32 [ %8, %for.body96.lr.ph ], [ %indvars.iv.next, %for.cond.cleanup104 ]
  %i_pos_y.2717 = phi i32 [ %i_pos_y.1.lcssa, %for.body96.lr.ph ], [ %add125, %for.cond.cleanup104 ]
  %x92.0716 = phi i32 [ %sub21, %for.body96.lr.ph ], [ %inc130, %for.cond.cleanup104 ]
  br i1 %cmp103707, label %for.cond107.preheader.lr.ph, label %for.cond.cleanup104

for.cond107.preheader.lr.ph:                      ; preds = %for.body96
  %cmp108703 = icmp sgt i32 %sub20, %x92.0716
  br label %for.cond107.preheader

for.cond107.preheader:                            ; preds = %for.cond107.preheader.lr.ph, %for.cond.cleanup109
  %m101.0711 = phi i32 [ %sub22, %for.cond107.preheader.lr.ph ], [ %inc123, %for.cond.cleanup109 ]
  %f_data99.0710 = phi ptr [ %15, %for.cond107.preheader.lr.ph ], [ %add.ptr120, %for.cond.cleanup109 ]
  %acc98.0709 = phi float [ 0.000000e+00, %for.cond107.preheader.lr.ph ], [ %acc98.1.lcssa, %for.cond.cleanup109 ]
  %i_pos_x97.0708 = phi i32 [ %i_pos_y.2717, %for.cond107.preheader.lr.ph ], [ %add121, %for.cond.cleanup109 ]
  br i1 %cmp108703, label %for.body110.lr.ph, label %for.cond.cleanup109

for.body110.lr.ph:                                ; preds = %for.cond107.preheader
  %24 = getelementptr float, ptr %13, i32 %i_pos_x97.0708
  br label %for.body110

for.cond.cleanup104:                              ; preds = %for.cond.cleanup109, %for.body96
  %acc98.0.lcssa = phi float [ 0.000000e+00, %for.body96 ], [ %acc98.1.lcssa, %for.cond.cleanup109 ]
  %add125 = add nsw i32 %i_pos_y.2717, %0
  %mul126 = mul nsw i32 %x92.0716, %10
  %gep714 = getelementptr float, ptr %invariant.gep, i32 %mul126
  store float %acc98.0.lcssa, ptr %gep714, align 4, !tbaa !15
  %inc130 = add nsw i32 %x92.0716, 1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %exitcond834.not = icmp eq i32 %inc130, %3
  br i1 %exitcond834.not, label %for.cond.cleanup95, label %for.body96, !llvm.loop !25

for.cond.cleanup109:                              ; preds = %for.body110, %for.cond107.preheader
  %acc98.1.lcssa = phi float [ %acc98.0709, %for.cond107.preheader ], [ %27, %for.body110 ]
  %add.ptr120 = getelementptr inbounds float, ptr %f_data99.0710, i32 %mul13
  %add121 = add nsw i32 %i_pos_x97.0708, %mul
  %inc123 = add nsw i32 %m101.0711, 1
  %cmp103 = icmp slt i32 %inc123, %9
  br i1 %cmp103, label %for.cond107.preheader, label %for.cond.cleanup104, !llvm.loop !26

for.body110:                                      ; preds = %for.body110.lr.ph, %for.body110
  %n106.0705 = phi i32 [ 0, %for.body110.lr.ph ], [ %inc118, %for.body110 ]
  %acc98.1704 = phi float [ %acc98.0709, %for.body110.lr.ph ], [ %27, %for.body110 ]
  %mul111 = mul nsw i32 %n106.0705, %0
  %arrayidx113 = getelementptr float, ptr %24, i32 %mul111
  %25 = load float, ptr %arrayidx113, align 4, !tbaa !15
  %mul114 = mul nsw i32 %n106.0705, %5
  %arrayidx115 = getelementptr inbounds float, ptr %f_data99.0710, i32 %mul114
  %26 = load float, ptr %arrayidx115, align 4, !tbaa !15
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %acc98.1704)
  %inc118 = add nuw nsw i32 %n106.0705, 1
  %exitcond833.not = icmp eq i32 %inc118, %indvars.iv
  br i1 %exitcond833.not, label %for.cond.cleanup109, label %for.body110, !llvm.loop !27

for.cond229.preheader:                            ; preds = %for.cond.cleanup187, %for.cond137.preheader
  %cmp230802 = icmp slt i32 %sub17, %4
  br i1 %cmp230802, label %for.body232.lr.ph, label %for.cond362.preheader

for.body232.lr.ph:                                ; preds = %for.cond229.preheader
  %cmp239767 = icmp sgt i32 %shr, 0
  %cmp280783 = icmp slt i32 %shr, %sub15
  %cmp293771 = icmp sgt i32 %8, 0
  %cmp319799 = icmp slt i32 %sub15, %3
  br label %for.body232

for.body140:                                      ; preds = %for.body140.lr.ph, %for.cond.cleanup187
  %i_pos.1754 = phi i32 [ 0, %for.body140.lr.ph ], [ %add224, %for.cond.cleanup187 ]
  %y136.0753 = phi i32 [ %shr12, %for.body140.lr.ph ], [ %inc226, %for.cond.cleanup187 ]
  %mul143 = mul nsw i32 %y136.0753, %mul14
  %invariant.gep731 = getelementptr float, ptr %14, i32 %mul143
  br i1 %cmp146733, label %for.body148, label %for.cond185.preheader

for.cond185.preheader:                            ; preds = %for.cond.cleanup156, %for.body140
  %i_pos_y141.0.lcssa = phi i32 [ %i_pos.1754, %for.body140 ], [ %add177, %for.cond.cleanup156 ]
  br i1 %cmp186749.not, label %for.cond.cleanup187, label %for.body188

for.body148:                                      ; preds = %for.body140, %for.cond.cleanup156
  %x144.0735 = phi i32 [ %inc182, %for.cond.cleanup156 ], [ 0, %for.body140 ]
  %i_pos_y141.0734 = phi i32 [ %add177, %for.cond.cleanup156 ], [ %i_pos.1754, %for.body140 ]
  %sub151 = sub nsw i32 %shr, %x144.0735
  br i1 %cmp155725, label %for.cond159.preheader.lr.ph, label %for.cond.cleanup156

for.cond159.preheader.lr.ph:                      ; preds = %for.body148
  %cmp160721 = icmp slt i32 %sub151, %8
  br label %for.cond159.preheader

for.cond159.preheader:                            ; preds = %for.cond159.preheader.lr.ph, %for.cond.cleanup161
  %m153.0729 = phi i32 [ 0, %for.cond159.preheader.lr.ph ], [ %inc175, %for.cond.cleanup161 ]
  %f_data152.0728 = phi ptr [ %15, %for.cond159.preheader.lr.ph ], [ %add.ptr172, %for.cond.cleanup161 ]
  %acc150.0727 = phi float [ 0.000000e+00, %for.cond159.preheader.lr.ph ], [ %acc150.1.lcssa, %for.cond.cleanup161 ]
  %i_pos_x149.0726 = phi i32 [ %i_pos_y141.0734, %for.cond159.preheader.lr.ph ], [ %add173, %for.cond.cleanup161 ]
  br i1 %cmp160721, label %for.body162.lr.ph, label %for.cond.cleanup161

for.body162.lr.ph:                                ; preds = %for.cond159.preheader
  %28 = getelementptr float, ptr %13, i32 %i_pos_x149.0726
  br label %for.body162

for.cond.cleanup156:                              ; preds = %for.cond.cleanup161, %for.body148
  %acc150.0.lcssa = phi float [ 0.000000e+00, %for.body148 ], [ %acc150.1.lcssa, %for.cond.cleanup161 ]
  %add177 = add nsw i32 %i_pos_y141.0734, %0
  %mul178 = mul nsw i32 %x144.0735, %10
  %gep732 = getelementptr float, ptr %invariant.gep731, i32 %mul178
  store float %acc150.0.lcssa, ptr %gep732, align 4, !tbaa !15
  %inc182 = add nuw nsw i32 %x144.0735, 1
  %exitcond837.not = icmp eq i32 %inc182, %shr
  br i1 %exitcond837.not, label %for.cond185.preheader, label %for.body148, !llvm.loop !28

for.cond.cleanup161:                              ; preds = %for.body162, %for.cond159.preheader
  %acc150.1.lcssa = phi float [ %acc150.0727, %for.cond159.preheader ], [ %31, %for.body162 ]
  %add.ptr172 = getelementptr inbounds float, ptr %f_data152.0728, i32 %mul13
  %add173 = add nsw i32 %i_pos_x149.0726, %mul
  %inc175 = add nuw nsw i32 %m153.0729, 1
  %exitcond836.not = icmp eq i32 %inc175, %9
  br i1 %exitcond836.not, label %for.cond.cleanup156, label %for.cond159.preheader, !llvm.loop !29

for.body162:                                      ; preds = %for.body162.lr.ph, %for.body162
  %n158.0723 = phi i32 [ %sub151, %for.body162.lr.ph ], [ %inc170, %for.body162 ]
  %acc150.1722 = phi float [ %acc150.0727, %for.body162.lr.ph ], [ %31, %for.body162 ]
  %mul163 = mul nsw i32 %n158.0723, %0
  %arrayidx165 = getelementptr float, ptr %28, i32 %mul163
  %29 = load float, ptr %arrayidx165, align 4, !tbaa !15
  %mul166 = mul nsw i32 %n158.0723, %5
  %arrayidx167 = getelementptr inbounds float, ptr %f_data152.0728, i32 %mul166
  %30 = load float, ptr %arrayidx167, align 4, !tbaa !15
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %acc150.1722)
  %inc170 = add nsw i32 %n158.0723, 1
  %cmp160 = icmp slt i32 %inc170, %8
  br i1 %cmp160, label %for.body162, label %for.cond.cleanup161, !llvm.loop !30

for.cond.cleanup187:                              ; preds = %for.cond.cleanup196, %for.cond185.preheader
  %add224 = add nsw i32 %i_pos.1754, %mul
  %inc226 = add nsw i32 %y136.0753, 1
  %exitcond843.not = icmp eq i32 %inc226, %sub17
  br i1 %exitcond843.not, label %for.cond229.preheader, label %for.body140, !llvm.loop !31

for.body188:                                      ; preds = %for.cond185.preheader, %for.cond.cleanup196
  %indvars.iv838 = phi i32 [ %indvars.iv.next839, %for.cond.cleanup196 ], [ %8, %for.cond185.preheader ]
  %x184.0751 = phi i32 [ %inc222, %for.cond.cleanup196 ], [ %sub21, %for.cond185.preheader ]
  %i_pos_y141.1750 = phi i32 [ %add217, %for.cond.cleanup196 ], [ %i_pos_y141.0.lcssa, %for.cond185.preheader ]
  br i1 %cmp155725, label %for.cond199.preheader.lr.ph, label %for.cond.cleanup196

for.cond199.preheader.lr.ph:                      ; preds = %for.body188
  %cmp200737 = icmp sgt i32 %sub20, %x184.0751
  br label %for.cond199.preheader

for.cond199.preheader:                            ; preds = %for.cond199.preheader.lr.ph, %for.cond.cleanup201
  %m193.0745 = phi i32 [ 0, %for.cond199.preheader.lr.ph ], [ %inc215, %for.cond.cleanup201 ]
  %f_data191.0744 = phi ptr [ %15, %for.cond199.preheader.lr.ph ], [ %add.ptr212, %for.cond.cleanup201 ]
  %acc190.0743 = phi float [ 0.000000e+00, %for.cond199.preheader.lr.ph ], [ %acc190.1.lcssa, %for.cond.cleanup201 ]
  %i_pos_x189.0742 = phi i32 [ %i_pos_y141.1750, %for.cond199.preheader.lr.ph ], [ %add213, %for.cond.cleanup201 ]
  br i1 %cmp200737, label %for.body202.lr.ph, label %for.cond.cleanup201

for.body202.lr.ph:                                ; preds = %for.cond199.preheader
  %32 = getelementptr float, ptr %13, i32 %i_pos_x189.0742
  br label %for.body202

for.cond.cleanup196:                              ; preds = %for.cond.cleanup201, %for.body188
  %acc190.0.lcssa = phi float [ 0.000000e+00, %for.body188 ], [ %acc190.1.lcssa, %for.cond.cleanup201 ]
  %add217 = add nsw i32 %i_pos_y141.1750, %0
  %mul218 = mul nsw i32 %x184.0751, %10
  %gep748 = getelementptr float, ptr %invariant.gep731, i32 %mul218
  store float %acc190.0.lcssa, ptr %gep748, align 4, !tbaa !15
  %inc222 = add nsw i32 %x184.0751, 1
  %indvars.iv.next839 = add i32 %indvars.iv838, -1
  %exitcond842.not = icmp eq i32 %inc222, %3
  br i1 %exitcond842.not, label %for.cond.cleanup187, label %for.body188, !llvm.loop !32

for.cond.cleanup201:                              ; preds = %for.body202, %for.cond199.preheader
  %acc190.1.lcssa = phi float [ %acc190.0743, %for.cond199.preheader ], [ %35, %for.body202 ]
  %add.ptr212 = getelementptr inbounds float, ptr %f_data191.0744, i32 %mul13
  %add213 = add nsw i32 %i_pos_x189.0742, %mul
  %inc215 = add nuw nsw i32 %m193.0745, 1
  %exitcond841.not = icmp eq i32 %inc215, %9
  br i1 %exitcond841.not, label %for.cond.cleanup196, label %for.cond199.preheader, !llvm.loop !33

for.body202:                                      ; preds = %for.body202.lr.ph, %for.body202
  %n198.0739 = phi i32 [ 0, %for.body202.lr.ph ], [ %inc210, %for.body202 ]
  %acc190.1738 = phi float [ %acc190.0743, %for.body202.lr.ph ], [ %35, %for.body202 ]
  %mul203 = mul nsw i32 %n198.0739, %0
  %arrayidx205 = getelementptr float, ptr %32, i32 %mul203
  %33 = load float, ptr %arrayidx205, align 4, !tbaa !15
  %mul206 = mul nsw i32 %n198.0739, %5
  %arrayidx207 = getelementptr inbounds float, ptr %f_data191.0744, i32 %mul206
  %34 = load float, ptr %arrayidx207, align 4, !tbaa !15
  %35 = tail call float @llvm.fmuladd.f32(float %33, float %34, float %acc190.1738)
  %inc210 = add nuw nsw i32 %n198.0739, 1
  %exitcond840.not = icmp eq i32 %inc210, %indvars.iv838
  br i1 %exitcond840.not, label %for.cond.cleanup201, label %for.body202, !llvm.loop !34

for.cond362.preheader:                            ; preds = %for.cond.cleanup320, %for.cond229.preheader
  br i1 %cmp138752, label %for.body365.lr.ph, label %for.cond.cleanup364

for.body365.lr.ph:                                ; preds = %for.cond362.preheader
  %cmp371817 = icmp slt i32 %shr, %sub15
  %cmp379809 = icmp sgt i32 %9, 0
  %cmp384805 = icmp sgt i32 %8, 0
  br label %for.body365

for.body232:                                      ; preds = %for.body232.lr.ph, %for.cond.cleanup320
  %indvars.iv844 = phi i32 [ %sub11, %for.body232.lr.ph ], [ %indvars.iv.next845, %for.cond.cleanup320 ]
  %i_pos.2804 = phi i32 [ 0, %for.body232.lr.ph ], [ %add357, %for.cond.cleanup320 ]
  %y228.0803 = phi i32 [ %sub17, %for.body232.lr.ph ], [ %inc359, %for.cond.cleanup320 ]
  %36 = xor i32 %y228.0803, -1
  %sub234 = add i32 %add, %36
  %mul236 = mul nsw i32 %y228.0803, %mul14
  %invariant.gep765 = getelementptr float, ptr %14, i32 %mul236
  br i1 %cmp239767, label %for.body241.lr.ph, label %for.cond279.preheader

for.body241.lr.ph:                                ; preds = %for.body232
  %cmp249759 = icmp sgt i32 %sub234, 0
  br label %for.body241

for.cond279.preheader:                            ; preds = %for.cond.cleanup250, %for.body232
  %i_pos_y233.0.lcssa = phi i32 [ %i_pos.2804, %for.body232 ], [ %add271, %for.cond.cleanup250 ]
  br i1 %cmp280783, label %for.cond287.preheader.lr.ph, label %for.cond318.preheader

for.cond287.preheader.lr.ph:                      ; preds = %for.cond279.preheader
  %cmp288775 = icmp sgt i32 %sub234, 0
  br label %for.cond287.preheader

for.body241:                                      ; preds = %for.body241.lr.ph, %for.cond.cleanup250
  %x237.0769 = phi i32 [ 0, %for.body241.lr.ph ], [ %inc276, %for.cond.cleanup250 ]
  %i_pos_y233.0768 = phi i32 [ %i_pos.2804, %for.body241.lr.ph ], [ %add271, %for.cond.cleanup250 ]
  %sub246 = sub nsw i32 %shr, %x237.0769
  br i1 %cmp249759, label %for.cond253.preheader.lr.ph, label %for.cond.cleanup250

for.cond253.preheader.lr.ph:                      ; preds = %for.body241
  %cmp254755 = icmp slt i32 %sub246, %8
  br label %for.cond253.preheader

for.cond253.preheader:                            ; preds = %for.cond253.preheader.lr.ph, %for.cond.cleanup255
  %m247.0763 = phi i32 [ 0, %for.cond253.preheader.lr.ph ], [ %inc269, %for.cond.cleanup255 ]
  %f_data244.0762 = phi ptr [ %15, %for.cond253.preheader.lr.ph ], [ %add.ptr266, %for.cond.cleanup255 ]
  %acc243.0761 = phi float [ 0.000000e+00, %for.cond253.preheader.lr.ph ], [ %acc243.1.lcssa, %for.cond.cleanup255 ]
  %i_pos_x242.0760 = phi i32 [ %i_pos_y233.0768, %for.cond253.preheader.lr.ph ], [ %add267, %for.cond.cleanup255 ]
  br i1 %cmp254755, label %for.body256.lr.ph, label %for.cond.cleanup255

for.body256.lr.ph:                                ; preds = %for.cond253.preheader
  %37 = getelementptr float, ptr %13, i32 %i_pos_x242.0760
  br label %for.body256

for.cond.cleanup250:                              ; preds = %for.cond.cleanup255, %for.body241
  %acc243.0.lcssa = phi float [ 0.000000e+00, %for.body241 ], [ %acc243.1.lcssa, %for.cond.cleanup255 ]
  %add271 = add nsw i32 %i_pos_y233.0768, %0
  %mul272 = mul nsw i32 %x237.0769, %10
  %gep766 = getelementptr float, ptr %invariant.gep765, i32 %mul272
  store float %acc243.0.lcssa, ptr %gep766, align 4, !tbaa !15
  %inc276 = add nuw nsw i32 %x237.0769, 1
  %exitcond847.not = icmp eq i32 %inc276, %shr
  br i1 %exitcond847.not, label %for.cond279.preheader, label %for.body241, !llvm.loop !35

for.cond.cleanup255:                              ; preds = %for.body256, %for.cond253.preheader
  %acc243.1.lcssa = phi float [ %acc243.0761, %for.cond253.preheader ], [ %40, %for.body256 ]
  %add.ptr266 = getelementptr inbounds float, ptr %f_data244.0762, i32 %mul13
  %add267 = add nsw i32 %i_pos_x242.0760, %mul
  %inc269 = add nuw nsw i32 %m247.0763, 1
  %exitcond846.not = icmp eq i32 %inc269, %indvars.iv844
  br i1 %exitcond846.not, label %for.cond.cleanup250, label %for.cond253.preheader, !llvm.loop !36

for.body256:                                      ; preds = %for.body256.lr.ph, %for.body256
  %n252.0757 = phi i32 [ %sub246, %for.body256.lr.ph ], [ %inc264, %for.body256 ]
  %acc243.1756 = phi float [ %acc243.0761, %for.body256.lr.ph ], [ %40, %for.body256 ]
  %mul257 = mul nsw i32 %n252.0757, %0
  %arrayidx259 = getelementptr float, ptr %37, i32 %mul257
  %38 = load float, ptr %arrayidx259, align 4, !tbaa !15
  %mul260 = mul nsw i32 %n252.0757, %5
  %arrayidx261 = getelementptr inbounds float, ptr %f_data244.0762, i32 %mul260
  %39 = load float, ptr %arrayidx261, align 4, !tbaa !15
  %40 = tail call float @llvm.fmuladd.f32(float %38, float %39, float %acc243.1756)
  %inc264 = add nsw i32 %n252.0757, 1
  %cmp254 = icmp slt i32 %inc264, %8
  br i1 %cmp254, label %for.body256, label %for.cond.cleanup255, !llvm.loop !37

for.cond318.preheader:                            ; preds = %for.cond.cleanup289, %for.cond279.preheader
  %i_pos_y233.1.lcssa = phi i32 [ %i_pos_y233.0.lcssa, %for.cond279.preheader ], [ %add310, %for.cond.cleanup289 ]
  br i1 %cmp319799, label %for.cond326.preheader.lr.ph, label %for.cond.cleanup320

for.cond326.preheader.lr.ph:                      ; preds = %for.cond318.preheader
  %cmp327791 = icmp sgt i32 %sub234, 0
  br label %for.cond326.preheader

for.cond287.preheader:                            ; preds = %for.cond287.preheader.lr.ph, %for.cond.cleanup289
  %x278.0785 = phi i32 [ %shr, %for.cond287.preheader.lr.ph ], [ %inc315, %for.cond.cleanup289 ]
  %i_pos_y233.1784 = phi i32 [ %i_pos_y233.0.lcssa, %for.cond287.preheader.lr.ph ], [ %add310, %for.cond.cleanup289 ]
  br i1 %cmp288775, label %for.cond292.preheader, label %for.cond.cleanup289

for.cond292.preheader:                            ; preds = %for.cond287.preheader, %for.cond.cleanup294
  %m286.0779 = phi i32 [ %inc308, %for.cond.cleanup294 ], [ 0, %for.cond287.preheader ]
  %f_data285.0778 = phi ptr [ %add.ptr305, %for.cond.cleanup294 ], [ %15, %for.cond287.preheader ]
  %acc284.0777 = phi float [ %acc284.1.lcssa, %for.cond.cleanup294 ], [ 0.000000e+00, %for.cond287.preheader ]
  %i_pos_x283.0776 = phi i32 [ %add306, %for.cond.cleanup294 ], [ %i_pos_y233.1784, %for.cond287.preheader ]
  br i1 %cmp293771, label %for.body295.lr.ph, label %for.cond.cleanup294

for.body295.lr.ph:                                ; preds = %for.cond292.preheader
  %41 = getelementptr float, ptr %13, i32 %i_pos_x283.0776
  br label %for.body295

for.cond.cleanup289:                              ; preds = %for.cond.cleanup294, %for.cond287.preheader
  %acc284.0.lcssa = phi float [ 0.000000e+00, %for.cond287.preheader ], [ %acc284.1.lcssa, %for.cond.cleanup294 ]
  %add310 = add nsw i32 %i_pos_y233.1784, %0
  %mul311 = mul nsw i32 %x278.0785, %10
  %gep782 = getelementptr float, ptr %invariant.gep765, i32 %mul311
  store float %acc284.0.lcssa, ptr %gep782, align 4, !tbaa !15
  %inc315 = add nsw i32 %x278.0785, 1
  %exitcond850.not = icmp eq i32 %inc315, %sub15
  br i1 %exitcond850.not, label %for.cond318.preheader, label %for.cond287.preheader, !llvm.loop !38

for.cond.cleanup294:                              ; preds = %for.body295, %for.cond292.preheader
  %acc284.1.lcssa = phi float [ %acc284.0777, %for.cond292.preheader ], [ %44, %for.body295 ]
  %add.ptr305 = getelementptr inbounds float, ptr %f_data285.0778, i32 %mul13
  %add306 = add nsw i32 %i_pos_x283.0776, %mul
  %inc308 = add nuw nsw i32 %m286.0779, 1
  %exitcond849.not = icmp eq i32 %inc308, %indvars.iv844
  br i1 %exitcond849.not, label %for.cond.cleanup289, label %for.cond292.preheader, !llvm.loop !39

for.body295:                                      ; preds = %for.body295.lr.ph, %for.body295
  %n291.0773 = phi i32 [ 0, %for.body295.lr.ph ], [ %inc303, %for.body295 ]
  %acc284.1772 = phi float [ %acc284.0777, %for.body295.lr.ph ], [ %44, %for.body295 ]
  %mul296 = mul nsw i32 %n291.0773, %0
  %arrayidx298 = getelementptr float, ptr %41, i32 %mul296
  %42 = load float, ptr %arrayidx298, align 4, !tbaa !15
  %mul299 = mul nsw i32 %n291.0773, %5
  %arrayidx300 = getelementptr inbounds float, ptr %f_data285.0778, i32 %mul299
  %43 = load float, ptr %arrayidx300, align 4, !tbaa !15
  %44 = tail call float @llvm.fmuladd.f32(float %42, float %43, float %acc284.1772)
  %inc303 = add nuw nsw i32 %n291.0773, 1
  %exitcond848.not = icmp eq i32 %inc303, %8
  br i1 %exitcond848.not, label %for.cond.cleanup294, label %for.body295, !llvm.loop !40

for.cond326.preheader:                            ; preds = %for.cond326.preheader.lr.ph, %for.cond.cleanup328
  %indvars.iv851 = phi i32 [ %sub, %for.cond326.preheader.lr.ph ], [ %indvars.iv.next852, %for.cond.cleanup328 ]
  %x317.0801 = phi i32 [ %sub15, %for.cond326.preheader.lr.ph ], [ %inc355, %for.cond.cleanup328 ]
  %i_pos_y233.2800 = phi i32 [ %i_pos_y233.1.lcssa, %for.cond326.preheader.lr.ph ], [ %add350, %for.cond.cleanup328 ]
  br i1 %cmp327791, label %for.cond331.preheader.lr.ph, label %for.cond.cleanup328

for.cond331.preheader.lr.ph:                      ; preds = %for.cond326.preheader
  %cmp333787 = icmp sgt i32 %sub20, %x317.0801
  br label %for.cond331.preheader

for.cond.cleanup320:                              ; preds = %for.cond.cleanup328, %for.cond318.preheader
  %add357 = add nsw i32 %i_pos.2804, %mul
  %inc359 = add nsw i32 %y228.0803, 1
  %indvars.iv.next845 = add i32 %indvars.iv844, -1
  %exitcond856.not = icmp eq i32 %inc359, %4
  br i1 %exitcond856.not, label %for.cond362.preheader, label %for.body232, !llvm.loop !41

for.cond331.preheader:                            ; preds = %for.cond331.preheader.lr.ph, %for.cond.cleanup334
  %m325.0795 = phi i32 [ 0, %for.cond331.preheader.lr.ph ], [ %inc348, %for.cond.cleanup334 ]
  %f_data324.0794 = phi ptr [ %15, %for.cond331.preheader.lr.ph ], [ %add.ptr345, %for.cond.cleanup334 ]
  %acc323.0793 = phi float [ 0.000000e+00, %for.cond331.preheader.lr.ph ], [ %acc323.1.lcssa, %for.cond.cleanup334 ]
  %i_pos_x322.0792 = phi i32 [ %i_pos_y233.2800, %for.cond331.preheader.lr.ph ], [ %add346, %for.cond.cleanup334 ]
  br i1 %cmp333787, label %for.body335.lr.ph, label %for.cond.cleanup334

for.body335.lr.ph:                                ; preds = %for.cond331.preheader
  %45 = getelementptr float, ptr %13, i32 %i_pos_x322.0792
  br label %for.body335

for.cond.cleanup328:                              ; preds = %for.cond.cleanup334, %for.cond326.preheader
  %acc323.0.lcssa = phi float [ 0.000000e+00, %for.cond326.preheader ], [ %acc323.1.lcssa, %for.cond.cleanup334 ]
  %add350 = add nsw i32 %i_pos_y233.2800, %0
  %mul351 = mul nsw i32 %x317.0801, %10
  %gep798 = getelementptr float, ptr %invariant.gep765, i32 %mul351
  store float %acc323.0.lcssa, ptr %gep798, align 4, !tbaa !15
  %inc355 = add nsw i32 %x317.0801, 1
  %indvars.iv.next852 = add i32 %indvars.iv851, -1
  %exitcond855.not = icmp eq i32 %inc355, %3
  br i1 %exitcond855.not, label %for.cond.cleanup320, label %for.cond326.preheader, !llvm.loop !42

for.cond.cleanup334:                              ; preds = %for.body335, %for.cond331.preheader
  %acc323.1.lcssa = phi float [ %acc323.0793, %for.cond331.preheader ], [ %48, %for.body335 ]
  %add.ptr345 = getelementptr inbounds float, ptr %f_data324.0794, i32 %mul13
  %add346 = add nsw i32 %i_pos_x322.0792, %mul
  %inc348 = add nuw nsw i32 %m325.0795, 1
  %exitcond854.not = icmp eq i32 %inc348, %indvars.iv844
  br i1 %exitcond854.not, label %for.cond.cleanup328, label %for.cond331.preheader, !llvm.loop !43

for.body335:                                      ; preds = %for.body335.lr.ph, %for.body335
  %n330.0789 = phi i32 [ 0, %for.body335.lr.ph ], [ %inc343, %for.body335 ]
  %acc323.1788 = phi float [ %acc323.0793, %for.body335.lr.ph ], [ %48, %for.body335 ]
  %mul336 = mul nsw i32 %n330.0789, %0
  %arrayidx338 = getelementptr float, ptr %45, i32 %mul336
  %46 = load float, ptr %arrayidx338, align 4, !tbaa !15
  %mul339 = mul nsw i32 %n330.0789, %5
  %arrayidx340 = getelementptr inbounds float, ptr %f_data324.0794, i32 %mul339
  %47 = load float, ptr %arrayidx340, align 4, !tbaa !15
  %48 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %acc323.1788)
  %inc343 = add nuw nsw i32 %n330.0789, 1
  %exitcond853.not = icmp eq i32 %inc343, %indvars.iv851
  br i1 %exitcond853.not, label %for.cond.cleanup334, label %for.body335, !llvm.loop !44

for.cond.cleanup364:                              ; preds = %for.cond.cleanup372, %for.cond362.preheader
  ret i32 0

for.body365:                                      ; preds = %for.body365.lr.ph, %for.cond.cleanup372
  %i_pos.3822 = phi i32 [ 0, %for.body365.lr.ph ], [ %add408, %for.cond.cleanup372 ]
  %y361.0821 = phi i32 [ %shr12, %for.body365.lr.ph ], [ %inc410, %for.cond.cleanup372 ]
  %mul368 = mul nsw i32 %y361.0821, %mul14
  %invariant.gep815 = getelementptr float, ptr %14, i32 %mul368
  br i1 %cmp371817, label %for.cond378.preheader, label %for.cond.cleanup372

for.cond378.preheader:                            ; preds = %for.body365, %for.cond.cleanup380
  %x369.0819 = phi i32 [ %inc406, %for.cond.cleanup380 ], [ %shr, %for.body365 ]
  %i_pos_y366.0818 = phi i32 [ %add401, %for.cond.cleanup380 ], [ %i_pos.3822, %for.body365 ]
  br i1 %cmp379809, label %for.cond383.preheader, label %for.cond.cleanup380

for.cond.cleanup372:                              ; preds = %for.cond.cleanup380, %for.body365
  %add408 = add nsw i32 %i_pos.3822, %mul
  %inc410 = add nsw i32 %y361.0821, 1
  %exitcond860.not = icmp eq i32 %inc410, %sub17
  br i1 %exitcond860.not, label %for.cond.cleanup364, label %for.body365, !llvm.loop !45

for.cond383.preheader:                            ; preds = %for.cond378.preheader, %for.cond.cleanup385
  %m377.0813 = phi i32 [ %inc399, %for.cond.cleanup385 ], [ 0, %for.cond378.preheader ]
  %f_data376.0812 = phi ptr [ %add.ptr396, %for.cond.cleanup385 ], [ %15, %for.cond378.preheader ]
  %acc375.0811 = phi float [ %acc375.1.lcssa, %for.cond.cleanup385 ], [ 0.000000e+00, %for.cond378.preheader ]
  %i_pos_x374.0810 = phi i32 [ %add397, %for.cond.cleanup385 ], [ %i_pos_y366.0818, %for.cond378.preheader ]
  br i1 %cmp384805, label %for.body386.lr.ph, label %for.cond.cleanup385

for.body386.lr.ph:                                ; preds = %for.cond383.preheader
  %49 = getelementptr float, ptr %13, i32 %i_pos_x374.0810
  br label %for.body386

for.cond.cleanup380:                              ; preds = %for.cond.cleanup385, %for.cond378.preheader
  %acc375.0.lcssa = phi float [ 0.000000e+00, %for.cond378.preheader ], [ %acc375.1.lcssa, %for.cond.cleanup385 ]
  %add401 = add nsw i32 %i_pos_y366.0818, %0
  %mul402 = mul nsw i32 %x369.0819, %10
  %gep816 = getelementptr float, ptr %invariant.gep815, i32 %mul402
  store float %acc375.0.lcssa, ptr %gep816, align 4, !tbaa !15
  %inc406 = add nsw i32 %x369.0819, 1
  %exitcond859.not = icmp eq i32 %inc406, %sub15
  br i1 %exitcond859.not, label %for.cond.cleanup372, label %for.cond378.preheader, !llvm.loop !46

for.cond.cleanup385:                              ; preds = %for.body386, %for.cond383.preheader
  %acc375.1.lcssa = phi float [ %acc375.0811, %for.cond383.preheader ], [ %52, %for.body386 ]
  %add.ptr396 = getelementptr inbounds float, ptr %f_data376.0812, i32 %mul13
  %add397 = add nsw i32 %i_pos_x374.0810, %mul
  %inc399 = add nuw nsw i32 %m377.0813, 1
  %exitcond858.not = icmp eq i32 %inc399, %9
  br i1 %exitcond858.not, label %for.cond.cleanup380, label %for.cond383.preheader, !llvm.loop !47

for.body386:                                      ; preds = %for.body386.lr.ph, %for.body386
  %n382.0807 = phi i32 [ 0, %for.body386.lr.ph ], [ %inc394, %for.body386 ]
  %acc375.1806 = phi float [ %acc375.0811, %for.body386.lr.ph ], [ %52, %for.body386 ]
  %mul387 = mul nsw i32 %n382.0807, %0
  %arrayidx389 = getelementptr float, ptr %49, i32 %mul387
  %50 = load float, ptr %arrayidx389, align 4, !tbaa !15
  %mul390 = mul nsw i32 %n382.0807, %5
  %arrayidx391 = getelementptr inbounds float, ptr %f_data376.0812, i32 %mul390
  %51 = load float, ptr %arrayidx391, align 4, !tbaa !15
  %52 = tail call float @llvm.fmuladd.f32(float %50, float %51, float %acc375.1806)
  %inc394 = add nuw nsw i32 %n382.0807, 1
  %exitcond857.not = icmp eq i32 %inc394, %8
  br i1 %exitcond857.not, label %for.cond.cleanup385, label %for.body386, !llvm.loop !48
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"}
!4 = !{!5, !9, i64 4}
!5 = !{!"image2d_s", !6, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!5, !9, i64 8}
!11 = !{!5, !9, i64 12}
!12 = !{!5, !9, i64 20}
!13 = !{!5, !9, i64 24}
!14 = !{!5, !6, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !7, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = distinct !{!19, !18}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = distinct !{!22, !18}
!23 = distinct !{!23, !18}
!24 = distinct !{!24, !18}
!25 = distinct !{!25, !18}
!26 = distinct !{!26, !18}
!27 = distinct !{!27, !18}
!28 = distinct !{!28, !18}
!29 = distinct !{!29, !18}
!30 = distinct !{!30, !18}
!31 = distinct !{!31, !18}
!32 = distinct !{!32, !18}
!33 = distinct !{!33, !18}
!34 = distinct !{!34, !18}
!35 = distinct !{!35, !18}
!36 = distinct !{!36, !18}
!37 = distinct !{!37, !18}
!38 = distinct !{!38, !18}
!39 = distinct !{!39, !18}
!40 = distinct !{!40, !18}
!41 = distinct !{!41, !18}
!42 = distinct !{!42, !18}
!43 = distinct !{!43, !18}
!44 = distinct !{!44, !18}
!45 = distinct !{!45, !18}
!46 = distinct !{!46, !18}
!47 = distinct !{!47, !18}
!48 = distinct !{!48, !18}
