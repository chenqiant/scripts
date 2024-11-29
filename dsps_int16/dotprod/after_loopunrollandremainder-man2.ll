; ModuleID = 'dsps_dotprod_s16_ansi.ll'
source_filename = "dsps_dotprod_s16_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_dotprod_s16_ansi(ptr noalias nocapture noundef readonly %src1, ptr noalias nocapture noundef readonly %src2, ptr noalias nocapture noundef writeonly %dest, i32 noundef %len, i8 noundef signext %shift) local_unnamed_addr #0 {
entry:
  %conv = sext i8 %shift to i32
  %shr = lshr i32 32767, %conv
  %conv1 = zext nneg i32 %shr to i64
  %and = and i32 %len, -8
  %cmp24 = icmp sgt i32 %and, 0
  br i1 %cmp24, label %for.body.preheader, label %for.cond73.preheader

for.body.preheader:                               ; preds = %entry
  %0 = add i32 %and, -1
  %1 = and i32 %0, -8
  br label %for.body.7

for.cond.cleanup.loopexit:                        ; preds = %for.body.7
  %2 = add i32 %1, 8
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %entry, %for.cond.cleanup.loopexit
  %i.0.lcssa = phi i32 [ 0, %entry ], [ %2, %for.cond.cleanup.loopexit ]
  ;%result0.0.lcssa = phi i64 [ 0, %entry ], [ %add.7, %for.cond.cleanup.loopexit ]
  ;%result0.0.lcssa1 = phi i64 [ 0, %entry ], [ %add.7, %for.cond.cleanup.loopexit ]
  ;%result0.0.lcssa2 = phi i64 [ 0, %entry ], [ %add.6, %for.cond.cleanup.loopexit ]
  ;%result0.0.lcssa3 = phi i64 [ 0, %entry ], [ %add.5, %for.cond.cleanup.loopexit ]
  ;%result0.0.lcssa4 = phi i64 [ 0, %entry ], [ %add.4, %for.cond.cleanup.loopexit ]
  ;%result0.0.lcssa5 = phi i64 [ 0, %entry ], [ %add.3, %for.cond.cleanup.loopexit ]
  ;%result0.0.lcssa6 = phi i64 [ 0, %entry ], [ %add.2, %for.cond.cleanup.loopexit ]
  ;%result0.0.lcssa8 = phi i64 [ %conv1, %entry ], [ %add, %for.cond.cleanup.loopexit ]
  %result0.0.lcssa8 = phi i64 [ %conv1, %entry ], [ %add.7, %for.cond.cleanup.loopexit ]
  
  %cmp74172 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp74172, label %for.body.clone, label %for.end85

for.body.7:                                       ; preds = %for.body.7, %for.body.preheader
  ;%result7 = phi i64 [ 0, %for.body.preheader ], [ %add.7, %for.body.7 ]
  ;%result6 = phi i64 [ 0, %for.body.preheader ], [ %add.6, %for.body.7 ]
  ;%result5 = phi i64 [ 0, %for.body.preheader ], [ %add.5, %for.body.7 ]
  ;%result4 = phi i64 [ 0, %for.body.preheader ], [ %add.4, %for.body.7 ]
  ;%result3 = phi i64 [ 0, %for.body.preheader ], [ %add.3, %for.body.7 ]
  ;%result2 = phi i64 [ 0, %for.body.preheader ], [ %add.2, %for.body.7 ]
  ;%result1 = phi i64 [ 0, %for.body.preheader ], [ %add.1, %for.body.7 ]
  ;%result0 = phi i64 [ %conv1, %for.body.preheader ], [ %add, %for.body.7 ]
  %result0 = phi i64 [ %conv1, %for.body.preheader ], [ %add.7, %for.body.7 ]
  %i.025 = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %for.body.7 ]
  %arrayidx = getelementptr inbounds i16, ptr %src1, i32 %i.025
  %3 = load i16, ptr %arrayidx, align 2, !tbaa !4
  %conv3 = sext i16 %3 to i32
  %arrayidx4 = getelementptr inbounds i16, ptr %src2, i32 %i.025
  %4 = load i16, ptr %arrayidx4, align 2, !tbaa !4
  %conv5 = sext i16 %4 to i32
  %mul = mul nsw i32 %conv5, %conv3
  %conv6 = sext i32 %mul to i64
  %add = add nsw i64 %result0, %conv6
  %inc = add nuw nsw i32 %i.025, 1
  %arrayidx.1 = getelementptr inbounds i16, ptr %src1, i32 %inc
  %5 = load i16, ptr %arrayidx.1, align 2, !tbaa !4
  %conv3.1 = sext i16 %5 to i32
  %arrayidx4.1 = getelementptr inbounds i16, ptr %src2, i32 %inc
  %6 = load i16, ptr %arrayidx4.1, align 2, !tbaa !4
  %conv5.1 = sext i16 %6 to i32
  %mul.1 = mul nsw i32 %conv5.1, %conv3.1
  %conv6.1 = sext i32 %mul.1 to i64
  ;%add.1 = add nsw i64 %result1, %conv6.1
  %add.1 = add nsw i64 %add, %conv6.1
  %inc.1 = add nuw nsw i32 %i.025, 2
  %arrayidx.2 = getelementptr inbounds i16, ptr %src1, i32 %inc.1
  %7 = load i16, ptr %arrayidx.2, align 2, !tbaa !4
  %conv3.2 = sext i16 %7 to i32
  %arrayidx4.2 = getelementptr inbounds i16, ptr %src2, i32 %inc.1
  %8 = load i16, ptr %arrayidx4.2, align 2, !tbaa !4
  %conv5.2 = sext i16 %8 to i32
  %mul.2 = mul nsw i32 %conv5.2, %conv3.2
  %conv6.2 = sext i32 %mul.2 to i64
  ;%add.2 = add nsw i64 %result2, %conv6.2
  %add.2 = add nsw i64 %add.1, %conv6.2
  %inc.2 = add nuw nsw i32 %i.025, 3
  %arrayidx.3 = getelementptr inbounds i16, ptr %src1, i32 %inc.2
  %9 = load i16, ptr %arrayidx.3, align 2, !tbaa !4
  %conv3.3 = sext i16 %9 to i32
  %arrayidx4.3 = getelementptr inbounds i16, ptr %src2, i32 %inc.2
  %10 = load i16, ptr %arrayidx4.3, align 2, !tbaa !4
  %conv5.3 = sext i16 %10 to i32
  %mul.3 = mul nsw i32 %conv5.3, %conv3.3
  %conv6.3 = sext i32 %mul.3 to i64
  ;%add.3 = add nsw i64 %result3, %conv6.3
  %add.3 = add nsw i64 %add.2, %conv6.3
  %inc.3 = add nuw nsw i32 %i.025, 4
  %arrayidx.4 = getelementptr inbounds i16, ptr %src1, i32 %inc.3
  %11 = load i16, ptr %arrayidx.4, align 2, !tbaa !4
  %conv3.4 = sext i16 %11 to i32
  %arrayidx4.4 = getelementptr inbounds i16, ptr %src2, i32 %inc.3
  %12 = load i16, ptr %arrayidx4.4, align 2, !tbaa !4
  %conv5.4 = sext i16 %12 to i32
  %mul.4 = mul nsw i32 %conv5.4, %conv3.4
  %conv6.4 = sext i32 %mul.4 to i64
  ;%add.4 = add nsw i64 %result4, %conv6.4
  %add.4 = add nsw i64 %add.3, %conv6.4
  %inc.4 = add nuw nsw i32 %i.025, 5
  %arrayidx.5 = getelementptr inbounds i16, ptr %src1, i32 %inc.4
  %13 = load i16, ptr %arrayidx.5, align 2, !tbaa !4
  %conv3.5 = sext i16 %13 to i32
  %arrayidx4.5 = getelementptr inbounds i16, ptr %src2, i32 %inc.4
  %14 = load i16, ptr %arrayidx4.5, align 2, !tbaa !4
  %conv5.5 = sext i16 %14 to i32
  %mul.5 = mul nsw i32 %conv5.5, %conv3.5
  %conv6.5 = sext i32 %mul.5 to i64
  ;%add.5 = add nsw i64 %result5, %conv6.5
  %add.5 = add nsw i64 %add.4, %conv6.5
  %inc.5 = add nuw nsw i32 %i.025, 6
  %arrayidx.6 = getelementptr inbounds i16, ptr %src1, i32 %inc.5
  %15 = load i16, ptr %arrayidx.6, align 2, !tbaa !4
  %conv3.6 = sext i16 %15 to i32
  %arrayidx4.6 = getelementptr inbounds i16, ptr %src2, i32 %inc.5
  %16 = load i16, ptr %arrayidx4.6, align 2, !tbaa !4
  %conv5.6 = sext i16 %16 to i32
  %mul.6 = mul nsw i32 %conv5.6, %conv3.6
  %conv6.6 = sext i32 %mul.6 to i64
  ;%add.6 = add nsw i64 %result6, %conv6.6
  %add.6 = add nsw i64 %add.5, %conv6.6
  %inc.6 = add nuw nsw i32 %i.025, 7
  %arrayidx.7 = getelementptr inbounds i16, ptr %src1, i32 %inc.6
  %17 = load i16, ptr %arrayidx.7, align 2, !tbaa !4
  %conv3.7 = sext i16 %17 to i32
  %arrayidx4.7 = getelementptr inbounds i16, ptr %src2, i32 %inc.6
  %18 = load i16, ptr %arrayidx4.7, align 2, !tbaa !4
  %conv5.7 = sext i16 %18 to i32
  %mul.7 = mul nsw i32 %conv5.7, %conv3.7
  %conv6.7 = sext i32 %mul.7 to i64
  ;%add.7 = add nsw i64 %result7, %conv6.7
  %add.7 = add nsw i64 %add.6, %conv6.7
  %inc.7 = add nuw nsw i32 %i.025, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %and
  br i1 %exitcond.not.7, label %for.body.7, label %for.cond.cleanup.loopexit, !llvm.loop !8

for.body.clone:                                   ; preds = %for.body.clone, %for.cond73.preheader
  %19 = phi i64 [ %result0.0.lcssa8, %for.cond73.preheader ], [ %add.clone, %for.body.clone ]
  %i.025.clone = phi i32 [ %inc.clone, %for.body.clone ], [ %i.0.lcssa, %for.cond73.preheader ]
  %arrayidx.clone = getelementptr inbounds i16, ptr %src1, i32 %i.025.clone
  %20 = load i16, ptr %arrayidx.clone, align 2, !tbaa !4
  %conv3.clone = sext i16 %20 to i32
  %arrayidx4.clone = getelementptr inbounds i16, ptr %src2, i32 %i.025.clone
  %21 = load i16, ptr %arrayidx4.clone, align 2, !tbaa !4
  %conv5.clone = sext i16 %21 to i32
  %mul.clone = mul nsw i32 %conv5.clone, %conv3.clone
  %conv6.clone = sext i32 %mul.clone to i64
  %add.clone = add nsw i64 %19, %conv6.clone
  %inc.clone = add nuw nsw i32 %i.025.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %for.end85, label %for.body.clone, !llvm.loop !8

for.end85:                                        ; preds = %for.body.clone, %for.cond73.preheader
  %acc.0.lcssa = phi i64 [ %result0.0.lcssa8, %for.cond73.preheader ], [ %add.clone, %for.body.clone ]
  ;%add64 = add i64 %result0.0.lcssa, %acc.0.lcssa
  ;%add65 = add i64 %result0.0.lcssa1, %result0.0.lcssa2
  ;%add66 = add i64 %result0.0.lcssa3, %result0.0.lcssa4
  ;%add67 = add i64 %result0.0.lcssa5, %result0.0.lcssa6
  ;%add68 = add i64 %add64, %add65
  ;%add69 = add i64 %add66, %add67
  ;%add70 = add i64 %add68, %add69
  %cmp8 = icmp sgt i8 %shift, 15
  br i1 %cmp8, label %if.then, label %if.else

if.then:                                          ; preds = %for.end85
  %sub = add nsw i32 %conv, -15
  %sh_prom = zext nneg i32 %sub to i64
  ;%shl = shl i64 %add70, %sh_prom
  %shl = shl i64 %acc.0.lcssa, %sh_prom
  %extract.t29 = trunc i64 %shl to i16
  br label %if.end

if.else:                                          ; preds = %for.end85
  %sub11 = sub nsw i32 15, %conv
  %sh_prom12 = zext nneg i32 %sub11 to i64
  ;%shr13 = ashr i64 %add70, %sh_prom12
  %shr13 = ashr i64 %acc.0.lcssa, %sh_prom12
  %extract.t28 = trunc i64 %shr13 to i16
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %shr13.sink.off0 = phi i16 [ %extract.t28, %if.else ], [ %extract.t29, %if.then ]
  store i16 %shr13.sink.off0, ptr %dest, align 2, !tbaa !4
  ret i32 0
}


attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zca,+zcmp,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"short", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
