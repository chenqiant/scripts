; ModuleID = 'after_splitloopbylength.ll'
source_filename = "dsps_biquad_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_biquad_f32_ansi(ptr noalias nocapture noundef readonly %input, ptr noalias nocapture noundef writeonly %output, i32 noundef %len, ptr noalias nocapture noundef readonly %coef, ptr noalias nocapture noundef %w) local_unnamed_addr #0 {
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.cond.preheader, label %for.body.lr.ph.clone

for.cond.preheader:                               ; preds = %entry
  %cmp30 = icmp sgt i32 %len, 0
  %sub = add nuw i32 %len, -7
  %cmp1374 = icmp ugt i32 %len, 7
  br i1 %cmp30, label %for.body.lr.ph, label %for.cond150.preheader

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %arrayidx1 = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3 = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4 = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7 = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10 = getelementptr inbounds float, ptr %coef, i32 2
  %.pre = load float, ptr %w, align 4, !tbaa !4
  %.pre32 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %1 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %2 = load float, ptr %arrayidx3, align 4, !tbaa !4
  %3 = load float, ptr %coef, align 4, !tbaa !4
  %4 = load float, ptr %arrayidx7, align 4, !tbaa !4
  %5 = load float, ptr %arrayidx10, align 4, !tbaa !4
  %6 = load float, ptr %w, align 4, !tbaa !4
  %7 = fneg float %1
  %8 = fneg float %2
  br label %for.body.7

if.end:                                           ; preds = %for.cond.cleanup.clone, %for.body.clone, %for.cond.cleanup
  ret i32 0

for.cond150.preheader:                            ; preds = %for.body.7, %for.cond.preheader
  %i.0.lcssa = phi i32 [ 0, %for.cond.preheader ], [ %inc.7, %for.body.7 ]
  %cmp151376 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp151376, label %for.body.lr.ph.clone8, label %for.cond.cleanup

for.body.7:                                       ; preds = %for.body.7, %for.body.lr.ph
  %9 = phi float [ %.pre, %for.body.lr.ph ], [ %48, %for.body.7 ]
  %10 = phi float [ %.pre32, %for.body.lr.ph ], [ %43, %for.body.7 ]
  %i.031 = phi i32 [ 0, %for.body.lr.ph ], [ %inc.7, %for.body.7 ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.031
  %11 = load float, ptr %arrayidx, align 4, !tbaa !4
  %12 = tail call float @llvm.fmuladd.f32(float %7, float %9, float %11)
  %13 = tail call float @llvm.fmuladd.f32(float %8, float %10, float %12)
  %mul9 = fmul float %9, %4
  %14 = tail call float @llvm.fmuladd.f32(float %3, float %13, float %mul9)
  %15 = tail call float @llvm.fmuladd.f32(float %5, float %10, float %14)
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %i.031
  store float %15, ptr %arrayidx12, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.031, 1
  %exitcond.not = icmp eq i32 %inc, %len
  %arrayidx.1 = getelementptr inbounds float, ptr %input, i32 %inc
  %16 = load float, ptr %arrayidx.1, align 4, !tbaa !4
  %17 = tail call float @llvm.fmuladd.f32(float %7, float %13, float %16)
  %18 = tail call float @llvm.fmuladd.f32(float %8, float %9, float %17)
  %mul9.1 = fmul float %13, %4
  %19 = tail call float @llvm.fmuladd.f32(float %3, float %18, float %mul9.1)
  %20 = tail call float @llvm.fmuladd.f32(float %5, float %9, float %19)
  %arrayidx12.1 = getelementptr inbounds float, ptr %output, i32 %inc
  store float %20, ptr %arrayidx12.1, align 4, !tbaa !4
  %inc.1 = add nuw nsw i32 %i.031, 2
  %exitcond.not.1 = icmp eq i32 %inc.1, %len
  %arrayidx.2 = getelementptr inbounds float, ptr %input, i32 %inc.1
  %21 = load float, ptr %arrayidx.2, align 4, !tbaa !4
  %22 = tail call float @llvm.fmuladd.f32(float %7, float %18, float %21)
  %23 = tail call float @llvm.fmuladd.f32(float %8, float %13, float %22)
  %mul9.2 = fmul float %18, %4
  %24 = tail call float @llvm.fmuladd.f32(float %3, float %23, float %mul9.2)
  %25 = tail call float @llvm.fmuladd.f32(float %5, float %13, float %24)
  %arrayidx12.2 = getelementptr inbounds float, ptr %output, i32 %inc.1
  store float %25, ptr %arrayidx12.2, align 4, !tbaa !4
  %inc.2 = add nuw nsw i32 %i.031, 3
  %exitcond.not.2 = icmp eq i32 %inc.2, %len
  %arrayidx.3 = getelementptr inbounds float, ptr %input, i32 %inc.2
  %26 = load float, ptr %arrayidx.3, align 4, !tbaa !4
  %27 = tail call float @llvm.fmuladd.f32(float %7, float %23, float %26)
  %28 = tail call float @llvm.fmuladd.f32(float %8, float %18, float %27)
  %mul9.3 = fmul float %23, %4
  %29 = tail call float @llvm.fmuladd.f32(float %3, float %28, float %mul9.3)
  %30 = tail call float @llvm.fmuladd.f32(float %5, float %18, float %29)
  %arrayidx12.3 = getelementptr inbounds float, ptr %output, i32 %inc.2
  store float %30, ptr %arrayidx12.3, align 4, !tbaa !4
  %inc.3 = add nuw nsw i32 %i.031, 4
  %exitcond.not.3 = icmp eq i32 %inc.3, %len
  %arrayidx.4 = getelementptr inbounds float, ptr %input, i32 %inc.3
  %31 = load float, ptr %arrayidx.4, align 4, !tbaa !4
  %32 = tail call float @llvm.fmuladd.f32(float %7, float %28, float %31)
  %33 = tail call float @llvm.fmuladd.f32(float %8, float %23, float %32)
  %mul9.4 = fmul float %28, %4
  %34 = tail call float @llvm.fmuladd.f32(float %3, float %33, float %mul9.4)
  %35 = tail call float @llvm.fmuladd.f32(float %5, float %23, float %34)
  %arrayidx12.4 = getelementptr inbounds float, ptr %output, i32 %inc.3
  store float %35, ptr %arrayidx12.4, align 4, !tbaa !4
  %inc.4 = add nuw nsw i32 %i.031, 5
  %exitcond.not.4 = icmp eq i32 %inc.4, %len
  %arrayidx.5 = getelementptr inbounds float, ptr %input, i32 %inc.4
  %36 = load float, ptr %arrayidx.5, align 4, !tbaa !4
  %37 = tail call float @llvm.fmuladd.f32(float %7, float %33, float %36)
  %38 = tail call float @llvm.fmuladd.f32(float %8, float %28, float %37)
  %mul9.5 = fmul float %33, %4
  %39 = tail call float @llvm.fmuladd.f32(float %3, float %38, float %mul9.5)
  %40 = tail call float @llvm.fmuladd.f32(float %5, float %28, float %39)
  %arrayidx12.5 = getelementptr inbounds float, ptr %output, i32 %inc.4
  store float %40, ptr %arrayidx12.5, align 4, !tbaa !4
  %inc.5 = add nuw nsw i32 %i.031, 6
  %exitcond.not.5 = icmp eq i32 %inc.5, %len
  %arrayidx.6 = getelementptr inbounds float, ptr %input, i32 %inc.5
  %41 = load float, ptr %arrayidx.6, align 4, !tbaa !4
  %42 = tail call float @llvm.fmuladd.f32(float %7, float %38, float %41)
  %43 = tail call float @llvm.fmuladd.f32(float %8, float %33, float %42)
  %mul9.6 = fmul float %38, %4
  %44 = tail call float @llvm.fmuladd.f32(float %3, float %43, float %mul9.6)
  %45 = tail call float @llvm.fmuladd.f32(float %5, float %33, float %44)
  %arrayidx12.6 = getelementptr inbounds float, ptr %output, i32 %inc.5
  store float %45, ptr %arrayidx12.6, align 4, !tbaa !4
  %inc.6 = add nuw nsw i32 %i.031, 7
  %exitcond.not.6 = icmp eq i32 %inc.6, %len
  %arrayidx.7 = getelementptr inbounds float, ptr %input, i32 %inc.6
  %46 = load float, ptr %arrayidx.7, align 4, !tbaa !4
  %47 = tail call float @llvm.fmuladd.f32(float %7, float %43, float %46)
  %48 = tail call float @llvm.fmuladd.f32(float %8, float %38, float %47)
  %mul9.7 = fmul float %43, %4
  %49 = tail call float @llvm.fmuladd.f32(float %3, float %48, float %mul9.7)
  %50 = tail call float @llvm.fmuladd.f32(float %5, float %38, float %49)
  %arrayidx12.7 = getelementptr inbounds float, ptr %output, i32 %inc.6
  store float %50, ptr %arrayidx12.7, align 4, !tbaa !4
  store float %6, ptr %arrayidx4, align 4
  store float %13, ptr %w, align 4
  %inc.7 = add nuw nsw i32 %i.031, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub
  br i1 %exitcond.not.7, label %for.body.7, label %for.cond150.preheader, !llvm.loop !8

for.body.lr.ph.clone8:                            ; preds = %for.cond150.preheader
  %arrayidx1.clone9 = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3.clone10 = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4.clone11 = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7.clone12 = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10.clone13 = getelementptr inbounds float, ptr %coef, i32 2
  %.pre.clone14 = load float, ptr %w, align 4, !tbaa !4
  %.pre32.clone15 = load float, ptr %arrayidx4.clone11, align 4, !tbaa !4
  %51 = load float, ptr %arrayidx1.clone9, align 4, !tbaa !4
  %52 = load float, ptr %arrayidx3.clone10, align 4, !tbaa !4
  %53 = load float, ptr %coef, align 4, !tbaa !4
  %54 = load float, ptr %arrayidx7.clone12, align 4, !tbaa !4
  %55 = load float, ptr %arrayidx10.clone13, align 4, !tbaa !4
  %56 = load float, ptr %w, align 4, !tbaa !4
  %57 = fneg float %51
  %58 = fneg float %52
  br label %for.body.clone1

for.body.clone1:                                  ; preds = %for.body.clone1, %for.body.lr.ph.clone8
  ;%59 = phi float [ %.pre.clone14, %for.body.lr.ph.clone8 ], [ %48, %for.body.clone1 ]
  %60 = phi float [ %.pre32.clone15, %for.body.lr.ph.clone8 ], [ %63, %for.body.clone1 ]
  %i.031.clone2 = phi i32 [ %i.0.lcssa, %for.body.lr.ph.clone8 ], [ %inc.clone6, %for.body.clone1 ]
  %arrayidx.clone3 = getelementptr inbounds float, ptr %input, i32 %i.031.clone2
  %61 = load float, ptr %arrayidx.clone3, align 4, !tbaa !4
  %62 = tail call float @llvm.fmuladd.f32(float %57, float %.pre.clone14, float %61)
  %63 = tail call float @llvm.fmuladd.f32(float %58, float %60, float %62)
  %mul9.clone4 = fmul float %.pre.clone14, %54
  %64 = tail call float @llvm.fmuladd.f32(float %53, float %63, float %mul9.clone4)
  %65 = tail call float @llvm.fmuladd.f32(float %55, float %60, float %64)
  %arrayidx12.clone5 = getelementptr inbounds float, ptr %output, i32 %i.031.clone2
  store float %65, ptr %arrayidx12.clone5, align 4, !tbaa !4
  %inc.clone6 = add nuw nsw i32 %i.031.clone2, 1
  %exitcond.not.clone7 = icmp eq i32 %inc.clone6, %len
  br i1 %exitcond.not.clone7, label %for.cond.cleanup.clone, label %for.body.clone1, !llvm.loop !8

for.cond.cleanup.clone:                           ; preds = %for.body.clone1
  store float %56, ptr %arrayidx4.clone11, align 4
  store float %63, ptr %w, align 4
  br label %if.end

for.cond.cleanup:                                 ; preds = %for.cond150.preheader
  ; store float %6, ptr %arrayidx4, align 4
  ; store float %13, ptr %w, align 4
  br label %if.end

for.body.lr.ph.clone:                             ; preds = %entry
  %arrayidx1.clone = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx3.clone = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx4.clone = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx7.clone = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx10.clone = getelementptr inbounds float, ptr %coef, i32 2
  %.pre.clone = load float, ptr %w, align 4, !tbaa !4
  %.pre32.clone = load float, ptr %arrayidx4.clone, align 4, !tbaa !4
  br label %for.body.clone

for.body.clone:                                   ; preds = %for.body.clone, %for.body.lr.ph.clone
  %66 = phi float [ %.pre32.clone, %for.body.lr.ph.clone ], [ %78, %for.body.clone ]
  %67 = phi float [ %.pre.clone, %for.body.lr.ph.clone ], [ %72, %for.body.clone ]
  %i.031.clone = phi i32 [ 0, %for.body.lr.ph.clone ], [ %inc.clone, %for.body.clone ]
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %i.031.clone
  %68 = load float, ptr %arrayidx.clone, align 4, !tbaa !4
  %69 = load float, ptr %arrayidx1.clone, align 4, !tbaa !4
  %neg.clone = fneg float %69
  %70 = tail call float @llvm.fmuladd.f32(float %neg.clone, float %67, float %68)
  %71 = load float, ptr %arrayidx3.clone, align 4, !tbaa !4
  %neg5.clone = fneg float %71
  %72 = tail call float @llvm.fmuladd.f32(float %neg5.clone, float %66, float %70)
  %73 = load float, ptr %coef, align 4, !tbaa !4
  %74 = load float, ptr %arrayidx7.clone, align 4, !tbaa !4
  %mul9.clone = fmul float %67, %74
  %75 = tail call float @llvm.fmuladd.f32(float %73, float %72, float %mul9.clone)
  %76 = load float, ptr %arrayidx10.clone, align 4, !tbaa !4
  %77 = tail call float @llvm.fmuladd.f32(float %76, float %66, float %75)
  %arrayidx12.clone = getelementptr inbounds float, ptr %output, i32 %i.031.clone
  store float %77, ptr %arrayidx12.clone, align 4, !tbaa !4
  %78 = load float, ptr %w, align 4, !tbaa !4
  store float %78, ptr %arrayidx4.clone, align 4, !tbaa !4
  store float %72, ptr %w, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %i.031.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %if.end, label %for.body.clone, !llvm.loop !8
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
