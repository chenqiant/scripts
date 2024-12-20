; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt -S -mtriple=riscv32-esp-unknown-elf -passes=riscv-custom-licm -riscv-custom-licm=true < %s | FileCheck %s
define dso_local noundef i32 @dsps_dotprode_f32_ansi(ptr nocapture noundef readonly %src1, ptr nocapture noundef readonly %src2, ptr nocapture noundef writeonly %dest, i32 noundef %len, i32 noundef %step1, i32 noundef %step2) local_unnamed_addr {
; CHECK-LABEL: define dso_local noundef i32 @dsps_dotprode_f32_ansi(
; CHECK-SAME: ptr nocapture noundef readonly [[SRC1:%.*]], ptr nocapture noundef readonly [[SRC2:%.*]], ptr nocapture noundef writeonly [[DEST:%.*]], i32 noundef [[LEN:%.*]], i32 noundef [[STEP1:%.*]], i32 noundef [[STEP2:%.*]]) local_unnamed_addr {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[LEN]], 2
; CHECK-NEXT:    br i1 [[TMP0]], label [[FOR_BODY:%.*]], label [[FOR_COND_PREHEADER:%.*]]
; CHECK:       for.cond.preheader:
; CHECK-NEXT:    [[CMP8:%.*]] = icmp sgt i32 [[LEN]], 0
; CHECK-NEXT:    br i1 [[CMP8]], label [[FOR_BODY_CLONE:%.*]], label [[IF_END:%.*]]
; CHECK:       if.end:
; CHECK-NEXT:    [[ACC_0_LCSSA:%.*]] = phi float [ 0.000000e+00, [[FOR_COND_PREHEADER]] ], [ [[TMP3:%.*]], [[FOR_BODY]] ], [ [[TMP6:%.*]], [[FOR_BODY_CLONE]] ]
; CHECK-NEXT:    store float [[ACC_0_LCSSA]], ptr [[DEST]], align 4
; CHECK-NEXT:    ret i32 0
; CHECK:       for.body:
; CHECK-NEXT:    [[I_010:%.*]] = phi i32 [ [[INC:%.*]], [[FOR_BODY]] ], [ 0, [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[ACC_09:%.*]] = phi float [ [[TMP3]], [[FOR_BODY]] ], [ 0.000000e+00, [[ENTRY]] ]
; CHECK-NEXT:    [[MUL:%.*]] = mul nsw i32 [[I_010]], [[STEP1]]
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[MUL]]
; CHECK-NEXT:    [[TMP1:%.*]] = load float, ptr [[ARRAYIDX]], align 4
; CHECK-NEXT:    [[MUL1:%.*]] = mul nsw i32 [[I_010]], [[STEP2]]
; CHECK-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[MUL1]]
; CHECK-NEXT:    [[TMP2:%.*]] = load float, ptr [[ARRAYIDX2]], align 4
; CHECK-NEXT:    [[TMP3]] = tail call float @llvm.fmuladd.f32(float [[TMP1]], float [[TMP2]], float [[ACC_09]])
; CHECK-NEXT:    [[INC]] = add nuw nsw i32 [[I_010]], 1
; CHECK-NEXT:    [[EXITCOND_NOT:%.*]] = icmp eq i32 [[INC]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT]], label [[IF_END]], label [[FOR_BODY]]
; CHECK:       for.body.clone:
; CHECK-NEXT:    [[I_010_CLONE:%.*]] = phi i32 [ [[INC_CLONE:%.*]], [[FOR_BODY_CLONE]] ], [ 0, [[FOR_COND_PREHEADER]] ]
; CHECK-NEXT:    [[ACC_09_CLONE:%.*]] = phi float [ [[TMP6]], [[FOR_BODY_CLONE]] ], [ 0.000000e+00, [[FOR_COND_PREHEADER]] ]
; CHECK-NEXT:    [[MUL_CLONE:%.*]] = mul nsw i32 [[I_010_CLONE]], [[STEP1]]
; CHECK-NEXT:    [[ARRAYIDX_CLONE:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[MUL_CLONE]]
; CHECK-NEXT:    [[TMP4:%.*]] = load float, ptr [[ARRAYIDX_CLONE]], align 4
; CHECK-NEXT:    [[MUL1_CLONE:%.*]] = mul nsw i32 [[I_010_CLONE]], [[STEP2]]
; CHECK-NEXT:    [[ARRAYIDX2_CLONE:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[MUL1_CLONE]]
; CHECK-NEXT:    [[TMP5:%.*]] = load float, ptr [[ARRAYIDX2_CLONE]], align 4
; CHECK-NEXT:    [[TMP6]] = tail call float @llvm.fmuladd.f32(float [[TMP4]], float [[TMP5]], float [[ACC_09_CLONE]])
; CHECK-NEXT:    [[INC_CLONE]] = add nuw nsw i32 [[I_010_CLONE]], 1
; CHECK-NEXT:    [[EXITCOND_NOT_CLONE:%.*]] = icmp eq i32 [[INC_CLONE]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT_CLONE]], label [[IF_END]], label [[FOR_BODY_CLONE]]
;
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.body, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp8 = icmp sgt i32 %len, 0
  br i1 %cmp8, label %for.body.clone, label %if.end

if.end:                                           ; preds = %for.body.clone, %for.body, %for.cond.preheader
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %3, %for.body ], [ %6, %for.body.clone ]
  store float %acc.0.lcssa, ptr %dest, align 4
  ret i32 0

for.body:                                         ; preds = %entry, %for.body
  %i.010 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %acc.09 = phi float [ %3, %for.body ], [ 0.000000e+00, %entry ]
  %mul = mul nsw i32 %i.010, %step1
  %arrayidx = getelementptr inbounds float, ptr %src1, i32 %mul
  %1 = load float, ptr %arrayidx, align 4
  %mul1 = mul nsw i32 %i.010, %step2
  %arrayidx2 = getelementptr inbounds float, ptr %src2, i32 %mul1
  %2 = load float, ptr %arrayidx2, align 4
  %3 = tail call float @llvm.fmuladd.f32(float %1, float %2, float %acc.09)
  %inc = add nuw nsw i32 %i.010, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %if.end, label %for.body

for.body.clone:                                   ; preds = %for.cond.preheader, %for.body.clone
  %i.010.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %acc.09.clone = phi float [ %6, %for.body.clone ], [ 0.000000e+00, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.010.clone, %step1
  %arrayidx.clone = getelementptr inbounds float, ptr %src1, i32 %mul.clone
  %4 = load float, ptr %arrayidx.clone, align 4
  %mul1.clone = mul nsw i32 %i.010.clone, %step2
  %arrayidx2.clone = getelementptr inbounds float, ptr %src2, i32 %mul1.clone
  %5 = load float, ptr %arrayidx2.clone, align 4
  %6 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %acc.09.clone)
  %inc.clone = add nuw nsw i32 %i.010.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %if.end, label %for.body.clone
}
