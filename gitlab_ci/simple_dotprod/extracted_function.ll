; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define dso_local float @test_loop(ptr nocapture noundef readonly %data1, ptr nocapture noundef readonly %data2) local_unnamed_addr #0 {
entry:
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body
  ret float %2

for.body:                                         ; preds = %for.body, %entry
  %i.07 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %result.06 = phi float [ 0.000000e+00, %entry ], [ %2, %for.body ]
  %arrayidx = getelementptr inbounds float, ptr %data1, i32 %i.07
  %0 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx1 = getelementptr inbounds float, ptr %data2, i32 %i.07
  %1 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %2 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %result.06)
  %inc = add nuw nsw i32 %i.07, 1
  %exitcond.not = icmp eq i32 %inc, 1024
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !8
}
