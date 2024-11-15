# 2024-11-04 11:04:05
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fir_f32_best.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fir_f32_arp4               # -- Begin function dsps_fir_f32_arp4
	.p2align	1
	.type	dsps_fir_f32_arp4,@function
dsps_fir_f32_arp4:                      # @dsps_fir_f32_arp4
# %bb.0:                                # %entry
	addi	sp, sp, -32
	sw	s0, 28(sp)                      # 4-byte Folded Spill
	sw	s1, 24(sp)                      # 4-byte Folded Spill
	sw	s2, 20(sp)                      # 4-byte Folded Spill
	sw	s3, 16(sp)                      # 4-byte Folded Spill
	sw	s4, 12(sp)                      # 4-byte Folded Spill
	li	a4, 2
	bge	a4, a3, .LBB0_17
# %bb.1:                                # %for.cond.preheader
	lw	a7, 8(a0)
	lw	a6, 4(a0)
	li	t1, 0
	addi	t6, a7, -7
	lw	s2, 12(a0)
	addi	t0, a6, 16
	fmv.w.x	fa5, zero
	li	t2, 8
	lui	t3, 524288
	addi	t3, t3, -8
	j	.LBB0_3
.LBB0_2:                                # %for.end137
                                        #   in Loop: Header=BB0_3 Depth=1
	fadd.s	ft1, ft1, ft2
	fadd.s	ft0, ft0, ft1
	fadd.s	fa0, fa0, ft0
	fadd.s	fa1, fa1, fa0
	fadd.s	fa2, fa2, fa1
	fadd.s	fa3, fa3, fa2
	fadd.s	fa4, fa4, fa3
	add	t4, t4, a2
	addi	t1, t1, 1
	fsw	fa4, 0(t4)
	beq	t1, a3, .LBB0_28
.LBB0_3:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_8 Depth 2
                                        #     Child Loop BB0_12 Depth 2
                                        #     Child Loop BB0_16 Depth 2
	slli	t4, t1, 2
	add	a4, a1, t4
	flw	fa4, 0(a4)
	li	a4, 0
	slli	a5, s2, 2
	add	a5, a5, a6
	fsw	fa4, 0(a5)
	addi	s2, s2, 1
	slt	a5, s2, a7
	neg	a5, a5
	and	s2, a5, s2
	slli	t5, s2, 2
	fmv.s	ft2, fa5
	fmv.s	ft1, fa5
	fmv.s	ft0, fa5
	fmv.s	fa0, fa5
	fmv.s	fa1, fa5
	fmv.s	fa2, fa5
	fmv.s	fa3, fa5
	fmv.s	fa4, fa5
	mv	s0, s2
	bge	s2, t6, .LBB0_6
# %bb.4:                                # %for.body12.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a5, 0(a0)
	li	a4, 0
	addi	a5, a5, 16
	add	s1, t0, t5
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
.LBB0_5:                                # %for.body12
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -16(a5)
	flw	ft4, -16(s1)
	fmadd.s	ft2, ft3, ft4, ft2
	flw	ft3, -12(a5)
	flw	ft4, -12(s1)
	flw	ft5, -8(a5)
	flw	ft6, -8(s1)
	flw	ft7, -4(a5)
	flw	fa6, -4(s1)
	flw	fa7, 0(a5)
	flw	ft8, 0(s1)
	fmadd.s	ft1, ft3, ft4, ft1
	fmadd.s	ft0, ft5, ft6, ft0
	fmadd.s	fa0, ft7, fa6, fa0
	fmadd.s	fa1, fa7, ft8, fa1
	flw	ft3, 4(a5)
	flw	ft4, 4(s1)
	flw	ft5, 8(a5)
	flw	ft6, 8(s1)
	flw	ft7, 12(a5)
	flw	fa6, 12(s1)
	fmadd.s	fa2, ft3, ft4, fa2
	fmadd.s	fa3, ft5, ft6, fa3
	addi	a4, a4, 8
	fmadd.s	fa4, ft7, fa6, fa4
	add	s0, s2, a4
	addi	a5, a5, 32
	addi	s1, s1, 32
	blt	s0, t6, .LBB0_5
.LBB0_6:                                # %for.cond59.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	bge	s0, a7, .LBB0_10
# %bb.7:                                # %for.body62.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s4, 0(a0)
	add	s3, a7, a4
	sub	s1, a7, s0
	slli	a5, s0, 2
	add	a5, a5, a6
	slli	a4, a4, 2
	add	a4, a4, s4
.LBB0_8:                                # %for.body62
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(a4)
	flw	ft4, 0(a5)
	fmadd.s	ft2, ft3, ft4, ft2
	addi	s1, s1, -1
	addi	a5, a5, 4
	addi	a4, a4, 4
	bnez	s1, .LBB0_8
# %bb.9:                                # %for.cond71.preheader.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	sub	a4, s3, s0
.LBB0_10:                               # %for.cond71.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	blt	s2, t2, .LBB0_14
# %bb.11:                               # %for.body75.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	li	s1, 0
	lw	a5, 0(a0)
	addi	s4, s2, -7
	and	s3, s2, t3
	slli	s0, a4, 2
	add	a5, a5, s0
	addi	s0, a5, 16
	mv	a5, t0
.LBB0_12:                               # %for.body75
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
	fmadd.s	ft2, ft3, ft4, ft2
	fmadd.s	ft1, ft5, ft6, ft1
	fmadd.s	ft0, ft7, fa6, ft0
	fmadd.s	fa0, fa7, ft8, fa0
	flw	ft3, 0(s0)
	flw	ft4, 0(a5)
	flw	ft5, 4(s0)
	flw	ft6, 4(a5)
	flw	ft7, 8(s0)
	flw	fa6, 8(a5)
	flw	fa7, 12(s0)
	flw	ft8, 12(a5)
	fmadd.s	fa1, ft3, ft4, fa1
	fmadd.s	fa2, ft5, ft6, fa2
	fmadd.s	fa3, ft7, fa6, fa3
	fmadd.s	fa4, fa7, ft8, fa4
	addi	s1, s1, 8
	addi	s0, s0, 32
	addi	a5, a5, 32
	blt	s1, s4, .LBB0_12
# %bb.13:                               # %for.cond126.preheader.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	add	a4, a4, s1
	bge	s3, s2, .LBB0_2
	j	.LBB0_15
.LBB0_14:                               #   in Loop: Header=BB0_3 Depth=1
	li	s3, 0
	blez	s2, .LBB0_2
.LBB0_15:                               # %for.body129.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s0, 0(a0)
	slli	a5, s3, 2
	add	a5, a5, a6
	slli	a4, a4, 2
	add	a4, a4, s0
	add	t5, t5, a6
.LBB0_16:                               # %for.body129
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(a4)
	flw	ft4, 0(a5)
	fmadd.s	ft2, ft3, ft4, ft2
	addi	a5, a5, 4
	addi	a4, a4, 4
	bne	a5, t5, .LBB0_16
	j	.LBB0_2
.LBB0_17:                               # %for.cond150.preheader
	blez	a3, .LBB0_30
# %bb.18:                               # %for.body153.lr.ph
	lw	a6, 4(a0)
	lw	a7, 8(a0)
	lw	t2, 12(a0)
	li	a4, 0
	fmv.w.x	fa5, zero
	j	.LBB0_20
.LBB0_19:                               # %for.cond.cleanup186
                                        #   in Loop: Header=BB0_20 Depth=1
	add	t0, t0, a2
	addi	a4, a4, 1
	fsw	fa4, 0(t0)
	beq	a4, a3, .LBB0_29
.LBB0_20:                               # %for.body153
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_22 Depth 2
                                        #     Child Loop BB0_27 Depth 2
	slli	t0, a4, 2
	add	a5, a1, t0
	flw	fa4, 0(a5)
	slli	a5, t2, 2
	add	a5, a5, a6
	fsw	fa4, 0(a5)
	addi	t2, t2, 1
	slt	a5, t2, a7
	neg	a5, a5
	and	t2, a5, t2
	slli	t1, t2, 2
	fmv.s	fa4, fa5
	bge	t2, a7, .LBB0_23
# %bb.21:                               # %for.body173.lr.ph
                                        #   in Loop: Header=BB0_20 Depth=1
	lw	a5, 0(a0)
	sub	s1, a7, t2
	add	s0, a6, t1
	fmv.s	fa4, fa5
.LBB0_22:                               # %for.body173
                                        #   Parent Loop BB0_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a5)
	flw	fa2, 0(s0)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, 4
	addi	s1, s1, -1
	addi	a5, a5, 4
	bnez	s1, .LBB0_22
.LBB0_23:                               # %for.cond183.preheader
                                        #   in Loop: Header=BB0_20 Depth=1
	blez	t2, .LBB0_19
# %bb.24:                               # %for.body187.lr.ph
                                        #   in Loop: Header=BB0_20 Depth=1
	mv	a5, t2
	blt	a7, t2, .LBB0_26
# %bb.25:                               # %for.body187.lr.ph
                                        #   in Loop: Header=BB0_20 Depth=1
	mv	a5, a7
.LBB0_26:                               # %for.body187.lr.ph
                                        #   in Loop: Header=BB0_20 Depth=1
	lw	s1, 0(a0)
	slli	a5, a5, 2
	sub	a5, a5, t1
	add	a5, a5, s1
	add	t1, t1, a6
	mv	s1, a6
.LBB0_27:                               # %for.body187
                                        #   Parent Loop BB0_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a5)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s1, s1, 4
	addi	a5, a5, 4
	bne	s1, t1, .LBB0_27
	j	.LBB0_19
.LBB0_28:                               # %if.end200.loopexit
	sw	s2, 12(a0)
	j	.LBB0_30
.LBB0_29:                               # %for.cond150.if.end200.loopexit338_crit_edge
	sw	t2, 12(a0)
.LBB0_30:                               # %if.end200
	li	a0, 0
	lw	s0, 28(sp)                      # 4-byte Folded Reload
	lw	s1, 24(sp)                      # 4-byte Folded Reload
	lw	s2, 20(sp)                      # 4-byte Folded Reload
	lw	s3, 16(sp)                      # 4-byte Folded Reload
	lw	s4, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	dsps_fir_f32_arp4, .Lfunc_end0-dsps_fir_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333)"
	.section	".note.GNU-stack","",@progbits
