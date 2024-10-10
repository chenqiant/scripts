; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_corr_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_corr_f32_ansi(ptr noalias noundef readonly %Signal, i32 noundef %siglen, ptr noalias noundef readonly %Pattern, i32 noundef %patlen, ptr noalias noundef writeonly %dest) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %Signal, null
  %cmp1 = icmp eq ptr %Pattern, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %dest, null
  %or.cond33 = or i1 %or.cond, %cmp4
  %cmp7 = icmp slt i32 %siglen, %patlen
  %or.cond34 = or i1 %cmp7, %or.cond33
  br i1 %or.cond34, label %return, label %if.end

if.end:                                           ; preds = %entry
  %sub = sub nsw i32 %siglen, %patlen
  %sub6 = add nsw i32 %sub, -15
  %cmp1235.not = icmp sgt i32 %sub, 15
  br i1 %cmp1235.not, label %for.cond8.preheader.lr.ph, label %for.cond91.preheader

for.cond8.preheader.lr.ph:                        ; preds = %if.end
  %cmp9242 = icmp sgt i32 %patlen, 0
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.cond.cleanup, %for.cond8.preheader.lr.ph
  %n.0276 = phi i32 [ 0, %for.cond8.preheader.lr.ph ], [ %add89, %for.cond.cleanup ]
  br i1 %cmp9242, label %for.body10.lr.ph, label %for.cond.cleanup

for.body10.lr.ph:                                 ; preds = %for.cond8.preheader
  %0 = getelementptr float, ptr %Signal, i32 %n.0276
  br label %for.body14.us.unroll

for.cond91.preheader:                             ; preds = %for.cond.cleanup, %if.end
  %n.0.lcssa = phi i32 [ 0, %if.end ], [ %add89, %for.cond.cleanup ]
  %cmp92.not282 = icmp sgt i32 %n.0.lcssa, %sub
  br i1 %cmp92.not282, label %return, label %for.cond95.preheader.lr.ph

for.cond95.preheader.lr.ph:                       ; preds = %for.cond91.preheader
  %Cmp92678 = icmp sgt i32 %patlen, 0
  br i1 %Cmp92678, label %for.cond11.preheader.us.preheader, label %for.cond11.preheader.preheader

for.cond11.preheader.preheader:                   ; preds = %for.cond95.preheader.lr.ph
  %1 = shl i32 %n.0.lcssa, 2
  %scevgep = getelementptr i8, ptr %dest, i32 %1
  %2 = add i32 %siglen, 1
  %3 = add i32 %n.0.lcssa, %patlen
  %4 = sub i32 %2, %3
  %5 = shl i32 %4, 2
  tail call void @llvm.memset.p0.i32(ptr nonnull align 4 %scevgep, i8 0, i32 %5, i1 false), !tbaa !4
  br label %return

for.cond11.preheader.us.preheader:                ; preds = %for.cond95.preheader.lr.ph
  %6 = add i32 %siglen, 1
  %7 = sub i32 %6, %patlen
  br label %for.cond11.preheader.us

for.cond11.preheader.us:                          ; preds = %for.cond11.for.cond.cleanup13_crit_edge.us, %for.cond11.preheader.us.preheader
  %n.038.us = phi i32 [ %inc18.us, %for.cond11.for.cond.cleanup13_crit_edge.us ], [ %n.0.lcssa, %for.cond11.preheader.us.preheader ]
  %8 = getelementptr float, ptr %Signal, i32 %n.038.us
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us, %for.cond11.preheader.us
  %m.037.us = phi i32 [ 0, %for.cond11.preheader.us ], [ %inc.us, %for.body14.us ]
  %k_corr.036.us = phi float [ 0.000000e+00, %for.cond11.preheader.us ], [ %11, %for.body14.us ]
  %arrayidx.us = getelementptr float, ptr %8, i32 %m.037.us
  %9 = load float, ptr %arrayidx.us, align 4, !tbaa !4
  %arrayidx15.us = getelementptr inbounds float, ptr %Pattern, i32 %m.037.us
  %10 = load float, ptr %arrayidx15.us, align 4, !tbaa !4
  %11 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %k_corr.036.us)
  %inc.us = add nuw i32 %m.037.us, 1
  %exitcond.not = icmp eq i32 %inc.us, %patlen
  br i1 %exitcond.not, label %for.cond11.for.cond.cleanup13_crit_edge.us, label %for.body14.us, !llvm.loop !8

for.cond11.for.cond.cleanup13_crit_edge.us:       ; preds = %for.body14.us
  %arrayidx16.us = getelementptr inbounds float, ptr %dest, i32 %n.038.us
  store float %11, ptr %arrayidx16.us, align 4, !tbaa !4
  %inc18.us = add nuw i32 %n.038.us, 1
  %cmp10.not.us.not = icmp eq i32 %n.038.us, %7
  br i1 %cmp10.not.us.not, label %return, label %for.cond11.preheader.us, !llvm.loop !10

for.cond.cleanup:                                 ; preds = %for.body14.us.unroll, %for.cond8.preheader
  %12 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %60, %for.body14.us.unroll ]
  %13 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %61, %for.body14.us.unroll ]
  %14 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %62, %for.body14.us.unroll ]
  %15 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %63, %for.body14.us.unroll ]
  %16 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %64, %for.body14.us.unroll ]
  %17 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %65, %for.body14.us.unroll ]
  %18 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %66, %for.body14.us.unroll ]
  %19 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %67, %for.body14.us.unroll ]
  %20 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %68, %for.body14.us.unroll ]
  %21 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %69, %for.body14.us.unroll ]
  %22 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %70, %for.body14.us.unroll ]
  %23 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %71, %for.body14.us.unroll ]
  %24 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %72, %for.body14.us.unroll ]
  %25 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %73, %for.body14.us.unroll ]
  %26 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %74, %for.body14.us.unroll ]
  %27 = phi float [ 0.000000e+00, %for.cond8.preheader ], [ %75, %for.body14.us.unroll ]
  %add = or disjoint i32 %n.0276, 1
  %add17 = or disjoint i32 %n.0276, 2
  %add19 = or disjoint i32 %n.0276, 3
  %add21 = or disjoint i32 %n.0276, 4
  %add23 = or disjoint i32 %n.0276, 5
  %add25 = or disjoint i32 %n.0276, 6
  %add27 = or disjoint i32 %n.0276, 7
  %add29 = or disjoint i32 %n.0276, 8
  %add31 = or disjoint i32 %n.0276, 9
  %add33 = or disjoint i32 %n.0276, 10
  %add35 = or disjoint i32 %n.0276, 11
  %add37 = or disjoint i32 %n.0276, 12
  %add39 = or disjoint i32 %n.0276, 13
  %add41 = or disjoint i32 %n.0276, 14
  %add43 = or disjoint i32 %n.0276, 15
  %arrayidx = getelementptr float, ptr %dest, i32 %n.0276
  %arrayidx16 = getelementptr float, ptr %dest, i32 %add
  %arrayidx18 = getelementptr float, ptr %dest, i32 %add17
  %arrayidx20 = getelementptr float, ptr %dest, i32 %add19
  %arrayidx22 = getelementptr float, ptr %dest, i32 %add21
  %arrayidx24 = getelementptr float, ptr %dest, i32 %add23
  %arrayidx26 = getelementptr float, ptr %dest, i32 %add25
  %arrayidx28 = getelementptr float, ptr %dest, i32 %add27
  %arrayidx30 = getelementptr float, ptr %dest, i32 %add29
  %arrayidx32 = getelementptr float, ptr %dest, i32 %add31
  %arrayidx34 = getelementptr float, ptr %dest, i32 %add33
  %arrayidx36 = getelementptr float, ptr %dest, i32 %add35
  %arrayidx38 = getelementptr float, ptr %dest, i32 %add37
  %arrayidx40 = getelementptr float, ptr %dest, i32 %add39
  %arrayidx42 = getelementptr float, ptr %dest, i32 %add41
  %arrayidx44 = getelementptr float, ptr %dest, i32 %add43
  store float %27, ptr %arrayidx44, align 4
  store float %26, ptr %arrayidx42, align 4
  store float %25, ptr %arrayidx40, align 4
  store float %24, ptr %arrayidx38, align 4
  store float %23, ptr %arrayidx36, align 4
  store float %22, ptr %arrayidx34, align 4
  store float %21, ptr %arrayidx32, align 4
  store float %20, ptr %arrayidx30, align 4
  store float %19, ptr %arrayidx28, align 4
  store float %18, ptr %arrayidx26, align 4
  store float %17, ptr %arrayidx24, align 4
  store float %16, ptr %arrayidx22, align 4
  store float %15, ptr %arrayidx20, align 4
  store float %14, ptr %arrayidx18, align 4
  store float %13, ptr %arrayidx16, align 4
  store float %12, ptr %arrayidx, align 4
  %add89 = add nuw nsw i32 %n.0276, 16
  %cmp745 = icmp slt i32 %add89, %sub6
  br i1 %cmp745, label %for.cond8.preheader, label %for.cond91.preheader

for.body14.us.unroll:                             ; preds = %for.body10.lr.ph, %for.body14.us.unroll
  %m.037.us.unroll = phi i32 [ 0, %for.body10.lr.ph ], [ %inc.us.unroll, %for.body14.us.unroll ]
  %k_corr.036.us.unroll = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %60, %for.body14.us.unroll ]
  %28 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %61, %for.body14.us.unroll ]
  %29 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %62, %for.body14.us.unroll ]
  %30 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %63, %for.body14.us.unroll ]
  %31 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %64, %for.body14.us.unroll ]
  %32 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %65, %for.body14.us.unroll ]
  %33 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %66, %for.body14.us.unroll ]
  %34 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %67, %for.body14.us.unroll ]
  %35 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %68, %for.body14.us.unroll ]
  %36 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %69, %for.body14.us.unroll ]
  %37 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %70, %for.body14.us.unroll ]
  %38 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %71, %for.body14.us.unroll ]
  %39 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %72, %for.body14.us.unroll ]
  %40 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %73, %for.body14.us.unroll ]
  %41 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %74, %for.body14.us.unroll ]
  %42 = phi float [ 0.000000e+00, %for.body10.lr.ph ], [ %75, %for.body14.us.unroll ]
  %arrayidx15.us.unroll = getelementptr inbounds float, ptr %Pattern, i32 %m.037.us.unroll
  %arrayidx.us.unroll = getelementptr float, ptr %0, i32 %m.037.us.unroll
  %arrayidx1 = getelementptr float, ptr %arrayidx15.us.unroll, i32 1
  %arrayidx2 = getelementptr float, ptr %arrayidx15.us.unroll, i32 2
  %arrayidx3 = getelementptr float, ptr %arrayidx15.us.unroll, i32 3
  %arrayidx4 = getelementptr float, ptr %arrayidx15.us.unroll, i32 4
  %arrayidx5 = getelementptr float, ptr %arrayidx15.us.unroll, i32 5
  %arrayidx6 = getelementptr float, ptr %arrayidx15.us.unroll, i32 6
  %arrayidx7 = getelementptr float, ptr %arrayidx15.us.unroll, i32 7
  %arrayidx8 = getelementptr float, ptr %arrayidx15.us.unroll, i32 8
  %arrayidx9 = getelementptr float, ptr %arrayidx15.us.unroll, i32 9
  %arrayidx10 = getelementptr float, ptr %arrayidx15.us.unroll, i32 10
  %arrayidx11 = getelementptr float, ptr %arrayidx15.us.unroll, i32 11
  %arrayidx12 = getelementptr float, ptr %arrayidx15.us.unroll, i32 12
  %arrayidx13 = getelementptr float, ptr %arrayidx15.us.unroll, i32 13
  %arrayidx14 = getelementptr float, ptr %arrayidx15.us.unroll, i32 14
  %arrayidx15 = getelementptr float, ptr %arrayidx15.us.unroll, i32 15
  %43 = load float, ptr %arrayidx15.us.unroll, align 4, !tbaa !4
  %44 = load float, ptr %arrayidx.us.unroll, align 4, !tbaa !4
  %45 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %46 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %47 = load float, ptr %arrayidx3, align 4, !tbaa !4
  %48 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %49 = load float, ptr %arrayidx5, align 4, !tbaa !4
  %50 = load float, ptr %arrayidx6, align 4, !tbaa !4
  %51 = load float, ptr %arrayidx7, align 4, !tbaa !4
  %52 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %53 = load float, ptr %arrayidx9, align 4, !tbaa !4
  %54 = load float, ptr %arrayidx10, align 4, !tbaa !4
  %55 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %56 = load float, ptr %arrayidx12, align 4, !tbaa !4
  %57 = load float, ptr %arrayidx13, align 4, !tbaa !4
  %58 = load float, ptr %arrayidx14, align 4, !tbaa !4
  %59 = load float, ptr %arrayidx15, align 4, !tbaa !4
  %60 = tail call float @llvm.fmuladd.f32(float %44, float %43, float %k_corr.036.us.unroll)
  %61 = tail call float @llvm.fmuladd.f32(float %45, float %43, float %28)
  %62 = tail call float @llvm.fmuladd.f32(float %46, float %43, float %29)
  %63 = tail call float @llvm.fmuladd.f32(float %47, float %43, float %30)
  %64 = tail call float @llvm.fmuladd.f32(float %48, float %43, float %31)
  %65 = tail call float @llvm.fmuladd.f32(float %49, float %43, float %32)
  %66 = tail call float @llvm.fmuladd.f32(float %50, float %43, float %33)
  %67 = tail call float @llvm.fmuladd.f32(float %51, float %43, float %34)
  %68 = tail call float @llvm.fmuladd.f32(float %52, float %43, float %35)
  %69 = tail call float @llvm.fmuladd.f32(float %53, float %43, float %36)
  %70 = tail call float @llvm.fmuladd.f32(float %54, float %43, float %37)
  %71 = tail call float @llvm.fmuladd.f32(float %55, float %43, float %38)
  %72 = tail call float @llvm.fmuladd.f32(float %56, float %43, float %39)
  %73 = tail call float @llvm.fmuladd.f32(float %57, float %43, float %40)
  %74 = tail call float @llvm.fmuladd.f32(float %58, float %43, float %41)
  %75 = tail call float @llvm.fmuladd.f32(float %59, float %43, float %42)
  %inc.us.unroll = add nuw i32 %m.037.us.unroll, 1
  %exitcond.not.unroll = icmp eq i32 %inc.us.unroll, %patlen
  br i1 %exitcond.not.unroll, label %for.cond.cleanup, label %for.body14.us.unroll, !llvm.loop !8

return:                                           ; preds = %for.cond11.for.cond.cleanup13_crit_edge.us, %for.cond91.preheader, %for.cond11.preheader.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond11.preheader.preheader ], [ 0, %for.cond11.for.cond.cleanup13_crit_edge.us ], [ 0, %for.cond91.preheader ]
  ret i32 %retval.0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr nocapture writeonly, i8, i32, i1 immarg) #2

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-172-g9dacbc0)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
