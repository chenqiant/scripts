; ModuleID = 'dsps_bit_rev_fc32_best.c'
source_filename = "dsps_bit_rev_fc32_best.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

; Function Attrs: nounwind
define dso_local noundef i32 @dsps_bit_rev_fc32_ansi(ptr noundef %data, i32 noundef %N) local_unnamed_addr #0 {
entry:
  %call = tail call zeroext i1 @dsp_is_power_of_two(i32 noundef %N) #2
  br i1 %call, label %if.end, label %return

if.end:                                           ; preds = %entry
  %shr = ashr i32 %N, 1
  %sub = add nsw i32 %N, -8
  %cmp229 = icmp sgt i32 %N, 9
  br i1 %cmp229, label %for.body, label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %bit_rev_single_step.exit198, %if.end
  %j.0.lcssa = phi i32 [ 0, %if.end ], [ %add.i187, %bit_rev_single_step.exit198 ]
  %i.0.lcssa = phi i32 [ 1, %if.end ], [ %add7, %bit_rev_single_step.exit198 ]
  %sub9 = add nsw i32 %N, -1
  %cmp10233 = icmp slt i32 %i.0.lcssa, %sub9
  br i1 %cmp10233, label %for.body11, label %return

for.body:                                         ; preds = %if.end, %bit_rev_single_step.exit198
  %i.0231 = phi i32 [ %add7, %bit_rev_single_step.exit198 ], [ 1, %if.end ]
  %j.0230 = phi i32 [ %add.i187, %bit_rev_single_step.exit198 ], [ 0, %if.end ]
  %cmp.not41.i = icmp slt i32 %j.0230, %shr
  br i1 %cmp.not41.i, label %while.end.i, label %while.body.i

while.body.i:                                     ; preds = %for.body, %while.body.i
  %k.042.i = phi i32 [ %shr.i, %while.body.i ], [ %shr, %for.body ]
  %0 = phi i32 [ %sub.i, %while.body.i ], [ %j.0230, %for.body ]
  %sub.i = sub nsw i32 %0, %k.042.i
  %shr.i = lshr i32 %k.042.i, 1
  %cmp.not.i = icmp sgt i32 %shr.i, %sub.i
  br i1 %cmp.not.i, label %while.end.i, label %while.body.i, !llvm.loop !4

while.end.i:                                      ; preds = %while.body.i, %for.body
  %k.0.lcssa.i = phi i32 [ %shr, %for.body ], [ %shr.i, %while.body.i ]
  %.lcssa.i = phi i32 [ %j.0230, %for.body ], [ %sub.i, %while.body.i ]
  %add.i = add nsw i32 %.lcssa.i, %k.0.lcssa.i
  %cmp1.i = icmp sgt i32 %add.i, %i.0231
  br i1 %cmp1.i, label %if.then.i, label %bit_rev_single_step.exit

if.then.i:                                        ; preds = %while.end.i
  %mul.i = shl nsw i32 %add.i, 1
  %arrayidx.i = getelementptr inbounds float, ptr %data, i32 %mul.i
  %1 = load float, ptr %arrayidx.i, align 4, !tbaa !6
  %add3.i = or disjoint i32 %mul.i, 1
  %arrayidx4.i = getelementptr inbounds float, ptr %data, i32 %add3.i
  %2 = load float, ptr %arrayidx4.i, align 4, !tbaa !6
  %mul5.i = shl nuw nsw i32 %i.0231, 1
  %arrayidx6.i = getelementptr inbounds float, ptr %data, i32 %mul5.i
  %3 = load float, ptr %arrayidx6.i, align 4, !tbaa !6
  store float %3, ptr %arrayidx.i, align 4, !tbaa !6
  %add10.i = or disjoint i32 %mul5.i, 1
  %arrayidx11.i = getelementptr inbounds float, ptr %data, i32 %add10.i
  %4 = load float, ptr %arrayidx11.i, align 4, !tbaa !6
  store float %4, ptr %arrayidx4.i, align 4, !tbaa !6
  store float %1, ptr %arrayidx6.i, align 4, !tbaa !6
  store float %2, ptr %arrayidx11.i, align 4, !tbaa !6
  br label %bit_rev_single_step.exit

bit_rev_single_step.exit:                         ; preds = %while.end.i, %if.then.i
  %add = add nuw nsw i32 %i.0231, 1
  %cmp.not41.i46 = icmp slt i32 %add.i, %shr
  br i1 %cmp.not41.i46, label %while.end.i52, label %while.body.i47

while.body.i47:                                   ; preds = %bit_rev_single_step.exit, %while.body.i47
  %k.042.i48 = phi i32 [ %shr.i50, %while.body.i47 ], [ %shr, %bit_rev_single_step.exit ]
  %5 = phi i32 [ %sub.i49, %while.body.i47 ], [ %add.i, %bit_rev_single_step.exit ]
  %sub.i49 = sub nsw i32 %5, %k.042.i48
  %shr.i50 = lshr i32 %k.042.i48, 1
  %cmp.not.i51 = icmp sgt i32 %shr.i50, %sub.i49
  br i1 %cmp.not.i51, label %while.end.i52, label %while.body.i47, !llvm.loop !4

while.end.i52:                                    ; preds = %while.body.i47, %bit_rev_single_step.exit
  %k.0.lcssa.i53 = phi i32 [ %shr, %bit_rev_single_step.exit ], [ %shr.i50, %while.body.i47 ]
  %.lcssa.i54 = phi i32 [ %add.i, %bit_rev_single_step.exit ], [ %sub.i49, %while.body.i47 ]
  %add.i55 = add nsw i32 %.lcssa.i54, %k.0.lcssa.i53
  %cmp1.i56 = icmp sgt i32 %add.i55, %add
  br i1 %cmp1.i56, label %if.then.i57, label %bit_rev_single_step.exit66

if.then.i57:                                      ; preds = %while.end.i52
  %mul.i58 = shl nsw i32 %add.i55, 1
  %arrayidx.i59 = getelementptr inbounds float, ptr %data, i32 %mul.i58
  %6 = load float, ptr %arrayidx.i59, align 4, !tbaa !6
  %add3.i60 = or disjoint i32 %mul.i58, 1
  %arrayidx4.i61 = getelementptr inbounds float, ptr %data, i32 %add3.i60
  %7 = load float, ptr %arrayidx4.i61, align 4, !tbaa !6
  %mul5.i62 = shl nuw nsw i32 %add, 1
  %arrayidx6.i63 = getelementptr inbounds float, ptr %data, i32 %mul5.i62
  %8 = load float, ptr %arrayidx6.i63, align 4, !tbaa !6
  store float %8, ptr %arrayidx.i59, align 4, !tbaa !6
  %add10.i64 = or disjoint i32 %mul5.i62, 1
  %arrayidx11.i65 = getelementptr inbounds float, ptr %data, i32 %add10.i64
  %9 = load float, ptr %arrayidx11.i65, align 4, !tbaa !6
  store float %9, ptr %arrayidx4.i61, align 4, !tbaa !6
  store float %6, ptr %arrayidx6.i63, align 4, !tbaa !6
  store float %7, ptr %arrayidx11.i65, align 4, !tbaa !6
  br label %bit_rev_single_step.exit66

bit_rev_single_step.exit66:                       ; preds = %while.end.i52, %if.then.i57
  %add1 = add nuw nsw i32 %i.0231, 2
  %cmp.not41.i68 = icmp slt i32 %add.i55, %shr
  br i1 %cmp.not41.i68, label %while.end.i74, label %while.body.i69

while.body.i69:                                   ; preds = %bit_rev_single_step.exit66, %while.body.i69
  %k.042.i70 = phi i32 [ %shr.i72, %while.body.i69 ], [ %shr, %bit_rev_single_step.exit66 ]
  %10 = phi i32 [ %sub.i71, %while.body.i69 ], [ %add.i55, %bit_rev_single_step.exit66 ]
  %sub.i71 = sub nsw i32 %10, %k.042.i70
  %shr.i72 = lshr i32 %k.042.i70, 1
  %cmp.not.i73 = icmp sgt i32 %shr.i72, %sub.i71
  br i1 %cmp.not.i73, label %while.end.i74, label %while.body.i69, !llvm.loop !4

while.end.i74:                                    ; preds = %while.body.i69, %bit_rev_single_step.exit66
  %k.0.lcssa.i75 = phi i32 [ %shr, %bit_rev_single_step.exit66 ], [ %shr.i72, %while.body.i69 ]
  %.lcssa.i76 = phi i32 [ %add.i55, %bit_rev_single_step.exit66 ], [ %sub.i71, %while.body.i69 ]
  %add.i77 = add nsw i32 %.lcssa.i76, %k.0.lcssa.i75
  %cmp1.i78 = icmp sgt i32 %add.i77, %add1
  br i1 %cmp1.i78, label %if.then.i79, label %bit_rev_single_step.exit88

if.then.i79:                                      ; preds = %while.end.i74
  %mul.i80 = shl nsw i32 %add.i77, 1
  %arrayidx.i81 = getelementptr inbounds float, ptr %data, i32 %mul.i80
  %11 = load float, ptr %arrayidx.i81, align 4, !tbaa !6
  %add3.i82 = or disjoint i32 %mul.i80, 1
  %arrayidx4.i83 = getelementptr inbounds float, ptr %data, i32 %add3.i82
  %12 = load float, ptr %arrayidx4.i83, align 4, !tbaa !6
  %mul5.i84 = shl nuw nsw i32 %add1, 1
  %arrayidx6.i85 = getelementptr inbounds float, ptr %data, i32 %mul5.i84
  %13 = load float, ptr %arrayidx6.i85, align 4, !tbaa !6
  store float %13, ptr %arrayidx.i81, align 4, !tbaa !6
  %add10.i86 = or disjoint i32 %mul5.i84, 1
  %arrayidx11.i87 = getelementptr inbounds float, ptr %data, i32 %add10.i86
  %14 = load float, ptr %arrayidx11.i87, align 4, !tbaa !6
  store float %14, ptr %arrayidx4.i83, align 4, !tbaa !6
  store float %11, ptr %arrayidx6.i85, align 4, !tbaa !6
  store float %12, ptr %arrayidx11.i87, align 4, !tbaa !6
  br label %bit_rev_single_step.exit88

bit_rev_single_step.exit88:                       ; preds = %while.end.i74, %if.then.i79
  %add2 = add nuw nsw i32 %i.0231, 3
  %cmp.not41.i90 = icmp slt i32 %add.i77, %shr
  br i1 %cmp.not41.i90, label %while.end.i96, label %while.body.i91

while.body.i91:                                   ; preds = %bit_rev_single_step.exit88, %while.body.i91
  %k.042.i92 = phi i32 [ %shr.i94, %while.body.i91 ], [ %shr, %bit_rev_single_step.exit88 ]
  %15 = phi i32 [ %sub.i93, %while.body.i91 ], [ %add.i77, %bit_rev_single_step.exit88 ]
  %sub.i93 = sub nsw i32 %15, %k.042.i92
  %shr.i94 = lshr i32 %k.042.i92, 1
  %cmp.not.i95 = icmp sgt i32 %shr.i94, %sub.i93
  br i1 %cmp.not.i95, label %while.end.i96, label %while.body.i91, !llvm.loop !4

while.end.i96:                                    ; preds = %while.body.i91, %bit_rev_single_step.exit88
  %k.0.lcssa.i97 = phi i32 [ %shr, %bit_rev_single_step.exit88 ], [ %shr.i94, %while.body.i91 ]
  %.lcssa.i98 = phi i32 [ %add.i77, %bit_rev_single_step.exit88 ], [ %sub.i93, %while.body.i91 ]
  %add.i99 = add nsw i32 %.lcssa.i98, %k.0.lcssa.i97
  %cmp1.i100 = icmp sgt i32 %add.i99, %add2
  br i1 %cmp1.i100, label %if.then.i101, label %bit_rev_single_step.exit110

if.then.i101:                                     ; preds = %while.end.i96
  %mul.i102 = shl nsw i32 %add.i99, 1
  %arrayidx.i103 = getelementptr inbounds float, ptr %data, i32 %mul.i102
  %16 = load float, ptr %arrayidx.i103, align 4, !tbaa !6
  %add3.i104 = or disjoint i32 %mul.i102, 1
  %arrayidx4.i105 = getelementptr inbounds float, ptr %data, i32 %add3.i104
  %17 = load float, ptr %arrayidx4.i105, align 4, !tbaa !6
  %mul5.i106 = shl nuw nsw i32 %add2, 1
  %arrayidx6.i107 = getelementptr inbounds float, ptr %data, i32 %mul5.i106
  %18 = load float, ptr %arrayidx6.i107, align 4, !tbaa !6
  store float %18, ptr %arrayidx.i103, align 4, !tbaa !6
  %add10.i108 = or disjoint i32 %mul5.i106, 1
  %arrayidx11.i109 = getelementptr inbounds float, ptr %data, i32 %add10.i108
  %19 = load float, ptr %arrayidx11.i109, align 4, !tbaa !6
  store float %19, ptr %arrayidx4.i105, align 4, !tbaa !6
  store float %16, ptr %arrayidx6.i107, align 4, !tbaa !6
  store float %17, ptr %arrayidx11.i109, align 4, !tbaa !6
  br label %bit_rev_single_step.exit110

bit_rev_single_step.exit110:                      ; preds = %while.end.i96, %if.then.i101
  %add3 = add nuw nsw i32 %i.0231, 4
  %cmp.not41.i112 = icmp slt i32 %add.i99, %shr
  br i1 %cmp.not41.i112, label %while.end.i118, label %while.body.i113

while.body.i113:                                  ; preds = %bit_rev_single_step.exit110, %while.body.i113
  %k.042.i114 = phi i32 [ %shr.i116, %while.body.i113 ], [ %shr, %bit_rev_single_step.exit110 ]
  %20 = phi i32 [ %sub.i115, %while.body.i113 ], [ %add.i99, %bit_rev_single_step.exit110 ]
  %sub.i115 = sub nsw i32 %20, %k.042.i114
  %shr.i116 = lshr i32 %k.042.i114, 1
  %cmp.not.i117 = icmp sgt i32 %shr.i116, %sub.i115
  br i1 %cmp.not.i117, label %while.end.i118, label %while.body.i113, !llvm.loop !4

while.end.i118:                                   ; preds = %while.body.i113, %bit_rev_single_step.exit110
  %k.0.lcssa.i119 = phi i32 [ %shr, %bit_rev_single_step.exit110 ], [ %shr.i116, %while.body.i113 ]
  %.lcssa.i120 = phi i32 [ %add.i99, %bit_rev_single_step.exit110 ], [ %sub.i115, %while.body.i113 ]
  %add.i121 = add nsw i32 %.lcssa.i120, %k.0.lcssa.i119
  %cmp1.i122 = icmp sgt i32 %add.i121, %add3
  br i1 %cmp1.i122, label %if.then.i123, label %bit_rev_single_step.exit132

if.then.i123:                                     ; preds = %while.end.i118
  %mul.i124 = shl nsw i32 %add.i121, 1
  %arrayidx.i125 = getelementptr inbounds float, ptr %data, i32 %mul.i124
  %21 = load float, ptr %arrayidx.i125, align 4, !tbaa !6
  %add3.i126 = or disjoint i32 %mul.i124, 1
  %arrayidx4.i127 = getelementptr inbounds float, ptr %data, i32 %add3.i126
  %22 = load float, ptr %arrayidx4.i127, align 4, !tbaa !6
  %mul5.i128 = shl nuw nsw i32 %add3, 1
  %arrayidx6.i129 = getelementptr inbounds float, ptr %data, i32 %mul5.i128
  %23 = load float, ptr %arrayidx6.i129, align 4, !tbaa !6
  store float %23, ptr %arrayidx.i125, align 4, !tbaa !6
  %add10.i130 = or disjoint i32 %mul5.i128, 1
  %arrayidx11.i131 = getelementptr inbounds float, ptr %data, i32 %add10.i130
  %24 = load float, ptr %arrayidx11.i131, align 4, !tbaa !6
  store float %24, ptr %arrayidx4.i127, align 4, !tbaa !6
  store float %21, ptr %arrayidx6.i129, align 4, !tbaa !6
  store float %22, ptr %arrayidx11.i131, align 4, !tbaa !6
  br label %bit_rev_single_step.exit132

bit_rev_single_step.exit132:                      ; preds = %while.end.i118, %if.then.i123
  %add4 = add nuw nsw i32 %i.0231, 5
  %cmp.not41.i134 = icmp slt i32 %add.i121, %shr
  br i1 %cmp.not41.i134, label %while.end.i140, label %while.body.i135

while.body.i135:                                  ; preds = %bit_rev_single_step.exit132, %while.body.i135
  %k.042.i136 = phi i32 [ %shr.i138, %while.body.i135 ], [ %shr, %bit_rev_single_step.exit132 ]
  %25 = phi i32 [ %sub.i137, %while.body.i135 ], [ %add.i121, %bit_rev_single_step.exit132 ]
  %sub.i137 = sub nsw i32 %25, %k.042.i136
  %shr.i138 = lshr i32 %k.042.i136, 1
  %cmp.not.i139 = icmp sgt i32 %shr.i138, %sub.i137
  br i1 %cmp.not.i139, label %while.end.i140, label %while.body.i135, !llvm.loop !4

while.end.i140:                                   ; preds = %while.body.i135, %bit_rev_single_step.exit132
  %k.0.lcssa.i141 = phi i32 [ %shr, %bit_rev_single_step.exit132 ], [ %shr.i138, %while.body.i135 ]
  %.lcssa.i142 = phi i32 [ %add.i121, %bit_rev_single_step.exit132 ], [ %sub.i137, %while.body.i135 ]
  %add.i143 = add nsw i32 %.lcssa.i142, %k.0.lcssa.i141
  %cmp1.i144 = icmp sgt i32 %add.i143, %add4
  br i1 %cmp1.i144, label %if.then.i145, label %bit_rev_single_step.exit154

if.then.i145:                                     ; preds = %while.end.i140
  %mul.i146 = shl nsw i32 %add.i143, 1
  %arrayidx.i147 = getelementptr inbounds float, ptr %data, i32 %mul.i146
  %26 = load float, ptr %arrayidx.i147, align 4, !tbaa !6
  %add3.i148 = or disjoint i32 %mul.i146, 1
  %arrayidx4.i149 = getelementptr inbounds float, ptr %data, i32 %add3.i148
  %27 = load float, ptr %arrayidx4.i149, align 4, !tbaa !6
  %mul5.i150 = shl nuw nsw i32 %add4, 1
  %arrayidx6.i151 = getelementptr inbounds float, ptr %data, i32 %mul5.i150
  %28 = load float, ptr %arrayidx6.i151, align 4, !tbaa !6
  store float %28, ptr %arrayidx.i147, align 4, !tbaa !6
  %add10.i152 = or disjoint i32 %mul5.i150, 1
  %arrayidx11.i153 = getelementptr inbounds float, ptr %data, i32 %add10.i152
  %29 = load float, ptr %arrayidx11.i153, align 4, !tbaa !6
  store float %29, ptr %arrayidx4.i149, align 4, !tbaa !6
  store float %26, ptr %arrayidx6.i151, align 4, !tbaa !6
  store float %27, ptr %arrayidx11.i153, align 4, !tbaa !6
  br label %bit_rev_single_step.exit154

bit_rev_single_step.exit154:                      ; preds = %while.end.i140, %if.then.i145
  %add5 = add nuw nsw i32 %i.0231, 6
  %cmp.not41.i156 = icmp slt i32 %add.i143, %shr
  br i1 %cmp.not41.i156, label %while.end.i162, label %while.body.i157

while.body.i157:                                  ; preds = %bit_rev_single_step.exit154, %while.body.i157
  %k.042.i158 = phi i32 [ %shr.i160, %while.body.i157 ], [ %shr, %bit_rev_single_step.exit154 ]
  %30 = phi i32 [ %sub.i159, %while.body.i157 ], [ %add.i143, %bit_rev_single_step.exit154 ]
  %sub.i159 = sub nsw i32 %30, %k.042.i158
  %shr.i160 = lshr i32 %k.042.i158, 1
  %cmp.not.i161 = icmp sgt i32 %shr.i160, %sub.i159
  br i1 %cmp.not.i161, label %while.end.i162, label %while.body.i157, !llvm.loop !4

while.end.i162:                                   ; preds = %while.body.i157, %bit_rev_single_step.exit154
  %k.0.lcssa.i163 = phi i32 [ %shr, %bit_rev_single_step.exit154 ], [ %shr.i160, %while.body.i157 ]
  %.lcssa.i164 = phi i32 [ %add.i143, %bit_rev_single_step.exit154 ], [ %sub.i159, %while.body.i157 ]
  %add.i165 = add nsw i32 %.lcssa.i164, %k.0.lcssa.i163
  %cmp1.i166 = icmp sgt i32 %add.i165, %add5
  br i1 %cmp1.i166, label %if.then.i167, label %bit_rev_single_step.exit176

if.then.i167:                                     ; preds = %while.end.i162
  %mul.i168 = shl nsw i32 %add.i165, 1
  %arrayidx.i169 = getelementptr inbounds float, ptr %data, i32 %mul.i168
  %31 = load float, ptr %arrayidx.i169, align 4, !tbaa !6
  %add3.i170 = or disjoint i32 %mul.i168, 1
  %arrayidx4.i171 = getelementptr inbounds float, ptr %data, i32 %add3.i170
  %32 = load float, ptr %arrayidx4.i171, align 4, !tbaa !6
  %mul5.i172 = shl nuw nsw i32 %add5, 1
  %arrayidx6.i173 = getelementptr inbounds float, ptr %data, i32 %mul5.i172
  %33 = load float, ptr %arrayidx6.i173, align 4, !tbaa !6
  store float %33, ptr %arrayidx.i169, align 4, !tbaa !6
  %add10.i174 = or disjoint i32 %mul5.i172, 1
  %arrayidx11.i175 = getelementptr inbounds float, ptr %data, i32 %add10.i174
  %34 = load float, ptr %arrayidx11.i175, align 4, !tbaa !6
  store float %34, ptr %arrayidx4.i171, align 4, !tbaa !6
  store float %31, ptr %arrayidx6.i173, align 4, !tbaa !6
  store float %32, ptr %arrayidx11.i175, align 4, !tbaa !6
  br label %bit_rev_single_step.exit176

bit_rev_single_step.exit176:                      ; preds = %while.end.i162, %if.then.i167
  %add6 = add nuw nsw i32 %i.0231, 7
  %cmp.not41.i178 = icmp slt i32 %add.i165, %shr
  br i1 %cmp.not41.i178, label %while.end.i184, label %while.body.i179

while.body.i179:                                  ; preds = %bit_rev_single_step.exit176, %while.body.i179
  %k.042.i180 = phi i32 [ %shr.i182, %while.body.i179 ], [ %shr, %bit_rev_single_step.exit176 ]
  %35 = phi i32 [ %sub.i181, %while.body.i179 ], [ %add.i165, %bit_rev_single_step.exit176 ]
  %sub.i181 = sub nsw i32 %35, %k.042.i180
  %shr.i182 = lshr i32 %k.042.i180, 1
  %cmp.not.i183 = icmp sgt i32 %shr.i182, %sub.i181
  br i1 %cmp.not.i183, label %while.end.i184, label %while.body.i179, !llvm.loop !4

while.end.i184:                                   ; preds = %while.body.i179, %bit_rev_single_step.exit176
  %k.0.lcssa.i185 = phi i32 [ %shr, %bit_rev_single_step.exit176 ], [ %shr.i182, %while.body.i179 ]
  %.lcssa.i186 = phi i32 [ %add.i165, %bit_rev_single_step.exit176 ], [ %sub.i181, %while.body.i179 ]
  %add.i187 = add nsw i32 %.lcssa.i186, %k.0.lcssa.i185
  %cmp1.i188 = icmp sgt i32 %add.i187, %add6
  br i1 %cmp1.i188, label %if.then.i189, label %bit_rev_single_step.exit198

if.then.i189:                                     ; preds = %while.end.i184
  %mul.i190 = shl nsw i32 %add.i187, 1
  %arrayidx.i191 = getelementptr inbounds float, ptr %data, i32 %mul.i190
  %36 = load float, ptr %arrayidx.i191, align 4, !tbaa !6
  %add3.i192 = or disjoint i32 %mul.i190, 1
  %arrayidx4.i193 = getelementptr inbounds float, ptr %data, i32 %add3.i192
  %37 = load float, ptr %arrayidx4.i193, align 4, !tbaa !6
  %mul5.i194 = shl nuw nsw i32 %add6, 1
  %arrayidx6.i195 = getelementptr inbounds float, ptr %data, i32 %mul5.i194
  %38 = load float, ptr %arrayidx6.i195, align 4, !tbaa !6
  store float %38, ptr %arrayidx.i191, align 4, !tbaa !6
  %add10.i196 = or disjoint i32 %mul5.i194, 1
  %arrayidx11.i197 = getelementptr inbounds float, ptr %data, i32 %add10.i196
  %39 = load float, ptr %arrayidx11.i197, align 4, !tbaa !6
  store float %39, ptr %arrayidx4.i193, align 4, !tbaa !6
  store float %36, ptr %arrayidx6.i195, align 4, !tbaa !6
  store float %37, ptr %arrayidx11.i197, align 4, !tbaa !6
  br label %bit_rev_single_step.exit198

bit_rev_single_step.exit198:                      ; preds = %while.end.i184, %if.then.i189
  %add7 = add nuw nsw i32 %i.0231, 8
  %cmp = icmp slt i32 %add7, %sub
  br i1 %cmp, label %for.body, label %for.cond8.preheader, !llvm.loop !10

for.body11:                                       ; preds = %for.cond8.preheader, %bit_rev_single_step.exit220
  %i.1235 = phi i32 [ %inc, %bit_rev_single_step.exit220 ], [ %i.0.lcssa, %for.cond8.preheader ]
  %j.1234 = phi i32 [ %add.i209, %bit_rev_single_step.exit220 ], [ %j.0.lcssa, %for.cond8.preheader ]
  %cmp.not41.i200 = icmp slt i32 %j.1234, %shr
  br i1 %cmp.not41.i200, label %while.end.i206, label %while.body.i201

while.body.i201:                                  ; preds = %for.body11, %while.body.i201
  %k.042.i202 = phi i32 [ %shr.i204, %while.body.i201 ], [ %shr, %for.body11 ]
  %40 = phi i32 [ %sub.i203, %while.body.i201 ], [ %j.1234, %for.body11 ]
  %sub.i203 = sub nsw i32 %40, %k.042.i202
  %shr.i204 = ashr i32 %k.042.i202, 1
  %cmp.not.i205 = icmp sgt i32 %shr.i204, %sub.i203
  br i1 %cmp.not.i205, label %while.end.i206, label %while.body.i201, !llvm.loop !4

while.end.i206:                                   ; preds = %while.body.i201, %for.body11
  %k.0.lcssa.i207 = phi i32 [ %shr, %for.body11 ], [ %shr.i204, %while.body.i201 ]
  %.lcssa.i208 = phi i32 [ %j.1234, %for.body11 ], [ %sub.i203, %while.body.i201 ]
  %add.i209 = add nsw i32 %.lcssa.i208, %k.0.lcssa.i207
  %cmp1.i210 = icmp sgt i32 %add.i209, %i.1235
  br i1 %cmp1.i210, label %if.then.i211, label %bit_rev_single_step.exit220

if.then.i211:                                     ; preds = %while.end.i206
  %mul.i212 = shl nsw i32 %add.i209, 1
  %arrayidx.i213 = getelementptr inbounds float, ptr %data, i32 %mul.i212
  %41 = load float, ptr %arrayidx.i213, align 4, !tbaa !6
  %add3.i214 = or disjoint i32 %mul.i212, 1
  %arrayidx4.i215 = getelementptr inbounds float, ptr %data, i32 %add3.i214
  %42 = load float, ptr %arrayidx4.i215, align 4, !tbaa !6
  %mul5.i216 = shl nuw nsw i32 %i.1235, 1
  %arrayidx6.i217 = getelementptr inbounds float, ptr %data, i32 %mul5.i216
  %43 = load float, ptr %arrayidx6.i217, align 4, !tbaa !6
  store float %43, ptr %arrayidx.i213, align 4, !tbaa !6
  %add10.i218 = or disjoint i32 %mul5.i216, 1
  %arrayidx11.i219 = getelementptr inbounds float, ptr %data, i32 %add10.i218
  %44 = load float, ptr %arrayidx11.i219, align 4, !tbaa !6
  store float %44, ptr %arrayidx4.i215, align 4, !tbaa !6
  store float %41, ptr %arrayidx6.i217, align 4, !tbaa !6
  store float %42, ptr %arrayidx11.i219, align 4, !tbaa !6
  br label %bit_rev_single_step.exit220

bit_rev_single_step.exit220:                      ; preds = %while.end.i206, %if.then.i211
  %inc = add nuw nsw i32 %i.1235, 1
  %exitcond.not = icmp eq i32 %inc, %sub9
  br i1 %exitcond.not, label %return, label %for.body11, !llvm.loop !11

return:                                           ; preds = %bit_rev_single_step.exit220, %for.cond8.preheader, %entry
  %retval.0 = phi i32 [ 458753, %entry ], [ 0, %for.cond8.preheader ], [ 0, %bit_rev_single_step.exit220 ]
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
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !5}
!11 = distinct !{!11, !5}
