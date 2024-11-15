; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt -S -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true < %s | FileCheck %s
; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_biquad_f32_ansi(ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len, ptr nocapture noundef readonly %coef, ptr nocapture noundef %w) local_unnamed_addr {
; CHECK-LABEL: define dso_local noundef i32 @dsps_biquad_f32_ansi(
; CHECK-SAME: ptr nocapture noundef readonly [[INPUT:%.*]], ptr nocapture noundef writeonly [[OUTPUT:%.*]], i32 noundef [[LEN:%.*]], ptr nocapture noundef readonly [[COEF:%.*]], ptr nocapture noundef [[W:%.*]]) local_unnamed_addr {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[LEN]], 2
; CHECK-NEXT:    br i1 [[TMP0]], label [[FOR_COND_PREHEADER:%.*]], label [[FOR_BODY_LR_PH_CLONE:%.*]]
; CHECK:       for.cond.preheader:
; CHECK-NEXT:    [[CMP30:%.*]] = icmp sgt i32 [[LEN]], 0
; CHECK-NEXT:    br i1 [[CMP30]], label [[FOR_BODY_LR_PH:%.*]], label [[IF_END:%.*]]
; CHECK:       for.body.lr.ph:
; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 3
; CHECK-NEXT:    [[ARRAYIDX3:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 4
; CHECK-NEXT:    [[ARRAYIDX4:%.*]] = getelementptr inbounds float, ptr [[W]], i32 1
; CHECK-NEXT:    [[ARRAYIDX7:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 1
; CHECK-NEXT:    [[ARRAYIDX10:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 2
; CHECK-NEXT:    [[DOTPRE:%.*]] = load float, ptr [[W]], align 4
; CHECK-NEXT:    [[DOTPRE32:%.*]] = load float, ptr [[ARRAYIDX4]], align 4
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       if.end:
; CHECK-NEXT:    ret i32 0
; CHECK:       for.body:
; CHECK-NEXT:    [[TMP1:%.*]] = phi float [ [[DOTPRE32]], [[FOR_BODY_LR_PH]] ], [ [[TMP13:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[TMP2:%.*]] = phi float [ [[DOTPRE]], [[FOR_BODY_LR_PH]] ], [ [[TMP7:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[I_031:%.*]] = phi i32 [ 0, [[FOR_BODY_LR_PH]] ], [ [[INC:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[I_031]]
; CHECK-NEXT:    [[TMP3:%.*]] = load float, ptr [[ARRAYIDX]], align 4
; CHECK-NEXT:    [[TMP4:%.*]] = load float, ptr [[ARRAYIDX1]], align 4
; CHECK-NEXT:    [[NEG:%.*]] = fneg float [[TMP4]]
; CHECK-NEXT:    [[TMP5:%.*]] = tail call float @llvm.fmuladd.f32(float [[NEG]], float [[TMP2]], float [[TMP3]])
; CHECK-NEXT:    [[TMP6:%.*]] = load float, ptr [[ARRAYIDX3]], align 4
; CHECK-NEXT:    [[NEG5:%.*]] = fneg float [[TMP6]]
; CHECK-NEXT:    [[TMP7]] = tail call float @llvm.fmuladd.f32(float [[NEG5]], float [[TMP1]], float [[TMP5]])
; CHECK-NEXT:    [[TMP8:%.*]] = load float, ptr [[COEF]], align 4
; CHECK-NEXT:    [[TMP9:%.*]] = load float, ptr [[ARRAYIDX7]], align 4
; CHECK-NEXT:    [[MUL9:%.*]] = fmul float [[TMP2]], [[TMP9]]
; CHECK-NEXT:    [[TMP10:%.*]] = tail call float @llvm.fmuladd.f32(float [[TMP8]], float [[TMP7]], float [[MUL9]])
; CHECK-NEXT:    [[TMP11:%.*]] = load float, ptr [[ARRAYIDX10]], align 4
; CHECK-NEXT:    [[TMP12:%.*]] = tail call float @llvm.fmuladd.f32(float [[TMP11]], float [[TMP1]], float [[TMP10]])
; CHECK-NEXT:    [[ARRAYIDX12:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[I_031]]
; CHECK-NEXT:    store float [[TMP12]], ptr [[ARRAYIDX12]], align 4
; CHECK-NEXT:    [[TMP13]] = load float, ptr [[W]], align 4
; CHECK-NEXT:    store float [[TMP13]], ptr [[ARRAYIDX4]], align 4
; CHECK-NEXT:    store float [[TMP7]], ptr [[W]], align 4
; CHECK-NEXT:    [[INC]] = add nuw nsw i32 [[I_031]], 1
; CHECK-NEXT:    [[EXITCOND_NOT:%.*]] = icmp eq i32 [[INC]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT]], label [[IF_END]], label [[FOR_BODY]]
; CHECK:       for.body.lr.ph.clone:
; CHECK-NEXT:    [[ARRAYIDX1_CLONE:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 3
; CHECK-NEXT:    [[ARRAYIDX3_CLONE:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 4
; CHECK-NEXT:    [[ARRAYIDX4_CLONE:%.*]] = getelementptr inbounds float, ptr [[W]], i32 1
; CHECK-NEXT:    [[ARRAYIDX7_CLONE:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 1
; CHECK-NEXT:    [[ARRAYIDX10_CLONE:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 2
; CHECK-NEXT:    [[DOTPRE_CLONE:%.*]] = load float, ptr [[W]], align 4
; CHECK-NEXT:    [[DOTPRE32_CLONE:%.*]] = load float, ptr [[ARRAYIDX4_CLONE]], align 4
; CHECK-NEXT:    br label [[FOR_BODY_CLONE:%.*]]
; CHECK:       for.body.clone:
; CHECK-NEXT:    [[TMP14:%.*]] = phi float [ [[DOTPRE32_CLONE]], [[FOR_BODY_LR_PH_CLONE]] ], [ [[TMP26:%.*]], [[FOR_BODY_CLONE]] ]
; CHECK-NEXT:    [[TMP15:%.*]] = phi float [ [[DOTPRE_CLONE]], [[FOR_BODY_LR_PH_CLONE]] ], [ [[TMP20:%.*]], [[FOR_BODY_CLONE]] ]
; CHECK-NEXT:    [[I_031_CLONE:%.*]] = phi i32 [ 0, [[FOR_BODY_LR_PH_CLONE]] ], [ [[INC_CLONE:%.*]], [[FOR_BODY_CLONE]] ]
; CHECK-NEXT:    [[ARRAYIDX_CLONE:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[I_031_CLONE]]
; CHECK-NEXT:    [[TMP16:%.*]] = load float, ptr [[ARRAYIDX_CLONE]], align 4
; CHECK-NEXT:    [[TMP17:%.*]] = load float, ptr [[ARRAYIDX1_CLONE]], align 4
; CHECK-NEXT:    [[NEG_CLONE:%.*]] = fneg float [[TMP17]]
; CHECK-NEXT:    [[TMP18:%.*]] = tail call float @llvm.fmuladd.f32(float [[NEG_CLONE]], float [[TMP15]], float [[TMP16]])
; CHECK-NEXT:    [[TMP19:%.*]] = load float, ptr [[ARRAYIDX3_CLONE]], align 4
; CHECK-NEXT:    [[NEG5_CLONE:%.*]] = fneg float [[TMP19]]
; CHECK-NEXT:    [[TMP20]] = tail call float @llvm.fmuladd.f32(float [[NEG5_CLONE]], float [[TMP14]], float [[TMP18]])
; CHECK-NEXT:    [[TMP21:%.*]] = load float, ptr [[COEF]], align 4
; CHECK-NEXT:    [[TMP22:%.*]] = load float, ptr [[ARRAYIDX7_CLONE]], align 4
; CHECK-NEXT:    [[MUL9_CLONE:%.*]] = fmul float [[TMP15]], [[TMP22]]
; CHECK-NEXT:    [[TMP23:%.*]] = tail call float @llvm.fmuladd.f32(float [[TMP21]], float [[TMP20]], float [[MUL9_CLONE]])
; CHECK-NEXT:    [[TMP24:%.*]] = load float, ptr [[ARRAYIDX10_CLONE]], align 4
; CHECK-NEXT:    [[TMP25:%.*]] = tail call float @llvm.fmuladd.f32(float [[TMP24]], float [[TMP14]], float [[TMP23]])
; CHECK-NEXT:    [[ARRAYIDX12_CLONE:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[I_031_CLONE]]
; CHECK-NEXT:    store float [[TMP25]], ptr [[ARRAYIDX12_CLONE]], align 4
; CHECK-NEXT:    [[TMP26]] = load float, ptr [[W]], align 4
; CHECK-NEXT:    store float [[TMP26]], ptr [[ARRAYIDX4_CLONE]], align 4
; CHECK-NEXT:    store float [[TMP20]], ptr [[W]], align 4
; CHECK-NEXT:    [[INC_CLONE]] = add nuw nsw i32 [[I_031_CLONE]], 1
; CHECK-NEXT:    [[EXITCOND_NOT_CLONE:%.*]] = icmp eq i32 [[INC_CLONE]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT_CLONE]], label [[IF_END]], label [[FOR_BODY_CLONE]]
;
entry:
  %cmp30 = icmp sgt i32 %len, 0
  br i1 %cmp30, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %arrayidx1 = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3 = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4 = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7 = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10 = getelementptr inbounds float, ptr %coef, i32 2
  %.pre = load float, ptr %w, align 4
  %.pre32 = load float, ptr %arrayidx4, align 4
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret i32 0

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %0 = phi float [ %.pre32, %for.body.lr.ph ], [ %12, %for.body ]
  %1 = phi float [ %.pre, %for.body.lr.ph ], [ %6, %for.body ]
  %i.031 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.031
  %2 = load float, ptr %arrayidx, align 4
  %3 = load float, ptr %arrayidx1, align 4
  %neg = fneg float %3
  %4 = tail call float @llvm.fmuladd.f32(float %neg, float %1, float %2)
  %5 = load float, ptr %arrayidx3, align 4
  %neg5 = fneg float %5
  %6 = tail call float @llvm.fmuladd.f32(float %neg5, float %0, float %4)
  %7 = load float, ptr %coef, align 4
  %8 = load float, ptr %arrayidx7, align 4
  %mul9 = fmul float %1, %8
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %6, float %mul9)
  %10 = load float, ptr %arrayidx10, align 4
  %11 = tail call float @llvm.fmuladd.f32(float %10, float %0, float %9)
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %i.031
  store float %11, ptr %arrayidx12, align 4
  %12 = load float, ptr %w, align 4
  store float %12, ptr %arrayidx4, align 4
  store float %6, ptr %w, align 4
  %inc = add nuw nsw i32 %i.031, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body
}