; ModuleID = 'after_loopunrollandremainder.ll'
source_filename = "dsps_biquad_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_biquad_f32_ansi(ptr noalias nocapture noundef readonly %input, ptr noalias nocapture noundef writeonly %output, i32 noundef %len, ptr noalias nocapture noundef readonly %coef, ptr noalias nocapture noundef %w) local_unnamed_addr #0 {
entry:
  %0 = icmp sgt i32 %len, 2
  %arrayidx1 = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3 = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4 = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7 = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10 = getelementptr inbounds float, ptr %coef, i32 2
  %.pre = load float, ptr %w, align 4, !tbaa !4
  %.pre32 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %1 = load float, ptr %arrayidx1, align 4, !tbaa !4
  br i1 %0, label %for.body.lr.ph, label %for.body.lr.ph.clone

for.body.lr.ph:                                   ; preds = %entry
  %2 = load float, ptr %arrayidx3, align 4, !tbaa !4
  %3 = load float, ptr %coef, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx7, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx10, align 4, !tbaa !4
  %6 = fneg float %1
  %7 = fneg float %2
  br label %for.body

if.end.loopexit:                                  ; preds = %for.body.clone
  store float %23, ptr %w, align 4, !tbaa !4
  store float %19, ptr %arrayidx4, align 4, !tbaa !4
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit, %for.cond.cleanup
  ret i32 0

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %8 = phi float [ %.pre, %for.body.lr.ph ], [ %12, %for.body ]
  %9 = phi float [ %.pre32, %for.body.lr.ph ], [ %8, %for.body ]
  %i.031 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.031
  %10 = load float, ptr %arrayidx, align 4, !tbaa !4
  %11 = tail call float @llvm.fmuladd.f32(float %6, float %8, float %10)
  %12 = tail call float @llvm.fmuladd.f32(float %7, float %9, float %11)
  %mul9 = fmul float %4, %8
  %13 = tail call float @llvm.fmuladd.f32(float %3, float %12, float %mul9)
  %14 = tail call float @llvm.fmuladd.f32(float %5, float %9, float %13)
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %i.031
  store float %14, ptr %arrayidx12, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.031, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !8

for.cond.cleanup:                                 ; preds = %for.body
  store float %.pre, ptr %arrayidx4, align 4
  store float %12, ptr %w, align 4
  br label %if.end

for.body.lr.ph.clone:                             ; preds = %entry
  %neg.clone = fneg float %1
  %15 = load float, ptr %arrayidx3, align 4, !tbaa !4
  %neg5.clone = fneg float %15
  %16 = load float, ptr %coef, align 4, !tbaa !4
  %17 = load float, ptr %arrayidx7, align 4, !tbaa !4
  %18 = load float, ptr %arrayidx10, align 4, !tbaa !4
  br label %for.body.clone

for.body.clone:                                   ; preds = %for.body.clone, %for.body.lr.ph.clone
  %19 = phi float [ %.pre, %for.body.lr.ph.clone ], [ %23, %for.body.clone ]
  %20 = phi float [ %.pre32, %for.body.lr.ph.clone ], [ %19, %for.body.clone ]
  %i.031.clone = phi i32 [ 0, %for.body.lr.ph.clone ], [ %inc.clone, %for.body.clone ]
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %i.031.clone
  %21 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %22 = tail call float @llvm.fmuladd.f32(float %neg.clone, float %19, float %21)
  %23 = tail call float @llvm.fmuladd.f32(float %neg5.clone, float %20, float %22)
  %mul9.clone = fmul float %19, %17
  %24 = tail call float @llvm.fmuladd.f32(float %16, float %23, float %mul9.clone)
  %25 = tail call float @llvm.fmuladd.f32(float %18, float %20, float %24)
  %arrayidx12.clone = getelementptr inbounds float, ptr %output, i32 %i.031.clone
  store float %25, ptr %arrayidx12.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %i.031.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %if.end.loopexit, label %for.body.clone, !llvm.loop !8
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
