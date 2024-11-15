; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt -S -mtriple=riscv32-esp-unknown-elf -passes=riscv-loop-unroll-and-remainder -riscv-loop-unroll-and-remainder=true < %s | FileCheck %s
define dso_local noundef i32 @dsps_sqrt_f32_ansi(ptr noundef readonly %input, ptr noundef writeonly %output, i32 noundef %len) local_unnamed_addr {
; CHECK-LABEL: define dso_local noundef i32 @dsps_sqrt_f32_ansi(
; CHECK-SAME: ptr noalias noundef readonly [[INPUT:%.*]], ptr noalias noundef writeonly [[OUTPUT:%.*]], i32 noundef [[LEN:%.*]]) local_unnamed_addr {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq ptr [[INPUT]], null
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq ptr [[OUTPUT]], null
; CHECK-NEXT:    [[OR_COND:%.*]] = or i1 [[CMP]], [[CMP1]]
; CHECK-NEXT:    br i1 [[OR_COND]], label [[RETURN:%.*]], label [[IF_END:%.*]]
; CHECK:       if.end:
; CHECK-NEXT:    [[CMP4:%.*]] = icmp sgt i32 [[LEN]], 2
; CHECK-NEXT:    br i1 [[CMP4]], label [[FOR_COND_PREHEADER_NEW:%.*]], label [[FOR_COND_PREHEADER:%.*]]
; CHECK:       for.cond.preheader:
; CHECK-NEXT:    [[CMP411:%.*]] = icmp sgt i32 [[LEN]], 0
; CHECK-NEXT:    br i1 [[CMP411]], label [[FOR_BODY_CLONE:%.*]], label [[RETURN]]
; CHECK:       for.cond.preheader.new:
; CHECK-NEXT:    [[SUB:%.*]] = add nsw i32 [[LEN]], -16
; CHECK-NEXT:    [[CMP6_NOT207:%.*]] = icmp ult i32 [[LEN]], 16
; CHECK-NEXT:    br i1 [[CMP6_NOT207]], label [[FOR_COND_PREHEADER_NEW2:%.*]], label [[FOR_BODY_MODIFY:%.*]]
; CHECK:       for.cond.preheader.new2:
; CHECK-NEXT:    [[TMP0:%.*]] = phi i32 [ [[TMP47:%.*]], [[FOR_BODY_MODIFY]] ], [ 0, [[FOR_COND_PREHEADER_NEW]] ]
; CHECK-NEXT:    [[CMP85209:%.*]] = icmp slt i32 [[TMP0]], [[LEN]]
; CHECK-NEXT:    br i1 [[CMP85209]], label [[FOR_BODY:%.*]], label [[RETURN]]
; CHECK:       for.body.modify:
; CHECK-NEXT:    [[I_012_MODIFY:%.*]] = phi i32 [ [[TMP47]], [[FOR_BODY_MODIFY]] ], [ 0, [[FOR_COND_PREHEADER_NEW]] ]
; CHECK-NEXT:    [[ADD:%.*]] = or disjoint i32 [[I_012_MODIFY]], 1
; CHECK-NEXT:    [[ADD3:%.*]] = or disjoint i32 [[I_012_MODIFY]], 2
; CHECK-NEXT:    [[ADD7:%.*]] = or disjoint i32 [[I_012_MODIFY]], 3
; CHECK-NEXT:    [[ADD10:%.*]] = or disjoint i32 [[I_012_MODIFY]], 4
; CHECK-NEXT:    [[ADD13:%.*]] = or disjoint i32 [[I_012_MODIFY]], 5
; CHECK-NEXT:    [[ADD16:%.*]] = or disjoint i32 [[I_012_MODIFY]], 6
; CHECK-NEXT:    [[ADD19:%.*]] = or disjoint i32 [[I_012_MODIFY]], 7
; CHECK-NEXT:    [[ADD22:%.*]] = or disjoint i32 [[I_012_MODIFY]], 8
; CHECK-NEXT:    [[ADD25:%.*]] = or disjoint i32 [[I_012_MODIFY]], 9
; CHECK-NEXT:    [[ADD28:%.*]] = or disjoint i32 [[I_012_MODIFY]], 10
; CHECK-NEXT:    [[ADD31:%.*]] = or disjoint i32 [[I_012_MODIFY]], 11
; CHECK-NEXT:    [[ADD34:%.*]] = or disjoint i32 [[I_012_MODIFY]], 12
; CHECK-NEXT:    [[ADD37:%.*]] = or disjoint i32 [[I_012_MODIFY]], 13
; CHECK-NEXT:    [[ADD40:%.*]] = or disjoint i32 [[I_012_MODIFY]], 14
; CHECK-NEXT:    [[ADD43:%.*]] = or disjoint i32 [[I_012_MODIFY]], 15
; CHECK-NEXT:    [[ARRAYIDX_MODIFY:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[I_012_MODIFY]]
; CHECK-NEXT:    [[ARRAYIDX5_MODIFY:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[I_012_MODIFY]]
; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD]]
; CHECK-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD]]
; CHECK-NEXT:    [[ARRAYIDX4:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD3]]
; CHECK-NEXT:    [[ARRAYIDX6:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD3]]
; CHECK-NEXT:    [[ARRAYIDX8:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD7]]
; CHECK-NEXT:    [[ARRAYIDX9:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD7]]
; CHECK-NEXT:    [[ARRAYIDX11:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD10]]
; CHECK-NEXT:    [[ARRAYIDX12:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD10]]
; CHECK-NEXT:    [[ARRAYIDX14:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD13]]
; CHECK-NEXT:    [[ARRAYIDX15:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD13]]
; CHECK-NEXT:    [[ARRAYIDX17:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD16]]
; CHECK-NEXT:    [[ARRAYIDX18:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD16]]
; CHECK-NEXT:    [[ARRAYIDX20:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD19]]
; CHECK-NEXT:    [[ARRAYIDX21:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD19]]
; CHECK-NEXT:    [[ARRAYIDX23:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD22]]
; CHECK-NEXT:    [[ARRAYIDX24:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD22]]
; CHECK-NEXT:    [[ARRAYIDX26:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD25]]
; CHECK-NEXT:    [[ARRAYIDX27:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD25]]
; CHECK-NEXT:    [[ARRAYIDX29:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD28]]
; CHECK-NEXT:    [[ARRAYIDX30:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD28]]
; CHECK-NEXT:    [[ARRAYIDX32:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD31]]
; CHECK-NEXT:    [[ARRAYIDX33:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD31]]
; CHECK-NEXT:    [[ARRAYIDX35:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD34]]
; CHECK-NEXT:    [[ARRAYIDX36:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD34]]
; CHECK-NEXT:    [[ARRAYIDX38:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD37]]
; CHECK-NEXT:    [[ARRAYIDX39:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD37]]
; CHECK-NEXT:    [[ARRAYIDX41:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD40]]
; CHECK-NEXT:    [[ARRAYIDX42:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD40]]
; CHECK-NEXT:    [[ARRAYIDX44:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[ADD43]]
; CHECK-NEXT:    [[ARRAYIDX45:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[ADD43]]
; CHECK-NEXT:    [[TMP1:%.*]] = load i32, ptr [[ARRAYIDX_MODIFY]], align 4
; CHECK-NEXT:    [[TMP2:%.*]] = load i32, ptr [[ARRAYIDX1]], align 4
; CHECK-NEXT:    [[TMP3:%.*]] = load i32, ptr [[ARRAYIDX4]], align 4
; CHECK-NEXT:    [[TMP4:%.*]] = load i32, ptr [[ARRAYIDX8]], align 4
; CHECK-NEXT:    [[TMP5:%.*]] = load i32, ptr [[ARRAYIDX11]], align 4
; CHECK-NEXT:    [[TMP6:%.*]] = load i32, ptr [[ARRAYIDX14]], align 4
; CHECK-NEXT:    [[TMP7:%.*]] = load i32, ptr [[ARRAYIDX17]], align 4
; CHECK-NEXT:    [[TMP8:%.*]] = load i32, ptr [[ARRAYIDX20]], align 4
; CHECK-NEXT:    [[TMP9:%.*]] = load i32, ptr [[ARRAYIDX23]], align 4
; CHECK-NEXT:    [[TMP10:%.*]] = load i32, ptr [[ARRAYIDX26]], align 4
; CHECK-NEXT:    [[TMP11:%.*]] = load i32, ptr [[ARRAYIDX29]], align 4
; CHECK-NEXT:    [[TMP12:%.*]] = load i32, ptr [[ARRAYIDX32]], align 4
; CHECK-NEXT:    [[TMP13:%.*]] = load i32, ptr [[ARRAYIDX35]], align 4
; CHECK-NEXT:    [[TMP14:%.*]] = load i32, ptr [[ARRAYIDX38]], align 4
; CHECK-NEXT:    [[TMP15:%.*]] = load i32, ptr [[ARRAYIDX41]], align 4
; CHECK-NEXT:    [[TMP16:%.*]] = load i32, ptr [[ARRAYIDX44]], align 4
; CHECK-NEXT:    [[SHR_I_MODIFY:%.*]] = ashr i32 [[TMP1]], 1
; CHECK-NEXT:    [[ADD_I_MODIFY:%.*]] = add nsw i32 [[SHR_I_MODIFY]], 532365312
; CHECK-NEXT:    [[TMP17:%.*]] = ashr i32 [[TMP2]], 1
; CHECK-NEXT:    [[TMP18:%.*]] = add nsw i32 [[TMP17]], 532365312
; CHECK-NEXT:    [[TMP19:%.*]] = ashr i32 [[TMP3]], 1
; CHECK-NEXT:    [[TMP20:%.*]] = add nsw i32 [[TMP19]], 532365312
; CHECK-NEXT:    [[TMP21:%.*]] = ashr i32 [[TMP4]], 1
; CHECK-NEXT:    [[TMP22:%.*]] = add nsw i32 [[TMP21]], 532365312
; CHECK-NEXT:    [[TMP23:%.*]] = ashr i32 [[TMP5]], 1
; CHECK-NEXT:    [[TMP24:%.*]] = add nsw i32 [[TMP23]], 532365312
; CHECK-NEXT:    [[TMP25:%.*]] = ashr i32 [[TMP6]], 1
; CHECK-NEXT:    [[TMP26:%.*]] = add nsw i32 [[TMP25]], 532365312
; CHECK-NEXT:    [[TMP27:%.*]] = ashr i32 [[TMP7]], 1
; CHECK-NEXT:    [[TMP28:%.*]] = add nsw i32 [[TMP27]], 532365312
; CHECK-NEXT:    [[TMP29:%.*]] = ashr i32 [[TMP8]], 1
; CHECK-NEXT:    [[TMP30:%.*]] = add nsw i32 [[TMP29]], 532365312
; CHECK-NEXT:    [[TMP31:%.*]] = ashr i32 [[TMP9]], 1
; CHECK-NEXT:    [[TMP32:%.*]] = add nsw i32 [[TMP31]], 532365312
; CHECK-NEXT:    [[TMP33:%.*]] = ashr i32 [[TMP10]], 1
; CHECK-NEXT:    [[TMP34:%.*]] = add nsw i32 [[TMP33]], 532365312
; CHECK-NEXT:    [[TMP35:%.*]] = ashr i32 [[TMP11]], 1
; CHECK-NEXT:    [[TMP36:%.*]] = add nsw i32 [[TMP35]], 532365312
; CHECK-NEXT:    [[TMP37:%.*]] = ashr i32 [[TMP12]], 1
; CHECK-NEXT:    [[TMP38:%.*]] = add nsw i32 [[TMP37]], 532365312
; CHECK-NEXT:    [[TMP39:%.*]] = ashr i32 [[TMP13]], 1
; CHECK-NEXT:    [[TMP40:%.*]] = add nsw i32 [[TMP39]], 532365312
; CHECK-NEXT:    [[TMP41:%.*]] = ashr i32 [[TMP14]], 1
; CHECK-NEXT:    [[TMP42:%.*]] = add nsw i32 [[TMP41]], 532365312
; CHECK-NEXT:    [[TMP43:%.*]] = ashr i32 [[TMP15]], 1
; CHECK-NEXT:    [[TMP44:%.*]] = add nsw i32 [[TMP43]], 532365312
; CHECK-NEXT:    [[TMP45:%.*]] = ashr i32 [[TMP16]], 1
; CHECK-NEXT:    [[TMP46:%.*]] = add nsw i32 [[TMP45]], 532365312
; CHECK-NEXT:    store i32 [[TMP46]], ptr [[ARRAYIDX45]], align 4
; CHECK-NEXT:    store i32 [[TMP44]], ptr [[ARRAYIDX42]], align 4
; CHECK-NEXT:    store i32 [[TMP42]], ptr [[ARRAYIDX39]], align 4
; CHECK-NEXT:    store i32 [[TMP40]], ptr [[ARRAYIDX36]], align 4
; CHECK-NEXT:    store i32 [[TMP38]], ptr [[ARRAYIDX33]], align 4
; CHECK-NEXT:    store i32 [[TMP36]], ptr [[ARRAYIDX30]], align 4
; CHECK-NEXT:    store i32 [[TMP34]], ptr [[ARRAYIDX27]], align 4
; CHECK-NEXT:    store i32 [[TMP32]], ptr [[ARRAYIDX24]], align 4
; CHECK-NEXT:    store i32 [[TMP30]], ptr [[ARRAYIDX21]], align 4
; CHECK-NEXT:    store i32 [[TMP28]], ptr [[ARRAYIDX18]], align 4
; CHECK-NEXT:    store i32 [[TMP26]], ptr [[ARRAYIDX15]], align 4
; CHECK-NEXT:    store i32 [[TMP24]], ptr [[ARRAYIDX12]], align 4
; CHECK-NEXT:    store i32 [[TMP22]], ptr [[ARRAYIDX9]], align 4
; CHECK-NEXT:    store i32 [[TMP20]], ptr [[ARRAYIDX6]], align 4
; CHECK-NEXT:    store i32 [[TMP18]], ptr [[ARRAYIDX2]], align 4
; CHECK-NEXT:    store i32 [[ADD_I_MODIFY]], ptr [[ARRAYIDX5_MODIFY]], align 4
; CHECK-NEXT:    [[TMP47]] = add nuw i32 [[I_012_MODIFY]], 16
; CHECK-NEXT:    [[EXITCOND_NOT_MODIFY:%.*]] = icmp sgt i32 [[TMP47]], [[SUB]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT_MODIFY]], label [[FOR_COND_PREHEADER_NEW2]], label [[FOR_BODY_MODIFY]]
; CHECK:       for.body:
; CHECK-NEXT:    [[I_012:%.*]] = phi i32 [ [[INC:%.*]], [[FOR_BODY]] ], [ [[TMP0]], [[FOR_COND_PREHEADER_NEW2]] ]
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[I_012]]
; CHECK-NEXT:    [[TMP48:%.*]] = load i32, ptr [[ARRAYIDX]], align 4
; CHECK-NEXT:    [[SHR_I:%.*]] = ashr i32 [[TMP48]], 1
; CHECK-NEXT:    [[ADD_I:%.*]] = add nsw i32 [[SHR_I]], 532365312
; CHECK-NEXT:    [[ARRAYIDX5:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[I_012]]
; CHECK-NEXT:    store i32 [[ADD_I]], ptr [[ARRAYIDX5]], align 4
; CHECK-NEXT:    [[INC]] = add nuw nsw i32 [[I_012]], 1
; CHECK-NEXT:    [[EXITCOND_NOT:%.*]] = icmp eq i32 [[INC]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT]], label [[RETURN]], label [[FOR_BODY]]
; CHECK:       for.body.clone:
; CHECK-NEXT:    [[I_012_CLONE:%.*]] = phi i32 [ [[INC_CLONE:%.*]], [[FOR_BODY_CLONE]] ], [ 0, [[FOR_COND_PREHEADER]] ]
; CHECK-NEXT:    [[ARRAYIDX_CLONE:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[I_012_CLONE]]
; CHECK-NEXT:    [[TMP49:%.*]] = load i32, ptr [[ARRAYIDX_CLONE]], align 4
; CHECK-NEXT:    [[SHR_I_CLONE:%.*]] = ashr i32 [[TMP49]], 1
; CHECK-NEXT:    [[ADD_I_CLONE:%.*]] = add nsw i32 [[SHR_I_CLONE]], 532365312
; CHECK-NEXT:    [[ARRAYIDX5_CLONE:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[I_012_CLONE]]
; CHECK-NEXT:    store i32 [[ADD_I_CLONE]], ptr [[ARRAYIDX5_CLONE]], align 4
; CHECK-NEXT:    [[INC_CLONE]] = add nuw nsw i32 [[I_012_CLONE]], 1
; CHECK-NEXT:    [[EXITCOND_NOT_CLONE:%.*]] = icmp eq i32 [[INC_CLONE]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT_CLONE]], label [[RETURN]], label [[FOR_BODY_CLONE]]
; CHECK:       return:
; CHECK-NEXT:    [[RETVAL_0:%.*]] = phi i32 [ 458755, [[ENTRY:%.*]] ], [ 0, [[FOR_COND_PREHEADER]] ], [ 0, [[FOR_BODY]] ], [ 0, [[FOR_BODY_CLONE]] ], [ 0, [[FOR_COND_PREHEADER_NEW2]] ]
; CHECK-NEXT:    ret i32 [[RETVAL_0]]
;
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp4 = icmp sgt i32 %len, 2
  br i1 %cmp4, label %for.body, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp411 = icmp sgt i32 %len, 0
  br i1 %cmp411, label %for.body.clone, label %return

for.body:                                         ; preds = %for.body, %if.end
  %i.012 = phi i32 [ %inc, %for.body ], [ 0, %if.end ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.012
  %0 = load i32, ptr %arrayidx, align 4
  %shr.i = ashr i32 %0, 1
  %add.i = add nsw i32 %shr.i, 532365312
  %arrayidx5 = getelementptr inbounds float, ptr %output, i32 %i.012
  store i32 %add.i, ptr %arrayidx5, align 4
  %inc = add nuw nsw i32 %i.012, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.012.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %i.012.clone
  %1 = load i32, ptr %arrayidx.clone, align 4
  %shr.i.clone = ashr i32 %1, 1
  %add.i.clone = add nsw i32 %shr.i.clone, 532365312
  %arrayidx5.clone = getelementptr inbounds float, ptr %output, i32 %i.012.clone
  store i32 %add.i.clone, ptr %arrayidx5.clone, align 4
  %inc.clone = add nuw nsw i32 %i.012.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone

return:                                           ; preds = %for.body.clone, %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ], [ 0, %for.body.clone ]
  ret i32 %retval.0
}