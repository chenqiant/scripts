; ModuleID = 'dsps_dotprod_s16_best.c'
source_filename = "dsps_dotprod_s16_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_dotprod_s16_ansi(ptr nocapture noundef readonly %src1, ptr nocapture noundef readonly %src2, ptr nocapture noundef writeonly %dest, i32 noundef %len, i8 noundef signext %shift) local_unnamed_addr #0 {
entry:
  %conv = sext i8 %shift to i32
  %shr = lshr i32 32767, %conv
  %conv1 = zext nneg i32 %shr to i64
  %and = and i32 %len, -8
  %cmp146 = icmp sgt i32 %and, 0
  br i1 %cmp146, label %for.body.preheader, label %for.cond73.preheader

for.body.preheader:                               ; preds = %entry
  %0 = add nsw i32 %and, -1
  %1 = and i32 %0, -8
  br label %for.body

for.cond73.preheader.loopexit:                    ; preds = %for.body
  %2 = add i32 %1, 8
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.cond73.preheader.loopexit, %entry
  %i.0.lcssa = phi i32 [ 0, %entry ], [ %2, %for.cond73.preheader.loopexit ]
  %acc.0.lcssa = phi i64 [ %conv1, %entry ], [ %add71, %for.cond73.preheader.loopexit ]
  %cmp74150 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp74150, label %for.body76, label %for.end85

for.body:                                         ; preds = %for.body.preheader, %for.body
  %acc.0148 = phi i64 [ %add71, %for.body ], [ %conv1, %for.body.preheader ]
  %i.0147 = phi i32 [ %add72, %for.body ], [ 0, %for.body.preheader ]
  %add9 = or disjoint i32 %i.0147, 1
  %add18 = or disjoint i32 %i.0147, 2
  %add27 = or disjoint i32 %i.0147, 3
  %add36 = or disjoint i32 %i.0147, 4
  %add45 = or disjoint i32 %i.0147, 5
  %add54 = or disjoint i32 %i.0147, 6
  %add63 = or disjoint i32 %i.0147, 7
  %arrayidx = getelementptr inbounds i16, ptr %src1, i32 %i.0147
  %arrayidx10 = getelementptr inbounds i16, ptr %src1, i32 %add9
  %arrayidx19 = getelementptr inbounds i16, ptr %src1, i32 %add18
  %arrayidx28 = getelementptr inbounds i16, ptr %src1, i32 %add27
  %arrayidx37 = getelementptr inbounds i16, ptr %src1, i32 %add36
  %arrayidx46 = getelementptr inbounds i16, ptr %src1, i32 %add45
  %arrayidx55 = getelementptr inbounds i16, ptr %src1, i32 %add54
  %arrayidx64 = getelementptr inbounds i16, ptr %src1, i32 %add63
  %arrayidx5 = getelementptr inbounds i16, ptr %src2, i32 %i.0147
  %arrayidx13 = getelementptr inbounds i16, ptr %src2, i32 %add9
  %arrayidx22 = getelementptr inbounds i16, ptr %src2, i32 %add18
  %arrayidx31 = getelementptr inbounds i16, ptr %src2, i32 %add27
  %arrayidx40 = getelementptr inbounds i16, ptr %src2, i32 %add36
  %arrayidx49 = getelementptr inbounds i16, ptr %src2, i32 %add45
  %arrayidx58 = getelementptr inbounds i16, ptr %src2, i32 %add54
  %arrayidx67 = getelementptr inbounds i16, ptr %src2, i32 %add63
  %3 = load i16, ptr %arrayidx, align 2, !tbaa !4
  %4 = load i16, ptr %arrayidx5, align 2, !tbaa !4
  %5 = load i16, ptr %arrayidx10, align 2, !tbaa !4
  %6 = load i16, ptr %arrayidx13, align 2, !tbaa !4
  %7 = load i16, ptr %arrayidx19, align 2, !tbaa !4
  %8 = load i16, ptr %arrayidx22, align 2, !tbaa !4
  %9 = load i16, ptr %arrayidx28, align 2, !tbaa !4
  %10 = load i16, ptr %arrayidx31, align 2, !tbaa !4
  %11 = load i16, ptr %arrayidx37, align 2, !tbaa !4
  %12 = load i16, ptr %arrayidx40, align 2, !tbaa !4
  %13 = load i16, ptr %arrayidx46, align 2, !tbaa !4
  %14 = load i16, ptr %arrayidx49, align 2, !tbaa !4
  %15 = load i16, ptr %arrayidx55, align 2, !tbaa !4
  %16 = load i16, ptr %arrayidx58, align 2, !tbaa !4
  %17 = load i16, ptr %arrayidx64, align 2, !tbaa !4
  %18 = load i16, ptr %arrayidx67, align 2, !tbaa !4
  %conv3 = sext i16 %3 to i32
  %conv6 = sext i16 %4 to i32
  %conv11 = sext i16 %5 to i32
  %conv14 = sext i16 %6 to i32
  %conv20 = sext i16 %7 to i32
  %conv23 = sext i16 %8 to i32
  %conv29 = sext i16 %9 to i32
  %conv32 = sext i16 %10 to i32
  %conv38 = sext i16 %11 to i32
  %conv41 = sext i16 %12 to i32
  %conv47 = sext i16 %13 to i32
  %conv50 = sext i16 %14 to i32
  %conv56 = sext i16 %15 to i32
  %conv59 = sext i16 %16 to i32
  %conv65 = sext i16 %17 to i32
  %conv68 = sext i16 %18 to i32
  %mul = mul nsw i32 %conv6, %conv3
  %mul15 = mul nsw i32 %conv14, %conv11
  %mul24 = mul nsw i32 %conv23, %conv20
  %mul33 = mul nsw i32 %conv32, %conv29
  %mul42 = mul nsw i32 %conv41, %conv38
  %mul51 = mul nsw i32 %conv50, %conv47
  %mul60 = mul nsw i32 %conv59, %conv56
  %mul69 = mul nsw i32 %conv68, %conv65
  %conv7 = sext i32 %mul to i64
  %conv16 = sext i32 %mul15 to i64
  %conv25 = sext i32 %mul24 to i64
  %conv34 = sext i32 %mul33 to i64
  %conv43 = sext i32 %mul42 to i64
  %conv52 = sext i32 %mul51 to i64
  %conv61 = sext i32 %mul60 to i64
  %conv70 = sext i32 %mul69 to i64
  %add8 = add nsw i64 %acc.0148, %conv7
  %add17 = add nsw i64 %add8, %conv16
  %add26 = add nsw i64 %add17, %conv25
  %add35 = add nsw i64 %add26, %conv34
  %add44 = add nsw i64 %add35, %conv43
  %add53 = add nsw i64 %add44, %conv52
  %add62 = add nsw i64 %add53, %conv61
  %add71 = add nsw i64 %add62, %conv70
  %add72 = add nuw nsw i32 %i.0147, 8
  %cmp = icmp slt i32 %add72, %and
  br i1 %cmp, label %for.body, label %for.cond73.preheader.loopexit, !llvm.loop !8

for.body76:                                       ; preds = %for.cond73.preheader, %for.body76
  %acc.1152 = phi i64 [ %add83, %for.body76 ], [ %acc.0.lcssa, %for.cond73.preheader ]
  %i.1151 = phi i32 [ %inc, %for.body76 ], [ %i.0.lcssa, %for.cond73.preheader ]
  %arrayidx77 = getelementptr inbounds i16, ptr %src1, i32 %i.1151
  %19 = load i16, ptr %arrayidx77, align 2, !tbaa !4
  %conv78 = sext i16 %19 to i32
  %arrayidx79 = getelementptr inbounds i16, ptr %src2, i32 %i.1151
  %20 = load i16, ptr %arrayidx79, align 2, !tbaa !4
  %conv80 = sext i16 %20 to i32
  %mul81 = mul nsw i32 %conv80, %conv78
  %conv82 = sext i32 %mul81 to i64
  %add83 = add nsw i64 %acc.1152, %conv82
  %inc = add nuw nsw i32 %i.1151, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %for.end85, label %for.body76, !llvm.loop !10

for.end85:                                        ; preds = %for.body76, %for.cond73.preheader
  %acc.1.lcssa = phi i64 [ %acc.0.lcssa, %for.cond73.preheader ], [ %add83, %for.body76 ]
  %cmp87 = icmp sgt i8 %shift, 15
  br i1 %cmp87, label %if.then, label %if.else

if.then:                                          ; preds = %for.end85
  %sub = add nsw i32 %conv, -15
  %sh_prom = zext nneg i32 %sub to i64
  %shl = shl i64 %acc.1.lcssa, %sh_prom
  %extract.t156 = trunc i64 %shl to i16
  br label %if.end

if.else:                                          ; preds = %for.end85
  %sub90 = sub nsw i32 15, %conv
  %sh_prom91 = zext nneg i32 %sub90 to i64
  %shr92 = ashr i64 %acc.1.lcssa, %sh_prom91
  %extract.t155 = trunc i64 %shr92 to i16
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %shr92.sink.off0 = phi i16 [ %extract.t155, %if.else ], [ %extract.t156, %if.then ]
  store i16 %shr92.sink.off0, ptr %dest, align 2, !tbaa !4
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
!10 = distinct !{!10, !9}
