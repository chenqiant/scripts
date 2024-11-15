	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"after_customlicm.ll"
	.globl	dsps_fird_f32_ansi              # -- Begin function dsps_fird_f32_ansi
	.p2align	1
	.type	dsps_fird_f32_ansi,@function
dsps_fird_f32_ansi:                     # @dsps_fird_f32_ansi
	.cfi_startproc
# %bb.0:                                # %entry
	blez	a3, .LBB0_23r
# %bb.1:                                # %for.cond1.preheader.lr.ph
	cm.push	{ra, s0-s3}, -32
	.cfi_def_cfa_offset 32
	.cfi_offset s0, -16
	.cfi_offset s1, -12
	.cfi_offset s2, -8
	.cfi_offset s3, -4
	mv	t2, a3
	lw	a6, 16(a0)
	li	t3, 0
	lw	t5, 8(a0)
	lw	t6, 12(a0)
	slli	a7, a6, 2
	fmv.w.x	fa5, zero
	li	t0, 8
	lui	t1, 524288
	addi	t1, t1, -8
	j	.LBB0_3
.LBB0_2:                                # %for.end141
                                        #   in Loop: Header=BB0_3 Depth=1
	fadd.s	fa4, fa3, fa4
	fadd.s	fa4, fa2, fa4
	fadd.s	fa4, fa1, fa4
	fadd.s	fa4, fa0, fa4
	fadd.s	fa4, ft0, fa4
	fadd.s	fa4, ft1, fa4
	fadd.s	fa4, ft2, fa4
	slli	a3, t3, 2
	add	a3, a3, a2
	addi	t3, t3, 1
	fsw	fa4, 0(a3)
	beq	t3, t2, .LBB0_22
.LBB0_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_10 Depth 2
                                        #     Child Loop BB0_13 Depth 2
                                        #     Child Loop BB0_18 Depth 2
                                        #     Child Loop BB0_21 Depth 2
	blez	a6, .LBB0_7
# %bb.4:                                # %for.body4.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a3, 4(a0)
	add	a4, a1, a7
.LBB0_5:                                # %for.body4
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa4, 0(a1)
	addi	a1, a1, 4
	addi	a5, t6, 1
	slli	t6, t6, 2
	add	t6, t6, a3
	fsw	fa4, 0(t6)
	slt	s1, a5, t5
	neg	s1, s1
	and	t6, s1, a5
	bne	a1, a4, .LBB0_5
# %bb.6:                                # %for.cond1.for.cond.cleanup3_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=1
	sw	t6, 12(a0)
.LBB0_7:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_3 Depth=1
	addi	a3, t6, 8
	bge	t5, a3, .LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=1
	li	s3, 0
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
	mv	s0, t6
	j	.LBB0_11
.LBB0_9:                                # %for.body14.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a4, 0(a0)
	lw	a3, 4(a0)
	li	s3, 0
	addi	a4, a4, 16
	slli	a5, t6, 2
	add	a3, a3, a5
	addi	a3, a3, 16
	mv	a5, t6
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
.LBB0_10:                               # %for.body14.7
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -16(a4)
	flw	ft4, -16(a3)
	fmadd.s	fa4, ft3, ft4, fa4
	flw	ft3, -12(a4)
	flw	ft4, -12(a3)
	flw	ft5, -8(a4)
	flw	ft6, -8(a3)
	flw	ft7, -4(a4)
	flw	fa6, -4(a3)
	flw	fa7, 0(a4)
	flw	ft8, 0(a3)
	fmadd.s	fa3, ft3, ft4, fa3
	fmadd.s	fa2, ft5, ft6, fa2
	fmadd.s	fa1, ft7, fa6, fa1
	fmadd.s	fa0, fa7, ft8, fa0
	flw	ft3, 4(a4)
	flw	ft4, 4(a3)
	flw	ft5, 8(a4)
	flw	ft6, 8(a3)
	flw	ft7, 12(a4)
	flw	fa6, 12(a3)
	fmadd.s	ft0, ft3, ft4, ft0
	fmadd.s	ft1, ft5, ft6, ft1
	addi	s3, s3, 8
	fmadd.s	ft2, ft7, fa6, ft2
	addi	s0, a5, 8
	addi	s1, a5, 16
	addi	a4, a4, 32
	addi	a3, a3, 32
	mv	a5, s0
	bge	t5, s1, .LBB0_10
.LBB0_11:                               # %for.cond63.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	bge	s0, t5, .LBB0_15
# %bb.12:                               # %for.body27.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s2, 0(a0)
	lw	a3, 4(a0)
	add	t4, t5, s3
	sub	a4, t5, s0
	slli	a5, s0, 2
	add	a5, a5, a3
	slli	s1, s3, 2
	add	s1, s1, s2
.LBB0_13:                               # %for.body14.clone
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(s1)
	flw	ft4, 0(a5)
	fmadd.s	fa4, ft3, ft4, fa4
	addi	a4, a4, -1
	addi	a5, a5, 4
	addi	s1, s1, 4
	bnez	a4, .LBB0_13
# %bb.14:                               # %for.cond.cleanup26.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	sub	s3, t4, s0
.LBB0_15:                               # %for.cond.cleanup26
                                        #   in Loop: Header=BB0_3 Depth=1
	bge	t6, t0, .LBB0_17
# %bb.16:                               #   in Loop: Header=BB0_3 Depth=1
	li	t4, 0
	blez	t6, .LBB0_2
	j	.LBB0_20
.LBB0_17:                               # %for.body79.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a3, 0(a0)
	lw	a5, 4(a0)
	and	t4, t6, t1
	slli	a4, s3, 2
	add	a3, a3, a4
	addi	a3, a3, 16
	addi	a5, a5, 16
	li	a4, 8
.LBB0_18:                               # %for.body27.7
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -16(a3)
	flw	ft4, -16(a5)
	flw	ft5, -12(a3)
	flw	ft6, -12(a5)
	flw	ft7, -8(a3)
	flw	fa6, -8(a5)
	flw	fa7, -4(a3)
	flw	ft8, -4(a5)
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	flw	ft3, 0(a3)
	flw	ft4, 0(a5)
	flw	ft5, 4(a3)
	flw	ft6, 4(a5)
	flw	ft7, 8(a3)
	flw	fa6, 8(a5)
	flw	fa7, 12(a3)
	flw	ft8, 12(a5)
	fmadd.s	fa0, ft3, ft4, fa0
	fmadd.s	ft0, ft5, ft6, ft0
	fmadd.s	ft1, ft7, fa6, ft1
	fmadd.s	ft2, fa7, ft8, ft2
	addi	a4, a4, 8
	addi	a3, a3, 32
	addi	a5, a5, 32
	bge	t6, a4, .LBB0_18
# %bb.19:                               # %for.cond130.preheader.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	add	a4, a4, s3
	addi	s3, a4, -8
	bge	t4, t6, .LBB0_2
.LBB0_20:                               # %for.body133.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s0, 4(a0)
	lw	a4, 0(a0)
	slli	a3, t4, 2
	add	a3, a3, s0
	slli	s3, s3, 2
	add	a4, a4, s3
	slli	a5, t6, 2
	add	a5, a5, s0
.LBB0_21:                               # %for.body27.clone
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(a4)
	flw	ft4, 0(a3)
	fmadd.s	fa4, ft3, ft4, fa4
	addi	a3, a3, 4
	addi	a4, a4, 4
	bne	a3, a5, .LBB0_21
	j	.LBB0_2
.LBB0_22:
	cm.pop	{ra, s0-s3}, 32
	mv	a0, t2
	ret
.LBB0_23:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_fird_f32_ansi, .Lfunc_end0-dsps_fird_f32_ansi
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
