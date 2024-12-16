# 2024-12-06 18:46:51
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fird_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fird_f32_arp4              # -- Begin function dsps_fird_f32_arp4
	.p2align	1
	.type	dsps_fird_f32_arp4,@function
dsps_fird_f32_arp4:                     # @dsps_fird_f32_arp4
# %bb.0:                                # %entry
	blez	a3, .LBB0_24
# %bb.1:                                # %for.cond1.preheader.lr.ph
	addi	sp, sp, -16
	sw	s0, 12(sp)                      # 4-byte Folded Spill
	sw	s1, 8(sp)                       # 4-byte Folded Spill
	sw	s2, 4(sp)                       # 4-byte Folded Spill
	sw	s3, 0(sp)                       # 4-byte Folded Spill
	mv	t3, a3
	lw	a6, 16(a0)
	lw	t6, 8(a0)
	li	t4, 0
	lw	s2, 12(a0)
	slli	a7, a6, 2
	neg	t0, t6
	fmv.w.x	fa5, zero
	li	t1, 8
	lui	t2, 524288
	addi	t2, t2, -8
	j	.LBB0_3
.LBB0_2:                                # %for.end141
                                        #   in Loop: Header=BB0_3 Depth=1
	fadd.s	fa4, fa3, fa4
	fadd.s	fa3, fa2, fa1
	fadd.s	fa2, fa0, ft0
	fadd.s	fa1, ft1, ft2
	fadd.s	fa4, fa3, fa4
	fadd.s	fa3, fa2, fa1
	fadd.s	fa4, fa3, fa4
	slli	a3, t4, 2
	add	a3, a3, a2
	addi	t4, t4, 1
	fsw	fa4, 0(a3)
	beq	t4, t3, .LBB0_23
.LBB0_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_12 Depth 2
                                        #     Child Loop BB0_15 Depth 2
                                        #     Child Loop BB0_18 Depth 2
                                        #     Child Loop BB0_22 Depth 2
	blez	a6, .LBB0_7
# %bb.4:                                # %for.body4.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a4, 4(a0)
	add	a5, a1, a7
.LBB0_5:                                # %for.body4
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa4, 0(a1)
	addi	a1, a1, 4
	addi	a3, s2, 1
	slli	s2, s2, 2
	add	s2, s2, a4
	fsw	fa4, 0(s2)
	slt	s1, a3, t6
	neg	s1, s1
	and	s2, s1, a3
	bne	a1, a5, .LBB0_5
# %bb.6:                                # %for.cond1.for.cond.cleanup3_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=1
	sw	s2, 12(a0)
.LBB0_7:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_3 Depth=1
	addi	a5, s2, 8
	bge	t6, a5, .LBB0_11
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=1
	li	a4, 0
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
	mv	s1, s2
	blt	s2, t6, .LBB0_14
.LBB0_9:                                # %for.cond.cleanup26
                                        #   in Loop: Header=BB0_3 Depth=1
	bge	s2, t1, .LBB0_17
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=1
	li	t5, 0
	j	.LBB0_20
.LBB0_11:                               # %for.body14.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s1, 4(a0)
	li	a4, 0
	lw	s0, 0(a0)
	slli	a3, s2, 2
	add	a3, a3, s1
	addi	s1, a3, 16
	addi	s0, s0, 16
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
.LBB0_12:                               # %for.body14.7
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -16(s0)
	flw	ft4, -16(s1)
	fmadd.s	fa4, ft3, ft4, fa4
	flw	ft3, -12(s0)
	flw	ft4, -12(s1)
	flw	ft5, -8(s0)
	flw	ft6, -8(s1)
	flw	ft7, -4(s0)
	flw	fa6, -4(s1)
	flw	fa7, 0(s0)
	flw	ft8, 0(s1)
	fmadd.s	fa3, ft3, ft4, fa3
	fmadd.s	fa2, ft5, ft6, fa2
	fmadd.s	fa1, ft7, fa6, fa1
	fmadd.s	fa0, fa7, ft8, fa0
	flw	ft3, 4(s0)
	flw	ft4, 4(s1)
	flw	ft5, 8(s0)
	flw	ft6, 8(s1)
	flw	ft7, 12(s0)
	flw	fa6, 12(s1)
	fmadd.s	ft0, ft3, ft4, ft0
	fmadd.s	ft1, ft5, ft6, ft1
	addi	a4, a4, 8
	fmadd.s	ft2, ft7, fa6, ft2
	add	a3, a5, a4
	addi	s0, s0, 32
	addi	s1, s1, 32
	bge	t6, a3, .LBB0_12
# %bb.13:                               # %for.cond63.preheader.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	add	s1, s2, a4
	bge	s1, t6, .LBB0_9
.LBB0_14:                               # %for.body27.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s0, 4(a0)
	lw	a3, 0(a0)
	add	t5, a4, t6
	slli	a5, s1, 2
	add	s0, s0, a5
	slli	a4, a4, 2
	add	a4, a4, a3
	add	a5, t0, s1
.LBB0_15:                               # %for.body14.clone
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(a4)
	flw	ft4, 0(s0)
	fmadd.s	fa4, ft3, ft4, fa4
	addi	s0, s0, 4
	addi	a5, a5, 1
	addi	a4, a4, 4
	bnez	a5, .LBB0_15
# %bb.16:                               # %for.cond.cleanup26.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	sub	a4, t5, s1
	blt	s2, t1, .LBB0_10
.LBB0_17:                               # %for.body79.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a5, 4(a0)
	lw	s3, 0(a0)
	and	t5, s2, t2
	addi	a5, a5, 16
	slli	s1, a4, 2
	add	s0, s3, s1
	addi	s0, s0, 16
	slli	a3, s2, 2
	addi	a3, a3, -32
	andi	a3, a3, -32
	add	a3, a3, s1
	add	a3, a3, s3
	addi	s1, a3, 48
	sub	s1, s1, s0
	srli	s1, s1, 5
	esp.lp.setup	 0, s1, .LBB0_19
.LBB0_18:                               # %for.body27.7
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -16(s0)
	flw	ft4, -16(a5)
	flw	ft5, -12(s0)
	flw	ft6, -12(a5)
	flw	ft7, -8(s0)
	flw	fa6, -8(a5)
	flw	fa7, -4(s0)
	flw	ft8, -4(a5)
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	flw	ft3, 0(s0)
	flw	ft4, 0(a5)
	flw	ft5, 4(s0)
	flw	ft6, 4(a5)
	flw	ft7, 8(s0)
	flw	fa6, 8(a5)
	flw	fa7, 12(s0)
	flw	ft8, 12(a5)
	fmadd.s	fa0, ft3, ft4, fa0
	fmadd.s	ft0, ft5, ft6, ft0
	fmadd.s	ft1, ft7, fa6, ft1
	fmadd.s	ft2, fa7, ft8, ft2
	addi	a4, a4, 8
	addi	s0, s0, 32
.LBB0_19:                               # %for.body27.7
                                        #   in Loop: Header=BB0_18 Depth=2
                                        # Label of block must be emitted
	addi	a5, a5, 32
.LBB0_20:                               # %for.cond130.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	bge	t5, s2, .LBB0_2
# %bb.21:                               # %for.body133.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a5, 4(a0)
	lw	a3, 0(a0)
	slli	s0, t5, 2
	add	a5, a5, s0
	slli	a4, a4, 2
	add	a4, a4, a3
	sub	s1, t5, s2
.LBB0_22:                               # %for.body27.clone
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(a4)
	flw	ft4, 0(a5)
	fmadd.s	fa4, ft3, ft4, fa4
	addi	a5, a5, 4
	addi	s1, s1, 1
	addi	a4, a4, 4
	bnez	s1, .LBB0_22
	j	.LBB0_2
.LBB0_23:
	lw	s0, 12(sp)                      # 4-byte Folded Reload
	lw	s1, 8(sp)                       # 4-byte Folded Reload
	lw	s2, 4(sp)                       # 4-byte Folded Reload
	lw	s3, 0(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	mv	a0, t3
	ret
.LBB0_24:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_fird_f32_arp4, .Lfunc_end0-dsps_fird_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197)"
	.section	".note.GNU-stack","",@progbits
