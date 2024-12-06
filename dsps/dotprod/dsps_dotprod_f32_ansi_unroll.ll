; ModuleID = 'dsps_dotprod_f32_ansi.ll'
source_filename = "dsps_dotprod_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_dotprod_f32_ansi(ptr nocapture noundef readonly %src1, ptr nocapture noundef readonly %src2, ptr nocapture noundef writeonly %dest, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %len, 0
  br i1 %cmp6, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %0 = add i32 %len, -1
  %xtraiter = and i32 %len, 7
  %1 = icmp ult i32 %0, 7
  br i1 %1, label %for.cond.cleanup.loopexit.unr-lcssa, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = sub i32 %len, %xtraiter
  br label %for.body

for.cond.cleanup.loopexit.unr-lcssa.loopexit:     ; preds = %for.body
  %.lcssa.ph.ph = phi float [ %28, %for.body ]
  %i.08.unr.ph = phi i32 [ %inc.7, %for.body ]
  %acc.07.unr.ph = phi float [ %28, %for.body ]
  br label %for.cond.cleanup.loopexit.unr-lcssa

for.cond.cleanup.loopexit.unr-lcssa:              ; preds = %for.cond.cleanup.loopexit.unr-lcssa.loopexit, %for.body.preheader
  %.lcssa.ph = phi float [ undef, %for.body.preheader ], [ %.lcssa.ph.ph, %for.cond.cleanup.loopexit.unr-lcssa.loopexit ]
  %i.08.unr = phi i32 [ 0, %for.body.preheader ], [ %i.08.unr.ph, %for.cond.cleanup.loopexit.unr-lcssa.loopexit ]
  %acc.07.unr = phi float [ 0.000000e+00, %for.body.preheader ], [ %acc.07.unr.ph, %for.cond.cleanup.loopexit.unr-lcssa.loopexit ]
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body.epil.preheader, label %for.cond.cleanup.loopexit

for.body.epil.preheader:                          ; preds = %for.cond.cleanup.loopexit.unr-lcssa
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %i.08.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %i.08.unr, %for.body.epil.preheader ]
  %acc.07.epil = phi float [ %4, %for.body.epil ], [ %acc.07.unr, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %arrayidx.epil = getelementptr inbounds float, ptr %src1, i32 %i.08.epil
  %2 = load float, ptr %arrayidx.epil, align 4, !tbaa !4
  %arrayidx1.epil = getelementptr inbounds float, ptr %src2, i32 %i.08.epil
  %3 = load float, ptr %arrayidx1.epil, align 4, !tbaa !4
  %4 = tail call float @llvm.fmuladd.f32(float %2, float %3, float %acc.07.epil)
  %inc.epil = add nuw nsw i32 %i.08.epil, 1
  %exitcond.not.epil = icmp eq i32 %inc.epil, %len
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp = icmp ne i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp, label %for.body.epil, label %for.cond.cleanup.loopexit.epilog-lcssa, !llvm.loop !8

for.cond.cleanup.loopexit.epilog-lcssa:           ; preds = %for.body.epil
  %.lcssa.ph1 = phi float [ %4, %for.body.epil ]
  br label %for.cond.cleanup.loopexit

for.cond.cleanup.loopexit:                        ; preds = %for.cond.cleanup.loopexit.unr-lcssa, %for.cond.cleanup.loopexit.epilog-lcssa
  %.lcssa = phi float [ %.lcssa.ph, %for.cond.cleanup.loopexit.unr-lcssa ], [ %.lcssa.ph1, %for.cond.cleanup.loopexit.epilog-lcssa ]
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %acc.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %.lcssa, %for.cond.cleanup.loopexit ]
  store float %acc.0.lcssa, ptr %dest, align 4, !tbaa !4
  ret i32 0

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %i.08 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %acc.07 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %28, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %arrayidx = getelementptr inbounds float, ptr %src1, i32 %i.08
  %5 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx1 = getelementptr inbounds float, ptr %src2, i32 %i.08
  %6 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %7 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %acc.07)
  %inc = add nuw nsw i32 %i.08, 1
  %arrayidx.1 = getelementptr inbounds float, ptr %src1, i32 %inc
  %8 = load float, ptr %arrayidx.1, align 4, !tbaa !4
  %arrayidx1.1 = getelementptr inbounds float, ptr %src2, i32 %inc
  %9 = load float, ptr %arrayidx1.1, align 4, !tbaa !4
  %10 = tail call float @llvm.fmuladd.f32(float %8, float %9, float %7)
  %inc.1 = add nuw nsw i32 %i.08, 2
  %arrayidx.2 = getelementptr inbounds float, ptr %src1, i32 %inc.1
  %11 = load float, ptr %arrayidx.2, align 4, !tbaa !4
  %arrayidx1.2 = getelementptr inbounds float, ptr %src2, i32 %inc.1
  %12 = load float, ptr %arrayidx1.2, align 4, !tbaa !4
  %13 = tail call float @llvm.fmuladd.f32(float %11, float %12, float %10)
  %inc.2 = add nuw nsw i32 %i.08, 3
  %arrayidx.3 = getelementptr inbounds float, ptr %src1, i32 %inc.2
  %14 = load float, ptr %arrayidx.3, align 4, !tbaa !4
  %arrayidx1.3 = getelementptr inbounds float, ptr %src2, i32 %inc.2
  %15 = load float, ptr %arrayidx1.3, align 4, !tbaa !4
  %16 = tail call float @llvm.fmuladd.f32(float %14, float %15, float %13)
  %inc.3 = add nuw nsw i32 %i.08, 4
  %arrayidx.4 = getelementptr inbounds float, ptr %src1, i32 %inc.3
  %17 = load float, ptr %arrayidx.4, align 4, !tbaa !4
  %arrayidx1.4 = getelementptr inbounds float, ptr %src2, i32 %inc.3
  %18 = load float, ptr %arrayidx1.4, align 4, !tbaa !4
  %19 = tail call float @llvm.fmuladd.f32(float %17, float %18, float %16)
  %inc.4 = add nuw nsw i32 %i.08, 5
  %arrayidx.5 = getelementptr inbounds float, ptr %src1, i32 %inc.4
  %20 = load float, ptr %arrayidx.5, align 4, !tbaa !4
  %arrayidx1.5 = getelementptr inbounds float, ptr %src2, i32 %inc.4
  %21 = load float, ptr %arrayidx1.5, align 4, !tbaa !4
  %22 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %19)
  %inc.5 = add nuw nsw i32 %i.08, 6
  %arrayidx.6 = getelementptr inbounds float, ptr %src1, i32 %inc.5
  %23 = load float, ptr %arrayidx.6, align 4, !tbaa !4
  %arrayidx1.6 = getelementptr inbounds float, ptr %src2, i32 %inc.5
  %24 = load float, ptr %arrayidx1.6, align 4, !tbaa !4
  %25 = tail call float @llvm.fmuladd.f32(float %23, float %24, float %22)
  %inc.6 = add nuw nsw i32 %i.08, 7
  %arrayidx.7 = getelementptr inbounds float, ptr %src1, i32 %inc.6
  %26 = load float, ptr %arrayidx.7, align 4, !tbaa !4
  %arrayidx1.7 = getelementptr inbounds float, ptr %src2, i32 %inc.6
  %27 = load float, ptr %arrayidx1.7, align 4, !tbaa !4
  %28 = tail call float @llvm.fmuladd.f32(float %26, float %27, float %25)
  %inc.7 = add nuw nsw i32 %i.08, 8
  %niter.next.7 = add i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.cond.cleanup.loopexit.unr-lcssa.loopexit, label %for.body, !llvm.loop !10
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !11, !9}
!11 = !{!"llvm.loop.mustprogress"}
