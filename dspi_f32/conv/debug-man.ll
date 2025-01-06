; ModuleID = 'after_customlicm.ll'
source_filename = "dspi_conv_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.image2d_s = type { ptr, i32, i32, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_conv_f32_ansi(ptr noalias nocapture noundef readonly %in_image, ptr noalias nocapture noundef readonly %filter, ptr noalias nocapture noundef %out_image) local_unnamed_addr #0 {
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
  %step_x29 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 1
  %10 = load i32, ptr %step_x29, align 4, !tbaa !14
  %step_y43 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 2
  %11 = load i32, ptr %step_y43, align 4, !tbaa !13
  %stride_x41 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 3
  %12 = load i32, ptr %stride_x41, align 4, !tbaa !12
  %step_x39 = getelementptr inbounds %struct.image2d_s, ptr %out_image, i32 0, i32 1
  %13 = load i32, ptr %step_x39, align 4, !tbaa !14
  %step_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 1
  %14 = load i32, ptr %step_x, align 4, !tbaa !14
  %15 = load ptr, ptr %filter, align 4, !tbaa !11
  %div526.neg = sdiv i32 %4, -2
  %sub527 = add i32 %0, %div526.neg
  %div332 = sdiv i32 %5, 2
  %sub330 = sub i32 %div332, %1
  %div469 = sdiv i32 %4, 2
  %sub467 = sub i32 %div469, %0
  %sub240 = add nsw i32 %div526.neg, -1
  %sub241 = add i32 %sub240, %0
  %sub109 = add nsw i32 %sub527, -1
  %mul2810 = shl nsw i32 %10, 1
  %mul3011 = mul nsw i32 %10, 3
  %mul31 = shl nsw i32 %10, 2
  %mul3112 = mul nsw i32 %10, 5
  %mul32 = mul nsw i32 %10, 6
  %mul33 = mul nsw i32 %10, 7
  %mul34 = shl nsw i32 %14, 1
  %mul35 = mul nsw i32 %14, 3
  %mul36 = shl nsw i32 %14, 2
  %mul37 = mul nsw i32 %14, 5
  %mul38 = mul nsw i32 %14, 6
  %mul39 = mul nsw i32 %14, 7
  %mul2813 = shl nsw i32 %10, 1
  %mul3014 = mul nsw i32 %10, 3
  %mul3115 = shl nsw i32 %10, 2
  %mul3116 = mul nsw i32 %10, 5
  %mul3217 = mul nsw i32 %10, 6
  %mul3318 = mul nsw i32 %10, 7
  %mul3419 = shl nsw i32 %14, 1
  %mul3520 = mul nsw i32 %14, 3
  %mul3621 = shl nsw i32 %14, 2
  %mul3722 = mul nsw i32 %14, 5
  %mul3823 = mul nsw i32 %14, 6
  %mul3924 = mul nsw i32 %14, 7
  %mul2826 = shl nsw i32 %10, 1
  %mul3027 = mul nsw i32 %10, 3
  %mul3128 = shl nsw i32 %10, 2
  %mul3129 = mul nsw i32 %10, 5
  %mul3230 = mul nsw i32 %10, 6
  %mul3331 = mul nsw i32 %10, 7
  %mul3432 = shl nsw i32 %14, 1
  %mul3533 = mul nsw i32 %14, 3
  %mul3634 = shl nsw i32 %14, 2
  %mul3735 = mul nsw i32 %14, 5
  %mul3836 = mul nsw i32 %14, 6
  %mul3937 = mul nsw i32 %14, 7
  %mul2839 = shl nsw i32 %10, 1
  %mul3040 = mul nsw i32 %10, 3
  %mul3141 = shl nsw i32 %10, 2
  %mul3142 = mul nsw i32 %10, 5
  %mul3243 = mul nsw i32 %10, 6
  %mul3344 = mul nsw i32 %10, 7
  %mul3445 = shl nsw i32 %14, 1
  %mul3546 = mul nsw i32 %14, 3
  %mul3647 = shl nsw i32 %14, 2
  %mul3748 = mul nsw i32 %14, 5
  %mul3849 = mul nsw i32 %14, 6
  %mul3950 = mul nsw i32 %14, 7
  %mul2852 = shl nsw i32 %10, 1
  %mul3053 = mul nsw i32 %10, 3
  %mul3154 = shl nsw i32 %10, 2
  %mul3155 = mul nsw i32 %10, 5
  %mul3256 = mul nsw i32 %10, 6
  %mul3357 = mul nsw i32 %10, 7
  %mul3458 = shl nsw i32 %14, 1
  %mul3559 = mul nsw i32 %14, 3
  %mul3660 = shl nsw i32 %14, 2
  %mul3761 = mul nsw i32 %14, 5
  %mul3862 = mul nsw i32 %14, 6
  %mul3963 = mul nsw i32 %14, 7
  %mul2865 = shl nsw i32 %10, 1
  %mul3066 = mul nsw i32 %10, 3
  %mul3167 = shl nsw i32 %10, 2
  %mul3168 = mul nsw i32 %10, 5
  %mul3269 = mul nsw i32 %10, 6
  %mul3370 = mul nsw i32 %10, 7
  %mul3471 = shl nsw i32 %14, 1
  %mul3572 = mul nsw i32 %14, 3
  %mul3673 = shl nsw i32 %14, 2
  %mul3774 = mul nsw i32 %14, 5
  %mul3875 = mul nsw i32 %14, 6
  %mul3976 = mul nsw i32 %14, 7
  %mul2878 = shl nsw i32 %10, 1
  %mul3079 = mul nsw i32 %10, 3
  %mul3180 = shl nsw i32 %10, 2
  %mul3181 = mul nsw i32 %10, 5
  %mul3282 = mul nsw i32 %10, 6
  %mul3383 = mul nsw i32 %10, 7
  %mul3484 = shl nsw i32 %14, 1
  %mul3585 = mul nsw i32 %14, 3
  %mul3686 = shl nsw i32 %14, 2
  %mul3787 = mul nsw i32 %14, 5
  %mul3888 = mul nsw i32 %14, 6
  %mul3989 = mul nsw i32 %14, 7
  %mul2891 = shl nsw i32 %10, 1
  %mul3092 = mul nsw i32 %10, 3
  %mul3193 = shl nsw i32 %10, 2
  %mul3194 = mul nsw i32 %10, 5
  %mul3295 = mul nsw i32 %10, 6
  %mul3396 = mul nsw i32 %10, 7
  %mul3497 = shl nsw i32 %14, 1
  %mul3598 = mul nsw i32 %14, 3
  %mul3699 = shl nsw i32 %14, 2
  %mul37100 = mul nsw i32 %14, 5
  %mul38101 = mul nsw i32 %14, 6
  %mul39102 = mul nsw i32 %14, 7
  %mul28104 = shl nsw i32 %10, 1
  %mul30105 = mul nsw i32 %10, 3
  %mul31106 = shl nsw i32 %10, 2
  %mul31107 = mul nsw i32 %10, 5
  %mul32108 = mul nsw i32 %10, 6
  %mul33109 = mul nsw i32 %10, 7
  %mul34110 = shl nsw i32 %14, 1
  %mul35111 = mul nsw i32 %14, 3
  %mul36112 = shl nsw i32 %14, 2
  %mul37113 = mul nsw i32 %14, 5
  %mul38114 = mul nsw i32 %14, 6
  %mul39115 = mul nsw i32 %14, 7
  br i1 %cmp938, label %for.cond11.preheader.lr.ph, label %for.cond176.preheader

for.cond11.preheader.lr.ph:                       ; preds = %entry
  %cmp12901 = icmp sgt i32 %shr, 0
  %cmp55915 = icmp slt i32 %shr, %sub527
  %cmp72905 = icmp sgt i32 %4, 0
  %cmp112933.not = icmp sgt i32 %sub527, %0
  br label %for.cond11.preheader

for.cond11.preheader:                             ; preds = %for.cond.cleanup113, %for.cond11.preheader.lr.ph
  %y.0940 = phi i32 [ 0, %for.cond11.preheader.lr.ph ], [ %inc173, %for.cond.cleanup113 ]
  %i_pos.0939 = phi i32 [ 0, %for.cond11.preheader.lr.ph ], [ %add171, %for.cond.cleanup113 ]
  %sub16 = sub nsw i32 %shr7, %y.0940
  %mul42 = mul nsw i32 %12, %y.0940
  %cmp19895 = icmp slt i32 %sub16, %5
  %mul44 = mul nsw i32 %mul42, %11
  %invariant.gep = getelementptr float, ptr %3, i32 %mul44
  br i1 %cmp12901, label %for.body14, label %for.cond51.preheader

for.cond176.preheader:                            ; preds = %for.cond.cleanup113, %entry
  %div179.neg = sdiv i32 %5, -2
  %sub180 = add i32 %1, %div179.neg
  %cmp181973 = icmp slt i32 %shr7, %sub180
  br i1 %cmp181973, label %for.cond186.preheader.lr.ph, label %for.cond311.preheader

for.cond186.preheader.lr.ph:                      ; preds = %for.cond176.preheader
  %cmp187951 = icmp sgt i32 %shr, 0
  %cmp197945 = icmp sgt i32 %5, 0
  %cmp244967 = icmp slt i32 %sub241, %0
  br label %for.cond186.preheader

for.cond51.preheader:                             ; preds = %for.cond.cleanup20, %for.cond11.preheader
  %i_pos_y.0.lcssa = phi i32 [ %i_pos.0939, %for.cond11.preheader ], [ %add38, %for.cond.cleanup20 ]
  br i1 %cmp55915, label %for.body57, label %for.cond.cleanup56

for.body14:                                       ; preds = %for.cond11.preheader, %for.cond.cleanup20
  %x.0903 = phi i32 [ %inc48, %for.cond.cleanup20 ], [ 0, %for.cond11.preheader ]
  %i_pos_y.0902 = phi i32 [ %add38, %for.cond.cleanup20 ], [ %i_pos.0939, %for.cond11.preheader ]
  %sub22 = sub nsw i32 %shr, %x.0903
  %cmp25892 = icmp slt i32 %sub22, %4
  br i1 %cmp19895, label %for.body21, label %for.cond.cleanup20

for.cond.cleanup20:                               ; preds = %for.cond.cleanup26, %for.body14
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.body14 ], [ %acc.1.lcssa, %for.cond.cleanup26 ]
  %add38 = add nsw i32 %14, %i_pos_y.0902
  %mul40 = mul nsw i32 %13, %x.0903
  %gep = getelementptr float, ptr %invariant.gep, i32 %mul40
  store float %acc.0.lcssa, ptr %gep, align 4, !tbaa !15
  %inc48 = add nuw nsw i32 %x.0903, 1
  %exitcond.not = icmp eq i32 %inc48, %shr
  br i1 %exitcond.not, label %for.cond51.preheader, label %for.body14, !llvm.loop !17

for.body21:                                       ; preds = %for.body14, %for.cond.cleanup26
  %m.0899 = phi i32 [ %inc35, %for.cond.cleanup26 ], [ %sub16, %for.body14 ]
  %f_data.0898 = phi ptr [ %add.ptr, %for.cond.cleanup26 ], [ %15, %for.body14 ]
  %acc.0897 = phi float [ %acc.1.lcssa, %for.cond.cleanup26 ], [ 0.000000e+00, %for.body14 ]
  %i_pos_x.0896 = phi i32 [ %add33, %for.cond.cleanup26 ], [ %i_pos_y.0902, %for.body14 ]
  %16 = getelementptr float, ptr %2, i32 %i_pos_x.0896
  %n1 = and i32 %4, -8
  br i1 %cmp25892, label %for.body27.7, label %for.cond.preheader

for.body27.7:                                     ; preds = %for.body27.7, %for.body21
  %n.0894 = phi i32 [ %inc.7, %for.body27.7 ], [ %sub22, %for.body21 ]
  %acc.1893 = phi float [ %40, %for.body27.7 ], [ %acc.0897, %for.body21 ]
  %mul28 = mul nsw i32 %14, %n.0894
  %arrayidx = getelementptr float, ptr %16, i32 %mul28
  %17 = load float, ptr %arrayidx, align 4, !tbaa !15
  %mul30 = mul nsw i32 %10, %n.0894
  %arrayidx31 = getelementptr inbounds float, ptr %f_data.0898, i32 %mul30
  %18 = load float, ptr %arrayidx31, align 4, !tbaa !15
  %19 = tail call float @llvm.fmuladd.f32(float %17, float %18, float %acc.1893)
  %inc = add nsw i32 %mul30, %10
  %mul28.1 = mul nsw i32 %14, %inc
  %arrayidx.1 = getelementptr float, ptr %arrayidx, i32 %14
  %20 = load float, ptr %arrayidx.1, align 4, !tbaa !15
  %arrayidx31.1 = getelementptr inbounds float, ptr %f_data.0898, i32 %inc
  %21 = load float, ptr %arrayidx31.1, align 4, !tbaa !15
  %22 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %19)
  %inc.1 = add nsw i32 %mul30, %mul2810
  %mul28.2 = mul nsw i32 %14, %inc.1
  %arrayidx.2 = getelementptr float, ptr %arrayidx, i32 %mul34
  %23 = load float, ptr %arrayidx.2, align 4, !tbaa !15
  %arrayidx31.2 = getelementptr inbounds float, ptr %f_data.0898, i32 %inc.1
  %24 = load float, ptr %arrayidx31.2, align 4, !tbaa !15
  %25 = tail call float @llvm.fmuladd.f32(float %23, float %24, float %22)
  %inc.2 = add nsw i32 %mul30, %mul3011
  %mul28.3 = mul nsw i32 %14, %inc.2
  %arrayidx.3 = getelementptr float, ptr %arrayidx, i32 %mul35
  %26 = load float, ptr %arrayidx.3, align 4, !tbaa !15
  %arrayidx31.3 = getelementptr inbounds float, ptr %f_data.0898, i32 %inc.2
  %27 = load float, ptr %arrayidx31.3, align 4, !tbaa !15
  %28 = tail call float @llvm.fmuladd.f32(float %26, float %27, float %25)
  %inc.3 = add nsw i32 %mul30, %mul31
  %mul28.4 = mul nsw i32 %14, %inc.3
  %arrayidx.4 = getelementptr float, ptr %arrayidx, i32 %mul36
  %29 = load float, ptr %arrayidx.4, align 4, !tbaa !15
  %arrayidx31.4 = getelementptr inbounds float, ptr %f_data.0898, i32 %inc.3
  %30 = load float, ptr %arrayidx31.4, align 4, !tbaa !15
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %28)
  %inc.4 = add nsw i32 %mul30, %mul3112
  %mul28.5 = mul nsw i32 %14, %inc.4
  %arrayidx.5 = getelementptr float, ptr %arrayidx, i32 %mul37
  %32 = load float, ptr %arrayidx.5, align 4, !tbaa !15
  %arrayidx31.5 = getelementptr inbounds float, ptr %f_data.0898, i32 %inc.4
  %33 = load float, ptr %arrayidx31.5, align 4, !tbaa !15
  %34 = tail call float @llvm.fmuladd.f32(float %32, float %33, float %31)
  %inc.5 = add nsw i32 %mul30, %mul32
  %mul28.6 = mul nsw i32 %14, %inc.5
  %arrayidx.6 = getelementptr float, ptr %arrayidx, i32 %mul38
  %35 = load float, ptr %arrayidx.6, align 4, !tbaa !15
  %arrayidx31.6 = getelementptr inbounds float, ptr %f_data.0898, i32 %inc.5
  %36 = load float, ptr %arrayidx31.6, align 4, !tbaa !15
  %37 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %34)
  %inc.6 = add nsw i32 %mul30, %mul33
  %mul28.7 = mul nsw i32 %14, %inc.6
  %arrayidx.7 = getelementptr float, ptr %arrayidx, i32 %mul39
  %38 = load float, ptr %arrayidx.7, align 4, !tbaa !15
  %arrayidx31.7 = getelementptr inbounds float, ptr %f_data.0898, i32 %inc.6
  %39 = load float, ptr %arrayidx31.7, align 4, !tbaa !15
  %40 = tail call float @llvm.fmuladd.f32(float %38, float %39, float %37)
  %inc.7 = add nsw i32 %mul30, 8
  %m1 = add nsw i32 %4, -7
  %cmp25.7 = icmp slt i32 %inc.7, %m1
  br i1 %cmp25.7, label %for.body27.7, label %for.cond.preheader, !llvm.loop !19

for.cond.preheader:                               ; preds = %for.body27.7, %for.body21
  %41 = phi float [ %40, %for.body27.7 ], [ %acc.0897, %for.body21 ]
  %42 = phi i32 [ %n1, %for.body27.7 ], [ %sub22, %for.body21 ]
  %43 = icmp slt i32 %42, %4
  br i1 %43, label %for.body27.clone.lr.ph, label %for.cond.cleanup26

for.body27.clone.lr.ph:                           ; preds = %for.cond.preheader
  %44 = getelementptr float, ptr %2, i32 %i_pos_x.0896
  br label %for.body27.clone

for.body27.clone:                                 ; preds = %for.body27.clone, %for.body27.clone.lr.ph
  %n.0894.clone = phi i32 [ %42, %for.body27.clone.lr.ph ], [ %inc.clone, %for.body27.clone ]
  %acc.1893.clone = phi float [ %41, %for.body27.clone.lr.ph ], [ %47, %for.body27.clone ]
  %mul28.clone = mul nsw i32 %14, %n.0894.clone
  %arrayidx.clone = getelementptr float, ptr %44, i32 %mul28.clone
  %45 = load float, ptr %arrayidx.clone, align 4, !tbaa !15
  %mul30.clone = mul nsw i32 %10, %n.0894.clone
  %arrayidx31.clone = getelementptr inbounds float, ptr %f_data.0898, i32 %mul30.clone
  %46 = load float, ptr %arrayidx31.clone, align 4, !tbaa !15
  %47 = tail call float @llvm.fmuladd.f32(float %45, float %46, float %acc.1893.clone)
  %inc.clone = add nsw i32 %n.0894.clone, 1
  %cmp25.clone = icmp eq i32 %inc.clone, %4
  br i1 %cmp25.clone, label %for.cond.cleanup26, label %for.body27.clone

for.cond.cleanup26:                               ; preds = %for.body27.clone, %for.cond.preheader
  %acc.1.lcssa = phi float [ %41, %for.cond.preheader ], [ %47, %for.body27.clone ]
  %add.ptr = getelementptr inbounds float, ptr %f_data.0898, i32 %mul10
  %add33 = add nsw i32 %i_pos_x.0896, %mul
  %inc35 = add nsw i32 %m.0899, 1
  %cmp19 = icmp slt i32 %inc35, %5
  br i1 %cmp19, label %for.body21, label %for.cond.cleanup20, !llvm.loop !20

for.cond.cleanup56:                               ; preds = %for.cond.cleanup67, %for.cond51.preheader
  %i_pos_y.1.lcssa = phi i32 [ %i_pos_y.0.lcssa, %for.cond51.preheader ], [ %add92, %for.cond.cleanup67 ]
  br i1 %cmp112933.not, label %for.cond.cleanup113, label %for.body114

for.body57:                                       ; preds = %for.cond51.preheader, %for.cond.cleanup67
  %x50.0917 = phi i32 [ %inc102, %for.cond.cleanup67 ], [ %shr, %for.cond51.preheader ]
  %i_pos_y.1916 = phi i32 [ %add92, %for.cond.cleanup67 ], [ %i_pos_y.0.lcssa, %for.cond51.preheader ]
  br i1 %cmp19895, label %for.cond70.preheader, label %for.cond.cleanup67

for.cond70.preheader:                             ; preds = %for.body57, %for.cond.cleanup73
  %m62.0913 = phi i32 [ %inc89, %for.cond.cleanup73 ], [ %sub16, %for.body57 ]
  %f_data60.0912 = phi ptr [ %add.ptr86, %for.cond.cleanup73 ], [ %15, %for.body57 ]
  %acc59.0911 = phi float [ %acc59.1.lcssa, %for.cond.cleanup73 ], [ 0.000000e+00, %for.body57 ]
  %i_pos_x58.0910 = phi i32 [ %add87, %for.cond.cleanup73 ], [ %i_pos_y.1916, %for.body57 ]
  %48 = getelementptr float, ptr %2, i32 %i_pos_x58.0910
  br i1 %cmp72905, label %for.body74.7, label %for.cond.preheader25

for.cond.cleanup67:                               ; preds = %for.cond.cleanup73, %for.body57
  %acc59.0.lcssa = phi float [ 0.000000e+00, %for.body57 ], [ %acc59.1.lcssa, %for.cond.cleanup73 ]
  %add92 = add nsw i32 %14, %i_pos_y.1916
  %mul94 = mul nsw i32 %13, %x50.0917
  %gep922 = getelementptr float, ptr %invariant.gep, i32 %mul94
  store float %acc59.0.lcssa, ptr %gep922, align 4, !tbaa !15
  %inc102 = add nsw i32 %x50.0917, 1
  %exitcond1058.not = icmp eq i32 %inc102, %sub527
  br i1 %exitcond1058.not, label %for.cond.cleanup56, label %for.body57, !llvm.loop !21

for.body74.7:                                     ; preds = %for.body74.7, %for.cond70.preheader
  %n69.0907 = phi i32 [ %inc84.7, %for.body74.7 ], [ 0, %for.cond70.preheader ]
  %acc59.1906 = phi float [ %72, %for.body74.7 ], [ %acc59.0911, %for.cond70.preheader ]
  %mul76 = mul nsw i32 %14, %n69.0907
  %arrayidx78 = getelementptr float, ptr %48, i32 %mul76
  %49 = load float, ptr %arrayidx78, align 4, !tbaa !15
  %mul80 = mul nsw i32 %10, %n69.0907
  %arrayidx81 = getelementptr inbounds float, ptr %f_data60.0912, i32 %mul80
  %50 = load float, ptr %arrayidx81, align 4, !tbaa !15
  %51 = tail call float @llvm.fmuladd.f32(float %49, float %50, float %acc59.1906)
  %inc84 = add nuw nsw i32 %mul80, %10
  %mul76.1 = mul nsw i32 %14, %inc84
  %arrayidx78.1 = getelementptr float, ptr %arrayidx78, i32 %14
  %52 = load float, ptr %arrayidx78.1, align 4, !tbaa !15
  %arrayidx81.1 = getelementptr inbounds float, ptr %f_data60.0912, i32 %inc84
  %53 = load float, ptr %arrayidx81.1, align 4, !tbaa !15
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %51)
  %inc84.1 = add nuw nsw i32 %mul80, %mul2813
  %mul76.2 = mul nsw i32 %14, %inc84.1
  %arrayidx78.2 = getelementptr float, ptr %arrayidx78, i32 %mul3419
  %55 = load float, ptr %arrayidx78.2, align 4, !tbaa !15
  %arrayidx81.2 = getelementptr inbounds float, ptr %f_data60.0912, i32 %inc84.1
  %56 = load float, ptr %arrayidx81.2, align 4, !tbaa !15
  %57 = tail call float @llvm.fmuladd.f32(float %55, float %56, float %54)
  %inc84.2 = add nuw nsw i32 %mul80, %mul3014
  %mul76.3 = mul nsw i32 %14, %inc84.2
  %arrayidx78.3 = getelementptr float, ptr %arrayidx78, i32 %mul3520
  %58 = load float, ptr %arrayidx78.3, align 4, !tbaa !15
  %arrayidx81.3 = getelementptr inbounds float, ptr %f_data60.0912, i32 %inc84.2
  %59 = load float, ptr %arrayidx81.3, align 4, !tbaa !15
  %60 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %57)
  %inc84.3 = add nuw nsw i32 %mul80, %mul3115
  %mul76.4 = mul nsw i32 %14, %inc84.3
  %arrayidx78.4 = getelementptr float, ptr %arrayidx78, i32 %mul3621
  %61 = load float, ptr %arrayidx78.4, align 4, !tbaa !15
  %arrayidx81.4 = getelementptr inbounds float, ptr %f_data60.0912, i32 %inc84.3
  %62 = load float, ptr %arrayidx81.4, align 4, !tbaa !15
  %63 = tail call float @llvm.fmuladd.f32(float %61, float %62, float %60)
  %inc84.4 = add nuw nsw i32 %mul80, %mul3116
  %mul76.5 = mul nsw i32 %14, %inc84.4
  %arrayidx78.5 = getelementptr float, ptr %arrayidx78, i32 %mul3722
  %64 = load float, ptr %arrayidx78.5, align 4, !tbaa !15
  %arrayidx81.5 = getelementptr inbounds float, ptr %f_data60.0912, i32 %inc84.4
  %65 = load float, ptr %arrayidx81.5, align 4, !tbaa !15
  %66 = tail call float @llvm.fmuladd.f32(float %64, float %65, float %63)
  %inc84.5 = add nuw nsw i32 %mul80, %mul3217
  %mul76.6 = mul nsw i32 %14, %inc84.5
  %arrayidx78.6 = getelementptr float, ptr %arrayidx78, i32 %mul3823
  %67 = load float, ptr %arrayidx78.6, align 4, !tbaa !15
  %arrayidx81.6 = getelementptr inbounds float, ptr %f_data60.0912, i32 %inc84.5
  %68 = load float, ptr %arrayidx81.6, align 4, !tbaa !15
  %69 = tail call float @llvm.fmuladd.f32(float %67, float %68, float %66)
  %inc84.6 = add nuw nsw i32 %mul80, %mul3318
  %mul76.7 = mul nsw i32 %14, %inc84.6
  %arrayidx78.7 = getelementptr float, ptr %arrayidx78, i32 %mul3924
  %70 = load float, ptr %arrayidx78.7, align 4, !tbaa !15
  %arrayidx81.7 = getelementptr inbounds float, ptr %f_data60.0912, i32 %inc84.6
  %71 = load float, ptr %arrayidx81.7, align 4, !tbaa !15
  %72 = tail call float @llvm.fmuladd.f32(float %70, float %71, float %69)
  %inc84.7 = add nuw nsw i32 %mul80, 8
  %m2 = add nsw i32 %4, -7
  %exitcond1057.not.7 = icmp slt i32 %inc84.7, %m2
  br i1 %exitcond1057.not.7, label %for.body74.7, label %for.cond.preheader25, !llvm.loop !22

for.cond.preheader25:                             ; preds = %for.body74.7, %for.cond70.preheader
  %73 = phi float [ %72, %for.body74.7 ], [ %acc59.0911, %for.cond70.preheader ]
  %74 = phi i32 [ %inc84.7, %for.body74.7 ], [ 0, %for.cond70.preheader ]
  %75 = icmp slt i32 %74, %4
  br i1 %75, label %for.body74.clone.lr.ph, label %for.cond.cleanup73

for.body74.clone.lr.ph:                           ; preds = %for.cond.preheader25
  %76 = getelementptr float, ptr %2, i32 %i_pos_x58.0910
  br label %for.body74.clone

for.body74.clone:                                 ; preds = %for.body74.clone, %for.body74.clone.lr.ph
  %n69.0907.clone = phi i32 [ %74, %for.body74.clone.lr.ph ], [ %inc84.clone, %for.body74.clone ]
  %acc59.1906.clone = phi float [ %73, %for.body74.clone.lr.ph ], [ %79, %for.body74.clone ]
  %mul76.clone = mul nsw i32 %14, %n69.0907.clone
  %arrayidx78.clone = getelementptr float, ptr %76, i32 %mul76.clone
  %77 = load float, ptr %arrayidx78.clone, align 4, !tbaa !15
  %mul80.clone = mul nsw i32 %10, %n69.0907.clone
  %arrayidx81.clone = getelementptr inbounds float, ptr %f_data60.0912, i32 %mul80.clone
  %78 = load float, ptr %arrayidx81.clone, align 4, !tbaa !15
  %79 = tail call float @llvm.fmuladd.f32(float %77, float %78, float %acc59.1906.clone)
  %inc84.clone = add nuw nsw i32 %n69.0907.clone, 1
  %exitcond1057.not.clone = icmp eq i32 %inc84.clone, %4
  br i1 %exitcond1057.not.clone, label %for.cond.cleanup73, label %for.body74.clone

for.cond.cleanup73:                               ; preds = %for.body74.clone, %for.cond.preheader25
  %acc59.1.lcssa = phi float [ %73, %for.cond.preheader25 ], [ %79, %for.body74.clone ]
  %add.ptr86 = getelementptr inbounds float, ptr %f_data60.0912, i32 %mul10
  %add87 = add nsw i32 %i_pos_x58.0910, %mul
  %inc89 = add nsw i32 %m62.0913, 1
  %cmp66 = icmp slt i32 %inc89, %5
  br i1 %cmp66, label %for.cond70.preheader, label %for.cond.cleanup67, !llvm.loop !23

for.cond.cleanup113:                              ; preds = %for.cond.cleanup124, %for.cond.cleanup56
  %add171 = add nsw i32 %i_pos.0939, %mul
  %inc173 = add nuw nsw i32 %y.0940, 1
  %exitcond1060.not = icmp eq i32 %inc173, %shr7
  br i1 %exitcond1060.not, label %for.cond176.preheader, label %for.cond11.preheader, !llvm.loop !24

for.body114:                                      ; preds = %for.cond.cleanup56, %for.cond.cleanup124
  %x104.0935 = phi i32 [ %inc166, %for.cond.cleanup124 ], [ %sub109, %for.cond.cleanup56 ]
  %i_pos_y.2934 = phi i32 [ %add156, %for.cond.cleanup124 ], [ %i_pos_y.1.lcssa, %for.cond.cleanup56 ]
  %add133 = add i32 %sub467, %x104.0935
  %add134.neg = xor i32 %add133, -1
  %sub135 = add i32 %4, %add134.neg
  %cmp136923 = icmp sgt i32 %sub135, 0
  br i1 %cmp19895, label %for.cond127.preheader, label %for.cond.cleanup124

for.cond127.preheader:                            ; preds = %for.body114, %for.cond.cleanup137
  %m119.0931 = phi i32 [ %inc153, %for.cond.cleanup137 ], [ %sub16, %for.body114 ]
  %f_data117.0930 = phi ptr [ %add.ptr150, %for.cond.cleanup137 ], [ %15, %for.body114 ]
  %acc116.0929 = phi float [ %acc116.1.lcssa, %for.cond.cleanup137 ], [ 0.000000e+00, %for.body114 ]
  %i_pos_x115.0928 = phi i32 [ %add151, %for.cond.cleanup137 ], [ %i_pos_y.2934, %for.body114 ]
  %80 = getelementptr float, ptr %2, i32 %i_pos_x115.0928
  br i1 %cmp136923, label %for.body138.7, label %for.cond.preheader38

for.cond.cleanup124:                              ; preds = %for.cond.cleanup137, %for.body114
  %acc116.0.lcssa = phi float [ 0.000000e+00, %for.body114 ], [ %acc116.1.lcssa, %for.cond.cleanup137 ]
  %add156 = add nsw i32 %14, %i_pos_y.2934
  %mul158 = mul nsw i32 %13, %x104.0935
  %gep937 = getelementptr float, ptr %invariant.gep, i32 %mul158
  store float %acc116.0.lcssa, ptr %gep937, align 4, !tbaa !15
  %inc166 = add nsw i32 %x104.0935, 1
  %exitcond1059.not = icmp eq i32 %inc166, %0
  br i1 %exitcond1059.not, label %for.cond.cleanup113, label %for.body114, !llvm.loop !25

for.body138.7:                                    ; preds = %for.body138.7, %for.cond127.preheader
  %n126.0925 = phi i32 [ %inc148.7, %for.body138.7 ], [ 0, %for.cond127.preheader ]
  %acc116.1924 = phi float [ %104, %for.body138.7 ], [ %acc116.0929, %for.cond127.preheader ]
  %mul140 = mul nsw i32 %14, %n126.0925
  %arrayidx142 = getelementptr float, ptr %80, i32 %mul140
  %81 = load float, ptr %arrayidx142, align 4, !tbaa !15
  %mul144 = mul nsw i32 %10, %n126.0925
  %arrayidx145 = getelementptr inbounds float, ptr %f_data117.0930, i32 %mul144
  %82 = load float, ptr %arrayidx145, align 4, !tbaa !15
  %83 = tail call float @llvm.fmuladd.f32(float %81, float %82, float %acc116.1924)
  %inc148 = add nuw nsw i32 %mul144, %10
  %mul140.1 = mul nsw i32 %14, %inc148
  %arrayidx142.1 = getelementptr float, ptr %arrayidx142, i32 %14
  %84 = load float, ptr %arrayidx142.1, align 4, !tbaa !15
  %arrayidx145.1 = getelementptr inbounds float, ptr %f_data117.0930, i32 %inc148
  %85 = load float, ptr %arrayidx145.1, align 4, !tbaa !15
  %86 = tail call float @llvm.fmuladd.f32(float %84, float %85, float %83)
  %inc148.1 = add nuw nsw i32 %mul144, %mul2826
  %mul140.2 = mul nsw i32 %14, %inc148.1
  %arrayidx142.2 = getelementptr float, ptr %arrayidx142, i32 %mul3432
  %87 = load float, ptr %arrayidx142.2, align 4, !tbaa !15
  %arrayidx145.2 = getelementptr inbounds float, ptr %f_data117.0930, i32 %inc148.1
  %88 = load float, ptr %arrayidx145.2, align 4, !tbaa !15
  %89 = tail call float @llvm.fmuladd.f32(float %87, float %88, float %86)
  %inc148.2 = add nuw nsw i32 %mul144, %mul3027
  %mul140.3 = mul nsw i32 %14, %inc148.2
  %arrayidx142.3 = getelementptr float, ptr %arrayidx142, i32 %mul3533
  %90 = load float, ptr %arrayidx142.3, align 4, !tbaa !15
  %arrayidx145.3 = getelementptr inbounds float, ptr %f_data117.0930, i32 %inc148.2
  %91 = load float, ptr %arrayidx145.3, align 4, !tbaa !15
  %92 = tail call float @llvm.fmuladd.f32(float %90, float %91, float %89)
  %inc148.3 = add nuw nsw i32 %mul144, %mul3128
  %mul140.4 = mul nsw i32 %14, %inc148.3
  %arrayidx142.4 = getelementptr float, ptr %arrayidx142, i32 %mul3634
  %93 = load float, ptr %arrayidx142.4, align 4, !tbaa !15
  %arrayidx145.4 = getelementptr inbounds float, ptr %f_data117.0930, i32 %inc148.3
  %94 = load float, ptr %arrayidx145.4, align 4, !tbaa !15
  %95 = tail call float @llvm.fmuladd.f32(float %93, float %94, float %92)
  %inc148.4 = add nuw nsw i32 %mul144, %mul3129
  %mul140.5 = mul nsw i32 %14, %inc148.4
  %arrayidx142.5 = getelementptr float, ptr %arrayidx142, i32 %mul3735
  %96 = load float, ptr %arrayidx142.5, align 4, !tbaa !15
  %arrayidx145.5 = getelementptr inbounds float, ptr %f_data117.0930, i32 %inc148.4
  %97 = load float, ptr %arrayidx145.5, align 4, !tbaa !15
  %98 = tail call float @llvm.fmuladd.f32(float %96, float %97, float %95)
  %inc148.5 = add nuw nsw i32 %mul144, %mul3230
  %mul140.6 = mul nsw i32 %14, %inc148.5
  %arrayidx142.6 = getelementptr float, ptr %arrayidx142, i32 %mul3836
  %99 = load float, ptr %arrayidx142.6, align 4, !tbaa !15
  %arrayidx145.6 = getelementptr inbounds float, ptr %f_data117.0930, i32 %inc148.5
  %100 = load float, ptr %arrayidx145.6, align 4, !tbaa !15
  %101 = tail call float @llvm.fmuladd.f32(float %99, float %100, float %98)
  %inc148.6 = add nuw nsw i32 %mul144, %mul3331
  %mul140.7 = mul nsw i32 %14, %inc148.6
  %arrayidx142.7 = getelementptr float, ptr %arrayidx142, i32 %mul3937
  %102 = load float, ptr %arrayidx142.7, align 4, !tbaa !15
  %arrayidx145.7 = getelementptr inbounds float, ptr %f_data117.0930, i32 %inc148.6
  %103 = load float, ptr %arrayidx145.7, align 4, !tbaa !15
  %104 = tail call float @llvm.fmuladd.f32(float %102, float %103, float %101)
  %inc148.7 = add nuw nsw i32 %mul144, 8
  %m3 = add nsw i32 %sub135, -7
  %cmp136.7 = icmp slt i32 %inc148.7, %m3
  br i1 %cmp136.7, label %for.body138.7, label %for.cond.preheader38, !llvm.loop !26

for.cond.preheader38:                             ; preds = %for.body138.7, %for.cond127.preheader
  %105 = phi float [ %104, %for.body138.7 ], [ %acc116.0929, %for.cond127.preheader ]
  %106 = phi i32 [ %inc148.7, %for.body138.7 ], [ 0, %for.cond127.preheader ]
  %107 = icmp slt i32 %106, %sub135
  br i1 %107, label %for.body138.clone.lr.ph, label %for.cond.cleanup137

for.body138.clone.lr.ph:                          ; preds = %for.cond.preheader38
  %108 = getelementptr float, ptr %2, i32 %i_pos_x115.0928
  br label %for.body138.clone

for.body138.clone:                                ; preds = %for.body138.clone, %for.body138.clone.lr.ph
  %n126.0925.clone = phi i32 [ %106, %for.body138.clone.lr.ph ], [ %inc148.clone, %for.body138.clone ]
  %acc116.1924.clone = phi float [ %105, %for.body138.clone.lr.ph ], [ %111, %for.body138.clone ]
  %mul140.clone = mul nsw i32 %14, %n126.0925.clone
  %arrayidx142.clone = getelementptr float, ptr %108, i32 %mul140.clone
  %109 = load float, ptr %arrayidx142.clone, align 4, !tbaa !15
  %mul144.clone = mul nsw i32 %10, %n126.0925.clone
  %arrayidx145.clone = getelementptr inbounds float, ptr %f_data117.0930, i32 %mul144.clone
  %110 = load float, ptr %arrayidx145.clone, align 4, !tbaa !15
  %111 = tail call float @llvm.fmuladd.f32(float %109, float %110, float %acc116.1924.clone)
  %inc148.clone = add nuw nsw i32 %n126.0925.clone, 1
  %cmp136.clone = icmp eq i32 %inc148.clone, %sub135
  br i1 %cmp136.clone, label %for.cond.cleanup137, label %for.body138.clone

for.cond.cleanup137:                              ; preds = %for.body138.clone, %for.cond.preheader38
  %acc116.1.lcssa = phi float [ %105, %for.cond.preheader38 ], [ %111, %for.body138.clone ]
  %add.ptr150 = getelementptr inbounds float, ptr %f_data117.0930, i32 %mul10
  %add151 = add nsw i32 %i_pos_x115.0928, %mul
  %inc153 = add nsw i32 %m119.0931, 1
  %cmp123 = icmp slt i32 %inc153, %5
  br i1 %cmp123, label %for.cond127.preheader, label %for.cond.cleanup124, !llvm.loop !27

for.cond186.preheader:                            ; preds = %for.cond.cleanup245, %for.cond186.preheader.lr.ph
  %y175.0975 = phi i32 [ %shr7, %for.cond186.preheader.lr.ph ], [ %inc304, %for.cond.cleanup245 ]
  %i_pos.1974 = phi i32 [ 0, %for.cond186.preheader.lr.ph ], [ %add302, %for.cond.cleanup245 ]
  %mul228 = mul nsw i32 %12, %y175.0975
  %mul230 = mul nsw i32 %mul228, %11
  %invariant.gep955 = getelementptr float, ptr %3, i32 %mul230
  br i1 %cmp187951, label %for.body189, label %for.cond.cleanup188

for.cond311.preheader:                            ; preds = %for.cond.cleanup245, %for.cond176.preheader
  %cmp3131028 = icmp slt i32 %sub180, %1
  br i1 %cmp3131028, label %for.cond318.preheader.lr.ph, label %for.cond513.preheader

for.cond318.preheader.lr.ph:                      ; preds = %for.cond311.preheader
  %cmp319989 = icmp sgt i32 %shr, 0
  %cmp3811005 = icmp slt i32 %shr, %sub527
  %cmp404995 = icmp sgt i32 %4, 0
  %cmp4431023 = icmp slt i32 %sub527, %0
  br label %for.cond318.preheader

for.cond.cleanup188:                              ; preds = %for.cond.cleanup198, %for.cond186.preheader
  %i_pos_y184.0.lcssa = phi i32 [ %i_pos.1974, %for.cond186.preheader ], [ %add224, %for.cond.cleanup198 ]
  br i1 %cmp244967, label %for.body246, label %for.cond.cleanup245

for.body189:                                      ; preds = %for.cond186.preheader, %for.cond.cleanup198
  %x185.0953 = phi i32 [ %inc234, %for.cond.cleanup198 ], [ 0, %for.cond186.preheader ]
  %i_pos_y184.0952 = phi i32 [ %add224, %for.cond.cleanup198 ], [ %i_pos.1974, %for.cond186.preheader ]
  %sub201 = sub nsw i32 %shr, %x185.0953
  %cmp204941 = icmp slt i32 %sub201, %4
  br i1 %cmp197945, label %for.body199, label %for.cond.cleanup198

for.cond.cleanup198:                              ; preds = %for.cond.cleanup205, %for.body189
  %acc191.0.lcssa = phi float [ 0.000000e+00, %for.body189 ], [ %acc191.1.lcssa, %for.cond.cleanup205 ]
  %add224 = add nsw i32 %14, %i_pos_y184.0952
  %mul226 = mul nsw i32 %13, %x185.0953
  %gep956 = getelementptr float, ptr %invariant.gep955, i32 %mul226
  store float %acc191.0.lcssa, ptr %gep956, align 4, !tbaa !15
  %inc234 = add nuw nsw i32 %x185.0953, 1
  %exitcond1062.not = icmp eq i32 %inc234, %shr
  br i1 %exitcond1062.not, label %for.cond.cleanup188, label %for.body189, !llvm.loop !28

for.body199:                                      ; preds = %for.body189, %for.cond.cleanup205
  %m194.0949 = phi i32 [ %inc221, %for.cond.cleanup205 ], [ 0, %for.body189 ]
  %f_data192.0948 = phi ptr [ %add.ptr218, %for.cond.cleanup205 ], [ %15, %for.body189 ]
  %acc191.0947 = phi float [ %acc191.1.lcssa, %for.cond.cleanup205 ], [ 0.000000e+00, %for.body189 ]
  %i_pos_x190.0946 = phi i32 [ %add219, %for.cond.cleanup205 ], [ %i_pos_y184.0952, %for.body189 ]
  %112 = getelementptr float, ptr %2, i32 %i_pos_x190.0946
  br i1 %cmp204941, label %for.body206.7, label %for.cond.preheader51

for.body206.7:                                    ; preds = %for.body206.7, %for.body199
  %n200.0943 = phi i32 [ %inc216.7, %for.body206.7 ], [ %sub201, %for.body199 ]
  %acc191.1942 = phi float [ %136, %for.body206.7 ], [ %acc191.0947, %for.body199 ]
  %mul208 = mul nsw i32 %14, %n200.0943
  %arrayidx210 = getelementptr float, ptr %112, i32 %mul208
  %113 = load float, ptr %arrayidx210, align 4, !tbaa !15
  %mul212 = mul nsw i32 %10, %n200.0943
  %arrayidx213 = getelementptr inbounds float, ptr %f_data192.0948, i32 %mul212
  %114 = load float, ptr %arrayidx213, align 4, !tbaa !15
  %115 = tail call float @llvm.fmuladd.f32(float %113, float %114, float %acc191.1942)
  %inc216 = add nsw i32 %mul212, %10
  %mul208.1 = mul nsw i32 %14, %inc216
  %arrayidx210.1 = getelementptr float, ptr %arrayidx210, i32 %14
  %116 = load float, ptr %arrayidx210.1, align 4, !tbaa !15
  %arrayidx213.1 = getelementptr inbounds float, ptr %f_data192.0948, i32 %inc216
  %117 = load float, ptr %arrayidx213.1, align 4, !tbaa !15
  %118 = tail call float @llvm.fmuladd.f32(float %116, float %117, float %115)
  %inc216.1 = add nsw i32 %mul212, %mul2839
  %mul208.2 = mul nsw i32 %14, %inc216.1
  %arrayidx210.2 = getelementptr float, ptr %arrayidx210, i32 %mul3445
  %119 = load float, ptr %arrayidx210.2, align 4, !tbaa !15
  %arrayidx213.2 = getelementptr inbounds float, ptr %f_data192.0948, i32 %inc216.1
  %120 = load float, ptr %arrayidx213.2, align 4, !tbaa !15
  %121 = tail call float @llvm.fmuladd.f32(float %119, float %120, float %118)
  %inc216.2 = add nsw i32 %mul212, %mul3040
  %mul208.3 = mul nsw i32 %14, %inc216.2
  %arrayidx210.3 = getelementptr float, ptr %arrayidx210, i32 %mul3546
  %122 = load float, ptr %arrayidx210.3, align 4, !tbaa !15
  %arrayidx213.3 = getelementptr inbounds float, ptr %f_data192.0948, i32 %inc216.2
  %123 = load float, ptr %arrayidx213.3, align 4, !tbaa !15
  %124 = tail call float @llvm.fmuladd.f32(float %122, float %123, float %121)
  %inc216.3 = add nsw i32 %mul212, %mul3141
  %mul208.4 = mul nsw i32 %14, %inc216.3
  %arrayidx210.4 = getelementptr float, ptr %arrayidx210, i32 %mul3647
  %125 = load float, ptr %arrayidx210.4, align 4, !tbaa !15
  %arrayidx213.4 = getelementptr inbounds float, ptr %f_data192.0948, i32 %inc216.3
  %126 = load float, ptr %arrayidx213.4, align 4, !tbaa !15
  %127 = tail call float @llvm.fmuladd.f32(float %125, float %126, float %124)
  %inc216.4 = add nsw i32 %mul212, %mul3142
  %mul208.5 = mul nsw i32 %14, %inc216.4
  %arrayidx210.5 = getelementptr float, ptr %arrayidx210, i32 %mul3748
  %128 = load float, ptr %arrayidx210.5, align 4, !tbaa !15
  %arrayidx213.5 = getelementptr inbounds float, ptr %f_data192.0948, i32 %inc216.4
  %129 = load float, ptr %arrayidx213.5, align 4, !tbaa !15
  %130 = tail call float @llvm.fmuladd.f32(float %128, float %129, float %127)
  %inc216.5 = add nsw i32 %mul212, %mul3243
  %mul208.6 = mul nsw i32 %14, %inc216.5
  %arrayidx210.6 = getelementptr float, ptr %arrayidx210, i32 %mul3849
  %131 = load float, ptr %arrayidx210.6, align 4, !tbaa !15
  %arrayidx213.6 = getelementptr inbounds float, ptr %f_data192.0948, i32 %inc216.5
  %132 = load float, ptr %arrayidx213.6, align 4, !tbaa !15
  %133 = tail call float @llvm.fmuladd.f32(float %131, float %132, float %130)
  %inc216.6 = add nsw i32 %mul212, %mul3344
  %mul208.7 = mul nsw i32 %14, %inc216.6
  %arrayidx210.7 = getelementptr float, ptr %arrayidx210, i32 %mul3950
  %134 = load float, ptr %arrayidx210.7, align 4, !tbaa !15
  %arrayidx213.7 = getelementptr inbounds float, ptr %f_data192.0948, i32 %inc216.6
  %135 = load float, ptr %arrayidx213.7, align 4, !tbaa !15
  %136 = tail call float @llvm.fmuladd.f32(float %134, float %135, float %133)
  %inc216.7 = add nsw i32 %mul212, 8
  %m4 = add nsw i32 %4, -7
  %cmp204.7 = icmp slt i32 %inc216.7, %m4
  br i1 %cmp204.7, label %for.body206.7, label %for.cond.preheader51, !llvm.loop !29

for.cond.preheader51:                             ; preds = %for.body206.7, %for.body199
  %137 = phi float [ %136, %for.body206.7 ], [ %acc191.0947, %for.body199 ]
  %138 = phi i32 [ %inc216.7, %for.body206.7 ], [ %sub201, %for.body199 ]
  %139 = icmp slt i32 %138, %4
  br i1 %139, label %for.body206.clone.lr.ph, label %for.cond.cleanup205

for.body206.clone.lr.ph:                          ; preds = %for.cond.preheader51
  %140 = getelementptr float, ptr %2, i32 %i_pos_x190.0946
  br label %for.body206.clone

for.body206.clone:                                ; preds = %for.body206.clone, %for.body206.clone.lr.ph
  %n200.0943.clone = phi i32 [ %138, %for.body206.clone.lr.ph ], [ %inc216.clone, %for.body206.clone ]
  %acc191.1942.clone = phi float [ %137, %for.body206.clone.lr.ph ], [ %143, %for.body206.clone ]
  %mul208.clone = mul nsw i32 %14, %n200.0943.clone
  %arrayidx210.clone = getelementptr float, ptr %140, i32 %mul208.clone
  %141 = load float, ptr %arrayidx210.clone, align 4, !tbaa !15
  %mul212.clone = mul nsw i32 %10, %n200.0943.clone
  %arrayidx213.clone = getelementptr inbounds float, ptr %f_data192.0948, i32 %mul212.clone
  %142 = load float, ptr %arrayidx213.clone, align 4, !tbaa !15
  %143 = tail call float @llvm.fmuladd.f32(float %141, float %142, float %acc191.1942.clone)
  %inc216.clone = add nsw i32 %n200.0943.clone, 1
  %cmp204.clone = icmp eq i32 %inc216.clone, %4
  br i1 %cmp204.clone, label %for.cond.cleanup205, label %for.body206.clone

for.cond.cleanup205:                              ; preds = %for.body206.clone, %for.cond.preheader51
  %acc191.1.lcssa = phi float [ %137, %for.cond.preheader51 ], [ %143, %for.body206.clone ]
  %add.ptr218 = getelementptr inbounds float, ptr %f_data192.0948, i32 %mul10
  %add219 = add nsw i32 %i_pos_x190.0946, %mul
  %inc221 = add nuw nsw i32 %m194.0949, 1
  %exitcond1061.not = icmp eq i32 %inc221, %5
  br i1 %exitcond1061.not, label %for.cond.cleanup198, label %for.body199, !llvm.loop !30

for.cond.cleanup245:                              ; preds = %for.cond.cleanup255, %for.cond.cleanup188
  %add302 = add nsw i32 %i_pos.1974, %mul
  %inc304 = add nsw i32 %y175.0975, 1
  %exitcond1065.not = icmp eq i32 %inc304, %sub180
  br i1 %exitcond1065.not, label %for.cond311.preheader, label %for.cond186.preheader, !llvm.loop !31

for.body246:                                      ; preds = %for.cond.cleanup188, %for.cond.cleanup255
  %x236.0969 = phi i32 [ %inc297, %for.cond.cleanup255 ], [ %sub241, %for.cond.cleanup188 ]
  %i_pos_y184.1968 = phi i32 [ %add287, %for.cond.cleanup255 ], [ %i_pos_y184.0.lcssa, %for.cond.cleanup188 ]
  %add264 = add i32 %sub467, %x236.0969
  %add265.neg = xor i32 %add264, -1
  %sub266 = add i32 %4, %add265.neg
  %cmp267957 = icmp sgt i32 %sub266, 0
  br i1 %cmp197945, label %for.cond258.preheader, label %for.cond.cleanup255

for.cond258.preheader:                            ; preds = %for.body246, %for.cond.cleanup268
  %m251.0965 = phi i32 [ %inc284, %for.cond.cleanup268 ], [ 0, %for.body246 ]
  %f_data249.0964 = phi ptr [ %add.ptr281, %for.cond.cleanup268 ], [ %15, %for.body246 ]
  %acc248.0963 = phi float [ %acc248.1.lcssa, %for.cond.cleanup268 ], [ 0.000000e+00, %for.body246 ]
  %i_pos_x247.0962 = phi i32 [ %add282, %for.cond.cleanup268 ], [ %i_pos_y184.1968, %for.body246 ]
  %144 = getelementptr float, ptr %2, i32 %i_pos_x247.0962
  br i1 %cmp267957, label %for.body269.7, label %for.cond.preheader64

for.cond.cleanup255:                              ; preds = %for.cond.cleanup268, %for.body246
  %acc248.0.lcssa = phi float [ 0.000000e+00, %for.body246 ], [ %acc248.1.lcssa, %for.cond.cleanup268 ]
  %add287 = add nsw i32 %14, %i_pos_y184.1968
  %mul289 = mul nsw i32 %13, %x236.0969
  %gep971 = getelementptr float, ptr %invariant.gep955, i32 %mul289
  store float %acc248.0.lcssa, ptr %gep971, align 4, !tbaa !15
  %inc297 = add nsw i32 %x236.0969, 1
  %exitcond1064.not = icmp eq i32 %inc297, %0
  br i1 %exitcond1064.not, label %for.cond.cleanup245, label %for.body246, !llvm.loop !32

for.body269.7:                                    ; preds = %for.body269.7, %for.cond258.preheader
  %n257.0959 = phi i32 [ %inc279.7, %for.body269.7 ], [ 0, %for.cond258.preheader ]
  %acc248.1958 = phi float [ %168, %for.body269.7 ], [ %acc248.0963, %for.cond258.preheader ]
  %mul271 = mul nsw i32 %14, %n257.0959
  %arrayidx273 = getelementptr float, ptr %144, i32 %mul271
  %145 = load float, ptr %arrayidx273, align 4, !tbaa !15
  %mul275 = mul nsw i32 %10, %n257.0959
  %arrayidx276 = getelementptr inbounds float, ptr %f_data249.0964, i32 %mul275
  %146 = load float, ptr %arrayidx276, align 4, !tbaa !15
  %147 = tail call float @llvm.fmuladd.f32(float %145, float %146, float %acc248.1958)
  %inc279 = add nuw nsw i32 %mul275, %10
  %mul271.1 = mul nsw i32 %14, %inc279
  %arrayidx273.1 = getelementptr float, ptr %arrayidx273, i32 %14
  %148 = load float, ptr %arrayidx273.1, align 4, !tbaa !15
  %arrayidx276.1 = getelementptr inbounds float, ptr %f_data249.0964, i32 %inc279
  %149 = load float, ptr %arrayidx276.1, align 4, !tbaa !15
  %150 = tail call float @llvm.fmuladd.f32(float %148, float %149, float %147)
  %inc279.1 = add nuw nsw i32 %mul275, %mul2852
  %mul271.2 = mul nsw i32 %14, %inc279.1
  %arrayidx273.2 = getelementptr float, ptr %arrayidx273, i32 %mul3458
  %151 = load float, ptr %arrayidx273.2, align 4, !tbaa !15
  %arrayidx276.2 = getelementptr inbounds float, ptr %f_data249.0964, i32 %inc279.1
  %152 = load float, ptr %arrayidx276.2, align 4, !tbaa !15
  %153 = tail call float @llvm.fmuladd.f32(float %151, float %152, float %150)
  %inc279.2 = add nuw nsw i32 %mul275, %mul3053
  %mul271.3 = mul nsw i32 %14, %inc279.2
  %arrayidx273.3 = getelementptr float, ptr %arrayidx273, i32 %mul3559
  %154 = load float, ptr %arrayidx273.3, align 4, !tbaa !15
  %arrayidx276.3 = getelementptr inbounds float, ptr %f_data249.0964, i32 %inc279.2
  %155 = load float, ptr %arrayidx276.3, align 4, !tbaa !15
  %156 = tail call float @llvm.fmuladd.f32(float %154, float %155, float %153)
  %inc279.3 = add nuw nsw i32 %mul275, %mul3154
  %mul271.4 = mul nsw i32 %14, %inc279.3
  %arrayidx273.4 = getelementptr float, ptr %arrayidx273, i32 %mul3660
  %157 = load float, ptr %arrayidx273.4, align 4, !tbaa !15
  %arrayidx276.4 = getelementptr inbounds float, ptr %f_data249.0964, i32 %inc279.3
  %158 = load float, ptr %arrayidx276.4, align 4, !tbaa !15
  %159 = tail call float @llvm.fmuladd.f32(float %157, float %158, float %156)
  %inc279.4 = add nuw nsw i32 %mul275, %mul3155
  %mul271.5 = mul nsw i32 %14, %inc279.4
  %arrayidx273.5 = getelementptr float, ptr %arrayidx273, i32 %mul3761
  %160 = load float, ptr %arrayidx273.5, align 4, !tbaa !15
  %arrayidx276.5 = getelementptr inbounds float, ptr %f_data249.0964, i32 %inc279.4
  %161 = load float, ptr %arrayidx276.5, align 4, !tbaa !15
  %162 = tail call float @llvm.fmuladd.f32(float %160, float %161, float %159)
  %inc279.5 = add nuw nsw i32 %mul275, %mul3256
  %mul271.6 = mul nsw i32 %14, %inc279.5
  %arrayidx273.6 = getelementptr float, ptr %arrayidx273, i32 %mul3862
  %163 = load float, ptr %arrayidx273.6, align 4, !tbaa !15
  %arrayidx276.6 = getelementptr inbounds float, ptr %f_data249.0964, i32 %inc279.5
  %164 = load float, ptr %arrayidx276.6, align 4, !tbaa !15
  %165 = tail call float @llvm.fmuladd.f32(float %163, float %164, float %162)
  %inc279.6 = add nuw nsw i32 %mul275, %mul3357
  %mul271.7 = mul nsw i32 %14, %inc279.6
  %arrayidx273.7 = getelementptr float, ptr %arrayidx273, i32 %mul3963
  %166 = load float, ptr %arrayidx273.7, align 4, !tbaa !15
  %arrayidx276.7 = getelementptr inbounds float, ptr %f_data249.0964, i32 %inc279.6
  %167 = load float, ptr %arrayidx276.7, align 4, !tbaa !15
  %168 = tail call float @llvm.fmuladd.f32(float %166, float %167, float %165)
  %inc279.7 = add nuw nsw i32 %mul275, 8
  %m5 = add nsw i32 %sub266, -7
  %cmp267.7 = icmp slt i32 %inc279.7, %m5
  br i1 %cmp267.7, label %for.body269.7, label %for.cond.preheader64, !llvm.loop !33

for.cond.preheader64:                             ; preds = %for.body269.7, %for.cond258.preheader
  %169 = phi float [ %168, %for.body269.7 ], [ %acc248.0963, %for.cond258.preheader ]
  %170 = phi i32 [ %inc279.7, %for.body269.7 ], [ 0, %for.cond258.preheader ]
  %171 = icmp slt i32 %170, %sub266
  br i1 %171, label %for.body269.clone.lr.ph, label %for.cond.cleanup268

for.body269.clone.lr.ph:                          ; preds = %for.cond.preheader64
  %172 = getelementptr float, ptr %2, i32 %i_pos_x247.0962
  br label %for.body269.clone

for.body269.clone:                                ; preds = %for.body269.clone, %for.body269.clone.lr.ph
  %n257.0959.clone = phi i32 [ %170, %for.body269.clone.lr.ph ], [ %inc279.clone, %for.body269.clone ]
  %acc248.1958.clone = phi float [ %169, %for.body269.clone.lr.ph ], [ %175, %for.body269.clone ]
  %mul271.clone = mul nsw i32 %14, %n257.0959.clone
  %arrayidx273.clone = getelementptr float, ptr %172, i32 %mul271.clone
  %173 = load float, ptr %arrayidx273.clone, align 4, !tbaa !15
  %mul275.clone = mul nsw i32 %10, %n257.0959.clone
  %arrayidx276.clone = getelementptr inbounds float, ptr %f_data249.0964, i32 %mul275.clone
  %174 = load float, ptr %arrayidx276.clone, align 4, !tbaa !15
  %175 = tail call float @llvm.fmuladd.f32(float %173, float %174, float %acc248.1958.clone)
  %inc279.clone = add nuw nsw i32 %n257.0959.clone, 1
  %cmp267.clone = icmp eq i32 %inc279.clone, %sub266
  br i1 %cmp267.clone, label %for.cond.cleanup268, label %for.body269.clone

for.cond.cleanup268:                              ; preds = %for.body269.clone, %for.cond.preheader64
  %acc248.1.lcssa = phi float [ %169, %for.cond.preheader64 ], [ %175, %for.body269.clone ]
  %add.ptr281 = getelementptr inbounds float, ptr %f_data249.0964, i32 %mul10
  %add282 = add nsw i32 %i_pos_x247.0962, %mul
  %inc284 = add nuw nsw i32 %m251.0965, 1
  %exitcond1063.not = icmp eq i32 %inc284, %5
  br i1 %exitcond1063.not, label %for.cond.cleanup255, label %for.cond258.preheader, !llvm.loop !34

for.cond318.preheader:                            ; preds = %for.cond.cleanup444, %for.cond318.preheader.lr.ph
  %y306.01030 = phi i32 [ %sub180, %for.cond318.preheader.lr.ph ], [ %inc510, %for.cond.cleanup444 ]
  %i_pos.21029 = phi i32 [ 0, %for.cond318.preheader.lr.ph ], [ %add508, %for.cond.cleanup444 ]
  %add333 = add i32 %sub330, %y306.01030
  %mul367 = mul nsw i32 %12, %y306.01030
  %add334.neg = xor i32 %add333, -1
  %mul369 = mul nsw i32 %mul367, %11
  %sub335 = add i32 %5, %add334.neg
  %invariant.gep993 = getelementptr float, ptr %3, i32 %mul369
  %cmp336983 = icmp sgt i32 %sub335, 0
  br i1 %cmp319989, label %for.body321, label %for.cond376.preheader

for.cond513.preheader:                            ; preds = %for.cond.cleanup444, %for.cond311.preheader
  br i1 %cmp181973, label %for.cond523.preheader.lr.ph, label %for.cond.cleanup519

for.cond523.preheader.lr.ph:                      ; preds = %for.cond513.preheader
  %cmp5281041 = icmp slt i32 %shr, %sub527
  %cmp5381035 = icmp sgt i32 %5, 0
  %cmp5441031 = icmp sgt i32 %4, 0
  br label %for.cond523.preheader

for.cond376.preheader:                            ; preds = %for.cond.cleanup337, %for.cond318.preheader
  %i_pos_y316.0.lcssa = phi i32 [ %i_pos.21029, %for.cond318.preheader ], [ %add363, %for.cond.cleanup337 ]
  br i1 %cmp3811005, label %for.body383, label %for.cond441.preheader

for.body321:                                      ; preds = %for.cond318.preheader, %for.cond.cleanup337
  %x317.0991 = phi i32 [ %inc373, %for.cond.cleanup337 ], [ 0, %for.cond318.preheader ]
  %i_pos_y316.0990 = phi i32 [ %add363, %for.cond.cleanup337 ], [ %i_pos.21029, %for.cond318.preheader ]
  %sub340 = sub nsw i32 %shr, %x317.0991
  %cmp343979 = icmp slt i32 %sub340, %4
  br i1 %cmp336983, label %for.body338, label %for.cond.cleanup337

for.cond.cleanup337:                              ; preds = %for.cond.cleanup344, %for.body321
  %acc323.0.lcssa = phi float [ 0.000000e+00, %for.body321 ], [ %acc323.1.lcssa, %for.cond.cleanup344 ]
  %add363 = add nsw i32 %14, %i_pos_y316.0990
  %mul365 = mul nsw i32 %13, %x317.0991
  %gep994 = getelementptr float, ptr %invariant.gep993, i32 %mul365
  store float %acc323.0.lcssa, ptr %gep994, align 4, !tbaa !15
  %inc373 = add nuw nsw i32 %x317.0991, 1
  %exitcond1066.not = icmp eq i32 %inc373, %shr
  br i1 %exitcond1066.not, label %for.cond376.preheader, label %for.body321, !llvm.loop !35

for.body338:                                      ; preds = %for.body321, %for.cond.cleanup344
  %m326.0987 = phi i32 [ %inc360, %for.cond.cleanup344 ], [ 0, %for.body321 ]
  %f_data324.0986 = phi ptr [ %add.ptr357, %for.cond.cleanup344 ], [ %15, %for.body321 ]
  %acc323.0985 = phi float [ %acc323.1.lcssa, %for.cond.cleanup344 ], [ 0.000000e+00, %for.body321 ]
  %i_pos_x322.0984 = phi i32 [ %add358, %for.cond.cleanup344 ], [ %i_pos_y316.0990, %for.body321 ]
  %176 = getelementptr float, ptr %2, i32 %i_pos_x322.0984
  br i1 %cmp343979, label %for.body345.7, label %for.cond.preheader77

for.body345.7:                                    ; preds = %for.body345.7, %for.body338
  %n339.0981 = phi i32 [ %inc355.7, %for.body345.7 ], [ %sub340, %for.body338 ]
  %acc323.1980 = phi float [ %200, %for.body345.7 ], [ %acc323.0985, %for.body338 ]
  %mul347 = mul nsw i32 %14, %n339.0981
  %arrayidx349 = getelementptr float, ptr %176, i32 %mul347
  %177 = load float, ptr %arrayidx349, align 4, !tbaa !15
  %mul351 = mul nsw i32 %10, %n339.0981
  %arrayidx352 = getelementptr inbounds float, ptr %f_data324.0986, i32 %mul351
  %178 = load float, ptr %arrayidx352, align 4, !tbaa !15
  %179 = tail call float @llvm.fmuladd.f32(float %177, float %178, float %acc323.1980)
  %inc355 = add nsw i32 %mul351, %10
  %mul347.1 = mul nsw i32 %14, %inc355
  %arrayidx349.1 = getelementptr float, ptr %arrayidx349, i32 %14
  %180 = load float, ptr %arrayidx349.1, align 4, !tbaa !15
  %arrayidx352.1 = getelementptr inbounds float, ptr %f_data324.0986, i32 %inc355
  %181 = load float, ptr %arrayidx352.1, align 4, !tbaa !15
  %182 = tail call float @llvm.fmuladd.f32(float %180, float %181, float %179)
  %inc355.1 = add nsw i32 %mul351, %mul2865
  %mul347.2 = mul nsw i32 %14, %inc355.1
  %arrayidx349.2 = getelementptr float, ptr %arrayidx349, i32 %mul3471
  %183 = load float, ptr %arrayidx349.2, align 4, !tbaa !15
  %arrayidx352.2 = getelementptr inbounds float, ptr %f_data324.0986, i32 %inc355.1
  %184 = load float, ptr %arrayidx352.2, align 4, !tbaa !15
  %185 = tail call float @llvm.fmuladd.f32(float %183, float %184, float %182)
  %inc355.2 = add nsw i32 %mul351, %mul3066
  %mul347.3 = mul nsw i32 %14, %inc355.2
  %arrayidx349.3 = getelementptr float, ptr %arrayidx349, i32 %mul3572
  %186 = load float, ptr %arrayidx349.3, align 4, !tbaa !15
  %arrayidx352.3 = getelementptr inbounds float, ptr %f_data324.0986, i32 %inc355.2
  %187 = load float, ptr %arrayidx352.3, align 4, !tbaa !15
  %188 = tail call float @llvm.fmuladd.f32(float %186, float %187, float %185)
  %inc355.3 = add nsw i32 %mul351, %mul3167
  %mul347.4 = mul nsw i32 %14, %inc355.3
  %arrayidx349.4 = getelementptr float, ptr %arrayidx349, i32 %mul3673
  %189 = load float, ptr %arrayidx349.4, align 4, !tbaa !15
  %arrayidx352.4 = getelementptr inbounds float, ptr %f_data324.0986, i32 %inc355.3
  %190 = load float, ptr %arrayidx352.4, align 4, !tbaa !15
  %191 = tail call float @llvm.fmuladd.f32(float %189, float %190, float %188)
  %inc355.4 = add nsw i32 %mul351, %mul3168
  %mul347.5 = mul nsw i32 %14, %inc355.4
  %arrayidx349.5 = getelementptr float, ptr %arrayidx349, i32 %mul3774
  %192 = load float, ptr %arrayidx349.5, align 4, !tbaa !15
  %arrayidx352.5 = getelementptr inbounds float, ptr %f_data324.0986, i32 %inc355.4
  %193 = load float, ptr %arrayidx352.5, align 4, !tbaa !15
  %194 = tail call float @llvm.fmuladd.f32(float %192, float %193, float %191)
  %inc355.5 = add nsw i32 %mul351, %mul3269
  %mul347.6 = mul nsw i32 %14, %inc355.5
  %arrayidx349.6 = getelementptr float, ptr %arrayidx349, i32 %mul3875
  %195 = load float, ptr %arrayidx349.6, align 4, !tbaa !15
  %arrayidx352.6 = getelementptr inbounds float, ptr %f_data324.0986, i32 %inc355.5
  %196 = load float, ptr %arrayidx352.6, align 4, !tbaa !15
  %197 = tail call float @llvm.fmuladd.f32(float %195, float %196, float %194)
  %inc355.6 = add nsw i32 %mul351, %mul3370
  %mul347.7 = mul nsw i32 %14, %inc355.6
  %arrayidx349.7 = getelementptr float, ptr %arrayidx349, i32 %mul3976
  %198 = load float, ptr %arrayidx349.7, align 4, !tbaa !15
  %arrayidx352.7 = getelementptr inbounds float, ptr %f_data324.0986, i32 %inc355.6
  %199 = load float, ptr %arrayidx352.7, align 4, !tbaa !15
  %200 = tail call float @llvm.fmuladd.f32(float %198, float %199, float %197)
  %inc355.7 = add nsw i32 %mul351, 8
  %m6 = add nsw i32 %4, -7
  %cmp343.7 = icmp slt i32 %inc355.7, %m6
  br i1 %cmp343.7, label %for.body345.7, label %for.cond.preheader77, !llvm.loop !36

for.cond.preheader77:                             ; preds = %for.body345.7, %for.body338
  %201 = phi float [ %200, %for.body345.7 ], [ %acc323.0985, %for.body338 ]
  %202 = phi i32 [ %inc355.7, %for.body345.7 ], [ %sub340, %for.body338 ]
  %203 = icmp slt i32 %202, %4
  br i1 %203, label %for.body345.clone.lr.ph, label %for.cond.cleanup344

for.body345.clone.lr.ph:                          ; preds = %for.cond.preheader77
  %204 = getelementptr float, ptr %2, i32 %i_pos_x322.0984
  br label %for.body345.clone

for.body345.clone:                                ; preds = %for.body345.clone, %for.body345.clone.lr.ph
  %n339.0981.clone = phi i32 [ %202, %for.body345.clone.lr.ph ], [ %inc355.clone, %for.body345.clone ]
  %acc323.1980.clone = phi float [ %201, %for.body345.clone.lr.ph ], [ %207, %for.body345.clone ]
  %mul347.clone = mul nsw i32 %14, %n339.0981.clone
  %arrayidx349.clone = getelementptr float, ptr %204, i32 %mul347.clone
  %205 = load float, ptr %arrayidx349.clone, align 4, !tbaa !15
  %mul351.clone = mul nsw i32 %10, %n339.0981.clone
  %arrayidx352.clone = getelementptr inbounds float, ptr %f_data324.0986, i32 %mul351.clone
  %206 = load float, ptr %arrayidx352.clone, align 4, !tbaa !15
  %207 = tail call float @llvm.fmuladd.f32(float %205, float %206, float %acc323.1980.clone)
  %inc355.clone = add nsw i32 %n339.0981.clone, 1
  %cmp343.clone = icmp eq i32 %inc355.clone, %4
  br i1 %cmp343.clone, label %for.cond.cleanup344, label %for.body345.clone

for.cond.cleanup344:                              ; preds = %for.body345.clone, %for.cond.preheader77
  %acc323.1.lcssa = phi float [ %201, %for.cond.preheader77 ], [ %207, %for.body345.clone ]
  %add.ptr357 = getelementptr inbounds float, ptr %f_data324.0986, i32 %mul10
  %add358 = add nsw i32 %i_pos_x322.0984, %mul
  %inc360 = add nuw nsw i32 %m326.0987, 1
  %cmp336 = icmp slt i32 %inc360, %sub335
  br i1 %cmp336, label %for.body338, label %for.cond.cleanup337, !llvm.loop !37

for.cond441.preheader:                            ; preds = %for.cond.cleanup399, %for.cond376.preheader
  %i_pos_y316.1.lcssa = phi i32 [ %i_pos_y316.0.lcssa, %for.cond376.preheader ], [ %add424, %for.cond.cleanup399 ]
  br i1 %cmp4431023, label %for.body445, label %for.cond.cleanup444

for.body383:                                      ; preds = %for.cond376.preheader, %for.cond.cleanup399
  %x375.01007 = phi i32 [ %inc434, %for.cond.cleanup399 ], [ %shr, %for.cond376.preheader ]
  %i_pos_y316.11006 = phi i32 [ %add424, %for.cond.cleanup399 ], [ %i_pos_y316.0.lcssa, %for.cond376.preheader ]
  br i1 %cmp336983, label %for.cond402.preheader, label %for.cond.cleanup399

for.cond402.preheader:                            ; preds = %for.body383, %for.cond.cleanup405
  %m388.01003 = phi i32 [ %inc421, %for.cond.cleanup405 ], [ 0, %for.body383 ]
  %f_data386.01002 = phi ptr [ %add.ptr418, %for.cond.cleanup405 ], [ %15, %for.body383 ]
  %acc385.01001 = phi float [ %acc385.1.lcssa, %for.cond.cleanup405 ], [ 0.000000e+00, %for.body383 ]
  %i_pos_x384.01000 = phi i32 [ %add419, %for.cond.cleanup405 ], [ %i_pos_y316.11006, %for.body383 ]
  %208 = getelementptr float, ptr %2, i32 %i_pos_x384.01000
  %n2 = and i32 %4, -8
  br i1 %cmp404995, label %for.body406.7, label %for.cond.preheader90

for.cond.cleanup399:                              ; preds = %for.cond.cleanup405, %for.body383
  %acc385.0.lcssa = phi float [ 0.000000e+00, %for.body383 ], [ %acc385.1.lcssa, %for.cond.cleanup405 ]
  %add424 = add nsw i32 %14, %i_pos_y316.11006
  %mul426 = mul nsw i32 %13, %x375.01007
  %gep1012 = getelementptr float, ptr %invariant.gep993, i32 %mul426
  store float %acc385.0.lcssa, ptr %gep1012, align 4, !tbaa !15
  %inc434 = add nsw i32 %x375.01007, 1
  %exitcond1068.not = icmp eq i32 %inc434, %sub527
  br i1 %exitcond1068.not, label %for.cond441.preheader, label %for.body383, !llvm.loop !38

for.body406.7:                                    ; preds = %for.body406.7, %for.cond402.preheader
  %n401.0997 = phi i32 [ %inc416.7, %for.body406.7 ], [ 0, %for.cond402.preheader ]
  %acc385.1996 = phi float [ %232, %for.body406.7 ], [ %acc385.01001, %for.cond402.preheader ]
  %mul408 = mul nsw i32 %14, %n401.0997
  %arrayidx410 = getelementptr float, ptr %208, i32 %mul408
  %209 = load float, ptr %arrayidx410, align 4, !tbaa !15
  %mul412 = mul nsw i32 %10, %n401.0997
  %arrayidx413 = getelementptr inbounds float, ptr %f_data386.01002, i32 %mul412
  %210 = load float, ptr %arrayidx413, align 4, !tbaa !15
  %211 = tail call float @llvm.fmuladd.f32(float %209, float %210, float %acc385.1996)
  %inc416 = add nuw nsw i32 %mul412, %10
  %mul408.1 = mul nsw i32 %14, %inc416
  %arrayidx410.1 = getelementptr float, ptr %arrayidx410, i32 %14
  %212 = load float, ptr %arrayidx410.1, align 4, !tbaa !15
  %arrayidx413.1 = getelementptr inbounds float, ptr %f_data386.01002, i32 %inc416
  %213 = load float, ptr %arrayidx413.1, align 4, !tbaa !15
  %214 = tail call float @llvm.fmuladd.f32(float %212, float %213, float %211)
  %inc416.1 = add nuw nsw i32 %mul412, %mul2878
  %mul408.2 = mul nsw i32 %14, %inc416.1
  %arrayidx410.2 = getelementptr float, ptr %arrayidx410, i32 %mul3484
  %215 = load float, ptr %arrayidx410.2, align 4, !tbaa !15
  %arrayidx413.2 = getelementptr inbounds float, ptr %f_data386.01002, i32 %inc416.1
  %216 = load float, ptr %arrayidx413.2, align 4, !tbaa !15
  %217 = tail call float @llvm.fmuladd.f32(float %215, float %216, float %214)
  %inc416.2 = add nuw nsw i32 %mul412, %mul3079
  %mul408.3 = mul nsw i32 %14, %inc416.2
  %arrayidx410.3 = getelementptr float, ptr %arrayidx410, i32 %mul3585
  %218 = load float, ptr %arrayidx410.3, align 4, !tbaa !15
  %arrayidx413.3 = getelementptr inbounds float, ptr %f_data386.01002, i32 %inc416.2
  %219 = load float, ptr %arrayidx413.3, align 4, !tbaa !15
  %220 = tail call float @llvm.fmuladd.f32(float %218, float %219, float %217)
  %inc416.3 = add nuw nsw i32 %mul412, %mul3180
  %mul408.4 = mul nsw i32 %14, %inc416.3
  %arrayidx410.4 = getelementptr float, ptr %arrayidx410, i32 %mul3686
  %221 = load float, ptr %arrayidx410.4, align 4, !tbaa !15
  %arrayidx413.4 = getelementptr inbounds float, ptr %f_data386.01002, i32 %inc416.3
  %222 = load float, ptr %arrayidx413.4, align 4, !tbaa !15
  %223 = tail call float @llvm.fmuladd.f32(float %221, float %222, float %220)
  %inc416.4 = add nuw nsw i32 %mul412, %mul3181
  %mul408.5 = mul nsw i32 %14, %inc416.4
  %arrayidx410.5 = getelementptr float, ptr %arrayidx410, i32 %mul3787
  %224 = load float, ptr %arrayidx410.5, align 4, !tbaa !15
  %arrayidx413.5 = getelementptr inbounds float, ptr %f_data386.01002, i32 %inc416.4
  %225 = load float, ptr %arrayidx413.5, align 4, !tbaa !15
  %226 = tail call float @llvm.fmuladd.f32(float %224, float %225, float %223)
  %inc416.5 = add nuw nsw i32 %mul412, %mul3282
  %mul408.6 = mul nsw i32 %14, %inc416.5
  %arrayidx410.6 = getelementptr float, ptr %arrayidx410, i32 %mul3888
  %227 = load float, ptr %arrayidx410.6, align 4, !tbaa !15
  %arrayidx413.6 = getelementptr inbounds float, ptr %f_data386.01002, i32 %inc416.5
  %228 = load float, ptr %arrayidx413.6, align 4, !tbaa !15
  %229 = tail call float @llvm.fmuladd.f32(float %227, float %228, float %226)
  %inc416.6 = add nuw nsw i32 %mul412, %mul3383
  %mul408.7 = mul nsw i32 %14, %inc416.6
  %arrayidx410.7 = getelementptr float, ptr %arrayidx410, i32 %mul3989
  %230 = load float, ptr %arrayidx410.7, align 4, !tbaa !15
  %arrayidx413.7 = getelementptr inbounds float, ptr %f_data386.01002, i32 %inc416.6
  %231 = load float, ptr %arrayidx413.7, align 4, !tbaa !15
  %232 = tail call float @llvm.fmuladd.f32(float %230, float %231, float %229)
  %inc416.7 = add nuw nsw i32 %mul412, 8
  %m7 = add nsw i32 %4, -7
  %exitcond1067.not.7 = icmp slt i32 %inc416.7, %m7
  br i1 %exitcond1067.not.7, label %for.body406.7, label %for.cond.preheader90, !llvm.loop !39

for.cond.preheader90:                             ; preds = %for.body406.7, %for.cond402.preheader
  %233 = phi float [ %232, %for.body406.7 ], [ %acc385.01001, %for.cond402.preheader ]
  %234 = phi i32 [ %n2, %for.body406.7 ], [ 0, %for.cond402.preheader ]
  %235 = icmp slt i32 %234, %4
  br i1 %235, label %for.body406.clone.lr.ph, label %for.cond.cleanup405

for.body406.clone.lr.ph:                          ; preds = %for.cond.preheader90
  %236 = getelementptr float, ptr %2, i32 %i_pos_x384.01000
  br label %for.body406.clone

for.body406.clone:                                ; preds = %for.body406.clone, %for.body406.clone.lr.ph
  %n401.0997.clone = phi i32 [ %234, %for.body406.clone.lr.ph ], [ %inc416.clone, %for.body406.clone ]
  %acc385.1996.clone = phi float [ %233, %for.body406.clone.lr.ph ], [ %239, %for.body406.clone ]
  %mul408.clone = mul nsw i32 %14, %n401.0997.clone
  %arrayidx410.clone = getelementptr float, ptr %236, i32 %mul408.clone
  %237 = load float, ptr %arrayidx410.clone, align 4, !tbaa !15
  %mul412.clone = mul nsw i32 %10, %n401.0997.clone
  %arrayidx413.clone = getelementptr inbounds float, ptr %f_data386.01002, i32 %mul412.clone
  %238 = load float, ptr %arrayidx413.clone, align 4, !tbaa !15
  %239 = tail call float @llvm.fmuladd.f32(float %237, float %238, float %acc385.1996.clone)
  %inc416.clone = add nuw nsw i32 %n401.0997.clone, 1
  %exitcond1067.not.clone = icmp eq i32 %inc416.clone, %4
  br i1 %exitcond1067.not.clone, label %for.cond.cleanup405, label %for.body406.clone

for.cond.cleanup405:                              ; preds = %for.body406.clone, %for.cond.preheader90
  %acc385.1.lcssa = phi float [ %233, %for.cond.preheader90 ], [ %239, %for.body406.clone ]
  %add.ptr418 = getelementptr inbounds float, ptr %f_data386.01002, i32 %mul10
  %add419 = add nsw i32 %i_pos_x384.01000, %mul
  %inc421 = add nuw nsw i32 %m388.01003, 1
  %cmp398 = icmp slt i32 %inc421, %sub335
  br i1 %cmp398, label %for.cond402.preheader, label %for.cond.cleanup399, !llvm.loop !40

for.cond.cleanup444:                              ; preds = %for.cond.cleanup461, %for.cond441.preheader
  %add508 = add nsw i32 %i_pos.21029, %mul
  %inc510 = add nsw i32 %y306.01030, 1
  %exitcond1070.not = icmp eq i32 %inc510, %1
  br i1 %exitcond1070.not, label %for.cond513.preheader, label %for.cond318.preheader, !llvm.loop !41

for.body445:                                      ; preds = %for.cond441.preheader, %for.cond.cleanup461
  %x436.01025 = phi i32 [ %inc503, %for.cond.cleanup461 ], [ %sub527, %for.cond441.preheader ]
  %i_pos_y316.21024 = phi i32 [ %add493, %for.cond.cleanup461 ], [ %i_pos_y316.1.lcssa, %for.cond441.preheader ]
  %add470 = add i32 %sub467, %x436.01025
  %add471.neg = xor i32 %add470, -1
  %sub472 = add i32 %4, %add471.neg
  %cmp4731013 = icmp sgt i32 %sub472, 0
  br i1 %cmp336983, label %for.cond464.preheader, label %for.cond.cleanup461

for.cond464.preheader:                            ; preds = %for.body445, %for.cond.cleanup474
  %m450.01021 = phi i32 [ %inc490, %for.cond.cleanup474 ], [ 0, %for.body445 ]
  %f_data448.01020 = phi ptr [ %add.ptr487, %for.cond.cleanup474 ], [ %15, %for.body445 ]
  %acc447.01019 = phi float [ %acc447.1.lcssa, %for.cond.cleanup474 ], [ 0.000000e+00, %for.body445 ]
  %i_pos_x446.01018 = phi i32 [ %add488, %for.cond.cleanup474 ], [ %i_pos_y316.21024, %for.body445 ]
  %240 = getelementptr float, ptr %2, i32 %i_pos_x446.01018
  br i1 %cmp4731013, label %for.body475.7, label %for.cond.preheader103

for.cond.cleanup461:                              ; preds = %for.cond.cleanup474, %for.body445
  %acc447.0.lcssa = phi float [ 0.000000e+00, %for.body445 ], [ %acc447.1.lcssa, %for.cond.cleanup474 ]
  %add493 = add nsw i32 %14, %i_pos_y316.21024
  %mul495 = mul nsw i32 %13, %x436.01025
  %gep1027 = getelementptr float, ptr %invariant.gep993, i32 %mul495
  store float %acc447.0.lcssa, ptr %gep1027, align 4, !tbaa !15
  %inc503 = add nsw i32 %x436.01025, 1
  %exitcond1069.not = icmp eq i32 %inc503, %0
  br i1 %exitcond1069.not, label %for.cond.cleanup444, label %for.body445, !llvm.loop !42

for.body475.7:                                    ; preds = %for.body475.7, %for.cond464.preheader
  %n463.01015 = phi i32 [ %inc485.7, %for.body475.7 ], [ 0, %for.cond464.preheader ]
  %acc447.11014 = phi float [ %264, %for.body475.7 ], [ %acc447.01019, %for.cond464.preheader ]
  %mul477 = mul nsw i32 %14, %n463.01015
  %arrayidx479 = getelementptr float, ptr %240, i32 %mul477
  %241 = load float, ptr %arrayidx479, align 4, !tbaa !15
  %mul481 = mul nsw i32 %10, %n463.01015
  %arrayidx482 = getelementptr inbounds float, ptr %f_data448.01020, i32 %mul481
  %242 = load float, ptr %arrayidx482, align 4, !tbaa !15
  %243 = tail call float @llvm.fmuladd.f32(float %241, float %242, float %acc447.11014)
  %inc485 = add nuw nsw i32 %mul481, %10
  %mul477.1 = mul nsw i32 %14, %inc485
  %arrayidx479.1 = getelementptr float, ptr %arrayidx479, i32 %14
  %244 = load float, ptr %arrayidx479.1, align 4, !tbaa !15
  %arrayidx482.1 = getelementptr inbounds float, ptr %f_data448.01020, i32 %inc485
  %245 = load float, ptr %arrayidx482.1, align 4, !tbaa !15
  %246 = tail call float @llvm.fmuladd.f32(float %244, float %245, float %243)
  %inc485.1 = add nuw nsw i32 %mul481, %mul2891
  %mul477.2 = mul nsw i32 %14, %inc485.1
  %arrayidx479.2 = getelementptr float, ptr %arrayidx479, i32 %mul3497
  %247 = load float, ptr %arrayidx479.2, align 4, !tbaa !15
  %arrayidx482.2 = getelementptr inbounds float, ptr %f_data448.01020, i32 %inc485.1
  %248 = load float, ptr %arrayidx482.2, align 4, !tbaa !15
  %249 = tail call float @llvm.fmuladd.f32(float %247, float %248, float %246)
  %inc485.2 = add nuw nsw i32 %mul481, %mul3092
  %mul477.3 = mul nsw i32 %14, %inc485.2
  %arrayidx479.3 = getelementptr float, ptr %arrayidx479, i32 %mul3598
  %250 = load float, ptr %arrayidx479.3, align 4, !tbaa !15
  %arrayidx482.3 = getelementptr inbounds float, ptr %f_data448.01020, i32 %inc485.2
  %251 = load float, ptr %arrayidx482.3, align 4, !tbaa !15
  %252 = tail call float @llvm.fmuladd.f32(float %250, float %251, float %249)
  %inc485.3 = add nuw nsw i32 %mul481, %mul3193
  %mul477.4 = mul nsw i32 %14, %inc485.3
  %arrayidx479.4 = getelementptr float, ptr %arrayidx479, i32 %mul3699
  %253 = load float, ptr %arrayidx479.4, align 4, !tbaa !15
  %arrayidx482.4 = getelementptr inbounds float, ptr %f_data448.01020, i32 %inc485.3
  %254 = load float, ptr %arrayidx482.4, align 4, !tbaa !15
  %255 = tail call float @llvm.fmuladd.f32(float %253, float %254, float %252)
  %inc485.4 = add nuw nsw i32 %mul481, %mul3194
  %mul477.5 = mul nsw i32 %14, %inc485.4
  %arrayidx479.5 = getelementptr float, ptr %arrayidx479, i32 %mul37100
  %256 = load float, ptr %arrayidx479.5, align 4, !tbaa !15
  %arrayidx482.5 = getelementptr inbounds float, ptr %f_data448.01020, i32 %inc485.4
  %257 = load float, ptr %arrayidx482.5, align 4, !tbaa !15
  %258 = tail call float @llvm.fmuladd.f32(float %256, float %257, float %255)
  %inc485.5 = add nuw nsw i32 %mul481, %mul3295
  %mul477.6 = mul nsw i32 %14, %inc485.5
  %arrayidx479.6 = getelementptr float, ptr %arrayidx479, i32 %mul38101
  %259 = load float, ptr %arrayidx479.6, align 4, !tbaa !15
  %arrayidx482.6 = getelementptr inbounds float, ptr %f_data448.01020, i32 %inc485.5
  %260 = load float, ptr %arrayidx482.6, align 4, !tbaa !15
  %261 = tail call float @llvm.fmuladd.f32(float %259, float %260, float %258)
  %inc485.6 = add nuw nsw i32 %mul481, %mul3396
  %mul477.7 = mul nsw i32 %14, %inc485.6
  %arrayidx479.7 = getelementptr float, ptr %arrayidx479, i32 %mul39102
  %262 = load float, ptr %arrayidx479.7, align 4, !tbaa !15
  %arrayidx482.7 = getelementptr inbounds float, ptr %f_data448.01020, i32 %inc485.6
  %263 = load float, ptr %arrayidx482.7, align 4, !tbaa !15
  %264 = tail call float @llvm.fmuladd.f32(float %262, float %263, float %261)
  %inc485.7 = add nuw nsw i32 %mul481, 8
  %m8 = add nsw i32 %sub472, -7
  %cmp473.7 = icmp slt i32 %inc485.7, %m8
  br i1 %cmp473.7, label %for.body475.7, label %for.cond.preheader103, !llvm.loop !43

for.cond.preheader103:                            ; preds = %for.body475.7, %for.cond464.preheader
  %265 = phi float [ %264, %for.body475.7 ], [ %acc447.01019, %for.cond464.preheader ]
  %266 = phi i32 [ %inc485.7, %for.body475.7 ], [ 0, %for.cond464.preheader ]
  %267 = icmp slt i32 %266, %sub472
  br i1 %267, label %for.body475.clone.lr.ph, label %for.cond.cleanup474

for.body475.clone.lr.ph:                          ; preds = %for.cond.preheader103
  %268 = getelementptr float, ptr %2, i32 %i_pos_x446.01018
  br label %for.body475.clone

for.body475.clone:                                ; preds = %for.body475.clone, %for.body475.clone.lr.ph
  %n463.01015.clone = phi i32 [ %266, %for.body475.clone.lr.ph ], [ %inc485.clone, %for.body475.clone ]
  %acc447.11014.clone = phi float [ %265, %for.body475.clone.lr.ph ], [ %271, %for.body475.clone ]
  %mul477.clone = mul nsw i32 %14, %n463.01015.clone
  %arrayidx479.clone = getelementptr float, ptr %268, i32 %mul477.clone
  %269 = load float, ptr %arrayidx479.clone, align 4, !tbaa !15
  %mul481.clone = mul nsw i32 %10, %n463.01015.clone
  %arrayidx482.clone = getelementptr inbounds float, ptr %f_data448.01020, i32 %mul481.clone
  %270 = load float, ptr %arrayidx482.clone, align 4, !tbaa !15
  %271 = tail call float @llvm.fmuladd.f32(float %269, float %270, float %acc447.11014.clone)
  %inc485.clone = add nuw nsw i32 %n463.01015.clone, 1
  %cmp473.clone = icmp eq i32 %inc485.clone, %sub472
  br i1 %cmp473.clone, label %for.cond.cleanup474, label %for.body475.clone

for.cond.cleanup474:                              ; preds = %for.body475.clone, %for.cond.preheader103
  %acc447.1.lcssa = phi float [ %265, %for.cond.preheader103 ], [ %271, %for.body475.clone ]
  %add.ptr487 = getelementptr inbounds float, ptr %f_data448.01020, i32 %mul10
  %add488 = add nsw i32 %i_pos_x446.01018, %mul
  %inc490 = add nuw nsw i32 %m450.01021, 1
  %cmp460 = icmp slt i32 %inc490, %sub335
  br i1 %cmp460, label %for.cond464.preheader, label %for.cond.cleanup461, !llvm.loop !44

for.cond523.preheader:                            ; preds = %for.cond.cleanup529, %for.cond523.preheader.lr.ph
  %y512.01048 = phi i32 [ %shr7, %for.cond523.preheader.lr.ph ], [ %inc581, %for.cond.cleanup529 ]
  %i_pos.31047 = phi i32 [ 0, %for.cond523.preheader.lr.ph ], [ %add579, %for.cond.cleanup529 ]
  %mul568 = mul nsw i32 %12, %y512.01048
  %mul570 = mul nsw i32 %mul568, %11
  %invariant.gep1044 = getelementptr float, ptr %3, i32 %mul570
  br i1 %cmp5281041, label %for.body530, label %for.cond.cleanup529

for.cond.cleanup519:                              ; preds = %for.cond.cleanup529, %for.cond513.preheader
  ret i32 0

for.cond.cleanup529:                              ; preds = %for.cond.cleanup539, %for.cond523.preheader
  %add579 = add nsw i32 %i_pos.31047, %mul
  %inc581 = add nsw i32 %y512.01048, 1
  %exitcond1074.not = icmp eq i32 %inc581, %sub180
  br i1 %exitcond1074.not, label %for.cond.cleanup519, label %for.cond523.preheader, !llvm.loop !45

for.body530:                                      ; preds = %for.cond523.preheader, %for.cond.cleanup539
  %x522.01043 = phi i32 [ %inc574, %for.cond.cleanup539 ], [ %shr, %for.cond523.preheader ]
  %i_pos_y521.01042 = phi i32 [ %add564, %for.cond.cleanup539 ], [ %i_pos.31047, %for.cond523.preheader ]
  br i1 %cmp5381035, label %for.cond542.preheader, label %for.cond.cleanup539

for.cond542.preheader:                            ; preds = %for.body530, %for.cond.cleanup545
  %m535.01039 = phi i32 [ %inc561, %for.cond.cleanup545 ], [ 0, %for.body530 ]
  %f_data533.01038 = phi ptr [ %add.ptr558, %for.cond.cleanup545 ], [ %15, %for.body530 ]
  %acc532.01037 = phi float [ %acc532.1.lcssa, %for.cond.cleanup545 ], [ 0.000000e+00, %for.body530 ]
  %i_pos_x531.01036 = phi i32 [ %add559, %for.cond.cleanup545 ], [ %i_pos_y521.01042, %for.body530 ]
  %272 = getelementptr float, ptr %2, i32 %i_pos_x531.01036
  %n3 = and i32 %4, -8
  br i1 %cmp5441031, label %for.body546.7, label %for.cond.preheader116

for.cond.cleanup539:                              ; preds = %for.cond.cleanup545, %for.body530
  %acc532.0.lcssa = phi float [ 0.000000e+00, %for.body530 ], [ %acc532.1.lcssa, %for.cond.cleanup545 ]
  %add564 = add nsw i32 %14, %i_pos_y521.01042
  %mul566 = mul nsw i32 %13, %x522.01043
  %gep1045 = getelementptr float, ptr %invariant.gep1044, i32 %mul566
  store float %acc532.0.lcssa, ptr %gep1045, align 4, !tbaa !15
  %inc574 = add nsw i32 %x522.01043, 1
  %exitcond1073.not = icmp eq i32 %inc574, %sub527
  br i1 %exitcond1073.not, label %for.cond.cleanup529, label %for.body530, !llvm.loop !46

for.body546.7:                                    ; preds = %for.body546.7, %for.cond542.preheader
  %n541.01033 = phi i32 [ %inc556.7, %for.body546.7 ], [ 0, %for.cond542.preheader ]
  %acc532.11032 = phi float [ %296, %for.body546.7 ], [ %acc532.01037, %for.cond542.preheader ]
  %mul548 = mul nsw i32 %14, %n541.01033
  %arrayidx550 = getelementptr float, ptr %272, i32 %mul548
  %273 = load float, ptr %arrayidx550, align 4, !tbaa !15
  %mul552 = mul nsw i32 %10, %n541.01033
  %arrayidx553 = getelementptr inbounds float, ptr %f_data533.01038, i32 %mul552
  %274 = load float, ptr %arrayidx553, align 4, !tbaa !15
  %275 = tail call float @llvm.fmuladd.f32(float %273, float %274, float %acc532.11032)
  %inc556 = add nuw nsw i32 %mul552, %10
  %mul548.1 = mul nsw i32 %14, %inc556
  %arrayidx550.1 = getelementptr float, ptr %arrayidx550, i32 %14
  %276 = load float, ptr %arrayidx550.1, align 4, !tbaa !15
  %arrayidx553.1 = getelementptr inbounds float, ptr %f_data533.01038, i32 %inc556
  %277 = load float, ptr %arrayidx553.1, align 4, !tbaa !15
  %278 = tail call float @llvm.fmuladd.f32(float %276, float %277, float %275)
  %inc556.1 = add nuw nsw i32 %mul552, %mul28104
  %mul548.2 = mul nsw i32 %14, %inc556.1
  %arrayidx550.2 = getelementptr float, ptr %arrayidx550, i32 %mul34110
  %279 = load float, ptr %arrayidx550.2, align 4, !tbaa !15
  %arrayidx553.2 = getelementptr inbounds float, ptr %f_data533.01038, i32 %inc556.1
  %280 = load float, ptr %arrayidx553.2, align 4, !tbaa !15
  %281 = tail call float @llvm.fmuladd.f32(float %279, float %280, float %278)
  %inc556.2 = add nuw nsw i32 %mul552, %mul30105
  %mul548.3 = mul nsw i32 %14, %inc556.2
  %arrayidx550.3 = getelementptr float, ptr %arrayidx550, i32 %mul35111
  %282 = load float, ptr %arrayidx550.3, align 4, !tbaa !15
  %arrayidx553.3 = getelementptr inbounds float, ptr %f_data533.01038, i32 %inc556.2
  %283 = load float, ptr %arrayidx553.3, align 4, !tbaa !15
  %284 = tail call float @llvm.fmuladd.f32(float %282, float %283, float %281)
  %inc556.3 = add nuw nsw i32 %mul552, %mul31106
  %mul548.4 = mul nsw i32 %14, %inc556.3
  %arrayidx550.4 = getelementptr float, ptr %arrayidx550, i32 %mul36112
  %285 = load float, ptr %arrayidx550.4, align 4, !tbaa !15
  %arrayidx553.4 = getelementptr inbounds float, ptr %f_data533.01038, i32 %inc556.3
  %286 = load float, ptr %arrayidx553.4, align 4, !tbaa !15
  %287 = tail call float @llvm.fmuladd.f32(float %285, float %286, float %284)
  %inc556.4 = add nuw nsw i32 %mul552, %mul31107
  %mul548.5 = mul nsw i32 %14, %inc556.4
  %arrayidx550.5 = getelementptr float, ptr %arrayidx550, i32 %mul37113
  %288 = load float, ptr %arrayidx550.5, align 4, !tbaa !15
  %arrayidx553.5 = getelementptr inbounds float, ptr %f_data533.01038, i32 %inc556.4
  %289 = load float, ptr %arrayidx553.5, align 4, !tbaa !15
  %290 = tail call float @llvm.fmuladd.f32(float %288, float %289, float %287)
  %inc556.5 = add nuw nsw i32 %mul552, %mul32108
  %mul548.6 = mul nsw i32 %14, %inc556.5
  %arrayidx550.6 = getelementptr float, ptr %arrayidx550, i32 %mul38114
  %291 = load float, ptr %arrayidx550.6, align 4, !tbaa !15
  %arrayidx553.6 = getelementptr inbounds float, ptr %f_data533.01038, i32 %inc556.5
  %292 = load float, ptr %arrayidx553.6, align 4, !tbaa !15
  %293 = tail call float @llvm.fmuladd.f32(float %291, float %292, float %290)
  %inc556.6 = add nuw nsw i32 %mul552, %mul33109
  %mul548.7 = mul nsw i32 %14, %inc556.6
  %arrayidx550.7 = getelementptr float, ptr %arrayidx550, i32 %mul39115
  %294 = load float, ptr %arrayidx550.7, align 4, !tbaa !15
  %arrayidx553.7 = getelementptr inbounds float, ptr %f_data533.01038, i32 %inc556.6
  %295 = load float, ptr %arrayidx553.7, align 4, !tbaa !15
  %296 = tail call float @llvm.fmuladd.f32(float %294, float %295, float %293)
  %inc556.7 = add nuw nsw i32 %mul552, 8
  %m9 = add nsw i32 %4, -7
  %exitcond1071.not.7 = icmp slt i32 %inc556.7, %m9
  br i1 %exitcond1071.not.7, label %for.body546.7, label %for.cond.preheader116, !llvm.loop !47

for.cond.preheader116:                            ; preds = %for.body546.7, %for.cond542.preheader
  %297 = phi float [ %296, %for.body546.7 ], [ %acc532.01037, %for.cond542.preheader ]
  %298 = phi i32 [ %n3, %for.body546.7 ], [ 0, %for.cond542.preheader ]
  %299 = icmp slt i32 %298, %4
  br i1 %299, label %for.body546.clone.lr.ph, label %for.cond.cleanup545

for.body546.clone.lr.ph:                          ; preds = %for.cond.preheader116
  %300 = getelementptr float, ptr %2, i32 %i_pos_x531.01036
  br label %for.body546.clone

for.body546.clone:                                ; preds = %for.body546.clone, %for.body546.clone.lr.ph
  %n541.01033.clone = phi i32 [ %298, %for.body546.clone.lr.ph ], [ %inc556.clone, %for.body546.clone ]
  %acc532.11032.clone = phi float [ %297, %for.body546.clone.lr.ph ], [ %303, %for.body546.clone ]
  %mul548.clone = mul nsw i32 %14, %n541.01033.clone
  %arrayidx550.clone = getelementptr float, ptr %300, i32 %mul548.clone
  %301 = load float, ptr %arrayidx550.clone, align 4, !tbaa !15
  %mul552.clone = mul nsw i32 %10, %n541.01033.clone
  %arrayidx553.clone = getelementptr inbounds float, ptr %f_data533.01038, i32 %mul552.clone
  %302 = load float, ptr %arrayidx553.clone, align 4, !tbaa !15
  %303 = tail call float @llvm.fmuladd.f32(float %301, float %302, float %acc532.11032.clone)
  %inc556.clone = add nuw nsw i32 %n541.01033.clone, 1
  %exitcond1071.not.clone = icmp eq i32 %inc556.clone, %4
  br i1 %exitcond1071.not.clone, label %for.cond.cleanup545, label %for.body546.clone

for.cond.cleanup545:                              ; preds = %for.body546.clone, %for.cond.preheader116
  %acc532.1.lcssa = phi float [ %297, %for.cond.preheader116 ], [ %303, %for.body546.clone ]
  %add.ptr558 = getelementptr inbounds float, ptr %f_data533.01038, i32 %mul10
  %add559 = add nsw i32 %i_pos_x531.01036, %mul
  %inc561 = add nuw nsw i32 %m535.01039, 1
  %exitcond1072.not = icmp eq i32 %inc561, %5
  br i1 %exitcond1072.not, label %for.cond.cleanup539, label %for.cond542.preheader, !llvm.loop !48
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
