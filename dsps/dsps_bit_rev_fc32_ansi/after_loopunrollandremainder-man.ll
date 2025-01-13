; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_bit_rev_fc32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nounwind
define dso_local noundef i32 @dsps_bit_rev_fc32_ansi(ptr nocapture noundef %data, i32 noundef %N) local_unnamed_addr #0 {
entry:
  %call = tail call zeroext i1 @dsp_is_power_of_two(i32 noundef %N) #2
  br i1 %call, label %for.cond.preheader, label %return

for.cond.preheader:                               ; preds = %entry
  %sub = add nsw i32 %N, -2
  %cmp50 = icmp sgt i32 %N, 3
  br i1 %cmp50, label %while.cond.preheader.preheader, label %return

while.cond.preheader.preheader:                   ; preds = %for.cond.preheader
  ;%0 = add nsw i32 %N, -2
  %shr = lshr i32 %N, 1
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %for.inc.1, %while.cond.preheader.preheader
  %i.052 = phi i32 [ 1, %while.cond.preheader.preheader ], [ %inc.1, %for.inc.1 ]
  %j.051 = phi i32 [ 0, %while.cond.preheader.preheader ], [ %add.1, %for.inc.1 ]
  %cmp1.not183 = icmp sgt i32 %shr, %j.051
  br i1 %cmp1.not183, label %while.end, label %while.cond

while.cond:                                       ; preds = %while.cond.1, %while.cond.preheader
  %k.0.in = phi i32 [ %N, %while.cond.preheader ], [ %k.0.1, %while.cond.1 ]
  %j.1 = phi i32 [ %j.051, %while.cond.preheader ], [ %sub2.1, %while.cond.1 ]
  %k.0 = lshr i32 %k.0.in, 1
  %cmp1.not = icmp sgt i32 %k.0, %j.1
  %sub2 = sub nsw i32 %j.1, %k.0
  br i1 %cmp1.not, label %while.end, label %while.cond.1, !llvm.loop !4

while.cond.1:                                     ; preds = %while.cond
  %k.0.1 = lshr i32 %k.0, 1
  %cmp1.not.1 = icmp sgt i32 %k.0.1, %sub2
  %sub2.1 = sub nsw i32 %sub2, %k.0.1
  br i1 %cmp1.not.1, label %while.end, label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond.1, %while.cond
  %j.1.lcssa = phi i32 [ %j.1, %while.cond ], [ %sub2, %while.cond.1 ]
  %k.0.lcssa = phi i32 [ %k.0, %while.cond ], [ %k.0.1, %while.cond.1 ]
  %add = add nsw i32 %j.1.lcssa, %k.0.lcssa
  %cmp4 = icmp slt i32 %i.052, %add
  br i1 %cmp4, label %if.then5, label %for.inc

if.then5:                                         ; preds = %while.end
  %mul = shl nsw i32 %add, 1
  %arrayidx = getelementptr inbounds float, ptr %data, i32 %mul
  %1 = load float, ptr %arrayidx, align 4, !tbaa !8
  %mul6 = shl nuw nsw i32 %i.052, 1
  %arrayidx7 = getelementptr inbounds float, ptr %data, i32 %mul6
  %2 = load float, ptr %arrayidx7, align 4, !tbaa !8
  store float %2, ptr %arrayidx, align 4, !tbaa !8
  store float %1, ptr %arrayidx7, align 4, !tbaa !8
  %add13 = or disjoint i32 %mul, 1
  %arrayidx14 = getelementptr inbounds float, ptr %data, i32 %add13
  %3 = load float, ptr %arrayidx14, align 4, !tbaa !8
  %add16 = or disjoint i32 %mul6, 1
  %arrayidx17 = getelementptr inbounds float, ptr %data, i32 %add16
  %4 = load float, ptr %arrayidx17, align 4, !tbaa !8
  store float %4, ptr %arrayidx14, align 4, !tbaa !8
  store float %3, ptr %arrayidx17, align 4, !tbaa !8
  br label %for.inc

for.inc:                                          ; preds = %if.then5, %while.end
  %inc = add nuw nsw i32 %i.052, 1
  %exitcond.not = icmp eq i32 %i.052, %0
  br i1 %exitcond.not, label %return.loopexit, label %while.cond.preheader.1, !llvm.loop !12

while.cond.preheader.1:                           ; preds = %for.inc
  br label %while.cond.14

while.cond.14:                                    ; preds = %while.cond.1.1, %while.cond.preheader.1
  %k.0.in.1 = phi i32 [ %N, %while.cond.preheader.1 ], [ %k.0.1.1, %while.cond.1.1 ]
  %j.1.1 = phi i32 [ %add, %while.cond.preheader.1 ], [ %sub2.1.1, %while.cond.1.1 ]
  %k.0.11 = lshr i32 %k.0.in.1, 1
  %cmp1.not.12 = icmp sgt i32 %k.0.11, %j.1.1
  %sub2.13 = sub nsw i32 %j.1.1, %k.0.11
  br i1 %cmp1.not.12, label %while.end.1, label %while.cond.1.1, !llvm.loop !4

while.cond.1.1:                                   ; preds = %while.cond.14
  %k.0.1.1 = lshr i32 %k.0.11, 1
  %cmp1.not.1.1 = icmp sgt i32 %k.0.1.1, %sub2.13
  %sub2.1.1 = sub nsw i32 %sub2.13, %k.0.1.1
  br i1 %cmp1.not.1.1, label %while.end.1, label %while.cond.14, !llvm.loop !6

while.end.1:                                      ; preds = %while.cond.1.1, %while.cond.14
  %j.1.lcssa.1 = phi i32 [ %j.1.1, %while.cond.14 ], [ %sub2.13, %while.cond.1.1 ]
  %k.0.lcssa.1 = phi i32 [ %k.0.11, %while.cond.14 ], [ %k.0.1.1, %while.cond.1.1 ]
  %add.1 = add nsw i32 %j.1.lcssa.1, %k.0.lcssa.1
  %cmp4.1 = icmp slt i32 %inc, %add.1
  br i1 %cmp4.1, label %if.then5.1, label %for.inc.1

if.then5.1:                                       ; preds = %while.end.1
  %mul.1 = shl nsw i32 %add.1, 1
  %arrayidx.1 = getelementptr inbounds float, ptr %data, i32 %mul.1
  %5 = load float, ptr %arrayidx.1, align 4, !tbaa !8
  %mul6.1 = shl nuw nsw i32 %inc, 1
  %arrayidx7.1 = getelementptr inbounds float, ptr %data, i32 %mul6.1
  %6 = load float, ptr %arrayidx7.1, align 4, !tbaa !8
  store float %6, ptr %arrayidx.1, align 4, !tbaa !8
  store float %5, ptr %arrayidx7.1, align 4, !tbaa !8
  %add13.1 = or disjoint i32 %mul.1, 1
  %arrayidx14.1 = getelementptr inbounds float, ptr %data, i32 %add13.1
  %7 = load float, ptr %arrayidx14.1, align 4, !tbaa !8
  %add16.1 = or disjoint i32 %mul6.1, 1
  %arrayidx17.1 = getelementptr inbounds float, ptr %data, i32 %add16.1
  %8 = load float, ptr %arrayidx17.1, align 4, !tbaa !8
  store float %8, ptr %arrayidx14.1, align 4, !tbaa !8
  store float %7, ptr %arrayidx17.1, align 4, !tbaa !8
  br label %for.inc.1

for.inc.1:                                        ; preds = %if.then5.1, %while.end.1
  %inc.1 = add nuw nsw i32 %i.052, 2
  %exitcond.not.1 = icmp eq i32 %inc, %0
  br i1 %exitcond.not.1, label %return.loopexit, label %while.cond.preheader, !llvm.loop !13

return.loopexit:                                  ; preds = %for.inc.1, %for.inc
  br label %return

return:                                           ; preds = %return.loopexit, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 0, %for.cond.preheader ], [ 0, %return.loopexit ]
  ret i32 %retval.0
}

declare dso_local zeroext i1 @dsp_is_power_of_two(i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = distinct !{!12, !5}
!13 = distinct !{!13, !5, !7}
