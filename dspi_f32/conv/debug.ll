; Function Attrs: nounwind
define dso_local noundef i32 @dsps_bit_rev_fc32_ansi(ptr nocapture noundef %data, i32 noundef %N) local_unnamed_addr #0 {
entry:
  %call = tail call zeroext i1 @dsp_is_power_of_two(i32 noundef %N) #2
  br i1 %call, label %for.cond.preheader, label %return

for.cond.preheader:                               ; preds = %entry
  %cmp50 = icmp sgt i32 %N, 2
  br i1 %cmp50, label %while.cond.preheader.preheader, label %return

while.cond.preheader.preheader:                   ; preds = %for.cond.preheader
  %0 = add nsw i32 %N, -2
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %for.inc, %while.cond.preheader.preheader
  %i.052 = phi i32 [ %inc, %for.inc ], [ 1, %while.cond.preheader.preheader ]
  %j.051 = phi i32 [ %add, %for.inc ], [ 0, %while.cond.preheader.preheader ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %while.cond.preheader
  %k.0.in = phi i32 [ %k.0, %while.cond ], [ %N, %while.cond.preheader ]
  %j.1 = phi i32 [ %sub2, %while.cond ], [ %j.051, %while.cond.preheader ]
  %k.0 = lshr i32 %k.0.in, 1
  %cmp1.not = icmp sgt i32 %k.0, %j.1
  %sub2 = sub nsw i32 %j.1, %k.0
  br i1 %cmp1.not, label %while.end, label %while.cond, !llvm.loop !4

while.end:                                        ; preds = %while.cond
  %add = add nsw i32 %j.1, %k.0
  %cmp4 = icmp slt i32 %i.052, %add
  br i1 %cmp4, label %if.then5, label %for.inc

if.then5:                                         ; preds = %while.end
  %mul = shl nsw i32 %add, 1
  %arrayidx = getelementptr inbounds float, ptr %data, i32 %mul
  %1 = load float, ptr %arrayidx, align 4, !tbaa !6
  %mul6 = shl nuw nsw i32 %i.052, 1
  %arrayidx7 = getelementptr inbounds float, ptr %data, i32 %mul6
  %2 = load float, ptr %arrayidx7, align 4, !tbaa !6
  store float %2, ptr %arrayidx, align 4, !tbaa !6
  store float %1, ptr %arrayidx7, align 4, !tbaa !6
  %add13 = or disjoint i32 %mul, 1
  %arrayidx14 = getelementptr inbounds float, ptr %data, i32 %add13
  %3 = load float, ptr %arrayidx14, align 4, !tbaa !6
  %add16 = or disjoint i32 %mul6, 1
  %arrayidx17 = getelementptr inbounds float, ptr %data, i32 %add16
  %4 = load float, ptr %arrayidx17, align 4, !tbaa !6
  store float %4, ptr %arrayidx14, align 4, !tbaa !6
  store float %3, ptr %arrayidx17, align 4, !tbaa !6
  br label %for.inc

for.inc:                                          ; preds = %if.then5, %while.end
  %inc = add nuw nsw i32 %i.052, 1
  %exitcond.not = icmp eq i32 %i.052, %0
  br i1 %exitcond.not, label %return, label %while.cond.preheader, !llvm.loop !10

return:                                           ; preds = %for.inc, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.inc ]
  ret i32 %retval.0
}
