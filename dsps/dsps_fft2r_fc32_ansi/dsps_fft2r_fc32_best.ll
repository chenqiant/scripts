; ModuleID = 'dsps_fft2r_fc32_best.c'
source_filename = "dsps_fft2r_fc32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

@dsps_fft2r_initialized = external dso_local local_unnamed_addr global i8, align 1

; Function Attrs: nounwind
define dso_local noundef i32 @dsps_fft2r_fc32_arp4_(ptr nocapture noundef %data, i32 noundef %N, ptr nocapture noundef readonly %w) local_unnamed_addr #0 {
entry:
  %call = tail call zeroext i1 @dsp_is_power_of_two(i32 noundef %N) #3
  br i1 %call, label %if.end, label %return

if.end:                                           ; preds = %entry
  %0 = load i8, ptr @dsps_fft2r_initialized, align 1, !tbaa !4
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %return, label %if.end2

if.end2:                                          ; preds = %if.end
  %cmp367 = icmp sgt i32 %N, 1
  br i1 %cmp367, label %for.cond3.preheader, label %return

for.cond3.preheader:                              ; preds = %if.end2, %for.cond.cleanup5
  %N2.0369.in = phi i32 [ %N2.0369, %for.cond.cleanup5 ], [ %N, %if.end2 ]
  %ie.0368 = phi i32 [ %shl, %for.cond.cleanup5 ], [ 1, %if.end2 ]
  %N2.0369 = lshr i32 %N2.0369.in, 1
  %cmp4364 = icmp sgt i32 %ie.0368, 0
  br i1 %cmp4364, label %for.body6.lr.ph, label %for.cond.cleanup5

for.body6.lr.ph:                                  ; preds = %for.cond3.preheader
  %sub = add nsw i32 %N2.0369, -3
  %cmp10356 = icmp ugt i32 %N2.0369.in, 7
  %1 = and i32 %N2.0369, 1073741820
  br label %for.body6

for.cond.cleanup5:                                ; preds = %for.end171, %for.cond3.preheader
  %shl = shl i32 %ie.0368, 1
  %cmp.not = icmp ult i32 %N2.0369.in, 4
  br i1 %cmp.not, label %return, label %for.cond3.preheader, !llvm.loop !7

for.body6:                                        ; preds = %for.body6.lr.ph, %for.end171
  %j.0366 = phi i32 [ 0, %for.body6.lr.ph ], [ %inc174, %for.end171 ]
  %ia.0365 = phi i32 [ 0, %for.body6.lr.ph ], [ %add172, %for.end171 ]
  %mul = shl nuw nsw i32 %j.0366, 1
  %arrayidx = getelementptr inbounds float, ptr %w, i32 %mul
  %2 = load float, ptr %arrayidx, align 4, !tbaa !9
  %add = or disjoint i32 %mul, 1
  %arrayidx8 = getelementptr inbounds float, ptr %w, i32 %add
  %3 = load float, ptr %arrayidx8, align 4, !tbaa !9
  br i1 %cmp10356, label %for.body11.lr.ph, label %for.cond135.preheader

for.body11.lr.ph:                                 ; preds = %for.body6
  %4 = fneg float %3
  br label %for.body11

for.cond135.preheader:                            ; preds = %for.body11, %for.body6
  %ia.1.lcssa = phi i32 [ %ia.0365, %for.body6 ], [ %inc133, %for.body11 ]
  %i.0.lcssa = phi i32 [ 0, %for.body6 ], [ %1, %for.body11 ]
  %cmp136360 = icmp ult i32 %i.0.lcssa, %N2.0369
  br i1 %cmp136360, label %for.body137.lr.ph, label %for.end171

for.body137.lr.ph:                                ; preds = %for.cond135.preheader
  %5 = fneg float %3
  br label %for.body137

for.body11:                                       ; preds = %for.body11.lr.ph, %for.body11
  %i.0358 = phi i32 [ 0, %for.body11.lr.ph ], [ %add134, %for.body11 ]
  %ia.1357 = phi i32 [ %ia.0365, %for.body11.lr.ph ], [ %inc133, %for.body11 ]
  %add12 = add nsw i32 %ia.1357, %N2.0369
  %mul13 = shl nsw i32 %ia.1357, 1
  %arrayidx14 = getelementptr inbounds float, ptr %data, i32 %mul13
  %6 = load float, ptr %arrayidx14, align 4, !tbaa !9
  %add16 = or disjoint i32 %mul13, 1
  %arrayidx17 = getelementptr inbounds float, ptr %data, i32 %add16
  %7 = load float, ptr %arrayidx17, align 4, !tbaa !9
  %mul18 = shl nsw i32 %add12, 1
  %arrayidx19 = getelementptr inbounds float, ptr %data, i32 %mul18
  %8 = load float, ptr %arrayidx19, align 4, !tbaa !9
  %add21 = or disjoint i32 %mul18, 1
  %arrayidx22 = getelementptr inbounds float, ptr %data, i32 %add21
  %9 = load float, ptr %arrayidx22, align 4, !tbaa !9
  %mul24 = fmul float %3, %9
  %10 = tail call float @llvm.fmuladd.f32(float %2, float %8, float %mul24)
  %neg = fmul float %8, %4
  %11 = tail call float @llvm.fmuladd.f32(float %2, float %9, float %neg)
  %sub27 = fsub float %6, %10
  store float %sub27, ptr %arrayidx19, align 4, !tbaa !9
  %sub30 = fsub float %7, %11
  store float %sub30, ptr %arrayidx22, align 4, !tbaa !9
  %add34 = fadd float %6, %10
  store float %add34, ptr %arrayidx14, align 4, !tbaa !9
  %add37 = fadd float %7, %11
  store float %add37, ptr %arrayidx17, align 4, !tbaa !9
  %inc = add nsw i32 %ia.1357, 1
  %add41 = add nsw i32 %inc, %N2.0369
  %mul42 = shl nsw i32 %inc, 1
  %arrayidx43 = getelementptr inbounds float, ptr %data, i32 %mul42
  %12 = load float, ptr %arrayidx43, align 4, !tbaa !9
  %add45 = or disjoint i32 %mul42, 1
  %arrayidx46 = getelementptr inbounds float, ptr %data, i32 %add45
  %13 = load float, ptr %arrayidx46, align 4, !tbaa !9
  %mul47 = shl nsw i32 %add41, 1
  %arrayidx48 = getelementptr inbounds float, ptr %data, i32 %mul47
  %14 = load float, ptr %arrayidx48, align 4, !tbaa !9
  %add50 = or disjoint i32 %mul47, 1
  %arrayidx51 = getelementptr inbounds float, ptr %data, i32 %add50
  %15 = load float, ptr %arrayidx51, align 4, !tbaa !9
  %mul53 = fmul float %3, %15
  %16 = tail call float @llvm.fmuladd.f32(float %2, float %14, float %mul53)
  %neg56 = fmul float %14, %4
  %17 = tail call float @llvm.fmuladd.f32(float %2, float %15, float %neg56)
  %sub57 = fsub float %12, %16
  store float %sub57, ptr %arrayidx48, align 4, !tbaa !9
  %sub60 = fsub float %13, %17
  store float %sub60, ptr %arrayidx51, align 4, !tbaa !9
  %add64 = fadd float %12, %16
  store float %add64, ptr %arrayidx43, align 4, !tbaa !9
  %add67 = fadd float %13, %17
  store float %add67, ptr %arrayidx46, align 4, !tbaa !9
  %inc71 = add nsw i32 %ia.1357, 2
  %add72 = add nsw i32 %inc71, %N2.0369
  %mul73 = shl nsw i32 %inc71, 1
  %arrayidx74 = getelementptr inbounds float, ptr %data, i32 %mul73
  %18 = load float, ptr %arrayidx74, align 4, !tbaa !9
  %add76 = or disjoint i32 %mul73, 1
  %arrayidx77 = getelementptr inbounds float, ptr %data, i32 %add76
  %19 = load float, ptr %arrayidx77, align 4, !tbaa !9
  %mul78 = shl nsw i32 %add72, 1
  %arrayidx79 = getelementptr inbounds float, ptr %data, i32 %mul78
  %20 = load float, ptr %arrayidx79, align 4, !tbaa !9
  %add81 = or disjoint i32 %mul78, 1
  %arrayidx82 = getelementptr inbounds float, ptr %data, i32 %add81
  %21 = load float, ptr %arrayidx82, align 4, !tbaa !9
  %mul84 = fmul float %3, %21
  %22 = tail call float @llvm.fmuladd.f32(float %2, float %20, float %mul84)
  %neg87 = fmul float %20, %4
  %23 = tail call float @llvm.fmuladd.f32(float %2, float %21, float %neg87)
  %sub88 = fsub float %18, %22
  store float %sub88, ptr %arrayidx79, align 4, !tbaa !9
  %sub91 = fsub float %19, %23
  store float %sub91, ptr %arrayidx82, align 4, !tbaa !9
  %add95 = fadd float %18, %22
  store float %add95, ptr %arrayidx74, align 4, !tbaa !9
  %add98 = fadd float %19, %23
  store float %add98, ptr %arrayidx77, align 4, !tbaa !9
  %inc102 = add nsw i32 %ia.1357, 3
  %add103 = add nsw i32 %inc102, %N2.0369
  %mul104 = shl nsw i32 %inc102, 1
  %arrayidx105 = getelementptr inbounds float, ptr %data, i32 %mul104
  %24 = load float, ptr %arrayidx105, align 4, !tbaa !9
  %add107 = or disjoint i32 %mul104, 1
  %arrayidx108 = getelementptr inbounds float, ptr %data, i32 %add107
  %25 = load float, ptr %arrayidx108, align 4, !tbaa !9
  %mul109 = shl nsw i32 %add103, 1
  %arrayidx110 = getelementptr inbounds float, ptr %data, i32 %mul109
  %26 = load float, ptr %arrayidx110, align 4, !tbaa !9
  %add112 = or disjoint i32 %mul109, 1
  %arrayidx113 = getelementptr inbounds float, ptr %data, i32 %add112
  %27 = load float, ptr %arrayidx113, align 4, !tbaa !9
  %mul115 = fmul float %3, %27
  %28 = tail call float @llvm.fmuladd.f32(float %2, float %26, float %mul115)
  %neg118 = fmul float %26, %4
  %29 = tail call float @llvm.fmuladd.f32(float %2, float %27, float %neg118)
  %sub119 = fsub float %24, %28
  store float %sub119, ptr %arrayidx110, align 4, !tbaa !9
  %sub122 = fsub float %25, %29
  store float %sub122, ptr %arrayidx113, align 4, !tbaa !9
  %add126 = fadd float %24, %28
  store float %add126, ptr %arrayidx105, align 4, !tbaa !9
  %add129 = fadd float %25, %29
  store float %add129, ptr %arrayidx108, align 4, !tbaa !9
  %inc133 = add nsw i32 %ia.1357, 4
  %add134 = add nuw nsw i32 %i.0358, 4
  %cmp10 = icmp slt i32 %add134, %sub
  br i1 %cmp10, label %for.body11, label %for.cond135.preheader, !llvm.loop !11

for.body137:                                      ; preds = %for.body137.lr.ph, %for.body137
  %i.1362 = phi i32 [ %i.0.lcssa, %for.body137.lr.ph ], [ %inc170, %for.body137 ]
  %ia.2361 = phi i32 [ %ia.1.lcssa, %for.body137.lr.ph ], [ %inc168, %for.body137 ]
  %add138 = add nsw i32 %ia.2361, %N2.0369
  %mul139 = shl nsw i32 %ia.2361, 1
  %arrayidx140 = getelementptr inbounds float, ptr %data, i32 %mul139
  %30 = load float, ptr %arrayidx140, align 4, !tbaa !9
  %add142 = or disjoint i32 %mul139, 1
  %arrayidx143 = getelementptr inbounds float, ptr %data, i32 %add142
  %31 = load float, ptr %arrayidx143, align 4, !tbaa !9
  %mul144 = shl nsw i32 %add138, 1
  %arrayidx145 = getelementptr inbounds float, ptr %data, i32 %mul144
  %32 = load float, ptr %arrayidx145, align 4, !tbaa !9
  %add147 = or disjoint i32 %mul144, 1
  %arrayidx148 = getelementptr inbounds float, ptr %data, i32 %add147
  %33 = load float, ptr %arrayidx148, align 4, !tbaa !9
  %mul150 = fmul float %3, %33
  %34 = tail call float @llvm.fmuladd.f32(float %2, float %32, float %mul150)
  %neg153 = fmul float %32, %5
  %35 = tail call float @llvm.fmuladd.f32(float %2, float %33, float %neg153)
  %sub154 = fsub float %30, %34
  store float %sub154, ptr %arrayidx145, align 4, !tbaa !9
  %sub157 = fsub float %31, %35
  store float %sub157, ptr %arrayidx148, align 4, !tbaa !9
  %add161 = fadd float %30, %34
  store float %add161, ptr %arrayidx140, align 4, !tbaa !9
  %add164 = fadd float %31, %35
  store float %add164, ptr %arrayidx143, align 4, !tbaa !9
  %inc168 = add nsw i32 %ia.2361, 1
  %inc170 = add nuw nsw i32 %i.1362, 1
  %exitcond.not = icmp eq i32 %inc170, %N2.0369
  br i1 %exitcond.not, label %for.end171, label %for.body137, !llvm.loop !12

for.end171:                                       ; preds = %for.body137, %for.cond135.preheader
  %ia.2.lcssa = phi i32 [ %ia.1.lcssa, %for.cond135.preheader ], [ %inc168, %for.body137 ]
  %add172 = add nsw i32 %ia.2.lcssa, %N2.0369
  %inc174 = add nuw nsw i32 %j.0366, 1
  %exitcond370.not = icmp eq i32 %inc174, %ie.0368
  br i1 %exitcond370.not, label %for.cond.cleanup5, label %for.body6, !llvm.loop !13

return:                                           ; preds = %for.cond.cleanup5, %if.end2, %if.end, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 458756, %if.end ], [ 0, %if.end2 ], [ 0, %for.cond.cleanup5 ]
  ret i32 %retval.0
}

declare dso_local zeroext i1 @dsp_is_power_of_two(i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !5, i64 0}
!11 = distinct !{!11, !8}
!12 = distinct !{!12, !8}
!13 = distinct !{!13, !8}
