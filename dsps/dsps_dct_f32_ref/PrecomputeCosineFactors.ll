; ModuleID = 'PrecomputeCosineFactors.c'
source_filename = "PrecomputeCosineFactors.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree nounwind memory(write, argmem: readwrite)
define dso_local noundef i32 @dsps_dct_f32_ref2(ptr nocapture noundef readonly %data, i32 noundef %N, ptr nocapture noundef writeonly %result) local_unnamed_addr #0 {
entry:
  %conv = sitofp i32 %N to double
  %div = fdiv double 0x400921FB54442D18, %conv
  %vla = alloca double, i32 %N, align 8
  %cmp42 = icmp sgt i32 %N, 0
  br i1 %cmp42, label %for.body, label %for.cond.cleanup7

for.cond4.preheader:                              ; preds = %for.body
  br i1 %cmp42, label %for.cond10.preheader.us, label %for.cond.cleanup7

for.cond10.preheader.us:                          ; preds = %for.cond4.preheader, %for.cond10.for.cond.cleanup13_crit_edge.us
  %i.048.us = phi i32 [ %inc26.us, %for.cond10.for.cond.cleanup13_crit_edge.us ], [ 0, %for.cond4.preheader ]
  %conv17.us = sitofp i32 %i.048.us to double
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.cond10.preheader.us, %for.body14.us
  %j9.046.us = phi i32 [ 0, %for.cond10.preheader.us ], [ %inc22.us, %for.body14.us ]
  %sum.045.us = phi float [ 0.000000e+00, %for.cond10.preheader.us ], [ %2, %for.body14.us ]
  %arrayidx15.us = getelementptr inbounds float, ptr %data, i32 %j9.046.us
  %0 = load float, ptr %arrayidx15.us, align 4, !tbaa !4
  %arrayidx16.us = getelementptr inbounds double, ptr %vla, i32 %j9.046.us
  %1 = load double, ptr %arrayidx16.us, align 8, !tbaa !8
  %mul18.us = fmul double %1, %conv17.us
  %conv19.us = fptrunc double %mul18.us to float
  %call.us = tail call float @cosf(float noundef %conv19.us) #3
  %2 = tail call float @llvm.fmuladd.f32(float %0, float %call.us, float %sum.045.us)
  %inc22.us = add nuw nsw i32 %j9.046.us, 1
  %exitcond49.not = icmp eq i32 %inc22.us, %N
  br i1 %exitcond49.not, label %for.cond10.for.cond.cleanup13_crit_edge.us, label %for.body14.us, !llvm.loop !10

for.cond10.for.cond.cleanup13_crit_edge.us:       ; preds = %for.body14.us
  %arrayidx24.us = getelementptr inbounds float, ptr %result, i32 %i.048.us
  store float %2, ptr %arrayidx24.us, align 4, !tbaa !4
  %inc26.us = add nuw nsw i32 %i.048.us, 1
  %exitcond50.not = icmp eq i32 %inc26.us, %N
  br i1 %exitcond50.not, label %for.cond.cleanup7, label %for.cond10.preheader.us, !llvm.loop !12

for.body:                                         ; preds = %entry, %for.body
  %j.043 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %conv2 = sitofp i32 %j.043 to float
  %add = fadd float %conv2, 5.000000e-01
  %conv3 = fpext float %add to double
  %mul = fmul double %div, %conv3
  %arrayidx = getelementptr inbounds double, ptr %vla, i32 %j.043
  store double %mul, ptr %arrayidx, align 8, !tbaa !8
  %inc = add nuw nsw i32 %j.043, 1
  %exitcond.not = icmp eq i32 %inc, %N
  br i1 %exitcond.not, label %for.cond4.preheader, label %for.body, !llvm.loop !13

for.cond.cleanup7:                                ; preds = %for.cond10.for.cond.cleanup13_crit_edge.us, %entry, %for.cond4.preheader
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare dso_local float @cosf(float noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { nofree nounwind memory(write, argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nofree nounwind willreturn memory(write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"double", !6, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
