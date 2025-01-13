; ModuleID = 'dsps_bit_rev_fc32_ansi.c'
source_filename = "dsps_bit_rev_fc32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; 新增辅助函数
define private fastcc void @bit_rev_inner_loop(ptr nocapture %data, i32 %i, i32 %j, i32 %N) {
entry:
  br label %while.cond

while.cond:                                      
  %k.0.in = phi i32 [ %k.0, %while.cond ], [ %N, %entry ]
  %j.1 = phi i32 [ %sub2, %while.cond ], [ %j, %entry ]
  %k.0 = lshr i32 %k.0.in, 1
  %cmp1.not = icmp sgt i32 %k.0, %j.1
  %sub2 = sub nsw i32 %j.1, %k.0
  br i1 %cmp1.not, label %while.end, label %while.cond

while.end:                                        
  %add = add nsw i32 %j.1, %k.0
  %cmp4 = icmp slt i32 %i, %add
  br i1 %cmp4, label %if.then5, label %return

if.then5:                                         
  %mul = shl nsw i32 %add, 1
  %arrayidx = getelementptr inbounds float, ptr %data, i32 %mul
  %1 = load float, ptr %arrayidx, align 4
  %mul6 = shl nuw nsw i32 %i, 1
  %arrayidx7 = getelementptr inbounds float, ptr %data, i32 %mul6
  %2 = load float, ptr %arrayidx7, align 4
  store float %2, ptr %arrayidx, align 4
  store float %1, ptr %arrayidx7, align 4
  %add13 = or i32 %mul, 1
  %arrayidx14 = getelementptr inbounds float, ptr %data, i32 %add13
  %3 = load float, ptr %arrayidx14, align 4
  %add16 = or i32 %mul6, 1
  %arrayidx17 = getelementptr inbounds float, ptr %data, i32 %add16
  %4 = load float, ptr %arrayidx17, align 4
  store float %4, ptr %arrayidx14, align 4
  store float %3, ptr %arrayidx17, align 4
  br label %return

return:
  ret void
}

; Function Attrs: nounwind
define dso_local noundef i32 @dsps_bit_rev_fc32_ansi(ptr nocapture noundef %data, i32 noundef %N) local_unnamed_addr #0 {
entry:
  %call = tail call zeroext i1 @dsp_is_power_of_two(i32 noundef %N) #2
  br i1 %call, label %for.cond.preheader, label %return

for.cond.preheader:                               ; preds = %entry
  %cmp50 = icmp sgt i32 %N, 2
  br i1 %cmp50, label %while.cond.preheader.preheader, label %return

while.cond.preheader.preheader:                   ; preds = %for.cond.preheader
  %0 = add nsw i32 %N, -2
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %while.cond.preheader.preheader, %for.inc
  %i.052 = phi i32 [ %inc, %for.inc ], [ 1, %while.cond.preheader.preheader ]
  %j.051 = phi i32 [ %add, %for.inc ], [ 0, %while.cond.preheader.preheader ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %while.cond.preheader
  %k.0.in = phi i32 [ %k.0, %while.cond ], [ %N, %while.cond.preheader ]
  %j.1 = phi i32 [ %sub2, %while.cond ], [ %j.051, %while.cond.preheader ]
  %k.0 = lshr i32 %k.0.in, 1
  %cmp1.not = icmp sgt i32 %k.0, %j.1
  %sub2 = sub nsw i32 %j.1, %k.0
  br i1 %cmp1.not, label %while.end, label %while.cond, !llvm.loop !4

while.end:                                        ; preds = %while.cond
  %add = add nsw i32 %j.1, %k.0
  %cmp4 = icmp slt i32 %i.052, %add
  br i1 %cmp4, label %if.then5, label %for.inc

if.then5:                                         ; preds = %while.end
  %mul = shl nsw i32 %add, 1
  %arrayidx = getelementptr inbounds float, ptr %data, i32 %mul
  %1 = load float, ptr %arrayidx, align 4, !tbaa !6
  %mul6 = shl nuw nsw i32 %i.052, 1
  %arrayidx7 = getelementptr inbounds float, ptr %data, i32 %mul6
  %2 = load float, ptr %arrayidx7, align 4, !tbaa !6
  store float %2, ptr %arrayidx, align 4, !tbaa !6
  store float %1, ptr %arrayidx7, align 4, !tbaa !6
  %add13 = or disjoint i32 %mul, 1
  %arrayidx14 = getelementptr inbounds float, ptr %data, i32 %add13
  %3 = load float, ptr %arrayidx14, align 4, !tbaa !6
  %add16 = or disjoint i32 %mul6, 1
  %arrayidx17 = getelementptr inbounds float, ptr %data, i32 %add16
  %4 = load float, ptr %arrayidx17, align 4, !tbaa !6
  store float %4, ptr %arrayidx14, align 4, !tbaa !6
  store float %3, ptr %arrayidx17, align 4, !tbaa !6
  br label %for.inc

for.inc:                                          ; preds = %while.end, %if.then5
  %inc = add nuw nsw i32 %i.052, 1
  %exitcond.not = icmp eq i32 %i.052, %0
  br i1 %exitcond.not, label %return, label %while.cond.preheader, !llvm.loop !10

return:                                           ; preds = %for.inc, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.inc ]
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
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !5}
