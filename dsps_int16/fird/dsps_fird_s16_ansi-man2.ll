; ModuleID = 'dsps_fird_s16_ansi-man.c'
source_filename = "dsps_fird_s16_ansi-man.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.fir_s16_s = type { ptr, ptr, i16, i16, i16, i16, i16, ptr, i32, i16 }

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dsps_fird_s16_ansi(ptr nocapture noundef %fir, ptr nocapture noundef readonly %input, ptr nocapture noundef writeonly %output, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %shift = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 6
  %0 = load i16, ptr %shift, align 4, !tbaa !4
  %conv = sext i16 %0 to i32
  %sub = add nsw i32 %conv, -15
  %rounding_val = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 8
  %1 = load i32, ptr %rounding_val, align 4, !tbaa !11
  %conv1 = sext i32 %1 to i64
  %cmp = icmp sgt i16 %0, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %sh_prom = zext nneg i32 %conv to i64
  %shr = ashr i64 %conv1, %sh_prom
  br label %if.end

if.else:                                          ; preds = %entry
  %sub9 = sub nsw i32 0, %conv
  %sh_prom10 = zext nneg i32 %sub9 to i64
  %shl = shl i64 %conv1, %sh_prom10
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %rounding.0.in = phi i64 [ %shr, %if.then ], [ %shl, %if.else ]
  %rounding.0 = and i64 %rounding.0.in, 1099511627775
  %coeffs_len12 = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 2
  %2 = load i16, ptr %coeffs_len12, align 4, !tbaa !12
  %3 = load ptr, ptr %fir, align 4, !tbaa !13
  %delay15 = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 1
  %4 = load ptr, ptr %delay15, align 4, !tbaa !14
  %d_pos16 = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 5
  %5 = load i16, ptr %d_pos16, align 2, !tbaa !15
  %cmp17151 = icmp sgt i32 %len, 0
  br i1 %cmp17151, label %for.cond19.preheader.lr.ph, label %for.cond.cleanup

for.cond19.preheader.lr.ph:                       ; preds = %if.end
  %decim13 = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 4
  %6 = load i16, ptr %decim13, align 4, !tbaa !16
  %conv20 = sext i16 %6 to i32
  %pos = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 3
  %conv38 = sext i16 %2 to i32
  %coeff_pos.0139 = add i16 %2, -1
  %cmp78 = icmp sgt i16 %0, 15
  %sub87 = sub nsw i32 15, %conv
  %sh_prom88 = zext nneg i32 %sub87 to i64
  %sh_prom81 = zext nneg i32 %sub to i64
  %7 = sext i16 %5 to i32
  br label %for.cond19.preheader

for.cond19.preheader:                             ; preds = %for.cond19.preheader.lr.ph, %for.cond.cleanup64
  %i.0155 = phi i32 [ 0, %for.cond19.preheader.lr.ph ], [ %inc95, %for.cond.cleanup64 ]
  %d_pos.0154 = phi i32 [ %7, %for.cond19.preheader.lr.ph ], [ 0, %for.cond.cleanup64 ]
  %input_pos.0152 = phi i32 [ 0, %for.cond19.preheader.lr.ph ], [ %input_pos.1.lcssa, %for.cond.cleanup64 ]
  %cmp23136 = icmp slt i32 %d_pos.0154, %conv20
  br i1 %cmp23136, label %for.body26.preheader, label %for.cond.cleanup25

for.body26.preheader:                             ; preds = %for.cond19.preheader
  %8 = add i32 %input_pos.0152, %conv20
  %9 = sub i32 %8, %d_pos.0154
  br label %for.body26

for.cond.cleanup:                                 ; preds = %for.cond.cleanup64, %if.end
  %result.0.lcssa = phi i32 [ 0, %if.end ], [ %len, %for.cond.cleanup64 ]
  %d_pos.0.lcssa = phi i16 [ %5, %if.end ], [ 0, %for.cond.cleanup64 ]
  store i16 %d_pos.0.lcssa, ptr %d_pos16, align 2, !tbaa !15
  ret i32 %result.0.lcssa

for.cond.cleanup25:                               ; preds = %if.end33, %for.cond19.preheader
  %input_pos.1.lcssa = phi i32 [ %input_pos.0152, %for.cond19.preheader ], [ %9, %if.end33 ]
  %10 = load i16, ptr %pos, align 2, !tbaa !17
  %conv42 = sext i16 %10 to i32
  %cmp45140 = icmp slt i16 %10, %2
  br i1 %cmp45140, label %for.body48, label %for.cond59.preheader

for.body26:                                       ; preds = %for.body26.preheader, %if.end33
  %input_pos.1137 = phi i32 [ %inc, %if.end33 ], [ %input_pos.0152, %for.body26.preheader ]
  %11 = load i16, ptr %pos, align 2, !tbaa !17
  %cmp29.not = icmp slt i16 %11, %2
  br i1 %cmp29.not, label %if.end33, label %if.then31

if.then31:                                        ; preds = %for.body26
  store i16 0, ptr %pos, align 2, !tbaa !17
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %for.body26
  %12 = phi i16 [ 0, %if.then31 ], [ %11, %for.body26 ]
  %inc = add i32 %input_pos.1137, 1
  %arrayidx = getelementptr inbounds i16, ptr %input, i32 %input_pos.1137
  %13 = load i16, ptr %arrayidx, align 2, !tbaa !18
  %inc35 = add nsw i16 %12, 1
  store i16 %inc35, ptr %pos, align 2, !tbaa !17
  %idxprom = sext i16 %12 to i32
  %arrayidx36 = getelementptr inbounds i16, ptr %4, i32 %idxprom
  store i16 %13, ptr %arrayidx36, align 2, !tbaa !18
  %exitcond.not = icmp eq i32 %inc, %9
  br i1 %exitcond.not, label %for.cond.cleanup25, label %for.body26, !llvm.loop !19

for.cond59.preheader.loopexit:                    ; preds = %for.body48
  %14 = add i16 %10, -1
  br label %for.cond59.preheader

for.cond59.preheader:                             ; preds = %for.cond59.preheader.loopexit, %for.cond.cleanup25
  %acc.0.lcssa = phi i64 [ %rounding.0, %for.cond.cleanup25 ], [ %add, %for.cond59.preheader.loopexit ]
  %coeff_pos.0.lcssa = phi i16 [ %coeff_pos.0139, %for.cond.cleanup25 ], [ %14, %for.cond59.preheader.loopexit ]
  %cmp62146 = icmp sgt i16 %10, 0
  br i1 %cmp62146, label %for.body65, label %for.cond.cleanup64

for.body48:                                       ; preds = %for.cond.cleanup25, %for.body48
  %coeff_pos.0143 = phi i16 [ %coeff_pos.0, %for.body48 ], [ %coeff_pos.0139, %for.cond.cleanup25 ]
  %n.0142 = phi i32 [ %inc56, %for.body48 ], [ %conv42, %for.cond.cleanup25 ]
  %acc.0141 = phi i64 [ %add, %for.body48 ], [ %rounding.0, %for.cond.cleanup25 ]
  %idxprom49 = sext i16 %coeff_pos.0143 to i32
  %arrayidx50 = getelementptr inbounds i16, ptr %3, i32 %idxprom49
  %15 = load i16, ptr %arrayidx50, align 2, !tbaa !18
  %conv51 = sext i16 %15 to i32
  %arrayidx52 = getelementptr inbounds i16, ptr %4, i32 %n.0142
  %16 = load i16, ptr %arrayidx52, align 2, !tbaa !18
  %conv53 = sext i16 %16 to i32
  %mul = mul nsw i32 %conv53, %conv51
  %conv54 = sext i32 %mul to i64
  %add = add nsw i64 %acc.0141, %conv54
  %inc56 = add nsw i32 %n.0142, 1
  %coeff_pos.0 = add i16 %coeff_pos.0143, -1
  %exitcond159.not = icmp eq i32 %inc56, %conv38
  br i1 %exitcond159.not, label %for.cond59.preheader.loopexit, label %for.body48, !llvm.loop !21

for.cond.cleanup64:                               ; preds = %for.body65, %for.cond59.preheader
  %acc.1.lcssa = phi i64 [ %acc.0.lcssa, %for.cond59.preheader ], [ %add74, %for.body65 ]
  %shr89 = ashr i64 %acc.1.lcssa, %sh_prom88
  %shl82 = shl i64 %acc.1.lcssa, %sh_prom81
  %shr89.sink = select i1 %cmp78, i64 %shl82, i64 %shr89
  %conv90 = trunc i64 %shr89.sink to i16
  %17 = getelementptr inbounds i16, ptr %output, i32 %i.0155
  store i16 %conv90, ptr %17, align 2
  %inc95 = add nuw nsw i32 %i.0155, 1
  %exitcond161.not = icmp eq i32 %inc95, %len
  br i1 %exitcond161.not, label %for.cond.cleanup, label %for.cond19.preheader, !llvm.loop !22

for.body65:                                       ; preds = %for.cond59.preheader, %for.body65
  %n58.0149 = phi i32 [ %inc76, %for.body65 ], [ 0, %for.cond59.preheader ]
  %coeff_pos.1148 = phi i16 [ %dec66, %for.body65 ], [ %coeff_pos.0.lcssa, %for.cond59.preheader ]
  %acc.1147 = phi i64 [ %add74, %for.body65 ], [ %acc.0.lcssa, %for.cond59.preheader ]
  %dec66 = add i16 %coeff_pos.1148, -1
  %idxprom67 = sext i16 %coeff_pos.1148 to i32
  %arrayidx68 = getelementptr inbounds i16, ptr %3, i32 %idxprom67
  %18 = load i16, ptr %arrayidx68, align 2, !tbaa !18
  %conv69 = sext i16 %18 to i32
  %arrayidx70 = getelementptr inbounds i16, ptr %4, i32 %n58.0149
  %19 = load i16, ptr %arrayidx70, align 2, !tbaa !18
  %conv71 = sext i16 %19 to i32
  %mul72 = mul nsw i32 %conv71, %conv69
  %conv73 = sext i32 %mul72 to i64
  %add74 = add nsw i64 %acc.1147, %conv73
  %inc76 = add nuw nsw i32 %n58.0149, 1
  %exitcond160.not = icmp eq i32 %inc76, %conv42
  br i1 %exitcond160.not, label %for.cond.cleanup64, label %for.body65, !llvm.loop !23
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda)"}
!4 = !{!5, !9, i64 16}
!5 = !{!"fir_s16_s", !6, i64 0, !6, i64 4, !9, i64 8, !9, i64 10, !9, i64 12, !9, i64 14, !9, i64 16, !6, i64 20, !10, i64 24, !9, i64 28}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"short", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!5, !10, i64 24}
!12 = !{!5, !9, i64 8}
!13 = !{!5, !6, i64 0}
!14 = !{!5, !6, i64 4}
!15 = !{!5, !9, i64 14}
!16 = !{!5, !9, i64 12}
!17 = !{!5, !9, i64 10}
!18 = !{!9, !9, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !20}
