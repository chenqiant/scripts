; ModuleID = 'dsps_bit_rev_fc32_ansi.ll'
source_filename = "dsps_bit_rev_fc32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nounwind
define dso_local noundef i32 @dsps_bit_rev_fc32_ansi(ptr nocapture noundef %data, i32 noundef %N) local_unnamed_addr #0 {
entry:
  %k.0.loc = alloca i32, align 4
  %j.1.loc = alloca i32, align 4
  %call = tail call zeroext i1 @dsp_is_power_of_two(i32 noundef %N) #3
  br i1 %call, label %for.cond.preheader, label %return

for.cond.preheader:                               ; preds = %entry
  %cmp50 = icmp sgt i32 %N, 2
  br i1 %cmp50, label %while.cond.preheader.preheader, label %return

while.cond.preheader.preheader:                   ; preds = %for.cond.preheader
  %0 = add nsw i32 %N, -2
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %for.inc, %while.cond.preheader.preheader
  %i.052 = phi i32 [ %inc, %for.inc ], [ 1, %while.cond.preheader.preheader ]
  %j.051 = phi i32 [ %add, %for.inc ], [ 0, %while.cond.preheader.preheader ]
  br label %codeRepl

codeRepl:                                         ; preds = %while.cond.preheader
  call void @llvm.lifetime.start.p0(i64 -1, ptr %j.1.loc)
  call void @llvm.lifetime.start.p0(i64 -1, ptr %k.0.loc)
  call void @dsps_bit_rev_fc32_ansi.while.cond(i32 %N, i32 %j.051, ptr %j.1.loc, ptr %k.0.loc)
  %j.1.reload = load i32, ptr %j.1.loc, align 4
  %k.0.reload = load i32, ptr %k.0.loc, align 4
  call void @llvm.lifetime.end.p0(i64 -1, ptr %j.1.loc)
  call void @llvm.lifetime.end.p0(i64 -1, ptr %k.0.loc)
  br label %while.end

while.end:                                        ; preds = %codeRepl
  %add = add nsw i32 %j.1.reload, %k.0.reload
  %cmp4 = icmp slt i32 %i.052, %add
  br i1 %cmp4, label %if.then5, label %for.inc

if.then5:                                         ; preds = %while.end
  %mul = shl nsw i32 %add, 1
  %arrayidx = getelementptr inbounds float, ptr %data, i32 %mul
  %1 = load float, ptr %arrayidx, align 4, !tbaa !4
  %mul6 = shl nuw nsw i32 %i.052, 1
  %arrayidx7 = getelementptr inbounds float, ptr %data, i32 %mul6
  %2 = load float, ptr %arrayidx7, align 4, !tbaa !4
  store float %2, ptr %arrayidx, align 4, !tbaa !4
  store float %1, ptr %arrayidx7, align 4, !tbaa !4
  %add13 = or disjoint i32 %mul, 1
  %arrayidx14 = getelementptr inbounds float, ptr %data, i32 %add13
  %3 = load float, ptr %arrayidx14, align 4, !tbaa !4
  %add16 = or disjoint i32 %mul6, 1
  %arrayidx17 = getelementptr inbounds float, ptr %data, i32 %add16
  %4 = load float, ptr %arrayidx17, align 4, !tbaa !4
  store float %4, ptr %arrayidx14, align 4, !tbaa !4
  store float %3, ptr %arrayidx17, align 4, !tbaa !4
  br label %for.inc

for.inc:                                          ; preds = %if.then5, %while.end
  %inc = add nuw nsw i32 %i.052, 1
  %exitcond.not = icmp eq i32 %i.052, %0
  br i1 %exitcond.not, label %return, label %while.cond.preheader, !llvm.loop !8

return:                                           ; preds = %for.inc, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.inc ]
  ret i32 %retval.0
}

declare dso_local zeroext i1 @dsp_is_power_of_two(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define internal void @dsps_bit_rev_fc32_ansi.while.cond(i32 %N, i32 %j.051, ptr %j.1.out, ptr %k.0.out) #0 {
newFuncRoot:
  br label %while.cond

while.cond:                                       ; preds = %newFuncRoot, %while.cond
  %k.0.in = phi i32 [ %k.0, %while.cond ], [ %N, %newFuncRoot ]
  %j.1 = phi i32 [ %sub2, %while.cond ], [ %j.051, %newFuncRoot ]
  store i32 %j.1, ptr %j.1.out, align 4
  %k.0 = lshr i32 %k.0.in, 1
  store i32 %k.0, ptr %k.0.out, align 4
  %cmp1.not = icmp sgt i32 %k.0, %j.1
  %sub2 = sub nsw i32 %j.1, %k.0
  br i1 %cmp1.not, label %while.end.exitStub, label %while.cond, !llvm.loop !10

while.end.exitStub:                               ; preds = %while.cond
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

attributes #0 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
