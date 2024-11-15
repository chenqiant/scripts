; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt -S -mtriple=riscv32-esp-unknown-elf -passes=riscv-loop-unroll-and-remainder -riscv-loop-unroll-and-remainder=true < %s | FileCheck %s
define dso_local noundef i32 @dsps_dotprod_f32_ansi(ptr nocapture noundef readonly %src1, ptr nocapture noundef readonly %src2, ptr nocapture noundef writeonly %dest, i32 noundef %len) local_unnamed_addr {
; CHECK-LABEL: define dso_local noundef i32 @dsps_dotprod_f32_ansi(
; CHECK-SAME: ptr noalias nocapture noundef readonly [[SRC1:%.*]], ptr noalias nocapture noundef readonly [[SRC2:%.*]], ptr noalias nocapture noundef writeonly [[DEST:%.*]], i32 noundef [[LEN:%.*]]) local_unnamed_addr {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[LEN]], 2
; CHECK-NEXT:    br i1 [[TMP0]], label [[FOR_COND_PREHEADER1:%.*]], label [[FOR_COND_PREHEADER:%.*]]
; CHECK:       for.cond.preheader:
; CHECK-NEXT:    [[CMP47110:%.*]] = icmp sgt i32 [[LEN]], 0
; CHECK-NEXT:    br i1 [[CMP47110]], label [[FOR_BODY_CLONE:%.*]], label [[IF_END:%.*]]
; CHECK:       if.end:
; CHECK-NEXT:    [[ACC_0_LCSSA:%.*]] = phi float [ 0.000000e+00, [[FOR_COND_PREHEADER]] ], [ [[ADD44:%.*]], [[FOR_END37:%.*]] ], [ [[TMP31:%.*]], [[FOR_BODY_CLONE]] ]
; CHECK-NEXT:    store float [[ACC_0_LCSSA]], ptr [[DEST]], align 4
; CHECK-NEXT:    ret i32 0
; CHECK:       for.cond.preheader1:
; CHECK-NEXT:    [[SUB:%.*]] = add nsw i32 [[LEN]], -7
; CHECK-NEXT:    [[CMP1113:%.*]] = icmp ugt i32 [[LEN]], 7
; CHECK-NEXT:    br i1 [[CMP1113]], label [[FOR_BODY_PREHEADER:%.*]], label [[FOR_COND31_PREHEADER:%.*]]
; CHECK:       for.body.preheader:
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[LEN]], 2147483640
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.cond31.preheader:
; CHECK-NEXT:    [[ACC0_0_LCSSA:%.*]] = phi float [ [[TMP19:%.*]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_COND_PREHEADER1]] ]
; CHECK-NEXT:    [[ACC1_0_LCSSA:%.*]] = phi float [ [[TMP20:%.*]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_COND_PREHEADER1]] ]
; CHECK-NEXT:    [[ACC2_0_LCSSA:%.*]] = phi float [ [[TMP21:%.*]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_COND_PREHEADER1]] ]
; CHECK-NEXT:    [[ACC3_0_LCSSA:%.*]] = phi float [ [[TMP22:%.*]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_COND_PREHEADER1]] ]
; CHECK-NEXT:    [[ACC4_0_LCSSA:%.*]] = phi float [ [[TMP23:%.*]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_COND_PREHEADER1]] ]
; CHECK-NEXT:    [[ACC5_0_LCSSA:%.*]] = phi float [ [[TMP24:%.*]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_COND_PREHEADER1]] ]
; CHECK-NEXT:    [[ACC6_0_LCSSA:%.*]] = phi float [ [[TMP25:%.*]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_COND_PREHEADER1]] ]
; CHECK-NEXT:    [[I_0_LCSSA:%.*]] = phi i32 [ 0, [[FOR_COND_PREHEADER1]] ], [ [[TMP1]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[CMP32132:%.*]] = icmp slt i32 [[I_0_LCSSA]], [[LEN]]
; CHECK-NEXT:    br i1 [[CMP32132]], label [[FOR_BODY33:%.*]], label [[FOR_END37]]
; CHECK:       for.body:
; CHECK-NEXT:    [[I_0122:%.*]] = phi i32 [ [[ADD30:%.*]], [[FOR_BODY]] ], [ 0, [[FOR_BODY_PREHEADER]] ]
; CHECK-NEXT:    [[ACC_07:%.*]] = phi float [ [[TMP18:%.*]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_BODY_PREHEADER]] ]
; CHECK-NEXT:    [[ACC1:%.*]] = phi float [ [[TMP19]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_BODY_PREHEADER]] ]
; CHECK-NEXT:    [[ACC2:%.*]] = phi float [ [[TMP20]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_BODY_PREHEADER]] ]
; CHECK-NEXT:    [[ACC3:%.*]] = phi float [ [[TMP21]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_BODY_PREHEADER]] ]
; CHECK-NEXT:    [[ACC4:%.*]] = phi float [ [[TMP22]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_BODY_PREHEADER]] ]
; CHECK-NEXT:    [[ACC5:%.*]] = phi float [ [[TMP23]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_BODY_PREHEADER]] ]
; CHECK-NEXT:    [[ACC6:%.*]] = phi float [ [[TMP24]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_BODY_PREHEADER]] ]
; CHECK-NEXT:    [[ACC7:%.*]] = phi float [ [[TMP25]], [[FOR_BODY]] ], [ 0.000000e+00, [[FOR_BODY_PREHEADER]] ]
; CHECK-NEXT:    [[ADD1:%.*]] = or disjoint i32 [[I_0122]], 1
; CHECK-NEXT:    [[ADD2:%.*]] = or disjoint i32 [[I_0122]], 2
; CHECK-NEXT:    [[ADD3:%.*]] = or disjoint i32 [[I_0122]], 3
; CHECK-NEXT:    [[ADD4:%.*]] = or disjoint i32 [[I_0122]], 4
; CHECK-NEXT:    [[ADD5:%.*]] = or disjoint i32 [[I_0122]], 5
; CHECK-NEXT:    [[ADD6:%.*]] = or disjoint i32 [[I_0122]], 6
; CHECK-NEXT:    [[ADD7:%.*]] = or disjoint i32 [[I_0122]], 7
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[I_0122]]
; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[I_0122]]
; CHECK-NEXT:    [[ARRAYIDX1_0:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[ADD1]]
; CHECK-NEXT:    [[ARRAYIDX1_1:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[ADD1]]
; CHECK-NEXT:    [[ARRAYIDX2_0:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[ADD2]]
; CHECK-NEXT:    [[ARRAYIDX2_1:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[ADD2]]
; CHECK-NEXT:    [[ARRAYIDX3_0:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[ADD3]]
; CHECK-NEXT:    [[ARRAYIDX3_1:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[ADD3]]
; CHECK-NEXT:    [[ARRAYIDX4_0:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[ADD4]]
; CHECK-NEXT:    [[ARRAYIDX4_1:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[ADD4]]
; CHECK-NEXT:    [[ARRAYIDX5_0:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[ADD5]]
; CHECK-NEXT:    [[ARRAYIDX5_1:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[ADD5]]
; CHECK-NEXT:    [[ARRAYIDX6_0:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[ADD6]]
; CHECK-NEXT:    [[ARRAYIDX6_1:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[ADD6]]
; CHECK-NEXT:    [[ARRAYIDX7_0:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[ADD7]]
; CHECK-NEXT:    [[ARRAYIDX7_1:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[ADD7]]
; CHECK-NEXT:    [[TMP2:%.*]] = load float, ptr [[ARRAYIDX]], align 4
; CHECK-NEXT:    [[TMP3:%.*]] = load float, ptr [[ARRAYIDX1]], align 4
; CHECK-NEXT:    [[TMP4:%.*]] = load float, ptr [[ARRAYIDX1_0]], align 4
; CHECK-NEXT:    [[TMP5:%.*]] = load float, ptr [[ARRAYIDX1_1]], align 4
; CHECK-NEXT:    [[TMP6:%.*]] = load float, ptr [[ARRAYIDX2_0]], align 4
; CHECK-NEXT:    [[TMP7:%.*]] = load float, ptr [[ARRAYIDX2_1]], align 4
; CHECK-NEXT:    [[TMP8:%.*]] = load float, ptr [[ARRAYIDX3_0]], align 4
; CHECK-NEXT:    [[TMP9:%.*]] = load float, ptr [[ARRAYIDX3_1]], align 4
; CHECK-NEXT:    [[TMP10:%.*]] = load float, ptr [[ARRAYIDX4_0]], align 4
; CHECK-NEXT:    [[TMP11:%.*]] = load float, ptr [[ARRAYIDX4_1]], align 4
; CHECK-NEXT:    [[TMP12:%.*]] = load float, ptr [[ARRAYIDX5_0]], align 4
; CHECK-NEXT:    [[TMP13:%.*]] = load float, ptr [[ARRAYIDX5_1]], align 4
; CHECK-NEXT:    [[TMP14:%.*]] = load float, ptr [[ARRAYIDX6_0]], align 4
; CHECK-NEXT:    [[TMP15:%.*]] = load float, ptr [[ARRAYIDX6_1]], align 4
; CHECK-NEXT:    [[TMP16:%.*]] = load float, ptr [[ARRAYIDX7_0]], align 4
; CHECK-NEXT:    [[TMP17:%.*]] = load float, ptr [[ARRAYIDX7_1]], align 4
; CHECK-NEXT:    [[TMP18]] = tail call float @llvm.fmuladd.f32(float [[TMP2]], float [[TMP3]], float [[ACC_07]])
; CHECK-NEXT:    [[TMP19]] = tail call float @llvm.fmuladd.f32(float [[TMP4]], float [[TMP5]], float [[ACC1]])
; CHECK-NEXT:    [[TMP20]] = tail call float @llvm.fmuladd.f32(float [[TMP6]], float [[TMP7]], float [[ACC2]])
; CHECK-NEXT:    [[TMP21]] = tail call float @llvm.fmuladd.f32(float [[TMP8]], float [[TMP9]], float [[ACC3]])
; CHECK-NEXT:    [[TMP22]] = tail call float @llvm.fmuladd.f32(float [[TMP10]], float [[TMP11]], float [[ACC4]])
; CHECK-NEXT:    [[TMP23]] = tail call float @llvm.fmuladd.f32(float [[TMP12]], float [[TMP13]], float [[ACC5]])
; CHECK-NEXT:    [[TMP24]] = tail call float @llvm.fmuladd.f32(float [[TMP14]], float [[TMP15]], float [[ACC6]])
; CHECK-NEXT:    [[TMP25]] = tail call float @llvm.fmuladd.f32(float [[TMP16]], float [[TMP17]], float [[ACC7]])
; CHECK-NEXT:    [[ADD30]] = add nuw nsw i32 [[I_0122]], 8
; CHECK-NEXT:    [[CMP1:%.*]] = icmp slt i32 [[ADD30]], [[SUB]]
; CHECK-NEXT:    br i1 [[CMP1]], label [[FOR_BODY]], label [[FOR_COND31_PREHEADER]]
; CHECK:       for.body33:
; CHECK-NEXT:    [[I_0833:%.*]] = phi i32 [ [[INC33:%.*]], [[FOR_BODY33]] ], [ [[I_0_LCSSA]], [[FOR_COND31_PREHEADER]] ]
; CHECK-NEXT:    [[ACC_0733:%.*]] = phi float [ [[TMP28:%.*]], [[FOR_BODY33]] ], [ [[ACC0_0_LCSSA]], [[FOR_COND31_PREHEADER]] ]
; CHECK-NEXT:    [[ARRAYIDX33:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[I_0833]]
; CHECK-NEXT:    [[TMP26:%.*]] = load float, ptr [[ARRAYIDX33]], align 4
; CHECK-NEXT:    [[ARRAYIDX133:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[I_0833]]
; CHECK-NEXT:    [[TMP27:%.*]] = load float, ptr [[ARRAYIDX133]], align 4
; CHECK-NEXT:    [[TMP28]] = tail call float @llvm.fmuladd.f32(float [[TMP26]], float [[TMP27]], float [[ACC_0733]])
; CHECK-NEXT:    [[INC33]] = add nuw nsw i32 [[I_0833]], 1
; CHECK-NEXT:    [[EXITCOND_NOT33:%.*]] = icmp eq i32 [[INC33]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT33]], label [[FOR_END37]], label [[FOR_BODY33]]
; CHECK:       for.end37:
; CHECK-NEXT:    [[ACC0_1_LCSSA:%.*]] = phi float [ [[TMP28]], [[FOR_BODY33]] ], [ [[ACC0_0_LCSSA]], [[FOR_COND31_PREHEADER]] ]
; CHECK-NEXT:    [[ADD38:%.*]] = fadd float [[ACC0_0_LCSSA]], [[ACC0_1_LCSSA]]
; CHECK-NEXT:    [[ADD39:%.*]] = fadd float [[ACC1_0_LCSSA]], [[ADD38]]
; CHECK-NEXT:    [[ADD40:%.*]] = fadd float [[ACC2_0_LCSSA]], [[ADD39]]
; CHECK-NEXT:    [[ADD41:%.*]] = fadd float [[ACC3_0_LCSSA]], [[ADD40]]
; CHECK-NEXT:    [[ADD42:%.*]] = fadd float [[ACC4_0_LCSSA]], [[ADD41]]
; CHECK-NEXT:    [[ADD43:%.*]] = fadd float [[ACC5_0_LCSSA]], [[ADD42]]
; CHECK-NEXT:    [[ADD44]] = fadd float [[ACC6_0_LCSSA]], [[ADD43]]
; CHECK-NEXT:    br label [[IF_END]]
; CHECK:       for.body.clone:
; CHECK-NEXT:    [[I_08_CLONE:%.*]] = phi i32 [ [[INC_CLONE:%.*]], [[FOR_BODY_CLONE]] ], [ 0, [[FOR_COND_PREHEADER]] ]
; CHECK-NEXT:    [[ACC_07_CLONE:%.*]] = phi float [ [[TMP31]], [[FOR_BODY_CLONE]] ], [ 0.000000e+00, [[FOR_COND_PREHEADER]] ]
; CHECK-NEXT:    [[ARRAYIDX_CLONE:%.*]] = getelementptr inbounds float, ptr [[SRC1]], i32 [[I_08_CLONE]]
; CHECK-NEXT:    [[TMP29:%.*]] = load float, ptr [[ARRAYIDX_CLONE]], align 4
; CHECK-NEXT:    [[ARRAYIDX1_CLONE:%.*]] = getelementptr inbounds float, ptr [[SRC2]], i32 [[I_08_CLONE]]
; CHECK-NEXT:    [[TMP30:%.*]] = load float, ptr [[ARRAYIDX1_CLONE]], align 4
; CHECK-NEXT:    [[TMP31]] = tail call float @llvm.fmuladd.f32(float [[TMP29]], float [[TMP30]], float [[ACC_07_CLONE]])
; CHECK-NEXT:    [[INC_CLONE]] = add nuw nsw i32 [[I_08_CLONE]], 1
; CHECK-NEXT:    [[EXITCOND_NOT_CLONE:%.*]] = icmp eq i32 [[INC_CLONE]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT_CLONE]], label [[IF_END]], label [[FOR_BODY_CLONE]]
;
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.body, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp6 = icmp sgt i32 %len, 0
  br i1 %cmp6, label %for.body.clone, label %if.end

if.end:                                           ; preds = %for.body.clone, %for.body, %for.cond.preheader
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %3, %for.body ], [ %6, %for.body.clone ]
  store float %acc.0.lcssa, ptr %dest, align 4
  ret i32 0

for.body:                                         ; preds = %for.body, %entry
  %i.08 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %acc.07 = phi float [ %3, %for.body ], [ 0.000000e+00, %entry ]
  %arrayidx = getelementptr inbounds float, ptr %src1, i32 %i.08
  %1 = load float, ptr %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds float, ptr %src2, i32 %i.08
  %2 = load float, ptr %arrayidx1, align 4
  %3 = tail call float @llvm.fmuladd.f32(float %1, float %2, float %acc.07)
  %inc = add nuw nsw i32 %i.08, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %if.end, label %for.body

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.08.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %acc.07.clone = phi float [ %6, %for.body.clone ], [ 0.000000e+00, %for.cond.preheader ]
  %arrayidx.clone = getelementptr inbounds float, ptr %src1, i32 %i.08.clone
  %4 = load float, ptr %arrayidx.clone, align 4
  %arrayidx1.clone = getelementptr inbounds float, ptr %src2, i32 %i.08.clone
  %5 = load float, ptr %arrayidx1.clone, align 4
  %6 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %acc.07.clone)
  %inc.clone = add nuw nsw i32 %i.08.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %if.end, label %for.body.clone
}
