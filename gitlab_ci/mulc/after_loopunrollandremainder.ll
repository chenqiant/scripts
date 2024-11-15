; ModuleID = 'after_customlicm.ll'
source_filename = "after_customlicm.ll"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

define dso_local noundef i32 @dsps_mulc_f32_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, i32 noundef %len, float noundef %C, i32 noundef %step_in, i32 noundef %step_out) local_unnamed_addr {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp4 = icmp sgt i32 %len, 2
  br i1 %cmp4, label %for.cond.preheader.new, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp413 = icmp sgt i32 %len, 0
  br i1 %cmp413, label %for.body.clone, label %return

for.cond.preheader.new:                           ; preds = %if.end
  %sub = add nsw i32 %len, -16
  %cmp6.not207 = icmp ult i32 %len, 16
  br i1 %cmp6.not207, label %for.cond.preheader.new2, label %for.body.modify

for.cond.preheader.new2:                          ; preds = %for.body.modify, %for.cond.preheader.new
  %0 = phi i32 [ %32, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %cmp85209 = icmp slt i32 %0, %len
  br i1 %cmp85209, label %for.body, label %return

for.body.modify:                                  ; preds = %for.cond.preheader.new, %for.body.modify
  %i.014.modify = phi i32 [ %32, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %add = or disjoint i32 %i.014.modify, 1
  %add3 = or disjoint i32 %i.014.modify, 2
  %add6 = or disjoint i32 %i.014.modify, 3
  %add10 = or disjoint i32 %i.014.modify, 4
  %add13 = or disjoint i32 %i.014.modify, 5
  %add16 = or disjoint i32 %i.014.modify, 6
  %add19 = or disjoint i32 %i.014.modify, 7
  %add22 = or disjoint i32 %i.014.modify, 8
  %add25 = or disjoint i32 %i.014.modify, 9
  %add28 = or disjoint i32 %i.014.modify, 10
  %add31 = or disjoint i32 %i.014.modify, 11
  %add34 = or disjoint i32 %i.014.modify, 12
  %add37 = or disjoint i32 %i.014.modify, 13
  %add40 = or disjoint i32 %i.014.modify, 14
  %add43 = or disjoint i32 %i.014.modify, 15
  %arrayidx.modify = getelementptr inbounds float, ptr %input, i32 %i.014.modify
  %arrayidx7.modify = getelementptr inbounds float, ptr %output, i32 %i.014.modify
  %arrayidx1 = getelementptr inbounds float, ptr %input, i32 %add
  %arrayidx2 = getelementptr inbounds float, ptr %output, i32 %add
  %arrayidx4 = getelementptr inbounds float, ptr %input, i32 %add3
  %arrayidx5 = getelementptr inbounds float, ptr %output, i32 %add3
  %arrayidx8 = getelementptr inbounds float, ptr %input, i32 %add6
  %arrayidx9 = getelementptr inbounds float, ptr %output, i32 %add6
  %arrayidx11 = getelementptr inbounds float, ptr %input, i32 %add10
  %arrayidx12 = getelementptr inbounds float, ptr %output, i32 %add10
  %arrayidx14 = getelementptr inbounds float, ptr %input, i32 %add13
  %arrayidx15 = getelementptr inbounds float, ptr %output, i32 %add13
  %arrayidx17 = getelementptr inbounds float, ptr %input, i32 %add16
  %arrayidx18 = getelementptr inbounds float, ptr %output, i32 %add16
  %arrayidx20 = getelementptr inbounds float, ptr %input, i32 %add19
  %arrayidx21 = getelementptr inbounds float, ptr %output, i32 %add19
  %arrayidx23 = getelementptr inbounds float, ptr %input, i32 %add22
  %arrayidx24 = getelementptr inbounds float, ptr %output, i32 %add22
  %arrayidx26 = getelementptr inbounds float, ptr %input, i32 %add25
  %arrayidx27 = getelementptr inbounds float, ptr %output, i32 %add25
  %arrayidx29 = getelementptr inbounds float, ptr %input, i32 %add28
  %arrayidx30 = getelementptr inbounds float, ptr %output, i32 %add28
  %arrayidx32 = getelementptr inbounds float, ptr %input, i32 %add31
  %arrayidx33 = getelementptr inbounds float, ptr %output, i32 %add31
  %arrayidx35 = getelementptr inbounds float, ptr %input, i32 %add34
  %arrayidx36 = getelementptr inbounds float, ptr %output, i32 %add34
  %arrayidx38 = getelementptr inbounds float, ptr %input, i32 %add37
  %arrayidx39 = getelementptr inbounds float, ptr %output, i32 %add37
  %arrayidx41 = getelementptr inbounds float, ptr %input, i32 %add40
  %arrayidx42 = getelementptr inbounds float, ptr %output, i32 %add40
  %arrayidx44 = getelementptr inbounds float, ptr %input, i32 %add43
  %arrayidx45 = getelementptr inbounds float, ptr %output, i32 %add43
  %1 = load float, ptr %arrayidx.modify, align 4
  %2 = load float, ptr %arrayidx1, align 4
  %3 = load float, ptr %arrayidx4, align 4
  %4 = load float, ptr %arrayidx8, align 4
  %5 = load float, ptr %arrayidx11, align 4
  %6 = load float, ptr %arrayidx14, align 4
  %7 = load float, ptr %arrayidx17, align 4
  %8 = load float, ptr %arrayidx20, align 4
  %9 = load float, ptr %arrayidx23, align 4
  %10 = load float, ptr %arrayidx26, align 4
  %11 = load float, ptr %arrayidx29, align 4
  %12 = load float, ptr %arrayidx32, align 4
  %13 = load float, ptr %arrayidx35, align 4
  %14 = load float, ptr %arrayidx38, align 4
  %15 = load float, ptr %arrayidx41, align 4
  %16 = load float, ptr %arrayidx44, align 4
  %mul5.modify = fmul float %1, %C
  %17 = fmul float %2, %C
  %18 = fmul float %3, %C
  %19 = fmul float %4, %C
  %20 = fmul float %5, %C
  %21 = fmul float %6, %C
  %22 = fmul float %7, %C
  %23 = fmul float %8, %C
  %24 = fmul float %9, %C
  %25 = fmul float %10, %C
  %26 = fmul float %11, %C
  %27 = fmul float %12, %C
  %28 = fmul float %13, %C
  %29 = fmul float %14, %C
  %30 = fmul float %15, %C
  %31 = fmul float %16, %C
  store float %31, ptr %arrayidx45, align 4
  store float %30, ptr %arrayidx42, align 4
  store float %29, ptr %arrayidx39, align 4
  store float %28, ptr %arrayidx36, align 4
  store float %27, ptr %arrayidx33, align 4
  store float %26, ptr %arrayidx30, align 4
  store float %25, ptr %arrayidx27, align 4
  store float %24, ptr %arrayidx24, align 4
  store float %23, ptr %arrayidx21, align 4
  store float %22, ptr %arrayidx18, align 4
  store float %21, ptr %arrayidx15, align 4
  store float %20, ptr %arrayidx12, align 4
  store float %19, ptr %arrayidx9, align 4
  store float %18, ptr %arrayidx5, align 4
  store float %17, ptr %arrayidx2, align 4
  store float %mul5.modify, ptr %arrayidx7.modify, align 4
  %32 = add nuw i32 %i.014.modify, 16
  %exitcond.not.modify = icmp sgt i32 %32, %sub
  br i1 %exitcond.not.modify, label %for.cond.preheader.new2, label %for.body.modify

for.body:                                         ; preds = %for.cond.preheader.new2, %for.body
  %i.014 = phi i32 [ %inc, %for.body ], [ %0, %for.cond.preheader.new2 ]
  %mul = mul nsw i32 %i.014, %step_in
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %mul
  %33 = load float, ptr %arrayidx, align 4
  %mul5 = fmul float %33, %C
  %mul6 = mul nsw i32 %i.014, %step_out
  %arrayidx7 = getelementptr inbounds float, ptr %output, i32 %mul6
  store float %mul5, ptr %arrayidx7, align 4
  %inc = add nuw nsw i32 %i.014, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.014.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.014.clone, %step_in
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %mul.clone
  %34 = load float, ptr %arrayidx.clone, align 4
  %mul5.clone = fmul float %34, %C
  %mul6.clone = mul nsw i32 %i.014.clone, %step_out
  %arrayidx7.clone = getelementptr inbounds float, ptr %output, i32 %mul6.clone
  store float %mul5.clone, ptr %arrayidx7.clone, align 4
  %inc.clone = add nuw nsw i32 %i.014.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone

return:                                           ; preds = %for.cond.preheader.new2, %for.body.clone, %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ], [ 0, %for.body.clone ], [ 0, %for.cond.preheader.new2 ]
  ret i32 %retval.0
}
