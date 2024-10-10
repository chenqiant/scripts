; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define dso_local float @test_loop(ptr nocapture noundef readonly %data1, ptr nocapture noundef readonly %data2, i32 noundef %start_index, i32 noundef %end_index, i32 noundef %update1, i32 noundef %update2, float noundef %offset) local_unnamed_addr #0 {
entry:
  %invariant.gep = getelementptr float, ptr %data1, i32 %update1
  %invariant.gep8 = getelementptr float, ptr %data2, i32 %update2
  %cmp10 = icmp slt i32 %start_index, %end_index
  br i1 %cmp10, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.body, %entry
  %result.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add3, %for.body ]
  ret float %result.0.lcssa

for.body:                                         ; preds = %entry, %for.body
  %i.012 = phi i32 [ %inc, %for.body ], [ %start_index, %entry ]
  %result.011 = phi float [ %add3, %for.body ], [ 0.000000e+00, %entry ]
  %gep = getelementptr float, ptr %invariant.gep, i32 %i.012
  %0 = load float, ptr %gep, align 4, !tbaa !4
  %gep9 = getelementptr float, ptr %invariant.gep8, i32 %i.012
  %1 = load float, ptr %gep9, align 4, !tbaa !4
  %2 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %offset)
  %add3 = fadd float %result.011, %2
  %inc = add nsw i32 %i.012, 1
  %exitcond.not = icmp eq i32 %inc, %end_index
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !8
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240815-28-gc81a262 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-41-g37c20ad8 esp-18.1.2_20240815-49-g6d94704 esp-18.1.2_20240815-51-gd38faa8 esp-18.1.2_20240815-51-gd38faa8 esp-18.1.2_20240829-52-gea35320 esp-18.1.2_20240829-55-g7607179 esp-18.1.2_20240829-55-g7607179 esp-18.1.2_20240829-55-g7607179 esp-18.1.2_20240829 esp-18.1.2_20240829-62-gc926ada esp-18.1.2_20240829-64-g3274136 esp-18.1.2_20240829-66-gd6973ee esp-18.1.2_20240829-66-gd6973ee esp-18.1.2_20240912-67-g79e337e esp-18.1.2_20240912-71-gbb3778d esp-18.1.2_20240912-71-gbb3778d esp-18.1.2_20240912-72-g9403131)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
