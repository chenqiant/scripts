; ModuleID = 'dsps_corr_f32_ansi.c'
source_filename = "dsps_corr_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_corr_f32_ansi(ptr noundef readonly %Signal, i32 noundef %siglen, ptr noundef readonly %Pattern, i32 noundef %patlen, ptr noundef writeonly %dest) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %Signal, null
  %cmp1 = icmp eq ptr %Pattern, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %dest, null
  %or.cond33 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %siglen, %patlen
  %or.cond34 = or i1 %cmp7, %or.cond33
  br i1 %or.cond34, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %sub = sub nsw i32 %siglen, %patlen
  %cmp1235.not = icmp eq i32 %patlen, 0
  br i1 %cmp1235.not, label %for.cond11.preheader.preheader, label %for.cond11.preheader.us

for.cond11.preheader.preheader:                   ; preds = %for.cond.preheader
  %0 = shl i32 %siglen, 2
  %1 = add i32 %0, 4
  tail call void @llvm.memset.p0.i32(ptr nonnull align 4 %dest, i8 0, i32 %1, i1 false), !tbaa !4
  br label %return

for.cond11.preheader.us:                          ; preds = %for.cond.preheader, %for.cond11.for.cond.cleanup13_crit_edge.us
  %n.038.us = phi i32 [ %inc18.us, %for.cond11.for.cond.cleanup13_crit_edge.us ], [ 0, %for.cond.preheader ]
  %2 = getelementptr float, ptr %Signal, i32 %n.038.us
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.cond11.preheader.us, %for.body14.us
  %m.037.us = phi i32 [ 0, %for.cond11.preheader.us ], [ %inc.us, %for.body14.us ]
  %k_corr.036.us = phi float [ 0.000000e+00, %for.cond11.preheader.us ], [ %5, %for.body14.us ]
  %arrayidx.us = getelementptr float, ptr %2, i32 %m.037.us
  %3 = load float, ptr %arrayidx.us, align 4, !tbaa !4
  %arrayidx15.us = getelementptr inbounds float, ptr %Pattern, i32 %m.037.us
  %4 = load float, ptr %arrayidx15.us, align 4, !tbaa !4
  %5 = tail call float @llvm.fmuladd.f32(float %3, float %4, float %k_corr.036.us)
  %inc.us = add nuw i32 %m.037.us, 1
  %exitcond.not = icmp eq i32 %inc.us, %patlen
  br i1 %exitcond.not, label %for.cond11.for.cond.cleanup13_crit_edge.us, label %for.body14.us, !llvm.loop !8

for.cond11.for.cond.cleanup13_crit_edge.us:       ; preds = %for.body14.us
  %arrayidx16.us = getelementptr inbounds float, ptr %dest, i32 %n.038.us
  store float %5, ptr %arrayidx16.us, align 4, !tbaa !4
  %inc18.us = add nuw i32 %n.038.us, 1
  %cmp10.not.us.not = icmp ult i32 %n.038.us, %sub
  br i1 %cmp10.not.us.not, label %for.cond11.preheader.us, label %return, !llvm.loop !10

return:                                           ; preds = %for.cond11.for.cond.cleanup13_crit_edge.us, %for.cond11.preheader.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond11.preheader.preheader ], [ 0, %for.cond11.for.cond.cleanup13_crit_edge.us ]
  ret i32 %retval.0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr nocapture writeonly, i8, i32, i1 immarg) #2

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-172-g9dacbc0)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}