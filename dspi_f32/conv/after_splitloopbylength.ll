; ModuleID = 'dspi_conv_f32_ansi.ll'
source_filename = "dspi_conv_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.image2d_s = type { ptr, i32, i32, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_conv_f32_ansi(ptr nocapture noundef readonly %in_image, ptr nocapture noundef readonly %filter, ptr nocapture noundef %out_image) local_unnamed_addr #0 {
entry:
  %size_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 5
  %0 = load i32, ptr %size_x, align 4, !tbaa !4
  %size_x1 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 5
  store i32 %0, ptr %size_x1, align 4, !tbaa !4
  %size_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 6
  %1 = load i32, ptr %size_y, align 4, !tbaa !10
  %size_y2 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 6
  store i32 %1, ptr %size_y2, align 4, !tbaa !10
  %2 = load ptr, ptr %in_image, align 4, !tbaa !11
  %3 = load ptr, ptr %out_image, align 4, !tbaa !11
  %size_x4 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 5
  %4 = load i32, ptr %size_x4, align 4, !tbaa !4
  %sub = add nsw i32 %4, -1
  %shr = ashr i32 %sub, 1
  %size_y5 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 6
  %5 = load i32, ptr %size_y5, align 4, !tbaa !10
  %sub6 = add nsw i32 %5, -1
  %shr7 = ashr i32 %sub6, 1
  %stride_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 3
  %6 = load i32, ptr %stride_x, align 4, !tbaa !12
  %step_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 2
  %7 = load i32, ptr %step_y, align 4, !tbaa !13
  %mul = mul nsw i32 %7, %6
  %stride_x8 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 3
  %8 = load i32, ptr %stride_x8, align 4, !tbaa !12
  %step_y9 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 2
  %9 = load i32, ptr %step_y9, align 4, !tbaa !13
  %mul10 = mul nsw i32 %9, %8
  %cmp938 = icmp sgt i32 %shr7, 0
  br i1 %cmp938, label %for.cond11.preheader.lr.ph, label %for.cond176.preheader

for.cond11.preheader.lr.ph:                       ; preds = %entry
  %cmp12901 = icmp sgt i32 %shr, 0
  %step_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 1
  %step_x29 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 1
  %step_x39 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 1
  %stride_x41 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 3
  %step_y43 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 2
  %div.neg = sdiv i32 %4, -2
  %sub54 = add i32 %0, %div.neg
  %cmp55915 = icmp slt i32 %shr, %sub54
  %cmp72905 = icmp sgt i32 %4, 0
  %sub109 = add nsw i32 %sub54, -1
  %cmp112933.not = icmp sgt i32 %sub54, %0
  %div132 = sdiv i32 %4, 2
  %sub130 = sub i32 %div132, %0
  br label %for.cond11.preheader

for.cond11.preheader:                             ; preds = %for.cond.cleanup113, %for.cond11.preheader.lr.ph
  %y.0940 = phi i32 [ 0, %for.cond11.preheader.lr.ph ], [ %inc173, %for.cond.cleanup113 ]
  %i_pos.0939 = phi i32 [ 0, %for.cond11.preheader.lr.ph ], [ %add171, %for.cond.cleanup113 ]
  br i1 %cmp12901, label %for.body14.lr.ph, label %for.cond51.preheader

for.body14.lr.ph:                                 ; preds = %for.cond11.preheader
  %10 = load ptr, ptr %filter, align 4, !tbaa !11
  %sub16 = sub nsw i32 %shr7, %y.0940
  %cmp19895 = icmp slt i32 %sub16, %5
  %11 = load i32, ptr %step_x, align 4, !tbaa !14
  %12 = load i32, ptr %step_x39, align 4, !tbaa !14
  %13 = load i32, ptr %stride_x41, align 4, !tbaa !12
  %mul42 = mul nsw i32 %13, %y.0940
  %14 = load i32, ptr %step_y43, align 4, !tbaa !13
  %mul44 = mul nsw i32 %mul42, %14
  %invariant.gep = getelementptr float, ptr %3, i32 %mul44
  br label %for.body14

for.cond176.preheader:                            ; preds = %for.cond.cleanup113, %entry
  %div179.neg = sdiv i32 %5, -2
  %sub180 = add i32 %1, %div179.neg
  %cmp181973 = icmp slt i32 %shr7, %sub180
  br i1 %cmp181973, label %for.cond186.preheader.lr.ph, label %for.cond311.preheader

for.cond186.preheader.lr.ph:                      ; preds = %for.cond176.preheader
  %cmp187951 = icmp sgt i32 %shr, 0
  %cmp197945 = icmp sgt i32 %5, 0
  %step_x207 = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 1
  %step_x211 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 1
  %step_x225 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 1
  %stride_x227 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 3
  %step_y229 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 2
  %div239.neg = sdiv i32 %4, -2
  %sub240 = add nsw i32 %div239.neg, -1
  %sub241 = add i32 %sub240, %0
  %cmp244967 = icmp slt i32 %sub241, %0
  %div263 = sdiv i32 %4, 2
  %sub261 = sub i32 %div263, %0
  br label %for.cond186.preheader

for.cond51.preheader:                             ; preds = %for.cond.cleanup20, %for.cond11.preheader
  %i_pos_y.0.lcssa = phi i32 [ %i_pos.0939, %for.cond11.preheader ], [ %add38, %for.cond.cleanup20 ]
  br i1 %cmp55915, label %for.body57.lr.ph, label %for.cond.cleanup56

for.body57.lr.ph:                                 ; preds = %for.cond51.preheader
  %15 = load ptr, ptr %filter, align 4, !tbaa !11
  %sub63 = sub nsw i32 %shr7, %y.0940
  %cmp66909 = icmp slt i32 %sub63, %5
  %16 = load i32, ptr %step_x, align 4, !tbaa !14
  %17 = load i32, ptr %step_x39, align 4, !tbaa !14
  %18 = load i32, ptr %stride_x41, align 4, !tbaa !12
  %mul96 = mul nsw i32 %18, %y.0940
  %19 = load i32, ptr %step_y43, align 4, !tbaa !13
  %mul98 = mul nsw i32 %mul96, %19
  %invariant.gep921 = getelementptr float, ptr %3, i32 %mul98
  br label %for.body57

for.body14:                                       ; preds = %for.cond.cleanup20, %for.body14.lr.ph
  %x.0903 = phi i32 [ 0, %for.body14.lr.ph ], [ %inc48, %for.cond.cleanup20 ]
  %i_pos_y.0902 = phi i32 [ %i_pos.0939, %for.body14.lr.ph ], [ %add38, %for.cond.cleanup20 ]
  br i1 %cmp19895, label %for.body21.lr.ph, label %for.cond.cleanup20

for.body21.lr.ph:                                 ; preds = %for.body14
  %sub22 = sub nsw i32 %shr, %x.0903
  %cmp25892 = icmp slt i32 %sub22, %4
  br label %for.body21

for.cond.cleanup20:                               ; preds = %for.cond.cleanup26, %for.body14
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.body14 ], [ %acc.1.lcssa, %for.cond.cleanup26 ]
  %add38 = add nsw i32 %11, %i_pos_y.0902
  %mul40 = mul nsw i32 %12, %x.0903
  %gep = getelementptr float, ptr %invariant.gep, i32 %mul40
  store float %acc.0.lcssa, ptr %gep, align 4, !tbaa !15
  %inc48 = add nuw nsw i32 %x.0903, 1
  %exitcond.not = icmp eq i32 %inc48, %shr
  br i1 %exitcond.not, label %for.cond51.preheader, label %for.body14, !llvm.loop !17

for.body21:                                       ; preds = %for.cond.cleanup26, %for.body21.lr.ph
  %m.0899 = phi i32 [ %sub16, %for.body21.lr.ph ], [ %inc35, %for.cond.cleanup26 ]
  %f_data.0898 = phi ptr [ %10, %for.body21.lr.ph ], [ %add.ptr, %for.cond.cleanup26 ]
  %acc.0897 = phi float [ 0.000000e+00, %for.body21.lr.ph ], [ %acc.1.lcssa, %for.cond.cleanup26 ]
  %i_pos_x.0896 = phi i32 [ %i_pos_y.0902, %for.body21.lr.ph ], [ %add33, %for.cond.cleanup26 ]
  br i1 %cmp25892, label %for.body27.lr.ph, label %for.cond.cleanup26

for.body27.lr.ph:                                 ; preds = %for.body21
  %20 = getelementptr float, ptr %2, i32 %i_pos_x.0896
  %21 = load i32, ptr %step_x29, align 4, !tbaa !14
  br label %for.body27

for.cond.cleanup26:                               ; preds = %for.body27, %for.body21
  %acc.1.lcssa = phi float [ %acc.0897, %for.body21 ], [ %24, %for.body27 ]
  %add.ptr = getelementptr inbounds float, ptr %f_data.0898, i32 %mul10
  %add33 = add nsw i32 %i_pos_x.0896, %mul
  %inc35 = add nsw i32 %m.0899, 1
  %cmp19 = icmp slt i32 %inc35, %5
  br i1 %cmp19, label %for.body21, label %for.cond.cleanup20, !llvm.loop !19

for.body27:                                       ; preds = %for.body27, %for.body27.lr.ph
  %n.0894 = phi i32 [ %sub22, %for.body27.lr.ph ], [ %inc, %for.body27 ]
  %acc.1893 = phi float [ %acc.0897, %for.body27.lr.ph ], [ %24, %for.body27 ]
  %mul28 = mul nsw i32 %11, %n.0894
  %arrayidx = getelementptr float, ptr %20, i32 %mul28
  %22 = load float, ptr %arrayidx, align 4, !tbaa !15
  %mul30 = mul nsw i32 %21, %n.0894
  %arrayidx31 = getelementptr inbounds float, ptr %f_data.0898, i32 %mul30
  %23 = load float, ptr %arrayidx31, align 4, !tbaa !15
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %acc.1893)
  %inc = add nsw i32 %n.0894, 1
  %cmp25 = icmp slt i32 %inc, %4
  br i1 %cmp25, label %for.body27, label %for.cond.cleanup26, !llvm.loop !20

for.cond.cleanup56:                               ; preds = %for.cond.cleanup67, %for.cond51.preheader
  %i_pos_y.1.lcssa = phi i32 [ %i_pos_y.0.lcssa, %for.cond51.preheader ], [ %add92, %for.cond.cleanup67 ]
  br i1 %cmp112933.not, label %for.cond.cleanup113, label %for.body114.lr.ph

for.body114.lr.ph:                                ; preds = %for.cond.cleanup56
  %25 = load ptr, ptr %filter, align 4, !tbaa !11
  %sub120 = sub nsw i32 %shr7, %y.0940
  %cmp123927 = icmp slt i32 %sub120, %5
  %26 = load i32, ptr %step_x, align 4, !tbaa !14
  %27 = load i32, ptr %step_x39, align 4, !tbaa !14
  %28 = load i32, ptr %stride_x41, align 4, !tbaa !12
  %mul160 = mul nsw i32 %28, %y.0940
  %29 = load i32, ptr %step_y43, align 4, !tbaa !13
  %mul162 = mul nsw i32 %mul160, %29
  %invariant.gep936 = getelementptr float, ptr %3, i32 %mul162
  br label %for.body114

for.body57:                                       ; preds = %for.cond.cleanup67, %for.body57.lr.ph
  %x50.0917 = phi i32 [ %shr, %for.body57.lr.ph ], [ %inc102, %for.cond.cleanup67 ]
  %i_pos_y.1916 = phi i32 [ %i_pos_y.0.lcssa, %for.body57.lr.ph ], [ %add92, %for.cond.cleanup67 ]
  br i1 %cmp66909, label %for.cond70.preheader, label %for.cond.cleanup67

for.cond70.preheader:                             ; preds = %for.cond.cleanup73, %for.body57
  %m62.0913 = phi i32 [ %inc89, %for.cond.cleanup73 ], [ %sub63, %for.body57 ]
  %f_data60.0912 = phi ptr [ %add.ptr86, %for.cond.cleanup73 ], [ %15, %for.body57 ]
  %acc59.0911 = phi float [ %acc59.1.lcssa, %for.cond.cleanup73 ], [ 0.000000e+00, %for.body57 ]
  %i_pos_x58.0910 = phi i32 [ %add87, %for.cond.cleanup73 ], [ %i_pos_y.1916, %for.body57 ]
  br i1 %cmp72905, label %for.body74.lr.ph, label %for.cond.cleanup73

for.body74.lr.ph:                                 ; preds = %for.cond70.preheader
  %30 = getelementptr float, ptr %2, i32 %i_pos_x58.0910
  %31 = load i32, ptr %step_x29, align 4, !tbaa !14
  br label %for.body74

for.cond.cleanup67:                               ; preds = %for.cond.cleanup73, %for.body57
  %acc59.0.lcssa = phi float [ 0.000000e+00, %for.body57 ], [ %acc59.1.lcssa, %for.cond.cleanup73 ]
  %add92 = add nsw i32 %16, %i_pos_y.1916
  %mul94 = mul nsw i32 %17, %x50.0917
  %gep922 = getelementptr float, ptr %invariant.gep921, i32 %mul94
  store float %acc59.0.lcssa, ptr %gep922, align 4, !tbaa !15
  %inc102 = add nsw i32 %x50.0917, 1
  %exitcond1058.not = icmp eq i32 %inc102, %sub54
  br i1 %exitcond1058.not, label %for.cond.cleanup56, label %for.body57, !llvm.loop !21

for.cond.cleanup73:                               ; preds = %for.body74, %for.cond70.preheader
  %acc59.1.lcssa = phi float [ %acc59.0911, %for.cond70.preheader ], [ %34, %for.body74 ]
  %add.ptr86 = getelementptr inbounds float, ptr %f_data60.0912, i32 %mul10
  %add87 = add nsw i32 %i_pos_x58.0910, %mul
  %inc89 = add nsw i32 %m62.0913, 1
  %cmp66 = icmp slt i32 %inc89, %5
  br i1 %cmp66, label %for.cond70.preheader, label %for.cond.cleanup67, !llvm.loop !22

for.body74:                                       ; preds = %for.body74, %for.body74.lr.ph
  %n69.0907 = phi i32 [ 0, %for.body74.lr.ph ], [ %inc84, %for.body74 ]
  %acc59.1906 = phi float [ %acc59.0911, %for.body74.lr.ph ], [ %34, %for.body74 ]
  %mul76 = mul nsw i32 %16, %n69.0907
  %arrayidx78 = getelementptr float, ptr %30, i32 %mul76
  %32 = load float, ptr %arrayidx78, align 4, !tbaa !15
  %mul80 = mul nsw i32 %31, %n69.0907
  %arrayidx81 = getelementptr inbounds float, ptr %f_data60.0912, i32 %mul80
  %33 = load float, ptr %arrayidx81, align 4, !tbaa !15
  %34 = tail call float @llvm.fmuladd.f32(float %32, float %33, float %acc59.1906)
  %inc84 = add nuw nsw i32 %n69.0907, 1
  %exitcond1057.not = icmp eq i32 %inc84, %4
  br i1 %exitcond1057.not, label %for.cond.cleanup73, label %for.body74, !llvm.loop !23

for.cond.cleanup113:                              ; preds = %for.cond.cleanup124, %for.cond.cleanup56
  %add171 = add nsw i32 %i_pos.0939, %mul
  %inc173 = add nuw nsw i32 %y.0940, 1
  %exitcond1060.not = icmp eq i32 %inc173, %shr7
  br i1 %exitcond1060.not, label %for.cond176.preheader, label %for.cond11.preheader, !llvm.loop !24

for.body114:                                      ; preds = %for.cond.cleanup124, %for.body114.lr.ph
  %x104.0935 = phi i32 [ %sub109, %for.body114.lr.ph ], [ %inc166, %for.cond.cleanup124 ]
  %i_pos_y.2934 = phi i32 [ %i_pos_y.1.lcssa, %for.body114.lr.ph ], [ %add156, %for.cond.cleanup124 ]
  br i1 %cmp123927, label %for.cond127.preheader.lr.ph, label %for.cond.cleanup124

for.cond127.preheader.lr.ph:                      ; preds = %for.body114
  %add133 = add i32 %sub130, %x104.0935
  %add134.neg = xor i32 %add133, -1
  %sub135 = add i32 %4, %add134.neg
  %cmp136923 = icmp sgt i32 %sub135, 0
  br label %for.cond127.preheader

for.cond127.preheader:                            ; preds = %for.cond.cleanup137, %for.cond127.preheader.lr.ph
  %m119.0931 = phi i32 [ %sub120, %for.cond127.preheader.lr.ph ], [ %inc153, %for.cond.cleanup137 ]
  %f_data117.0930 = phi ptr [ %25, %for.cond127.preheader.lr.ph ], [ %add.ptr150, %for.cond.cleanup137 ]
  %acc116.0929 = phi float [ 0.000000e+00, %for.cond127.preheader.lr.ph ], [ %acc116.1.lcssa, %for.cond.cleanup137 ]
  %i_pos_x115.0928 = phi i32 [ %i_pos_y.2934, %for.cond127.preheader.lr.ph ], [ %add151, %for.cond.cleanup137 ]
  br i1 %cmp136923, label %for.body138.lr.ph, label %for.cond.cleanup137

for.body138.lr.ph:                                ; preds = %for.cond127.preheader
  %35 = getelementptr float, ptr %2, i32 %i_pos_x115.0928
  %36 = load i32, ptr %step_x29, align 4, !tbaa !14
  br label %for.body138

for.cond.cleanup124:                              ; preds = %for.cond.cleanup137, %for.body114
  %acc116.0.lcssa = phi float [ 0.000000e+00, %for.body114 ], [ %acc116.1.lcssa, %for.cond.cleanup137 ]
  %add156 = add nsw i32 %26, %i_pos_y.2934
  %mul158 = mul nsw i32 %27, %x104.0935
  %gep937 = getelementptr float, ptr %invariant.gep936, i32 %mul158
  store float %acc116.0.lcssa, ptr %gep937, align 4, !tbaa !15
  %inc166 = add nsw i32 %x104.0935, 1
  %exitcond1059.not = icmp eq i32 %inc166, %0
  br i1 %exitcond1059.not, label %for.cond.cleanup113, label %for.body114, !llvm.loop !25

for.cond.cleanup137:                              ; preds = %for.body138, %for.cond127.preheader
  %acc116.1.lcssa = phi float [ %acc116.0929, %for.cond127.preheader ], [ %39, %for.body138 ]
  %add.ptr150 = getelementptr inbounds float, ptr %f_data117.0930, i32 %mul10
  %add151 = add nsw i32 %i_pos_x115.0928, %mul
  %inc153 = add nsw i32 %m119.0931, 1
  %cmp123 = icmp slt i32 %inc153, %5
  br i1 %cmp123, label %for.cond127.preheader, label %for.cond.cleanup124, !llvm.loop !26

for.body138:                                      ; preds = %for.body138, %for.body138.lr.ph
  %n126.0925 = phi i32 [ 0, %for.body138.lr.ph ], [ %inc148, %for.body138 ]
  %acc116.1924 = phi float [ %acc116.0929, %for.body138.lr.ph ], [ %39, %for.body138 ]
  %mul140 = mul nsw i32 %26, %n126.0925
  %arrayidx142 = getelementptr float, ptr %35, i32 %mul140
  %37 = load float, ptr %arrayidx142, align 4, !tbaa !15
  %mul144 = mul nsw i32 %36, %n126.0925
  %arrayidx145 = getelementptr inbounds float, ptr %f_data117.0930, i32 %mul144
  %38 = load float, ptr %arrayidx145, align 4, !tbaa !15
  %39 = tail call float @llvm.fmuladd.f32(float %37, float %38, float %acc116.1924)
  %inc148 = add nuw nsw i32 %n126.0925, 1
  %cmp136 = icmp slt i32 %inc148, %sub135
  br i1 %cmp136, label %for.body138, label %for.cond.cleanup137, !llvm.loop !27

for.cond186.preheader:                            ; preds = %for.cond.cleanup245, %for.cond186.preheader.lr.ph
  %y175.0975 = phi i32 [ %shr7, %for.cond186.preheader.lr.ph ], [ %inc304, %for.cond.cleanup245 ]
  %i_pos.1974 = phi i32 [ 0, %for.cond186.preheader.lr.ph ], [ %add302, %for.cond.cleanup245 ]
  br i1 %cmp187951, label %for.body189.lr.ph, label %for.cond.cleanup188

for.body189.lr.ph:                                ; preds = %for.cond186.preheader
  %40 = load ptr, ptr %filter, align 4, !tbaa !11
  %41 = load i32, ptr %step_x207, align 4, !tbaa !14
  %42 = load i32, ptr %step_x225, align 4, !tbaa !14
  %43 = load i32, ptr %stride_x227, align 4, !tbaa !12
  %mul228 = mul nsw i32 %43, %y175.0975
  %44 = load i32, ptr %step_y229, align 4, !tbaa !13
  %mul230 = mul nsw i32 %mul228, %44
  %invariant.gep955 = getelementptr float, ptr %3, i32 %mul230
  br label %for.body189

for.cond311.preheader:                            ; preds = %for.cond.cleanup245, %for.cond176.preheader
  %cmp3131028 = icmp slt i32 %sub180, %1
  br i1 %cmp3131028, label %for.cond318.preheader.lr.ph, label %for.cond513.preheader

for.cond318.preheader.lr.ph:                      ; preds = %for.cond311.preheader
  %cmp319989 = icmp sgt i32 %shr, 0
  %div332 = sdiv i32 %5, 2
  %sub330 = sub i32 %div332, %1
  %step_x346 = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 1
  %step_x350 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 1
  %step_x364 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 1
  %stride_x366 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 3
  %step_y368 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 2
  %div379.neg = sdiv i32 %4, -2
  %sub380 = add i32 %0, %div379.neg
  %cmp3811005 = icmp slt i32 %shr, %sub380
  %cmp404995 = icmp sgt i32 %4, 0
  %cmp4431023 = icmp slt i32 %sub380, %0
  %div469 = sdiv i32 %4, 2
  %sub467 = sub i32 %div469, %0
  br label %for.cond318.preheader

for.cond.cleanup188:                              ; preds = %for.cond.cleanup198, %for.cond186.preheader
  %i_pos_y184.0.lcssa = phi i32 [ %i_pos.1974, %for.cond186.preheader ], [ %add224, %for.cond.cleanup198 ]
  br i1 %cmp244967, label %for.body246.lr.ph, label %for.cond.cleanup245

for.body246.lr.ph:                                ; preds = %for.cond.cleanup188
  %45 = load ptr, ptr %filter, align 4, !tbaa !11
  %46 = load i32, ptr %step_x207, align 4, !tbaa !14
  %47 = load i32, ptr %step_x225, align 4, !tbaa !14
  %48 = load i32, ptr %stride_x227, align 4, !tbaa !12
  %mul291 = mul nsw i32 %48, %y175.0975
  %49 = load i32, ptr %step_y229, align 4, !tbaa !13
  %mul293 = mul nsw i32 %mul291, %49
  %invariant.gep970 = getelementptr float, ptr %3, i32 %mul293
  br label %for.body246

for.body189:                                      ; preds = %for.cond.cleanup198, %for.body189.lr.ph
  %x185.0953 = phi i32 [ 0, %for.body189.lr.ph ], [ %inc234, %for.cond.cleanup198 ]
  %i_pos_y184.0952 = phi i32 [ %i_pos.1974, %for.body189.lr.ph ], [ %add224, %for.cond.cleanup198 ]
  br i1 %cmp197945, label %for.body199.lr.ph, label %for.cond.cleanup198

for.body199.lr.ph:                                ; preds = %for.body189
  %sub201 = sub nsw i32 %shr, %x185.0953
  %cmp204941 = icmp slt i32 %sub201, %4
  br label %for.body199

for.cond.cleanup198:                              ; preds = %for.cond.cleanup205, %for.body189
  %acc191.0.lcssa = phi float [ 0.000000e+00, %for.body189 ], [ %acc191.1.lcssa, %for.cond.cleanup205 ]
  %add224 = add nsw i32 %41, %i_pos_y184.0952
  %mul226 = mul nsw i32 %42, %x185.0953
  %gep956 = getelementptr float, ptr %invariant.gep955, i32 %mul226
  store float %acc191.0.lcssa, ptr %gep956, align 4, !tbaa !15
  %inc234 = add nuw nsw i32 %x185.0953, 1
  %exitcond1062.not = icmp eq i32 %inc234, %shr
  br i1 %exitcond1062.not, label %for.cond.cleanup188, label %for.body189, !llvm.loop !28

for.body199:                                      ; preds = %for.cond.cleanup205, %for.body199.lr.ph
  %m194.0949 = phi i32 [ 0, %for.body199.lr.ph ], [ %inc221, %for.cond.cleanup205 ]
  %f_data192.0948 = phi ptr [ %40, %for.body199.lr.ph ], [ %add.ptr218, %for.cond.cleanup205 ]
  %acc191.0947 = phi float [ 0.000000e+00, %for.body199.lr.ph ], [ %acc191.1.lcssa, %for.cond.cleanup205 ]
  %i_pos_x190.0946 = phi i32 [ %i_pos_y184.0952, %for.body199.lr.ph ], [ %add219, %for.cond.cleanup205 ]
  br i1 %cmp204941, label %for.body206.lr.ph, label %for.cond.cleanup205

for.body206.lr.ph:                                ; preds = %for.body199
  %50 = getelementptr float, ptr %2, i32 %i_pos_x190.0946
  %51 = load i32, ptr %step_x211, align 4, !tbaa !14
  br label %for.body206

for.cond.cleanup205:                              ; preds = %for.body206, %for.body199
  %acc191.1.lcssa = phi float [ %acc191.0947, %for.body199 ], [ %54, %for.body206 ]
  %add.ptr218 = getelementptr inbounds float, ptr %f_data192.0948, i32 %mul10
  %add219 = add nsw i32 %i_pos_x190.0946, %mul
  %inc221 = add nuw nsw i32 %m194.0949, 1
  %exitcond1061.not = icmp eq i32 %inc221, %5
  br i1 %exitcond1061.not, label %for.cond.cleanup198, label %for.body199, !llvm.loop !29

for.body206:                                      ; preds = %for.body206, %for.body206.lr.ph
  %n200.0943 = phi i32 [ %sub201, %for.body206.lr.ph ], [ %inc216, %for.body206 ]
  %acc191.1942 = phi float [ %acc191.0947, %for.body206.lr.ph ], [ %54, %for.body206 ]
  %mul208 = mul nsw i32 %41, %n200.0943
  %arrayidx210 = getelementptr float, ptr %50, i32 %mul208
  %52 = load float, ptr %arrayidx210, align 4, !tbaa !15
  %mul212 = mul nsw i32 %51, %n200.0943
  %arrayidx213 = getelementptr inbounds float, ptr %f_data192.0948, i32 %mul212
  %53 = load float, ptr %arrayidx213, align 4, !tbaa !15
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %acc191.1942)
  %inc216 = add nsw i32 %n200.0943, 1
  %cmp204 = icmp slt i32 %inc216, %4
  br i1 %cmp204, label %for.body206, label %for.cond.cleanup205, !llvm.loop !30

for.cond.cleanup245:                              ; preds = %for.cond.cleanup255, %for.cond.cleanup188
  %add302 = add nsw i32 %i_pos.1974, %mul
  %inc304 = add nsw i32 %y175.0975, 1
  %exitcond1065.not = icmp eq i32 %inc304, %sub180
  br i1 %exitcond1065.not, label %for.cond311.preheader, label %for.cond186.preheader, !llvm.loop !31

for.body246:                                      ; preds = %for.cond.cleanup255, %for.body246.lr.ph
  %x236.0969 = phi i32 [ %sub241, %for.body246.lr.ph ], [ %inc297, %for.cond.cleanup255 ]
  %i_pos_y184.1968 = phi i32 [ %i_pos_y184.0.lcssa, %for.body246.lr.ph ], [ %add287, %for.cond.cleanup255 ]
  br i1 %cmp197945, label %for.cond258.preheader.lr.ph, label %for.cond.cleanup255

for.cond258.preheader.lr.ph:                      ; preds = %for.body246
  %add264 = add i32 %sub261, %x236.0969
  %add265.neg = xor i32 %add264, -1
  %sub266 = add i32 %4, %add265.neg
  %cmp267957 = icmp sgt i32 %sub266, 0
  br label %for.cond258.preheader

for.cond258.preheader:                            ; preds = %for.cond.cleanup268, %for.cond258.preheader.lr.ph
  %m251.0965 = phi i32 [ 0, %for.cond258.preheader.lr.ph ], [ %inc284, %for.cond.cleanup268 ]
  %f_data249.0964 = phi ptr [ %45, %for.cond258.preheader.lr.ph ], [ %add.ptr281, %for.cond.cleanup268 ]
  %acc248.0963 = phi float [ 0.000000e+00, %for.cond258.preheader.lr.ph ], [ %acc248.1.lcssa, %for.cond.cleanup268 ]
  %i_pos_x247.0962 = phi i32 [ %i_pos_y184.1968, %for.cond258.preheader.lr.ph ], [ %add282, %for.cond.cleanup268 ]
  br i1 %cmp267957, label %for.body269.lr.ph, label %for.cond.cleanup268

for.body269.lr.ph:                                ; preds = %for.cond258.preheader
  %55 = getelementptr float, ptr %2, i32 %i_pos_x247.0962
  %56 = load i32, ptr %step_x211, align 4, !tbaa !14
  br label %for.body269

for.cond.cleanup255:                              ; preds = %for.cond.cleanup268, %for.body246
  %acc248.0.lcssa = phi float [ 0.000000e+00, %for.body246 ], [ %acc248.1.lcssa, %for.cond.cleanup268 ]
  %add287 = add nsw i32 %46, %i_pos_y184.1968
  %mul289 = mul nsw i32 %47, %x236.0969
  %gep971 = getelementptr float, ptr %invariant.gep970, i32 %mul289
  store float %acc248.0.lcssa, ptr %gep971, align 4, !tbaa !15
  %inc297 = add nsw i32 %x236.0969, 1
  %exitcond1064.not = icmp eq i32 %inc297, %0
  br i1 %exitcond1064.not, label %for.cond.cleanup245, label %for.body246, !llvm.loop !32

for.cond.cleanup268:                              ; preds = %for.body269, %for.cond258.preheader
  %acc248.1.lcssa = phi float [ %acc248.0963, %for.cond258.preheader ], [ %59, %for.body269 ]
  %add.ptr281 = getelementptr inbounds float, ptr %f_data249.0964, i32 %mul10
  %add282 = add nsw i32 %i_pos_x247.0962, %mul
  %inc284 = add nuw nsw i32 %m251.0965, 1
  %exitcond1063.not = icmp eq i32 %inc284, %5
  br i1 %exitcond1063.not, label %for.cond.cleanup255, label %for.cond258.preheader, !llvm.loop !33

for.body269:                                      ; preds = %for.body269, %for.body269.lr.ph
  %n257.0959 = phi i32 [ 0, %for.body269.lr.ph ], [ %inc279, %for.body269 ]
  %acc248.1958 = phi float [ %acc248.0963, %for.body269.lr.ph ], [ %59, %for.body269 ]
  %mul271 = mul nsw i32 %46, %n257.0959
  %arrayidx273 = getelementptr float, ptr %55, i32 %mul271
  %57 = load float, ptr %arrayidx273, align 4, !tbaa !15
  %mul275 = mul nsw i32 %56, %n257.0959
  %arrayidx276 = getelementptr inbounds float, ptr %f_data249.0964, i32 %mul275
  %58 = load float, ptr %arrayidx276, align 4, !tbaa !15
  %59 = tail call float @llvm.fmuladd.f32(float %57, float %58, float %acc248.1958)
  %inc279 = add nuw nsw i32 %n257.0959, 1
  %cmp267 = icmp slt i32 %inc279, %sub266
  br i1 %cmp267, label %for.body269, label %for.cond.cleanup268, !llvm.loop !34

for.cond318.preheader:                            ; preds = %for.cond.cleanup444, %for.cond318.preheader.lr.ph
  %y306.01030 = phi i32 [ %sub180, %for.cond318.preheader.lr.ph ], [ %inc510, %for.cond.cleanup444 ]
  %i_pos.21029 = phi i32 [ 0, %for.cond318.preheader.lr.ph ], [ %add508, %for.cond.cleanup444 ]
  br i1 %cmp319989, label %for.body321.lr.ph, label %for.cond376.preheader

for.body321.lr.ph:                                ; preds = %for.cond318.preheader
  %60 = load ptr, ptr %filter, align 4, !tbaa !11
  %add333 = add i32 %sub330, %y306.01030
  %add334.neg = xor i32 %add333, -1
  %sub335 = add i32 %5, %add334.neg
  %cmp336983 = icmp sgt i32 %sub335, 0
  %61 = load i32, ptr %step_x346, align 4, !tbaa !14
  %62 = load i32, ptr %step_x364, align 4, !tbaa !14
  %63 = load i32, ptr %stride_x366, align 4, !tbaa !12
  %mul367 = mul nsw i32 %63, %y306.01030
  %64 = load i32, ptr %step_y368, align 4, !tbaa !13
  %mul369 = mul nsw i32 %mul367, %64
  %invariant.gep993 = getelementptr float, ptr %3, i32 %mul369
  br label %for.body321

for.cond513.preheader:                            ; preds = %for.cond.cleanup444, %for.cond311.preheader
  br i1 %cmp181973, label %for.cond523.preheader.lr.ph, label %for.cond.cleanup519

for.cond523.preheader.lr.ph:                      ; preds = %for.cond513.preheader
  %div526.neg = sdiv i32 %4, -2
  %sub527 = add i32 %0, %div526.neg
  %cmp5281041 = icmp slt i32 %shr, %sub527
  %cmp5381035 = icmp sgt i32 %5, 0
  %cmp5441031 = icmp sgt i32 %4, 0
  %step_x547 = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 1
  %step_x551 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 1
  %step_x565 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 1
  %stride_x567 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 3
  %step_y569 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 2
  br label %for.cond523.preheader

for.cond376.preheader:                            ; preds = %for.cond.cleanup337, %for.cond318.preheader
  %i_pos_y316.0.lcssa = phi i32 [ %i_pos.21029, %for.cond318.preheader ], [ %add363, %for.cond.cleanup337 ]
  br i1 %cmp3811005, label %for.body383.lr.ph, label %for.cond441.preheader

for.body383.lr.ph:                                ; preds = %for.cond376.preheader
  %65 = load ptr, ptr %filter, align 4, !tbaa !11
  %add395 = add i32 %sub330, %y306.01030
  %add396.neg = xor i32 %add395, -1
  %sub397 = add i32 %5, %add396.neg
  %cmp398999 = icmp sgt i32 %sub397, 0
  %66 = load i32, ptr %step_x346, align 4, !tbaa !14
  %67 = load i32, ptr %step_x364, align 4, !tbaa !14
  %68 = load i32, ptr %stride_x366, align 4, !tbaa !12
  %mul428 = mul nsw i32 %68, %y306.01030
  %69 = load i32, ptr %step_y368, align 4, !tbaa !13
  %mul430 = mul nsw i32 %mul428, %69
  %invariant.gep1011 = getelementptr float, ptr %3, i32 %mul430
  br label %for.body383

for.body321:                                      ; preds = %for.cond.cleanup337, %for.body321.lr.ph
  %x317.0991 = phi i32 [ 0, %for.body321.lr.ph ], [ %inc373, %for.cond.cleanup337 ]
  %i_pos_y316.0990 = phi i32 [ %i_pos.21029, %for.body321.lr.ph ], [ %add363, %for.cond.cleanup337 ]
  br i1 %cmp336983, label %for.body338.lr.ph, label %for.cond.cleanup337

for.body338.lr.ph:                                ; preds = %for.body321
  %sub340 = sub nsw i32 %shr, %x317.0991
  %cmp343979 = icmp slt i32 %sub340, %4
  br label %for.body338

for.cond.cleanup337:                              ; preds = %for.cond.cleanup344, %for.body321
  %acc323.0.lcssa = phi float [ 0.000000e+00, %for.body321 ], [ %acc323.1.lcssa, %for.cond.cleanup344 ]
  %add363 = add nsw i32 %61, %i_pos_y316.0990
  %mul365 = mul nsw i32 %62, %x317.0991
  %gep994 = getelementptr float, ptr %invariant.gep993, i32 %mul365
  store float %acc323.0.lcssa, ptr %gep994, align 4, !tbaa !15
  %inc373 = add nuw nsw i32 %x317.0991, 1
  %exitcond1066.not = icmp eq i32 %inc373, %shr
  br i1 %exitcond1066.not, label %for.cond376.preheader, label %for.body321, !llvm.loop !35

for.body338:                                      ; preds = %for.cond.cleanup344, %for.body338.lr.ph
  %m326.0987 = phi i32 [ 0, %for.body338.lr.ph ], [ %inc360, %for.cond.cleanup344 ]
  %f_data324.0986 = phi ptr [ %60, %for.body338.lr.ph ], [ %add.ptr357, %for.cond.cleanup344 ]
  %acc323.0985 = phi float [ 0.000000e+00, %for.body338.lr.ph ], [ %acc323.1.lcssa, %for.cond.cleanup344 ]
  %i_pos_x322.0984 = phi i32 [ %i_pos_y316.0990, %for.body338.lr.ph ], [ %add358, %for.cond.cleanup344 ]
  br i1 %cmp343979, label %for.body345.lr.ph, label %for.cond.cleanup344

for.body345.lr.ph:                                ; preds = %for.body338
  %70 = getelementptr float, ptr %2, i32 %i_pos_x322.0984
  %71 = load i32, ptr %step_x350, align 4, !tbaa !14
  br label %for.body345

for.cond.cleanup344:                              ; preds = %for.body345, %for.body338
  %acc323.1.lcssa = phi float [ %acc323.0985, %for.body338 ], [ %74, %for.body345 ]
  %add.ptr357 = getelementptr inbounds float, ptr %f_data324.0986, i32 %mul10
  %add358 = add nsw i32 %i_pos_x322.0984, %mul
  %inc360 = add nuw nsw i32 %m326.0987, 1
  %cmp336 = icmp slt i32 %inc360, %sub335
  br i1 %cmp336, label %for.body338, label %for.cond.cleanup337, !llvm.loop !36

for.body345:                                      ; preds = %for.body345, %for.body345.lr.ph
  %n339.0981 = phi i32 [ %sub340, %for.body345.lr.ph ], [ %inc355, %for.body345 ]
  %acc323.1980 = phi float [ %acc323.0985, %for.body345.lr.ph ], [ %74, %for.body345 ]
  %mul347 = mul nsw i32 %61, %n339.0981
  %arrayidx349 = getelementptr float, ptr %70, i32 %mul347
  %72 = load float, ptr %arrayidx349, align 4, !tbaa !15
  %mul351 = mul nsw i32 %71, %n339.0981
  %arrayidx352 = getelementptr inbounds float, ptr %f_data324.0986, i32 %mul351
  %73 = load float, ptr %arrayidx352, align 4, !tbaa !15
  %74 = tail call float @llvm.fmuladd.f32(float %72, float %73, float %acc323.1980)
  %inc355 = add nsw i32 %n339.0981, 1
  %cmp343 = icmp slt i32 %inc355, %4
  br i1 %cmp343, label %for.body345, label %for.cond.cleanup344, !llvm.loop !37

for.cond441.preheader:                            ; preds = %for.cond.cleanup399, %for.cond376.preheader
  %i_pos_y316.1.lcssa = phi i32 [ %i_pos_y316.0.lcssa, %for.cond376.preheader ], [ %add424, %for.cond.cleanup399 ]
  br i1 %cmp4431023, label %for.body445.lr.ph, label %for.cond.cleanup444

for.body445.lr.ph:                                ; preds = %for.cond441.preheader
  %75 = load ptr, ptr %filter, align 4, !tbaa !11
  %add457 = add i32 %sub330, %y306.01030
  %add458.neg = xor i32 %add457, -1
  %sub459 = add i32 %5, %add458.neg
  %cmp4601017 = icmp sgt i32 %sub459, 0
  %76 = load i32, ptr %step_x346, align 4, !tbaa !14
  %77 = load i32, ptr %step_x364, align 4, !tbaa !14
  %78 = load i32, ptr %stride_x366, align 4, !tbaa !12
  %mul497 = mul nsw i32 %78, %y306.01030
  %79 = load i32, ptr %step_y368, align 4, !tbaa !13
  %mul499 = mul nsw i32 %mul497, %79
  %invariant.gep1026 = getelementptr float, ptr %3, i32 %mul499
  br label %for.body445

for.body383:                                      ; preds = %for.cond.cleanup399, %for.body383.lr.ph
  %x375.01007 = phi i32 [ %shr, %for.body383.lr.ph ], [ %inc434, %for.cond.cleanup399 ]
  %i_pos_y316.11006 = phi i32 [ %i_pos_y316.0.lcssa, %for.body383.lr.ph ], [ %add424, %for.cond.cleanup399 ]
  br i1 %cmp398999, label %for.cond402.preheader, label %for.cond.cleanup399

for.cond402.preheader:                            ; preds = %for.cond.cleanup405, %for.body383
  %m388.01003 = phi i32 [ %inc421, %for.cond.cleanup405 ], [ 0, %for.body383 ]
  %f_data386.01002 = phi ptr [ %add.ptr418, %for.cond.cleanup405 ], [ %65, %for.body383 ]
  %acc385.01001 = phi float [ %acc385.1.lcssa, %for.cond.cleanup405 ], [ 0.000000e+00, %for.body383 ]
  %i_pos_x384.01000 = phi i32 [ %add419, %for.cond.cleanup405 ], [ %i_pos_y316.11006, %for.body383 ]
  br i1 %cmp404995, label %for.body406.lr.ph, label %for.cond.cleanup405

for.body406.lr.ph:                                ; preds = %for.cond402.preheader
  %80 = getelementptr float, ptr %2, i32 %i_pos_x384.01000
  %81 = load i32, ptr %step_x350, align 4, !tbaa !14
  br label %for.body406

for.cond.cleanup399:                              ; preds = %for.cond.cleanup405, %for.body383
  %acc385.0.lcssa = phi float [ 0.000000e+00, %for.body383 ], [ %acc385.1.lcssa, %for.cond.cleanup405 ]
  %add424 = add nsw i32 %66, %i_pos_y316.11006
  %mul426 = mul nsw i32 %67, %x375.01007
  %gep1012 = getelementptr float, ptr %invariant.gep1011, i32 %mul426
  store float %acc385.0.lcssa, ptr %gep1012, align 4, !tbaa !15
  %inc434 = add nsw i32 %x375.01007, 1
  %exitcond1068.not = icmp eq i32 %inc434, %sub380
  br i1 %exitcond1068.not, label %for.cond441.preheader, label %for.body383, !llvm.loop !38

for.cond.cleanup405:                              ; preds = %for.body406, %for.cond402.preheader
  %acc385.1.lcssa = phi float [ %acc385.01001, %for.cond402.preheader ], [ %84, %for.body406 ]
  %add.ptr418 = getelementptr inbounds float, ptr %f_data386.01002, i32 %mul10
  %add419 = add nsw i32 %i_pos_x384.01000, %mul
  %inc421 = add nuw nsw i32 %m388.01003, 1
  %cmp398 = icmp slt i32 %inc421, %sub397
  br i1 %cmp398, label %for.cond402.preheader, label %for.cond.cleanup399, !llvm.loop !39

for.body406:                                      ; preds = %for.body406, %for.body406.lr.ph
  %n401.0997 = phi i32 [ 0, %for.body406.lr.ph ], [ %inc416, %for.body406 ]
  %acc385.1996 = phi float [ %acc385.01001, %for.body406.lr.ph ], [ %84, %for.body406 ]
  %mul408 = mul nsw i32 %66, %n401.0997
  %arrayidx410 = getelementptr float, ptr %80, i32 %mul408
  %82 = load float, ptr %arrayidx410, align 4, !tbaa !15
  %mul412 = mul nsw i32 %81, %n401.0997
  %arrayidx413 = getelementptr inbounds float, ptr %f_data386.01002, i32 %mul412
  %83 = load float, ptr %arrayidx413, align 4, !tbaa !15
  %84 = tail call float @llvm.fmuladd.f32(float %82, float %83, float %acc385.1996)
  %inc416 = add nuw nsw i32 %n401.0997, 1
  %exitcond1067.not = icmp eq i32 %inc416, %4
  br i1 %exitcond1067.not, label %for.cond.cleanup405, label %for.body406, !llvm.loop !40

for.cond.cleanup444:                              ; preds = %for.cond.cleanup461, %for.cond441.preheader
  %add508 = add nsw i32 %i_pos.21029, %mul
  %inc510 = add nsw i32 %y306.01030, 1
  %exitcond1070.not = icmp eq i32 %inc510, %1
  br i1 %exitcond1070.not, label %for.cond513.preheader, label %for.cond318.preheader, !llvm.loop !41

for.body445:                                      ; preds = %for.cond.cleanup461, %for.body445.lr.ph
  %x436.01025 = phi i32 [ %sub380, %for.body445.lr.ph ], [ %inc503, %for.cond.cleanup461 ]
  %i_pos_y316.21024 = phi i32 [ %i_pos_y316.1.lcssa, %for.body445.lr.ph ], [ %add493, %for.cond.cleanup461 ]
  br i1 %cmp4601017, label %for.cond464.preheader.lr.ph, label %for.cond.cleanup461

for.cond464.preheader.lr.ph:                      ; preds = %for.body445
  %add470 = add i32 %sub467, %x436.01025
  %add471.neg = xor i32 %add470, -1
  %sub472 = add i32 %4, %add471.neg
  %cmp4731013 = icmp sgt i32 %sub472, 0
  br label %for.cond464.preheader

for.cond464.preheader:                            ; preds = %for.cond.cleanup474, %for.cond464.preheader.lr.ph
  %m450.01021 = phi i32 [ 0, %for.cond464.preheader.lr.ph ], [ %inc490, %for.cond.cleanup474 ]
  %f_data448.01020 = phi ptr [ %75, %for.cond464.preheader.lr.ph ], [ %add.ptr487, %for.cond.cleanup474 ]
  %acc447.01019 = phi float [ 0.000000e+00, %for.cond464.preheader.lr.ph ], [ %acc447.1.lcssa, %for.cond.cleanup474 ]
  %i_pos_x446.01018 = phi i32 [ %i_pos_y316.21024, %for.cond464.preheader.lr.ph ], [ %add488, %for.cond.cleanup474 ]
  br i1 %cmp4731013, label %for.body475.lr.ph, label %for.cond.cleanup474

for.body475.lr.ph:                                ; preds = %for.cond464.preheader
  %85 = getelementptr float, ptr %2, i32 %i_pos_x446.01018
  %86 = load i32, ptr %step_x350, align 4, !tbaa !14
  br label %for.body475

for.cond.cleanup461:                              ; preds = %for.cond.cleanup474, %for.body445
  %acc447.0.lcssa = phi float [ 0.000000e+00, %for.body445 ], [ %acc447.1.lcssa, %for.cond.cleanup474 ]
  %add493 = add nsw i32 %76, %i_pos_y316.21024
  %mul495 = mul nsw i32 %77, %x436.01025
  %gep1027 = getelementptr float, ptr %invariant.gep1026, i32 %mul495
  store float %acc447.0.lcssa, ptr %gep1027, align 4, !tbaa !15
  %inc503 = add nsw i32 %x436.01025, 1
  %exitcond1069.not = icmp eq i32 %inc503, %0
  br i1 %exitcond1069.not, label %for.cond.cleanup444, label %for.body445, !llvm.loop !42

for.cond.cleanup474:                              ; preds = %for.body475, %for.cond464.preheader
  %acc447.1.lcssa = phi float [ %acc447.01019, %for.cond464.preheader ], [ %89, %for.body475 ]
  %add.ptr487 = getelementptr inbounds float, ptr %f_data448.01020, i32 %mul10
  %add488 = add nsw i32 %i_pos_x446.01018, %mul
  %inc490 = add nuw nsw i32 %m450.01021, 1
  %cmp460 = icmp slt i32 %inc490, %sub459
  br i1 %cmp460, label %for.cond464.preheader, label %for.cond.cleanup461, !llvm.loop !43

for.body475:                                      ; preds = %for.body475, %for.body475.lr.ph
  %n463.01015 = phi i32 [ 0, %for.body475.lr.ph ], [ %inc485, %for.body475 ]
  %acc447.11014 = phi float [ %acc447.01019, %for.body475.lr.ph ], [ %89, %for.body475 ]
  %mul477 = mul nsw i32 %76, %n463.01015
  %arrayidx479 = getelementptr float, ptr %85, i32 %mul477
  %87 = load float, ptr %arrayidx479, align 4, !tbaa !15
  %mul481 = mul nsw i32 %86, %n463.01015
  %arrayidx482 = getelementptr inbounds float, ptr %f_data448.01020, i32 %mul481
  %88 = load float, ptr %arrayidx482, align 4, !tbaa !15
  %89 = tail call float @llvm.fmuladd.f32(float %87, float %88, float %acc447.11014)
  %inc485 = add nuw nsw i32 %n463.01015, 1
  %cmp473 = icmp slt i32 %inc485, %sub472
  br i1 %cmp473, label %for.body475, label %for.cond.cleanup474, !llvm.loop !44

for.cond523.preheader:                            ; preds = %for.cond.cleanup529, %for.cond523.preheader.lr.ph
  %y512.01048 = phi i32 [ %shr7, %for.cond523.preheader.lr.ph ], [ %inc581, %for.cond.cleanup529 ]
  %i_pos.31047 = phi i32 [ 0, %for.cond523.preheader.lr.ph ], [ %add579, %for.cond.cleanup529 ]
  br i1 %cmp5281041, label %for.body530.lr.ph, label %for.cond.cleanup529

for.body530.lr.ph:                                ; preds = %for.cond523.preheader
  %90 = load ptr, ptr %filter, align 4, !tbaa !11
  %91 = load i32, ptr %step_x547, align 4, !tbaa !14
  %92 = load i32, ptr %step_x565, align 4, !tbaa !14
  %93 = load i32, ptr %stride_x567, align 4, !tbaa !12
  %mul568 = mul nsw i32 %93, %y512.01048
  %94 = load i32, ptr %step_y569, align 4, !tbaa !13
  %mul570 = mul nsw i32 %mul568, %94
  %invariant.gep1044 = getelementptr float, ptr %3, i32 %mul570
  br label %for.body530

for.cond.cleanup519:                              ; preds = %for.cond.cleanup529, %for.cond513.preheader
  ret i32 0

for.cond.cleanup529:                              ; preds = %for.cond.cleanup539, %for.cond523.preheader
  %add579 = add nsw i32 %i_pos.31047, %mul
  %inc581 = add nsw i32 %y512.01048, 1
  %exitcond1074.not = icmp eq i32 %inc581, %sub180
  br i1 %exitcond1074.not, label %for.cond.cleanup519, label %for.cond523.preheader, !llvm.loop !45

for.body530:                                      ; preds = %for.cond.cleanup539, %for.body530.lr.ph
  %x522.01043 = phi i32 [ %shr, %for.body530.lr.ph ], [ %inc574, %for.cond.cleanup539 ]
  %i_pos_y521.01042 = phi i32 [ %i_pos.31047, %for.body530.lr.ph ], [ %add564, %for.cond.cleanup539 ]
  br i1 %cmp5381035, label %for.cond542.preheader, label %for.cond.cleanup539

for.cond542.preheader:                            ; preds = %for.cond.cleanup545, %for.body530
  %m535.01039 = phi i32 [ %inc561, %for.cond.cleanup545 ], [ 0, %for.body530 ]
  %f_data533.01038 = phi ptr [ %add.ptr558, %for.cond.cleanup545 ], [ %90, %for.body530 ]
  %acc532.01037 = phi float [ %acc532.1.lcssa, %for.cond.cleanup545 ], [ 0.000000e+00, %for.body530 ]
  %i_pos_x531.01036 = phi i32 [ %add559, %for.cond.cleanup545 ], [ %i_pos_y521.01042, %for.body530 ]
  br i1 %cmp5441031, label %for.body546.lr.ph, label %for.cond.cleanup545

for.body546.lr.ph:                                ; preds = %for.cond542.preheader
  %95 = getelementptr float, ptr %2, i32 %i_pos_x531.01036
  %96 = load i32, ptr %step_x551, align 4, !tbaa !14
  br label %for.body546

for.cond.cleanup539:                              ; preds = %for.cond.cleanup545, %for.body530
  %acc532.0.lcssa = phi float [ 0.000000e+00, %for.body530 ], [ %acc532.1.lcssa, %for.cond.cleanup545 ]
  %add564 = add nsw i32 %91, %i_pos_y521.01042
  %mul566 = mul nsw i32 %92, %x522.01043
  %gep1045 = getelementptr float, ptr %invariant.gep1044, i32 %mul566
  store float %acc532.0.lcssa, ptr %gep1045, align 4, !tbaa !15
  %inc574 = add nsw i32 %x522.01043, 1
  %exitcond1073.not = icmp eq i32 %inc574, %sub527
  br i1 %exitcond1073.not, label %for.cond.cleanup529, label %for.body530, !llvm.loop !46

for.cond.cleanup545:                              ; preds = %for.body546, %for.cond542.preheader
  %acc532.1.lcssa = phi float [ %acc532.01037, %for.cond542.preheader ], [ %99, %for.body546 ]
  %add.ptr558 = getelementptr inbounds float, ptr %f_data533.01038, i32 %mul10
  %add559 = add nsw i32 %i_pos_x531.01036, %mul
  %inc561 = add nuw nsw i32 %m535.01039, 1
  %exitcond1072.not = icmp eq i32 %inc561, %5
  br i1 %exitcond1072.not, label %for.cond.cleanup539, label %for.cond542.preheader, !llvm.loop !47

for.body546:                                      ; preds = %for.body546, %for.body546.lr.ph
  %n541.01033 = phi i32 [ 0, %for.body546.lr.ph ], [ %inc556, %for.body546 ]
  %acc532.11032 = phi float [ %acc532.01037, %for.body546.lr.ph ], [ %99, %for.body546 ]
  %mul548 = mul nsw i32 %91, %n541.01033
  %arrayidx550 = getelementptr float, ptr %95, i32 %mul548
  %97 = load float, ptr %arrayidx550, align 4, !tbaa !15
  %mul552 = mul nsw i32 %96, %n541.01033
  %arrayidx553 = getelementptr inbounds float, ptr %f_data533.01038, i32 %mul552
  %98 = load float, ptr %arrayidx553, align 4, !tbaa !15
  %99 = tail call float @llvm.fmuladd.f32(float %97, float %98, float %acc532.11032)
  %inc556 = add nuw nsw i32 %n541.01033, 1
  %exitcond1071.not = icmp eq i32 %inc556, %4
  br i1 %exitcond1071.not, label %for.cond.cleanup545, label %for.body546, !llvm.loop !48
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"}
!4 = !{!5, !9, i64 20}
!5 = !{!"image2d_s", !6, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!5, !9, i64 24}
!11 = !{!5, !6, i64 0}
!12 = !{!5, !9, i64 12}
!13 = !{!5, !9, i64 8}
!14 = !{!5, !9, i64 4}
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
