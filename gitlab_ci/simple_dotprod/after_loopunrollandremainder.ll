; ModuleID = 'after_customlicm.ll'
source_filename = "after_customlicm.ll"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

define dso_local float @test_loop(ptr noalias nocapture noundef readonly %data1, ptr noalias nocapture noundef readonly %data2) local_unnamed_addr {
entry:
  br label %for.body

for.end:                                          ; preds = %for.body
  %add37 = fadd float %17, %16
  %add38 = fadd float %18, %add37
  %add39 = fadd float %19, %add38
  %add40 = fadd float %20, %add39
  %add41 = fadd float %21, %add40
  %add42 = fadd float %22, %add41
  %add43 = fadd float %23, %add42
  ret float %add43

for.body:                                         ; preds = %for.body, %entry
  %i.07 = phi i32 [ 0, %entry ], [ %inc.7, %for.body ]
  %.phi = phi float [ 0.000000e+00, %entry ], [ %16, %for.body ]
  %.phi1 = phi float [ 0.000000e+00, %entry ], [ %17, %for.body ]
  %.phi2 = phi float [ 0.000000e+00, %entry ], [ %18, %for.body ]
  %.phi3 = phi float [ 0.000000e+00, %entry ], [ %19, %for.body ]
  %.phi4 = phi float [ 0.000000e+00, %entry ], [ %20, %for.body ]
  %.phi5 = phi float [ 0.000000e+00, %entry ], [ %21, %for.body ]
  %.phi6 = phi float [ 0.000000e+00, %entry ], [ %22, %for.body ]
  %.phi7 = phi float [ 0.000000e+00, %entry ], [ %23, %for.body ]
  %add = or disjoint i32 %i.07, 1
  %add9 = or disjoint i32 %i.07, 2
  %add11 = or disjoint i32 %i.07, 3
  %add13 = or disjoint i32 %i.07, 4
  %add15 = or disjoint i32 %i.07, 5
  %add17 = or disjoint i32 %i.07, 6
  %add19 = or disjoint i32 %i.07, 7
  %arrayidx = getelementptr inbounds float, ptr %data1, i32 %i.07
  %arrayidx1 = getelementptr inbounds float, ptr %data2, i32 %i.07
  %arrayidx.1 = getelementptr inbounds float, ptr %data1, i32 %add
  %arrayidx1.1 = getelementptr inbounds float, ptr %data2, i32 %add
  %arrayidx.2 = getelementptr inbounds float, ptr %data1, i32 %add9
  %arrayidx1.2 = getelementptr inbounds float, ptr %data2, i32 %add9
  %arrayidx.3 = getelementptr inbounds float, ptr %data1, i32 %add11
  %arrayidx1.3 = getelementptr inbounds float, ptr %data2, i32 %add11
  %arrayidx.4 = getelementptr inbounds float, ptr %data1, i32 %add13
  %arrayidx1.4 = getelementptr inbounds float, ptr %data2, i32 %add13
  %arrayidx.5 = getelementptr inbounds float, ptr %data1, i32 %add15
  %arrayidx1.5 = getelementptr inbounds float, ptr %data2, i32 %add15
  %arrayidx.6 = getelementptr inbounds float, ptr %data1, i32 %add17
  %arrayidx1.6 = getelementptr inbounds float, ptr %data2, i32 %add17
  %arrayidx.7 = getelementptr inbounds float, ptr %data1, i32 %add19
  %arrayidx1.7 = getelementptr inbounds float, ptr %data2, i32 %add19
  %0 = load float, ptr %arrayidx, align 4
  %1 = load float, ptr %arrayidx1, align 4
  %2 = load float, ptr %arrayidx.1, align 4
  %3 = load float, ptr %arrayidx1.1, align 4
  %4 = load float, ptr %arrayidx.2, align 4
  %5 = load float, ptr %arrayidx1.2, align 4
  %6 = load float, ptr %arrayidx.3, align 4
  %7 = load float, ptr %arrayidx1.3, align 4
  %8 = load float, ptr %arrayidx.4, align 4
  %9 = load float, ptr %arrayidx1.4, align 4
  %10 = load float, ptr %arrayidx.5, align 4
  %11 = load float, ptr %arrayidx1.5, align 4
  %12 = load float, ptr %arrayidx.6, align 4
  %13 = load float, ptr %arrayidx1.6, align 4
  %14 = load float, ptr %arrayidx.7, align 4
  %15 = load float, ptr %arrayidx1.7, align 4
  %16 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %.phi)
  %17 = tail call float @llvm.fmuladd.f32(float %2, float %3, float %.phi1)
  %18 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %.phi2)
  %19 = tail call float @llvm.fmuladd.f32(float %6, float %7, float %.phi3)
  %20 = tail call float @llvm.fmuladd.f32(float %8, float %9, float %.phi4)
  %21 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %.phi5)
  %22 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %.phi6)
  %23 = tail call float @llvm.fmuladd.f32(float %14, float %15, float %.phi7)
  %inc.7 = add nuw nsw i32 %i.07, 8
  %cmp = icmp ult i32 %inc.7, 1009
  br i1 %cmp, label %for.body, label %for.end
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
