; ModuleID = 'dsps_dotprode_f32_ansi.ll'
source_filename = "dsps_dotprode_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_dotprode_f32_ansi(ptr nocapture noundef readonly %src1, ptr nocapture noundef readonly %src2, ptr nocapture noundef writeonly %dest, i32 noundef %len, i32 noundef %step1, i32 noundef %step2) local_unnamed_addr #0 !esp32_p4_metadata !4 {
entry:
  %0 = icmp sgt i32 %len, 2
  br i1 %0, label %for.body, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp8 = icmp sgt i32 %len, 0
  br i1 %cmp8, label %for.body.clone, label %if.end

if.end:                                           ; preds = %for.body.clone, %for.body, %for.cond.preheader
  %acc.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %3, %for.body ], [ %6, %for.body.clone ]
  store float %acc.0.lcssa, ptr %dest, align 4, !tbaa !5
  ret i32 0

for.body:                                         ; preds = %entry, %for.body
  %i.010 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %acc.09 = phi float [ %3, %for.body ], [ 0.000000e+00, %entry ]
  %mul = mul nsw i32 %i.010, %step1
  %arrayidx = getelementptr inbounds float, ptr %src1, i32 %mul
  %1 = load float, ptr %arrayidx, align 4, !tbaa !5
  %mul1 = mul nsw i32 %i.010, %step2
  %arrayidx2 = getelementptr inbounds float, ptr %src2, i32 %mul1
  %2 = load float, ptr %arrayidx2, align 4, !tbaa !5
  %3 = tail call float @llvm.fmuladd.f32(float %1, float %2, float %acc.09)
  %inc = add nuw nsw i32 %i.010, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %if.end, label %for.body, !llvm.loop !9

for.body.clone:                                   ; preds = %for.cond.preheader, %for.body.clone
  %i.010.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %acc.09.clone = phi float [ %6, %for.body.clone ], [ 0.000000e+00, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.010.clone, %step1
  %arrayidx.clone = getelementptr inbounds float, ptr %src1, i32 %mul.clone
  %4 = load float, ptr %arrayidx.clone, align 4, !tbaa !5
  %mul1.clone = mul nsw i32 %i.010.clone, %step2
  %arrayidx2.clone = getelementptr inbounds float, ptr %src2, i32 %mul1.clone
  %5 = load float, ptr %arrayidx2.clone, align 4, !tbaa !5
  %6 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %acc.09.clone)
  %inc.clone = add nuw nsw i32 %i.010.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %if.end, label %for.body.clone, !llvm.loop !9
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-172-g9dacbc0)"}
!4 = !{!"unroll_dotprod_like"}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
