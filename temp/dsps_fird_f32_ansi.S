	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_xesppie1p0"
	.file	"dsps_fird_f32_ansi.c"
	.globl	dsps_fird_f32_ansi              # -- Begin function dsps_fird_f32_ansi
	.p2align	1
	.type	dsps_fird_f32_ansi,@function
dsps_fird_f32_ansi:                     # @dsps_fird_f32_ansi
# %bb.0:                                # %entry
	blez	a3, .LBB0_23
# %bb.1:                                # %for.cond1.preheader.lr.ph
	addi	sp, sp, -16
	sw	s0, 12(sp)                      # 4-byte Folded Spill
	sw	s1, 8(sp)                       # 4-byte Folded Spill
	sw	s2, 4(sp)                       # 4-byte Folded Spill
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
	beq	t4, t3, .LBB0_22
.LBB0_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_12 Depth 2
                                        #     Child Loop BB0_15 Depth 2
                                        #     Child Loop BB0_18 Depth 2
                                        #     Child Loop BB0_21 Depth 2
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
	j	.LBB0_19
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
	addi	s1, s1, 32
	addi	s0, s0, 32
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
	lw	a3, 4(a0)
	lw	s0, 0(a0)
	and	t5, s2, t2
	addi	a5, a3, 16
	slli	s1, a4, 2
	add	s0, s0, s1
	addi	s0, s0, 16
	slli	s1, s2, 2
	addi	s1, s1, -32
	andi	s1, s1, -32
	add	a3, a3, s1
	addi	s1, a3, 48
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
	addi	a5, a5, 32
	addi	s0, s0, 32
	bne	a5, s1, .LBB0_18
.LBB0_19:                               # %for.cond130.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	bge	t5, s2, .LBB0_2
# %bb.20:                               # %for.body133.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a5, 4(a0)
	lw	a3, 0(a0)
	slli	s0, t5, 2
	add	a5, a5, s0
	slli	a4, a4, 2
	add	a4, a4, a3
	sub	s1, t5, s2
.LBB0_21:                               # %for.body27.clone
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(a4)
	flw	ft4, 0(a5)
	fmadd.s	fa4, ft3, ft4, fa4
	addi	a5, a5, 4
	addi	s1, s1, 1
	addi	a4, a4, 4
	bnez	s1, .LBB0_21
	j	.LBB0_2
.LBB0_22:
	lw	s0, 12(sp)                      # 4-byte Folded Reload
	lw	s1, 8(sp)                       # 4-byte Folded Reload
	lw	s2, 4(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	mv	a0, t3
	ret
.LBB0_23:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_fird_f32_ansi, .Lfunc_end0-dsps_fird_f32_ansi
                                        # -- End function
	.ident	"clang version 18.1.2"
	.section	".note.GNU-stack","",@progbits
	.addrsig
