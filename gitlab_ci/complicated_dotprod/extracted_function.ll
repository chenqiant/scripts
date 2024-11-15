; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define dso_local float @test_loop(ptr nocapture noundef readonly %data1, ptr nocapture noundef readonly %data2, i32 noundef %start_index, i32 noundef %end_index, i32 noundef %update1, i32 noundef %update2, float noundef %offset) local_unnamed_addr #0 {
entry:
  %invariant.gep = getelementptr float, ptr %data1, i32 %update1
  %invariant.gep8 = getelementptr float, ptr %data2, i32 %update2
  %cmp10 = icmp slt i32 %start_index, %end_index
  br i1 %cmp10, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.body, %entry
  %result.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add3, %for.body ]
  ret float %result.0.lcssa

for.body:                                         ; preds = %for.body, %entry
  %i.012 = phi i32 [ %inc, %for.body ], [ %start_index, %entry ]
  %result.011 = phi float [ %add3, %for.body ], [ 0.000000e+00, %entry ]
  %gep = getelementptr float, ptr %invariant.gep, i32 %i.012
  %0 = load float, ptr %gep, align 4, !tbaa !4
  %gep9 = getelementptr float, ptr %invariant.gep8, i32 %i.012
  %1 = load float, ptr %gep9, align 4, !tbaa !4
  %2 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %offset)
  %add3 = fadd float %result.011, %2
  %inc = add nsw i32 %i.012, 1
  %exitcond.not = icmp eq i32 %inc, %end_index
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !8
}
