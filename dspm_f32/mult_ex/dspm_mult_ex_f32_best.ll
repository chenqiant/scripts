; ModuleID = 'dspm_mult_ex_f32_best.c'
source_filename = "dspm_mult_ex_f32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dspm_mult_ex_f32_ansi(ptr noundef readonly %A, ptr noundef readonly %B, ptr noundef writeonly %C, i32 noundef %A_rows, i32 noundef %A_cols, i32 noundef %B_cols, i32 noundef %A_padding, i32 noundef %B_padding, i32 noundef %C_padding) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %A, null
  %cmp1 = icmp eq ptr %B, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %C, null
  %or.cond285 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %A_rows, 1
  %or.cond286 = or i1 %or.cond285, %cmp7
  %cmp10 = icmp slt i32 %A_cols, 1
  %or.cond287 = or i1 %or.cond286, %cmp10
  %cmp13 = icmp slt i32 %B_cols, 1
  %or.cond288 = or i1 %or.cond287, %cmp13
  %0 = or i32 %B_padding, %A_padding
  %1 = or i32 %0, %C_padding
  %2 = icmp slt i32 %1, 0
  %or.cond291 = or i1 %or.cond288, %2
  br i1 %or.cond291, label %return, label %if.end24

if.end24:                                         ; preds = %entry
  %add = add nuw nsw i32 %A_padding, %A_cols
  %add25 = add nuw nsw i32 %B_padding, %B_cols
  %add26 = add nuw nsw i32 %C_padding, %B_cols
  %sub = add nsw i32 %A_cols, -7
  %cmp38306 = icmp ugt i32 %A_cols, 8
  br label %for.body31.lr.ph

for.body31.lr.ph:                                 ; preds = %for.cond.cleanup30, %if.end24
  %i.0315 = phi i32 [ 0, %if.end24 ], [ %inc154, %for.cond.cleanup30 ]
  %mul = mul nsw i32 %i.0315, %add
  %arrayidx = getelementptr float, ptr %A, i32 %mul
  %mul34 = mul nsw i32 %i.0315, %add26
  %3 = getelementptr float, ptr %C, i32 %mul34
  br label %for.body31

for.cond.cleanup30:                               ; preds = %for.end149
  %inc154 = add nuw nsw i32 %i.0315, 1
  %exitcond317.not = icmp eq i32 %inc154, %A_rows
  br i1 %exitcond317.not, label %return, label %for.body31.lr.ph, !llvm.loop !4

for.body31:                                       ; preds = %for.body31.lr.ph, %for.end149
  %j.0314 = phi i32 [ 0, %for.body31.lr.ph ], [ %inc151, %for.end149 ]
  %4 = load float, ptr %arrayidx, align 4, !tbaa !6
  %arrayidx32 = getelementptr float, ptr %B, i32 %j.0314
  %5 = load float, ptr %arrayidx32, align 4, !tbaa !6
  %mul33 = fmul float %4, %5
  %arrayidx36 = getelementptr float, ptr %3, i32 %j.0314
  store float %mul33, ptr %arrayidx36, align 4, !tbaa !6
  br i1 %cmp38306, label %for.body39, label %for.cond135.preheader

for.cond135.preheader:                            ; preds = %for.body39, %for.body31
  %arrayidx36.promoted312 = phi float [ %mul33, %for.body31 ], [ %30, %for.body39 ]
  %s.0.lcssa = phi i32 [ 1, %for.body31 ], [ %add134, %for.body39 ]
  %cmp136310 = icmp slt i32 %s.0.lcssa, %A_cols
  br i1 %cmp136310, label %for.body137, label %for.end149

for.body39:                                       ; preds = %for.body31, %for.body39
  %6 = phi float [ %30, %for.body39 ], [ %mul33, %for.body31 ]
  %s.0307 = phi i32 [ %add134, %for.body39 ], [ 1, %for.body31 ]
  %arrayidx42 = getelementptr float, ptr %arrayidx, i32 %s.0307
  %7 = load float, ptr %arrayidx42, align 4, !tbaa !6
  %mul43 = mul nsw i32 %s.0307, %add25
  %gep = getelementptr float, ptr %arrayidx32, i32 %mul43
  %8 = load float, ptr %gep, align 4, !tbaa !6
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %6)
  store float %9, ptr %arrayidx36, align 4, !tbaa !6
  %arrayidx53 = getelementptr float, ptr %arrayidx42, i32 1
  %10 = load float, ptr %arrayidx53, align 4, !tbaa !6
  %add54 = add nuw nsw i32 %s.0307, 1
  %mul55 = mul nsw i32 %add54, %add25
  %gep293 = getelementptr float, ptr %arrayidx32, i32 %mul55
  %11 = load float, ptr %gep293, align 4, !tbaa !6
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %9)
  store float %12, ptr %arrayidx36, align 4, !tbaa !6
  %arrayidx65 = getelementptr float, ptr %arrayidx42, i32 2
  %13 = load float, ptr %arrayidx65, align 4, !tbaa !6
  %add66 = add nuw nsw i32 %s.0307, 2
  %mul67 = mul nsw i32 %add66, %add25
  %gep295 = getelementptr float, ptr %arrayidx32, i32 %mul67
  %14 = load float, ptr %gep295, align 4, !tbaa !6
  %15 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %12)
  store float %15, ptr %arrayidx36, align 4, !tbaa !6
  %arrayidx77 = getelementptr float, ptr %arrayidx42, i32 3
  %16 = load float, ptr %arrayidx77, align 4, !tbaa !6
  %add78 = add nuw nsw i32 %s.0307, 3
  %mul79 = mul nsw i32 %add78, %add25
  %gep297 = getelementptr float, ptr %arrayidx32, i32 %mul79
  %17 = load float, ptr %gep297, align 4, !tbaa !6
  %18 = tail call float @llvm.fmuladd.f32(float %16, float %17, float %15)
  store float %18, ptr %arrayidx36, align 4, !tbaa !6
  %arrayidx89 = getelementptr float, ptr %arrayidx42, i32 4
  %19 = load float, ptr %arrayidx89, align 4, !tbaa !6
  %add90 = add nuw nsw i32 %s.0307, 4
  %mul91 = mul nsw i32 %add90, %add25
  %gep299 = getelementptr float, ptr %arrayidx32, i32 %mul91
  %20 = load float, ptr %gep299, align 4, !tbaa !6
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %18)
  store float %21, ptr %arrayidx36, align 4, !tbaa !6
  %arrayidx101 = getelementptr float, ptr %arrayidx42, i32 5
  %22 = load float, ptr %arrayidx101, align 4, !tbaa !6
  %add102 = add nuw nsw i32 %s.0307, 5
  %mul103 = mul nsw i32 %add102, %add25
  %gep301 = getelementptr float, ptr %arrayidx32, i32 %mul103
  %23 = load float, ptr %gep301, align 4, !tbaa !6
  %24 = tail call float @llvm.fmuladd.f32(float %22, float %23, float %21)
  store float %24, ptr %arrayidx36, align 4, !tbaa !6
  %arrayidx113 = getelementptr float, ptr %arrayidx42, i32 6
  %25 = load float, ptr %arrayidx113, align 4, !tbaa !6
  %add114 = add nuw nsw i32 %s.0307, 6
  %mul115 = mul nsw i32 %add114, %add25
  %gep303 = getelementptr float, ptr %arrayidx32, i32 %mul115
  %26 = load float, ptr %gep303, align 4, !tbaa !6
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %24)
  store float %27, ptr %arrayidx36, align 4, !tbaa !6
  %arrayidx125 = getelementptr float, ptr %arrayidx42, i32 7
  %28 = load float, ptr %arrayidx125, align 4, !tbaa !6
  %add126 = add nuw nsw i32 %s.0307, 7
  %mul127 = mul nsw i32 %add126, %add25
  %gep305 = getelementptr float, ptr %arrayidx32, i32 %mul127
  %29 = load float, ptr %gep305, align 4, !tbaa !6
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float %27)
  store float %30, ptr %arrayidx36, align 4, !tbaa !6
  %add134 = add nuw nsw i32 %s.0307, 8
  %cmp38 = icmp slt i32 %add134, %sub
  br i1 %cmp38, label %for.body39, label %for.cond135.preheader, !llvm.loop !10

for.body137:                                      ; preds = %for.cond135.preheader, %for.body137
  %31 = phi float [ %34, %for.body137 ], [ %arrayidx36.promoted312, %for.cond135.preheader ]
  %s.1311 = phi i32 [ %inc, %for.body137 ], [ %s.0.lcssa, %for.cond135.preheader ]
  %arrayidx140 = getelementptr float, ptr %arrayidx, i32 %s.1311
  %32 = load float, ptr %arrayidx140, align 4, !tbaa !6
  %mul141 = mul nsw i32 %s.1311, %add25
  %gep309 = getelementptr float, ptr %arrayidx32, i32 %mul141
  %33 = load float, ptr %gep309, align 4, !tbaa !6
  %34 = tail call float @llvm.fmuladd.f32(float %32, float %33, float %31)
  store float %34, ptr %arrayidx36, align 4, !tbaa !6
  %inc = add nuw nsw i32 %s.1311, 1
  %exitcond.not = icmp eq i32 %inc, %A_cols
  br i1 %exitcond.not, label %for.end149, label %for.body137, !llvm.loop !11

for.end149:                                       ; preds = %for.body137, %for.cond135.preheader
  %inc151 = add nuw nsw i32 %j.0314, 1
  %exitcond316.not = icmp eq i32 %inc151, %B_cols
  br i1 %exitcond316.not, label %for.cond.cleanup30, label %for.body31, !llvm.loop !12

return:                                           ; preds = %for.cond.cleanup30, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.cleanup30 ]
  ret i32 %retval.0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !5}
!11 = distinct !{!11, !5}
!12 = distinct !{!12, !5}
