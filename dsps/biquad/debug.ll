; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_biquad_f32_ansi(ptr noalias nocapture noundef readonly %input, ptr noalias nocapture noundef writeonly %output, i32 noundef %len, ptr noalias nocapture noundef readonly %coef, ptr noalias nocapture noundef %w) local_unnamed_addr #0 {
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.cond.preheader, label %for.body.lr.ph.clone

for.cond.preheader:                               ; preds = %entry
  %sub = add nuw nsw i32 %len, -7
  %arrayidx1 = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3 = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4 = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7 = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10 = getelementptr inbounds float, ptr %coef, i32 2
  %.pre = load float, ptr %w, align 4, !tbaa !4
  %.pre32 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %1 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %2 = load float, ptr %arrayidx3, align 4, !tbaa !4
  %3 = load float, ptr %coef, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx7, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx10, align 4, !tbaa !4
  %6 = fneg float %1
  %7 = fneg float %2
  br label %for.body.7

if.end:                                           ; preds = %for.cond150.preheader, %for.body.clone, %for.cond.cleanup.clone
  ret i32 0

for.cond150.preheader:                            ; preds = %for.body.7
  %cmp151376 = icmp slt i32 %inc.7, %len
  br i1 %cmp151376, label %for.body.lr.ph.clone8, label %if.end

for.body.7:                                       ; preds = %for.body.7, %for.cond.preheader
  %8 = phi float [ %.pre, %for.cond.preheader ], [ %47, %for.body.7 ]
  %9 = phi float [ %.pre32, %for.cond.preheader ], [ %42, %for.body.7 ]
  %i.031 = phi i32 [ 0, %for.cond.preheader ], [ %inc.7, %for.body.7 ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.031
  %10 = load float, ptr %arrayidx, align 4, !tbaa !4
  %11 = tail call float @llvm.fmuladd.f32(float %6, float %8, float %10)
  %12 = tail call float @llvm.fmuladd.f32(float %7, float %9, float %11)
  %mul9 = fmul float %8, %4
  %13 = tail call float @llvm.fmuladd.f32(float %3, float %12, float %mul9)
  %14 = tail call float @llvm.fmuladd.f32(float %5, float %9, float %13)
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %i.031
  store float %14, ptr %arrayidx12, align 4, !tbaa !4
  %inc = or disjoint i32 %i.031, 1
  %arrayidx.1 = getelementptr inbounds float, ptr %input, i32 %inc
  %15 = load float, ptr %arrayidx.1, align 4, !tbaa !4
  %16 = tail call float @llvm.fmuladd.f32(float %6, float %12, float %15)
  %17 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %16)
  %mul9.1 = fmul float %12, %4
  %18 = tail call float @llvm.fmuladd.f32(float %3, float %17, float %mul9.1)
  %19 = tail call float @llvm.fmuladd.f32(float %5, float %8, float %18)
  %arrayidx12.1 = getelementptr inbounds float, ptr %output, i32 %inc
  store float %19, ptr %arrayidx12.1, align 4, !tbaa !4
  %inc.1 = or disjoint i32 %i.031, 2
  %arrayidx.2 = getelementptr inbounds float, ptr %input, i32 %inc.1
  %20 = load float, ptr %arrayidx.2, align 4, !tbaa !4
  %21 = tail call float @llvm.fmuladd.f32(float %6, float %17, float %20)
  %22 = tail call float @llvm.fmuladd.f32(float %7, float %12, float %21)
  %mul9.2 = fmul float %17, %4
  %23 = tail call float @llvm.fmuladd.f32(float %3, float %22, float %mul9.2)
  %24 = tail call float @llvm.fmuladd.f32(float %5, float %12, float %23)
  %arrayidx12.2 = getelementptr inbounds float, ptr %output, i32 %inc.1
  store float %24, ptr %arrayidx12.2, align 4, !tbaa !4
  %inc.2 = or disjoint i32 %i.031, 3
  %arrayidx.3 = getelementptr inbounds float, ptr %input, i32 %inc.2
  %25 = load float, ptr %arrayidx.3, align 4, !tbaa !4
  %26 = tail call float @llvm.fmuladd.f32(float %6, float %22, float %25)
  %27 = tail call float @llvm.fmuladd.f32(float %7, float %17, float %26)
  %mul9.3 = fmul float %22, %4
  %28 = tail call float @llvm.fmuladd.f32(float %3, float %27, float %mul9.3)
  %29 = tail call float @llvm.fmuladd.f32(float %5, float %17, float %28)
  %arrayidx12.3 = getelementptr inbounds float, ptr %output, i32 %inc.2
  store float %29, ptr %arrayidx12.3, align 4, !tbaa !4
  %inc.3 = or disjoint i32 %i.031, 4
  %arrayidx.4 = getelementptr inbounds float, ptr %input, i32 %inc.3
  %30 = load float, ptr %arrayidx.4, align 4, !tbaa !4
  %31 = tail call float @llvm.fmuladd.f32(float %6, float %27, float %30)
  %32 = tail call float @llvm.fmuladd.f32(float %7, float %22, float %31)
  %mul9.4 = fmul float %27, %4
  %33 = tail call float @llvm.fmuladd.f32(float %3, float %32, float %mul9.4)
  %34 = tail call float @llvm.fmuladd.f32(float %5, float %22, float %33)
  %arrayidx12.4 = getelementptr inbounds float, ptr %output, i32 %inc.3
  store float %34, ptr %arrayidx12.4, align 4, !tbaa !4
  %inc.4 = or disjoint i32 %i.031, 5
  %arrayidx.5 = getelementptr inbounds float, ptr %input, i32 %inc.4
  %35 = load float, ptr %arrayidx.5, align 4, !tbaa !4
  %36 = tail call float @llvm.fmuladd.f32(float %6, float %32, float %35)
  %37 = tail call float @llvm.fmuladd.f32(float %7, float %27, float %36)
  %mul9.5 = fmul float %32, %4
  %38 = tail call float @llvm.fmuladd.f32(float %3, float %37, float %mul9.5)
  %39 = tail call float @llvm.fmuladd.f32(float %5, float %27, float %38)
  %arrayidx12.5 = getelementptr inbounds float, ptr %output, i32 %inc.4
  store float %39, ptr %arrayidx12.5, align 4, !tbaa !4
  %inc.5 = or disjoint i32 %i.031, 6
  %arrayidx.6 = getelementptr inbounds float, ptr %input, i32 %inc.5
  %40 = load float, ptr %arrayidx.6, align 4, !tbaa !4
  %41 = tail call float @llvm.fmuladd.f32(float %6, float %37, float %40)
  %42 = tail call float @llvm.fmuladd.f32(float %7, float %32, float %41)
  %mul9.6 = fmul float %37, %4
  %43 = tail call float @llvm.fmuladd.f32(float %3, float %42, float %mul9.6)
  %44 = tail call float @llvm.fmuladd.f32(float %5, float %32, float %43)
  %arrayidx12.6 = getelementptr inbounds float, ptr %output, i32 %inc.5
  store float %44, ptr %arrayidx12.6, align 4, !tbaa !4
  %inc.6 = or disjoint i32 %i.031, 7
  %arrayidx.7 = getelementptr inbounds float, ptr %input, i32 %inc.6
  %45 = load float, ptr %arrayidx.7, align 4, !tbaa !4
  %46 = tail call float @llvm.fmuladd.f32(float %6, float %42, float %45)
  %47 = tail call float @llvm.fmuladd.f32(float %7, float %37, float %46)
  %mul9.7 = fmul float %42, %4
  %48 = tail call float @llvm.fmuladd.f32(float %3, float %47, float %mul9.7)
  %49 = tail call float @llvm.fmuladd.f32(float %5, float %37, float %48)
  %arrayidx12.7 = getelementptr inbounds float, ptr %output, i32 %inc.6
  store float %49, ptr %arrayidx12.7, align 4, !tbaa !4
  store float %.pre, ptr %arrayidx4, align 4
  store float %12, ptr %w, align 4
  %inc.7 = add nuw nsw i32 %i.031, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub
  br i1 %exitcond.not.7, label %for.body.7, label %for.cond150.preheader, !llvm.loop !8

for.body.lr.ph.clone8:                            ; preds = %for.cond150.preheader
  br label %for.body.clone1

for.body.clone1:                                  ; preds = %for.body.clone1, %for.body.lr.ph.clone8
  %50 = phi float [ %.pre, %for.body.lr.ph.clone8 ], [ %53, %for.body.clone1 ]
  %i.031.clone2 = phi i32 [ %inc.7, %for.body.lr.ph.clone8 ], [ %inc.clone6, %for.body.clone1 ]
  %arrayidx.clone3 = getelementptr inbounds float, ptr %input, i32 %i.031.clone2
  %51 = load float, ptr %arrayidx.clone3, align 4, !tbaa !4
  %52 = tail call float @llvm.fmuladd.f32(float %6, float %12, float %51)
  %53 = tail call float @llvm.fmuladd.f32(float %7, float %50, float %52)
  %54 = tail call float @llvm.fmuladd.f32(float %3, float %53, float %mul9.1)
  %55 = tail call float @llvm.fmuladd.f32(float %5, float %50, float %54)
  %arrayidx12.clone5 = getelementptr inbounds float, ptr %output, i32 %i.031.clone2
  store float %55, ptr %arrayidx12.clone5, align 4, !tbaa !4
  %inc.clone6 = add nuw nsw i32 %i.031.clone2, 1
  %exitcond.not.clone7 = icmp eq i32 %inc.clone6, %len
  br i1 %exitcond.not.clone7, label %for.cond.cleanup.clone, label %for.body.clone1, !llvm.loop !8

for.cond.cleanup.clone:                           ; preds = %for.body.clone1
  store float %12, ptr %arrayidx4, align 4
  store float %53, ptr %w, align 4
  br label %if.end

for.body.lr.ph.clone:                             ; preds = %entry
  %arrayidx1.clone = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3.clone = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4.clone = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7.clone = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10.clone = getelementptr inbounds float, ptr %coef, i32 2
  %.pre.clone = load float, ptr %w, align 4, !tbaa !4
  %.pre32.clone = load float, ptr %arrayidx4.clone, align 4, !tbaa !4
  %.pre16 = load float, ptr %arrayidx1.clone, align 4, !tbaa !4
  %.pre17 = load float, ptr %arrayidx3.clone, align 4, !tbaa !4
  %.pre18 = load float, ptr %coef, align 4, !tbaa !4
  %.pre19 = load float, ptr %arrayidx7.clone, align 4, !tbaa !4
  %.pre20 = load float, ptr %arrayidx10.clone, align 4, !tbaa !4
  br label %for.body.clone

for.body.clone:                                   ; preds = %for.body.clone, %for.body.lr.ph.clone
  %56 = phi float [ %.pre32.clone, %for.body.lr.ph.clone ], [ %57, %for.body.clone ]
  %57 = phi float [ %.pre.clone, %for.body.lr.ph.clone ], [ %60, %for.body.clone ]
  %i.031.clone = phi i32 [ 0, %for.body.lr.ph.clone ], [ %inc.clone, %for.body.clone ]
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %i.031.clone
  %58 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %neg.clone = fneg float %.pre16
  %59 = tail call float @llvm.fmuladd.f32(float %neg.clone, float %57, float %58)
  %neg5.clone = fneg float %.pre17
  %60 = tail call float @llvm.fmuladd.f32(float %neg5.clone, float %56, float %59)
  %mul9.clone = fmul float %57, %.pre19
  %61 = tail call float @llvm.fmuladd.f32(float %.pre18, float %60, float %mul9.clone)
  %62 = tail call float @llvm.fmuladd.f32(float %.pre20, float %56, float %61)
  %arrayidx12.clone = getelementptr inbounds float, ptr %output, i32 %i.031.clone
  store float %62, ptr %arrayidx12.clone, align 4, !tbaa !4
  store float %57, ptr %arrayidx4.clone, align 4, !tbaa !4
  store float %60, ptr %w, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %i.031.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %if.end, label %for.body.clone, !llvm.loop !8
}
