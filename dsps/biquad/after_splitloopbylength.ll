; ModuleID = 'dsps_biquad_f32_ansi.ll'
source_filename = "dsps_biquad_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_biquad_f32_ansi(ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len, ptr nocapture noundef readonly %coef, ptr nocapture noundef %w) local_unnamed_addr #0 !esp32_p4_metadata !4 {
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-172-g9dacbc0)"}
!4 = !{!"unroll_fir_like"}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
