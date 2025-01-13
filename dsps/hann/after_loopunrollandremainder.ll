; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_wind_hann_f32.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree nounwind memory(write)
define dso_local void @dsps_wind_hann_f32_arp4(ptr noalias nocapture noundef writeonly %window, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %cmp15 = icmp sgt i32 %len, 0
  br i1 %cmp15, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %entry
  %sub = add nsw i32 %len, -1
  %conv = sitofp i32 %sub to float
  %div = fdiv float 1.000000e+00, %conv
  %conv4 = fpext float %div to double
  %mul1 = fmul double %conv4, 0x401921FB54442D18
  %conv22 = fptrunc double %mul1 to float
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
  %i.016 = phi i32 [ %inc.7, %for.body.7 ], [ 0, %for.body.lr.ph ]
  %conv5 = sitofp i32 %i.016 to float
  %mul6 = fmul float %conv22, %conv5
  %call = tail call float @cosf(float noundef %mul6) #2
  %sub7 = fsub float 1.000000e+00, %call
  %conv10 = fmul float %sub7, 5.000000e-01
  %arrayidx = getelementptr inbounds float, ptr %window, i32 %i.016
  store float %conv10, ptr %arrayidx, align 4, !tbaa !4
  %inc = or disjoint i32 %i.016, 1
  %conv5.1 = sitofp i32 %inc to float
  %mul6.1 = fmul float %conv22, %conv5.1
  %call.1 = tail call float @cosf(float noundef %mul6.1) #2
  %sub7.1 = fsub float 1.000000e+00, %call.1
  %conv10.1 = fmul float %sub7.1, 5.000000e-01
  %arrayidx.1 = getelementptr inbounds float, ptr %window, i32 %inc
  store float %conv10.1, ptr %arrayidx.1, align 4, !tbaa !4
  %inc.1 = or disjoint i32 %i.016, 2
  %conv5.2 = sitofp i32 %inc.1 to float
  %mul6.2 = fmul float %conv22, %conv5.2
  %call.2 = tail call float @cosf(float noundef %mul6.2) #2
  %sub7.2 = fsub float 1.000000e+00, %call.2
  %conv10.2 = fmul float %sub7.2, 5.000000e-01
  %arrayidx.2 = getelementptr inbounds float, ptr %window, i32 %inc.1
  store float %conv10.2, ptr %arrayidx.2, align 4, !tbaa !4
  %inc.2 = or disjoint i32 %i.016, 3
  %conv5.3 = sitofp i32 %inc.2 to float
  %mul6.3 = fmul float %conv22, %conv5.3
  %call.3 = tail call float @cosf(float noundef %mul6.3) #2
  %sub7.3 = fsub float 1.000000e+00, %call.3
  %conv10.3 = fmul float %sub7.3, 5.000000e-01
  %arrayidx.3 = getelementptr inbounds float, ptr %window, i32 %inc.2
  store float %conv10.3, ptr %arrayidx.3, align 4, !tbaa !4
  %inc.3 = or disjoint i32 %i.016, 4
  %conv5.4 = sitofp i32 %inc.3 to float
  %mul6.4 = fmul float %conv22, %conv5.4
  %call.4 = tail call float @cosf(float noundef %mul6.4) #2
  %sub7.4 = fsub float 1.000000e+00, %call.4
  %conv10.4 = fmul float %sub7.4, 5.000000e-01
  %arrayidx.4 = getelementptr inbounds float, ptr %window, i32 %inc.3
  store float %conv10.4, ptr %arrayidx.4, align 4, !tbaa !4
  %inc.4 = or disjoint i32 %i.016, 5
  %conv5.5 = sitofp i32 %inc.4 to float
  %mul6.5 = fmul float %conv22, %conv5.5
  %call.5 = tail call float @cosf(float noundef %mul6.5) #2
  %sub7.5 = fsub float 1.000000e+00, %call.5
  %conv10.5 = fmul float %sub7.5, 5.000000e-01
  %arrayidx.5 = getelementptr inbounds float, ptr %window, i32 %inc.4
  store float %conv10.5, ptr %arrayidx.5, align 4, !tbaa !4
  %inc.5 = or disjoint i32 %i.016, 6
  %conv5.6 = sitofp i32 %inc.5 to float
  %mul6.6 = fmul float %conv22, %conv5.6
  %call.6 = tail call float @cosf(float noundef %mul6.6) #2
  %sub7.6 = fsub float 1.000000e+00, %call.6
  %conv10.6 = fmul float %sub7.6, 5.000000e-01
  %arrayidx.6 = getelementptr inbounds float, ptr %window, i32 %inc.5
  store float %conv10.6, ptr %arrayidx.6, align 4, !tbaa !4
  %inc.6 = or disjoint i32 %i.016, 7
  %conv5.7 = sitofp i32 %inc.6 to float
  %mul6.7 = fmul float %conv22, %conv5.7
  %call.7 = tail call float @cosf(float noundef %mul6.7) #2
  %sub7.7 = fsub float 1.000000e+00, %call.7
  %conv10.7 = fmul float %sub7.7, 5.000000e-01
  %arrayidx.7 = getelementptr inbounds float, ptr %window, i32 %inc.6
  store float %conv10.7, ptr %arrayidx.7, align 4, !tbaa !4
  %inc.7 = add nuw nsw i32 %i.016, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub4
  br i1 %exitcond.not.7, label %for.body.7, label %for.cond97.preheader, !llvm.loop !8

for.body.clone:                                   ; preds = %for.cond97.preheader, %for.body.clone
  %i.016.clone = phi i32 [ %inc.clone, %for.body.clone ], [ %i.0.lcssa, %for.cond97.preheader ]
  %conv5.clone = sitofp i32 %i.016.clone to float
  %mul6.clone = fmul float %conv22, %conv5.clone
  %call.clone = tail call float @cosf(float noundef %mul6.clone) #2
  %sub7.clone = fsub float 1.000000e+00, %call.clone
  %conv10.clone = fmul float %sub7.clone, 5.000000e-01
  %arrayidx.clone = getelementptr inbounds float, ptr %window, i32 %i.016.clone
  store float %conv10.clone, ptr %arrayidx.clone, align 4, !tbaa !4
  %inc.clone = add nuw nsw i32 %i.016.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %for.cond.cleanup, label %for.body.clone, !llvm.loop !8
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare dso_local float @cosf(float noundef) local_unnamed_addr #1

attributes #0 = { nofree nounwind memory(write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nofree nounwind willreturn memory(write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nounwind }

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
