; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt -S -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true < %s | FileCheck %s
define dso_local noundef i32 @dsps_mul_f32_ansi(ptr noundef readonly %input1, ptr noundef readonly %input2, ptr noundef writeonly %output, i32 noundef %len, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out) local_unnamed_addr {
; CHECK-LABEL: define dso_local noundef i32 @dsps_mul_f32_ansi(
; CHECK-SAME: ptr noundef readonly [[INPUT1:%.*]], ptr noundef readonly [[INPUT2:%.*]], ptr noundef writeonly [[OUTPUT:%.*]], i32 noundef [[LEN:%.*]], i32 noundef [[STEP1:%.*]], i32 noundef [[STEP2:%.*]], i32 noundef [[STEP_OUT:%.*]]) local_unnamed_addr {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq ptr [[INPUT1]], null
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq ptr [[INPUT2]], null
; CHECK-NEXT:    [[OR_COND:%.*]] = or i1 [[CMP]], [[CMP1]]
; CHECK-NEXT:    [[CMP4:%.*]] = icmp eq ptr [[OUTPUT]], null
; CHECK-NEXT:    [[OR_COND20:%.*]] = or i1 [[OR_COND]], [[CMP4]]
; CHECK-NEXT:    br i1 [[OR_COND20]], label [[RETURN:%.*]], label [[IF_END:%.*]]
; CHECK:       if.end:
; CHECK-NEXT:    [[CMP41:%.*]] = icmp sgt i32 [[LEN]], 2
; CHECK-NEXT:    br i1 [[CMP41]], label [[FOR_BODY:%.*]], label [[FOR_COND_PREHEADER:%.*]]
; CHECK:       for.cond.preheader:
; CHECK-NEXT:    [[CMP721:%.*]] = icmp sgt i32 [[LEN]], 0
; CHECK-NEXT:    br i1 [[CMP721]], label [[FOR_BODY_CLONE:%.*]], label [[RETURN]]
; CHECK:       for.body:
; CHECK-NEXT:    [[I_022:%.*]] = phi i32 [ [[INC:%.*]], [[FOR_BODY]] ], [ 0, [[IF_END]] ]
; CHECK-NEXT:    [[MUL:%.*]] = mul nsw i32 [[I_022]], [[STEP1]]
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds float, ptr [[INPUT1]], i32 [[MUL]]
; CHECK-NEXT:    [[TMP0:%.*]] = load float, ptr [[ARRAYIDX]], align 4
; CHECK-NEXT:    [[MUL8:%.*]] = mul nsw i32 [[I_022]], [[STEP2]]
; CHECK-NEXT:    [[ARRAYIDX9:%.*]] = getelementptr inbounds float, ptr [[INPUT2]], i32 [[MUL8]]
; CHECK-NEXT:    [[TMP1:%.*]] = load float, ptr [[ARRAYIDX9]], align 4
; CHECK-NEXT:    [[MUL10:%.*]] = fmul float [[TMP0]], [[TMP1]]
; CHECK-NEXT:    [[MUL11:%.*]] = mul nsw i32 [[I_022]], [[STEP_OUT]]
; CHECK-NEXT:    [[ARRAYIDX12:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[MUL11]]
; CHECK-NEXT:    store float [[MUL10]], ptr [[ARRAYIDX12]], align 4
; CHECK-NEXT:    [[INC]] = add nuw nsw i32 [[I_022]], 1
; CHECK-NEXT:    [[EXITCOND_NOT:%.*]] = icmp eq i32 [[INC]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT]], label [[RETURN]], label [[FOR_BODY]]
; CHECK:       for.body.clone:
; CHECK-NEXT:    [[I_022_CLONE:%.*]] = phi i32 [ [[INC_CLONE:%.*]], [[FOR_BODY_CLONE]] ], [ 0, [[FOR_COND_PREHEADER]] ]
; CHECK-NEXT:    [[MUL_CLONE:%.*]] = mul nsw i32 [[I_022_CLONE]], [[STEP1]]
; CHECK-NEXT:    [[ARRAYIDX_CLONE:%.*]] = getelementptr inbounds float, ptr [[INPUT1]], i32 [[MUL_CLONE]]
; CHECK-NEXT:    [[TMP2:%.*]] = load float, ptr [[ARRAYIDX_CLONE]], align 4
; CHECK-NEXT:    [[MUL8_CLONE:%.*]] = mul nsw i32 [[I_022_CLONE]], [[STEP2]]
; CHECK-NEXT:    [[ARRAYIDX9_CLONE:%.*]] = getelementptr inbounds float, ptr [[INPUT2]], i32 [[MUL8_CLONE]]
; CHECK-NEXT:    [[TMP3:%.*]] = load float, ptr [[ARRAYIDX9_CLONE]], align 4
; CHECK-NEXT:    [[MUL10_CLONE:%.*]] = fmul float [[TMP2]], [[TMP3]]
; CHECK-NEXT:    [[MUL11_CLONE:%.*]] = mul nsw i32 [[I_022_CLONE]], [[STEP_OUT]]
; CHECK-NEXT:    [[ARRAYIDX12_CLONE:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[MUL11_CLONE]]
; CHECK-NEXT:    store float [[MUL10_CLONE]], ptr [[ARRAYIDX12_CLONE]], align 4
; CHECK-NEXT:    [[INC_CLONE]] = add nuw nsw i32 [[I_022_CLONE]], 1
; CHECK-NEXT:    [[EXITCOND_NOT_CLONE:%.*]] = icmp eq i32 [[INC_CLONE]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT_CLONE]], label [[RETURN]], label [[FOR_BODY_CLONE]]
; CHECK:       return:
; CHECK-NEXT:    [[RETVAL_0:%.*]] = phi i32 [ 458755, [[ENTRY:%.*]] ], [ 0, [[FOR_COND_PREHEADER]] ], [ 0, [[FOR_BODY]] ], [ 0, [[FOR_BODY_CLONE]] ]
; CHECK-NEXT:    ret i32 [[RETVAL_0]]
;
entry:
  %cmp = icmp eq ptr %input1, null
  %cmp1 = icmp eq ptr %input2, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %output, null
  %or.cond20 = or i1 %or.cond, %cmp4
  br i1 %or.cond20, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp41 = icmp sgt i32 %len, 2
  br i1 %cmp41, label %for.body, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp721 = icmp sgt i32 %len, 0
  br i1 %cmp721, label %for.body.clone, label %return

for.body:                                         ; preds = %if.end, %for.body
  %i.022 = phi i32 [ %inc, %for.body ], [ 0, %if.end ]
  %mul = mul nsw i32 %i.022, %step1
  %arrayidx = getelementptr inbounds float, ptr %input1, i32 %mul
  %0 = load float, ptr %arrayidx, align 4
  %mul8 = mul nsw i32 %i.022, %step2
  %arrayidx9 = getelementptr inbounds float, ptr %input2, i32 %mul8
  %1 = load float, ptr %arrayidx9, align 4
  %mul10 = fmul float %0, %1
  %mul11 = mul nsw i32 %i.022, %step_out
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %mul11
  store float %mul10, ptr %arrayidx12, align 4
  %inc = add nuw nsw i32 %i.022, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body

for.body.clone:                                   ; preds = %for.cond.preheader, %for.body.clone
  %i.022.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.022.clone, %step1
  %arrayidx.clone = getelementptr inbounds float, ptr %input1, i32 %mul.clone
  %2 = load float, ptr %arrayidx.clone, align 4
  %mul8.clone = mul nsw i32 %i.022.clone, %step2
  %arrayidx9.clone = getelementptr inbounds float, ptr %input2, i32 %mul8.clone
  %3 = load float, ptr %arrayidx9.clone, align 4
  %mul10.clone = fmul float %2, %3
  %mul11.clone = mul nsw i32 %i.022.clone, %step_out
  %arrayidx12.clone = getelementptr inbounds float, ptr %output, i32 %mul11.clone
  store float %mul10.clone, ptr %arrayidx12.clone, align 4
  %inc.clone = add nuw nsw i32 %i.022.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone

return:                                           ; preds = %for.body.clone, %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ], [ 0, %for.body.clone ]
  ret i32 %retval.0
}
