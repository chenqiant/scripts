; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt -S -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true < %s | FileCheck %s
define dso_local noundef i32 @dsps_mulc_f32_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, i32 noundef %len, float noundef %C, i32 noundef %step_in, i32 noundef %step_out) local_unnamed_addr {
; CHECK-LABEL: define dso_local noundef i32 @dsps_mulc_f32_ansi(
; CHECK-SAME: ptr noalias noundef readonly [[INPUT:%.*]], ptr noalias noundef writeonly [[OUTPUT:%.*]], i32 noundef [[LEN:%.*]], float noundef [[C:%.*]], i32 noundef [[STEP_IN:%.*]], i32 noundef [[STEP_OUT:%.*]]) local_unnamed_addr {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq ptr [[INPUT]], null
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq ptr [[OUTPUT]], null
; CHECK-NEXT:    [[OR_COND:%.*]] = or i1 [[CMP]], [[CMP1]]
; CHECK-NEXT:    br i1 [[OR_COND]], label [[RETURN:%.*]], label [[IF_END:%.*]]
; CHECK:       if.end:
; CHECK-NEXT:    [[CMP4:%.*]] = icmp sgt i32 [[LEN]], 2
; CHECK-NEXT:    br i1 [[CMP4]], label [[FOR_BODY:%.*]], label [[FOR_COND_PREHEADER:%.*]]
; CHECK:       for.cond.preheader:
; CHECK-NEXT:    [[CMP413:%.*]] = icmp sgt i32 [[LEN]], 0
; CHECK-NEXT:    br i1 [[CMP413]], label [[FOR_BODY_CLONE:%.*]], label [[RETURN]]
; CHECK:       for.body:
; CHECK-NEXT:    [[I_014:%.*]] = phi i32 [ [[INC:%.*]], [[FOR_BODY]] ], [ 0, [[IF_END]] ]
; CHECK-NEXT:    [[MUL:%.*]] = mul nsw i32 [[I_014]], [[STEP_IN]]
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[MUL]]
; CHECK-NEXT:    [[TMP0:%.*]] = load float, ptr [[ARRAYIDX]], align 4
; CHECK-NEXT:    [[MUL5:%.*]] = fmul float [[TMP0]], [[C]]
; CHECK-NEXT:    [[MUL6:%.*]] = mul nsw i32 [[I_014]], [[STEP_OUT]]
; CHECK-NEXT:    [[ARRAYIDX7:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[MUL6]]
; CHECK-NEXT:    store float [[MUL5]], ptr [[ARRAYIDX7]], align 4
; CHECK-NEXT:    [[INC]] = add nuw nsw i32 [[I_014]], 1
; CHECK-NEXT:    [[EXITCOND_NOT:%.*]] = icmp eq i32 [[INC]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT]], label [[RETURN]], label [[FOR_BODY]]
; CHECK:       for.body.clone:
; CHECK-NEXT:    [[I_014_CLONE:%.*]] = phi i32 [ [[INC_CLONE:%.*]], [[FOR_BODY_CLONE]] ], [ 0, [[FOR_COND_PREHEADER]] ]
; CHECK-NEXT:    [[MUL_CLONE:%.*]] = mul nsw i32 [[I_014_CLONE]], [[STEP_IN]]
; CHECK-NEXT:    [[ARRAYIDX_CLONE:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[MUL_CLONE]]
; CHECK-NEXT:    [[TMP1:%.*]] = load float, ptr [[ARRAYIDX_CLONE]], align 4
; CHECK-NEXT:    [[MUL5_CLONE:%.*]] = fmul float [[TMP1]], [[C]]
; CHECK-NEXT:    [[MUL6_CLONE:%.*]] = mul nsw i32 [[I_014_CLONE]], [[STEP_OUT]]
; CHECK-NEXT:    [[ARRAYIDX7_CLONE:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[MUL6_CLONE]]
; CHECK-NEXT:    store float [[MUL5_CLONE]], ptr [[ARRAYIDX7_CLONE]], align 4
; CHECK-NEXT:    [[INC_CLONE]] = add nuw nsw i32 [[I_014_CLONE]], 1
; CHECK-NEXT:    [[EXITCOND_NOT_CLONE:%.*]] = icmp eq i32 [[INC_CLONE]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT_CLONE]], label [[RETURN]], label [[FOR_BODY_CLONE]]
; CHECK:       return:
; CHECK-NEXT:    [[RETVAL_0:%.*]] = phi i32 [ 458755, [[ENTRY:%.*]] ], [ 0, [[FOR_COND_PREHEADER]] ], [ 0, [[FOR_BODY]] ], [ 0, [[FOR_BODY_CLONE]] ]
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
  %cmp413 = icmp sgt i32 %len, 0
  br i1 %cmp413, label %for.body.clone, label %return

for.body:                                         ; preds = %if.end, %for.body
  %i.014 = phi i32 [ %inc, %for.body ], [ 0, %if.end ]
  %mul = mul nsw i32 %i.014, %step_in
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %mul
  %0 = load float, ptr %arrayidx, align 4
  %mul5 = fmul float %0, %C
  %mul6 = mul nsw i32 %i.014, %step_out
  %arrayidx7 = getelementptr inbounds float, ptr %output, i32 %mul6
  store float %mul5, ptr %arrayidx7, align 4
  %inc = add nuw nsw i32 %i.014, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body

for.body.clone:                                   ; preds = %for.cond.preheader, %for.body.clone
  %i.014.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.014.clone, %step_in
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %mul.clone
  %1 = load float, ptr %arrayidx.clone, align 4
  %mul5.clone = fmul float %1, %C
  %mul6.clone = mul nsw i32 %i.014.clone, %step_out
  %arrayidx7.clone = getelementptr inbounds float, ptr %output, i32 %mul6.clone
  store float %mul5.clone, ptr %arrayidx7.clone, align 4
  %inc.clone = add nuw nsw i32 %i.014.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone

return:                                           ; preds = %for.body.clone, %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ], [ 0, %for.body.clone ]
  ret i32 %retval.0
}
