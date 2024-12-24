; ModuleID = 'dsps_biquad_f32_best.ll'
source_filename = "dsps_biquad_f32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_biquad_f32_ansi(ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len, ptr nocapture noundef readonly %coef, ptr nocapture noundef %w) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i32 %len, 2
  br i1 %cmp, label %for.cond.preheader, label %for.cond174.preheader

for.cond174.preheader:                            ; preds = %entry
  %cmp175372 = icmp sgt i32 %len, 0
  br i1 %cmp175372, label %for.body176.lr.ph, label %if.end

for.body176.lr.ph:                                ; preds = %for.cond174.preheader
  %arrayidx179 = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx182 = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx183 = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx186 = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx189 = getelementptr inbounds float, ptr %coef, i32 2
  %.pre = load float, ptr %w, align 4, !tbaa !4
  %.pre380 = load float, ptr %arrayidx183, align 4, !tbaa !4
  br label %for.body176

for.cond.preheader:                               ; preds = %entry
  %sub = add nsw i32 %len, -7
  %cmp1374 = icmp ugt i32 %len, 7
  br i1 %cmp1374, label %for.body.lr.ph, label %for.cond150.preheader

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %arrayidx2 = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx4 = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx5 = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx8 = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx11 = getelementptr inbounds float, ptr %coef, i32 2
  %.pre381 = load float, ptr %w, align 4, !tbaa !4
  %.pre382 = load float, ptr %arrayidx5, align 4, !tbaa !4
  br label %for.body

for.cond150.preheader:                            ; preds = %for.body, %for.cond.preheader
  %i.0.lcssa = phi i32 [ 0, %for.cond.preheader ], [ %add149, %for.body ]
  %cmp151376 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp151376, label %for.body152.lr.ph, label %if.end

for.body152.lr.ph:                                ; preds = %for.cond150.preheader
  %arrayidx155 = getelementptr inbounds float, ptr %coef, i32 3
  %arrayidx158 = getelementptr inbounds float, ptr %coef, i32 4
  %arrayidx159 = getelementptr inbounds float, ptr %w, i32 1
  %arrayidx162 = getelementptr inbounds float, ptr %coef, i32 1
  %arrayidx165 = getelementptr inbounds float, ptr %coef, i32 2
  %.pre383 = load float, ptr %w, align 4, !tbaa !4
  %.pre384 = load float, ptr %arrayidx159, align 4, !tbaa !4
  br label %for.body152

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %0 = phi float [ %.pre382, %for.body.lr.ph ], [ %89, %for.body ]
  %1 = phi float [ %.pre381, %for.body.lr.ph ], [ %83, %for.body ]
  %i.0375 = phi i32 [ 0, %for.body.lr.ph ], [ %add149, %for.body ]
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %i.0375
  %2 = load float, ptr %arrayidx, align 4, !tbaa !4
  %3 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %neg = fneg float %3
  %4 = tail call float @llvm.fmuladd.f32(float %neg, float %1, float %2)
  %5 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %neg6 = fneg float %5
  %6 = tail call float @llvm.fmuladd.f32(float %neg6, float %0, float %4)
  %7 = load float, ptr %coef, align 4, !tbaa !4
  %8 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul10 = fmul float %1, %8
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %6, float %mul10)
  %10 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %11 = tail call float @llvm.fmuladd.f32(float %10, float %0, float %9)
  %arrayidx13 = getelementptr inbounds float, ptr %output, i32 %i.0375
  store float %11, ptr %arrayidx13, align 4, !tbaa !4
  %12 = load float, ptr %w, align 4, !tbaa !4
  store float %12, ptr %arrayidx5, align 4, !tbaa !4
  store float %6, ptr %w, align 4, !tbaa !4
  %add = or disjoint i32 %i.0375, 1
  %arrayidx17 = getelementptr inbounds float, ptr %input, i32 %add
  %13 = load float, ptr %arrayidx17, align 4, !tbaa !4
  %14 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %neg20 = fneg float %14
  %15 = tail call float @llvm.fmuladd.f32(float %neg20, float %6, float %13)
  %16 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %neg23 = fneg float %16
  %17 = tail call float @llvm.fmuladd.f32(float %neg23, float %12, float %15)
  %18 = load float, ptr %coef, align 4, !tbaa !4
  %19 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul27 = fmul float %6, %19
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %17, float %mul27)
  %21 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %22 = tail call float @llvm.fmuladd.f32(float %21, float %12, float %20)
  %arrayidx31 = getelementptr inbounds float, ptr %output, i32 %add
  store float %22, ptr %arrayidx31, align 4, !tbaa !4
  %23 = load float, ptr %w, align 4, !tbaa !4
  store float %23, ptr %arrayidx5, align 4, !tbaa !4
  store float %17, ptr %w, align 4, !tbaa !4
  %add35 = or disjoint i32 %i.0375, 2
  %arrayidx36 = getelementptr inbounds float, ptr %input, i32 %add35
  %24 = load float, ptr %arrayidx36, align 4, !tbaa !4
  %25 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %neg39 = fneg float %25
  %26 = tail call float @llvm.fmuladd.f32(float %neg39, float %17, float %24)
  %27 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %neg42 = fneg float %27
  %28 = tail call float @llvm.fmuladd.f32(float %neg42, float %23, float %26)
  %29 = load float, ptr %coef, align 4, !tbaa !4
  %30 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul46 = fmul float %17, %30
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %28, float %mul46)
  %32 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %33 = tail call float @llvm.fmuladd.f32(float %32, float %23, float %31)
  %arrayidx50 = getelementptr inbounds float, ptr %output, i32 %add35
  store float %33, ptr %arrayidx50, align 4, !tbaa !4
  %34 = load float, ptr %w, align 4, !tbaa !4
  store float %34, ptr %arrayidx5, align 4, !tbaa !4
  store float %28, ptr %w, align 4, !tbaa !4
  %add54 = or disjoint i32 %i.0375, 3
  %arrayidx55 = getelementptr inbounds float, ptr %input, i32 %add54
  %35 = load float, ptr %arrayidx55, align 4, !tbaa !4
  %36 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %neg58 = fneg float %36
  %37 = tail call float @llvm.fmuladd.f32(float %neg58, float %28, float %35)
  %38 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %neg61 = fneg float %38
  %39 = tail call float @llvm.fmuladd.f32(float %neg61, float %34, float %37)
  %40 = load float, ptr %coef, align 4, !tbaa !4
  %41 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul65 = fmul float %28, %41
  %42 = tail call float @llvm.fmuladd.f32(float %40, float %39, float %mul65)
  %43 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %44 = tail call float @llvm.fmuladd.f32(float %43, float %34, float %42)
  %arrayidx69 = getelementptr inbounds float, ptr %output, i32 %add54
  store float %44, ptr %arrayidx69, align 4, !tbaa !4
  %45 = load float, ptr %w, align 4, !tbaa !4
  store float %45, ptr %arrayidx5, align 4, !tbaa !4
  store float %39, ptr %w, align 4, !tbaa !4
  %add73 = or disjoint i32 %i.0375, 4
  %arrayidx74 = getelementptr inbounds float, ptr %input, i32 %add73
  %46 = load float, ptr %arrayidx74, align 4, !tbaa !4
  %47 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %neg77 = fneg float %47
  %48 = tail call float @llvm.fmuladd.f32(float %neg77, float %39, float %46)
  %49 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %neg80 = fneg float %49
  %50 = tail call float @llvm.fmuladd.f32(float %neg80, float %45, float %48)
  %51 = load float, ptr %coef, align 4, !tbaa !4
  %52 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul84 = fmul float %39, %52
  %53 = tail call float @llvm.fmuladd.f32(float %51, float %50, float %mul84)
  %54 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %55 = tail call float @llvm.fmuladd.f32(float %54, float %45, float %53)
  %arrayidx88 = getelementptr inbounds float, ptr %output, i32 %add73
  store float %55, ptr %arrayidx88, align 4, !tbaa !4
  %56 = load float, ptr %w, align 4, !tbaa !4
  store float %56, ptr %arrayidx5, align 4, !tbaa !4
  store float %50, ptr %w, align 4, !tbaa !4
  %add92 = or disjoint i32 %i.0375, 5
  %arrayidx93 = getelementptr inbounds float, ptr %input, i32 %add92
  %57 = load float, ptr %arrayidx93, align 4, !tbaa !4
  %58 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %neg96 = fneg float %58
  %59 = tail call float @llvm.fmuladd.f32(float %neg96, float %50, float %57)
  %60 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %neg99 = fneg float %60
  %61 = tail call float @llvm.fmuladd.f32(float %neg99, float %56, float %59)
  %62 = load float, ptr %coef, align 4, !tbaa !4
  %63 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul103 = fmul float %50, %63
  %64 = tail call float @llvm.fmuladd.f32(float %62, float %61, float %mul103)
  %65 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %66 = tail call float @llvm.fmuladd.f32(float %65, float %56, float %64)
  %arrayidx107 = getelementptr inbounds float, ptr %output, i32 %add92
  store float %66, ptr %arrayidx107, align 4, !tbaa !4
  %67 = load float, ptr %w, align 4, !tbaa !4
  store float %67, ptr %arrayidx5, align 4, !tbaa !4
  store float %61, ptr %w, align 4, !tbaa !4
  %add111 = or disjoint i32 %i.0375, 6
  %arrayidx112 = getelementptr inbounds float, ptr %input, i32 %add111
  %68 = load float, ptr %arrayidx112, align 4, !tbaa !4
  %69 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %neg115 = fneg float %69
  %70 = tail call float @llvm.fmuladd.f32(float %neg115, float %61, float %68)
  %71 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %neg118 = fneg float %71
  %72 = tail call float @llvm.fmuladd.f32(float %neg118, float %67, float %70)
  %73 = load float, ptr %coef, align 4, !tbaa !4
  %74 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul122 = fmul float %61, %74
  %75 = tail call float @llvm.fmuladd.f32(float %73, float %72, float %mul122)
  %76 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %77 = tail call float @llvm.fmuladd.f32(float %76, float %67, float %75)
  %arrayidx126 = getelementptr inbounds float, ptr %output, i32 %add111
  store float %77, ptr %arrayidx126, align 4, !tbaa !4
  %78 = load float, ptr %w, align 4, !tbaa !4
  store float %78, ptr %arrayidx5, align 4, !tbaa !4
  store float %72, ptr %w, align 4, !tbaa !4
  %add130 = or disjoint i32 %i.0375, 7
  %arrayidx131 = getelementptr inbounds float, ptr %input, i32 %add130
  %79 = load float, ptr %arrayidx131, align 4, !tbaa !4
  %80 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %neg134 = fneg float %80
  %81 = tail call float @llvm.fmuladd.f32(float %neg134, float %72, float %79)
  %82 = load float, ptr %arrayidx4, align 4, !tbaa !4
  %neg137 = fneg float %82
  %83 = tail call float @llvm.fmuladd.f32(float %neg137, float %78, float %81)
  %84 = load float, ptr %coef, align 4, !tbaa !4
  %85 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul141 = fmul float %72, %85
  %86 = tail call float @llvm.fmuladd.f32(float %84, float %83, float %mul141)
  %87 = load float, ptr %arrayidx11, align 4, !tbaa !4
  %88 = tail call float @llvm.fmuladd.f32(float %87, float %78, float %86)
  %arrayidx145 = getelementptr inbounds float, ptr %output, i32 %add130
  store float %88, ptr %arrayidx145, align 4, !tbaa !4
  %89 = load float, ptr %w, align 4, !tbaa !4
  store float %89, ptr %arrayidx5, align 4, !tbaa !4
  store float %83, ptr %w, align 4, !tbaa !4
  %add149 = add nuw nsw i32 %i.0375, 8
  %cmp1 = icmp slt i32 %add149, %sub
  br i1 %cmp1, label %for.body, label %for.cond150.preheader, !llvm.loop !8

for.body152:                                      ; preds = %for.body152, %for.body152.lr.ph
  %90 = phi float [ %.pre384, %for.body152.lr.ph ], [ %102, %for.body152 ]
  %91 = phi float [ %.pre383, %for.body152.lr.ph ], [ %96, %for.body152 ]
  %i.1377 = phi i32 [ %i.0.lcssa, %for.body152.lr.ph ], [ %inc, %for.body152 ]
  %arrayidx154 = getelementptr inbounds float, ptr %input, i32 %i.1377
  %92 = load float, ptr %arrayidx154, align 4, !tbaa !4
  %93 = load float, ptr %arrayidx155, align 4, !tbaa !4
  %neg157 = fneg float %93
  %94 = tail call float @llvm.fmuladd.f32(float %neg157, float %91, float %92)
  %95 = load float, ptr %arrayidx158, align 4, !tbaa !4
  %neg160 = fneg float %95
  %96 = tail call float @llvm.fmuladd.f32(float %neg160, float %90, float %94)
  %97 = load float, ptr %coef, align 4, !tbaa !4
  %98 = load float, ptr %arrayidx162, align 4, !tbaa !4
  %mul164 = fmul float %91, %98
  %99 = tail call float @llvm.fmuladd.f32(float %97, float %96, float %mul164)
  %100 = load float, ptr %arrayidx165, align 4, !tbaa !4
  %101 = tail call float @llvm.fmuladd.f32(float %100, float %90, float %99)
  %arrayidx167 = getelementptr inbounds float, ptr %output, i32 %i.1377
  store float %101, ptr %arrayidx167, align 4, !tbaa !4
  %102 = load float, ptr %w, align 4, !tbaa !4
  store float %102, ptr %arrayidx159, align 4, !tbaa !4
  store float %96, ptr %w, align 4, !tbaa !4
  %inc = add nuw nsw i32 %i.1377, 1
  %exitcond379.not = icmp eq i32 %inc, %len
  br i1 %exitcond379.not, label %if.end, label %for.body152, !llvm.loop !10

for.body176:                                      ; preds = %for.body176, %for.body176.lr.ph
  %103 = phi float [ %.pre380, %for.body176.lr.ph ], [ %115, %for.body176 ]
  %104 = phi float [ %.pre, %for.body176.lr.ph ], [ %109, %for.body176 ]
  %i173.0373 = phi i32 [ 0, %for.body176.lr.ph ], [ %inc196, %for.body176 ]
  %arrayidx178 = getelementptr inbounds float, ptr %input, i32 %i173.0373
  %105 = load float, ptr %arrayidx178, align 4, !tbaa !4
  %106 = load float, ptr %arrayidx179, align 4, !tbaa !4
  %neg181 = fneg float %106
  %107 = tail call float @llvm.fmuladd.f32(float %neg181, float %104, float %105)
  %108 = load float, ptr %arrayidx182, align 4, !tbaa !4
  %neg184 = fneg float %108
  %109 = tail call float @llvm.fmuladd.f32(float %neg184, float %103, float %107)
  %110 = load float, ptr %coef, align 4, !tbaa !4
  %111 = load float, ptr %arrayidx186, align 4, !tbaa !4
  %mul188 = fmul float %104, %111
  %112 = tail call float @llvm.fmuladd.f32(float %110, float %109, float %mul188)
  %113 = load float, ptr %arrayidx189, align 4, !tbaa !4
  %114 = tail call float @llvm.fmuladd.f32(float %113, float %103, float %112)
  %arrayidx191 = getelementptr inbounds float, ptr %output, i32 %i173.0373
  store float %114, ptr %arrayidx191, align 4, !tbaa !4
  %115 = load float, ptr %w, align 4, !tbaa !4
  store float %115, ptr %arrayidx183, align 4, !tbaa !4
  store float %109, ptr %w, align 4, !tbaa !4
  %inc196 = add nuw nsw i32 %i173.0373, 1
  %exitcond.not = icmp eq i32 %inc196, %len
  br i1 %exitcond.not, label %if.end, label %for.body176, !llvm.loop !11

if.end:                                           ; preds = %for.body176, %for.body152, %for.cond150.preheader, %for.cond174.preheader
  ret i32 0
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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
