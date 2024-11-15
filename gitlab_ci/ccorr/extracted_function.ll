; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_ccorr_f32_ansi(ptr noundef readonly %Signal, i32 noundef %siglen, ptr noundef readonly %Kernel, i32 noundef %kernlen, ptr noundef writeonly %corrvout) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %Signal, null
  %cmp1 = icmp eq ptr %Kernel, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %corrvout, null
  %or.cond122 = or i1 %or.cond, %cmp4
  br i1 %or.cond122, label %return, label %if.end6

if.end6:                                          ; preds = %entry
  %cmp7 = icmp slt i32 %siglen, %kernlen
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6
  %lkern.0 = phi i32 [ %siglen, %if.then8 ], [ %kernlen, %if.end6 ]
  %lsig.0 = phi i32 [ %kernlen, %if.then8 ], [ %siglen, %if.end6 ]
  %kern.0 = phi ptr [ %Signal, %if.then8 ], [ %Kernel, %if.end6 ]
  %sig.0 = phi ptr [ %Kernel, %if.then8 ], [ %Signal, %if.end6 ]
  %cmp10124 = icmp sgt i32 %lkern.0, 0
  br i1 %cmp10124, label %for.body, label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.end, %if.end9
  %cmp23128 = icmp slt i32 %lkern.0, %lsig.0
  br i1 %cmp23128, label %for.body25, label %for.cond45.preheader

for.body:                                         ; preds = %for.end, %if.end9
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.end ], [ 1, %if.end9 ]
  %n.0125 = phi i32 [ %inc19, %for.end ], [ 0, %if.end9 ]
  %0 = xor i32 %n.0125, -1
  %sub11 = add nsw i32 %lkern.0, %0
  %arrayidx = getelementptr inbounds float, ptr %corrvout, i32 %n.0125
  store float 0.000000e+00, ptr %arrayidx, align 4, !tbaa !4
  br label %for.body14

for.body14:                                       ; preds = %for.body14, %for.body
  %k.0123 = phi i32 [ 0, %for.body ], [ %inc, %for.body14 ]
  %1 = phi float [ 0.000000e+00, %for.body ], [ %4, %for.body14 ]
  %arrayidx15 = getelementptr inbounds float, ptr %sig.0, i32 %k.0123
  %2 = load float, ptr %arrayidx15, align 4, !tbaa !4
  %add = add i32 %sub11, %k.0123
  %arrayidx16 = getelementptr inbounds float, ptr %kern.0, i32 %add
  %3 = load float, ptr %arrayidx16, align 4, !tbaa !4
  %4 = tail call float @llvm.fmuladd.f32(float %2, float %3, float %1)
  store float %4, ptr %arrayidx, align 4, !tbaa !4
  %inc = add nuw nsw i32 %k.0123, 1
  %exitcond = icmp eq i32 %inc, %indvars.iv
  br i1 %exitcond, label %for.end, label %for.body14, !llvm.loop !8

for.end:                                          ; preds = %for.body14
  %inc19 = add nuw nsw i32 %n.0125, 1
  %indvars.iv.next = add nuw i32 %indvars.iv, 1
  %exitcond134.not = icmp eq i32 %inc19, %lkern.0
  br i1 %exitcond134.not, label %for.cond22.preheader, label %for.body, !llvm.loop !10

for.cond45.preheader:                             ; preds = %for.end40, %for.cond22.preheader
  %add46 = add i32 %siglen, -1
  %sub47 = add i32 %add46, %kernlen
  %cmp48132 = icmp slt i32 %lsig.0, %sub47
  br i1 %cmp48132, label %for.body50.lr.ph, label %return

for.body50.lr.ph:                                 ; preds = %for.cond45.preheader
  %sub57 = add nsw i32 %lsig.0, -1
  br label %for.body50

for.body25:                                       ; preds = %for.end40, %for.cond22.preheader
  %n21.0129 = phi i32 [ %inc42, %for.end40 ], [ %lkern.0, %for.cond22.preheader ]
  %arrayidx28 = getelementptr inbounds float, ptr %corrvout, i32 %n21.0129
  store float 0.000000e+00, ptr %arrayidx28, align 4, !tbaa !4
  %sub29 = sub nuw nsw i32 %n21.0129, %lkern.0
  %add30 = add nsw i32 %sub29, 1
  %cmp32.not126 = icmp ugt i32 %add30, %n21.0129
  br i1 %cmp32.not126, label %for.end40, label %for.body33

for.body33:                                       ; preds = %for.body33, %for.body25
  %5 = phi float [ %8, %for.body33 ], [ 0.000000e+00, %for.body25 ]
  %k27.0127 = phi i32 [ %inc39, %for.body33 ], [ %add30, %for.body25 ]
  %arrayidx34 = getelementptr inbounds float, ptr %sig.0, i32 %k27.0127
  %6 = load float, ptr %arrayidx34, align 4, !tbaa !4
  %sub35 = sub i32 %k27.0127, %add30
  %arrayidx36 = getelementptr inbounds float, ptr %kern.0, i32 %sub35
  %7 = load float, ptr %arrayidx36, align 4, !tbaa !4
  %8 = tail call float @llvm.fmuladd.f32(float %6, float %7, float %5)
  store float %8, ptr %arrayidx28, align 4, !tbaa !4
  %inc39 = add i32 %k27.0127, 1
  %cmp32.not = icmp ugt i32 %inc39, %n21.0129
  br i1 %cmp32.not, label %for.end40, label %for.body33, !llvm.loop !11

for.end40:                                        ; preds = %for.body33, %for.body25
  %inc42 = add nuw nsw i32 %n21.0129, 1
  %exitcond135.not = icmp eq i32 %inc42, %lsig.0
  br i1 %exitcond135.not, label %for.cond45.preheader, label %for.body25, !llvm.loop !12

for.body50:                                       ; preds = %for.end67, %for.body50.lr.ph
  %n44.0133 = phi i32 [ %lsig.0, %for.body50.lr.ph ], [ %inc69, %for.end67 ]
  %arrayidx54 = getelementptr inbounds float, ptr %corrvout, i32 %n44.0133
  store float 0.000000e+00, ptr %arrayidx54, align 4, !tbaa !4
  %sub55 = sub nsw i32 %n44.0133, %lkern.0
  %add56 = add nsw i32 %sub55, 1
  %cmp59.not130 = icmp ugt i32 %add56, %sub57
  br i1 %cmp59.not130, label %for.end67, label %for.body60

for.body60:                                       ; preds = %for.body60, %for.body50
  %9 = phi float [ %12, %for.body60 ], [ 0.000000e+00, %for.body50 ]
  %k53.0131 = phi i32 [ %inc66, %for.body60 ], [ %add56, %for.body50 ]
  %arrayidx61 = getelementptr inbounds float, ptr %sig.0, i32 %k53.0131
  %10 = load float, ptr %arrayidx61, align 4, !tbaa !4
  %sub62 = sub i32 %k53.0131, %add56
  %arrayidx63 = getelementptr inbounds float, ptr %kern.0, i32 %sub62
  %11 = load float, ptr %arrayidx63, align 4, !tbaa !4
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %9)
  store float %12, ptr %arrayidx54, align 4, !tbaa !4
  %inc66 = add i32 %k53.0131, 1
  %cmp59.not = icmp ugt i32 %inc66, %sub57
  br i1 %cmp59.not, label %for.end67, label %for.body60, !llvm.loop !13

for.end67:                                        ; preds = %for.body60, %for.body50
  %inc69 = add nsw i32 %n44.0133, 1
  %exitcond136.not = icmp eq i32 %inc69, %sub47
  br i1 %exitcond136.not, label %return, label %for.body50, !llvm.loop !14

return:                                           ; preds = %for.end67, %for.cond45.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond45.preheader ], [ 0, %for.end67 ]
  ret i32 %retval.0
}
