; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt < %s -passes=customlicm -customlicm=false -S | FileCheck %s

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_biquad_f32_ansi(ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len, ptr nocapture noundef readonly %coef, ptr nocapture noundef %w) local_unnamed_addr #0 !esp32_p4_metadata !4 {
; CHECK-LABEL: define dso_local noundef i32 @dsps_biquad_f32_ansi(
; CHECK-SAME: ptr nocapture noundef readonly [[INPUT:%.*]], ptr nocapture noundef writeonly [[OUTPUT:%.*]], i32 noundef [[LEN:%.*]], ptr nocapture noundef readonly [[COEF:%.*]], ptr nocapture noundef [[W:%.*]]) local_unnamed_addr #[[ATTR0:[0-9]+]] !esp32_p4_metadata [[META4:![0-9]+]] {
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
; CHECK-NEXT:    [[DOTPRE:%.*]] = load float, ptr [[W]], align 4, !tbaa [[TBAA5:![0-9]+]]
; CHECK-NEXT:    [[DOTPRE32:%.*]] = load float, ptr [[ARRAYIDX4]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       if.end:
; CHECK-NEXT:    ret i32 0
; CHECK:       for.body:
; CHECK-NEXT:    [[TMP1:%.*]] = phi float [ [[DOTPRE32]], [[FOR_BODY_LR_PH]] ], [ [[TMP13:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[TMP2:%.*]] = phi float [ [[DOTPRE]], [[FOR_BODY_LR_PH]] ], [ [[TMP7:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[I_031:%.*]] = phi i32 [ 0, [[FOR_BODY_LR_PH]] ], [ [[INC:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[I_031]]
; CHECK-NEXT:    [[TMP3:%.*]] = load float, ptr [[ARRAYIDX]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[TMP4:%.*]] = load float, ptr [[ARRAYIDX1]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[NEG:%.*]] = fneg float [[TMP4]]
; CHECK-NEXT:    [[TMP5:%.*]] = tail call float @llvm.fmuladd.f32(float [[NEG]], float [[TMP2]], float [[TMP3]])
; CHECK-NEXT:    [[TMP6:%.*]] = load float, ptr [[ARRAYIDX3]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[NEG5:%.*]] = fneg float [[TMP6]]
; CHECK-NEXT:    [[TMP7]] = tail call float @llvm.fmuladd.f32(float [[NEG5]], float [[TMP1]], float [[TMP5]])
; CHECK-NEXT:    [[TMP8:%.*]] = load float, ptr [[COEF]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[TMP9:%.*]] = load float, ptr [[ARRAYIDX7]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[MUL9:%.*]] = fmul float [[TMP2]], [[TMP9]]
; CHECK-NEXT:    [[TMP10:%.*]] = tail call float @llvm.fmuladd.f32(float [[TMP8]], float [[TMP7]], float [[MUL9]])
; CHECK-NEXT:    [[TMP11:%.*]] = load float, ptr [[ARRAYIDX10]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[TMP12:%.*]] = tail call float @llvm.fmuladd.f32(float [[TMP11]], float [[TMP1]], float [[TMP10]])
; CHECK-NEXT:    [[ARRAYIDX12:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[I_031]]
; CHECK-NEXT:    store float [[TMP12]], ptr [[ARRAYIDX12]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[TMP13]] = load float, ptr [[W]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    store float [[TMP13]], ptr [[ARRAYIDX4]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    store float [[TMP7]], ptr [[W]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[INC]] = add nuw nsw i32 [[I_031]], 1
; CHECK-NEXT:    [[EXITCOND_NOT:%.*]] = icmp eq i32 [[INC]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT]], label [[IF_END]], label [[FOR_BODY]], !llvm.loop [[LOOP9:![0-9]+]]
; CHECK:       for.body.lr.ph.clone:
; CHECK-NEXT:    [[ARRAYIDX1_CLONE:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 3
; CHECK-NEXT:    [[ARRAYIDX3_CLONE:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 4
; CHECK-NEXT:    [[ARRAYIDX4_CLONE:%.*]] = getelementptr inbounds float, ptr [[W]], i32 1
; CHECK-NEXT:    [[ARRAYIDX7_CLONE:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 1
; CHECK-NEXT:    [[ARRAYIDX10_CLONE:%.*]] = getelementptr inbounds float, ptr [[COEF]], i32 2
; CHECK-NEXT:    [[DOTPRE_CLONE:%.*]] = load float, ptr [[W]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[DOTPRE32_CLONE:%.*]] = load float, ptr [[ARRAYIDX4_CLONE]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    br label [[FOR_BODY_CLONE:%.*]]
; CHECK:       for.body.clone:
; CHECK-NEXT:    [[TMP14:%.*]] = phi float [ [[DOTPRE32_CLONE]], [[FOR_BODY_LR_PH_CLONE]] ], [ [[TMP26:%.*]], [[FOR_BODY_CLONE]] ]
; CHECK-NEXT:    [[TMP15:%.*]] = phi float [ [[DOTPRE_CLONE]], [[FOR_BODY_LR_PH_CLONE]] ], [ [[TMP20:%.*]], [[FOR_BODY_CLONE]] ]
; CHECK-NEXT:    [[I_031_CLONE:%.*]] = phi i32 [ 0, [[FOR_BODY_LR_PH_CLONE]] ], [ [[INC_CLONE:%.*]], [[FOR_BODY_CLONE]] ]
; CHECK-NEXT:    [[ARRAYIDX_CLONE:%.*]] = getelementptr inbounds float, ptr [[INPUT]], i32 [[I_031_CLONE]]
; CHECK-NEXT:    [[TMP16:%.*]] = load float, ptr [[ARRAYIDX_CLONE]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[TMP17:%.*]] = load float, ptr [[ARRAYIDX1_CLONE]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[NEG_CLONE:%.*]] = fneg float [[TMP17]]
; CHECK-NEXT:    [[TMP18:%.*]] = tail call float @llvm.fmuladd.f32(float [[NEG_CLONE]], float [[TMP15]], float [[TMP16]])
; CHECK-NEXT:    [[TMP19:%.*]] = load float, ptr [[ARRAYIDX3_CLONE]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[NEG5_CLONE:%.*]] = fneg float [[TMP19]]
; CHECK-NEXT:    [[TMP20]] = tail call float @llvm.fmuladd.f32(float [[NEG5_CLONE]], float [[TMP14]], float [[TMP18]])
; CHECK-NEXT:    [[TMP21:%.*]] = load float, ptr [[COEF]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[TMP22:%.*]] = load float, ptr [[ARRAYIDX7_CLONE]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[MUL9_CLONE:%.*]] = fmul float [[TMP15]], [[TMP22]]
; CHECK-NEXT:    [[TMP23:%.*]] = tail call float @llvm.fmuladd.f32(float [[TMP21]], float [[TMP20]], float [[MUL9_CLONE]])
; CHECK-NEXT:    [[TMP24:%.*]] = load float, ptr [[ARRAYIDX10_CLONE]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[TMP25:%.*]] = tail call float @llvm.fmuladd.f32(float [[TMP24]], float [[TMP14]], float [[TMP23]])
; CHECK-NEXT:    [[ARRAYIDX12_CLONE:%.*]] = getelementptr inbounds float, ptr [[OUTPUT]], i32 [[I_031_CLONE]]
; CHECK-NEXT:    store float [[TMP25]], ptr [[ARRAYIDX12_CLONE]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[TMP26]] = load float, ptr [[W]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    store float [[TMP26]], ptr [[ARRAYIDX4_CLONE]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    store float [[TMP20]], ptr [[W]], align 4, !tbaa [[TBAA5]]
; CHECK-NEXT:    [[INC_CLONE]] = add nuw nsw i32 [[I_031_CLONE]], 1
; CHECK-NEXT:    [[EXITCOND_NOT_CLONE:%.*]] = icmp eq i32 [[INC_CLONE]], [[LEN]]
; CHECK-NEXT:    br i1 [[EXITCOND_NOT_CLONE]], label [[IF_END]], label [[FOR_BODY_CLONE]], !llvm.loop [[LOOP9]]
;
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.cond.preheader, label %for.body.lr.ph.clone

for.cond.preheader:                               ; preds = %entry
  %cmp30 = icmp sgt i32 %len, 0
  br i1 %cmp30, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %arrayidx1 = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3 = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4 = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7 = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10 = getelementptr inbounds float, ptr %coef, i32 2
  %.pre = load float, ptr %w, align 4, !tbaa !5
  %.pre32 = load float, ptr %arrayidx4, align 4, !tbaa !5
  br label %for.body

if.end:                                           ; preds = %for.body.clone, %for.body, %for.cond.preheader
  ret i32 0

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %1 = phi float [ %.pre32, %for.body.lr.ph ], [ %13, %for.body ]
  %2 = phi float [ %.pre, %for.body.lr.ph ], [ %7, %for.body ]
  %i.031 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.031
  %3 = load float, ptr %arrayidx, align 4, !tbaa !5
  %4 = load float, ptr %arrayidx1, align 4, !tbaa !5
  %neg = fneg float %4
  %5 = tail call float @llvm.fmuladd.f32(float %neg, float %2, float %3)
  %6 = load float, ptr %arrayidx3, align 4, !tbaa !5
  %neg5 = fneg float %6
  %7 = tail call float @llvm.fmuladd.f32(float %neg5, float %1, float %5)
  %8 = load float, ptr %coef, align 4, !tbaa !5
  %9 = load float, ptr %arrayidx7, align 4, !tbaa !5
  %mul9 = fmul float %2, %9
  %10 = tail call float @llvm.fmuladd.f32(float %8, float %7, float %mul9)
  %11 = load float, ptr %arrayidx10, align 4, !tbaa !5
  %12 = tail call float @llvm.fmuladd.f32(float %11, float %1, float %10)
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %i.031
  store float %12, ptr %arrayidx12, align 4, !tbaa !5
  %13 = load float, ptr %w, align 4, !tbaa !5
  store float %13, ptr %arrayidx4, align 4, !tbaa !5
  store float %7, ptr %w, align 4, !tbaa !5
  %inc = add nuw nsw i32 %i.031, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %if.end, label %for.body, !llvm.loop !9

for.body.lr.ph.clone:                             ; preds = %entry
  %arrayidx1.clone = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3.clone = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4.clone = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7.clone = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10.clone = getelementptr inbounds float, ptr %coef, i32 2
  %.pre.clone = load float, ptr %w, align 4, !tbaa !5
  %.pre32.clone = load float, ptr %arrayidx4.clone, align 4, !tbaa !5
  br label %for.body.clone

for.body.clone:                                   ; preds = %for.body.clone, %for.body.lr.ph.clone
  %14 = phi float [ %.pre32.clone, %for.body.lr.ph.clone ], [ %26, %for.body.clone ]
  %15 = phi float [ %.pre.clone, %for.body.lr.ph.clone ], [ %20, %for.body.clone ]
  %i.031.clone = phi i32 [ 0, %for.body.lr.ph.clone ], [ %inc.clone, %for.body.clone ]
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %i.031.clone
  %16 = load float, ptr %arrayidx.clone, align 4, !tbaa !5
  %17 = load float, ptr %arrayidx1.clone, align 4, !tbaa !5
  %neg.clone = fneg float %17
  %18 = tail call float @llvm.fmuladd.f32(float %neg.clone, float %15, float %16)
  %19 = load float, ptr %arrayidx3.clone, align 4, !tbaa !5
  %neg5.clone = fneg float %19
  %20 = tail call float @llvm.fmuladd.f32(float %neg5.clone, float %14, float %18)
  %21 = load float, ptr %coef, align 4, !tbaa !5
  %22 = load float, ptr %arrayidx7.clone, align 4, !tbaa !5
  %mul9.clone = fmul float %15, %22
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %20, float %mul9.clone)
  %24 = load float, ptr %arrayidx10.clone, align 4, !tbaa !5
  %25 = tail call float @llvm.fmuladd.f32(float %24, float %14, float %23)
  %arrayidx12.clone = getelementptr inbounds float, ptr %output, i32 %i.031.clone
  store float %25, ptr %arrayidx12.clone, align 4, !tbaa !5
  %26 = load float, ptr %w, align 4, !tbaa !5
  store float %26, ptr %arrayidx4.clone, align 4, !tbaa !5
  store float %20, ptr %w, align 4, !tbaa !5
  %inc.clone = add nuw nsw i32 %i.031.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %if.end, label %for.body.clone, !llvm.loop !9
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240815-28-gc81a262 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-41-g37c20ad8 esp-18.1.2_20240815-49-g6d94704 esp-18.1.2_20240815-51-gd38faa8 esp-18.1.2_20240815-51-gd38faa8 esp-18.1.2_20240829-52-gea35320 esp-18.1.2_20240829-55-g7607179 esp-18.1.2_20240829-55-g7607179 esp-18.1.2_20240829-55-g7607179 esp-18.1.2_20240829 esp-18.1.2_20240829-62-gc926ada esp-18.1.2_20240829-64-g3274136 esp-18.1.2_20240829-66-gd6973ee esp-18.1.2_20240829-66-gd6973ee esp-18.1.2_20240912-67-g79e337e esp-18.1.2_20240912-71-gbb3778d esp-18.1.2_20240912-71-gbb3778d esp-18.1.2_20240912-72-g9403131 esp-18.1.2_20240912-99-g1e02d1e esp-18.1.2_20240912-99-g1e02d1e esp-18.1.2_20240912-130-gef2e289 esp-18.1.2_20240912-130-gef2e289 esp-18.1.2_20240912-139-g9f0d9b1)"}
!4 = !{!"unroll_fir_like"}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
;.
; CHECK: [[META4]] = !{!"unroll_fir_like"}
; CHECK: [[TBAA5]] = !{[[META6:![0-9]+]], [[META6]], i64 0}
; CHECK: [[META6]] = !{!"float", [[META7:![0-9]+]], i64 0}
; CHECK: [[META7]] = !{!"omnipotent char", [[META8:![0-9]+]], i64 0}
; CHECK: [[META8]] = !{!"Simple C/C++ TBAA"}
; CHECK: [[LOOP9]] = distinct !{[[LOOP9]], [[META10:![0-9]+]]}
; CHECK: [[META10]] = !{!"llvm.loop.mustprogress"}
;.