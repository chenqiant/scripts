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
  %cmp959 = icmp sgt i32 %shr12, 0
  br i1 %cmp959, label %for.body.lr.ph, label %for.cond251.preheader

for.body.lr.ph:                                   ; preds = %entry
  %cmp25924 = icmp sgt i32 %shr, 0
  %sub34 = add nsw i32 %8, -7
  %mul48 = shl nsw i32 %0, 1
  %mul55 = mul nsw i32 %0, 3
  %mul62 = shl nsw i32 %0, 2
  %mul69 = mul nsw i32 %0, 5
  %mul76 = mul nsw i32 %0, 6
  %mul83 = mul nsw i32 %0, 7
  %cmp119940 = icmp slt i32 %shr, %sub15
  %cmp133928 = icmp sgt i32 %8, 7
  %cmp208956.not = icmp sgt i32 %sub15, %3
  br label %for.body

for.cond251.preheader:                            ; preds = %for.cond.cleanup209, %entry
  %cmp252993 = icmp slt i32 %shr12, %sub17
  br i1 %cmp252993, label %for.body254.lr.ph, label %for.cond343.preheader

for.body254.lr.ph:                                ; preds = %for.cond251.preheader
  %cmp260974 = icmp sgt i32 %shr, 0
  %cmp269966 = icmp sgt i32 %9, 0
  %cmp300990.not = icmp sgt i32 %sub15, %3
  br label %for.body254

for.body:                                         ; preds = %for.body.lr.ph, %for.cond.cleanup209
  %i_pos.0961 = phi i32 [ 0, %for.body.lr.ph ], [ %add246, %for.cond.cleanup209 ]
  %y.0960 = phi i32 [ 0, %for.body.lr.ph ], [ %inc248, %for.cond.cleanup209 ]
  %sub22 = sub nsw i32 %shr12, %y.0960
  %mul23 = mul nsw i32 %y.0960, %mul14
  %invariant.gep = getelementptr float, ptr %14, i32 %mul23
  br i1 %cmp25924, label %for.body27.lr.ph, label %for.cond118.preheader

for.body27.lr.ph:                                 ; preds = %for.body
  %cmp30918 = icmp slt i32 %sub22, %9
  br label %for.body27

for.cond118.preheader:                            ; preds = %for.cond.cleanup31, %for.body
  %i_pos_y.0.lcssa = phi i32 [ %i_pos.0961, %for.body ], [ %add110, %for.cond.cleanup31 ]
  br i1 %cmp119940, label %for.cond126.preheader.lr.ph, label %for.cond207.preheader

for.cond126.preheader.lr.ph:                      ; preds = %for.cond118.preheader
  %cmp127932 = icmp slt i32 %sub22, %9
  br label %for.cond126.preheader

for.body27:                                       ; preds = %for.body27.lr.ph, %for.cond.cleanup31
  %i_pos_y.0926 = phi i32 [ %i_pos.0961, %for.body27.lr.ph ], [ %add110, %for.cond.cleanup31 ]
  %x.0925 = phi i32 [ 0, %for.body27.lr.ph ], [ %inc115, %for.cond.cleanup31 ]
  %sub28 = sub nsw i32 %shr, %x.0925
  br i1 %cmp30918, label %for.cond33.preheader.lr.ph, label %for.cond.cleanup31

for.cond33.preheader.lr.ph:                       ; preds = %for.body27
  %cmp35911 = icmp slt i32 %sub28, %sub34
  %sub92 = sub nsw i32 %8, %sub28
  %rem = srem i32 %sub92, 8
  %sub93 = sub nsw i32 %8, %rem
  %cmp95914 = icmp sgt i32 %rem, 0
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.lr.ph, %for.cond.cleanup96
  %i_pos_x.0922 = phi i32 [ %i_pos_y.0926, %for.cond33.preheader.lr.ph ], [ %add106, %for.cond.cleanup96 ]
  %acc.0921 = phi float [ 0.000000e+00, %for.cond33.preheader.lr.ph ], [ %acc.2.lcssa, %for.cond.cleanup96 ]
  %f_data.0920 = phi ptr [ %15, %for.cond33.preheader.lr.ph ], [ %add.ptr, %for.cond.cleanup96 ]
  %m.0919 = phi i32 [ %sub22, %for.cond33.preheader.lr.ph ], [ %inc108, %for.cond.cleanup96 ]
  br i1 %cmp35911, label %for.body37.lr.ph, label %for.cond.cleanup36

for.body37.lr.ph:                                 ; preds = %for.cond33.preheader
  %16 = getelementptr float, ptr %13, i32 %i_pos_x.0922
  br label %for.body37

for.cond.cleanup31:                               ; preds = %for.cond.cleanup96, %for.body27
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.body27 ], [ %acc.2.lcssa, %for.cond.cleanup96 ]
  %add110 = add nsw i32 %i_pos_y.0926, %0
  %mul111 = mul nsw i32 %x.0925, %10
  %gep = getelementptr float, ptr %invariant.gep, i32 %mul111
  store float %acc.0.lcssa, ptr %gep, align 4, !tbaa !15
  %inc115 = add nuw nsw i32 %x.0925, 1
  %exitcond.not = icmp eq i32 %inc115, %shr
  br i1 %exitcond.not, label %for.cond118.preheader, label %for.body27, !llvm.loop !17

for.cond.cleanup36:                               ; preds = %for.body37, %for.cond33.preheader
  %acc.1.lcssa = phi float [ %acc.0921, %for.cond33.preheader ], [ %41, %for.body37 ]
  br i1 %cmp95914, label %for.body97.lr.ph, label %for.cond.cleanup96

for.body97.lr.ph:                                 ; preds = %for.cond.cleanup36
  %17 = getelementptr float, ptr %13, i32 %i_pos_x.0922
  br label %for.body97

for.body37:                                       ; preds = %for.body37.lr.ph, %for.body37
  %acc.1913 = phi float [ %acc.0921, %for.body37.lr.ph ], [ %41, %for.body37 ]
  %n.0912 = phi i32 [ %sub28, %for.body37.lr.ph ], [ %add90, %for.body37 ]
  %mul38 = mul nsw i32 %n.0912, %0
  %mul40 = mul nsw i32 %n.0912, %5
  %arrayidx = getelementptr float, ptr %16, i32 %mul38
  %18 = load float, ptr %arrayidx, align 4, !tbaa !15
  %arrayidx41 = getelementptr inbounds float, ptr %f_data.0920, i32 %mul40
  %19 = load float, ptr %arrayidx41, align 4, !tbaa !15
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %acc.1913)
  %arrayidx44 = getelementptr float, ptr %arrayidx, i32 %0
  %21 = load float, ptr %arrayidx44, align 4, !tbaa !15
  %add45 = add nsw i32 %mul40, %5
  %arrayidx46 = getelementptr inbounds float, ptr %f_data.0920, i32 %add45
  %22 = load float, ptr %arrayidx46, align 4, !tbaa !15
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %20)
  %arrayidx50 = getelementptr float, ptr %arrayidx, i32 %mul48
  %24 = load float, ptr %arrayidx50, align 4, !tbaa !15
  %mul51905 = add nsw i32 %n.0912, 2
  %add52 = mul i32 %mul51905, %5
  %arrayidx53 = getelementptr inbounds float, ptr %f_data.0920, i32 %add52
  %25 = load float, ptr %arrayidx53, align 4, !tbaa !15
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %23)
  %arrayidx57 = getelementptr float, ptr %arrayidx, i32 %mul55
  %27 = load float, ptr %arrayidx57, align 4, !tbaa !15
  %mul58906 = add nsw i32 %n.0912, 3
  %add59 = mul i32 %mul58906, %5
  %arrayidx60 = getelementptr inbounds float, ptr %f_data.0920, i32 %add59
  %28 = load float, ptr %arrayidx60, align 4, !tbaa !15
  %29 = tail call float @llvm.fmuladd.f32(float %27, float %28, float %26)
  %arrayidx64 = getelementptr float, ptr %arrayidx, i32 %mul62
  %30 = load float, ptr %arrayidx64, align 4, !tbaa !15
  %mul65907 = add nsw i32 %n.0912, 4
  %add66 = mul i32 %mul65907, %5
  %arrayidx67 = getelementptr inbounds float, ptr %f_data.0920, i32 %add66
  %31 = load float, ptr %arrayidx67, align 4, !tbaa !15
  %32 = tail call float @llvm.fmuladd.f32(float %30, float %31, float %29)
  %arrayidx71 = getelementptr float, ptr %arrayidx, i32 %mul69
  %33 = load float, ptr %arrayidx71, align 4, !tbaa !15
  %mul72908 = add nsw i32 %n.0912, 5
  %add73 = mul i32 %mul72908, %5
  %arrayidx74 = getelementptr inbounds float, ptr %f_data.0920, i32 %add73
  %34 = load float, ptr %arrayidx74, align 4, !tbaa !15
  %35 = tail call float @llvm.fmuladd.f32(float %33, float %34, float %32)
  %arrayidx78 = getelementptr float, ptr %arrayidx, i32 %mul76
  %36 = load float, ptr %arrayidx78, align 4, !tbaa !15
  %mul79909 = add nsw i32 %n.0912, 6
  %add80 = mul i32 %mul79909, %5
  %arrayidx81 = getelementptr inbounds float, ptr %f_data.0920, i32 %add80
  %37 = load float, ptr %arrayidx81, align 4, !tbaa !15
  %38 = tail call float @llvm.fmuladd.f32(float %36, float %37, float %35)
  %arrayidx85 = getelementptr float, ptr %arrayidx, i32 %mul83
  %39 = load float, ptr %arrayidx85, align 4, !tbaa !15
  %mul86910 = add nsw i32 %n.0912, 7
  %add87 = mul i32 %mul86910, %5
  %arrayidx88 = getelementptr inbounds float, ptr %f_data.0920, i32 %add87
  %40 = load float, ptr %arrayidx88, align 4, !tbaa !15
  %41 = tail call float @llvm.fmuladd.f32(float %39, float %40, float %38)
  %add90 = add nsw i32 %n.0912, 8
  %cmp35 = icmp slt i32 %add90, %sub34
  br i1 %cmp35, label %for.body37, label %for.cond.cleanup36, !llvm.loop !19

for.cond.cleanup96:                               ; preds = %for.body97, %for.cond.cleanup36
  %acc.2.lcssa = phi float [ %acc.1.lcssa, %for.cond.cleanup36 ], [ %44, %for.body97 ]
  %add.ptr = getelementptr inbounds float, ptr %f_data.0920, i32 %mul13
  %add106 = add nsw i32 %i_pos_x.0922, %mul
  %inc108 = add nsw i32 %m.0919, 1
  %cmp30 = icmp slt i32 %inc108, %9
  br i1 %cmp30, label %for.cond33.preheader, label %for.cond.cleanup31, !llvm.loop !20

for.body97:                                       ; preds = %for.body97.lr.ph, %for.body97
  %acc.2916 = phi float [ %acc.1.lcssa, %for.body97.lr.ph ], [ %44, %for.body97 ]
  %n91.0915 = phi i32 [ %sub93, %for.body97.lr.ph ], [ %inc, %for.body97 ]
  %mul98 = mul nsw i32 %n91.0915, %0
  %arrayidx100 = getelementptr float, ptr %17, i32 %mul98
  %42 = load float, ptr %arrayidx100, align 4, !tbaa !15
  %mul101 = mul nsw i32 %n91.0915, %5
  %arrayidx102 = getelementptr inbounds float, ptr %f_data.0920, i32 %mul101
  %43 = load float, ptr %arrayidx102, align 4, !tbaa !15
  %44 = tail call float @llvm.fmuladd.f32(float %42, float %43, float %acc.2916)
  %inc = add nsw i32 %n91.0915, 1
  %cmp95 = icmp slt i32 %inc, %8
  br i1 %cmp95, label %for.body97, label %for.cond.cleanup96, !llvm.loop !21

for.cond207.preheader:                            ; preds = %for.cond.cleanup128, %for.cond118.preheader
  %i_pos_y.1.lcssa = phi i32 [ %i_pos_y.0.lcssa, %for.cond118.preheader ], [ %add199, %for.cond.cleanup128 ]
  br i1 %cmp208956.not, label %for.cond.cleanup209, label %for.body210.lr.ph

for.body210.lr.ph:                                ; preds = %for.cond207.preheader
  %cmp217948 = icmp slt i32 %sub22, %9
  br label %for.body210

for.cond126.preheader:                            ; preds = %for.cond126.preheader.lr.ph, %for.cond.cleanup128
  %i_pos_y.1942 = phi i32 [ %i_pos_y.0.lcssa, %for.cond126.preheader.lr.ph ], [ %add199, %for.cond.cleanup128 ]
  %x117.0941 = phi i32 [ %shr, %for.cond126.preheader.lr.ph ], [ %inc204, %for.cond.cleanup128 ]
  br i1 %cmp127932, label %for.cond131.preheader, label %for.cond.cleanup128

for.cond131.preheader:                            ; preds = %for.cond126.preheader, %for.cond.cleanup134
  %m125.0936 = phi i32 [ %inc197, %for.cond.cleanup134 ], [ %sub22, %for.cond126.preheader ]
  %f_data124.0935 = phi ptr [ %add.ptr194, %for.cond.cleanup134 ], [ %15, %for.cond126.preheader ]
  %acc123.0934 = phi float [ %acc123.1.lcssa, %for.cond.cleanup134 ], [ 0.000000e+00, %for.cond126.preheader ]
  %i_pos_x122.0933 = phi i32 [ %add195, %for.cond.cleanup134 ], [ %i_pos_y.1942, %for.cond126.preheader ]
  br i1 %cmp133928, label %for.body135.lr.ph, label %for.cond.cleanup134

for.body135.lr.ph:                                ; preds = %for.cond131.preheader
  %45 = getelementptr float, ptr %13, i32 %i_pos_x122.0933
  br label %for.body135

for.cond.cleanup128:                              ; preds = %for.cond.cleanup134, %for.cond126.preheader
  %acc123.0.lcssa = phi float [ 0.000000e+00, %for.cond126.preheader ], [ %acc123.1.lcssa, %for.cond.cleanup134 ]
  %add199 = add nsw i32 %i_pos_y.1942, %0
  %mul200 = mul nsw i32 %x117.0941, %10
  %gep939 = getelementptr float, ptr %invariant.gep, i32 %mul200
  store float %acc123.0.lcssa, ptr %gep939, align 4, !tbaa !15
  %inc204 = add nsw i32 %x117.0941, 1
  %exitcond1073.not = icmp eq i32 %inc204, %sub15
  br i1 %exitcond1073.not, label %for.cond207.preheader, label %for.cond126.preheader, !llvm.loop !22

for.cond.cleanup134:                              ; preds = %for.body135, %for.cond131.preheader
  %acc123.1.lcssa = phi float [ %acc123.0934, %for.cond131.preheader ], [ %69, %for.body135 ]
  %add.ptr194 = getelementptr inbounds float, ptr %f_data124.0935, i32 %mul13
  %add195 = add nsw i32 %i_pos_x122.0933, %mul
  %inc197 = add nsw i32 %m125.0936, 1
  %cmp127 = icmp slt i32 %inc197, %9
  br i1 %cmp127, label %for.cond131.preheader, label %for.cond.cleanup128, !llvm.loop !23

for.body135:                                      ; preds = %for.body135.lr.ph, %for.body135
  %n130.0930 = phi i32 [ 0, %for.body135.lr.ph ], [ %add192, %for.body135 ]
  %acc123.1929 = phi float [ %acc123.0934, %for.body135.lr.ph ], [ %69, %for.body135 ]
  %mul137 = mul nsw i32 %n130.0930, %0
  %mul140 = mul nsw i32 %n130.0930, %5
  %arrayidx141 = getelementptr float, ptr %45, i32 %mul137
  %46 = load float, ptr %arrayidx141, align 4, !tbaa !15
  %arrayidx142 = getelementptr inbounds float, ptr %f_data124.0935, i32 %mul140
  %47 = load float, ptr %arrayidx142, align 4, !tbaa !15
  %48 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %acc123.1929)
  %arrayidx145 = getelementptr float, ptr %arrayidx141, i32 %0
  %49 = load float, ptr %arrayidx145, align 4, !tbaa !15
  %add146 = add nsw i32 %mul140, %5
  %arrayidx147 = getelementptr inbounds float, ptr %f_data124.0935, i32 %add146
  %50 = load float, ptr %arrayidx147, align 4, !tbaa !15
  %51 = tail call float @llvm.fmuladd.f32(float %49, float %50, float %48)
  %arrayidx151 = getelementptr float, ptr %arrayidx141, i32 %mul48
  %52 = load float, ptr %arrayidx151, align 4, !tbaa !15
  %mul152899 = or disjoint i32 %n130.0930, 2
  %add153 = mul i32 %mul152899, %5
  %arrayidx154 = getelementptr inbounds float, ptr %f_data124.0935, i32 %add153
  %53 = load float, ptr %arrayidx154, align 4, !tbaa !15
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float %51)
  %arrayidx158 = getelementptr float, ptr %arrayidx141, i32 %mul55
  %55 = load float, ptr %arrayidx158, align 4, !tbaa !15
  %mul159900 = or disjoint i32 %n130.0930, 3
  %add160 = mul i32 %mul159900, %5
  %arrayidx161 = getelementptr inbounds float, ptr %f_data124.0935, i32 %add160
  %56 = load float, ptr %arrayidx161, align 4, !tbaa !15
  %57 = tail call float @llvm.fmuladd.f32(float %55, float %56, float %54)
  %arrayidx165 = getelementptr float, ptr %arrayidx141, i32 %mul62
  %58 = load float, ptr %arrayidx165, align 4, !tbaa !15
  %mul166901 = or disjoint i32 %n130.0930, 4
  %add167 = mul i32 %mul166901, %5
  %arrayidx168 = getelementptr inbounds float, ptr %f_data124.0935, i32 %add167
  %59 = load float, ptr %arrayidx168, align 4, !tbaa !15
  %60 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %57)
  %arrayidx172 = getelementptr float, ptr %arrayidx141, i32 %mul69
  %61 = load float, ptr %arrayidx172, align 4, !tbaa !15
  %mul173902 = or disjoint i32 %n130.0930, 5
  %add174 = mul i32 %mul173902, %5
  %arrayidx175 = getelementptr inbounds float, ptr %f_data124.0935, i32 %add174
  %62 = load float, ptr %arrayidx175, align 4, !tbaa !15
  %63 = tail call float @llvm.fmuladd.f32(float %61, float %62, float %60)
  %arrayidx179 = getelementptr float, ptr %arrayidx141, i32 %mul76
  %64 = load float, ptr %arrayidx179, align 4, !tbaa !15
  %mul180903 = or disjoint i32 %n130.0930, 6
  %add181 = mul i32 %mul180903, %5
  %arrayidx182 = getelementptr inbounds float, ptr %f_data124.0935, i32 %add181
  %65 = load float, ptr %arrayidx182, align 4, !tbaa !15
  %66 = tail call float @llvm.fmuladd.f32(float %64, float %65, float %63)
  %arrayidx186 = getelementptr float, ptr %arrayidx141, i32 %mul83
  %67 = load float, ptr %arrayidx186, align 4, !tbaa !15
  %mul187904 = or disjoint i32 %n130.0930, 7
  %add188 = mul i32 %mul187904, %5
  %arrayidx189 = getelementptr inbounds float, ptr %f_data124.0935, i32 %add188
  %68 = load float, ptr %arrayidx189, align 4, !tbaa !15
  %69 = tail call float @llvm.fmuladd.f32(float %67, float %68, float %66)
  %add192 = add nuw nsw i32 %n130.0930, 8
  %cmp133 = icmp slt i32 %add192, %sub34
  br i1 %cmp133, label %for.body135, label %for.cond.cleanup134, !llvm.loop !24

for.cond.cleanup209:                              ; preds = %for.cond.cleanup218, %for.cond207.preheader
  %add246 = add nsw i32 %i_pos.0961, %mul
  %inc248 = add nuw nsw i32 %y.0960, 1
  %exitcond1076.not = icmp eq i32 %inc248, %shr12
  br i1 %exitcond1076.not, label %for.cond251.preheader, label %for.body, !llvm.loop !25

for.body210:                                      ; preds = %for.body210.lr.ph, %for.cond.cleanup218
  %indvars.iv = phi i32 [ %8, %for.body210.lr.ph ], [ %indvars.iv.next, %for.cond.cleanup218 ]
  %i_pos_y.2958 = phi i32 [ %i_pos_y.1.lcssa, %for.body210.lr.ph ], [ %add239, %for.cond.cleanup218 ]
  %x206.0957 = phi i32 [ %sub21, %for.body210.lr.ph ], [ %inc244, %for.cond.cleanup218 ]
  br i1 %cmp217948, label %for.cond221.preheader.lr.ph, label %for.cond.cleanup218

for.cond221.preheader.lr.ph:                      ; preds = %for.body210
  %cmp222944 = icmp sgt i32 %sub20, %x206.0957
  br label %for.cond221.preheader

for.cond221.preheader:                            ; preds = %for.cond221.preheader.lr.ph, %for.cond.cleanup223
  %m215.0952 = phi i32 [ %sub22, %for.cond221.preheader.lr.ph ], [ %inc237, %for.cond.cleanup223 ]
  %f_data213.0951 = phi ptr [ %15, %for.cond221.preheader.lr.ph ], [ %add.ptr234, %for.cond.cleanup223 ]
  %acc212.0950 = phi float [ 0.000000e+00, %for.cond221.preheader.lr.ph ], [ %acc212.1.lcssa, %for.cond.cleanup223 ]
  %i_pos_x211.0949 = phi i32 [ %i_pos_y.2958, %for.cond221.preheader.lr.ph ], [ %add235, %for.cond.cleanup223 ]
  br i1 %cmp222944, label %for.body224.lr.ph, label %for.cond.cleanup223

for.body224.lr.ph:                                ; preds = %for.cond221.preheader
  %70 = getelementptr float, ptr %13, i32 %i_pos_x211.0949
  br label %for.body224

for.cond.cleanup218:                              ; preds = %for.cond.cleanup223, %for.body210
  %acc212.0.lcssa = phi float [ 0.000000e+00, %for.body210 ], [ %acc212.1.lcssa, %for.cond.cleanup223 ]
  %add239 = add nsw i32 %i_pos_y.2958, %0
  %mul240 = mul nsw i32 %x206.0957, %10
  %gep955 = getelementptr float, ptr %invariant.gep, i32 %mul240
  store float %acc212.0.lcssa, ptr %gep955, align 4, !tbaa !15
  %inc244 = add nsw i32 %x206.0957, 1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %exitcond1075.not = icmp eq i32 %inc244, %3
  br i1 %exitcond1075.not, label %for.cond.cleanup209, label %for.body210, !llvm.loop !26

for.cond.cleanup223:                              ; preds = %for.body224, %for.cond221.preheader
  %acc212.1.lcssa = phi float [ %acc212.0950, %for.cond221.preheader ], [ %73, %for.body224 ]
  %add.ptr234 = getelementptr inbounds float, ptr %f_data213.0951, i32 %mul13
  %add235 = add nsw i32 %i_pos_x211.0949, %mul
  %inc237 = add nsw i32 %m215.0952, 1
  %cmp217 = icmp slt i32 %inc237, %9
  br i1 %cmp217, label %for.cond221.preheader, label %for.cond.cleanup218, !llvm.loop !27

for.body224:                                      ; preds = %for.body224.lr.ph, %for.body224
  %n220.0946 = phi i32 [ 0, %for.body224.lr.ph ], [ %inc232, %for.body224 ]
  %acc212.1945 = phi float [ %acc212.0950, %for.body224.lr.ph ], [ %73, %for.body224 ]
  %mul225 = mul nsw i32 %n220.0946, %0
  %arrayidx227 = getelementptr float, ptr %70, i32 %mul225
  %71 = load float, ptr %arrayidx227, align 4, !tbaa !15
  %mul228 = mul nsw i32 %n220.0946, %5
  %arrayidx229 = getelementptr inbounds float, ptr %f_data213.0951, i32 %mul228
  %72 = load float, ptr %arrayidx229, align 4, !tbaa !15
  %73 = tail call float @llvm.fmuladd.f32(float %71, float %72, float %acc212.1945)
  %inc232 = add nuw nsw i32 %n220.0946, 1
  %exitcond1074.not = icmp eq i32 %inc232, %indvars.iv
  br i1 %exitcond1074.not, label %for.cond.cleanup223, label %for.body224, !llvm.loop !28

for.cond343.preheader:                            ; preds = %for.cond.cleanup301, %for.cond251.preheader
  %cmp3441043 = icmp slt i32 %sub17, %4
  br i1 %cmp3441043, label %for.body346.lr.ph, label %for.cond476.preheader

for.body346.lr.ph:                                ; preds = %for.cond343.preheader
  %cmp3531008 = icmp sgt i32 %shr, 0
  %cmp3941024 = icmp slt i32 %shr, %sub15
  %cmp4071012 = icmp sgt i32 %8, 0
  %cmp4331040 = icmp slt i32 %sub15, %3
  br label %for.body346

for.body254:                                      ; preds = %for.body254.lr.ph, %for.cond.cleanup301
  %i_pos.1995 = phi i32 [ 0, %for.body254.lr.ph ], [ %add338, %for.cond.cleanup301 ]
  %y250.0994 = phi i32 [ %shr12, %for.body254.lr.ph ], [ %inc340, %for.cond.cleanup301 ]
  %mul257 = mul nsw i32 %y250.0994, %mul14
  %invariant.gep972 = getelementptr float, ptr %14, i32 %mul257
  br i1 %cmp260974, label %for.body262, label %for.cond299.preheader

for.cond299.preheader:                            ; preds = %for.cond.cleanup270, %for.body254
  %i_pos_y255.0.lcssa = phi i32 [ %i_pos.1995, %for.body254 ], [ %add291, %for.cond.cleanup270 ]
  br i1 %cmp300990.not, label %for.cond.cleanup301, label %for.body302

for.body262:                                      ; preds = %for.body254, %for.cond.cleanup270
  %x258.0976 = phi i32 [ %inc296, %for.cond.cleanup270 ], [ 0, %for.body254 ]
  %i_pos_y255.0975 = phi i32 [ %add291, %for.cond.cleanup270 ], [ %i_pos.1995, %for.body254 ]
  %sub265 = sub nsw i32 %shr, %x258.0976
  br i1 %cmp269966, label %for.cond273.preheader.lr.ph, label %for.cond.cleanup270

for.cond273.preheader.lr.ph:                      ; preds = %for.body262
  %cmp274962 = icmp slt i32 %sub265, %8
  br label %for.cond273.preheader

for.cond273.preheader:                            ; preds = %for.cond273.preheader.lr.ph, %for.cond.cleanup275
  %m267.0970 = phi i32 [ 0, %for.cond273.preheader.lr.ph ], [ %inc289, %for.cond.cleanup275 ]
  %f_data266.0969 = phi ptr [ %15, %for.cond273.preheader.lr.ph ], [ %add.ptr286, %for.cond.cleanup275 ]
  %acc264.0968 = phi float [ 0.000000e+00, %for.cond273.preheader.lr.ph ], [ %acc264.1.lcssa, %for.cond.cleanup275 ]
  %i_pos_x263.0967 = phi i32 [ %i_pos_y255.0975, %for.cond273.preheader.lr.ph ], [ %add287, %for.cond.cleanup275 ]
  br i1 %cmp274962, label %for.body276.lr.ph, label %for.cond.cleanup275

for.body276.lr.ph:                                ; preds = %for.cond273.preheader
  %74 = getelementptr float, ptr %13, i32 %i_pos_x263.0967
  br label %for.body276

for.cond.cleanup270:                              ; preds = %for.cond.cleanup275, %for.body262
  %acc264.0.lcssa = phi float [ 0.000000e+00, %for.body262 ], [ %acc264.1.lcssa, %for.cond.cleanup275 ]
  %add291 = add nsw i32 %i_pos_y255.0975, %0
  %mul292 = mul nsw i32 %x258.0976, %10
  %gep973 = getelementptr float, ptr %invariant.gep972, i32 %mul292
  store float %acc264.0.lcssa, ptr %gep973, align 4, !tbaa !15
  %inc296 = add nuw nsw i32 %x258.0976, 1
  %exitcond1078.not = icmp eq i32 %inc296, %shr
  br i1 %exitcond1078.not, label %for.cond299.preheader, label %for.body262, !llvm.loop !29

for.cond.cleanup275:                              ; preds = %for.body276, %for.cond273.preheader
  %acc264.1.lcssa = phi float [ %acc264.0968, %for.cond273.preheader ], [ %77, %for.body276 ]
  %add.ptr286 = getelementptr inbounds float, ptr %f_data266.0969, i32 %mul13
  %add287 = add nsw i32 %i_pos_x263.0967, %mul
  %inc289 = add nuw nsw i32 %m267.0970, 1
  %exitcond1077.not = icmp eq i32 %inc289, %9
  br i1 %exitcond1077.not, label %for.cond.cleanup270, label %for.cond273.preheader, !llvm.loop !30

for.body276:                                      ; preds = %for.body276.lr.ph, %for.body276
  %n272.0964 = phi i32 [ %sub265, %for.body276.lr.ph ], [ %inc284, %for.body276 ]
  %acc264.1963 = phi float [ %acc264.0968, %for.body276.lr.ph ], [ %77, %for.body276 ]
  %mul277 = mul nsw i32 %n272.0964, %0
  %arrayidx279 = getelementptr float, ptr %74, i32 %mul277
  %75 = load float, ptr %arrayidx279, align 4, !tbaa !15
  %mul280 = mul nsw i32 %n272.0964, %5
  %arrayidx281 = getelementptr inbounds float, ptr %f_data266.0969, i32 %mul280
  %76 = load float, ptr %arrayidx281, align 4, !tbaa !15
  %77 = tail call float @llvm.fmuladd.f32(float %75, float %76, float %acc264.1963)
  %inc284 = add nsw i32 %n272.0964, 1
  %cmp274 = icmp slt i32 %inc284, %8
  br i1 %cmp274, label %for.body276, label %for.cond.cleanup275, !llvm.loop !31

for.cond.cleanup301:                              ; preds = %for.cond.cleanup310, %for.cond299.preheader
  %add338 = add nsw i32 %i_pos.1995, %mul
  %inc340 = add nsw i32 %y250.0994, 1
  %exitcond1084.not = icmp eq i32 %inc340, %sub17
  br i1 %exitcond1084.not, label %for.cond343.preheader, label %for.body254, !llvm.loop !32

for.body302:                                      ; preds = %for.cond299.preheader, %for.cond.cleanup310
  %indvars.iv1079 = phi i32 [ %indvars.iv.next1080, %for.cond.cleanup310 ], [ %8, %for.cond299.preheader ]
  %x298.0992 = phi i32 [ %inc336, %for.cond.cleanup310 ], [ %sub21, %for.cond299.preheader ]
  %i_pos_y255.1991 = phi i32 [ %add331, %for.cond.cleanup310 ], [ %i_pos_y255.0.lcssa, %for.cond299.preheader ]
  br i1 %cmp269966, label %for.cond313.preheader.lr.ph, label %for.cond.cleanup310

for.cond313.preheader.lr.ph:                      ; preds = %for.body302
  %cmp314978 = icmp sgt i32 %sub20, %x298.0992
  br label %for.cond313.preheader

for.cond313.preheader:                            ; preds = %for.cond313.preheader.lr.ph, %for.cond.cleanup315
  %m307.0986 = phi i32 [ 0, %for.cond313.preheader.lr.ph ], [ %inc329, %for.cond.cleanup315 ]
  %f_data305.0985 = phi ptr [ %15, %for.cond313.preheader.lr.ph ], [ %add.ptr326, %for.cond.cleanup315 ]
  %acc304.0984 = phi float [ 0.000000e+00, %for.cond313.preheader.lr.ph ], [ %acc304.1.lcssa, %for.cond.cleanup315 ]
  %i_pos_x303.0983 = phi i32 [ %i_pos_y255.1991, %for.cond313.preheader.lr.ph ], [ %add327, %for.cond.cleanup315 ]
  br i1 %cmp314978, label %for.body316.lr.ph, label %for.cond.cleanup315

for.body316.lr.ph:                                ; preds = %for.cond313.preheader
  %78 = getelementptr float, ptr %13, i32 %i_pos_x303.0983
  br label %for.body316

for.cond.cleanup310:                              ; preds = %for.cond.cleanup315, %for.body302
  %acc304.0.lcssa = phi float [ 0.000000e+00, %for.body302 ], [ %acc304.1.lcssa, %for.cond.cleanup315 ]
  %add331 = add nsw i32 %i_pos_y255.1991, %0
  %mul332 = mul nsw i32 %x298.0992, %10
  %gep989 = getelementptr float, ptr %invariant.gep972, i32 %mul332
  store float %acc304.0.lcssa, ptr %gep989, align 4, !tbaa !15
  %inc336 = add nsw i32 %x298.0992, 1
  %indvars.iv.next1080 = add i32 %indvars.iv1079, -1
  %exitcond1083.not = icmp eq i32 %inc336, %3
  br i1 %exitcond1083.not, label %for.cond.cleanup301, label %for.body302, !llvm.loop !33

for.cond.cleanup315:                              ; preds = %for.body316, %for.cond313.preheader
  %acc304.1.lcssa = phi float [ %acc304.0984, %for.cond313.preheader ], [ %81, %for.body316 ]
  %add.ptr326 = getelementptr inbounds float, ptr %f_data305.0985, i32 %mul13
  %add327 = add nsw i32 %i_pos_x303.0983, %mul
  %inc329 = add nuw nsw i32 %m307.0986, 1
  %exitcond1082.not = icmp eq i32 %inc329, %9
  br i1 %exitcond1082.not, label %for.cond.cleanup310, label %for.cond313.preheader, !llvm.loop !34

for.body316:                                      ; preds = %for.body316.lr.ph, %for.body316
  %n312.0980 = phi i32 [ 0, %for.body316.lr.ph ], [ %inc324, %for.body316 ]
  %acc304.1979 = phi float [ %acc304.0984, %for.body316.lr.ph ], [ %81, %for.body316 ]
  %mul317 = mul nsw i32 %n312.0980, %0
  %arrayidx319 = getelementptr float, ptr %78, i32 %mul317
  %79 = load float, ptr %arrayidx319, align 4, !tbaa !15
  %mul320 = mul nsw i32 %n312.0980, %5
  %arrayidx321 = getelementptr inbounds float, ptr %f_data305.0985, i32 %mul320
  %80 = load float, ptr %arrayidx321, align 4, !tbaa !15
  %81 = tail call float @llvm.fmuladd.f32(float %79, float %80, float %acc304.1979)
  %inc324 = add nuw nsw i32 %n312.0980, 1
  %exitcond1081.not = icmp eq i32 %inc324, %indvars.iv1079
  br i1 %exitcond1081.not, label %for.cond.cleanup315, label %for.body316, !llvm.loop !35

for.cond476.preheader:                            ; preds = %for.cond.cleanup434, %for.cond343.preheader
  br i1 %cmp252993, label %for.body479.lr.ph, label %for.cond.cleanup478

for.body479.lr.ph:                                ; preds = %for.cond476.preheader
  %cmp4851058 = icmp slt i32 %shr, %sub15
  %cmp4931050 = icmp sgt i32 %9, 0
  %cmp4981046 = icmp sgt i32 %8, 0
  br label %for.body479

for.body346:                                      ; preds = %for.body346.lr.ph, %for.cond.cleanup434
  %indvars.iv1085 = phi i32 [ %sub11, %for.body346.lr.ph ], [ %indvars.iv.next1086, %for.cond.cleanup434 ]
  %i_pos.21045 = phi i32 [ 0, %for.body346.lr.ph ], [ %add471, %for.cond.cleanup434 ]
  %y342.01044 = phi i32 [ %sub17, %for.body346.lr.ph ], [ %inc473, %for.cond.cleanup434 ]
  %82 = xor i32 %y342.01044, -1
  %sub348 = add i32 %add, %82
  %mul350 = mul nsw i32 %y342.01044, %mul14
  %invariant.gep1006 = getelementptr float, ptr %14, i32 %mul350
  br i1 %cmp3531008, label %for.body355.lr.ph, label %for.cond393.preheader

for.body355.lr.ph:                                ; preds = %for.body346
  %cmp3631000 = icmp sgt i32 %sub348, 0
  br label %for.body355

for.cond393.preheader:                            ; preds = %for.cond.cleanup364, %for.body346
  %i_pos_y347.0.lcssa = phi i32 [ %i_pos.21045, %for.body346 ], [ %add385, %for.cond.cleanup364 ]
  br i1 %cmp3941024, label %for.cond401.preheader.lr.ph, label %for.cond432.preheader

for.cond401.preheader.lr.ph:                      ; preds = %for.cond393.preheader
  %cmp4021016 = icmp sgt i32 %sub348, 0
  br label %for.cond401.preheader

for.body355:                                      ; preds = %for.body355.lr.ph, %for.cond.cleanup364
  %x351.01010 = phi i32 [ 0, %for.body355.lr.ph ], [ %inc390, %for.cond.cleanup364 ]
  %i_pos_y347.01009 = phi i32 [ %i_pos.21045, %for.body355.lr.ph ], [ %add385, %for.cond.cleanup364 ]
  %sub360 = sub nsw i32 %shr, %x351.01010
  br i1 %cmp3631000, label %for.cond367.preheader.lr.ph, label %for.cond.cleanup364

for.cond367.preheader.lr.ph:                      ; preds = %for.body355
  %cmp368996 = icmp slt i32 %sub360, %8
  br label %for.cond367.preheader

for.cond367.preheader:                            ; preds = %for.cond367.preheader.lr.ph, %for.cond.cleanup369
  %m361.01004 = phi i32 [ 0, %for.cond367.preheader.lr.ph ], [ %inc383, %for.cond.cleanup369 ]
  %f_data358.01003 = phi ptr [ %15, %for.cond367.preheader.lr.ph ], [ %add.ptr380, %for.cond.cleanup369 ]
  %acc357.01002 = phi float [ 0.000000e+00, %for.cond367.preheader.lr.ph ], [ %acc357.1.lcssa, %for.cond.cleanup369 ]
  %i_pos_x356.01001 = phi i32 [ %i_pos_y347.01009, %for.cond367.preheader.lr.ph ], [ %add381, %for.cond.cleanup369 ]
  br i1 %cmp368996, label %for.body370.lr.ph, label %for.cond.cleanup369

for.body370.lr.ph:                                ; preds = %for.cond367.preheader
  %83 = getelementptr float, ptr %13, i32 %i_pos_x356.01001
  br label %for.body370

for.cond.cleanup364:                              ; preds = %for.cond.cleanup369, %for.body355
  %acc357.0.lcssa = phi float [ 0.000000e+00, %for.body355 ], [ %acc357.1.lcssa, %for.cond.cleanup369 ]
  %add385 = add nsw i32 %i_pos_y347.01009, %0
  %mul386 = mul nsw i32 %x351.01010, %10
  %gep1007 = getelementptr float, ptr %invariant.gep1006, i32 %mul386
  store float %acc357.0.lcssa, ptr %gep1007, align 4, !tbaa !15
  %inc390 = add nuw nsw i32 %x351.01010, 1
  %exitcond1088.not = icmp eq i32 %inc390, %shr
  br i1 %exitcond1088.not, label %for.cond393.preheader, label %for.body355, !llvm.loop !36

for.cond.cleanup369:                              ; preds = %for.body370, %for.cond367.preheader
  %acc357.1.lcssa = phi float [ %acc357.01002, %for.cond367.preheader ], [ %86, %for.body370 ]
  %add.ptr380 = getelementptr inbounds float, ptr %f_data358.01003, i32 %mul13
  %add381 = add nsw i32 %i_pos_x356.01001, %mul
  %inc383 = add nuw nsw i32 %m361.01004, 1
  %exitcond1087.not = icmp eq i32 %inc383, %indvars.iv1085
  br i1 %exitcond1087.not, label %for.cond.cleanup364, label %for.cond367.preheader, !llvm.loop !37

for.body370:                                      ; preds = %for.body370.lr.ph, %for.body370
  %n366.0998 = phi i32 [ %sub360, %for.body370.lr.ph ], [ %inc378, %for.body370 ]
  %acc357.1997 = phi float [ %acc357.01002, %for.body370.lr.ph ], [ %86, %for.body370 ]
  %mul371 = mul nsw i32 %n366.0998, %0
  %arrayidx373 = getelementptr float, ptr %83, i32 %mul371
  %84 = load float, ptr %arrayidx373, align 4, !tbaa !15
  %mul374 = mul nsw i32 %n366.0998, %5
  %arrayidx375 = getelementptr inbounds float, ptr %f_data358.01003, i32 %mul374
  %85 = load float, ptr %arrayidx375, align 4, !tbaa !15
  %86 = tail call float @llvm.fmuladd.f32(float %84, float %85, float %acc357.1997)
  %inc378 = add nsw i32 %n366.0998, 1
  %cmp368 = icmp slt i32 %inc378, %8
  br i1 %cmp368, label %for.body370, label %for.cond.cleanup369, !llvm.loop !38

for.cond432.preheader:                            ; preds = %for.cond.cleanup403, %for.cond393.preheader
  %i_pos_y347.1.lcssa = phi i32 [ %i_pos_y347.0.lcssa, %for.cond393.preheader ], [ %add424, %for.cond.cleanup403 ]
  br i1 %cmp4331040, label %for.cond440.preheader.lr.ph, label %for.cond.cleanup434

for.cond440.preheader.lr.ph:                      ; preds = %for.cond432.preheader
  %cmp4411032 = icmp sgt i32 %sub348, 0
  br label %for.cond440.preheader

for.cond401.preheader:                            ; preds = %for.cond401.preheader.lr.ph, %for.cond.cleanup403
  %x392.01026 = phi i32 [ %shr, %for.cond401.preheader.lr.ph ], [ %inc429, %for.cond.cleanup403 ]
  %i_pos_y347.11025 = phi i32 [ %i_pos_y347.0.lcssa, %for.cond401.preheader.lr.ph ], [ %add424, %for.cond.cleanup403 ]
  br i1 %cmp4021016, label %for.cond406.preheader, label %for.cond.cleanup403

for.cond406.preheader:                            ; preds = %for.cond401.preheader, %for.cond.cleanup408
  %m400.01020 = phi i32 [ %inc422, %for.cond.cleanup408 ], [ 0, %for.cond401.preheader ]
  %f_data399.01019 = phi ptr [ %add.ptr419, %for.cond.cleanup408 ], [ %15, %for.cond401.preheader ]
  %acc398.01018 = phi float [ %acc398.1.lcssa, %for.cond.cleanup408 ], [ 0.000000e+00, %for.cond401.preheader ]
  %i_pos_x397.01017 = phi i32 [ %add420, %for.cond.cleanup408 ], [ %i_pos_y347.11025, %for.cond401.preheader ]
  br i1 %cmp4071012, label %for.body409.lr.ph, label %for.cond.cleanup408

for.body409.lr.ph:                                ; preds = %for.cond406.preheader
  %87 = getelementptr float, ptr %13, i32 %i_pos_x397.01017
  br label %for.body409

for.cond.cleanup403:                              ; preds = %for.cond.cleanup408, %for.cond401.preheader
  %acc398.0.lcssa = phi float [ 0.000000e+00, %for.cond401.preheader ], [ %acc398.1.lcssa, %for.cond.cleanup408 ]
  %add424 = add nsw i32 %i_pos_y347.11025, %0
  %mul425 = mul nsw i32 %x392.01026, %10
  %gep1023 = getelementptr float, ptr %invariant.gep1006, i32 %mul425
  store float %acc398.0.lcssa, ptr %gep1023, align 4, !tbaa !15
  %inc429 = add nsw i32 %x392.01026, 1
  %exitcond1091.not = icmp eq i32 %inc429, %sub15
  br i1 %exitcond1091.not, label %for.cond432.preheader, label %for.cond401.preheader, !llvm.loop !39

for.cond.cleanup408:                              ; preds = %for.body409, %for.cond406.preheader
  %acc398.1.lcssa = phi float [ %acc398.01018, %for.cond406.preheader ], [ %90, %for.body409 ]
  %add.ptr419 = getelementptr inbounds float, ptr %f_data399.01019, i32 %mul13
  %add420 = add nsw i32 %i_pos_x397.01017, %mul
  %inc422 = add nuw nsw i32 %m400.01020, 1
  %exitcond1090.not = icmp eq i32 %inc422, %indvars.iv1085
  br i1 %exitcond1090.not, label %for.cond.cleanup403, label %for.cond406.preheader, !llvm.loop !40

for.body409:                                      ; preds = %for.body409.lr.ph, %for.body409
  %n405.01014 = phi i32 [ 0, %for.body409.lr.ph ], [ %inc417, %for.body409 ]
  %acc398.11013 = phi float [ %acc398.01018, %for.body409.lr.ph ], [ %90, %for.body409 ]
  %mul410 = mul nsw i32 %n405.01014, %0
  %arrayidx412 = getelementptr float, ptr %87, i32 %mul410
  %88 = load float, ptr %arrayidx412, align 4, !tbaa !15
  %mul413 = mul nsw i32 %n405.01014, %5
  %arrayidx414 = getelementptr inbounds float, ptr %f_data399.01019, i32 %mul413
  %89 = load float, ptr %arrayidx414, align 4, !tbaa !15
  %90 = tail call float @llvm.fmuladd.f32(float %88, float %89, float %acc398.11013)
  %inc417 = add nuw nsw i32 %n405.01014, 1
  %exitcond1089.not = icmp eq i32 %inc417, %8
  br i1 %exitcond1089.not, label %for.cond.cleanup408, label %for.body409, !llvm.loop !41

for.cond440.preheader:                            ; preds = %for.cond440.preheader.lr.ph, %for.cond.cleanup442
  %indvars.iv1092 = phi i32 [ %sub, %for.cond440.preheader.lr.ph ], [ %indvars.iv.next1093, %for.cond.cleanup442 ]
  %x431.01042 = phi i32 [ %sub15, %for.cond440.preheader.lr.ph ], [ %inc469, %for.cond.cleanup442 ]
  %i_pos_y347.21041 = phi i32 [ %i_pos_y347.1.lcssa, %for.cond440.preheader.lr.ph ], [ %add464, %for.cond.cleanup442 ]
  br i1 %cmp4411032, label %for.cond445.preheader.lr.ph, label %for.cond.cleanup442

for.cond445.preheader.lr.ph:                      ; preds = %for.cond440.preheader
  %cmp4471028 = icmp sgt i32 %sub20, %x431.01042
  br label %for.cond445.preheader

for.cond.cleanup434:                              ; preds = %for.cond.cleanup442, %for.cond432.preheader
  %add471 = add nsw i32 %i_pos.21045, %mul
  %inc473 = add nsw i32 %y342.01044, 1
  %indvars.iv.next1086 = add i32 %indvars.iv1085, -1
  %exitcond1097.not = icmp eq i32 %inc473, %4
  br i1 %exitcond1097.not, label %for.cond476.preheader, label %for.body346, !llvm.loop !42

for.cond445.preheader:                            ; preds = %for.cond445.preheader.lr.ph, %for.cond.cleanup448
  %m439.01036 = phi i32 [ 0, %for.cond445.preheader.lr.ph ], [ %inc462, %for.cond.cleanup448 ]
  %f_data438.01035 = phi ptr [ %15, %for.cond445.preheader.lr.ph ], [ %add.ptr459, %for.cond.cleanup448 ]
  %acc437.01034 = phi float [ 0.000000e+00, %for.cond445.preheader.lr.ph ], [ %acc437.1.lcssa, %for.cond.cleanup448 ]
  %i_pos_x436.01033 = phi i32 [ %i_pos_y347.21041, %for.cond445.preheader.lr.ph ], [ %add460, %for.cond.cleanup448 ]
  br i1 %cmp4471028, label %for.body449.lr.ph, label %for.cond.cleanup448

for.body449.lr.ph:                                ; preds = %for.cond445.preheader
  %91 = getelementptr float, ptr %13, i32 %i_pos_x436.01033
  br label %for.body449

for.cond.cleanup442:                              ; preds = %for.cond.cleanup448, %for.cond440.preheader
  %acc437.0.lcssa = phi float [ 0.000000e+00, %for.cond440.preheader ], [ %acc437.1.lcssa, %for.cond.cleanup448 ]
  %add464 = add nsw i32 %i_pos_y347.21041, %0
  %mul465 = mul nsw i32 %x431.01042, %10
  %gep1039 = getelementptr float, ptr %invariant.gep1006, i32 %mul465
  store float %acc437.0.lcssa, ptr %gep1039, align 4, !tbaa !15
  %inc469 = add nsw i32 %x431.01042, 1
  %indvars.iv.next1093 = add i32 %indvars.iv1092, -1
  %exitcond1096.not = icmp eq i32 %inc469, %3
  br i1 %exitcond1096.not, label %for.cond.cleanup434, label %for.cond440.preheader, !llvm.loop !43

for.cond.cleanup448:                              ; preds = %for.body449, %for.cond445.preheader
  %acc437.1.lcssa = phi float [ %acc437.01034, %for.cond445.preheader ], [ %94, %for.body449 ]
  %add.ptr459 = getelementptr inbounds float, ptr %f_data438.01035, i32 %mul13
  %add460 = add nsw i32 %i_pos_x436.01033, %mul
  %inc462 = add nuw nsw i32 %m439.01036, 1
  %exitcond1095.not = icmp eq i32 %inc462, %indvars.iv1085
  br i1 %exitcond1095.not, label %for.cond.cleanup442, label %for.cond445.preheader, !llvm.loop !44

for.body449:                                      ; preds = %for.body449.lr.ph, %for.body449
  %n444.01030 = phi i32 [ 0, %for.body449.lr.ph ], [ %inc457, %for.body449 ]
  %acc437.11029 = phi float [ %acc437.01034, %for.body449.lr.ph ], [ %94, %for.body449 ]
  %mul450 = mul nsw i32 %n444.01030, %0
  %arrayidx452 = getelementptr float, ptr %91, i32 %mul450
  %92 = load float, ptr %arrayidx452, align 4, !tbaa !15
  %mul453 = mul nsw i32 %n444.01030, %5
  %arrayidx454 = getelementptr inbounds float, ptr %f_data438.01035, i32 %mul453
  %93 = load float, ptr %arrayidx454, align 4, !tbaa !15
  %94 = tail call float @llvm.fmuladd.f32(float %92, float %93, float %acc437.11029)
  %inc457 = add nuw nsw i32 %n444.01030, 1
  %exitcond1094.not = icmp eq i32 %inc457, %indvars.iv1092
  br i1 %exitcond1094.not, label %for.cond.cleanup448, label %for.body449, !llvm.loop !45

for.cond.cleanup478:                              ; preds = %for.cond.cleanup486, %for.cond476.preheader
  ret i32 0

for.body479:                                      ; preds = %for.body479.lr.ph, %for.cond.cleanup486
  %i_pos.31063 = phi i32 [ 0, %for.body479.lr.ph ], [ %add522, %for.cond.cleanup486 ]
  %y475.01062 = phi i32 [ %shr12, %for.body479.lr.ph ], [ %inc524, %for.cond.cleanup486 ]
  %mul482 = mul nsw i32 %y475.01062, %mul14
  %invariant.gep1056 = getelementptr float, ptr %14, i32 %mul482
  br i1 %cmp4851058, label %for.cond492.preheader, label %for.cond.cleanup486

for.cond492.preheader:                            ; preds = %for.body479, %for.cond.cleanup494
  %x483.01060 = phi i32 [ %inc520, %for.cond.cleanup494 ], [ %shr, %for.body479 ]
  %i_pos_y480.01059 = phi i32 [ %add515, %for.cond.cleanup494 ], [ %i_pos.31063, %for.body479 ]
  br i1 %cmp4931050, label %for.cond497.preheader, label %for.cond.cleanup494

for.cond.cleanup486:                              ; preds = %for.cond.cleanup494, %for.body479
  %add522 = add nsw i32 %i_pos.31063, %mul
  %inc524 = add nsw i32 %y475.01062, 1
  %exitcond1101.not = icmp eq i32 %inc524, %sub17
  br i1 %exitcond1101.not, label %for.cond.cleanup478, label %for.body479, !llvm.loop !46

for.cond497.preheader:                            ; preds = %for.cond492.preheader, %for.cond.cleanup499
  %m491.01054 = phi i32 [ %inc513, %for.cond.cleanup499 ], [ 0, %for.cond492.preheader ]
  %f_data490.01053 = phi ptr [ %add.ptr510, %for.cond.cleanup499 ], [ %15, %for.cond492.preheader ]
  %acc489.01052 = phi float [ %acc489.1.lcssa, %for.cond.cleanup499 ], [ 0.000000e+00, %for.cond492.preheader ]
  %i_pos_x488.01051 = phi i32 [ %add511, %for.cond.cleanup499 ], [ %i_pos_y480.01059, %for.cond492.preheader ]
  br i1 %cmp4981046, label %for.body500.lr.ph, label %for.cond.cleanup499

for.body500.lr.ph:                                ; preds = %for.cond497.preheader
  %95 = getelementptr float, ptr %13, i32 %i_pos_x488.01051
  br label %for.body500

for.cond.cleanup494:                              ; preds = %for.cond.cleanup499, %for.cond492.preheader
  %acc489.0.lcssa = phi float [ 0.000000e+00, %for.cond492.preheader ], [ %acc489.1.lcssa, %for.cond.cleanup499 ]
  %add515 = add nsw i32 %i_pos_y480.01059, %0
  %mul516 = mul nsw i32 %x483.01060, %10
  %gep1057 = getelementptr float, ptr %invariant.gep1056, i32 %mul516
  store float %acc489.0.lcssa, ptr %gep1057, align 4, !tbaa !15
  %inc520 = add nsw i32 %x483.01060, 1
  %exitcond1100.not = icmp eq i32 %inc520, %sub15
  br i1 %exitcond1100.not, label %for.cond.cleanup486, label %for.cond492.preheader, !llvm.loop !47

for.cond.cleanup499:                              ; preds = %for.body500, %for.cond497.preheader
  %acc489.1.lcssa = phi float [ %acc489.01052, %for.cond497.preheader ], [ %98, %for.body500 ]
  %add.ptr510 = getelementptr inbounds float, ptr %f_data490.01053, i32 %mul13
  %add511 = add nsw i32 %i_pos_x488.01051, %mul
  %inc513 = add nuw nsw i32 %m491.01054, 1
  %exitcond1099.not = icmp eq i32 %inc513, %9
  br i1 %exitcond1099.not, label %for.cond.cleanup494, label %for.cond497.preheader, !llvm.loop !48

for.body500:                                      ; preds = %for.body500.lr.ph, %for.body500
  %n496.01048 = phi i32 [ 0, %for.body500.lr.ph ], [ %inc508, %for.body500 ]
  %acc489.11047 = phi float [ %acc489.01052, %for.body500.lr.ph ], [ %98, %for.body500 ]
  %mul501 = mul nsw i32 %n496.01048, %0
  %arrayidx503 = getelementptr float, ptr %95, i32 %mul501
  %96 = load float, ptr %arrayidx503, align 4, !tbaa !15
  %mul504 = mul nsw i32 %n496.01048, %5
  %arrayidx505 = getelementptr inbounds float, ptr %f_data490.01053, i32 %mul504
  %97 = load float, ptr %arrayidx505, align 4, !tbaa !15
  %98 = tail call float @llvm.fmuladd.f32(float %96, float %97, float %acc489.11047)
  %inc508 = add nuw nsw i32 %n496.01048, 1
  %exitcond1098.not = icmp eq i32 %inc508, %8
  br i1 %exitcond1098.not, label %for.cond.cleanup499, label %for.body500, !llvm.loop !49
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
