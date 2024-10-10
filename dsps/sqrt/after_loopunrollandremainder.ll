; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_sqrt_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local float @dsps_sqrtf_f32_ansi(float noundef %f) local_unnamed_addr #0 {
entry:
  %0 = bitcast float %f to i32
  %shr = ashr i32 %0, 1
  %add = add nsw i32 %shr, 532365312
  %1 = bitcast i32 %add to float
  ret float %1
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_sqrt_f32_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, i32 noundef %len) local_unnamed_addr #1 !esp32_p4_metadata !4 {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp4 = icmp sgt i32 %len, 2
  br i1 %cmp4, label %for.cond.preheader.new, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp411 = icmp sgt i32 %len, 0
  br i1 %cmp411, label %for.body.clone, label %return

for.cond.preheader.new:                           ; preds = %if.end
  %sub = add nsw i32 %len, -16
  %cmp6.not207 = icmp ult i32 %len, 16
  br i1 %cmp6.not207, label %for.cond.preheader.new2, label %for.body.modify

for.cond.preheader.new2:                          ; preds = %for.body.modify, %for.cond.preheader.new
  %0 = phi i32 [ %47, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %cmp85209 = icmp slt i32 %0, %len
  br i1 %cmp85209, label %for.body, label %return

for.body.modify:                                  ; preds = %for.cond.preheader.new, %for.body.modify
  %i.012.modify = phi i32 [ %47, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %add = or disjoint i32 %i.012.modify, 1
  %add3 = or disjoint i32 %i.012.modify, 2
  %add7 = or disjoint i32 %i.012.modify, 3
  %add10 = or disjoint i32 %i.012.modify, 4
  %add13 = or disjoint i32 %i.012.modify, 5
  %add16 = or disjoint i32 %i.012.modify, 6
  %add19 = or disjoint i32 %i.012.modify, 7
  %add22 = or disjoint i32 %i.012.modify, 8
  %add25 = or disjoint i32 %i.012.modify, 9
  %add28 = or disjoint i32 %i.012.modify, 10
  %add31 = or disjoint i32 %i.012.modify, 11
  %add34 = or disjoint i32 %i.012.modify, 12
  %add37 = or disjoint i32 %i.012.modify, 13
  %add40 = or disjoint i32 %i.012.modify, 14
  %add43 = or disjoint i32 %i.012.modify, 15
  %arrayidx.modify = getelementptr inbounds float, ptr %input, i32 %i.012.modify
  %arrayidx5.modify = getelementptr inbounds float, ptr %output, i32 %i.012.modify
  %arrayidx1 = getelementptr inbounds float, ptr %input, i32 %add
  %arrayidx2 = getelementptr inbounds float, ptr %output, i32 %add
  %arrayidx4 = getelementptr inbounds float, ptr %input, i32 %add3
  %arrayidx6 = getelementptr inbounds float, ptr %output, i32 %add3
  %arrayidx8 = getelementptr inbounds float, ptr %input, i32 %add7
  %arrayidx9 = getelementptr inbounds float, ptr %output, i32 %add7
  %arrayidx11 = getelementptr inbounds float, ptr %input, i32 %add10
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %add10
  %arrayidx14 = getelementptr inbounds float, ptr %input, i32 %add13
  %arrayidx15 = getelementptr inbounds float, ptr %output, i32 %add13
  %arrayidx17 = getelementptr inbounds float, ptr %input, i32 %add16
  %arrayidx18 = getelementptr inbounds float, ptr %output, i32 %add16
  %arrayidx20 = getelementptr inbounds float, ptr %input, i32 %add19
  %arrayidx21 = getelementptr inbounds float, ptr %output, i32 %add19
  %arrayidx23 = getelementptr inbounds float, ptr %input, i32 %add22
  %arrayidx24 = getelementptr inbounds float, ptr %output, i32 %add22
  %arrayidx26 = getelementptr inbounds float, ptr %input, i32 %add25
  %arrayidx27 = getelementptr inbounds float, ptr %output, i32 %add25
  %arrayidx29 = getelementptr inbounds float, ptr %input, i32 %add28
  %arrayidx30 = getelementptr inbounds float, ptr %output, i32 %add28
  %arrayidx32 = getelementptr inbounds float, ptr %input, i32 %add31
  %arrayidx33 = getelementptr inbounds float, ptr %output, i32 %add31
  %arrayidx35 = getelementptr inbounds float, ptr %input, i32 %add34
  %arrayidx36 = getelementptr inbounds float, ptr %output, i32 %add34
  %arrayidx38 = getelementptr inbounds float, ptr %input, i32 %add37
  %arrayidx39 = getelementptr inbounds float, ptr %output, i32 %add37
  %arrayidx41 = getelementptr inbounds float, ptr %input, i32 %add40
  %arrayidx42 = getelementptr inbounds float, ptr %output, i32 %add40
  %arrayidx44 = getelementptr inbounds float, ptr %input, i32 %add43
  %arrayidx45 = getelementptr inbounds float, ptr %output, i32 %add43
  %1 = load i32, ptr %arrayidx.modify, align 4, !tbaa !5
  %2 = load i32, ptr %arrayidx1, align 4, !tbaa !5
  %3 = load i32, ptr %arrayidx4, align 4, !tbaa !5
  %4 = load i32, ptr %arrayidx8, align 4, !tbaa !5
  %5 = load i32, ptr %arrayidx11, align 4, !tbaa !5
  %6 = load i32, ptr %arrayidx14, align 4, !tbaa !5
  %7 = load i32, ptr %arrayidx17, align 4, !tbaa !5
  %8 = load i32, ptr %arrayidx20, align 4, !tbaa !5
  %9 = load i32, ptr %arrayidx23, align 4, !tbaa !5
  %10 = load i32, ptr %arrayidx26, align 4, !tbaa !5
  %11 = load i32, ptr %arrayidx29, align 4, !tbaa !5
  %12 = load i32, ptr %arrayidx32, align 4, !tbaa !5
  %13 = load i32, ptr %arrayidx35, align 4, !tbaa !5
  %14 = load i32, ptr %arrayidx38, align 4, !tbaa !5
  %15 = load i32, ptr %arrayidx41, align 4, !tbaa !5
  %16 = load i32, ptr %arrayidx44, align 4, !tbaa !5
  %shr.i.modify = ashr i32 %1, 1
  %add.i.modify = add nsw i32 %shr.i.modify, 532365312
  %17 = ashr i32 %2, 1
  %18 = add nsw i32 %17, 532365312
  %19 = ashr i32 %3, 1
  %20 = add nsw i32 %19, 532365312
  %21 = ashr i32 %4, 1
  %22 = add nsw i32 %21, 532365312
  %23 = ashr i32 %5, 1
  %24 = add nsw i32 %23, 532365312
  %25 = ashr i32 %6, 1
  %26 = add nsw i32 %25, 532365312
  %27 = ashr i32 %7, 1
  %28 = add nsw i32 %27, 532365312
  %29 = ashr i32 %8, 1
  %30 = add nsw i32 %29, 532365312
  %31 = ashr i32 %9, 1
  %32 = add nsw i32 %31, 532365312
  %33 = ashr i32 %10, 1
  %34 = add nsw i32 %33, 532365312
  %35 = ashr i32 %11, 1
  %36 = add nsw i32 %35, 532365312
  %37 = ashr i32 %12, 1
  %38 = add nsw i32 %37, 532365312
  %39 = ashr i32 %13, 1
  %40 = add nsw i32 %39, 532365312
  %41 = ashr i32 %14, 1
  %42 = add nsw i32 %41, 532365312
  %43 = ashr i32 %15, 1
  %44 = add nsw i32 %43, 532365312
  %45 = ashr i32 %16, 1
  %46 = add nsw i32 %45, 532365312
  store i32 %46, ptr %arrayidx45, align 4, !tbaa !5
  store i32 %44, ptr %arrayidx42, align 4, !tbaa !5
  store i32 %42, ptr %arrayidx39, align 4, !tbaa !5
  store i32 %40, ptr %arrayidx36, align 4, !tbaa !5
  store i32 %38, ptr %arrayidx33, align 4, !tbaa !5
  store i32 %36, ptr %arrayidx30, align 4, !tbaa !5
  store i32 %34, ptr %arrayidx27, align 4, !tbaa !5
  store i32 %32, ptr %arrayidx24, align 4, !tbaa !5
  store i32 %30, ptr %arrayidx21, align 4, !tbaa !5
  store i32 %28, ptr %arrayidx18, align 4, !tbaa !5
  store i32 %26, ptr %arrayidx15, align 4, !tbaa !5
  store i32 %24, ptr %arrayidx12, align 4, !tbaa !5
  store i32 %22, ptr %arrayidx9, align 4, !tbaa !5
  store i32 %20, ptr %arrayidx6, align 4, !tbaa !5
  store i32 %18, ptr %arrayidx2, align 4, !tbaa !5
  store i32 %add.i.modify, ptr %arrayidx5.modify, align 4, !tbaa !5
  %47 = add nuw i32 %i.012.modify, 16
  %exitcond.not.modify = icmp sgt i32 %47, %sub
  br i1 %exitcond.not.modify, label %for.cond.preheader.new2, label %for.body.modify, !llvm.loop !9

for.body:                                         ; preds = %for.cond.preheader.new2, %for.body
  %i.012 = phi i32 [ %inc, %for.body ], [ %0, %for.cond.preheader.new2 ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.012
  %48 = load i32, ptr %arrayidx, align 4, !tbaa !5
  %shr.i = ashr i32 %48, 1
  %add.i = add nsw i32 %shr.i, 532365312
  %arrayidx5 = getelementptr inbounds float, ptr %output, i32 %i.012
  store i32 %add.i, ptr %arrayidx5, align 4, !tbaa !5
  %inc = add nuw nsw i32 %i.012, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !9

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.012.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %i.012.clone
  %49 = load i32, ptr %arrayidx.clone, align 4, !tbaa !5
  %shr.i.clone = ashr i32 %49, 1
  %add.i.clone = add nsw i32 %shr.i.clone, 532365312
  %arrayidx5.clone = getelementptr inbounds float, ptr %output, i32 %i.012.clone
  store i32 %add.i.clone, ptr %arrayidx5.clone, align 4, !tbaa !5
  %inc.clone = add nuw nsw i32 %i.012.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone, !llvm.loop !9

return:                                           ; preds = %for.cond.preheader.new2, %for.body.clone, %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ], [ 0, %for.body.clone ], [ 0, %for.cond.preheader.new2 ]
  ret i32 %retval.0
}

attributes #0 = { inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

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
