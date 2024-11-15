; ModuleID = 'after_customlicm.ll'
source_filename = "after_customlicm.ll"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

define dso_local noundef i32 @dsps_addc_f32_ansi(ptr noalias noundef readonly %input, ptr noalias noundef writeonly %output, i32 noundef %len, float noundef %C, i32 noundef %step_in, i32 noundef %step_out) local_unnamed_addr {
entry:
  %cmp = icmp eq ptr %input, null
  %cmp1 = icmp eq ptr %output, null
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp4 = icmp sgt i32 %len, 2
  br i1 %cmp4, label %for.cond.preheader.new, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp412 = icmp sgt i32 %len, 0
  br i1 %cmp412, label %for.body.clone, label %return

for.cond.preheader.new:                           ; preds = %if.end
  %sub = add nsw i32 %len, -16
  %cmp6.not207 = icmp ult i32 %len, 16
  br i1 %cmp6.not207, label %for.cond.preheader.new2, label %for.body.modify

for.cond.preheader.new2:                          ; preds = %for.body.modify, %for.cond.preheader.new
  %0 = phi i32 [ %17, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %cmp85209 = icmp slt i32 %0, %len
  br i1 %cmp85209, label %for.body, label %return

for.body.modify:                                  ; preds = %for.cond.preheader.new, %for.body.modify
  %i.013.modify = phi i32 [ %17, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %add2 = or disjoint i32 %i.013.modify, 1
  %add6 = or disjoint i32 %i.013.modify, 2
  %add10 = or disjoint i32 %i.013.modify, 3
  %add14 = or disjoint i32 %i.013.modify, 4
  %add18 = or disjoint i32 %i.013.modify, 5
  %add22 = or disjoint i32 %i.013.modify, 6
  %add26 = or disjoint i32 %i.013.modify, 7
  %add30 = or disjoint i32 %i.013.modify, 8
  %add34 = or disjoint i32 %i.013.modify, 9
  %add38 = or disjoint i32 %i.013.modify, 10
  %add42 = or disjoint i32 %i.013.modify, 11
  %add46 = or disjoint i32 %i.013.modify, 12
  %add50 = or disjoint i32 %i.013.modify, 13
  %add54 = or disjoint i32 %i.013.modify, 14
  %add58 = or disjoint i32 %i.013.modify, 15
  %arrayidx.modify = getelementptr inbounds float, ptr %input, i32 %i.013.modify
  %arrayidx6.modify = getelementptr inbounds float, ptr %output, i32 %i.013.modify
  %arrayidx3 = getelementptr inbounds float, ptr %input, i32 %add2
  %arrayidx5 = getelementptr inbounds float, ptr %output, i32 %add2
  %arrayidx7 = getelementptr inbounds float, ptr %input, i32 %add6
  %arrayidx9 = getelementptr inbounds float, ptr %output, i32 %add6
  %arrayidx11 = getelementptr inbounds float, ptr %input, i32 %add10
  %arrayidx13 = getelementptr inbounds float, ptr %output, i32 %add10
  %arrayidx15 = getelementptr inbounds float, ptr %input, i32 %add14
  %arrayidx17 = getelementptr inbounds float, ptr %output, i32 %add14
  %arrayidx19 = getelementptr inbounds float, ptr %input, i32 %add18
  %arrayidx21 = getelementptr inbounds float, ptr %output, i32 %add18
  %arrayidx23 = getelementptr inbounds float, ptr %input, i32 %add22
  %arrayidx25 = getelementptr inbounds float, ptr %output, i32 %add22
  %arrayidx27 = getelementptr inbounds float, ptr %input, i32 %add26
  %arrayidx29 = getelementptr inbounds float, ptr %output, i32 %add26
  %arrayidx31 = getelementptr inbounds float, ptr %input, i32 %add30
  %arrayidx33 = getelementptr inbounds float, ptr %output, i32 %add30
  %arrayidx35 = getelementptr inbounds float, ptr %input, i32 %add34
  %arrayidx37 = getelementptr inbounds float, ptr %output, i32 %add34
  %arrayidx39 = getelementptr inbounds float, ptr %input, i32 %add38
  %arrayidx41 = getelementptr inbounds float, ptr %output, i32 %add38
  %arrayidx43 = getelementptr inbounds float, ptr %input, i32 %add42
  %arrayidx45 = getelementptr inbounds float, ptr %output, i32 %add42
  %arrayidx47 = getelementptr inbounds float, ptr %input, i32 %add46
  %arrayidx49 = getelementptr inbounds float, ptr %output, i32 %add46
  %arrayidx51 = getelementptr inbounds float, ptr %input, i32 %add50
  %arrayidx53 = getelementptr inbounds float, ptr %output, i32 %add50
  %arrayidx55 = getelementptr inbounds float, ptr %input, i32 %add54
  %arrayidx57 = getelementptr inbounds float, ptr %output, i32 %add54
  %arrayidx59 = getelementptr inbounds float, ptr %input, i32 %add58
  %arrayidx61 = getelementptr inbounds float, ptr %output, i32 %add58
  %1 = load float, ptr %arrayidx.modify, align 4
  %2 = load float, ptr %arrayidx3, align 4
  %3 = load float, ptr %arrayidx7, align 4
  %4 = load float, ptr %arrayidx11, align 4
  %5 = load float, ptr %arrayidx15, align 4
  %6 = load float, ptr %arrayidx19, align 4
  %7 = load float, ptr %arrayidx23, align 4
  %8 = load float, ptr %arrayidx27, align 4
  %9 = load float, ptr %arrayidx31, align 4
  %10 = load float, ptr %arrayidx35, align 4
  %11 = load float, ptr %arrayidx39, align 4
  %12 = load float, ptr %arrayidx43, align 4
  %13 = load float, ptr %arrayidx47, align 4
  %14 = load float, ptr %arrayidx51, align 4
  %15 = load float, ptr %arrayidx55, align 4
  %16 = load float, ptr %arrayidx59, align 4
  %add.modify = fadd float %1, %C
  %add4 = fadd float %2, %C
  %add8 = fadd float %3, %C
  %add12 = fadd float %4, %C
  %add16 = fadd float %5, %C
  %add20 = fadd float %6, %C
  %add24 = fadd float %7, %C
  %add28 = fadd float %8, %C
  %add32 = fadd float %9, %C
  %add36 = fadd float %10, %C
  %add40 = fadd float %11, %C
  %add44 = fadd float %12, %C
  %add48 = fadd float %13, %C
  %add52 = fadd float %14, %C
  %add56 = fadd float %15, %C
  %add60 = fadd float %16, %C
  store float %add60, ptr %arrayidx61, align 4
  store float %add56, ptr %arrayidx57, align 4
  store float %add52, ptr %arrayidx53, align 4
  store float %add48, ptr %arrayidx49, align 4
  store float %add44, ptr %arrayidx45, align 4
  store float %add40, ptr %arrayidx41, align 4
  store float %add36, ptr %arrayidx37, align 4
  store float %add32, ptr %arrayidx33, align 4
  store float %add28, ptr %arrayidx29, align 4
  store float %add24, ptr %arrayidx25, align 4
  store float %add20, ptr %arrayidx21, align 4
  store float %add16, ptr %arrayidx17, align 4
  store float %add12, ptr %arrayidx13, align 4
  store float %add8, ptr %arrayidx9, align 4
  store float %add4, ptr %arrayidx5, align 4
  store float %add.modify, ptr %arrayidx6.modify, align 4
  %17 = add nuw i32 %i.013.modify, 16
  %exitcond.not.modify = icmp sgt i32 %17, %sub
  br i1 %exitcond.not.modify, label %for.cond.preheader.new2, label %for.body.modify

for.body:                                         ; preds = %for.cond.preheader.new2, %for.body
  %i.013 = phi i32 [ %inc, %for.body ], [ %0, %for.cond.preheader.new2 ]
  %mul = mul nsw i32 %i.013, %step_in
  %arrayidx = getelementptr inbounds float, ptr %input, i32 %mul
  %18 = load float, ptr %arrayidx, align 4
  %add = fadd float %18, %C
  %mul5 = mul nsw i32 %i.013, %step_out
  %arrayidx6 = getelementptr inbounds float, ptr %output, i32 %mul5
  store float %add, ptr %arrayidx6, align 4
  %inc = add nuw nsw i32 %i.013, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.013.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.013.clone, %step_in
  %arrayidx.clone = getelementptr inbounds float, ptr %input, i32 %mul.clone
  %19 = load float, ptr %arrayidx.clone, align 4
  %add.clone = fadd float %19, %C
  %mul5.clone = mul nsw i32 %i.013.clone, %step_out
  %arrayidx6.clone = getelementptr inbounds float, ptr %output, i32 %mul5.clone
  store float %add.clone, ptr %arrayidx6.clone, align 4
  %inc.clone = add nuw nsw i32 %i.013.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone

return:                                           ; preds = %for.cond.preheader.new2, %for.body.clone, %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ], [ 0, %for.body.clone ], [ 0, %for.cond.preheader.new2 ]
  ret i32 %retval.0
}
