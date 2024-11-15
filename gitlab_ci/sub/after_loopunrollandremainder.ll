; ModuleID = 'after_customlicm.ll'
source_filename = "after_customlicm.ll"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

define dso_local noundef i32 @dsps_sub_f32_ansi(ptr noalias noundef readonly %input1, ptr noalias noundef readonly %input2, ptr noalias noundef writeonly %output, i32 noundef %len, i32 noundef %step1, i32 noundef %step2, i32 noundef %step_out) local_unnamed_addr {
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
  %sub63 = add nsw i32 %len, -16
  %cmp6.not207 = icmp ult i32 %len, 16
  br i1 %cmp6.not207, label %for.cond.preheader.new2, label %for.body.modify

for.cond.preheader.new2:                          ; preds = %for.body.modify, %for.cond.preheader.new
  %0 = phi i32 [ %48, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %cmp85209 = icmp slt i32 %0, %len
  br i1 %cmp85209, label %for.body, label %return

for.body.modify:                                  ; preds = %for.cond.preheader.new, %for.body.modify
  %i.021.modify = phi i32 [ %48, %for.body.modify ], [ 0, %for.cond.preheader.new ]
  %add = or disjoint i32 %i.021.modify, 1
  %add4 = or disjoint i32 %i.021.modify, 2
  %add8 = or disjoint i32 %i.021.modify, 3
  %add14 = or disjoint i32 %i.021.modify, 4
  %add18 = or disjoint i32 %i.021.modify, 5
  %add22 = or disjoint i32 %i.021.modify, 6
  %add26 = or disjoint i32 %i.021.modify, 7
  %add30 = or disjoint i32 %i.021.modify, 8
  %add34 = or disjoint i32 %i.021.modify, 9
  %add38 = or disjoint i32 %i.021.modify, 10
  %add42 = or disjoint i32 %i.021.modify, 11
  %add46 = or disjoint i32 %i.021.modify, 12
  %add50 = or disjoint i32 %i.021.modify, 13
  %add54 = or disjoint i32 %i.021.modify, 14
  %add58 = or disjoint i32 %i.021.modify, 15
  %arrayidx.modify = getelementptr inbounds float, ptr %input1, i32 %i.021.modify
  %arrayidx9.modify = getelementptr inbounds float, ptr %input2, i32 %i.021.modify
  %arrayidx11.modify = getelementptr inbounds float, ptr %output, i32 %i.021.modify
  %arrayidx1 = getelementptr inbounds float, ptr %input1, i32 %add
  %arrayidx2 = getelementptr inbounds float, ptr %input2, i32 %add
  %arrayidx3 = getelementptr inbounds float, ptr %output, i32 %add
  %arrayidx5 = getelementptr inbounds float, ptr %input1, i32 %add4
  %arrayidx6 = getelementptr inbounds float, ptr %input2, i32 %add4
  %arrayidx7 = getelementptr inbounds float, ptr %output, i32 %add4
  %arrayidx10 = getelementptr inbounds float, ptr %input1, i32 %add8
  %arrayidx12 = getelementptr inbounds float, ptr %input2, i32 %add8
  %arrayidx13 = getelementptr inbounds float, ptr %output, i32 %add8
  %arrayidx15 = getelementptr inbounds float, ptr %input1, i32 %add14
  %arrayidx16 = getelementptr inbounds float, ptr %input2, i32 %add14
  %arrayidx17 = getelementptr inbounds float, ptr %output, i32 %add14
  %arrayidx19 = getelementptr inbounds float, ptr %input1, i32 %add18
  %arrayidx20 = getelementptr inbounds float, ptr %input2, i32 %add18
  %arrayidx21 = getelementptr inbounds float, ptr %output, i32 %add18
  %arrayidx23 = getelementptr inbounds float, ptr %input1, i32 %add22
  %arrayidx24 = getelementptr inbounds float, ptr %input2, i32 %add22
  %arrayidx25 = getelementptr inbounds float, ptr %output, i32 %add22
  %arrayidx27 = getelementptr inbounds float, ptr %input1, i32 %add26
  %arrayidx28 = getelementptr inbounds float, ptr %input2, i32 %add26
  %arrayidx29 = getelementptr inbounds float, ptr %output, i32 %add26
  %arrayidx31 = getelementptr inbounds float, ptr %input1, i32 %add30
  %arrayidx32 = getelementptr inbounds float, ptr %input2, i32 %add30
  %arrayidx33 = getelementptr inbounds float, ptr %output, i32 %add30
  %arrayidx35 = getelementptr inbounds float, ptr %input1, i32 %add34
  %arrayidx36 = getelementptr inbounds float, ptr %input2, i32 %add34
  %arrayidx37 = getelementptr inbounds float, ptr %output, i32 %add34
  %arrayidx39 = getelementptr inbounds float, ptr %input1, i32 %add38
  %arrayidx40 = getelementptr inbounds float, ptr %input2, i32 %add38
  %arrayidx41 = getelementptr inbounds float, ptr %output, i32 %add38
  %arrayidx43 = getelementptr inbounds float, ptr %input1, i32 %add42
  %arrayidx44 = getelementptr inbounds float, ptr %input2, i32 %add42
  %arrayidx45 = getelementptr inbounds float, ptr %output, i32 %add42
  %arrayidx47 = getelementptr inbounds float, ptr %input1, i32 %add46
  %arrayidx48 = getelementptr inbounds float, ptr %input2, i32 %add46
  %arrayidx49 = getelementptr inbounds float, ptr %output, i32 %add46
  %arrayidx51 = getelementptr inbounds float, ptr %input1, i32 %add50
  %arrayidx52 = getelementptr inbounds float, ptr %input2, i32 %add50
  %arrayidx53 = getelementptr inbounds float, ptr %output, i32 %add50
  %arrayidx55 = getelementptr inbounds float, ptr %input1, i32 %add54
  %arrayidx56 = getelementptr inbounds float, ptr %input2, i32 %add54
  %arrayidx57 = getelementptr inbounds float, ptr %output, i32 %add54
  %arrayidx59 = getelementptr inbounds float, ptr %input1, i32 %add58
  %arrayidx60 = getelementptr inbounds float, ptr %input2, i32 %add58
  %arrayidx61 = getelementptr inbounds float, ptr %output, i32 %add58
  %1 = load float, ptr %arrayidx.modify, align 4
  %2 = load float, ptr %arrayidx9.modify, align 4
  %3 = load float, ptr %arrayidx1, align 4
  %4 = load float, ptr %arrayidx2, align 4
  %5 = load float, ptr %arrayidx5, align 4
  %6 = load float, ptr %arrayidx6, align 4
  %7 = load float, ptr %arrayidx10, align 4
  %8 = load float, ptr %arrayidx12, align 4
  %9 = load float, ptr %arrayidx15, align 4
  %10 = load float, ptr %arrayidx16, align 4
  %11 = load float, ptr %arrayidx19, align 4
  %12 = load float, ptr %arrayidx20, align 4
  %13 = load float, ptr %arrayidx23, align 4
  %14 = load float, ptr %arrayidx24, align 4
  %15 = load float, ptr %arrayidx27, align 4
  %16 = load float, ptr %arrayidx28, align 4
  %17 = load float, ptr %arrayidx31, align 4
  %18 = load float, ptr %arrayidx32, align 4
  %19 = load float, ptr %arrayidx35, align 4
  %20 = load float, ptr %arrayidx36, align 4
  %21 = load float, ptr %arrayidx39, align 4
  %22 = load float, ptr %arrayidx40, align 4
  %23 = load float, ptr %arrayidx43, align 4
  %24 = load float, ptr %arrayidx44, align 4
  %25 = load float, ptr %arrayidx47, align 4
  %26 = load float, ptr %arrayidx48, align 4
  %27 = load float, ptr %arrayidx51, align 4
  %28 = load float, ptr %arrayidx52, align 4
  %29 = load float, ptr %arrayidx55, align 4
  %30 = load float, ptr %arrayidx56, align 4
  %31 = load float, ptr %arrayidx59, align 4
  %32 = load float, ptr %arrayidx60, align 4
  %sub.modify = fsub float %1, %2
  %33 = fsub float %3, %4
  %34 = fsub float %5, %6
  %35 = fsub float %7, %8
  %36 = fsub float %9, %10
  %37 = fsub float %11, %12
  %38 = fsub float %13, %14
  %39 = fsub float %15, %16
  %40 = fsub float %17, %18
  %41 = fsub float %19, %20
  %42 = fsub float %21, %22
  %43 = fsub float %23, %24
  %44 = fsub float %25, %26
  %45 = fsub float %27, %28
  %46 = fsub float %29, %30
  %47 = fsub float %31, %32
  store float %47, ptr %arrayidx61, align 4
  store float %46, ptr %arrayidx57, align 4
  store float %45, ptr %arrayidx53, align 4
  store float %44, ptr %arrayidx49, align 4
  store float %43, ptr %arrayidx45, align 4
  store float %42, ptr %arrayidx41, align 4
  store float %41, ptr %arrayidx37, align 4
  store float %40, ptr %arrayidx33, align 4
  store float %39, ptr %arrayidx29, align 4
  store float %38, ptr %arrayidx25, align 4
  store float %37, ptr %arrayidx21, align 4
  store float %36, ptr %arrayidx17, align 4
  store float %35, ptr %arrayidx13, align 4
  store float %34, ptr %arrayidx7, align 4
  store float %33, ptr %arrayidx3, align 4
  store float %sub.modify, ptr %arrayidx11.modify, align 4
  %48 = add nuw i32 %i.021.modify, 16
  %exitcond.not.modify = icmp sgt i32 %48, %sub63
  br i1 %exitcond.not.modify, label %for.cond.preheader.new2, label %for.body.modify

for.body:                                         ; preds = %for.cond.preheader.new2, %for.body
  %i.021 = phi i32 [ %inc, %for.body ], [ %0, %for.cond.preheader.new2 ]
  %mul = mul nsw i32 %i.021, %step1
  %arrayidx = getelementptr inbounds float, ptr %input1, i32 %mul
  %49 = load float, ptr %arrayidx, align 4
  %mul8 = mul nsw i32 %i.021, %step2
  %arrayidx9 = getelementptr inbounds float, ptr %input2, i32 %mul8
  %50 = load float, ptr %arrayidx9, align 4
  %sub = fsub float %49, %50
  %mul10 = mul nsw i32 %i.021, %step_out
  %arrayidx11 = getelementptr inbounds float, ptr %output, i32 %mul10
  store float %sub, ptr %arrayidx11, align 4
  %inc = add nuw nsw i32 %i.021, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %return, label %for.body

for.body.clone:                                   ; preds = %for.body.clone, %for.cond.preheader
  %i.021.clone = phi i32 [ %inc.clone, %for.body.clone ], [ 0, %for.cond.preheader ]
  %mul.clone = mul nsw i32 %i.021.clone, %step1
  %arrayidx.clone = getelementptr inbounds float, ptr %input1, i32 %mul.clone
  %51 = load float, ptr %arrayidx.clone, align 4
  %mul8.clone = mul nsw i32 %i.021.clone, %step2
  %arrayidx9.clone = getelementptr inbounds float, ptr %input2, i32 %mul8.clone
  %52 = load float, ptr %arrayidx9.clone, align 4
  %sub.clone = fsub float %51, %52
  %mul10.clone = mul nsw i32 %i.021.clone, %step_out
  %arrayidx11.clone = getelementptr inbounds float, ptr %output, i32 %mul10.clone
  store float %sub.clone, ptr %arrayidx11.clone, align 4
  %inc.clone = add nuw nsw i32 %i.021.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %len
  br i1 %exitcond.not.clone, label %return, label %for.body.clone

return:                                           ; preds = %for.cond.preheader.new2, %for.body.clone, %for.body, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ 458755, %entry ], [ 0, %for.cond.preheader ], [ 0, %for.body ], [ 0, %for.body.clone ], [ 0, %for.cond.preheader.new2 ]
  ret i32 %retval.0
}
