; ModuleID = 'after_customlicm.ll'
source_filename = "dsps_add_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_add_f32_ansi(ptr noalias noundef readonly %input1, ptr noalias noundef readonly %input2, ptr noalias noundef writeonly %output, i32 noundef %len, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out) local_unnamed_addr #0 !esp32_p4_metadata !4 {
entry:
  %cmp = icmp eq ptr %input1, null
  %cmp1 = icmp eq ptr %input2, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %output, null
  %or.cond19 = or i1 %or.cond, %cmp4
  br i1 %or.cond19, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp41 = icmp sgt i32 %len, 2
  br i1 %cmp41, label %for.cond.preheader.new, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp720 = icmp sgt i32 %len, 0
  br i1 %cmp720, label %for.body.clone, label %return

for.cond.preheader.new:                           ; preds = %if.end
  %sub = add nsw i32 %len, -16
  %cmp6.not207 = icmp ult i32 %len, 16
  br i1 %cmp6.not207, label %for.cond.preheader.new2, label %for.body.modify

for.cond.preheader.new2:                          ; preds = %for.body.modify, %for.cond.preheader.new
  %0 = phi i32 [ %33, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %cmp85209 = icmp slt i32 %0, %len
  br i1 %cmp85209, label %for.body, label %return

for.body.modify:                                  ; preds = %for.cond.preheader.new, %for.body.modify
  %i.021.modify = phi i32 [ %33, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %add2 = or disjoint i32 %i.021.modify, 1
  %add7 = or disjoint i32 %i.021.modify, 2
  %add13 = or disjoint i32 %i.021.modify, 3
  %add18 = or disjoint i32 %i.021.modify, 4
  %add23 = or disjoint i32 %i.021.modify, 5
  %add28 = or disjoint i32 %i.021.modify, 6
  %add33 = or disjoint i32 %i.021.modify, 7
  %add38 = or disjoint i32 %i.021.modify, 8
  %add43 = or disjoint i32 %i.021.modify, 9
  %add48 = or disjoint i32 %i.021.modify, 10
  %add53 = or disjoint i32 %i.021.modify, 11
  %add58 = or disjoint i32 %i.021.modify, 12
  %add63 = or disjoint i32 %i.021.modify, 13
  %add68 = or disjoint i32 %i.021.modify, 14
  %add73 = or disjoint i32 %i.021.modify, 15
  %arrayidx.modify = getelementptr inbounds float, ptr %input1, i32 %i.021.modify
  %arrayidx9.modify = getelementptr inbounds float, ptr %input2, i32 %i.021.modify
  %arrayidx11.modify = getelementptr inbounds float, ptr %output, i32 %i.021.modify
  %arrayidx3 = getelementptr inbounds float, ptr %input1, i32 %add2
  %arrayidx4 = getelementptr inbounds float, ptr %input2, i32 %add2
  %arrayidx6 = getelementptr inbounds float, ptr %output, i32 %add2
  %arrayidx8 = getelementptr inbounds float, ptr %input1, i32 %add7
  %arrayidx10 = getelementptr inbounds float, ptr %input2, i32 %add7
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %add7
  %arrayidx14 = getelementptr inbounds float, ptr %input1, i32 %add13
  %arrayidx15 = getelementptr inbounds float, ptr %input2, i32 %add13
  %arrayidx17 = getelementptr inbounds float, ptr %output, i32 %add13
  %arrayidx19 = getelementptr inbounds float, ptr %input1, i32 %add18
  %arrayidx20 = getelementptr inbounds float, ptr %input2, i32 %add18
  %arrayidx22 = getelementptr inbounds float, ptr %output, i32 %add18
  %arrayidx24 = getelementptr inbounds float, ptr %input1, i32 %add23
  %arrayidx25 = getelementptr inbounds float, ptr %input2, i32 %add23
  %arrayidx27 = getelementptr inbounds float, ptr %output, i32 %add23
  %arrayidx29 = getelementptr inbounds float, ptr %input1, i32 %add28
  %arrayidx30 = getelementptr inbounds float, ptr %input2, i32 %add28
  %arrayidx32 = getelementptr inbounds float, ptr %output, i32 %add28
  %arrayidx34 = getelementptr inbounds float, ptr %input1, i32 %add33
  %arrayidx35 = getelementptr inbounds float, ptr %input2, i32 %add33
  %arrayidx37 = getelementptr inbounds float, ptr %output, i32 %add33
  %arrayidx39 = getelementptr inbounds float, ptr %input1, i32 %add38
  %arrayidx40 = getelementptr inbounds float, ptr %input2, i32 %add38
  %arrayidx42 = getelementptr inbounds float, ptr %output, i32 %add38
  %arrayidx44 = getelementptr inbounds float, ptr %input1, i32 %add43
  %arrayidx45 = getelementptr inbounds float, ptr %input2, i32 %add43
  %arrayidx47 = getelementptr inbounds float, ptr %output, i32 %add43
  %arrayidx49 = getelementptr inbounds float, ptr %input1, i32 %add48
  %arrayidx50 = getelementptr inbounds float, ptr %input2, i32 %add48
  %arrayidx52 = getelementptr inbounds float, ptr %output, i32 %add48
  %arrayidx54 = getelementptr inbounds float, ptr %input1, i32 %add53
  %arrayidx55 = getelementptr inbounds float, ptr %input2, i32 %add53
  %arrayidx57 = getelementptr inbounds float, ptr %output, i32 %add53
  %arrayidx59 = getelementptr inbounds float, ptr %input1, i32 %add58
  %arrayidx60 = getelementptr inbounds float, ptr %input2, i32 %add58
  %arrayidx62 = getelementptr inbounds float, ptr %output, i32 %add58
  %arrayidx64 = getelementptr inbounds float, ptr %input1, i32 %add63
  %arrayidx65 = getelementptr inbounds float, ptr %input2, i32 %add63
  %arrayidx67 = getelementptr inbounds float, ptr %output, i32 %add63
  %arrayidx69 = getelementptr inbounds float, ptr %input1, i32 %add68
  %arrayidx70 = getelementptr inbounds float, ptr %input2, i32 %add68
  %arrayidx72 = getelementptr inbounds float, ptr %output, i32 %add68
  %arrayidx74 = getelementptr inbounds float, ptr %input1, i32 %add73
  %arrayidx75 = getelementptr inbounds float, ptr %input2, i32 %add73
  %arrayidx77 = getelementptr inbounds float, ptr %output, i32 %add73
  %1 = load float, ptr %arrayidx.modify, align 4, !tbaa !5
  %2 = load float, ptr %arrayidx9.modify, align 4, !tbaa !5
  %3 = load float, ptr %arrayidx3, align 4, !tbaa !5
  %4 = load float, ptr %arrayidx4, align 4, !tbaa !5
  %5 = load float, ptr %arrayidx8, align 4, !tbaa !5
  %6 = load float, ptr %arrayidx10, align 4, !tbaa !5
  %7 = load float, ptr %arrayidx14, align 4, !tbaa !5
  %8 = load float, ptr %arrayidx15, align 4, !tbaa !5
  %9 = load float, ptr %arrayidx19, align 4, !tbaa !5
  %10 = load float, ptr %arrayidx20, align 4, !tbaa !5
  %11 = load float, ptr %arrayidx24, align 4, !tbaa !5
  %12 = load float, ptr %arrayidx25, align 4, !tbaa !5
  %13 = load float, ptr %arrayidx29, align 4, !tbaa !5
  %14 = load float, ptr %arrayidx30, align 4, !tbaa !5
  %15 = load float, ptr %arrayidx34, align 4, !tbaa !5
  %16 = load float, ptr %arrayidx35, align 4, !tbaa !5
  %17 = load float, ptr %arrayidx39, align 4, !tbaa !5
  %18 = load float, ptr %arrayidx40, align 4, !tbaa !5
  %19 = load float, ptr %arrayidx44, align 4, !tbaa !5
  %20 = load float, ptr %arrayidx45, align 4, !tbaa !5
  %21 = load float, ptr %arrayidx49, align 4, !tbaa !5
  %22 = load float, ptr %arrayidx50, align 4, !tbaa !5
  %23 = load float, ptr %arrayidx54, align 4, !tbaa !5
  %24 = load float, ptr %arrayidx55, align 4, !tbaa !5
  %25 = load float, ptr %arrayidx59, align 4, !tbaa !5
  %26 = load float, ptr %arrayidx60, align 4, !tbaa !5
  %27 = load float, ptr %arrayidx64, align 4, !tbaa !5
  %28 = load float, ptr %arrayidx65, align 4, !tbaa !5
  %29 = load float, ptr %arrayidx69, align 4, !tbaa !5
  %30 = load float, ptr %arrayidx70, align 4, !tbaa !5
  %31 = load float, ptr %arrayidx74, align 4, !tbaa !5
  %32 = load float, ptr %arrayidx75, align 4, !tbaa !5
  %add.modify = fadd float %1, %2
  %add5 = fadd float %3, %4
  %add11 = fadd float %5, %6
  %add16 = fadd float %7, %8
  %add21 = fadd float %9, %10
  %add26 = fadd float %11, %12
  %add31 = fadd float %13, %14
  %add36 = fadd float %15, %16
  %add41 = fadd float %17, %18
  %add46 = fadd float %19, %20
  %add51 = fadd float %21, %22
  %add56 = fadd float %23, %24
  %add61 = fadd float %25, %26
  %add66 = fadd float %27, %28
  %add71 = fadd float %29, %30
  %add76 = fadd float %31, %32
  store float %add76, ptr %arrayidx77, align 4, !tbaa !5
  store float %add71, ptr %arrayidx72, align 4, !tbaa !5
  store float %add66, ptr %arrayidx67, align 4, !tbaa !5
  store float %add61, ptr %arrayidx62, align 4, !tbaa !5
  store float %add56, ptr %arrayidx57, align 4, !tbaa !5
  store float %add51, ptr %arrayidx52, align 4, !tbaa !5
  store float %add46, ptr %arrayidx47, align 4, !tbaa !5
  store float %add41, ptr %arrayidx42, align 4, !tbaa !5
  store float %add36, ptr %arrayidx37, align 4, !tbaa !5
  store float %add31, ptr %arrayidx32, align 4, !tbaa !5
  store float %add26, ptr %arrayidx27, align 4, !tbaa !5
  store float %add21, ptr %arrayidx22, align 4, !tbaa !5
  store float %add16, ptr %arrayidx17, align 4, !tbaa !5
  store float %add11, ptr %arrayidx12, align 4, !tbaa !5
  store float %add5, ptr %arrayidx6, align 4, !tbaa !5
  store float %add.modify, ptr %arrayidx11.modify, align 4, !tbaa !5
  %33 = add nuw i32 %i.021.modify, 16
  %exitcond.not.modify = icmp sgt i32 %33, %sub
  br i1 %exitcond.not.modify, label %for.cond.preheader.new2, label %for.body.modify, !llvm.loop !9

for.body:                                         ; preds = %for.cond.preheader.new2, %for.body
  %i.021 = phi i32 [ %inc, %for.body ], [ %0, %for.cond.preheader.new2 ]
  %mul = mul nsw i32 %i.021, %step1
  %arrayidx = getelementptr inbounds float, ptr %input1, i32 %mul
  %34 = load float, ptr %arrayidx, align 4, !tbaa !5
  %mul8 = mul nsw i32 %i.021, %step2
  %arrayidx9 = getelementptr inbounds float, ptr %input2, i32 %mul8
  %35 = load float, ptr %arrayidx9, align 4, !tbaa !5
  %add = fadd float %34, %35
  %mul10 = mul nsw i32 %i.021, %step_out
  %arrayidx11 = getelementptr inbounds float, ptr %output, i32 %mul10
  store float %add, ptr %arrayidx11, align 4, !tbaa !5
  %inc = add nuw nsw i32 %i.021, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !9

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.021.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.021.clone, %step1
  %arrayidx.clone = getelementptr inbounds float, ptr %input1, i32 %mul.clone
  %36 = load float, ptr %arrayidx.clone, align 4, !tbaa !5
  %mul8.clone = mul nsw i32 %i.021.clone, %step2
  %arrayidx9.clone = getelementptr inbounds float, ptr %input2, i32 %mul8.clone
  %37 = load float, ptr %arrayidx9.clone, align 4, !tbaa !5
  %add.clone = fadd float %36, %37
  %mul10.clone = mul nsw i32 %i.021.clone, %step_out
  %arrayidx11.clone = getelementptr inbounds float, ptr %output, i32 %mul10.clone
  store float %add.clone, ptr %arrayidx11.clone, align 4, !tbaa !5
  %inc.clone = add nuw nsw i32 %i.021.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone, !llvm.loop !9

return:                                           ; preds = %for.cond.preheader.new2, %for.body.clone, %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ], [ 0, %for.body.clone ], [ 0, %for.cond.preheader.new2 ]
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
