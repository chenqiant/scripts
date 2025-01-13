; ModuleID = 'dspm_mult_f32_ansi.c'
source_filename = "dspm_mult_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dspm_mult_f32_ansi(ptr nocapture noundef readonly %A, ptr nocapture noundef readonly %B, ptr nocapture noundef writeonly %C, i32 noundef %m, i32 noundef %n, i32 noundef %k) local_unnamed_addr #0 {
entry:
  %cmp54 = icmp sgt i32 %m, 0
  br i1 %cmp54, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp252 = icmp sgt i32 %k, 0
  %cmp1050 = icmp sgt i32 %n, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.cond.cleanup3
  %i.055 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc27, %for.cond.cleanup3 ]
  br i1 %cmp252, label %for.body4.lr.ph, label %for.cond.cleanup3

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  %mul = mul nsw i32 %i.055, %n
  %arrayidx = getelementptr inbounds float, ptr %A, i32 %mul
  %mul7 = mul nsw i32 %i.055, %k
  %0 = getelementptr float, ptr %C, i32 %mul7
  br label %for.body4

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3, %entry
  ret i32 0

for.cond.cleanup3:                                ; preds = %for.cond.cleanup11, %for.cond1.preheader
  %inc27 = add nuw nsw i32 %i.055, 1
  %exitcond57.not = icmp eq i32 %inc27, %m
  br i1 %exitcond57.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !4

for.body4:                                        ; preds = %for.body4.lr.ph, %for.cond.cleanup11
  %j.053 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc24, %for.cond.cleanup11 ]
  %1 = load float, ptr %arrayidx, align 4, !tbaa !6
  %arrayidx5 = getelementptr float, ptr %B, i32 %j.053
  %2 = load float, ptr %arrayidx5, align 4, !tbaa !6
  %mul6 = fmul float %1, %2
  %arrayidx8 = getelementptr float, ptr %0, i32 %j.053
  store float %mul6, ptr %arrayidx8, align 4, !tbaa !6
  br i1 %cmp1050, label %for.body12, label %for.cond.cleanup11

for.cond.cleanup11:                               ; preds = %for.body12, %for.body4
  %inc24 = add nuw nsw i32 %j.053, 1
  %exitcond56.not = icmp eq i32 %inc24, %k
  br i1 %exitcond56.not, label %for.cond.cleanup3, label %for.body4, !llvm.loop !10

for.body12:                                       ; preds = %for.body4, %for.body12
  %3 = phi float [ %6, %for.body12 ], [ %mul6, %for.body4 ]
  %s.051 = phi i32 [ %inc, %for.body12 ], [ 1, %for.body4 ]
  %arrayidx15 = getelementptr float, ptr %arrayidx, i32 %s.051
  %4 = load float, ptr %arrayidx15, align 4, !tbaa !6
  %mul16 = mul nsw i32 %s.051, %k
  %gep = getelementptr float, ptr %arrayidx5, i32 %mul16
  %5 = load float, ptr %gep, align 4, !tbaa !6
  %6 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %3)
  store float %6, ptr %arrayidx8, align 4, !tbaa !6
  %inc = add nuw nsw i32 %s.051, 1
  %exitcond.not = icmp eq i32 %inc, %n
  br i1 %exitcond.not, label %for.cond.cleanup11, label %for.body12, !llvm.loop !11
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
