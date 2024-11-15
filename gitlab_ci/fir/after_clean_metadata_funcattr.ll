; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt -S -mtriple=riscv32-esp-unknown-elf -passes=riscv-split-loop-by-length -riscv-split-loop-by-length=true < %s | FileCheck %s
%struct.fir_f32_s = type { ptr, ptr, i32, i32, i32, i16 }
; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fir_f32_ansi(ptr nocapture noundef %fir, ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr {
; CHECK-LABEL: define dso_local noundef i32 @dsps_fir_f32_ansi(
; CHECK-SAME: ptr nocapture noundef [[FIR:%.*]], ptr nocapture noundef readonly [[INPUT:%.*]], ptr nocapture noundef writeonly [[OUTPUT:%.*]], i32 noundef [[LEN:%.*]]) local_unnamed_addr {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = icmp sgt i32 [[LEN]], 2
; CHECK-NEXT:    br i1 [[TMP0]], label [[FOR_COND_PREHEADER:%.*]], label [[FOR_BODY_LR_PH_CLONE:%.*]]
; CHECK:       for.cond.preheader:
; CHECK-NEXT:    [[CMP67:%.*]] = icmp sgt i32 [[LEN]], 0
; CHECK-NEXT:    br i1 [[CMP67]], label [[FOR_BODY_LR_PH:%.*]], label [[IF_END:%.*]]
; CHECK:       for.body.lr.ph:
; CHECK-NEXT:    [[DELAY:%.*]] = getelementptr inbounds [[STRUCT_FIR_F32_S:%.*]], ptr [[FIR]], i32 0, i32 1
; CHECK-NEXT:    [[TMP1:%.*]] = load ptr, ptr [[DELAY]], align 4
; CHECK-NEXT:    [[POS:%.*]] = getelementptr inbounds [[STRUCT_FIR_F32_S]], ptr [[FIR]], i32 0, i32 3
; CHECK-NEXT:    [[N:%.*]] = getelementptr inbounds [[STRUCT_FIR_F32_S]], ptr [[FIR]], i32 0, i32 2
; CHECK-NEXT:    [[TMP2:%.*]] = load i32, ptr [[N]], align 4
; CHECK-NEXT:    [[DOTPRE:%.*]] = load i32, ptr [[POS]], align 4
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       if.end:
; CHECK-NEXT:    ret i32 0
; CHECK:       for.body:
; CHECK-NEXT:    [[TMP3:%.*]] = phi i32 [ [[DOTPRE]], [[FOR_BODY_LR_PH]] ], [ [[SPEC_STORE_SELECT:%.*]], [[FOR_COND_CLEANUP21:%.*]] ]
; CHECK-NEXT:    [[I_068:%.*]] = phi i32 [ 0, [[FOR_BODY_LR_PH]] ], [ [[INC33:%.*]], [[FOR_COND_CLEANUP21]] ]
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[I_068]]
; CHECK-NEXT:    [[TMP4:%.*]] = load float, ptr [[ARRAYIDX]], align 4
; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds float, ptr [[TMP1]], i32 [[TMP3]]
; CHECK-NEXT:    store float [[TMP4]], ptr [[ARRAYIDX1]], align 4
; CHECK-NEXT:    [[INC:%.*]] = add nsw i32 [[TMP3]], 1
; CHECK-NEXT:    [[CMP4_NOT:%.*]] = icmp slt i32 [[INC]], [[TMP2]]
; CHECK-NEXT:    [[SPEC_STORE_SELECT]] = select i1 [[CMP4_NOT]], i32 [[INC]], i32 0
; CHECK-NEXT:    store i32 [[SPEC_STORE_SELECT]], ptr [[POS]], align 4
; CHECK-NEXT:    [[CMP957:%.*]] = icmp slt i32 [[SPEC_STORE_SELECT]], [[TMP2]]
; CHECK-NEXT:    br i1 [[CMP957]], label [[FOR_BODY11_LR_PH:%.*]], label [[FOR_COND18_PREHEADER:%.*]]
; CHECK:       for.body11.lr.ph:
; CHECK-NEXT:    [[TMP5:%.*]] = load ptr, ptr [[FIR]], align 4
; CHECK-NEXT:    [[TMP6:%.*]] = sub i32 [[TMP2]], [[SPEC_STORE_SELECT]]
; CHECK-NEXT:    br label [[FOR_BODY11:%.*]]
; CHECK:       for.cond18.preheader:
; CHECK-NEXT:    [[ACC_0_LCSSA:%.*]] = phi float [ 0.000000e+00, [[FOR_BODY]] ], [ [[TMP10:%.*]], [[FOR_BODY11]] ]
; CHECK-NEXT:    [[COEFF_POS_0_LCSSA:%.*]] = phi i32 [ 0, [[FOR_BODY]] ], [ [[TMP6]], [[FOR_BODY11]] ]
; CHECK-NEXT:    [[CMP2062:%.*]] = icmp sgt i32 [[SPEC_STORE_SELECT]], 0
; CHECK-NEXT:    br i1 [[CMP2062]], label [[FOR_BODY22_LR_PH:%.*]], label [[FOR_COND_CLEANUP21]]
; CHECK:       for.body22.lr.ph:
; CHECK-NEXT:    [[TMP7:%.*]] = load ptr, ptr [[FIR]], align 4
; CHECK-NEXT:    br label [[FOR_BODY22:%.*]]
; CHECK:       for.body11:
; CHECK-NEXT:    [[N_060:%.*]] = phi i32 [ [[SPEC_STORE_SELECT]], [[FOR_BODY11_LR_PH]] ], [ [[INC16:%.*]], [[FOR_BODY11]] ]
; CHECK-NEXT:    [[COEFF_POS_059:%.*]] = phi i32 [ 0, [[FOR_BODY11_LR_PH]] ], [ [[INC12:%.*]], [[FOR_BODY11]] ]
; CHECK-NEXT:    [[ACC_058:%.*]] = phi float [ 0.000000e+00, [[FOR_BODY11_LR_PH]] ], [ [[TMP10]], [[FOR_BODY11]] ]
; CHECK-NEXT:    [[INC12]] = add nuw i32 [[COEFF_POS_059]], 1
; CHECK-NEXT:    [[ARRAYIDX13:%.*]] = getelementptr inbounds float, ptr [[TMP5]], i32 [[COEFF_POS_059]]
; CHECK-NEXT:    [[TMP8:%.*]] = load float, ptr [[ARRAYIDX13]], align 4
; CHECK-NEXT:    [[ARRAYIDX15:%.*]] = getelementptr inbounds float, ptr [[TMP1]], i32 [[N_060]]
; CHECK-NEXT:    [[TMP9:%.*]] = load float, ptr [[ARRAYIDX15]], align 4
; CHECK-NEXT:    [[TMP10]] = tail call float @llvm.fmuladd.f32(float [[TMP8]], float [[TMP9]], float [[ACC_058]])
; CHECK-NEXT:    [[INC16]] = add nsw i32 [[N_060]], 1
; CHECK-NEXT:    [[EXITCOND_NOT:%.*]] = icmp eq i32 [[INC12]], [[TMP6]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT]], label [[FOR_COND18_PREHEADER]], label [[FOR_BODY11]]
; CHECK:       for.cond.cleanup21:
; CHECK-NEXT:    [[ACC_1_LCSSA:%.*]] = phi float [ [[ACC_0_LCSSA]], [[FOR_COND18_PREHEADER]] ], [ [[TMP13:%.*]], [[FOR_BODY22]] ]
; CHECK-NEXT:    [[ARRAYIDX31:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[I_068]]
; CHECK-NEXT:    store float [[ACC_1_LCSSA]], ptr [[ARRAYIDX31]], align 4
; CHECK-NEXT:    [[INC33]] = add nuw nsw i32 [[I_068]], 1
; CHECK-NEXT:    [[EXITCOND71_NOT:%.*]] = icmp eq i32 [[INC33]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND71_NOT]], label [[IF_END]], label [[FOR_BODY]]
; CHECK:       for.body22:
; CHECK-NEXT:    [[N17_065:%.*]] = phi i32 [ 0, [[FOR_BODY22_LR_PH]] ], [ [[INC29:%.*]], [[FOR_BODY22]] ]
; CHECK-NEXT:    [[COEFF_POS_164:%.*]] = phi i32 [ [[COEFF_POS_0_LCSSA]], [[FOR_BODY22_LR_PH]] ], [ [[INC24:%.*]], [[FOR_BODY22]] ]
; CHECK-NEXT:    [[ACC_163:%.*]] = phi float [ [[ACC_0_LCSSA]], [[FOR_BODY22_LR_PH]] ], [ [[TMP13]], [[FOR_BODY22]] ]
; CHECK-NEXT:    [[INC24]] = add nuw nsw i32 [[COEFF_POS_164]], 1
; CHECK-NEXT:    [[ARRAYIDX25:%.*]] = getelementptr inbounds float, ptr [[TMP7]], i32 [[COEFF_POS_164]]
; CHECK-NEXT:    [[TMP11:%.*]] = load float, ptr [[ARRAYIDX25]], align 4
; CHECK-NEXT:    [[ARRAYIDX27:%.*]] = getelementptr inbounds float, ptr [[TMP1]], i32 [[N17_065]]
; CHECK-NEXT:    [[TMP12:%.*]] = load float, ptr [[ARRAYIDX27]], align 4
; CHECK-NEXT:    [[TMP13]] = tail call float @llvm.fmuladd.f32(float [[TMP11]], float [[TMP12]], float [[ACC_163]])
; CHECK-NEXT:    [[INC29]] = add nuw nsw i32 [[N17_065]], 1
; CHECK-NEXT:    [[EXITCOND70_NOT:%.*]] = icmp eq i32 [[INC29]], [[SPEC_STORE_SELECT]]
; CHECK-NEXT:    br i1 [[EXITCOND70_NOT]], label [[FOR_COND_CLEANUP21]], label [[FOR_BODY22]]
; CHECK:       for.body.lr.ph.clone:
; CHECK-NEXT:    [[DELAY_CLONE:%.*]] = getelementptr inbounds [[STRUCT_FIR_F32_S]], ptr [[FIR]], i32 0, i32 1
; CHECK-NEXT:    [[TMP14:%.*]] = load ptr, ptr [[DELAY_CLONE]], align 4
; CHECK-NEXT:    [[POS_CLONE:%.*]] = getelementptr inbounds [[STRUCT_FIR_F32_S]], ptr [[FIR]], i32 0, i32 3
; CHECK-NEXT:    [[N_CLONE:%.*]] = getelementptr inbounds [[STRUCT_FIR_F32_S]], ptr [[FIR]], i32 0, i32 2
; CHECK-NEXT:    [[TMP15:%.*]] = load i32, ptr [[N_CLONE]], align 4
; CHECK-NEXT:    [[DOTPRE_CLONE:%.*]] = load i32, ptr [[POS_CLONE]], align 4
; CHECK-NEXT:    br label [[FOR_BODY_CLONE:%.*]]
; CHECK:       for.body.clone:
; CHECK-NEXT:    [[TMP16:%.*]] = phi i32 [ [[DOTPRE_CLONE]], [[FOR_BODY_LR_PH_CLONE]] ], [ [[SPEC_STORE_SELECT_CLONE:%.*]], [[FOR_COND_CLEANUP21_CLONE:%.*]] ]
; CHECK-NEXT:    [[I_068_CLONE:%.*]] = phi i32 [ 0, [[FOR_BODY_LR_PH_CLONE]] ], [ [[INC33_CLONE:%.*]], [[FOR_COND_CLEANUP21_CLONE]] ]
; CHECK-NEXT:    [[ARRAYIDX_CLONE:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[I_068_CLONE]]
; CHECK-NEXT:    [[TMP17:%.*]] = load float, ptr [[ARRAYIDX_CLONE]], align 4
; CHECK-NEXT:    [[ARRAYIDX1_CLONE:%.*]] = getelementptr inbounds float, ptr [[TMP14]], i32 [[TMP16]]
; CHECK-NEXT:    store float [[TMP17]], ptr [[ARRAYIDX1_CLONE]], align 4
; CHECK-NEXT:    [[INC_CLONE:%.*]] = add nsw i32 [[TMP16]], 1
; CHECK-NEXT:    [[CMP4_NOT_CLONE:%.*]] = icmp slt i32 [[INC_CLONE]], [[TMP15]]
; CHECK-NEXT:    [[SPEC_STORE_SELECT_CLONE]] = select i1 [[CMP4_NOT_CLONE]], i32 [[INC_CLONE]], i32 0
; CHECK-NEXT:    store i32 [[SPEC_STORE_SELECT_CLONE]], ptr [[POS_CLONE]], align 4
; CHECK-NEXT:    [[CMP957_CLONE:%.*]] = icmp slt i32 [[SPEC_STORE_SELECT_CLONE]], [[TMP15]]
; CHECK-NEXT:    br i1 [[CMP957_CLONE]], label [[FOR_BODY11_LR_PH_CLONE:%.*]], label [[FOR_COND18_PREHEADER_CLONE:%.*]]
; CHECK:       for.body11.lr.ph.clone:
; CHECK-NEXT:    [[TMP18:%.*]] = load ptr, ptr [[FIR]], align 4
; CHECK-NEXT:    [[TMP19:%.*]] = sub i32 [[TMP15]], [[SPEC_STORE_SELECT_CLONE]]
; CHECK-NEXT:    br label [[FOR_BODY11_CLONE:%.*]]
; CHECK:       for.body11.clone:
; CHECK-NEXT:    [[N_060_CLONE:%.*]] = phi i32 [ [[SPEC_STORE_SELECT_CLONE]], [[FOR_BODY11_LR_PH_CLONE]] ], [ [[INC16_CLONE:%.*]], [[FOR_BODY11_CLONE]] ]
; CHECK-NEXT:    [[COEFF_POS_059_CLONE:%.*]] = phi i32 [ 0, [[FOR_BODY11_LR_PH_CLONE]] ], [ [[INC12_CLONE:%.*]], [[FOR_BODY11_CLONE]] ]
; CHECK-NEXT:    [[ACC_058_CLONE:%.*]] = phi float [ 0.000000e+00, [[FOR_BODY11_LR_PH_CLONE]] ], [ [[TMP22:%.*]], [[FOR_BODY11_CLONE]] ]
; CHECK-NEXT:    [[INC12_CLONE]] = add nuw i32 [[COEFF_POS_059_CLONE]], 1
; CHECK-NEXT:    [[ARRAYIDX13_CLONE:%.*]] = getelementptr inbounds float, ptr [[TMP18]], i32 [[COEFF_POS_059_CLONE]]
; CHECK-NEXT:    [[TMP20:%.*]] = load float, ptr [[ARRAYIDX13_CLONE]], align 4
; CHECK-NEXT:    [[ARRAYIDX15_CLONE:%.*]] = getelementptr inbounds float, ptr [[TMP14]], i32 [[N_060_CLONE]]
; CHECK-NEXT:    [[TMP21:%.*]] = load float, ptr [[ARRAYIDX15_CLONE]], align 4
; CHECK-NEXT:    [[TMP22]] = tail call float @llvm.fmuladd.f32(float [[TMP20]], float [[TMP21]], float [[ACC_058_CLONE]])
; CHECK-NEXT:    [[INC16_CLONE]] = add nsw i32 [[N_060_CLONE]], 1
; CHECK-NEXT:    [[EXITCOND_NOT_CLONE:%.*]] = icmp eq i32 [[INC12_CLONE]], [[TMP19]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT_CLONE]], label [[FOR_COND18_PREHEADER_CLONE]], label [[FOR_BODY11_CLONE]]
; CHECK:       for.cond18.preheader.clone:
; CHECK-NEXT:    [[ACC_0_LCSSA_CLONE:%.*]] = phi float [ 0.000000e+00, [[FOR_BODY_CLONE]] ], [ [[TMP22]], [[FOR_BODY11_CLONE]] ]
; CHECK-NEXT:    [[COEFF_POS_0_LCSSA_CLONE:%.*]] = phi i32 [ 0, [[FOR_BODY_CLONE]] ], [ [[TMP19]], [[FOR_BODY11_CLONE]] ]
; CHECK-NEXT:    [[CMP2062_CLONE:%.*]] = icmp sgt i32 [[SPEC_STORE_SELECT_CLONE]], 0
; CHECK-NEXT:    br i1 [[CMP2062_CLONE]], label [[FOR_BODY22_LR_PH_CLONE:%.*]], label [[FOR_COND_CLEANUP21_CLONE]]
; CHECK:       for.body22.lr.ph.clone:
; CHECK-NEXT:    [[TMP23:%.*]] = load ptr, ptr [[FIR]], align 4
; CHECK-NEXT:    br label [[FOR_BODY22_CLONE:%.*]]
; CHECK:       for.body22.clone:
; CHECK-NEXT:    [[N17_065_CLONE:%.*]] = phi i32 [ 0, [[FOR_BODY22_LR_PH_CLONE]] ], [ [[INC29_CLONE:%.*]], [[FOR_BODY22_CLONE]] ]
; CHECK-NEXT:    [[COEFF_POS_164_CLONE:%.*]] = phi i32 [ [[COEFF_POS_0_LCSSA_CLONE]], [[FOR_BODY22_LR_PH_CLONE]] ], [ [[INC24_CLONE:%.*]], [[FOR_BODY22_CLONE]] ]
; CHECK-NEXT:    [[ACC_163_CLONE:%.*]] = phi float [ [[ACC_0_LCSSA_CLONE]], [[FOR_BODY22_LR_PH_CLONE]] ], [ [[TMP26:%.*]], [[FOR_BODY22_CLONE]] ]
; CHECK-NEXT:    [[INC24_CLONE]] = add nuw nsw i32 [[COEFF_POS_164_CLONE]], 1
; CHECK-NEXT:    [[ARRAYIDX25_CLONE:%.*]] = getelementptr inbounds float, ptr [[TMP23]], i32 [[COEFF_POS_164_CLONE]]
; CHECK-NEXT:    [[TMP24:%.*]] = load float, ptr [[ARRAYIDX25_CLONE]], align 4
; CHECK-NEXT:    [[ARRAYIDX27_CLONE:%.*]] = getelementptr inbounds float, ptr [[TMP14]], i32 [[N17_065_CLONE]]
; CHECK-NEXT:    [[TMP25:%.*]] = load float, ptr [[ARRAYIDX27_CLONE]], align 4
; CHECK-NEXT:    [[TMP26]] = tail call float @llvm.fmuladd.f32(float [[TMP24]], float [[TMP25]], float [[ACC_163_CLONE]])
; CHECK-NEXT:    [[INC29_CLONE]] = add nuw nsw i32 [[N17_065_CLONE]], 1
; CHECK-NEXT:    [[EXITCOND70_NOT_CLONE:%.*]] = icmp eq i32 [[INC29_CLONE]], [[SPEC_STORE_SELECT_CLONE]]
; CHECK-NEXT:    br i1 [[EXITCOND70_NOT_CLONE]], label [[FOR_COND_CLEANUP21_CLONE]], label [[FOR_BODY22_CLONE]]
; CHECK:       for.cond.cleanup21.clone:
; CHECK-NEXT:    [[ACC_1_LCSSA_CLONE:%.*]] = phi float [ [[ACC_0_LCSSA_CLONE]], [[FOR_COND18_PREHEADER_CLONE]] ], [ [[TMP26]], [[FOR_BODY22_CLONE]] ]
; CHECK-NEXT:    [[ARRAYIDX31_CLONE:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[I_068_CLONE]]
; CHECK-NEXT:    store float [[ACC_1_LCSSA_CLONE]], ptr [[ARRAYIDX31_CLONE]], align 4
; CHECK-NEXT:    [[INC33_CLONE]] = add nuw nsw i32 [[I_068_CLONE]], 1
; CHECK-NEXT:    [[EXITCOND71_NOT_CLONE:%.*]] = icmp eq i32 [[INC33_CLONE]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND71_NOT_CLONE]], label [[IF_END]], label [[FOR_BODY_CLONE]]
;
entry:
  %cmp67 = icmp sgt i32 %len, 0
  br i1 %cmp67, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %delay = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 1
  %0 = load ptr, ptr %delay, align 4
  %pos = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 3
  %N = getelementptr inbounds %struct.fir_f32_s, ptr %fir, i32 0, i32 2
  %1 = load i32, ptr %N, align 4
  %.pre = load i32, ptr %pos, align 4
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.cond.cleanup21, %entry
  ret i32 0

for.body:                                         ; preds = %for.cond.cleanup21, %for.body.lr.ph
  %2 = phi i32 [ %.pre, %for.body.lr.ph ], [ %spec.store.select, %for.cond.cleanup21 ]
  %i.068 = phi i32 [ 0, %for.body.lr.ph ], [ %inc33, %for.cond.cleanup21 ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.068
  %3 = load float, ptr %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds float, ptr %0, i32 %2
  store float %3, ptr %arrayidx1, align 4
  %inc = add nsw i32 %2, 1
  %cmp4.not = icmp slt i32 %inc, %1
  %spec.store.select = select i1 %cmp4.not, i32 %inc, i32 0
  store i32 %spec.store.select, ptr %pos, align 4
  %cmp957 = icmp slt i32 %spec.store.select, %1
  br i1 %cmp957, label %for.body11.lr.ph, label %for.cond18.preheader

for.body11.lr.ph:                                 ; preds = %for.body
  %4 = load ptr, ptr %fir, align 4
  %5 = sub i32 %1, %spec.store.select
  br label %for.body11

for.cond18.preheader:                             ; preds = %for.body11, %for.body
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.body ], [ %9, %for.body11 ]
  %coeff_pos.0.lcssa = phi i32 [ 0, %for.body ], [ %5, %for.body11 ]
  %cmp2062 = icmp sgt i32 %spec.store.select, 0
  br i1 %cmp2062, label %for.body22.lr.ph, label %for.cond.cleanup21

for.body22.lr.ph:                                 ; preds = %for.cond18.preheader
  %6 = load ptr, ptr %fir, align 4
  br label %for.body22

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph
  %n.060 = phi i32 [ %spec.store.select, %for.body11.lr.ph ], [ %inc16, %for.body11 ]
  %coeff_pos.059 = phi i32 [ 0, %for.body11.lr.ph ], [ %inc12, %for.body11 ]
  %acc.058 = phi float [ 0.000000e+00, %for.body11.lr.ph ], [ %9, %for.body11 ]
  %inc12 = add nuw i32 %coeff_pos.059, 1
  %arrayidx13 = getelementptr inbounds float, ptr %4, i32 %coeff_pos.059
  %7 = load float, ptr %arrayidx13, align 4
  %arrayidx15 = getelementptr inbounds float, ptr %0, i32 %n.060
  %8 = load float, ptr %arrayidx15, align 4
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %acc.058)
  %inc16 = add nsw i32 %n.060, 1
  %exitcond.not = icmp eq i32 %inc12, %5
  br i1 %exitcond.not, label %for.cond18.preheader, label %for.body11

for.cond.cleanup21:                               ; preds = %for.body22, %for.cond18.preheader
  %acc.1.lcssa = phi float [ %acc.0.lcssa, %for.cond18.preheader ], [ %12, %for.body22 ]
  %arrayidx31 = getelementptr inbounds float, ptr %output, i32 %i.068
  store float %acc.1.lcssa, ptr %arrayidx31, align 4
  %inc33 = add nuw nsw i32 %i.068, 1
  %exitcond71.not = icmp eq i32 %inc33, %len
  br i1 %exitcond71.not, label %for.cond.cleanup, label %for.body

for.body22:                                       ; preds = %for.body22, %for.body22.lr.ph
  %n17.065 = phi i32 [ 0, %for.body22.lr.ph ], [ %inc29, %for.body22 ]
  %coeff_pos.164 = phi i32 [ %coeff_pos.0.lcssa, %for.body22.lr.ph ], [ %inc24, %for.body22 ]
  %acc.163 = phi float [ %acc.0.lcssa, %for.body22.lr.ph ], [ %12, %for.body22 ]
  %inc24 = add nuw nsw i32 %coeff_pos.164, 1
  %arrayidx25 = getelementptr inbounds float, ptr %6, i32 %coeff_pos.164
  %10 = load float, ptr %arrayidx25, align 4
  %arrayidx27 = getelementptr inbounds float, ptr %0, i32 %n17.065
  %11 = load float, ptr %arrayidx27, align 4
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %acc.163)
  %inc29 = add nuw nsw i32 %n17.065, 1
  %exitcond70.not = icmp eq i32 %inc29, %spec.store.select
  br i1 %exitcond70.not, label %for.cond.cleanup21, label %for.body22
}
