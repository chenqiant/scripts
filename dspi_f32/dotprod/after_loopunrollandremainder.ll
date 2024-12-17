; ModuleID = 'after_customlicm.ll'
source_filename = "dspi_dotprod_f32_ansi.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.image2d_s = type { ptr, i32, i32, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none)
define dso_local noundef i32 @dspi_dotprod_f32_ansi(ptr noalias nocapture noundef readonly %in_image, ptr noalias nocapture noundef readonly %filter, ptr noalias nocapture noundef writeonly %out_value, i32 noundef %count_x, i32 noundef %count_y) local_unnamed_addr #0 {
entry:
  %step_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 1
  %0 = load i32, ptr %step_x, align 4, !tbaa !4
  %mul = mul nsw i32 %0, %count_x
  %stride_x = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 3
  %1 = load i32, ptr %stride_x, align 4, !tbaa !10
  %cmp = icmp sgt i32 %mul, %1
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %step_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 2
  %2 = load i32, ptr %step_y, align 4, !tbaa !11
  %mul1 = mul nsw i32 %2, %count_y
  %stride_y = getelementptr inbounds %struct.image2d_s, ptr %in_image, i32 0, i32 4
  %3 = load i32, ptr %stride_y, align 4, !tbaa !12
  %cmp2 = icmp sgt i32 %mul1, %3
  br i1 %cmp2, label %return, label %if.end4

if.end4:                                          ; preds = %if.end
  %step_x5 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 1
  %4 = load i32, ptr %step_x5, align 4, !tbaa !4
  %mul6 = mul nsw i32 %4, %count_x
  %stride_x7 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 3
  %5 = load i32, ptr %stride_x7, align 4, !tbaa !10
  %cmp8 = icmp sgt i32 %mul6, %5
  br i1 %cmp8, label %return, label %if.end10

if.end10:                                         ; preds = %if.end4
  %step_y11 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 2
  %6 = load i32, ptr %step_y11, align 4, !tbaa !11
  %mul12 = mul nsw i32 %6, %count_y
  %stride_y13 = getelementptr inbounds %struct.image2d_s, ptr %filter, i32 0, i32 4
  %7 = load i32, ptr %stride_y13, align 4, !tbaa !12
  %cmp14 = icmp sgt i32 %mul12, %7
  br i1 %cmp14, label %return, label %if.end16

if.end16:                                         ; preds = %if.end10
  %mul20 = mul nsw i32 %2, %1
  %mul23 = mul nsw i32 %6, %5
  %cmp2468 = icmp sgt i32 %count_y, 0
  br i1 %cmp2468, label %for.cond25.preheader.lr.ph, label %for.cond.cleanup

for.cond25.preheader.lr.ph:                       ; preds = %if.end16
  %8 = load ptr, ptr %filter, align 4, !tbaa !13
  %9 = load ptr, ptr %in_image, align 4, !tbaa !13
  %sub = add nsw i32 %count_x, -7
  %10 = and i32 %count_x, -8
  %cmp2665 = icmp sgt i32 %count_x, 7
  br label %for.cond25.preheader

for.cond25.preheader:                             ; preds = %for.cond.cleanup27, %for.cond25.preheader.lr.ph
  %y.072 = phi i32 [ 0, %for.cond25.preheader.lr.ph ], [ %inc37, %for.cond.cleanup27 ]
  %acc.071 = phi float [ 0.000000e+00, %for.cond25.preheader.lr.ph ], [ %acc.1.lcssa.clone, %for.cond.cleanup27 ]
  %i_data.070 = phi ptr [ %9, %for.cond25.preheader.lr.ph ], [ %add.ptr, %for.cond.cleanup27 ]
  %f_data.069 = phi ptr [ %8, %for.cond25.preheader.lr.ph ], [ %add.ptr35, %for.cond.cleanup27 ]
  br i1 %cmp2665, label %for.body28.7, label %for.end

for.cond.cleanup:                                 ; preds = %for.cond.cleanup27, %if.end16
  %acc.0.lcssa = phi float [ 0.000000e+00, %if.end16 ], [ %acc.1.lcssa.clone, %for.cond.cleanup27 ]
  store float %acc.0.lcssa, ptr %out_value, align 4, !tbaa !14
  br label %return

for.body28.7:                                     ; preds = %for.body28.7, %for.cond25.preheader
  %acc7 = phi float [ %34, %for.body28.7 ], [ 0.000000e+00, %for.cond25.preheader ]
  %acc6 = phi float [ %31, %for.body28.7 ], [ 0.000000e+00, %for.cond25.preheader ]
  %acc5 = phi float [ %28, %for.body28.7 ], [ 0.000000e+00, %for.cond25.preheader ]
  %acc4 = phi float [ %25, %for.body28.7 ], [ 0.000000e+00, %for.cond25.preheader ]
  %acc3 = phi float [ %22, %for.body28.7 ], [ 0.000000e+00, %for.cond25.preheader ]
  %acc2 = phi float [ %19, %for.body28.7 ], [ 0.000000e+00, %for.cond25.preheader ]
  %acc1 = phi float [ %16, %for.body28.7 ], [ 0.000000e+00, %for.cond25.preheader ]
  %acc = phi float [ %13, %for.body28.7 ], [ 0.000000e+00, %for.cond25.preheader ]
  %x.067 = phi i32 [ %inc.7, %for.body28.7 ], [ 0, %for.cond25.preheader ]
  %acc.166 = phi float [ %34, %for.body28.7 ], [ %acc.071, %for.cond25.preheader ]
  %mul30 = mul nsw i32 %x.067, %0
  %arrayidx = getelementptr inbounds float, ptr %i_data.070, i32 %mul30
  %11 = load float, ptr %arrayidx, align 4, !tbaa !14
  %mul32 = mul nsw i32 %x.067, %4
  %arrayidx33 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32
  %12 = load float, ptr %arrayidx33, align 4, !tbaa !14
  %13 = tail call float @llvm.fmuladd.f32(float %11, float %12, float %acc)
  %inc = add nuw nsw i32 %x.067, 1
  %exitcond.not = icmp eq i32 %inc, %count_x
  %mul30.1 = mul nsw i32 %inc, %0
  %arrayidx.1 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.1
  %14 = load float, ptr %arrayidx.1, align 4, !tbaa !14
  %mul32.1 = mul nsw i32 %inc, %4
  %arrayidx33.1 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.1
  %15 = load float, ptr %arrayidx33.1, align 4, !tbaa !14
  %16 = tail call float @llvm.fmuladd.f32(float %14, float %15, float %acc1)
  %inc.1 = add nuw nsw i32 %x.067, 2
  %exitcond.not.1 = icmp eq i32 %inc.1, %count_x
  %mul30.2 = mul nsw i32 %inc.1, %0
  %arrayidx.2 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.2
  %17 = load float, ptr %arrayidx.2, align 4, !tbaa !14
  %mul32.2 = mul nsw i32 %inc.1, %4
  %arrayidx33.2 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.2
  %18 = load float, ptr %arrayidx33.2, align 4, !tbaa !14
  %19 = tail call float @llvm.fmuladd.f32(float %17, float %18, float %acc2)
  %inc.2 = add nuw nsw i32 %x.067, 3
  %exitcond.not.2 = icmp eq i32 %inc.2, %count_x
  %mul30.3 = mul nsw i32 %inc.2, %0
  %arrayidx.3 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.3
  %20 = load float, ptr %arrayidx.3, align 4, !tbaa !14
  %mul32.3 = mul nsw i32 %inc.2, %4
  %arrayidx33.3 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.3
  %21 = load float, ptr %arrayidx33.3, align 4, !tbaa !14
  %22 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %acc3)
  %inc.3 = add nuw nsw i32 %x.067, 4
  %exitcond.not.3 = icmp eq i32 %inc.3, %count_x
  %mul30.4 = mul nsw i32 %inc.3, %0
  %arrayidx.4 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.4
  %23 = load float, ptr %arrayidx.4, align 4, !tbaa !14
  %mul32.4 = mul nsw i32 %inc.3, %4
  %arrayidx33.4 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.4
  %24 = load float, ptr %arrayidx33.4, align 4, !tbaa !14
  %25 = tail call float @llvm.fmuladd.f32(float %23, float %24, float %acc4)
  %inc.4 = add nuw nsw i32 %x.067, 5
  %exitcond.not.4 = icmp eq i32 %inc.4, %count_x
  %mul30.5 = mul nsw i32 %inc.4, %0
  %arrayidx.5 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.5
  %26 = load float, ptr %arrayidx.5, align 4, !tbaa !14
  %mul32.5 = mul nsw i32 %inc.4, %4
  %arrayidx33.5 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.5
  %27 = load float, ptr %arrayidx33.5, align 4, !tbaa !14
  %28 = tail call float @llvm.fmuladd.f32(float %26, float %27, float %acc5)
  %inc.5 = add nuw nsw i32 %x.067, 6
  %exitcond.not.5 = icmp eq i32 %inc.5, %count_x
  %mul30.6 = mul nsw i32 %inc.5, %0
  %arrayidx.6 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.6
  %29 = load float, ptr %arrayidx.6, align 4, !tbaa !14
  %mul32.6 = mul nsw i32 %inc.5, %4
  %arrayidx33.6 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.6
  %30 = load float, ptr %arrayidx33.6, align 4, !tbaa !14
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %acc6)
  %inc.6 = add nuw nsw i32 %x.067, 7
  %exitcond.not.6 = icmp eq i32 %inc.6, %count_x
  %mul30.7 = mul nsw i32 %inc.6, %0
  %arrayidx.7 = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.7
  %32 = load float, ptr %arrayidx.7, align 4, !tbaa !14
  %mul32.7 = mul nsw i32 %inc.6, %4
  %arrayidx33.7 = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.7
  %33 = load float, ptr %arrayidx33.7, align 4, !tbaa !14
  %34 = tail call float @llvm.fmuladd.f32(float %32, float %33, float %acc7)
  %inc.7 = add nuw nsw i32 %x.067, 8
  %exitcond.not.7 = icmp slt i32 %inc.7, %sub
  br i1 %exitcond.not.7, label %for.body28.7, label %for.end.loopexit, !llvm.loop !16

for.end.loopexit:                                 ; preds = %for.body28.7
  %pairwise.sum = fadd float %13, %16
  %pairwise.sum8 = fadd float %19, %22
  %pairwise.sum9 = fadd float %25, %28
  %pairwise.sum10 = fadd float %31, %34
  %pairwise.sum11 = fadd float %pairwise.sum, %pairwise.sum8
  %pairwise.sum12 = fadd float %pairwise.sum9, %pairwise.sum10
  %pairwise.sum13 = fadd float %pairwise.sum11, %pairwise.sum12
  br label %for.end

for.end:                                          ; preds = %for.cond25.preheader, %for.end.loopexit
  %x.0.lcssa = phi i32 [ 0, %for.cond25.preheader ], [ %10, %for.end.loopexit ]
  %add103 = phi float [ 0.000000e+00, %for.cond25.preheader ], [ %pairwise.sum13, %for.end.loopexit ]
  %add104 = fadd float %acc.071, %add103
  %cmp106225 = icmp slt i32 %x.0.lcssa, %count_x
  br i1 %cmp106225, label %for.body28.clone, label %for.cond.cleanup27

for.body28.clone:                                 ; preds = %for.body28.clone, %for.end
  %x.067.clone = phi i32 [ %inc.clone, %for.body28.clone ], [ %x.0.lcssa, %for.end ]
  %acc.166.clone = phi float [ %37, %for.body28.clone ], [ %add104, %for.end ]
  %mul30.clone = mul nsw i32 %x.067.clone, %0
  %arrayidx.clone = getelementptr inbounds float, ptr %i_data.070, i32 %mul30.clone
  %35 = load float, ptr %arrayidx.clone, align 4, !tbaa !14
  %mul32.clone = mul nsw i32 %x.067.clone, %4
  %arrayidx33.clone = getelementptr inbounds float, ptr %f_data.069, i32 %mul32.clone
  %36 = load float, ptr %arrayidx33.clone, align 4, !tbaa !14
  %37 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %acc.166.clone)
  %inc.clone = add nuw nsw i32 %x.067.clone, 1
  %exitcond.not.clone = icmp eq i32 %inc.clone, %count_x
  br i1 %exitcond.not.clone, label %for.cond.cleanup27, label %for.body28.clone, !llvm.loop !16

for.cond.cleanup27:                               ; preds = %for.end, %for.body28.clone
  %acc.1.lcssa.clone = phi float [ %add104, %for.end ], [ %37, %for.body28.clone ]
  %add.ptr = getelementptr inbounds float, ptr %i_data.070, i32 %mul20
  %add.ptr35 = getelementptr inbounds float, ptr %f_data.069, i32 %mul23
  %inc37 = add nuw nsw i32 %y.072, 1
  %exitcond74.not = icmp eq i32 %inc37, %count_y
  br i1 %exitcond74.not, label %for.cond.cleanup, label %for.cond25.preheader, !llvm.loop !18

return:                                           ; preds = %for.cond.cleanup, %if.end10, %if.end4, %if.end, %entry
  %retval.0 = phi i32 [ 0, %for.cond.cleanup ], [ 458755, %entry ], [ 458755, %if.end ], [ 458755, %if.end4 ], [ 458755, %if.end10 ]
  ret i32 %retval.0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+f,+m,+relax,+xesppie,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"}
!4 = !{!5, !9, i64 4}
!5 = !{!"image2d_s", !6, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!5, !9, i64 12}
!11 = !{!5, !9, i64 8}
!12 = !{!5, !9, i64 16}
!13 = !{!5, !6, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !7, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
