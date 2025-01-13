; ModuleID = 'dspm_mult_ex_f32_ansi.ll'
source_filename = "dspm_mult_ex_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dspm_mult_ex_f32_ansi(ptr noundef readonly %A, ptr noundef readonly %B, ptr noundef writeonly %C, i32 noundef %A_rows, i32 noundef %A_cols, i32 noundef %B_cols, i32 noundef %A_padding, i32 noundef %B_padding, i32 noundef %C_padding) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %A, null
  %cmp1 = icmp eq ptr %B, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %C, null
  %or.cond87 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %A_rows, 1
  %or.cond88 = or i1 %or.cond87, %cmp7
  %cmp10 = icmp slt i32 %A_cols, 1
  %or.cond89 = or i1 %or.cond88, %cmp10
  %cmp13 = icmp slt i32 %B_cols, 1
  %or.cond90 = or i1 %or.cond89, %cmp13
  %0 = or i32 %B_padding, %A_padding
  %1 = or i32 %0, %C_padding
  %2 = icmp slt i32 %1, 0
  %or.cond93 = or i1 %or.cond90, %2
  br i1 %or.cond93, label %return, label %if.end24

if.end24:                                         ; preds = %entry
  %add = add nuw nsw i32 %A_padding, %A_cols
  %add25 = add nuw nsw i32 %B_padding, %B_cols
  %add26 = add nuw nsw i32 %C_padding, %B_cols
  %cmp3894 = icmp ugt i32 %A_cols, 1
  br label %for.body31.lr.ph

for.body31.lr.ph:                                 ; preds = %for.cond.cleanup30, %if.end24
  %i.098 = phi i32 [ 0, %if.end24 ], [ %inc55, %for.cond.cleanup30 ]
  %mul = mul nsw i32 %i.098, %add
  %arrayidx = getelementptr inbounds float, ptr %A, i32 %mul
  %mul34 = mul nsw i32 %i.098, %add26
  %3 = getelementptr float, ptr %C, i32 %mul34
  br label %for.body31

for.cond.cleanup30:                               ; preds = %for.cond.cleanup39
  %inc55 = add nuw nsw i32 %i.098, 1
  %exitcond100.not = icmp eq i32 %inc55, %A_rows
  br i1 %exitcond100.not, label %return, label %for.body31.lr.ph, !llvm.loop !4

for.body31:                                       ; preds = %for.cond.cleanup39, %for.body31.lr.ph
  %j.097 = phi i32 [ 0, %for.body31.lr.ph ], [ %inc52, %for.cond.cleanup39 ]
  %4 = load float, ptr %arrayidx, align 4, !tbaa !6
  %arrayidx32 = getelementptr float, ptr %B, i32 %j.097
  %5 = load float, ptr %arrayidx32, align 4, !tbaa !6
  %mul33 = fmul float %4, %5
  %arrayidx36 = getelementptr float, ptr %3, i32 %j.097
  store float %mul33, ptr %arrayidx36, align 4, !tbaa !6
  br i1 %cmp3894, label %for.body40, label %for.cond.cleanup39

for.cond.cleanup39:                               ; preds = %for.body40, %for.body31
  %inc52 = add nuw nsw i32 %j.097, 1
  %exitcond99.not = icmp eq i32 %inc52, %B_cols
  br i1 %exitcond99.not, label %for.cond.cleanup30, label %for.body31, !llvm.loop !10

for.body40:                                       ; preds = %for.body40, %for.body31
  %6 = phi float [ %9, %for.body40 ], [ %mul33, %for.body31 ]
  %s.095 = phi i32 [ %inc, %for.body40 ], [ 1, %for.body31 ]
  %arrayidx43 = getelementptr float, ptr %arrayidx, i32 %s.095
  %7 = load float, ptr %arrayidx43, align 4, !tbaa !6
  %mul44 = mul nsw i32 %s.095, %add25
  %gep = getelementptr float, ptr %arrayidx32, i32 %mul44
  %8 = load float, ptr %gep, align 4, !tbaa !6
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %6)
  store float %9, ptr %arrayidx36, align 4, !tbaa !6
  %inc = add nuw nsw i32 %s.095, 1
  %exitcond.not = icmp eq i32 %inc, %A_cols
  br i1 %exitcond.not, label %for.cond.cleanup39, label %for.body40, !llvm.loop !11

return:                                           ; preds = %for.cond.cleanup30, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.cleanup30 ]
  ret i32 %retval.0
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
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !5}
!11 = distinct !{!11, !5}
