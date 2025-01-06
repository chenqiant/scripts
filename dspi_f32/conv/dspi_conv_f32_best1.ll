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
  %cmp854 = icmp sgt i32 %shr12, 0
  br i1 %cmp854, label %for.body.lr.ph, label %for.cond201.preheader

for.body.lr.ph:                                   ; preds = %entry
  %cmp25819 = icmp sgt i32 %shr, 0
  %sub34 = add nsw i32 %8, -7
  %mul48 = shl nsw i32 %0, 1
  %mul55 = mul nsw i32 %0, 3
  %mul62 = shl nsw i32 %0, 2
  %mul69 = mul nsw i32 %0, 5
  %mul76 = mul nsw i32 %0, 6
  %mul83 = mul nsw i32 %0, 7
  %cmp119835 = icmp slt i32 %shr, %sub15
  %cmp132823 = icmp sgt i32 %8, 0
  %cmp158851.not = icmp sgt i32 %sub15, %3
  br label %for.body

for.cond201.preheader:                            ; preds = %for.cond.cleanup159, %entry
  %cmp202888 = icmp slt i32 %shr12, %sub17
  br i1 %cmp202888, label %for.body204.lr.ph, label %for.cond293.preheader

for.body204.lr.ph:                                ; preds = %for.cond201.preheader
  %cmp210869 = icmp sgt i32 %shr, 0
  %cmp219861 = icmp sgt i32 %9, 0
  %cmp250885.not = icmp sgt i32 %sub15, %3
  br label %for.body204

for.body:                                         ; preds = %for.body.lr.ph, %for.cond.cleanup159
  %i_pos.0856 = phi i32 [ 0, %for.body.lr.ph ], [ %add196, %for.cond.cleanup159 ]
  %y.0855 = phi i32 [ 0, %for.body.lr.ph ], [ %inc198, %for.cond.cleanup159 ]
  %sub22 = sub nsw i32 %shr12, %y.0855
  %mul23 = mul nsw i32 %y.0855, %mul14
  %invariant.gep = getelementptr float, ptr %14, i32 %mul23
  br i1 %cmp25819, label %for.body27.lr.ph, label %for.cond118.preheader

for.body27.lr.ph:                                 ; preds = %for.body
  %cmp30813 = icmp slt i32 %sub22, %9
  br label %for.body27

for.cond118.preheader:                            ; preds = %for.cond.cleanup31, %for.body
  %i_pos_y.0.lcssa = phi i32 [ %i_pos.0856, %for.body ], [ %add110, %for.cond.cleanup31 ]
  br i1 %cmp119835, label %for.cond126.preheader.lr.ph, label %for.cond157.preheader

for.cond126.preheader.lr.ph:                      ; preds = %for.cond118.preheader
  %cmp127827 = icmp slt i32 %sub22, %9
  br label %for.cond126.preheader

for.body27:                                       ; preds = %for.body27.lr.ph, %for.cond.cleanup31
  %i_pos_y.0821 = phi i32 [ %i_pos.0856, %for.body27.lr.ph ], [ %add110, %for.cond.cleanup31 ]
  %x.0820 = phi i32 [ 0, %for.body27.lr.ph ], [ %inc115, %for.cond.cleanup31 ]
  %sub28 = sub nsw i32 %shr, %x.0820
  br i1 %cmp30813, label %for.cond33.preheader.lr.ph, label %for.cond.cleanup31

for.cond33.preheader.lr.ph:                       ; preds = %for.body27
  %cmp35806 = icmp slt i32 %sub28, %sub34
  %sub92 = sub nsw i32 %8, %sub28
  %rem = srem i32 %sub92, 8
  %sub93 = sub nsw i32 %8, %rem
  %cmp95809 = icmp sgt i32 %rem, 0
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.lr.ph, %for.cond.cleanup96
  %i_pos_x.0817 = phi i32 [ %i_pos_y.0821, %for.cond33.preheader.lr.ph ], [ %add106, %for.cond.cleanup96 ]
  %acc.0816 = phi float [ 0.000000e+00, %for.cond33.preheader.lr.ph ], [ %acc.2.lcssa, %for.cond.cleanup96 ]
  %f_data.0815 = phi ptr [ %15, %for.cond33.preheader.lr.ph ], [ %add.ptr, %for.cond.cleanup96 ]
  %m.0814 = phi i32 [ %sub22, %for.cond33.preheader.lr.ph ], [ %inc108, %for.cond.cleanup96 ]
  br i1 %cmp35806, label %for.body37.lr.ph, label %for.cond.cleanup36

for.body37.lr.ph:                                 ; preds = %for.cond33.preheader
  %16 = getelementptr float, ptr %13, i32 %i_pos_x.0817
  br label %for.body37

for.cond.cleanup31:                               ; preds = %for.cond.cleanup96, %for.body27
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.body27 ], [ %acc.2.lcssa, %for.cond.cleanup96 ]
  %add110 = add nsw i32 %i_pos_y.0821, %0
  %mul111 = mul nsw i32 %x.0820, %10
  %gep = getelementptr float, ptr %invariant.gep, i32 %mul111
  store float %acc.0.lcssa, ptr %gep, align 4, !tbaa !15
  %inc115 = add nuw nsw i32 %x.0820, 1
  %exitcond.not = icmp eq i32 %inc115, %shr
  br i1 %exitcond.not, label %for.cond118.preheader, label %for.body27, !llvm.loop !17

for.cond.cleanup36:                               ; preds = %for.body37, %for.cond33.preheader
  %acc.1.lcssa = phi float [ %acc.0816, %for.cond33.preheader ], [ %41, %for.body37 ]
  br i1 %cmp95809, label %for.body97.lr.ph, label %for.cond.cleanup96

for.body97.lr.ph:                                 ; preds = %for.cond.cleanup36
  %17 = getelementptr float, ptr %13, i32 %i_pos_x.0817
  br label %for.body97

for.body37:                                       ; preds = %for.body37.lr.ph, %for.body37
  %acc.1808 = phi float [ %acc.0816, %for.body37.lr.ph ], [ %41, %for.body37 ]
  %n.0807 = phi i32 [ %sub28, %for.body37.lr.ph ], [ %add90, %for.body37 ]
  %mul38 = mul nsw i32 %n.0807, %0
  %mul40 = mul nsw i32 %n.0807, %5
  %arrayidx = getelementptr float, ptr %16, i32 %mul38
  %18 = load float, ptr %arrayidx, align 4, !tbaa !15
  %arrayidx41 = getelementptr inbounds float, ptr %f_data.0815, i32 %mul40
  %19 = load float, ptr %arrayidx41, align 4, !tbaa !15
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %acc.1808)
  %arrayidx44 = getelementptr float, ptr %arrayidx, i32 %0
  %21 = load float, ptr %arrayidx44, align 4, !tbaa !15
  %add45 = add nsw i32 %mul40, %5
  %arrayidx46 = getelementptr inbounds float, ptr %f_data.0815, i32 %add45
  %22 = load float, ptr %arrayidx46, align 4, !tbaa !15
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %20)
  %arrayidx50 = getelementptr float, ptr %arrayidx, i32 %mul48
  %24 = load float, ptr %arrayidx50, align 4, !tbaa !15
  %mul51800 = add nsw i32 %n.0807, 2
  %add52 = mul i32 %mul51800, %5
  %arrayidx53 = getelementptr inbounds float, ptr %f_data.0815, i32 %add52
  %25 = load float, ptr %arrayidx53, align 4, !tbaa !15
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %23)
  %arrayidx57 = getelementptr float, ptr %arrayidx, i32 %mul55
  %27 = load float, ptr %arrayidx57, align 4, !tbaa !15
  %mul58801 = add nsw i32 %n.0807, 3
  %add59 = mul i32 %mul58801, %5
  %arrayidx60 = getelementptr inbounds float, ptr %f_data.0815, i32 %add59
  %28 = load float, ptr %arrayidx60, align 4, !tbaa !15
  %29 = tail call float @llvm.fmuladd.f32(float %27, float %28, float %26)
  %arrayidx64 = getelementptr float, ptr %arrayidx, i32 %mul62
  %30 = load float, ptr %arrayidx64, align 4, !tbaa !15
  %mul65802 = add nsw i32 %n.0807, 4
  %add66 = mul i32 %mul65802, %5
  %arrayidx67 = getelementptr inbounds float, ptr %f_data.0815, i32 %add66
  %31 = load float, ptr %arrayidx67, align 4, !tbaa !15
  %32 = tail call float @llvm.fmuladd.f32(float %30, float %31, float %29)
  %arrayidx71 = getelementptr float, ptr %arrayidx, i32 %mul69
  %33 = load float, ptr %arrayidx71, align 4, !tbaa !15
  %mul72803 = add nsw i32 %n.0807, 5
  %add73 = mul i32 %mul72803, %5
  %arrayidx74 = getelementptr inbounds float, ptr %f_data.0815, i32 %add73
  %34 = load float, ptr %arrayidx74, align 4, !tbaa !15
  %35 = tail call float @llvm.fmuladd.f32(float %33, float %34, float %32)
  %arrayidx78 = getelementptr float, ptr %arrayidx, i32 %mul76
  %36 = load float, ptr %arrayidx78, align 4, !tbaa !15
  %mul79804 = add nsw i32 %n.0807, 6
  %add80 = mul i32 %mul79804, %5
  %arrayidx81 = getelementptr inbounds float, ptr %f_data.0815, i32 %add80
  %37 = load float, ptr %arrayidx81, align 4, !tbaa !15
  %38 = tail call float @llvm.fmuladd.f32(float %36, float %37, float %35)
  %arrayidx85 = getelementptr float, ptr %arrayidx, i32 %mul83
  %39 = load float, ptr %arrayidx85, align 4, !tbaa !15
  %mul86805 = add nsw i32 %n.0807, 7
  %add87 = mul i32 %mul86805, %5
  %arrayidx88 = getelementptr inbounds float, ptr %f_data.0815, i32 %add87
  %40 = load float, ptr %arrayidx88, align 4, !tbaa !15
  %41 = tail call float @llvm.fmuladd.f32(float %39, float %40, float %38)
  %add90 = add nsw i32 %n.0807, 8
  %cmp35 = icmp slt i32 %add90, %sub34
  br i1 %cmp35, label %for.body37, label %for.cond.cleanup36, !llvm.loop !19

for.cond.cleanup96:                               ; preds = %for.body97, %for.cond.cleanup36
  %acc.2.lcssa = phi float [ %acc.1.lcssa, %for.cond.cleanup36 ], [ %44, %for.body97 ]
  %add.ptr = getelementptr inbounds float, ptr %f_data.0815, i32 %mul13
  %add106 = add nsw i32 %i_pos_x.0817, %mul
  %inc108 = add nsw i32 %m.0814, 1
  %cmp30 = icmp slt i32 %inc108, %9
  br i1 %cmp30, label %for.cond33.preheader, label %for.cond.cleanup31, !llvm.loop !20

for.body97:                                       ; preds = %for.body97.lr.ph, %for.body97
  %acc.2811 = phi float [ %acc.1.lcssa, %for.body97.lr.ph ], [ %44, %for.body97 ]
  %n91.0810 = phi i32 [ %sub93, %for.body97.lr.ph ], [ %inc, %for.body97 ]
  %mul98 = mul nsw i32 %n91.0810, %0
  %arrayidx100 = getelementptr float, ptr %17, i32 %mul98
  %42 = load float, ptr %arrayidx100, align 4, !tbaa !15
  %mul101 = mul nsw i32 %n91.0810, %5
  %arrayidx102 = getelementptr inbounds float, ptr %f_data.0815, i32 %mul101
  %43 = load float, ptr %arrayidx102, align 4, !tbaa !15
  %44 = tail call float @llvm.fmuladd.f32(float %42, float %43, float %acc.2811)
  %inc = add nsw i32 %n91.0810, 1
  %cmp95 = icmp slt i32 %inc, %8
  br i1 %cmp95, label %for.body97, label %for.cond.cleanup96, !llvm.loop !21

for.cond157.preheader:                            ; preds = %for.cond.cleanup128, %for.cond118.preheader
  %i_pos_y.1.lcssa = phi i32 [ %i_pos_y.0.lcssa, %for.cond118.preheader ], [ %add149, %for.cond.cleanup128 ]
  br i1 %cmp158851.not, label %for.cond.cleanup159, label %for.body160.lr.ph

for.body160.lr.ph:                                ; preds = %for.cond157.preheader
  %cmp167843 = icmp slt i32 %sub22, %9
  br label %for.body160

for.cond126.preheader:                            ; preds = %for.cond126.preheader.lr.ph, %for.cond.cleanup128
  %i_pos_y.1837 = phi i32 [ %i_pos_y.0.lcssa, %for.cond126.preheader.lr.ph ], [ %add149, %for.cond.cleanup128 ]
  %x117.0836 = phi i32 [ %shr, %for.cond126.preheader.lr.ph ], [ %inc154, %for.cond.cleanup128 ]
  br i1 %cmp127827, label %for.cond131.preheader, label %for.cond.cleanup128

for.cond131.preheader:                            ; preds = %for.cond126.preheader, %for.cond.cleanup133
  %m125.0831 = phi i32 [ %inc147, %for.cond.cleanup133 ], [ %sub22, %for.cond126.preheader ]
  %f_data124.0830 = phi ptr [ %add.ptr144, %for.cond.cleanup133 ], [ %15, %for.cond126.preheader ]
  %acc123.0829 = phi float [ %acc123.1.lcssa, %for.cond.cleanup133 ], [ 0.000000e+00, %for.cond126.preheader ]
  %i_pos_x122.0828 = phi i32 [ %add145, %for.cond.cleanup133 ], [ %i_pos_y.1837, %for.cond126.preheader ]
  br i1 %cmp132823, label %for.body134.lr.ph, label %for.cond.cleanup133

for.body134.lr.ph:                                ; preds = %for.cond131.preheader
  %45 = getelementptr float, ptr %13, i32 %i_pos_x122.0828
  br label %for.body134

for.cond.cleanup128:                              ; preds = %for.cond.cleanup133, %for.cond126.preheader
  %acc123.0.lcssa = phi float [ 0.000000e+00, %for.cond126.preheader ], [ %acc123.1.lcssa, %for.cond.cleanup133 ]
  %add149 = add nsw i32 %i_pos_y.1837, %0
  %mul150 = mul nsw i32 %x117.0836, %10
  %gep834 = getelementptr float, ptr %invariant.gep, i32 %mul150
  store float %acc123.0.lcssa, ptr %gep834, align 4, !tbaa !15
  %inc154 = add nsw i32 %x117.0836, 1
  %exitcond969.not = icmp eq i32 %inc154, %sub15
  br i1 %exitcond969.not, label %for.cond157.preheader, label %for.cond126.preheader, !llvm.loop !22

for.cond.cleanup133:                              ; preds = %for.body134, %for.cond131.preheader
  %acc123.1.lcssa = phi float [ %acc123.0829, %for.cond131.preheader ], [ %48, %for.body134 ]
  %add.ptr144 = getelementptr inbounds float, ptr %f_data124.0830, i32 %mul13
  %add145 = add nsw i32 %i_pos_x122.0828, %mul
  %inc147 = add nsw i32 %m125.0831, 1
  %cmp127 = icmp slt i32 %inc147, %9
  br i1 %cmp127, label %for.cond131.preheader, label %for.cond.cleanup128, !llvm.loop !23

for.body134:                                      ; preds = %for.body134.lr.ph, %for.body134
  %n130.0825 = phi i32 [ 0, %for.body134.lr.ph ], [ %inc142, %for.body134 ]
  %acc123.1824 = phi float [ %acc123.0829, %for.body134.lr.ph ], [ %48, %for.body134 ]
  %mul135 = mul nsw i32 %n130.0825, %0
  %arrayidx137 = getelementptr float, ptr %45, i32 %mul135
  %46 = load float, ptr %arrayidx137, align 4, !tbaa !15
  %mul138 = mul nsw i32 %n130.0825, %5
  %arrayidx139 = getelementptr inbounds float, ptr %f_data124.0830, i32 %mul138
  %47 = load float, ptr %arrayidx139, align 4, !tbaa !15
  %48 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %acc123.1824)
  %inc142 = add nuw nsw i32 %n130.0825, 1
  %exitcond968.not = icmp eq i32 %inc142, %8
  br i1 %exitcond968.not, label %for.cond.cleanup133, label %for.body134, !llvm.loop !24

for.cond.cleanup159:                              ; preds = %for.cond.cleanup168, %for.cond157.preheader
  %add196 = add nsw i32 %i_pos.0856, %mul
  %inc198 = add nuw nsw i32 %y.0855, 1
  %exitcond972.not = icmp eq i32 %inc198, %shr12
  br i1 %exitcond972.not, label %for.cond201.preheader, label %for.body, !llvm.loop !25

for.body160:                                      ; preds = %for.body160.lr.ph, %for.cond.cleanup168
  %indvars.iv = phi i32 [ %8, %for.body160.lr.ph ], [ %indvars.iv.next, %for.cond.cleanup168 ]
  %i_pos_y.2853 = phi i32 [ %i_pos_y.1.lcssa, %for.body160.lr.ph ], [ %add189, %for.cond.cleanup168 ]
  %x156.0852 = phi i32 [ %sub21, %for.body160.lr.ph ], [ %inc194, %for.cond.cleanup168 ]
  br i1 %cmp167843, label %for.cond171.preheader.lr.ph, label %for.cond.cleanup168

for.cond171.preheader.lr.ph:                      ; preds = %for.body160
  %cmp172839 = icmp sgt i32 %sub20, %x156.0852
  br label %for.cond171.preheader

for.cond171.preheader:                            ; preds = %for.cond171.preheader.lr.ph, %for.cond.cleanup173
  %m165.0847 = phi i32 [ %sub22, %for.cond171.preheader.lr.ph ], [ %inc187, %for.cond.cleanup173 ]
  %f_data163.0846 = phi ptr [ %15, %for.cond171.preheader.lr.ph ], [ %add.ptr184, %for.cond.cleanup173 ]
  %acc162.0845 = phi float [ 0.000000e+00, %for.cond171.preheader.lr.ph ], [ %acc162.1.lcssa, %for.cond.cleanup173 ]
  %i_pos_x161.0844 = phi i32 [ %i_pos_y.2853, %for.cond171.preheader.lr.ph ], [ %add185, %for.cond.cleanup173 ]
  br i1 %cmp172839, label %for.body174.lr.ph, label %for.cond.cleanup173

for.body174.lr.ph:                                ; preds = %for.cond171.preheader
  %49 = getelementptr float, ptr %13, i32 %i_pos_x161.0844
  br label %for.body174

for.cond.cleanup168:                              ; preds = %for.cond.cleanup173, %for.body160
  %acc162.0.lcssa = phi float [ 0.000000e+00, %for.body160 ], [ %acc162.1.lcssa, %for.cond.cleanup173 ]
  %add189 = add nsw i32 %i_pos_y.2853, %0
  %mul190 = mul nsw i32 %x156.0852, %10
  %gep850 = getelementptr float, ptr %invariant.gep, i32 %mul190
  store float %acc162.0.lcssa, ptr %gep850, align 4, !tbaa !15
  %inc194 = add nsw i32 %x156.0852, 1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %exitcond971.not = icmp eq i32 %inc194, %3
  br i1 %exitcond971.not, label %for.cond.cleanup159, label %for.body160, !llvm.loop !26

for.cond.cleanup173:                              ; preds = %for.body174, %for.cond171.preheader
  %acc162.1.lcssa = phi float [ %acc162.0845, %for.cond171.preheader ], [ %52, %for.body174 ]
  %add.ptr184 = getelementptr inbounds float, ptr %f_data163.0846, i32 %mul13
  %add185 = add nsw i32 %i_pos_x161.0844, %mul
  %inc187 = add nsw i32 %m165.0847, 1
  %cmp167 = icmp slt i32 %inc187, %9
  br i1 %cmp167, label %for.cond171.preheader, label %for.cond.cleanup168, !llvm.loop !27

for.body174:                                      ; preds = %for.body174.lr.ph, %for.body174
  %n170.0841 = phi i32 [ 0, %for.body174.lr.ph ], [ %inc182, %for.body174 ]
  %acc162.1840 = phi float [ %acc162.0845, %for.body174.lr.ph ], [ %52, %for.body174 ]
  %mul175 = mul nsw i32 %n170.0841, %0
  %arrayidx177 = getelementptr float, ptr %49, i32 %mul175
  %50 = load float, ptr %arrayidx177, align 4, !tbaa !15
  %mul178 = mul nsw i32 %n170.0841, %5
  %arrayidx179 = getelementptr inbounds float, ptr %f_data163.0846, i32 %mul178
  %51 = load float, ptr %arrayidx179, align 4, !tbaa !15
  %52 = tail call float @llvm.fmuladd.f32(float %50, float %51, float %acc162.1840)
  %inc182 = add nuw nsw i32 %n170.0841, 1
  %exitcond970.not = icmp eq i32 %inc182, %indvars.iv
  br i1 %exitcond970.not, label %for.cond.cleanup173, label %for.body174, !llvm.loop !28

for.cond293.preheader:                            ; preds = %for.cond.cleanup251, %for.cond201.preheader
  %cmp294938 = icmp slt i32 %sub17, %4
  br i1 %cmp294938, label %for.body296.lr.ph, label %for.cond426.preheader

for.body296.lr.ph:                                ; preds = %for.cond293.preheader
  %cmp303903 = icmp sgt i32 %shr, 0
  %cmp344919 = icmp slt i32 %shr, %sub15
  %cmp357907 = icmp sgt i32 %8, 0
  %cmp383935 = icmp slt i32 %sub15, %3
  br label %for.body296

for.body204:                                      ; preds = %for.body204.lr.ph, %for.cond.cleanup251
  %i_pos.1890 = phi i32 [ 0, %for.body204.lr.ph ], [ %add288, %for.cond.cleanup251 ]
  %y200.0889 = phi i32 [ %shr12, %for.body204.lr.ph ], [ %inc290, %for.cond.cleanup251 ]
  %mul207 = mul nsw i32 %y200.0889, %mul14
  %invariant.gep867 = getelementptr float, ptr %14, i32 %mul207
  br i1 %cmp210869, label %for.body212, label %for.cond249.preheader

for.cond249.preheader:                            ; preds = %for.cond.cleanup220, %for.body204
  %i_pos_y205.0.lcssa = phi i32 [ %i_pos.1890, %for.body204 ], [ %add241, %for.cond.cleanup220 ]
  br i1 %cmp250885.not, label %for.cond.cleanup251, label %for.body252

for.body212:                                      ; preds = %for.body204, %for.cond.cleanup220
  %x208.0871 = phi i32 [ %inc246, %for.cond.cleanup220 ], [ 0, %for.body204 ]
  %i_pos_y205.0870 = phi i32 [ %add241, %for.cond.cleanup220 ], [ %i_pos.1890, %for.body204 ]
  %sub215 = sub nsw i32 %shr, %x208.0871
  br i1 %cmp219861, label %for.cond223.preheader.lr.ph, label %for.cond.cleanup220

for.cond223.preheader.lr.ph:                      ; preds = %for.body212
  %cmp224857 = icmp slt i32 %sub215, %8
  br label %for.cond223.preheader

for.cond223.preheader:                            ; preds = %for.cond223.preheader.lr.ph, %for.cond.cleanup225
  %m217.0865 = phi i32 [ 0, %for.cond223.preheader.lr.ph ], [ %inc239, %for.cond.cleanup225 ]
  %f_data216.0864 = phi ptr [ %15, %for.cond223.preheader.lr.ph ], [ %add.ptr236, %for.cond.cleanup225 ]
  %acc214.0863 = phi float [ 0.000000e+00, %for.cond223.preheader.lr.ph ], [ %acc214.1.lcssa, %for.cond.cleanup225 ]
  %i_pos_x213.0862 = phi i32 [ %i_pos_y205.0870, %for.cond223.preheader.lr.ph ], [ %add237, %for.cond.cleanup225 ]
  br i1 %cmp224857, label %for.body226.lr.ph, label %for.cond.cleanup225

for.body226.lr.ph:                                ; preds = %for.cond223.preheader
  %53 = getelementptr float, ptr %13, i32 %i_pos_x213.0862
  br label %for.body226

for.cond.cleanup220:                              ; preds = %for.cond.cleanup225, %for.body212
  %acc214.0.lcssa = phi float [ 0.000000e+00, %for.body212 ], [ %acc214.1.lcssa, %for.cond.cleanup225 ]
  %add241 = add nsw i32 %i_pos_y205.0870, %0
  %mul242 = mul nsw i32 %x208.0871, %10
  %gep868 = getelementptr float, ptr %invariant.gep867, i32 %mul242
  store float %acc214.0.lcssa, ptr %gep868, align 4, !tbaa !15
  %inc246 = add nuw nsw i32 %x208.0871, 1
  %exitcond974.not = icmp eq i32 %inc246, %shr
  br i1 %exitcond974.not, label %for.cond249.preheader, label %for.body212, !llvm.loop !29

for.cond.cleanup225:                              ; preds = %for.body226, %for.cond223.preheader
  %acc214.1.lcssa = phi float [ %acc214.0863, %for.cond223.preheader ], [ %56, %for.body226 ]
  %add.ptr236 = getelementptr inbounds float, ptr %f_data216.0864, i32 %mul13
  %add237 = add nsw i32 %i_pos_x213.0862, %mul
  %inc239 = add nuw nsw i32 %m217.0865, 1
  %exitcond973.not = icmp eq i32 %inc239, %9
  br i1 %exitcond973.not, label %for.cond.cleanup220, label %for.cond223.preheader, !llvm.loop !30

for.body226:                                      ; preds = %for.body226.lr.ph, %for.body226
  %n222.0859 = phi i32 [ %sub215, %for.body226.lr.ph ], [ %inc234, %for.body226 ]
  %acc214.1858 = phi float [ %acc214.0863, %for.body226.lr.ph ], [ %56, %for.body226 ]
  %mul227 = mul nsw i32 %n222.0859, %0
  %arrayidx229 = getelementptr float, ptr %53, i32 %mul227
  %54 = load float, ptr %arrayidx229, align 4, !tbaa !15
  %mul230 = mul nsw i32 %n222.0859, %5
  %arrayidx231 = getelementptr inbounds float, ptr %f_data216.0864, i32 %mul230
  %55 = load float, ptr %arrayidx231, align 4, !tbaa !15
  %56 = tail call float @llvm.fmuladd.f32(float %54, float %55, float %acc214.1858)
  %inc234 = add nsw i32 %n222.0859, 1
  %cmp224 = icmp slt i32 %inc234, %8
  br i1 %cmp224, label %for.body226, label %for.cond.cleanup225, !llvm.loop !31

for.cond.cleanup251:                              ; preds = %for.cond.cleanup260, %for.cond249.preheader
  %add288 = add nsw i32 %i_pos.1890, %mul
  %inc290 = add nsw i32 %y200.0889, 1
  %exitcond980.not = icmp eq i32 %inc290, %sub17
  br i1 %exitcond980.not, label %for.cond293.preheader, label %for.body204, !llvm.loop !32

for.body252:                                      ; preds = %for.cond249.preheader, %for.cond.cleanup260
  %indvars.iv975 = phi i32 [ %indvars.iv.next976, %for.cond.cleanup260 ], [ %8, %for.cond249.preheader ]
  %x248.0887 = phi i32 [ %inc286, %for.cond.cleanup260 ], [ %sub21, %for.cond249.preheader ]
  %i_pos_y205.1886 = phi i32 [ %add281, %for.cond.cleanup260 ], [ %i_pos_y205.0.lcssa, %for.cond249.preheader ]
  br i1 %cmp219861, label %for.cond263.preheader.lr.ph, label %for.cond.cleanup260

for.cond263.preheader.lr.ph:                      ; preds = %for.body252
  %cmp264873 = icmp sgt i32 %sub20, %x248.0887
  br label %for.cond263.preheader

for.cond263.preheader:                            ; preds = %for.cond263.preheader.lr.ph, %for.cond.cleanup265
  %m257.0881 = phi i32 [ 0, %for.cond263.preheader.lr.ph ], [ %inc279, %for.cond.cleanup265 ]
  %f_data255.0880 = phi ptr [ %15, %for.cond263.preheader.lr.ph ], [ %add.ptr276, %for.cond.cleanup265 ]
  %acc254.0879 = phi float [ 0.000000e+00, %for.cond263.preheader.lr.ph ], [ %acc254.1.lcssa, %for.cond.cleanup265 ]
  %i_pos_x253.0878 = phi i32 [ %i_pos_y205.1886, %for.cond263.preheader.lr.ph ], [ %add277, %for.cond.cleanup265 ]
  br i1 %cmp264873, label %for.body266.lr.ph, label %for.cond.cleanup265

for.body266.lr.ph:                                ; preds = %for.cond263.preheader
  %57 = getelementptr float, ptr %13, i32 %i_pos_x253.0878
  br label %for.body266

for.cond.cleanup260:                              ; preds = %for.cond.cleanup265, %for.body252
  %acc254.0.lcssa = phi float [ 0.000000e+00, %for.body252 ], [ %acc254.1.lcssa, %for.cond.cleanup265 ]
  %add281 = add nsw i32 %i_pos_y205.1886, %0
  %mul282 = mul nsw i32 %x248.0887, %10
  %gep884 = getelementptr float, ptr %invariant.gep867, i32 %mul282
  store float %acc254.0.lcssa, ptr %gep884, align 4, !tbaa !15
  %inc286 = add nsw i32 %x248.0887, 1
  %indvars.iv.next976 = add i32 %indvars.iv975, -1
  %exitcond979.not = icmp eq i32 %inc286, %3
  br i1 %exitcond979.not, label %for.cond.cleanup251, label %for.body252, !llvm.loop !33

for.cond.cleanup265:                              ; preds = %for.body266, %for.cond263.preheader
  %acc254.1.lcssa = phi float [ %acc254.0879, %for.cond263.preheader ], [ %60, %for.body266 ]
  %add.ptr276 = getelementptr inbounds float, ptr %f_data255.0880, i32 %mul13
  %add277 = add nsw i32 %i_pos_x253.0878, %mul
  %inc279 = add nuw nsw i32 %m257.0881, 1
  %exitcond978.not = icmp eq i32 %inc279, %9
  br i1 %exitcond978.not, label %for.cond.cleanup260, label %for.cond263.preheader, !llvm.loop !34

for.body266:                                      ; preds = %for.body266.lr.ph, %for.body266
  %n262.0875 = phi i32 [ 0, %for.body266.lr.ph ], [ %inc274, %for.body266 ]
  %acc254.1874 = phi float [ %acc254.0879, %for.body266.lr.ph ], [ %60, %for.body266 ]
  %mul267 = mul nsw i32 %n262.0875, %0
  %arrayidx269 = getelementptr float, ptr %57, i32 %mul267
  %58 = load float, ptr %arrayidx269, align 4, !tbaa !15
  %mul270 = mul nsw i32 %n262.0875, %5
  %arrayidx271 = getelementptr inbounds float, ptr %f_data255.0880, i32 %mul270
  %59 = load float, ptr %arrayidx271, align 4, !tbaa !15
  %60 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %acc254.1874)
  %inc274 = add nuw nsw i32 %n262.0875, 1
  %exitcond977.not = icmp eq i32 %inc274, %indvars.iv975
  br i1 %exitcond977.not, label %for.cond.cleanup265, label %for.body266, !llvm.loop !35

for.cond426.preheader:                            ; preds = %for.cond.cleanup384, %for.cond293.preheader
  br i1 %cmp202888, label %for.body429.lr.ph, label %for.cond.cleanup428

for.body429.lr.ph:                                ; preds = %for.cond426.preheader
  %cmp435953 = icmp slt i32 %shr, %sub15
  %cmp443945 = icmp sgt i32 %9, 0
  %cmp448941 = icmp sgt i32 %8, 0
  br label %for.body429

for.body296:                                      ; preds = %for.body296.lr.ph, %for.cond.cleanup384
  %indvars.iv981 = phi i32 [ %sub11, %for.body296.lr.ph ], [ %indvars.iv.next982, %for.cond.cleanup384 ]
  %i_pos.2940 = phi i32 [ 0, %for.body296.lr.ph ], [ %add421, %for.cond.cleanup384 ]
  %y292.0939 = phi i32 [ %sub17, %for.body296.lr.ph ], [ %inc423, %for.cond.cleanup384 ]
  %61 = xor i32 %y292.0939, -1
  %sub298 = add i32 %add, %61
  %mul300 = mul nsw i32 %y292.0939, %mul14
  %invariant.gep901 = getelementptr float, ptr %14, i32 %mul300
  br i1 %cmp303903, label %for.body305.lr.ph, label %for.cond343.preheader

for.body305.lr.ph:                                ; preds = %for.body296
  %cmp313895 = icmp sgt i32 %sub298, 0
  br label %for.body305

for.cond343.preheader:                            ; preds = %for.cond.cleanup314, %for.body296
  %i_pos_y297.0.lcssa = phi i32 [ %i_pos.2940, %for.body296 ], [ %add335, %for.cond.cleanup314 ]
  br i1 %cmp344919, label %for.cond351.preheader.lr.ph, label %for.cond382.preheader

for.cond351.preheader.lr.ph:                      ; preds = %for.cond343.preheader
  %cmp352911 = icmp sgt i32 %sub298, 0
  br label %for.cond351.preheader

for.body305:                                      ; preds = %for.body305.lr.ph, %for.cond.cleanup314
  %x301.0905 = phi i32 [ 0, %for.body305.lr.ph ], [ %inc340, %for.cond.cleanup314 ]
  %i_pos_y297.0904 = phi i32 [ %i_pos.2940, %for.body305.lr.ph ], [ %add335, %for.cond.cleanup314 ]
  %sub310 = sub nsw i32 %shr, %x301.0905
  br i1 %cmp313895, label %for.cond317.preheader.lr.ph, label %for.cond.cleanup314

for.cond317.preheader.lr.ph:                      ; preds = %for.body305
  %cmp318891 = icmp slt i32 %sub310, %8
  br label %for.cond317.preheader

for.cond317.preheader:                            ; preds = %for.cond317.preheader.lr.ph, %for.cond.cleanup319
  %m311.0899 = phi i32 [ 0, %for.cond317.preheader.lr.ph ], [ %inc333, %for.cond.cleanup319 ]
  %f_data308.0898 = phi ptr [ %15, %for.cond317.preheader.lr.ph ], [ %add.ptr330, %for.cond.cleanup319 ]
  %acc307.0897 = phi float [ 0.000000e+00, %for.cond317.preheader.lr.ph ], [ %acc307.1.lcssa, %for.cond.cleanup319 ]
  %i_pos_x306.0896 = phi i32 [ %i_pos_y297.0904, %for.cond317.preheader.lr.ph ], [ %add331, %for.cond.cleanup319 ]
  br i1 %cmp318891, label %for.body320.lr.ph, label %for.cond.cleanup319

for.body320.lr.ph:                                ; preds = %for.cond317.preheader
  %62 = getelementptr float, ptr %13, i32 %i_pos_x306.0896
  br label %for.body320

for.cond.cleanup314:                              ; preds = %for.cond.cleanup319, %for.body305
  %acc307.0.lcssa = phi float [ 0.000000e+00, %for.body305 ], [ %acc307.1.lcssa, %for.cond.cleanup319 ]
  %add335 = add nsw i32 %i_pos_y297.0904, %0
  %mul336 = mul nsw i32 %x301.0905, %10
  %gep902 = getelementptr float, ptr %invariant.gep901, i32 %mul336
  store float %acc307.0.lcssa, ptr %gep902, align 4, !tbaa !15
  %inc340 = add nuw nsw i32 %x301.0905, 1
  %exitcond984.not = icmp eq i32 %inc340, %shr
  br i1 %exitcond984.not, label %for.cond343.preheader, label %for.body305, !llvm.loop !36

for.cond.cleanup319:                              ; preds = %for.body320, %for.cond317.preheader
  %acc307.1.lcssa = phi float [ %acc307.0897, %for.cond317.preheader ], [ %65, %for.body320 ]
  %add.ptr330 = getelementptr inbounds float, ptr %f_data308.0898, i32 %mul13
  %add331 = add nsw i32 %i_pos_x306.0896, %mul
  %inc333 = add nuw nsw i32 %m311.0899, 1
  %exitcond983.not = icmp eq i32 %inc333, %indvars.iv981
  br i1 %exitcond983.not, label %for.cond.cleanup314, label %for.cond317.preheader, !llvm.loop !37

for.body320:                                      ; preds = %for.body320.lr.ph, %for.body320
  %n316.0893 = phi i32 [ %sub310, %for.body320.lr.ph ], [ %inc328, %for.body320 ]
  %acc307.1892 = phi float [ %acc307.0897, %for.body320.lr.ph ], [ %65, %for.body320 ]
  %mul321 = mul nsw i32 %n316.0893, %0
  %arrayidx323 = getelementptr float, ptr %62, i32 %mul321
  %63 = load float, ptr %arrayidx323, align 4, !tbaa !15
  %mul324 = mul nsw i32 %n316.0893, %5
  %arrayidx325 = getelementptr inbounds float, ptr %f_data308.0898, i32 %mul324
  %64 = load float, ptr %arrayidx325, align 4, !tbaa !15
  %65 = tail call float @llvm.fmuladd.f32(float %63, float %64, float %acc307.1892)
  %inc328 = add nsw i32 %n316.0893, 1
  %cmp318 = icmp slt i32 %inc328, %8
  br i1 %cmp318, label %for.body320, label %for.cond.cleanup319, !llvm.loop !38

for.cond382.preheader:                            ; preds = %for.cond.cleanup353, %for.cond343.preheader
  %i_pos_y297.1.lcssa = phi i32 [ %i_pos_y297.0.lcssa, %for.cond343.preheader ], [ %add374, %for.cond.cleanup353 ]
  br i1 %cmp383935, label %for.cond390.preheader.lr.ph, label %for.cond.cleanup384

for.cond390.preheader.lr.ph:                      ; preds = %for.cond382.preheader
  %cmp391927 = icmp sgt i32 %sub298, 0
  br label %for.cond390.preheader

for.cond351.preheader:                            ; preds = %for.cond351.preheader.lr.ph, %for.cond.cleanup353
  %x342.0921 = phi i32 [ %shr, %for.cond351.preheader.lr.ph ], [ %inc379, %for.cond.cleanup353 ]
  %i_pos_y297.1920 = phi i32 [ %i_pos_y297.0.lcssa, %for.cond351.preheader.lr.ph ], [ %add374, %for.cond.cleanup353 ]
  br i1 %cmp352911, label %for.cond356.preheader, label %for.cond.cleanup353

for.cond356.preheader:                            ; preds = %for.cond351.preheader, %for.cond.cleanup358
  %m350.0915 = phi i32 [ %inc372, %for.cond.cleanup358 ], [ 0, %for.cond351.preheader ]
  %f_data349.0914 = phi ptr [ %add.ptr369, %for.cond.cleanup358 ], [ %15, %for.cond351.preheader ]
  %acc348.0913 = phi float [ %acc348.1.lcssa, %for.cond.cleanup358 ], [ 0.000000e+00, %for.cond351.preheader ]
  %i_pos_x347.0912 = phi i32 [ %add370, %for.cond.cleanup358 ], [ %i_pos_y297.1920, %for.cond351.preheader ]
  br i1 %cmp357907, label %for.body359.lr.ph, label %for.cond.cleanup358

for.body359.lr.ph:                                ; preds = %for.cond356.preheader
  %66 = getelementptr float, ptr %13, i32 %i_pos_x347.0912
  br label %for.body359

for.cond.cleanup353:                              ; preds = %for.cond.cleanup358, %for.cond351.preheader
  %acc348.0.lcssa = phi float [ 0.000000e+00, %for.cond351.preheader ], [ %acc348.1.lcssa, %for.cond.cleanup358 ]
  %add374 = add nsw i32 %i_pos_y297.1920, %0
  %mul375 = mul nsw i32 %x342.0921, %10
  %gep918 = getelementptr float, ptr %invariant.gep901, i32 %mul375
  store float %acc348.0.lcssa, ptr %gep918, align 4, !tbaa !15
  %inc379 = add nsw i32 %x342.0921, 1
  %exitcond987.not = icmp eq i32 %inc379, %sub15
  br i1 %exitcond987.not, label %for.cond382.preheader, label %for.cond351.preheader, !llvm.loop !39

for.cond.cleanup358:                              ; preds = %for.body359, %for.cond356.preheader
  %acc348.1.lcssa = phi float [ %acc348.0913, %for.cond356.preheader ], [ %69, %for.body359 ]
  %add.ptr369 = getelementptr inbounds float, ptr %f_data349.0914, i32 %mul13
  %add370 = add nsw i32 %i_pos_x347.0912, %mul
  %inc372 = add nuw nsw i32 %m350.0915, 1
  %exitcond986.not = icmp eq i32 %inc372, %indvars.iv981
  br i1 %exitcond986.not, label %for.cond.cleanup353, label %for.cond356.preheader, !llvm.loop !40

for.body359:                                      ; preds = %for.body359.lr.ph, %for.body359
  %n355.0909 = phi i32 [ 0, %for.body359.lr.ph ], [ %inc367, %for.body359 ]
  %acc348.1908 = phi float [ %acc348.0913, %for.body359.lr.ph ], [ %69, %for.body359 ]
  %mul360 = mul nsw i32 %n355.0909, %0
  %arrayidx362 = getelementptr float, ptr %66, i32 %mul360
  %67 = load float, ptr %arrayidx362, align 4, !tbaa !15
  %mul363 = mul nsw i32 %n355.0909, %5
  %arrayidx364 = getelementptr inbounds float, ptr %f_data349.0914, i32 %mul363
  %68 = load float, ptr %arrayidx364, align 4, !tbaa !15
  %69 = tail call float @llvm.fmuladd.f32(float %67, float %68, float %acc348.1908)
  %inc367 = add nuw nsw i32 %n355.0909, 1
  %exitcond985.not = icmp eq i32 %inc367, %8
  br i1 %exitcond985.not, label %for.cond.cleanup358, label %for.body359, !llvm.loop !41

for.cond390.preheader:                            ; preds = %for.cond390.preheader.lr.ph, %for.cond.cleanup392
  %indvars.iv988 = phi i32 [ %sub, %for.cond390.preheader.lr.ph ], [ %indvars.iv.next989, %for.cond.cleanup392 ]
  %x381.0937 = phi i32 [ %sub15, %for.cond390.preheader.lr.ph ], [ %inc419, %for.cond.cleanup392 ]
  %i_pos_y297.2936 = phi i32 [ %i_pos_y297.1.lcssa, %for.cond390.preheader.lr.ph ], [ %add414, %for.cond.cleanup392 ]
  br i1 %cmp391927, label %for.cond395.preheader.lr.ph, label %for.cond.cleanup392

for.cond395.preheader.lr.ph:                      ; preds = %for.cond390.preheader
  %cmp397923 = icmp sgt i32 %sub20, %x381.0937
  br label %for.cond395.preheader

for.cond.cleanup384:                              ; preds = %for.cond.cleanup392, %for.cond382.preheader
  %add421 = add nsw i32 %i_pos.2940, %mul
  %inc423 = add nsw i32 %y292.0939, 1
  %indvars.iv.next982 = add i32 %indvars.iv981, -1
  %exitcond993.not = icmp eq i32 %inc423, %4
  br i1 %exitcond993.not, label %for.cond426.preheader, label %for.body296, !llvm.loop !42

for.cond395.preheader:                            ; preds = %for.cond395.preheader.lr.ph, %for.cond.cleanup398
  %m389.0931 = phi i32 [ 0, %for.cond395.preheader.lr.ph ], [ %inc412, %for.cond.cleanup398 ]
  %f_data388.0930 = phi ptr [ %15, %for.cond395.preheader.lr.ph ], [ %add.ptr409, %for.cond.cleanup398 ]
  %acc387.0929 = phi float [ 0.000000e+00, %for.cond395.preheader.lr.ph ], [ %acc387.1.lcssa, %for.cond.cleanup398 ]
  %i_pos_x386.0928 = phi i32 [ %i_pos_y297.2936, %for.cond395.preheader.lr.ph ], [ %add410, %for.cond.cleanup398 ]
  br i1 %cmp397923, label %for.body399.lr.ph, label %for.cond.cleanup398

for.body399.lr.ph:                                ; preds = %for.cond395.preheader
  %70 = getelementptr float, ptr %13, i32 %i_pos_x386.0928
  br label %for.body399

for.cond.cleanup392:                              ; preds = %for.cond.cleanup398, %for.cond390.preheader
  %acc387.0.lcssa = phi float [ 0.000000e+00, %for.cond390.preheader ], [ %acc387.1.lcssa, %for.cond.cleanup398 ]
  %add414 = add nsw i32 %i_pos_y297.2936, %0
  %mul415 = mul nsw i32 %x381.0937, %10
  %gep934 = getelementptr float, ptr %invariant.gep901, i32 %mul415
  store float %acc387.0.lcssa, ptr %gep934, align 4, !tbaa !15
  %inc419 = add nsw i32 %x381.0937, 1
  %indvars.iv.next989 = add i32 %indvars.iv988, -1
  %exitcond992.not = icmp eq i32 %inc419, %3
  br i1 %exitcond992.not, label %for.cond.cleanup384, label %for.cond390.preheader, !llvm.loop !43

for.cond.cleanup398:                              ; preds = %for.body399, %for.cond395.preheader
  %acc387.1.lcssa = phi float [ %acc387.0929, %for.cond395.preheader ], [ %73, %for.body399 ]
  %add.ptr409 = getelementptr inbounds float, ptr %f_data388.0930, i32 %mul13
  %add410 = add nsw i32 %i_pos_x386.0928, %mul
  %inc412 = add nuw nsw i32 %m389.0931, 1
  %exitcond991.not = icmp eq i32 %inc412, %indvars.iv981
  br i1 %exitcond991.not, label %for.cond.cleanup392, label %for.cond395.preheader, !llvm.loop !44

for.body399:                                      ; preds = %for.body399.lr.ph, %for.body399
  %n394.0925 = phi i32 [ 0, %for.body399.lr.ph ], [ %inc407, %for.body399 ]
  %acc387.1924 = phi float [ %acc387.0929, %for.body399.lr.ph ], [ %73, %for.body399 ]
  %mul400 = mul nsw i32 %n394.0925, %0
  %arrayidx402 = getelementptr float, ptr %70, i32 %mul400
  %71 = load float, ptr %arrayidx402, align 4, !tbaa !15
  %mul403 = mul nsw i32 %n394.0925, %5
  %arrayidx404 = getelementptr inbounds float, ptr %f_data388.0930, i32 %mul403
  %72 = load float, ptr %arrayidx404, align 4, !tbaa !15
  %73 = tail call float @llvm.fmuladd.f32(float %71, float %72, float %acc387.1924)
  %inc407 = add nuw nsw i32 %n394.0925, 1
  %exitcond990.not = icmp eq i32 %inc407, %indvars.iv988
  br i1 %exitcond990.not, label %for.cond.cleanup398, label %for.body399, !llvm.loop !45

for.cond.cleanup428:                              ; preds = %for.cond.cleanup436, %for.cond426.preheader
  ret i32 0

for.body429:                                      ; preds = %for.body429.lr.ph, %for.cond.cleanup436
  %i_pos.3958 = phi i32 [ 0, %for.body429.lr.ph ], [ %add472, %for.cond.cleanup436 ]
  %y425.0957 = phi i32 [ %shr12, %for.body429.lr.ph ], [ %inc474, %for.cond.cleanup436 ]
  %mul432 = mul nsw i32 %y425.0957, %mul14
  %invariant.gep951 = getelementptr float, ptr %14, i32 %mul432
  br i1 %cmp435953, label %for.cond442.preheader, label %for.cond.cleanup436

for.cond442.preheader:                            ; preds = %for.body429, %for.cond.cleanup444
  %x433.0955 = phi i32 [ %inc470, %for.cond.cleanup444 ], [ %shr, %for.body429 ]
  %i_pos_y430.0954 = phi i32 [ %add465, %for.cond.cleanup444 ], [ %i_pos.3958, %for.body429 ]
  br i1 %cmp443945, label %for.cond447.preheader, label %for.cond.cleanup444

for.cond.cleanup436:                              ; preds = %for.cond.cleanup444, %for.body429
  %add472 = add nsw i32 %i_pos.3958, %mul
  %inc474 = add nsw i32 %y425.0957, 1
  %exitcond997.not = icmp eq i32 %inc474, %sub17
  br i1 %exitcond997.not, label %for.cond.cleanup428, label %for.body429, !llvm.loop !46

for.cond447.preheader:                            ; preds = %for.cond442.preheader, %for.cond.cleanup449
  %m441.0949 = phi i32 [ %inc463, %for.cond.cleanup449 ], [ 0, %for.cond442.preheader ]
  %f_data440.0948 = phi ptr [ %add.ptr460, %for.cond.cleanup449 ], [ %15, %for.cond442.preheader ]
  %acc439.0947 = phi float [ %acc439.1.lcssa, %for.cond.cleanup449 ], [ 0.000000e+00, %for.cond442.preheader ]
  %i_pos_x438.0946 = phi i32 [ %add461, %for.cond.cleanup449 ], [ %i_pos_y430.0954, %for.cond442.preheader ]
  br i1 %cmp448941, label %for.body450.lr.ph, label %for.cond.cleanup449

for.body450.lr.ph:                                ; preds = %for.cond447.preheader
  %74 = getelementptr float, ptr %13, i32 %i_pos_x438.0946
  br label %for.body450

for.cond.cleanup444:                              ; preds = %for.cond.cleanup449, %for.cond442.preheader
  %acc439.0.lcssa = phi float [ 0.000000e+00, %for.cond442.preheader ], [ %acc439.1.lcssa, %for.cond.cleanup449 ]
  %add465 = add nsw i32 %i_pos_y430.0954, %0
  %mul466 = mul nsw i32 %x433.0955, %10
  %gep952 = getelementptr float, ptr %invariant.gep951, i32 %mul466
  store float %acc439.0.lcssa, ptr %gep952, align 4, !tbaa !15
  %inc470 = add nsw i32 %x433.0955, 1
  %exitcond996.not = icmp eq i32 %inc470, %sub15
  br i1 %exitcond996.not, label %for.cond.cleanup436, label %for.cond442.preheader, !llvm.loop !47

for.cond.cleanup449:                              ; preds = %for.body450, %for.cond447.preheader
  %acc439.1.lcssa = phi float [ %acc439.0947, %for.cond447.preheader ], [ %77, %for.body450 ]
  %add.ptr460 = getelementptr inbounds float, ptr %f_data440.0948, i32 %mul13
  %add461 = add nsw i32 %i_pos_x438.0946, %mul
  %inc463 = add nuw nsw i32 %m441.0949, 1
  %exitcond995.not = icmp eq i32 %inc463, %9
  br i1 %exitcond995.not, label %for.cond.cleanup444, label %for.cond447.preheader, !llvm.loop !48

for.body450:                                      ; preds = %for.body450.lr.ph, %for.body450
  %n446.0943 = phi i32 [ 0, %for.body450.lr.ph ], [ %inc458, %for.body450 ]
  %acc439.1942 = phi float [ %acc439.0947, %for.body450.lr.ph ], [ %77, %for.body450 ]
  %mul451 = mul nsw i32 %n446.0943, %0
  %arrayidx453 = getelementptr float, ptr %74, i32 %mul451
  %75 = load float, ptr %arrayidx453, align 4, !tbaa !15
  %mul454 = mul nsw i32 %n446.0943, %5
  %arrayidx455 = getelementptr inbounds float, ptr %f_data440.0948, i32 %mul454
  %76 = load float, ptr %arrayidx455, align 4, !tbaa !15
  %77 = tail call float @llvm.fmuladd.f32(float %75, float %76, float %acc439.1942)
  %inc458 = add nuw nsw i32 %n446.0943, 1
  %exitcond994.not = icmp eq i32 %inc458, %8
  br i1 %exitcond994.not, label %for.cond.cleanup449, label %for.body450, !llvm.loop !49
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
!49 = distinct !{!49, !18}
