.option	arch, -zcb, +zcmp
# 2024-12-17 13:00:01
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspi_dotprod_f32_best.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dspi_dotprod_f32_arp4           # -- Begin function dspi_dotprod_f32_arp4
	.p2align	1
	.type	dspi_dotprod_f32_arp4,@function
dspi_dotprod_f32_arp4:                  # @dspi_dotprod_f32_arp4
# %bb.0:                                # %entry
	addi	sp, sp, -48
	sw	s0, 44(sp)                      # 4-byte Folded Spill
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	sw	s2, 36(sp)                      # 4-byte Folded Spill
	sw	s3, 32(sp)                      # 4-byte Folded Spill
	sw	s4, 28(sp)                      # 4-byte Folded Spill
	sw	s5, 24(sp)                      # 4-byte Folded Spill
	fsw	fs0, 20(sp)                     # 4-byte Folded Spill
	fsw	fs1, 16(sp)                     # 4-byte Folded Spill
	fsw	fs2, 12(sp)                     # 4-byte Folded Spill
	fsw	fs3, 8(sp)                      # 4-byte Folded Spill
	fsw	fs4, 4(sp)                      # 4-byte Folded Spill
	fsw	fs5, 0(sp)                      # 4-byte Folded Spill
	lw	s2, 4(a0)
	lw	s3, 12(a0)
	mul	s1, s2, a3
	lui	a5, 112
	addi	a5, a5, 3
	blt	s3, s1, .LBB0_18
# %bb.1:                                # %if.end
	lw	t2, 8(a0)
	lw	s1, 16(a0)
	mul	s0, t2, a4
	blt	s1, s0, .LBB0_18
# %bb.2:                                # %if.end4
	lw	t6, 4(a1)
	lw	t0, 12(a1)
	mul	s1, t6, a3
	lui	a5, 112
	addi	a5, a5, 3
	blt	t0, s1, .LBB0_18
# %bb.3:                                # %if.end10
	lw	t5, 8(a1)
	lw	s0, 16(a1)
	mul	s1, t5, a4
	blt	s0, s1, .LBB0_18
# %bb.4:                                # %if.end16
	fmv.w.x	fa5, zero
	blez	a4, .LBB0_17
# %bb.5:                                # %for.cond25.preheader.lr.ph
	lw	t1, 0(a0)
	lw	t3, 0(a1)
	li	a0, 8
	blt	a3, a0, .LBB0_12
# %bb.6:                                # %for.cond25.preheader.us.preheader
	li	a6, 0
	addi	t4, a3, -7
	lui	a1, 524288
	addi	a0, a1, -8
	and	a7, a3, a0
	mul	t0, t5, t0
	slli	t0, t0, 2
	slli	t5, t6, 5
	mul	t2, t2, s3
	slli	t2, t2, 2
	slli	s4, s2, 5
	slli	s5, s2, 2
	srli	a0, a3, 3
	mul	s0, s2, a0
	mul	s1, t6, a0
	slli	a0, t6, 2
	addi	a1, a1, 7
	and	t6, a3, a1
	slli	s1, s1, 5
	add	s2, t3, s1
	slli	s0, s0, 5
	fmv.w.x	fa4, zero
	add	s3, t1, s0
	fmv.s	fa5, fa4
	j	.LBB0_8
.LBB0_7:                                # %for.end116.us
                                        #   in Loop: Header=BB0_8 Depth=1
	addi	a6, a6, 1
	add	t3, t3, t0
	add	t1, t1, t2
	add	s2, s2, t0
	add	s3, s3, t2
	beq	a6, a4, .LBB0_17
.LBB0_8:                                # %for.cond25.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
                                        #     Child Loop BB0_11 Depth 2
	li	s0, 0
	mv	a5, t1
	mv	s1, t3
	fmv.s	fa3, fa4
	fmv.s	fa2, fa4
	fmv.s	fa1, fa4
	fmv.s	fa0, fa4
	fmv.s	ft0, fa4
	fmv.s	ft1, fa4
	fmv.s	ft2, fa4
	fmv.s	ft3, fa4
.LBB0_9:                                # %for.body27.us
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft4, 0(a5)
	add	a1, a5, s5
	flw	ft5, 0(a1)
	add	a1, a1, s5
	flw	ft6, 0(a1)
	add	a1, a1, s5
	flw	ft7, 0(a1)
	add	a1, a1, s5
	flw	fa6, 0(a1)
	add	a1, a1, s5
	flw	fa7, 0(a1)
	add	a1, a1, s5
	flw	ft8, 0(a1)
	add	a1, a1, s5
	flw	ft9, 0(a1)
	flw	ft10, 0(s1)
	add	a1, s1, a0
	flw	ft11, 0(a1)
	add	a1, a1, a0
	flw	fs0, 0(a1)
	add	a1, a1, a0
	flw	fs1, 0(a1)
	add	a1, a1, a0
	flw	fs2, 0(a1)
	add	a1, a1, a0
	flw	fs3, 0(a1)
	add	a1, a1, a0
	flw	fs4, 0(a1)
	add	a1, a1, a0
	flw	fs5, 0(a1)
	fmadd.s	fa3, ft4, ft10, fa3
	fmadd.s	fa2, ft5, ft11, fa2
	fmadd.s	fa1, ft6, fs0, fa1
	fmadd.s	fa0, ft7, fs1, fa0
	fmadd.s	ft0, fa6, fs2, ft0
	fmadd.s	ft1, fa7, fs3, ft1
	fmadd.s	ft2, ft8, fs4, ft2
	fmadd.s	ft3, ft9, fs5, ft3
	addi	s0, s0, 8
	add	s1, s1, t5
	add	a5, a5, s4
	blt	s0, t4, .LBB0_9
# %bb.10:                               # %for.cond25.for.end_crit_edge.us
                                        #   in Loop: Header=BB0_8 Depth=1
	fadd.s	fa3, fa2, fa3
	fadd.s	fa2, fa1, fa0
	fadd.s	fa1, ft0, ft1
	fadd.s	fa0, ft2, ft3
	fadd.s	fa3, fa2, fa3
	fadd.s	fa2, fa1, fa0
	fadd.s	fa3, fa2, fa3
	fadd.s	fa5, fa5, fa3
	mv	a1, s3
	mv	s0, s2
	mv	s1, t6
	bge	a7, a3, .LBB0_7
.LBB0_11:                               # %for.body107.us
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a1)
	flw	fa2, 0(s0)
	fmadd.s	fa5, fa3, fa2, fa5
	addi	s1, s1, -1
	add	s0, s0, a0
	add	a1, a1, s5
	bnez	s1, .LBB0_11
	j	.LBB0_7
.LBB0_12:                               # %for.cond25.preheader.lr.ph.split
	blez	a3, .LBB0_17
# %bb.13:                               # %for.cond25.preheader.us235.preheader
	li	a0, 0
	mul	a6, t5, t0
	slli	a6, a6, 2
	slli	t6, t6, 2
	mul	a5, t2, s3
	slli	a5, a5, 2
	fmv.w.x	fa4, zero
	slli	s2, s2, 2
	fmv.s	fa5, fa4
.LBB0_14:                               # %for.cond25.preheader.us235
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
	fadd.s	fa5, fa5, fa4
	mv	s1, t1
	mv	s0, t3
	mv	a1, a3
.LBB0_15:                               # %for.body107.us247
                                        #   Parent Loop BB0_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s1)
	flw	fa2, 0(s0)
	fmadd.s	fa5, fa3, fa2, fa5
	addi	a1, a1, -1
	add	s0, s0, t6
	add	s1, s1, s2
	bnez	a1, .LBB0_15
# %bb.16:                               # %for.cond105.for.end116_crit_edge.us257
                                        #   in Loop: Header=BB0_14 Depth=1
	addi	a0, a0, 1
	add	t3, t3, a6
	add	t1, t1, a5
	bne	a0, a4, .LBB0_14
.LBB0_17:                               # %for.cond.cleanup
	li	a5, 0
	fsw	fa5, 0(a2)
.LBB0_18:                               # %return
	mv	a0, a5
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	lw	s5, 24(sp)                      # 4-byte Folded Reload
	flw	fs0, 20(sp)                     # 4-byte Folded Reload
	flw	fs1, 16(sp)                     # 4-byte Folded Reload
	flw	fs2, 12(sp)                     # 4-byte Folded Reload
	flw	fs3, 8(sp)                      # 4-byte Folded Reload
	flw	fs4, 4(sp)                      # 4-byte Folded Reload
	flw	fs5, 0(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	dspi_dotprod_f32_arp4, .Lfunc_end0-dspi_dotprod_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
