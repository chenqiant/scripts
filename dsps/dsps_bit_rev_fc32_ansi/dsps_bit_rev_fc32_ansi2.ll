; ModuleID = 'dsps_bit_rev_fc32_ansi.ll'
source_filename = "dsps_bit_rev_fc32_ansi2.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nounwind
define dso_local noundef i32 @dsps_bit_rev_fc32_ansi(ptr nocapture noundef %data, i32 noundef %N) local_unnamed_addr #0 {
entry:
  %call = tail call zeroext i1 @dsp_is_power_of_two(i32 noundef %N) #2
  br i1 %call, label %if.end, label %return

if.end:                                           ; preds = %entry
  %sub = add nsw i32 %N, -8
  %cmp45 = icmp sgt i32 %N, 9
  br i1 %cmp45, label %for.body.preheader, label %for.cond8.preheader

for.body.preheader:                               ; preds = %if.end
  %k.042.i = lshr i32 %N, 1
  br label %for.body

for.cond8.preheader:                              ; preds = %bit_rev_single_step.exit168, %if.end
  %j.0 = phi i32 [ 0, %if.end ], [ %add.i157, %bit_rev_single_step.exit168 ]
  %i.0.lcssa = phi i32 [ 1, %if.end ], [ %add7, %bit_rev_single_step.exit168 ]
  %sub9 = add nsw i32 %N, -1
  %cmp1047 = icmp slt i32 %i.0.lcssa, %sub9
  br i1 %cmp1047, label %for.body11.preheader, label %return

for.body11.preheader:                             ; preds = %for.cond8.preheader
  %k.042.i170 = ashr i32 %N, 1
  br label %for.body11

for.body:                                         ; preds = %for.body.preheader, %bit_rev_single_step.exit168
  %j.1 = phi i32 [ %add.i157, %bit_rev_single_step.exit168 ], [ 0, %for.body.preheader ]
  %i.046 = phi i32 [ %add7, %bit_rev_single_step.exit168 ], [ 1, %for.body.preheader ]
  %cmp.not43.i = icmp sgt i32 %k.042.i, %j.1
  br i1 %cmp.not43.i, label %while.end.i, label %while.body.i

while.body.i:                                     ; preds = %for.body, %while.body.i
  %k.044.i = phi i32 [ %k.0.i, %while.body.i ], [ %k.042.i, %for.body ]
  %0 = phi i32 [ %sub.i, %while.body.i ], [ %j.1, %for.body ]
  %sub.i = sub nsw i32 %0, %k.044.i
  %k.0.i = lshr i32 %k.044.i, 1
  %cmp.not.i = icmp sgt i32 %k.0.i, %sub.i
  br i1 %cmp.not.i, label %while.end.i, label %while.body.i, !llvm.loop !4

while.end.i:                                      ; preds = %while.body.i, %for.body
  %k.0.lcssa.i = phi i32 [ %k.042.i, %for.body ], [ %k.0.i, %while.body.i ]
  %.lcssa.i = phi i32 [ %j.1, %for.body ], [ %sub.i, %while.body.i ]
  %add.i = add nsw i32 %.lcssa.i, %k.0.lcssa.i
  %cmp2.i = icmp sgt i32 %add.i, %i.046
  br i1 %cmp2.i, label %if.then.i, label %bit_rev_single_step.exit

if.then.i:                                        ; preds = %while.end.i
  %mul.i = shl nsw i32 %add.i, 1
  %arrayidx.i = getelementptr inbounds float, ptr %data, i32 %mul.i
  %1 = load float, ptr %arrayidx.i, align 4, !tbaa !7
  %add4.i = or disjoint i32 %mul.i, 1
  %arrayidx5.i = getelementptr inbounds float, ptr %data, i32 %add4.i
  %2 = load float, ptr %arrayidx5.i, align 4, !tbaa !7
  %mul6.i = shl nuw nsw i32 %i.046, 1
  %arrayidx7.i = getelementptr inbounds float, ptr %data, i32 %mul6.i
  %3 = load float, ptr %arrayidx7.i, align 4, !tbaa !7
  store float %3, ptr %arrayidx.i, align 4, !tbaa !7
  %add11.i = or disjoint i32 %mul6.i, 1
  %arrayidx12.i = getelementptr inbounds float, ptr %data, i32 %add11.i
  %4 = load float, ptr %arrayidx12.i, align 4, !tbaa !7
  store float %4, ptr %arrayidx5.i, align 4, !tbaa !7
  store float %1, ptr %arrayidx7.i, align 4, !tbaa !7
  store float %2, ptr %arrayidx12.i, align 4, !tbaa !7
  br label %bit_rev_single_step.exit

bit_rev_single_step.exit:                         ; preds = %while.end.i, %if.then.i
  %add = add nuw nsw i32 %i.046, 1
  %cmp.not43.i3 = icmp sgt i32 %k.042.i, %add.i
  br i1 %cmp.not43.i3, label %while.end.i10, label %while.body.i4

while.body.i4:                                    ; preds = %bit_rev_single_step.exit, %while.body.i4
  %k.044.i5 = phi i32 [ %k.0.i7, %while.body.i4 ], [ %k.042.i, %bit_rev_single_step.exit ]
  %5 = phi i32 [ %sub.i6, %while.body.i4 ], [ %add.i, %bit_rev_single_step.exit ]
  %sub.i6 = sub nsw i32 %5, %k.044.i5
  %k.0.i7 = lshr i32 %k.044.i5, 1
  %cmp.not.i8 = icmp sgt i32 %k.0.i7, %sub.i6
  br i1 %cmp.not.i8, label %while.end.i10, label %while.body.i4, !llvm.loop !4

while.end.i10:                                    ; preds = %while.body.i4, %bit_rev_single_step.exit
  %k.0.lcssa.i11 = phi i32 [ %k.042.i, %bit_rev_single_step.exit ], [ %k.0.i7, %while.body.i4 ]
  %.lcssa.i12 = phi i32 [ %add.i, %bit_rev_single_step.exit ], [ %sub.i6, %while.body.i4 ]
  %add.i13 = add nsw i32 %.lcssa.i12, %k.0.lcssa.i11
  %cmp2.i14 = icmp sgt i32 %add.i13, %add
  br i1 %cmp2.i14, label %if.then.i15, label %bit_rev_single_step.exit24

if.then.i15:                                      ; preds = %while.end.i10
  %mul.i16 = shl nsw i32 %add.i13, 1
  %arrayidx.i17 = getelementptr inbounds float, ptr %data, i32 %mul.i16
  %6 = load float, ptr %arrayidx.i17, align 4, !tbaa !7
  %add4.i18 = or disjoint i32 %mul.i16, 1
  %arrayidx5.i19 = getelementptr inbounds float, ptr %data, i32 %add4.i18
  %7 = load float, ptr %arrayidx5.i19, align 4, !tbaa !7
  %mul6.i20 = shl nuw nsw i32 %add, 1
  %arrayidx7.i21 = getelementptr inbounds float, ptr %data, i32 %mul6.i20
  %8 = load float, ptr %arrayidx7.i21, align 4, !tbaa !7
  store float %8, ptr %arrayidx.i17, align 4, !tbaa !7
  %add11.i22 = or disjoint i32 %mul6.i20, 1
  %arrayidx12.i23 = getelementptr inbounds float, ptr %data, i32 %add11.i22
  %9 = load float, ptr %arrayidx12.i23, align 4, !tbaa !7
  store float %9, ptr %arrayidx5.i19, align 4, !tbaa !7
  store float %6, ptr %arrayidx7.i21, align 4, !tbaa !7
  store float %7, ptr %arrayidx12.i23, align 4, !tbaa !7
  br label %bit_rev_single_step.exit24

bit_rev_single_step.exit24:                       ; preds = %while.end.i10, %if.then.i15
  %add1 = add nuw nsw i32 %i.046, 2
  %cmp.not43.i27 = icmp sgt i32 %k.042.i, %add.i13
  br i1 %cmp.not43.i27, label %while.end.i34, label %while.body.i28

while.body.i28:                                   ; preds = %bit_rev_single_step.exit24, %while.body.i28
  %k.044.i29 = phi i32 [ %k.0.i31, %while.body.i28 ], [ %k.042.i, %bit_rev_single_step.exit24 ]
  %10 = phi i32 [ %sub.i30, %while.body.i28 ], [ %add.i13, %bit_rev_single_step.exit24 ]
  %sub.i30 = sub nsw i32 %10, %k.044.i29
  %k.0.i31 = lshr i32 %k.044.i29, 1
  %cmp.not.i32 = icmp sgt i32 %k.0.i31, %sub.i30
  br i1 %cmp.not.i32, label %while.end.i34, label %while.body.i28, !llvm.loop !4

while.end.i34:                                    ; preds = %while.body.i28, %bit_rev_single_step.exit24
  %k.0.lcssa.i35 = phi i32 [ %k.042.i, %bit_rev_single_step.exit24 ], [ %k.0.i31, %while.body.i28 ]
  %.lcssa.i36 = phi i32 [ %add.i13, %bit_rev_single_step.exit24 ], [ %sub.i30, %while.body.i28 ]
  %add.i37 = add nsw i32 %.lcssa.i36, %k.0.lcssa.i35
  %cmp2.i38 = icmp sgt i32 %add.i37, %add1
  br i1 %cmp2.i38, label %if.then.i39, label %bit_rev_single_step.exit48

if.then.i39:                                      ; preds = %while.end.i34
  %mul.i40 = shl nsw i32 %add.i37, 1
  %arrayidx.i41 = getelementptr inbounds float, ptr %data, i32 %mul.i40
  %11 = load float, ptr %arrayidx.i41, align 4, !tbaa !7
  %add4.i42 = or disjoint i32 %mul.i40, 1
  %arrayidx5.i43 = getelementptr inbounds float, ptr %data, i32 %add4.i42
  %12 = load float, ptr %arrayidx5.i43, align 4, !tbaa !7
  %mul6.i44 = shl nuw nsw i32 %add1, 1
  %arrayidx7.i45 = getelementptr inbounds float, ptr %data, i32 %mul6.i44
  %13 = load float, ptr %arrayidx7.i45, align 4, !tbaa !7
  store float %13, ptr %arrayidx.i41, align 4, !tbaa !7
  %add11.i46 = or disjoint i32 %mul6.i44, 1
  %arrayidx12.i47 = getelementptr inbounds float, ptr %data, i32 %add11.i46
  %14 = load float, ptr %arrayidx12.i47, align 4, !tbaa !7
  store float %14, ptr %arrayidx5.i43, align 4, !tbaa !7
  store float %11, ptr %arrayidx7.i45, align 4, !tbaa !7
  store float %12, ptr %arrayidx12.i47, align 4, !tbaa !7
  br label %bit_rev_single_step.exit48

bit_rev_single_step.exit48:                       ; preds = %while.end.i34, %if.then.i39
  %add2 = add nuw nsw i32 %i.046, 3
  %cmp.not43.i51 = icmp sgt i32 %k.042.i, %add.i37
  br i1 %cmp.not43.i51, label %while.end.i58, label %while.body.i52

while.body.i52:                                   ; preds = %bit_rev_single_step.exit48, %while.body.i52
  %k.044.i53 = phi i32 [ %k.0.i55, %while.body.i52 ], [ %k.042.i, %bit_rev_single_step.exit48 ]
  %15 = phi i32 [ %sub.i54, %while.body.i52 ], [ %add.i37, %bit_rev_single_step.exit48 ]
  %sub.i54 = sub nsw i32 %15, %k.044.i53
  %k.0.i55 = lshr i32 %k.044.i53, 1
  %cmp.not.i56 = icmp sgt i32 %k.0.i55, %sub.i54
  br i1 %cmp.not.i56, label %while.end.i58, label %while.body.i52, !llvm.loop !4

while.end.i58:                                    ; preds = %while.body.i52, %bit_rev_single_step.exit48
  %k.0.lcssa.i59 = phi i32 [ %k.042.i, %bit_rev_single_step.exit48 ], [ %k.0.i55, %while.body.i52 ]
  %.lcssa.i60 = phi i32 [ %add.i37, %bit_rev_single_step.exit48 ], [ %sub.i54, %while.body.i52 ]
  %add.i61 = add nsw i32 %.lcssa.i60, %k.0.lcssa.i59
  %cmp2.i62 = icmp sgt i32 %add.i61, %add2
  br i1 %cmp2.i62, label %if.then.i63, label %bit_rev_single_step.exit72

if.then.i63:                                      ; preds = %while.end.i58
  %mul.i64 = shl nsw i32 %add.i61, 1
  %arrayidx.i65 = getelementptr inbounds float, ptr %data, i32 %mul.i64
  %16 = load float, ptr %arrayidx.i65, align 4, !tbaa !7
  %add4.i66 = or disjoint i32 %mul.i64, 1
  %arrayidx5.i67 = getelementptr inbounds float, ptr %data, i32 %add4.i66
  %17 = load float, ptr %arrayidx5.i67, align 4, !tbaa !7
  %mul6.i68 = shl nuw nsw i32 %add2, 1
  %arrayidx7.i69 = getelementptr inbounds float, ptr %data, i32 %mul6.i68
  %18 = load float, ptr %arrayidx7.i69, align 4, !tbaa !7
  store float %18, ptr %arrayidx.i65, align 4, !tbaa !7
  %add11.i70 = or disjoint i32 %mul6.i68, 1
  %arrayidx12.i71 = getelementptr inbounds float, ptr %data, i32 %add11.i70
  %19 = load float, ptr %arrayidx12.i71, align 4, !tbaa !7
  store float %19, ptr %arrayidx5.i67, align 4, !tbaa !7
  store float %16, ptr %arrayidx7.i69, align 4, !tbaa !7
  store float %17, ptr %arrayidx12.i71, align 4, !tbaa !7
  br label %bit_rev_single_step.exit72

bit_rev_single_step.exit72:                       ; preds = %while.end.i58, %if.then.i63
  %add3 = add nuw nsw i32 %i.046, 4
  %cmp.not43.i75 = icmp sgt i32 %k.042.i, %add.i61
  br i1 %cmp.not43.i75, label %while.end.i82, label %while.body.i76

while.body.i76:                                   ; preds = %bit_rev_single_step.exit72, %while.body.i76
  %k.044.i77 = phi i32 [ %k.0.i79, %while.body.i76 ], [ %k.042.i, %bit_rev_single_step.exit72 ]
  %20 = phi i32 [ %sub.i78, %while.body.i76 ], [ %add.i61, %bit_rev_single_step.exit72 ]
  %sub.i78 = sub nsw i32 %20, %k.044.i77
  %k.0.i79 = lshr i32 %k.044.i77, 1
  %cmp.not.i80 = icmp sgt i32 %k.0.i79, %sub.i78
  br i1 %cmp.not.i80, label %while.end.i82, label %while.body.i76, !llvm.loop !4

while.end.i82:                                    ; preds = %while.body.i76, %bit_rev_single_step.exit72
  %k.0.lcssa.i83 = phi i32 [ %k.042.i, %bit_rev_single_step.exit72 ], [ %k.0.i79, %while.body.i76 ]
  %.lcssa.i84 = phi i32 [ %add.i61, %bit_rev_single_step.exit72 ], [ %sub.i78, %while.body.i76 ]
  %add.i85 = add nsw i32 %.lcssa.i84, %k.0.lcssa.i83
  %cmp2.i86 = icmp sgt i32 %add.i85, %add3
  br i1 %cmp2.i86, label %if.then.i87, label %bit_rev_single_step.exit96

if.then.i87:                                      ; preds = %while.end.i82
  %mul.i88 = shl nsw i32 %add.i85, 1
  %arrayidx.i89 = getelementptr inbounds float, ptr %data, i32 %mul.i88
  %21 = load float, ptr %arrayidx.i89, align 4, !tbaa !7
  %add4.i90 = or disjoint i32 %mul.i88, 1
  %arrayidx5.i91 = getelementptr inbounds float, ptr %data, i32 %add4.i90
  %22 = load float, ptr %arrayidx5.i91, align 4, !tbaa !7
  %mul6.i92 = shl nuw nsw i32 %add3, 1
  %arrayidx7.i93 = getelementptr inbounds float, ptr %data, i32 %mul6.i92
  %23 = load float, ptr %arrayidx7.i93, align 4, !tbaa !7
  store float %23, ptr %arrayidx.i89, align 4, !tbaa !7
  %add11.i94 = or disjoint i32 %mul6.i92, 1
  %arrayidx12.i95 = getelementptr inbounds float, ptr %data, i32 %add11.i94
  %24 = load float, ptr %arrayidx12.i95, align 4, !tbaa !7
  store float %24, ptr %arrayidx5.i91, align 4, !tbaa !7
  store float %21, ptr %arrayidx7.i93, align 4, !tbaa !7
  store float %22, ptr %arrayidx12.i95, align 4, !tbaa !7
  br label %bit_rev_single_step.exit96

bit_rev_single_step.exit96:                       ; preds = %while.end.i82, %if.then.i87
  %add4 = add nuw nsw i32 %i.046, 5
  %cmp.not43.i99 = icmp sgt i32 %k.042.i, %add.i85
  br i1 %cmp.not43.i99, label %while.end.i106, label %while.body.i100

while.body.i100:                                  ; preds = %bit_rev_single_step.exit96, %while.body.i100
  %k.044.i101 = phi i32 [ %k.0.i103, %while.body.i100 ], [ %k.042.i, %bit_rev_single_step.exit96 ]
  %25 = phi i32 [ %sub.i102, %while.body.i100 ], [ %add.i85, %bit_rev_single_step.exit96 ]
  %sub.i102 = sub nsw i32 %25, %k.044.i101
  %k.0.i103 = lshr i32 %k.044.i101, 1
  %cmp.not.i104 = icmp sgt i32 %k.0.i103, %sub.i102
  br i1 %cmp.not.i104, label %while.end.i106, label %while.body.i100, !llvm.loop !4

while.end.i106:                                   ; preds = %while.body.i100, %bit_rev_single_step.exit96
  %k.0.lcssa.i107 = phi i32 [ %k.042.i, %bit_rev_single_step.exit96 ], [ %k.0.i103, %while.body.i100 ]
  %.lcssa.i108 = phi i32 [ %add.i85, %bit_rev_single_step.exit96 ], [ %sub.i102, %while.body.i100 ]
  %add.i109 = add nsw i32 %.lcssa.i108, %k.0.lcssa.i107
  %cmp2.i110 = icmp sgt i32 %add.i109, %add4
  br i1 %cmp2.i110, label %if.then.i111, label %bit_rev_single_step.exit120

if.then.i111:                                     ; preds = %while.end.i106
  %mul.i112 = shl nsw i32 %add.i109, 1
  %arrayidx.i113 = getelementptr inbounds float, ptr %data, i32 %mul.i112
  %26 = load float, ptr %arrayidx.i113, align 4, !tbaa !7
  %add4.i114 = or disjoint i32 %mul.i112, 1
  %arrayidx5.i115 = getelementptr inbounds float, ptr %data, i32 %add4.i114
  %27 = load float, ptr %arrayidx5.i115, align 4, !tbaa !7
  %mul6.i116 = shl nuw nsw i32 %add4, 1
  %arrayidx7.i117 = getelementptr inbounds float, ptr %data, i32 %mul6.i116
  %28 = load float, ptr %arrayidx7.i117, align 4, !tbaa !7
  store float %28, ptr %arrayidx.i113, align 4, !tbaa !7
  %add11.i118 = or disjoint i32 %mul6.i116, 1
  %arrayidx12.i119 = getelementptr inbounds float, ptr %data, i32 %add11.i118
  %29 = load float, ptr %arrayidx12.i119, align 4, !tbaa !7
  store float %29, ptr %arrayidx5.i115, align 4, !tbaa !7
  store float %26, ptr %arrayidx7.i117, align 4, !tbaa !7
  store float %27, ptr %arrayidx12.i119, align 4, !tbaa !7
  br label %bit_rev_single_step.exit120

bit_rev_single_step.exit120:                      ; preds = %while.end.i106, %if.then.i111
  %add5 = add nuw nsw i32 %i.046, 6
  %cmp.not43.i123 = icmp sgt i32 %k.042.i, %add.i109
  br i1 %cmp.not43.i123, label %while.end.i130, label %while.body.i124

while.body.i124:                                  ; preds = %bit_rev_single_step.exit120, %while.body.i124
  %k.044.i125 = phi i32 [ %k.0.i127, %while.body.i124 ], [ %k.042.i, %bit_rev_single_step.exit120 ]
  %30 = phi i32 [ %sub.i126, %while.body.i124 ], [ %add.i109, %bit_rev_single_step.exit120 ]
  %sub.i126 = sub nsw i32 %30, %k.044.i125
  %k.0.i127 = lshr i32 %k.044.i125, 1
  %cmp.not.i128 = icmp sgt i32 %k.0.i127, %sub.i126
  br i1 %cmp.not.i128, label %while.end.i130, label %while.body.i124, !llvm.loop !4

while.end.i130:                                   ; preds = %while.body.i124, %bit_rev_single_step.exit120
  %k.0.lcssa.i131 = phi i32 [ %k.042.i, %bit_rev_single_step.exit120 ], [ %k.0.i127, %while.body.i124 ]
  %.lcssa.i132 = phi i32 [ %add.i109, %bit_rev_single_step.exit120 ], [ %sub.i126, %while.body.i124 ]
  %add.i133 = add nsw i32 %.lcssa.i132, %k.0.lcssa.i131
  %cmp2.i134 = icmp sgt i32 %add.i133, %add5
  br i1 %cmp2.i134, label %if.then.i135, label %bit_rev_single_step.exit144

if.then.i135:                                     ; preds = %while.end.i130
  %mul.i136 = shl nsw i32 %add.i133, 1
  %arrayidx.i137 = getelementptr inbounds float, ptr %data, i32 %mul.i136
  %31 = load float, ptr %arrayidx.i137, align 4, !tbaa !7
  %add4.i138 = or disjoint i32 %mul.i136, 1
  %arrayidx5.i139 = getelementptr inbounds float, ptr %data, i32 %add4.i138
  %32 = load float, ptr %arrayidx5.i139, align 4, !tbaa !7
  %mul6.i140 = shl nuw nsw i32 %add5, 1
  %arrayidx7.i141 = getelementptr inbounds float, ptr %data, i32 %mul6.i140
  %33 = load float, ptr %arrayidx7.i141, align 4, !tbaa !7
  store float %33, ptr %arrayidx.i137, align 4, !tbaa !7
  %add11.i142 = or disjoint i32 %mul6.i140, 1
  %arrayidx12.i143 = getelementptr inbounds float, ptr %data, i32 %add11.i142
  %34 = load float, ptr %arrayidx12.i143, align 4, !tbaa !7
  store float %34, ptr %arrayidx5.i139, align 4, !tbaa !7
  store float %31, ptr %arrayidx7.i141, align 4, !tbaa !7
  store float %32, ptr %arrayidx12.i143, align 4, !tbaa !7
  br label %bit_rev_single_step.exit144

bit_rev_single_step.exit144:                      ; preds = %while.end.i130, %if.then.i135
  %add6 = add nuw nsw i32 %i.046, 7
  %cmp.not43.i147 = icmp sgt i32 %k.042.i, %add.i133
  br i1 %cmp.not43.i147, label %while.end.i154, label %while.body.i148

while.body.i148:                                  ; preds = %bit_rev_single_step.exit144, %while.body.i148
  %k.044.i149 = phi i32 [ %k.0.i151, %while.body.i148 ], [ %k.042.i, %bit_rev_single_step.exit144 ]
  %35 = phi i32 [ %sub.i150, %while.body.i148 ], [ %add.i133, %bit_rev_single_step.exit144 ]
  %sub.i150 = sub nsw i32 %35, %k.044.i149
  %k.0.i151 = lshr i32 %k.044.i149, 1
  %cmp.not.i152 = icmp sgt i32 %k.0.i151, %sub.i150
  br i1 %cmp.not.i152, label %while.end.i154, label %while.body.i148, !llvm.loop !4

while.end.i154:                                   ; preds = %while.body.i148, %bit_rev_single_step.exit144
  %k.0.lcssa.i155 = phi i32 [ %k.042.i, %bit_rev_single_step.exit144 ], [ %k.0.i151, %while.body.i148 ]
  %.lcssa.i156 = phi i32 [ %add.i133, %bit_rev_single_step.exit144 ], [ %sub.i150, %while.body.i148 ]
  %add.i157 = add nsw i32 %.lcssa.i156, %k.0.lcssa.i155
  %cmp2.i158 = icmp sgt i32 %add.i157, %add6
  br i1 %cmp2.i158, label %if.then.i159, label %bit_rev_single_step.exit168

if.then.i159:                                     ; preds = %while.end.i154
  %mul.i160 = shl nsw i32 %add.i157, 1
  %arrayidx.i161 = getelementptr inbounds float, ptr %data, i32 %mul.i160
  %36 = load float, ptr %arrayidx.i161, align 4, !tbaa !7
  %add4.i162 = or disjoint i32 %mul.i160, 1
  %arrayidx5.i163 = getelementptr inbounds float, ptr %data, i32 %add4.i162
  %37 = load float, ptr %arrayidx5.i163, align 4, !tbaa !7
  %mul6.i164 = shl nuw nsw i32 %add6, 1
  %arrayidx7.i165 = getelementptr inbounds float, ptr %data, i32 %mul6.i164
  %38 = load float, ptr %arrayidx7.i165, align 4, !tbaa !7
  store float %38, ptr %arrayidx.i161, align 4, !tbaa !7
  %add11.i166 = or disjoint i32 %mul6.i164, 1
  %arrayidx12.i167 = getelementptr inbounds float, ptr %data, i32 %add11.i166
  %39 = load float, ptr %arrayidx12.i167, align 4, !tbaa !7
  store float %39, ptr %arrayidx5.i163, align 4, !tbaa !7
  store float %36, ptr %arrayidx7.i165, align 4, !tbaa !7
  store float %37, ptr %arrayidx12.i167, align 4, !tbaa !7
  br label %bit_rev_single_step.exit168

bit_rev_single_step.exit168:                      ; preds = %while.end.i154, %if.then.i159
  %add7 = add nuw nsw i32 %i.046, 8
  %cmp = icmp slt i32 %add7, %sub
  br i1 %cmp, label %for.body, label %for.cond8.preheader, !llvm.loop !11

for.body11:                                       ; preds = %for.body11.preheader, %bit_rev_single_step.exit192
  %j.2 = phi i32 [ %add.i181, %bit_rev_single_step.exit192 ], [ %j.0, %for.body11.preheader ]
  %i.148 = phi i32 [ %inc, %bit_rev_single_step.exit192 ], [ %i.0.lcssa, %for.body11.preheader ]
  %cmp.not43.i171 = icmp sgt i32 %k.042.i170, %j.2
  br i1 %cmp.not43.i171, label %while.end.i178, label %while.body.i172

while.body.i172:                                  ; preds = %for.body11, %while.body.i172
  %k.044.i173 = phi i32 [ %k.0.i175, %while.body.i172 ], [ %k.042.i170, %for.body11 ]
  %40 = phi i32 [ %sub.i174, %while.body.i172 ], [ %j.2, %for.body11 ]
  %sub.i174 = sub nsw i32 %40, %k.044.i173
  %k.0.i175 = ashr i32 %k.044.i173, 1
  %cmp.not.i176 = icmp sgt i32 %k.0.i175, %sub.i174
  br i1 %cmp.not.i176, label %while.end.i178, label %while.body.i172, !llvm.loop !4

while.end.i178:                                   ; preds = %while.body.i172, %for.body11
  %k.0.lcssa.i179 = phi i32 [ %k.042.i170, %for.body11 ], [ %k.0.i175, %while.body.i172 ]
  %.lcssa.i180 = phi i32 [ %j.2, %for.body11 ], [ %sub.i174, %while.body.i172 ]
  %add.i181 = add nsw i32 %.lcssa.i180, %k.0.lcssa.i179
  %cmp2.i182 = icmp sgt i32 %add.i181, %i.148
  br i1 %cmp2.i182, label %if.then.i183, label %bit_rev_single_step.exit192

if.then.i183:                                     ; preds = %while.end.i178
  %mul.i184 = shl nsw i32 %add.i181, 1
  %arrayidx.i185 = getelementptr inbounds float, ptr %data, i32 %mul.i184
  %41 = load float, ptr %arrayidx.i185, align 4, !tbaa !7
  %add4.i186 = or disjoint i32 %mul.i184, 1
  %arrayidx5.i187 = getelementptr inbounds float, ptr %data, i32 %add4.i186
  %42 = load float, ptr %arrayidx5.i187, align 4, !tbaa !7
  %mul6.i188 = shl nsw i32 %i.148, 1
  %arrayidx7.i189 = getelementptr inbounds float, ptr %data, i32 %mul6.i188
  %43 = load float, ptr %arrayidx7.i189, align 4, !tbaa !7
  store float %43, ptr %arrayidx.i185, align 4, !tbaa !7
  %add11.i190 = or disjoint i32 %mul6.i188, 1
  %arrayidx12.i191 = getelementptr inbounds float, ptr %data, i32 %add11.i190
  %44 = load float, ptr %arrayidx12.i191, align 4, !tbaa !7
  store float %44, ptr %arrayidx5.i187, align 4, !tbaa !7
  store float %41, ptr %arrayidx7.i189, align 4, !tbaa !7
  store float %42, ptr %arrayidx12.i191, align 4, !tbaa !7
  br label %bit_rev_single_step.exit192

bit_rev_single_step.exit192:                      ; preds = %while.end.i178, %if.then.i183
  %inc = add i32 %i.148, 1
  %exitcond.not = icmp eq i32 %inc, %sub9
  br i1 %exitcond.not, label %return, label %for.body11, !llvm.loop !12

return:                                           ; preds = %bit_rev_single_step.exit192, %for.cond8.preheader, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 0, %for.cond8.preheader ], [ 0, %bit_rev_single_step.exit192 ]
  ret i32 %retval.0
}

declare dso_local zeroext i1 @dsp_is_power_of_two(i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = distinct !{!11, !5, !6}
!12 = distinct !{!12, !5, !6}
