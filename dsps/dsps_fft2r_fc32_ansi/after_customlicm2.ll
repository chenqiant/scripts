; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_fft2r_fc32_ansi.c"
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
  %cmp103 = icmp sgt i32 %N, 1
  br i1 %cmp103, label %for.cond3.preheader.preheader, label %return

for.cond3.preheader.preheader:                    ; preds = %if.end2
  %scevgep = getelementptr i8, ptr %data, i32 4
  %scevgep5 = getelementptr i8, ptr %data, i32 4
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond3.preheader.preheader, %for.cond.cleanup5
  %N2.0105.in = phi i32 [ %N2.0105, %for.cond.cleanup5 ], [ %N, %for.cond3.preheader.preheader ]
  %ie.0104 = phi i32 [ %shl, %for.cond.cleanup5 ], [ 1, %for.cond3.preheader.preheader ]
  %N2.0105 = lshr i32 %N2.0105.in, 1
  %cmp4100 = icmp sgt i32 %ie.0104, 0
  br i1 %cmp4100, label %for.body6.lr.ph, label %for.cond.cleanup5

for.body6.lr.ph:                                  ; preds = %for.cond3.preheader
  %cmp1097.not = icmp ult i32 %N2.0105.in, 2
  br label %for.body6

for.cond.cleanup5.loopexit:                       ; preds = %for.cond.cleanup11
  br label %for.cond.cleanup5

for.cond.cleanup5:                                ; preds = %for.cond.cleanup5.loopexit, %for.cond3.preheader
  %shl = shl i32 %ie.0104, 1
  %cmp.not = icmp ult i32 %N2.0105.in, 4
  br i1 %cmp.not, label %return.loopexit, label %for.cond3.preheader, !llvm.loop !7

for.body6:                                        ; preds = %for.cond.cleanup11, %for.body6.lr.ph
  %j.0102 = phi i32 [ 0, %for.body6.lr.ph ], [ %inc54, %for.cond.cleanup11 ]
  %ia.0101 = phi i32 [ 0, %for.body6.lr.ph ], [ %add52, %for.cond.cleanup11 ]
  %mul = shl nuw nsw i32 %j.0102, 1
  %arrayidx = getelementptr inbounds float, ptr %w, i32 %mul
  %1 = load float, ptr %arrayidx, align 4, !tbaa !9
  %add = or disjoint i32 %mul, 1
  %arrayidx8 = getelementptr inbounds float, ptr %w, i32 %add
  %2 = load float, ptr %arrayidx8, align 4, !tbaa !9
  br i1 %cmp1097.not, label %for.cond.cleanup11, label %for.body12.lr.ph

for.body12.lr.ph:                                 ; preds = %for.body6
  %3 = fneg float %2
  %4 = add i32 %N2.0105, %ia.0101
  %5 = shl i32 %4, 3
  %scevgep1 = getelementptr i8, ptr %scevgep, i32 %5
  %6 = shl i32 %ia.0101, 3
  %scevgep6 = getelementptr i8, ptr %scevgep5, i32 %6
  br label %for.body12

for.cond.cleanup11.loopexit:                      ; preds = %for.body12
  br label %for.cond.cleanup11

for.cond.cleanup11:                               ; preds = %for.cond.cleanup11.loopexit, %for.body6
  %ia.1.lcssa = phi i32 [ %ia.0101, %for.body6 ], [ %4, %for.cond.cleanup11.loopexit ]
  %add52 = add nsw i32 %ia.1.lcssa, %N2.0105
  %inc54 = add nuw nsw i32 %j.0102, 1
  %exitcond106.not = icmp eq i32 %inc54, %ie.0104
  br i1 %exitcond106.not, label %for.cond.cleanup5.loopexit, label %for.body6, !llvm.loop !11

for.body12:                                       ; preds = %for.body12, %for.body12.lr.ph
  %lsr.iv7 = phi ptr [ %scevgep8, %for.body12 ], [ %scevgep6, %for.body12.lr.ph ]
  %lsr.iv2 = phi ptr [ %scevgep3, %for.body12 ], [ %scevgep1, %for.body12.lr.ph ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %for.body12 ], [ %N2.0105, %for.body12.lr.ph ]
  %scevgep4 = getelementptr i8, ptr %lsr.iv2, i32 -4
  %7 = load float, ptr %scevgep4, align 4, !tbaa !9
  %8 = load float, ptr %lsr.iv2, align 4, !tbaa !9
  %mul20 = fmul float %2, %8
  %9 = tail call float @llvm.fmuladd.f32(float %1, float %7, float %mul20)
  %neg = fmul float %7, %3
  %10 = tail call float @llvm.fmuladd.f32(float %1, float %8, float %neg)
  %scevgep9 = getelementptr i8, ptr %lsr.iv7, i32 -4
  %11 = load float, ptr %scevgep9, align 4, !tbaa !9
  %sub = fsub float %11, %9
  store float %sub, ptr %scevgep4, align 4, !tbaa !9
  %12 = load float, ptr %lsr.iv7, align 4, !tbaa !9
  %sub35 = fsub float %12, %10
  store float %sub35, ptr %lsr.iv2, align 4, !tbaa !9
  %add41 = fadd float %11, %9
  store float %add41, ptr %scevgep9, align 4, !tbaa !9
  %add47 = fadd float %10, %12
  store float %add47, ptr %lsr.iv7, align 4, !tbaa !9
  %lsr.iv.next = add nsw i32 %lsr.iv, -1
  %scevgep3 = getelementptr i8, ptr %lsr.iv2, i32 8
  %scevgep8 = getelementptr i8, ptr %lsr.iv7, i32 8
  %exitcond.not = icmp eq i32 %lsr.iv.next, 0
  br i1 %exitcond.not, label %for.cond.cleanup11.loopexit, label %for.body12, !llvm.loop !12

return.loopexit:                                  ; preds = %for.cond.cleanup5
  br label %return

return:                                           ; preds = %return.loopexit, %if.end2, %if.end, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 458756, %if.end ], [ 0, %if.end2 ], [ 0, %return.loopexit ]
  ret i32 %retval.0
}

declare dso_local zeroext i1 @dsp_is_power_of_two(i32 noundef) local_unnamed_addr #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
