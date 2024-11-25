; ModuleID = 'dsps_conv_f32_ansi.c'
source_filename = "dsps_conv_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_conv_f32_ansi(ptr noundef readonly %Signal, i32 noundef %siglen, ptr noundef readonly %Kernel, i32 noundef %kernlen, ptr noundef writeonly %convout) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %Signal, null
  %cmp1 = icmp eq ptr %Kernel, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %convout, null
  %or.cond118 = or i1 %or.cond, %cmp4
  br i1 %or.cond118, label %return, label %if.end6

if.end6:                                          ; preds = %entry
  %cmp7 = icmp slt i32 %siglen, %kernlen
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6
  %lkern.0 = phi i32 [ %siglen, %if.then8 ], [ %kernlen, %if.end6 ]
  %lsig.0 = phi i32 [ %kernlen, %if.then8 ], [ %siglen, %if.end6 ]
  %kern.0 = phi ptr [ %Signal, %if.then8 ], [ %Kernel, %if.end6 ]
  %sig.0 = phi ptr [ %Kernel, %if.then8 ], [ %Signal, %if.end6 ]
  %cmp10120 = icmp sgt i32 %lkern.0, 0
  br i1 %cmp10120, label %for.body, label %for.cond21.preheader

for.cond21.preheader:                             ; preds = %for.end, %if.end9
  %cmp22125 = icmp slt i32 %lkern.0, %lsig.0
  br i1 %cmp22125, label %for.body24, label %for.cond42.preheader

for.body:                                         ; preds = %if.end9, %for.end
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.end ], [ 1, %if.end9 ]
  %n.0121 = phi i32 [ %inc18, %for.end ], [ 0, %if.end9 ]
  %arrayidx = getelementptr inbounds float, ptr %convout, i32 %n.0121
  store float 0.000000e+00, ptr %arrayidx, align 4, !tbaa !4
  br label %for.body13

for.body13:                                       ; preds = %for.body, %for.body13
  %k.0119 = phi i32 [ 0, %for.body ], [ %inc, %for.body13 ]
  %0 = phi float [ 0.000000e+00, %for.body ], [ %3, %for.body13 ]
  %arrayidx14 = getelementptr inbounds float, ptr %sig.0, i32 %k.0119
  %1 = load float, ptr %arrayidx14, align 4, !tbaa !4
  %sub = sub nsw i32 %n.0121, %k.0119
  %arrayidx15 = getelementptr inbounds float, ptr %kern.0, i32 %sub
  %2 = load float, ptr %arrayidx15, align 4, !tbaa !4
  %3 = tail call float @llvm.fmuladd.f32(float %1, float %2, float %0)
  store float %3, ptr %arrayidx, align 4, !tbaa !4
  %inc = add nuw nsw i32 %k.0119, 1
  %exitcond = icmp eq i32 %inc, %indvars.iv
  br i1 %exitcond, label %for.end, label %for.body13, !llvm.loop !8

for.end:                                          ; preds = %for.body13
  %inc18 = add nuw nsw i32 %n.0121, 1
  %indvars.iv.next = add nuw i32 %indvars.iv, 1
  %exitcond132.not = icmp eq i32 %inc18, %lkern.0
  br i1 %exitcond132.not, label %for.cond21.preheader, label %for.body, !llvm.loop !10

for.cond42.preheader:                             ; preds = %for.end37, %for.cond21.preheader
  %add43 = add i32 %siglen, -1
  %sub44 = add i32 %add43, %kernlen
  %cmp45130 = icmp slt i32 %lsig.0, %sub44
  br i1 %cmp45130, label %for.body47.lr.ph, label %return

for.body47.lr.ph:                                 ; preds = %for.cond42.preheader
  %sub54 = add nsw i32 %lsig.0, -1
  br label %for.body47

for.body24:                                       ; preds = %for.cond21.preheader, %for.end37
  %n20.0126 = phi i32 [ %inc39, %for.end37 ], [ %lkern.0, %for.cond21.preheader ]
  %arrayidx26 = getelementptr inbounds float, ptr %convout, i32 %n20.0126
  store float 0.000000e+00, ptr %arrayidx26, align 4, !tbaa !4
  %sub27 = sub nuw nsw i32 %n20.0126, %lkern.0
  %k25.0122 = add i32 %sub27, 1
  %cmp29.not123 = icmp ugt i32 %k25.0122, %n20.0126
  br i1 %cmp29.not123, label %for.end37, label %for.body30

for.body30:                                       ; preds = %for.body24, %for.body30
  %4 = phi float [ %7, %for.body30 ], [ 0.000000e+00, %for.body24 ]
  %k25.0124 = phi i32 [ %k25.0, %for.body30 ], [ %k25.0122, %for.body24 ]
  %arrayidx31 = getelementptr inbounds float, ptr %sig.0, i32 %k25.0124
  %5 = load float, ptr %arrayidx31, align 4, !tbaa !4
  %sub32 = sub i32 %n20.0126, %k25.0124
  %arrayidx33 = getelementptr inbounds float, ptr %kern.0, i32 %sub32
  %6 = load float, ptr %arrayidx33, align 4, !tbaa !4
  %7 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %4)
  store float %7, ptr %arrayidx26, align 4, !tbaa !4
  %k25.0 = add i32 %k25.0124, 1
  %cmp29.not = icmp ugt i32 %k25.0, %n20.0126
  br i1 %cmp29.not, label %for.end37, label %for.body30, !llvm.loop !11

for.end37:                                        ; preds = %for.body30, %for.body24
  %inc39 = add nuw nsw i32 %n20.0126, 1
  %exitcond133.not = icmp eq i32 %inc39, %lsig.0
  br i1 %exitcond133.not, label %for.cond42.preheader, label %for.body24, !llvm.loop !12

for.body47:                                       ; preds = %for.body47.lr.ph, %for.end64
  %n41.0131 = phi i32 [ %lsig.0, %for.body47.lr.ph ], [ %inc66, %for.end64 ]
  %arrayidx51 = getelementptr inbounds float, ptr %convout, i32 %n41.0131
  store float 0.000000e+00, ptr %arrayidx51, align 4, !tbaa !4
  %sub52 = sub nsw i32 %n41.0131, %lkern.0
  %k50.0127 = add i32 %sub52, 1
  %cmp56.not128 = icmp ugt i32 %k50.0127, %sub54
  br i1 %cmp56.not128, label %for.end64, label %for.body57

for.body57:                                       ; preds = %for.body47, %for.body57
  %8 = phi float [ %11, %for.body57 ], [ 0.000000e+00, %for.body47 ]
  %k50.0129 = phi i32 [ %k50.0, %for.body57 ], [ %k50.0127, %for.body47 ]
  %arrayidx58 = getelementptr inbounds float, ptr %sig.0, i32 %k50.0129
  %9 = load float, ptr %arrayidx58, align 4, !tbaa !4
  %sub59 = sub i32 %n41.0131, %k50.0129
  %arrayidx60 = getelementptr inbounds float, ptr %kern.0, i32 %sub59
  %10 = load float, ptr %arrayidx60, align 4, !tbaa !4
  %11 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %8)
  store float %11, ptr %arrayidx51, align 4, !tbaa !4
  %k50.0 = add i32 %k50.0129, 1
  %cmp56.not = icmp ugt i32 %k50.0, %sub54
  br i1 %cmp56.not, label %for.end64, label %for.body57, !llvm.loop !13

for.end64:                                        ; preds = %for.body57, %for.body47
  %inc66 = add nsw i32 %n41.0131, 1
  %exitcond134.not = icmp eq i32 %inc66, %sub44
  br i1 %exitcond134.not, label %return, label %for.body47, !llvm.loop !14

return:                                           ; preds = %for.end64, %for.cond42.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond42.preheader ], [ 0, %for.end64 ]
  ret i32 %retval.0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
