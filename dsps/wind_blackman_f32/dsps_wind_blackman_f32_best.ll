; ModuleID = 'dsps_wind_blackman_f32_best.c'
source_filename = "dsps_wind_blackman_f32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree nounwind memory(write)
define dso_local void @dsps_wind_blackman_f32_arp4(ptr nocapture noundef writeonly %window, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %sub = add nsw i32 %len, -1
  %conv = sitofp i32 %sub to float
  %div = fdiv float 1.000000e+00, %conv
  %conv1 = fpext float %div to double
  %mul = fmul double %conv1, 0x401921FB54442D18
  %conv2 = fptrunc double %mul to float
  %mul3 = fmul float %conv2, 2.000000e+00
  %sub4 = add nsw i32 %len, -7
  %cmp169 = icmp sgt i32 %len, 7
  br i1 %cmp169, label %for.body, label %for.cond97.preheader

for.cond97.preheader:                             ; preds = %for.body, %entry
  %i.0.lcssa = phi i32 [ 0, %entry ], [ %add96, %for.body ]
  %cmp98171 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp98171, label %for.body100, label %for.end111

for.body:                                         ; preds = %entry, %for.body
  %i.0170 = phi i32 [ %add96, %for.body ], [ 0, %entry ]
  %conv6 = sitofp i32 %i.0170 to float
  %mul7 = fmul float %conv2, %conv6
  %call = tail call float @cosf(float noundef %mul7) #3
  %0 = tail call float @llvm.fmuladd.f32(float %call, float -5.000000e-01, float 0x3FDAE147A0000000)
  %mul10 = fmul float %mul3, %conv6
  %call11 = tail call float @cosf(float noundef %mul10) #3
  %1 = tail call float @llvm.fmuladd.f32(float %call11, float 0x3FB47AE140000000, float %0)
  %arrayidx = getelementptr inbounds float, ptr %window, i32 %i.0170
  store float %1, ptr %arrayidx, align 4, !tbaa !4
  %add = or disjoint i32 %i.0170, 1
  %conv13 = sitofp i32 %add to float
  %mul14 = fmul float %conv2, %conv13
  %call15 = tail call float @cosf(float noundef %mul14) #3
  %2 = tail call float @llvm.fmuladd.f32(float %call15, float -5.000000e-01, float 0x3FDAE147A0000000)
  %mul19 = fmul float %mul3, %conv13
  %call20 = tail call float @cosf(float noundef %mul19) #3
  %3 = tail call float @llvm.fmuladd.f32(float %call20, float 0x3FB47AE140000000, float %2)
  %arrayidx23 = getelementptr inbounds float, ptr %window, i32 %add
  store float %3, ptr %arrayidx23, align 4, !tbaa !4
  %add24 = or disjoint i32 %i.0170, 2
  %conv25 = sitofp i32 %add24 to float
  %mul26 = fmul float %conv2, %conv25
  %call27 = tail call float @cosf(float noundef %mul26) #3
  %4 = tail call float @llvm.fmuladd.f32(float %call27, float -5.000000e-01, float 0x3FDAE147A0000000)
  %mul31 = fmul float %mul3, %conv25
  %call32 = tail call float @cosf(float noundef %mul31) #3
  %5 = tail call float @llvm.fmuladd.f32(float %call32, float 0x3FB47AE140000000, float %4)
  %arrayidx35 = getelementptr inbounds float, ptr %window, i32 %add24
  store float %5, ptr %arrayidx35, align 4, !tbaa !4
  %add36 = or disjoint i32 %i.0170, 3
  %conv37 = sitofp i32 %add36 to float
  %mul38 = fmul float %conv2, %conv37
  %call39 = tail call float @cosf(float noundef %mul38) #3
  %6 = tail call float @llvm.fmuladd.f32(float %call39, float -5.000000e-01, float 0x3FDAE147A0000000)
  %mul43 = fmul float %mul3, %conv37
  %call44 = tail call float @cosf(float noundef %mul43) #3
  %7 = tail call float @llvm.fmuladd.f32(float %call44, float 0x3FB47AE140000000, float %6)
  %arrayidx47 = getelementptr inbounds float, ptr %window, i32 %add36
  store float %7, ptr %arrayidx47, align 4, !tbaa !4
  %add48 = or disjoint i32 %i.0170, 4
  %conv49 = sitofp i32 %add48 to float
  %mul50 = fmul float %conv2, %conv49
  %call51 = tail call float @cosf(float noundef %mul50) #3
  %8 = tail call float @llvm.fmuladd.f32(float %call51, float -5.000000e-01, float 0x3FDAE147A0000000)
  %mul55 = fmul float %mul3, %conv49
  %call56 = tail call float @cosf(float noundef %mul55) #3
  %9 = tail call float @llvm.fmuladd.f32(float %call56, float 0x3FB47AE140000000, float %8)
  %arrayidx59 = getelementptr inbounds float, ptr %window, i32 %add48
  store float %9, ptr %arrayidx59, align 4, !tbaa !4
  %add60 = or disjoint i32 %i.0170, 5
  %conv61 = sitofp i32 %add60 to float
  %mul62 = fmul float %conv2, %conv61
  %call63 = tail call float @cosf(float noundef %mul62) #3
  %10 = tail call float @llvm.fmuladd.f32(float %call63, float -5.000000e-01, float 0x3FDAE147A0000000)
  %mul67 = fmul float %mul3, %conv61
  %call68 = tail call float @cosf(float noundef %mul67) #3
  %11 = tail call float @llvm.fmuladd.f32(float %call68, float 0x3FB47AE140000000, float %10)
  %arrayidx71 = getelementptr inbounds float, ptr %window, i32 %add60
  store float %11, ptr %arrayidx71, align 4, !tbaa !4
  %add72 = or disjoint i32 %i.0170, 6
  %conv73 = sitofp i32 %add72 to float
  %mul74 = fmul float %conv2, %conv73
  %call75 = tail call float @cosf(float noundef %mul74) #3
  %12 = tail call float @llvm.fmuladd.f32(float %call75, float -5.000000e-01, float 0x3FDAE147A0000000)
  %mul79 = fmul float %mul3, %conv73
  %call80 = tail call float @cosf(float noundef %mul79) #3
  %13 = tail call float @llvm.fmuladd.f32(float %call80, float 0x3FB47AE140000000, float %12)
  %arrayidx83 = getelementptr inbounds float, ptr %window, i32 %add72
  store float %13, ptr %arrayidx83, align 4, !tbaa !4
  %add84 = or disjoint i32 %i.0170, 7
  %conv85 = sitofp i32 %add84 to float
  %mul86 = fmul float %conv2, %conv85
  %call87 = tail call float @cosf(float noundef %mul86) #3
  %14 = tail call float @llvm.fmuladd.f32(float %call87, float -5.000000e-01, float 0x3FDAE147A0000000)
  %mul91 = fmul float %mul3, %conv85
  %call92 = tail call float @cosf(float noundef %mul91) #3
  %15 = tail call float @llvm.fmuladd.f32(float %call92, float 0x3FB47AE140000000, float %14)
  %arrayidx95 = getelementptr inbounds float, ptr %window, i32 %add84
  store float %15, ptr %arrayidx95, align 4, !tbaa !4
  %add96 = add nuw nsw i32 %i.0170, 8
  %cmp = icmp slt i32 %add96, %sub4
  br i1 %cmp, label %for.body, label %for.cond97.preheader, !llvm.loop !8

for.body100:                                      ; preds = %for.cond97.preheader, %for.body100
  %i.1172 = phi i32 [ %inc, %for.body100 ], [ %i.0.lcssa, %for.cond97.preheader ]
  %conv101 = sitofp i32 %i.1172 to float
  %mul102 = fmul float %conv2, %conv101
  %call103 = tail call float @cosf(float noundef %mul102) #3
  %16 = tail call float @llvm.fmuladd.f32(float %call103, float -5.000000e-01, float 0x3FDAE147A0000000)
  %mul106 = fmul float %mul3, %conv101
  %call107 = tail call float @cosf(float noundef %mul106) #3
  %17 = tail call float @llvm.fmuladd.f32(float %call107, float 0x3FB47AE140000000, float %16)
  %arrayidx109 = getelementptr inbounds float, ptr %window, i32 %i.1172
  store float %17, ptr %arrayidx109, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.1172, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %for.end111, label %for.body100, !llvm.loop !10

for.end111:                                       ; preds = %for.body100, %for.cond97.preheader
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare dso_local float @cosf(float noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { nofree nounwind memory(write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nofree nounwind willreturn memory(write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
