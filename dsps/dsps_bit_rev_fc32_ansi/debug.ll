; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_bit_rev_fc32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nounwind
define dso_local noundef i32 @dsps_bit_rev_fc32_ansi(ptr noalias nocapture noundef %data, i32 noundef %N) local_unnamed_addr #0 {
entry:
  %call = tail call zeroext i1 @dsp_is_power_of_two(i32 noundef %N) #3
  br i1 %call, label %for.cond.preheader, label %return

for.cond.preheader:                               ; preds = %entry
  %cmp50 = icmp sgt i32 %N, 2
  br i1 %cmp50, label %while.cond.preheader.preheader, label %return

while.cond.preheader.preheader:                   ; preds = %for.cond.preheader
  %0 = add nsw i32 %N, -2
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %while.cond.preheader, %while.cond.preheader.preheader
  %i.052 = phi i32 [ %inc, %while.cond.preheader ], [ 1, %while.cond.preheader.preheader ]
  %j.051 = phi i32 [ %call1, %while.cond.preheader ], [ 0, %while.cond.preheader.preheader ]
  %call1 = tail call i32 @bit_rev_single_step(ptr %data, i32 %i.052, i32 %j, i32 %N)
  %inc = add nuw nsw i32 %i.052, 1
  %exitcond.not = icmp eq i32 %i.052, %0
  br i1 %exitcond.not, label %return, label %while.cond.preheader, !llvm.loop !4

return:                                           ; preds = %while.cond.preheader, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 0, %for.cond.preheader ], [ 0, %while.cond.preheader ]
  ret i32 %retval.0
}

declare dso_local zeroext i1 @dsp_is_power_of_two(i32 noundef) local_unnamed_addr #1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(none)
define internal fastcc i32 @bit_rev_single_step(ptr nocapture noundef %data, i32 noundef %i, i32 noundef %j, i32 noundef %N) #2 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %entry, %while.cond
  %k.0.in = phi i32 [ %k.0, %while.cond ], [ %N, %entry ]
  %j.1 = phi i32 [ %sub2, %while.cond ], [ %j, %entry ]
  %k.0 = lshr i32 %k.0.in, 1
  %cmp1.not = icmp sgt i32 %k.0, %j.1
  %sub2 = sub nsw i32 %j.1, %k.0
  br i1 %cmp1.not, label %while.end, label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %add = add nsw i32 %j.1, %k.0
  %cmp4 = icmp slt i32 %i, %add
  br i1 %cmp4, label %if.then5, label %for.inc

if.then5:                                         ; preds = %while.end
  %mul = shl nsw i32 %add, 1
  %arrayidx = getelementptr inbounds float, ptr %data, i32 %mul
  %0 = load float, ptr %arrayidx, align 4, !tbaa !7
  %mul6 = shl nuw nsw i32 %i, 1
  %arrayidx7 = getelementptr inbounds float, ptr %data, i32 %mul6
  %1 = load float, ptr %arrayidx7, align 4, !tbaa !7
  store float %1, ptr %arrayidx, align 4, !tbaa !7
  store float %0, ptr %arrayidx7, align 4, !tbaa !7
  %add13 = or disjoint i32 %mul, 1
  %arrayidx14 = getelementptr inbounds float, ptr %data, i32 %add13
  %2 = load float, ptr %arrayidx14, align 4, !tbaa !7
  %add16 = or disjoint i32 %mul6, 1
  %arrayidx17 = getelementptr inbounds float, ptr %data, i32 %add16
  %3 = load float, ptr %arrayidx17, align 4, !tbaa !7
  store float %3, ptr %arrayidx14, align 4, !tbaa !7
  store float %2, ptr %arrayidx17, align 4, !tbaa !7
  br label %for.inc

for.inc:                                          ; preds = %if.then5, %while.end
  ret i32 %add
}

attributes #0 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nofree noinline norecurse nosync nounwind memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
