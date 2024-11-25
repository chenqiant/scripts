; ModuleID = 'dsps_add_s16_best.c'
source_filename = "dsps_add_s16_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local noundef i32 @dsps_add_s16_ansi(ptr noundef readonly %input1, ptr noundef readonly %input2, ptr noundef writeonly %output, i32 noundef %len, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out, i32 noundef %shift) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq ptr %input1, null
  %cmp1 = icmp eq ptr %input2, null
  %or.cond = or i1 %cmp, %cmp1
  %cmp4 = icmp eq ptr %output, null
  %or.cond412 = or i1 %or.cond, %cmp4
  br i1 %or.cond412, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %and = and i32 %len, -15
  %cmp7413 = icmp sgt i32 %and, 0
  br i1 %cmp7413, label %for.body, label %for.cond225.preheader

for.cond225.preheader:                            ; preds = %for.body, %for.cond.preheader
  %i.0.lcssa = phi i32 [ 0, %for.cond.preheader ], [ %add224, %for.body ]
  %cmp226415 = icmp slt i32 %i.0.lcssa, %len
  br i1 %cmp226415, label %for.body228, label %return

for.body:                                         ; preds = %for.cond.preheader, %for.body
  %i.0414 = phi i32 [ %add224, %for.body ], [ 0, %for.cond.preheader ]
  %mul = mul nsw i32 %i.0414, %step1
  %arrayidx = getelementptr inbounds i16, ptr %input1, i32 %mul
  %0 = load i16, ptr %arrayidx, align 2, !tbaa !4
  %conv = sext i16 %0 to i32
  %mul8 = mul nsw i32 %i.0414, %step2
  %arrayidx9 = getelementptr inbounds i16, ptr %input2, i32 %mul8
  %1 = load i16, ptr %arrayidx9, align 2, !tbaa !4
  %conv10 = sext i16 %1 to i32
  %add = add nsw i32 %conv10, %conv
  %add11 = or disjoint i32 %i.0414, 1
  %mul12 = mul nsw i32 %add11, %step1
  %arrayidx13 = getelementptr inbounds i16, ptr %input1, i32 %mul12
  %2 = load i16, ptr %arrayidx13, align 2, !tbaa !4
  %conv14 = sext i16 %2 to i32
  %mul16 = mul nsw i32 %add11, %step2
  %arrayidx17 = getelementptr inbounds i16, ptr %input2, i32 %mul16
  %3 = load i16, ptr %arrayidx17, align 2, !tbaa !4
  %conv18 = sext i16 %3 to i32
  %add19 = add nsw i32 %conv18, %conv14
  %add20 = or disjoint i32 %i.0414, 2
  %mul21 = mul nsw i32 %add20, %step1
  %arrayidx22 = getelementptr inbounds i16, ptr %input1, i32 %mul21
  %4 = load i16, ptr %arrayidx22, align 2, !tbaa !4
  %conv23 = sext i16 %4 to i32
  %mul25 = mul nsw i32 %add20, %step2
  %arrayidx26 = getelementptr inbounds i16, ptr %input2, i32 %mul25
  %5 = load i16, ptr %arrayidx26, align 2, !tbaa !4
  %conv27 = sext i16 %5 to i32
  %add28 = add nsw i32 %conv27, %conv23
  %add29 = or disjoint i32 %i.0414, 3
  %mul30 = mul nsw i32 %add29, %step1
  %arrayidx31 = getelementptr inbounds i16, ptr %input1, i32 %mul30
  %6 = load i16, ptr %arrayidx31, align 2, !tbaa !4
  %conv32 = sext i16 %6 to i32
  %mul34 = mul nsw i32 %add29, %step2
  %arrayidx35 = getelementptr inbounds i16, ptr %input2, i32 %mul34
  %7 = load i16, ptr %arrayidx35, align 2, !tbaa !4
  %conv36 = sext i16 %7 to i32
  %add37 = add nsw i32 %conv36, %conv32
  %add38 = or disjoint i32 %i.0414, 4
  %mul39 = mul nsw i32 %add38, %step1
  %arrayidx40 = getelementptr inbounds i16, ptr %input1, i32 %mul39
  %8 = load i16, ptr %arrayidx40, align 2, !tbaa !4
  %conv41 = sext i16 %8 to i32
  %mul43 = mul nsw i32 %add38, %step2
  %arrayidx44 = getelementptr inbounds i16, ptr %input2, i32 %mul43
  %9 = load i16, ptr %arrayidx44, align 2, !tbaa !4
  %conv45 = sext i16 %9 to i32
  %add46 = add nsw i32 %conv45, %conv41
  %add47 = or disjoint i32 %i.0414, 5
  %mul48 = mul nsw i32 %add47, %step1
  %arrayidx49 = getelementptr inbounds i16, ptr %input1, i32 %mul48
  %10 = load i16, ptr %arrayidx49, align 2, !tbaa !4
  %conv50 = sext i16 %10 to i32
  %mul52 = mul nsw i32 %add47, %step2
  %arrayidx53 = getelementptr inbounds i16, ptr %input2, i32 %mul52
  %11 = load i16, ptr %arrayidx53, align 2, !tbaa !4
  %conv54 = sext i16 %11 to i32
  %add55 = add nsw i32 %conv54, %conv50
  %add56 = or disjoint i32 %i.0414, 6
  %mul57 = mul nsw i32 %add56, %step1
  %arrayidx58 = getelementptr inbounds i16, ptr %input1, i32 %mul57
  %12 = load i16, ptr %arrayidx58, align 2, !tbaa !4
  %conv59 = sext i16 %12 to i32
  %mul61 = mul nsw i32 %add56, %step2
  %arrayidx62 = getelementptr inbounds i16, ptr %input2, i32 %mul61
  %13 = load i16, ptr %arrayidx62, align 2, !tbaa !4
  %conv63 = sext i16 %13 to i32
  %add64 = add nsw i32 %conv63, %conv59
  %add65 = or disjoint i32 %i.0414, 7
  %mul66 = mul nsw i32 %add65, %step1
  %arrayidx67 = getelementptr inbounds i16, ptr %input1, i32 %mul66
  %14 = load i16, ptr %arrayidx67, align 2, !tbaa !4
  %conv68 = sext i16 %14 to i32
  %mul70 = mul nsw i32 %add65, %step2
  %arrayidx71 = getelementptr inbounds i16, ptr %input2, i32 %mul70
  %15 = load i16, ptr %arrayidx71, align 2, !tbaa !4
  %conv72 = sext i16 %15 to i32
  %add73 = add nsw i32 %conv72, %conv68
  %add74 = or disjoint i32 %i.0414, 8
  %mul75 = mul nsw i32 %add74, %step1
  %arrayidx76 = getelementptr inbounds i16, ptr %input1, i32 %mul75
  %16 = load i16, ptr %arrayidx76, align 2, !tbaa !4
  %conv77 = sext i16 %16 to i32
  %mul79 = mul nsw i32 %add74, %step2
  %arrayidx80 = getelementptr inbounds i16, ptr %input2, i32 %mul79
  %17 = load i16, ptr %arrayidx80, align 2, !tbaa !4
  %conv81 = sext i16 %17 to i32
  %add82 = add nsw i32 %conv81, %conv77
  %add83 = or disjoint i32 %i.0414, 9
  %mul84 = mul nsw i32 %add83, %step1
  %arrayidx85 = getelementptr inbounds i16, ptr %input1, i32 %mul84
  %18 = load i16, ptr %arrayidx85, align 2, !tbaa !4
  %conv86 = sext i16 %18 to i32
  %mul88 = mul nsw i32 %add83, %step2
  %arrayidx89 = getelementptr inbounds i16, ptr %input2, i32 %mul88
  %19 = load i16, ptr %arrayidx89, align 2, !tbaa !4
  %conv90 = sext i16 %19 to i32
  %add91 = add nsw i32 %conv90, %conv86
  %add92 = or disjoint i32 %i.0414, 10
  %mul93 = mul nsw i32 %add92, %step1
  %arrayidx94 = getelementptr inbounds i16, ptr %input1, i32 %mul93
  %20 = load i16, ptr %arrayidx94, align 2, !tbaa !4
  %conv95 = sext i16 %20 to i32
  %mul97 = mul nsw i32 %add92, %step2
  %arrayidx98 = getelementptr inbounds i16, ptr %input2, i32 %mul97
  %21 = load i16, ptr %arrayidx98, align 2, !tbaa !4
  %conv99 = sext i16 %21 to i32
  %add100 = add nsw i32 %conv99, %conv95
  %add101 = or disjoint i32 %i.0414, 11
  %mul102 = mul nsw i32 %add101, %step1
  %arrayidx103 = getelementptr inbounds i16, ptr %input1, i32 %mul102
  %22 = load i16, ptr %arrayidx103, align 2, !tbaa !4
  %conv104 = sext i16 %22 to i32
  %mul106 = mul nsw i32 %add101, %step2
  %arrayidx107 = getelementptr inbounds i16, ptr %input2, i32 %mul106
  %23 = load i16, ptr %arrayidx107, align 2, !tbaa !4
  %conv108 = sext i16 %23 to i32
  %add109 = add nsw i32 %conv108, %conv104
  %add110 = or disjoint i32 %i.0414, 12
  %mul111 = mul nsw i32 %add110, %step1
  %arrayidx112 = getelementptr inbounds i16, ptr %input1, i32 %mul111
  %24 = load i16, ptr %arrayidx112, align 2, !tbaa !4
  %conv113 = sext i16 %24 to i32
  %mul115 = mul nsw i32 %add110, %step2
  %arrayidx116 = getelementptr inbounds i16, ptr %input2, i32 %mul115
  %25 = load i16, ptr %arrayidx116, align 2, !tbaa !4
  %conv117 = sext i16 %25 to i32
  %add118 = add nsw i32 %conv117, %conv113
  %add119 = or disjoint i32 %i.0414, 13
  %mul120 = mul nsw i32 %add119, %step1
  %arrayidx121 = getelementptr inbounds i16, ptr %input1, i32 %mul120
  %26 = load i16, ptr %arrayidx121, align 2, !tbaa !4
  %conv122 = sext i16 %26 to i32
  %mul124 = mul nsw i32 %add119, %step2
  %arrayidx125 = getelementptr inbounds i16, ptr %input2, i32 %mul124
  %27 = load i16, ptr %arrayidx125, align 2, !tbaa !4
  %conv126 = sext i16 %27 to i32
  %add127 = add nsw i32 %conv126, %conv122
  %add128 = or disjoint i32 %i.0414, 14
  %mul129 = mul nsw i32 %add128, %step1
  %arrayidx130 = getelementptr inbounds i16, ptr %input1, i32 %mul129
  %28 = load i16, ptr %arrayidx130, align 2, !tbaa !4
  %conv131 = sext i16 %28 to i32
  %mul133 = mul nsw i32 %add128, %step2
  %arrayidx134 = getelementptr inbounds i16, ptr %input2, i32 %mul133
  %29 = load i16, ptr %arrayidx134, align 2, !tbaa !4
  %conv135 = sext i16 %29 to i32
  %add136 = add nsw i32 %conv135, %conv131
  %add137 = or disjoint i32 %i.0414, 15
  %mul138 = mul nsw i32 %add137, %step1
  %arrayidx139 = getelementptr inbounds i16, ptr %input1, i32 %mul138
  %30 = load i16, ptr %arrayidx139, align 2, !tbaa !4
  %conv140 = sext i16 %30 to i32
  %mul142 = mul nsw i32 %add137, %step2
  %arrayidx143 = getelementptr inbounds i16, ptr %input2, i32 %mul142
  %31 = load i16, ptr %arrayidx143, align 2, !tbaa !4
  %conv144 = sext i16 %31 to i32
  %add145 = add nsw i32 %conv144, %conv140
  %shr = ashr i32 %add, %shift
  %conv146 = trunc i32 %shr to i16
  %mul147 = mul nsw i32 %i.0414, %step_out
  %arrayidx148 = getelementptr inbounds i16, ptr %output, i32 %mul147
  store i16 %conv146, ptr %arrayidx148, align 2, !tbaa !4
  %shr149 = ashr i32 %add19, %shift
  %conv150 = trunc i32 %shr149 to i16
  %mul152 = mul nsw i32 %add11, %step_out
  %arrayidx153 = getelementptr inbounds i16, ptr %output, i32 %mul152
  store i16 %conv150, ptr %arrayidx153, align 2, !tbaa !4
  %shr154 = ashr i32 %add28, %shift
  %conv155 = trunc i32 %shr154 to i16
  %mul157 = mul nsw i32 %add20, %step_out
  %arrayidx158 = getelementptr inbounds i16, ptr %output, i32 %mul157
  store i16 %conv155, ptr %arrayidx158, align 2, !tbaa !4
  %shr159 = ashr i32 %add37, %shift
  %conv160 = trunc i32 %shr159 to i16
  %mul162 = mul nsw i32 %add29, %step_out
  %arrayidx163 = getelementptr inbounds i16, ptr %output, i32 %mul162
  store i16 %conv160, ptr %arrayidx163, align 2, !tbaa !4
  %shr164 = ashr i32 %add46, %shift
  %conv165 = trunc i32 %shr164 to i16
  %mul167 = mul nsw i32 %add38, %step_out
  %arrayidx168 = getelementptr inbounds i16, ptr %output, i32 %mul167
  store i16 %conv165, ptr %arrayidx168, align 2, !tbaa !4
  %shr169 = ashr i32 %add55, %shift
  %conv170 = trunc i32 %shr169 to i16
  %mul172 = mul nsw i32 %add47, %step_out
  %arrayidx173 = getelementptr inbounds i16, ptr %output, i32 %mul172
  store i16 %conv170, ptr %arrayidx173, align 2, !tbaa !4
  %shr174 = ashr i32 %add64, %shift
  %conv175 = trunc i32 %shr174 to i16
  %mul177 = mul nsw i32 %add56, %step_out
  %arrayidx178 = getelementptr inbounds i16, ptr %output, i32 %mul177
  store i16 %conv175, ptr %arrayidx178, align 2, !tbaa !4
  %shr179 = ashr i32 %add73, %shift
  %conv180 = trunc i32 %shr179 to i16
  %mul182 = mul nsw i32 %add65, %step_out
  %arrayidx183 = getelementptr inbounds i16, ptr %output, i32 %mul182
  store i16 %conv180, ptr %arrayidx183, align 2, !tbaa !4
  %shr184 = ashr i32 %add82, %shift
  %conv185 = trunc i32 %shr184 to i16
  %mul187 = mul nsw i32 %add74, %step_out
  %arrayidx188 = getelementptr inbounds i16, ptr %output, i32 %mul187
  store i16 %conv185, ptr %arrayidx188, align 2, !tbaa !4
  %shr189 = ashr i32 %add91, %shift
  %conv190 = trunc i32 %shr189 to i16
  %mul192 = mul nsw i32 %add83, %step_out
  %arrayidx193 = getelementptr inbounds i16, ptr %output, i32 %mul192
  store i16 %conv190, ptr %arrayidx193, align 2, !tbaa !4
  %shr194 = ashr i32 %add100, %shift
  %conv195 = trunc i32 %shr194 to i16
  %mul197 = mul nsw i32 %add92, %step_out
  %arrayidx198 = getelementptr inbounds i16, ptr %output, i32 %mul197
  store i16 %conv195, ptr %arrayidx198, align 2, !tbaa !4
  %shr199 = ashr i32 %add109, %shift
  %conv200 = trunc i32 %shr199 to i16
  %mul202 = mul nsw i32 %add101, %step_out
  %arrayidx203 = getelementptr inbounds i16, ptr %output, i32 %mul202
  store i16 %conv200, ptr %arrayidx203, align 2, !tbaa !4
  %shr204 = ashr i32 %add118, %shift
  %conv205 = trunc i32 %shr204 to i16
  %mul207 = mul nsw i32 %add110, %step_out
  %arrayidx208 = getelementptr inbounds i16, ptr %output, i32 %mul207
  store i16 %conv205, ptr %arrayidx208, align 2, !tbaa !4
  %shr209 = ashr i32 %add127, %shift
  %conv210 = trunc i32 %shr209 to i16
  %mul212 = mul nsw i32 %add119, %step_out
  %arrayidx213 = getelementptr inbounds i16, ptr %output, i32 %mul212
  store i16 %conv210, ptr %arrayidx213, align 2, !tbaa !4
  %shr214 = ashr i32 %add136, %shift
  %conv215 = trunc i32 %shr214 to i16
  %mul217 = mul nsw i32 %add128, %step_out
  %arrayidx218 = getelementptr inbounds i16, ptr %output, i32 %mul217
  store i16 %conv215, ptr %arrayidx218, align 2, !tbaa !4
  %shr219 = ashr i32 %add145, %shift
  %conv220 = trunc i32 %shr219 to i16
  %mul222 = mul nsw i32 %add137, %step_out
  %arrayidx223 = getelementptr inbounds i16, ptr %output, i32 %mul222
  store i16 %conv220, ptr %arrayidx223, align 2, !tbaa !4
  %add224 = add nuw nsw i32 %i.0414, 16
  %cmp7 = icmp slt i32 %add224, %and
  br i1 %cmp7, label %for.body, label %for.cond225.preheader, !llvm.loop !8

for.body228:                                      ; preds = %for.cond225.preheader, %for.body228
  %i.1416 = phi i32 [ %inc, %for.body228 ], [ %i.0.lcssa, %for.cond225.preheader ]
  %mul229 = mul nsw i32 %i.1416, %step1
  %arrayidx230 = getelementptr inbounds i16, ptr %input1, i32 %mul229
  %32 = load i16, ptr %arrayidx230, align 2, !tbaa !4
  %conv231 = sext i16 %32 to i32
  %mul232 = mul nsw i32 %i.1416, %step2
  %arrayidx233 = getelementptr inbounds i16, ptr %input2, i32 %mul232
  %33 = load i16, ptr %arrayidx233, align 2, !tbaa !4
  %conv234 = sext i16 %33 to i32
  %add235 = add nsw i32 %conv234, %conv231
  %shr236 = ashr i32 %add235, %shift
  %conv237 = trunc i32 %shr236 to i16
  %mul238 = mul nsw i32 %i.1416, %step_out
  %arrayidx239 = getelementptr inbounds i16, ptr %output, i32 %mul238
  store i16 %conv237, ptr %arrayidx239, align 2, !tbaa !4
  %inc = add nuw nsw i32 %i.1416, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body228, !llvm.loop !10

return:                                           ; preds = %for.body228, %for.cond225.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond225.preheader ], [ 0, %for.body228 ]
  ret i32 %retval.0
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

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
