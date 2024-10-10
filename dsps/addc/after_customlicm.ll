; ModuleID = 'after_splitloopbylength.ll'
source_filename = "dsps_addc_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_addc_f32_ansi(ptr noundef readonly %input, ptr noundef writeonly %output, i32 noundef %len, float noundef %C, i32 noundef %step_in, i32 noundef %step_out) local_unnamed_addr #0 !esp32_p4_metadata !4 {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp4 = icmp sgt i32 %len, 2
  br i1 %cmp4, label %for.body, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp412 = icmp sgt i32 %len, 0
  br i1 %cmp412, label %for.body.clone, label %return

for.body:                                         ; preds = %for.body, %if.end
  %i.013 = phi i32 [ %inc, %for.body ], [ 0, %if.end ]
  %mul = mul nsw i32 %i.013, %step_in
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %mul
  %0 = load float, ptr %arrayidx, align 4, !tbaa !5
  %add = fadd float %0, %C
  %mul5 = mul nsw i32 %i.013, %step_out
  %arrayidx6 = getelementptr inbounds float, ptr %output, i32 %mul5
  store float %add, ptr %arrayidx6, align 4, !tbaa !5
  %inc = add nuw nsw i32 %i.013, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !9

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.013.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.013.clone, %step_in
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %mul.clone
  %1 = load float, ptr %arrayidx.clone, align 4, !tbaa !5
  %add.clone = fadd float %1, %C
  %mul5.clone = mul nsw i32 %i.013.clone, %step_out
  %arrayidx6.clone = getelementptr inbounds float, ptr %output, i32 %mul5.clone
  store float %add.clone, ptr %arrayidx6.clone, align 4, !tbaa !5
  %inc.clone = add nuw nsw i32 %i.013.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone, !llvm.loop !9

return:                                           ; preds = %for.body.clone, %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ], [ 0, %for.body.clone ]
  ret i32 %retval.0
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-172-g9dacbc0)"}
!4 = !{!"unroll_addc_like"}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
