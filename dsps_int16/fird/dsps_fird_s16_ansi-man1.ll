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
  %pos16 = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 3
  %5 = load i16, ptr %pos16, align 2, !tbaa !15
  %d_pos17 = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 5
  %6 = load i16, ptr %d_pos17, align 2, !tbaa !16
  %cmp18152 = icmp sgt i32 %len, 0
  br i1 %cmp18152, label %for.cond20.preheader.lr.ph, label %for.cond.cleanup

for.cond20.preheader.lr.ph:                       ; preds = %if.end
  %decim13 = getelementptr inbounds %struct.fir_s16_s, ptr %fir, i32 0, i32 4
  %7 = load i16, ptr %decim13, align 4, !tbaa !17
  %conv21 = sext i16 %7 to i32
  %conv37 = sext i16 %2 to i32
  %coeff_pos.0140 = add i16 %2, -1
  %cmp75 = icmp sgt i16 %0, 15
  %sub84 = sub nsw i32 15, %conv
  %sh_prom85 = zext nneg i32 %sub84 to i64
  %sh_prom78 = zext nneg i32 %sub to i64
  %8 = sext i16 %6 to i32
  br label %for.cond20.preheader

for.cond20.preheader:                             ; preds = %for.cond20.preheader.lr.ph, %for.cond.cleanup61
  %i.0157 = phi i32 [ 0, %for.cond20.preheader.lr.ph ], [ %inc92, %for.cond.cleanup61 ]
  %d_pos.0156 = phi i32 [ %8, %for.cond20.preheader.lr.ph ], [ 0, %for.cond.cleanup61 ]
  %pos.0155 = phi i16 [ %5, %for.cond20.preheader.lr.ph ], [ %pos.1.lcssa, %for.cond.cleanup61 ]
  %input_pos.0153 = phi i32 [ 0, %for.cond20.preheader.lr.ph ], [ %input_pos.1.lcssa, %for.cond.cleanup61 ]
  %cmp24135 = icmp slt i32 %d_pos.0156, %conv21
  br i1 %cmp24135, label %for.body27.preheader, label %for.cond.cleanup26

for.body27.preheader:                             ; preds = %for.cond20.preheader
  %9 = add i32 %input_pos.0153, %conv21
  %10 = sub i32 %9, %d_pos.0156
  br label %for.body27

for.cond.cleanup:                                 ; preds = %for.cond.cleanup61, %if.end
  %result.0.lcssa = phi i32 [ 0, %if.end ], [ %len, %for.cond.cleanup61 ]
  %pos.0.lcssa = phi i16 [ %5, %if.end ], [ %pos.1.lcssa, %for.cond.cleanup61 ]
  %d_pos.0.lcssa = phi i16 [ %6, %if.end ], [ 0, %for.cond.cleanup61 ]
  store i16 %pos.0.lcssa, ptr %pos16, align 2, !tbaa !15
  store i16 %d_pos.0.lcssa, ptr %d_pos17, align 2, !tbaa !16
  ret i32 %result.0.lcssa

for.cond.cleanup26:                               ; preds = %for.body27, %for.cond20.preheader
  %input_pos.1.lcssa = phi i32 [ %input_pos.0153, %for.cond20.preheader ], [ %10, %for.body27 ]
  %pos.1.lcssa = phi i16 [ %pos.0155, %for.cond20.preheader ], [ %inc34, %for.body27 ]
  %conv40 = sext i16 %pos.1.lcssa to i32
  %cmp43141 = icmp slt i16 %pos.1.lcssa, %2
  br i1 %cmp43141, label %for.body46, label %for.cond57.preheader

for.body27:                                       ; preds = %for.body27.preheader, %for.body27
  %pos.1137 = phi i16 [ %inc34, %for.body27 ], [ %pos.0155, %for.body27.preheader ]
  %input_pos.1136 = phi i32 [ %inc, %for.body27 ], [ %input_pos.0153, %for.body27.preheader ]
  %cmp30.not = icmp slt i16 %pos.1137, %2
  %spec.store.select = select i1 %cmp30.not, i16 %pos.1137, i16 0
  %inc = add i32 %input_pos.1136, 1
  %arrayidx = getelementptr inbounds i16, ptr %input, i32 %input_pos.1136
  %11 = load i16, ptr %arrayidx, align 2, !tbaa !18
  %inc34 = add i16 %spec.store.select, 1
  %idxprom = sext i16 %spec.store.select to i32
  %arrayidx35 = getelementptr inbounds i16, ptr %4, i32 %idxprom
  store i16 %11, ptr %arrayidx35, align 2, !tbaa !18
  %exitcond.not = icmp eq i32 %inc, %10
  br i1 %exitcond.not, label %for.cond.cleanup26, label %for.body27, !llvm.loop !19

for.cond57.preheader.loopexit:                    ; preds = %for.body46
  %12 = add i16 %pos.1.lcssa, -1
  br label %for.cond57.preheader

for.cond57.preheader:                             ; preds = %for.cond57.preheader.loopexit, %for.cond.cleanup26
  %acc.0.lcssa = phi i64 [ %rounding.0, %for.cond.cleanup26 ], [ %add, %for.cond57.preheader.loopexit ]
  %coeff_pos.0.lcssa = phi i16 [ %coeff_pos.0140, %for.cond.cleanup26 ], [ %12, %for.cond57.preheader.loopexit ]
  %cmp59147 = icmp sgt i16 %pos.1.lcssa, 0
  br i1 %cmp59147, label %for.body62, label %for.cond.cleanup61

for.body46:                                       ; preds = %for.cond.cleanup26, %for.body46
  %coeff_pos.0144 = phi i16 [ %coeff_pos.0, %for.body46 ], [ %coeff_pos.0140, %for.cond.cleanup26 ]
  %n.0143 = phi i32 [ %inc54, %for.body46 ], [ %conv40, %for.cond.cleanup26 ]
  %acc.0142 = phi i64 [ %add, %for.body46 ], [ %rounding.0, %for.cond.cleanup26 ]
  %idxprom47 = sext i16 %coeff_pos.0144 to i32
  %arrayidx48 = getelementptr inbounds i16, ptr %3, i32 %idxprom47
  %13 = load i16, ptr %arrayidx48, align 2, !tbaa !18
  %conv49 = sext i16 %13 to i32
  %arrayidx50 = getelementptr inbounds i16, ptr %4, i32 %n.0143
  %14 = load i16, ptr %arrayidx50, align 2, !tbaa !18
  %conv51 = sext i16 %14 to i32
  %mul = mul nsw i32 %conv51, %conv49
  %conv52 = sext i32 %mul to i64
  %add = add nsw i64 %acc.0142, %conv52
  %inc54 = add nsw i32 %n.0143, 1
  %coeff_pos.0 = add i16 %coeff_pos.0144, -1
  %exitcond162.not = icmp eq i32 %inc54, %conv37
  br i1 %exitcond162.not, label %for.cond57.preheader.loopexit, label %for.body46, !llvm.loop !21

for.cond.cleanup61:                               ; preds = %for.body62, %for.cond57.preheader
  %acc.1.lcssa = phi i64 [ %acc.0.lcssa, %for.cond57.preheader ], [ %add71, %for.body62 ]
  %shr86 = ashr i64 %acc.1.lcssa, %sh_prom85
  %shl79 = shl i64 %acc.1.lcssa, %sh_prom78
  %shr86.sink = select i1 %cmp75, i64 %shl79, i64 %shr86
  %conv87 = trunc i64 %shr86.sink to i16
  %15 = getelementptr inbounds i16, ptr %output, i32 %i.0157
  store i16 %conv87, ptr %15, align 2
  %inc92 = add nuw nsw i32 %i.0157, 1
  %exitcond164.not = icmp eq i32 %inc92, %len
  br i1 %exitcond164.not, label %for.cond.cleanup, label %for.cond20.preheader, !llvm.loop !22

for.body62:                                       ; preds = %for.cond57.preheader, %for.body62
  %n56.0150 = phi i32 [ %inc73, %for.body62 ], [ 0, %for.cond57.preheader ]
  %coeff_pos.1149 = phi i16 [ %dec63, %for.body62 ], [ %coeff_pos.0.lcssa, %for.cond57.preheader ]
  %acc.1148 = phi i64 [ %add71, %for.body62 ], [ %acc.0.lcssa, %for.cond57.preheader ]
  %dec63 = add i16 %coeff_pos.1149, -1
  %idxprom64 = sext i16 %coeff_pos.1149 to i32
  %arrayidx65 = getelementptr inbounds i16, ptr %3, i32 %idxprom64
  %16 = load i16, ptr %arrayidx65, align 2, !tbaa !18
  %conv66 = sext i16 %16 to i32
  %arrayidx67 = getelementptr inbounds i16, ptr %4, i32 %n56.0150
  %17 = load i16, ptr %arrayidx67, align 2, !tbaa !18
  %conv68 = sext i16 %17 to i32
  %mul69 = mul nsw i32 %conv68, %conv66
  %conv70 = sext i32 %mul69 to i64
  %add71 = add nsw i64 %acc.1148, %conv70
  %inc73 = add nuw nsw i32 %n56.0150, 1
  %exitcond163.not = icmp eq i32 %inc73, %conv40
  br i1 %exitcond163.not, label %for.cond.cleanup61, label %for.body62, !llvm.loop !23
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
!15 = !{!5, !9, i64 10}
!16 = !{!5, !9, i64 14}
!17 = !{!5, !9, i64 12}
!18 = !{!9, !9, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !20}
