; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_wind_flat_top_f32.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree nounwind memory(write)
define dso_local void @dsps_wind_flat_top_f32(ptr noalias nocapture noundef writeonly %window, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp42 = icmp sgt i32 %len, 0
  br i1 %cmp42, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %sub = add nsw i32 %len, -1
  %conv = sitofp i32 %sub to float
  %div = fdiv float 1.000000e+00, %conv
  %conv4 = fpext float %div to double
  %mul1 = fmul double %conv4, 0x401921FB54442D18
  %conv22 = fptrunc double %mul1 to float
  %mul33 = fmul float %conv22, 2.000000e+00
  %mul4 = fmul float %conv22, 3.000000e+00
  %mul54 = fmul float %conv22, 4.000000e+00
  %sub4 = add nsw i32 %len, -7
  %cmp169 = icmp sgt i32 %len, 7
  br i1 %cmp169, label %for.body.7, label %for.cond97.preheader

for.cond.cleanup:                                 ; preds = %for.body.clone, %for.cond97.preheader, %entry
  ret void

for.cond97.preheader:                             ; preds = %for.body.7, %for.body.lr.ph
  %i.0.lcssa = phi i32 [ 0, %for.body.lr.ph ], [ %inc.7, %for.body.7 ]
  %cmp98171 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp98171, label %for.body.clone, label %for.cond.cleanup

for.body.7:                                       ; preds = %for.body.lr.ph, %for.body.7
  %i.043 = phi i32 [ %inc.7, %for.body.7 ], [ 0, %for.body.lr.ph ]
  %conv5 = sitofp i32 %i.043 to float
  %mul6 = fmul float %conv22, %conv5
  %call = tail call float @cosf(float noundef %mul6) #3
  %0 = tail call float @llvm.fmuladd.f32(float %call, float 0xBFDAAA1780000000, float 0x3FCB981740000000)
  %mul9 = fmul float %mul33, %conv5
  %call14 = tail call float @cosf(float noundef %mul9) #3
  %1 = tail call float @llvm.fmuladd.f32(float %call14, float 0x3FD1BEAE00000000, float %0)
  %mul125 = fmul float %mul4, %conv5
  %call22 = tail call float @cosf(float noundef %mul125) #3
  %2 = tail call float @llvm.fmuladd.f32(float %call22, float 0xBFB5656E00000000, float %1)
  %mul15 = fmul float %mul54, %conv5
  %call30 = tail call float @cosf(float noundef %mul15) #3
  %3 = tail call float @llvm.fmuladd.f32(float %call30, float 0x3F7C74D7E0000000, float %2)
  %arrayidx = getelementptr inbounds float, ptr %window, i32 %i.043
  store float %3, ptr %arrayidx, align 4, !tbaa !4
  %inc = or disjoint i32 %i.043, 1
  %conv5.1 = sitofp i32 %inc to float
  %mul6.1 = fmul float %conv22, %conv5.1
  %call.1 = tail call float @cosf(float noundef %mul6.1) #3
  %4 = tail call float @llvm.fmuladd.f32(float %call.1, float 0xBFDAAA1780000000, float 0x3FCB981740000000)
  %mul9.1 = fmul float %mul33, %conv5.1
  %call14.1 = tail call float @cosf(float noundef %mul9.1) #3
  %5 = tail call float @llvm.fmuladd.f32(float %call14.1, float 0x3FD1BEAE00000000, float %4)
  %mul125.1 = fmul float %mul4, %conv5.1
  %call22.1 = tail call float @cosf(float noundef %mul125.1) #3
  %6 = tail call float @llvm.fmuladd.f32(float %call22.1, float 0xBFB5656E00000000, float %5)
  %mul15.1 = fmul float %mul54, %conv5.1
  %call30.1 = tail call float @cosf(float noundef %mul15.1) #3
  %7 = tail call float @llvm.fmuladd.f32(float %call30.1, float 0x3F7C74D7E0000000, float %6)
  %arrayidx.1 = getelementptr inbounds float, ptr %window, i32 %inc
  store float %7, ptr %arrayidx.1, align 4, !tbaa !4
  %inc.1 = or disjoint i32 %i.043, 2
  %conv5.2 = sitofp i32 %inc.1 to float
  %mul6.2 = fmul float %conv22, %conv5.2
  %call.2 = tail call float @cosf(float noundef %mul6.2) #3
  %8 = tail call float @llvm.fmuladd.f32(float %call.2, float 0xBFDAAA1780000000, float 0x3FCB981740000000)
  %mul9.2 = fmul float %mul33, %conv5.2
  %call14.2 = tail call float @cosf(float noundef %mul9.2) #3
  %9 = tail call float @llvm.fmuladd.f32(float %call14.2, float 0x3FD1BEAE00000000, float %8)
  %mul125.2 = fmul float %mul4, %conv5.2
  %call22.2 = tail call float @cosf(float noundef %mul125.2) #3
  %10 = tail call float @llvm.fmuladd.f32(float %call22.2, float 0xBFB5656E00000000, float %9)
  %mul15.2 = fmul float %mul54, %conv5.2
  %call30.2 = tail call float @cosf(float noundef %mul15.2) #3
  %11 = tail call float @llvm.fmuladd.f32(float %call30.2, float 0x3F7C74D7E0000000, float %10)
  %arrayidx.2 = getelementptr inbounds float, ptr %window, i32 %inc.1
  store float %11, ptr %arrayidx.2, align 4, !tbaa !4
  %inc.2 = or disjoint i32 %i.043, 3
  %conv5.3 = sitofp i32 %inc.2 to float
  %mul6.3 = fmul float %conv22, %conv5.3
  %call.3 = tail call float @cosf(float noundef %mul6.3) #3
  %12 = tail call float @llvm.fmuladd.f32(float %call.3, float 0xBFDAAA1780000000, float 0x3FCB981740000000)
  %mul9.3 = fmul float %mul33, %conv5.3
  %call14.3 = tail call float @cosf(float noundef %mul9.3) #3
  %13 = tail call float @llvm.fmuladd.f32(float %call14.3, float 0x3FD1BEAE00000000, float %12)
  %mul125.3 = fmul float %mul4, %conv5.3
  %call22.3 = tail call float @cosf(float noundef %mul125.3) #3
  %14 = tail call float @llvm.fmuladd.f32(float %call22.3, float 0xBFB5656E00000000, float %13)
  %mul15.3 = fmul float %mul54, %conv5.3
  %call30.3 = tail call float @cosf(float noundef %mul15.3) #3
  %15 = tail call float @llvm.fmuladd.f32(float %call30.3, float 0x3F7C74D7E0000000, float %14)
  %arrayidx.3 = getelementptr inbounds float, ptr %window, i32 %inc.2
  store float %15, ptr %arrayidx.3, align 4, !tbaa !4
  %inc.3 = or disjoint i32 %i.043, 4
  %conv5.4 = sitofp i32 %inc.3 to float
  %mul6.4 = fmul float %conv22, %conv5.4
  %call.4 = tail call float @cosf(float noundef %mul6.4) #3
  %16 = tail call float @llvm.fmuladd.f32(float %call.4, float 0xBFDAAA1780000000, float 0x3FCB981740000000)
  %mul9.4 = fmul float %mul33, %conv5.4
  %call14.4 = tail call float @cosf(float noundef %mul9.4) #3
  %17 = tail call float @llvm.fmuladd.f32(float %call14.4, float 0x3FD1BEAE00000000, float %16)
  %mul125.4 = fmul float %mul4, %conv5.4
  %call22.4 = tail call float @cosf(float noundef %mul125.4) #3
  %18 = tail call float @llvm.fmuladd.f32(float %call22.4, float 0xBFB5656E00000000, float %17)
  %mul15.4 = fmul float %mul54, %conv5.4
  %call30.4 = tail call float @cosf(float noundef %mul15.4) #3
  %19 = tail call float @llvm.fmuladd.f32(float %call30.4, float 0x3F7C74D7E0000000, float %18)
  %arrayidx.4 = getelementptr inbounds float, ptr %window, i32 %inc.3
  store float %19, ptr %arrayidx.4, align 4, !tbaa !4
  %inc.4 = or disjoint i32 %i.043, 5
  %conv5.5 = sitofp i32 %inc.4 to float
  %mul6.5 = fmul float %conv22, %conv5.5
  %call.5 = tail call float @cosf(float noundef %mul6.5) #3
  %20 = tail call float @llvm.fmuladd.f32(float %call.5, float 0xBFDAAA1780000000, float 0x3FCB981740000000)
  %mul9.5 = fmul float %mul33, %conv5.5
  %call14.5 = tail call float @cosf(float noundef %mul9.5) #3
  %21 = tail call float @llvm.fmuladd.f32(float %call14.5, float 0x3FD1BEAE00000000, float %20)
  %mul125.5 = fmul float %mul4, %conv5.5
  %call22.5 = tail call float @cosf(float noundef %mul125.5) #3
  %22 = tail call float @llvm.fmuladd.f32(float %call22.5, float 0xBFB5656E00000000, float %21)
  %mul15.5 = fmul float %mul54, %conv5.5
  %call30.5 = tail call float @cosf(float noundef %mul15.5) #3
  %23 = tail call float @llvm.fmuladd.f32(float %call30.5, float 0x3F7C74D7E0000000, float %22)
  %arrayidx.5 = getelementptr inbounds float, ptr %window, i32 %inc.4
  store float %23, ptr %arrayidx.5, align 4, !tbaa !4
  %inc.5 = or disjoint i32 %i.043, 6
  %conv5.6 = sitofp i32 %inc.5 to float
  %mul6.6 = fmul float %conv22, %conv5.6
  %call.6 = tail call float @cosf(float noundef %mul6.6) #3
  %24 = tail call float @llvm.fmuladd.f32(float %call.6, float 0xBFDAAA1780000000, float 0x3FCB981740000000)
  %mul9.6 = fmul float %mul33, %conv5.6
  %call14.6 = tail call float @cosf(float noundef %mul9.6) #3
  %25 = tail call float @llvm.fmuladd.f32(float %call14.6, float 0x3FD1BEAE00000000, float %24)
  %mul125.6 = fmul float %mul4, %conv5.6
  %call22.6 = tail call float @cosf(float noundef %mul125.6) #3
  %26 = tail call float @llvm.fmuladd.f32(float %call22.6, float 0xBFB5656E00000000, float %25)
  %mul15.6 = fmul float %mul54, %conv5.6
  %call30.6 = tail call float @cosf(float noundef %mul15.6) #3
  %27 = tail call float @llvm.fmuladd.f32(float %call30.6, float 0x3F7C74D7E0000000, float %26)
  %arrayidx.6 = getelementptr inbounds float, ptr %window, i32 %inc.5
  store float %27, ptr %arrayidx.6, align 4, !tbaa !4
  %inc.6 = or disjoint i32 %i.043, 7
  %conv5.7 = sitofp i32 %inc.6 to float
  %mul6.7 = fmul float %conv22, %conv5.7
  %call.7 = tail call float @cosf(float noundef %mul6.7) #3
  %28 = tail call float @llvm.fmuladd.f32(float %call.7, float 0xBFDAAA1780000000, float 0x3FCB981740000000)
  %mul9.7 = fmul float %mul33, %conv5.7
  %call14.7 = tail call float @cosf(float noundef %mul9.7) #3
  %29 = tail call float @llvm.fmuladd.f32(float %call14.7, float 0x3FD1BEAE00000000, float %28)
  %mul125.7 = fmul float %mul4, %conv5.7
  %call22.7 = tail call float @cosf(float noundef %mul125.7) #3
  %30 = tail call float @llvm.fmuladd.f32(float %call22.7, float 0xBFB5656E00000000, float %29)
  %mul15.7 = fmul float %mul54, %conv5.7
  %call30.7 = tail call float @cosf(float noundef %mul15.7) #3
  %31 = tail call float @llvm.fmuladd.f32(float %call30.7, float 0x3F7C74D7E0000000, float %30)
  %arrayidx.7 = getelementptr inbounds float, ptr %window, i32 %inc.6
  store float %31, ptr %arrayidx.7, align 4, !tbaa !4
  %inc.7 = add nuw nsw i32 %i.043, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub4
  br i1 %exitcond.not.7, label %for.body.7, label %for.cond97.preheader, !llvm.loop !8

for.body.clone:                                   ; preds = %for.cond97.preheader, %for.body.clone
  %i.043.clone = phi i32 [ %inc.clone, %for.body.clone ], [ %i.0.lcssa, %for.cond97.preheader ]
  %conv5.clone = sitofp i32 %i.043.clone to float
  %mul6.clone = fmul float %conv22, %conv5.clone
  %call.clone = tail call float @cosf(float noundef %mul6.clone) #3
  %32 = tail call float @llvm.fmuladd.f32(float %call.clone, float 0xBFDAAA1780000000, float 0x3FCB981740000000)
  %mul9.clone = fmul float %mul33, %conv5.clone
  %call14.clone = tail call float @cosf(float noundef %mul9.clone) #3
  %33 = tail call float @llvm.fmuladd.f32(float %call14.clone, float 0x3FD1BEAE00000000, float %32)
  %mul125.clone = fmul float %mul4, %conv5.clone
  %call22.clone = tail call float @cosf(float noundef %mul125.clone) #3
  %34 = tail call float @llvm.fmuladd.f32(float %call22.clone, float 0xBFB5656E00000000, float %33)
  %mul15.clone = fmul float %mul54, %conv5.clone
  %call30.clone = tail call float @cosf(float noundef %mul15.clone) #3
  %35 = tail call float @llvm.fmuladd.f32(float %call30.clone, float 0x3F7C74D7E0000000, float %34)
  %arrayidx.clone = getelementptr inbounds float, ptr %window, i32 %i.043.clone
  store float %35, ptr %arrayidx.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %i.043.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %for.cond.cleanup, label %for.body.clone, !llvm.loop !8
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare dso_local float @cosf(float noundef) local_unnamed_addr #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { nofree nounwind memory(write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nofree nounwind willreturn memory(write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
