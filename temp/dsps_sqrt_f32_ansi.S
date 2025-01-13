	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_xesppie1p0"
	.file	"dsps_sqrt_f32_ansi.c"
	.globl	dsps_sqrtf_f32_ansi             # -- Begin function dsps_sqrtf_f32_ansi
	.p2align	1
	.type	dsps_sqrtf_f32_ansi,@function
dsps_sqrtf_f32_ansi:                    # @dsps_sqrtf_f32_ansi
# %bb.0:                                # %entry
	fmv.x.w	a0, fa0
	srai	a0, a0, 1
	lui	a1, 129972
	add	a0, a0, a1
	fmv.w.x	fa0, a0
	ret
.Lfunc_end0:
	.size	dsps_sqrtf_f32_ansi, .Lfunc_end0-dsps_sqrtf_f32_ansi
                                        # -- End function
	.globl	dsps_sqrt_f32_ansi              # -- Begin function dsps_sqrt_f32_ansi
	.p2align	1
	.type	dsps_sqrt_f32_ansi,@function
dsps_sqrt_f32_ansi:                     # @dsps_sqrt_f32_ansi
# %bb.0:                                # %entry
	lui	a3, 112
	addi	a3, a3, 3
	beqz	a0, .LBB1_13
# %bb.1:                                # %entry
	beqz	a1, .LBB1_13
# %bb.2:                                # %if.end
	li	a3, 2
	bge	a3, a2, .LBB1_9
# %bb.3:                                # %for.cond.preheader.new
	li	a7, 0
	li	a3, 16
	bltu	a2, a3, .LBB1_6
# %bb.4:                                # %for.body.modify.preheader
	addi	a6, a2, -16
	addi	a5, a1, 32
	addi	a4, a0, 32
	lui	t0, 129972
.LBB1_5:                                # %for.body.modify
                                        # =>This Inner Loop Header: Depth=1
	lw	t1, -32(a4)
	lw	t2, -28(a4)
	srai	a3, t1, 1
	add	a3, a3, t0
	sw	a3, -32(a5)
	srai	a3, t2, 1
	lw	t1, -24(a4)
	add	a3, a3, t0
	sw	a3, -28(a5)
	lw	t2, -20(a4)
	srai	a3, t1, 1
	add	a3, a3, t0
	sw	a3, -24(a5)
	srai	a3, t2, 1
	lw	t1, -16(a4)
	add	a3, a3, t0
	sw	a3, -20(a5)
	lw	t2, -12(a4)
	srai	a3, t1, 1
	add	a3, a3, t0
	sw	a3, -16(a5)
	srai	a3, t2, 1
	lw	t1, -8(a4)
	add	a3, a3, t0
	sw	a3, -12(a5)
	lw	t2, -4(a4)
	srai	a3, t1, 1
	add	a3, a3, t0
	sw	a3, -8(a5)
	srai	a3, t2, 1
	lw	t1, 0(a4)
	add	a3, a3, t0
	sw	a3, -4(a5)
	lw	t2, 4(a4)
	srai	a3, t1, 1
	add	a3, a3, t0
	sw	a3, 0(a5)
	srai	a3, t2, 1
	lw	t1, 8(a4)
	add	a3, a3, t0
	sw	a3, 4(a5)
	lw	t2, 12(a4)
	srai	a3, t1, 1
	add	a3, a3, t0
	sw	a3, 8(a5)
	srai	a3, t2, 1
	lw	t1, 16(a4)
	add	a3, a3, t0
	sw	a3, 12(a5)
	lw	t2, 20(a4)
	srai	a3, t1, 1
	add	a3, a3, t0
	sw	a3, 16(a5)
	srai	a3, t2, 1
	lw	t1, 24(a4)
	add	a3, a3, t0
	sw	a3, 20(a5)
	lw	t2, 28(a4)
	srai	a3, t1, 1
	add	a3, a3, t0
	sw	a3, 24(a5)
	srai	a3, t2, 1
	add	a3, a3, t0
	sw	a3, 28(a5)
	addi	a7, a7, 16
	addi	a5, a5, 64
	addi	a4, a4, 64
	bge	a6, a7, .LBB1_5
.LBB1_6:                                # %for.cond.preheader.new2
	bge	a7, a2, .LBB1_12
# %bb.7:                                # %for.body.preheader
	slli	a7, a7, 2
	add	a3, a1, a7
	add	a0, a0, a7
	slli	a2, a2, 2
	add	a1, a1, a2
	lui	a2, 129972
.LBB1_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a0)
	srai	a4, a4, 1
	add	a4, a4, a2
	sw	a4, 0(a3)
	addi	a3, a3, 4
	addi	a0, a0, 4
	bne	a3, a1, .LBB1_8
	j	.LBB1_12
.LBB1_9:                                # %for.cond.preheader
	blez	a2, .LBB1_12
# %bb.10:                               # %for.body.clone.preheader
	slli	a2, a2, 2
	add	a2, a2, a1
	lui	a3, 129972
.LBB1_11:                               # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a0)
	srai	a4, a4, 1
	add	a4, a4, a3
	sw	a4, 0(a1)
	addi	a1, a1, 4
	addi	a0, a0, 4
	bne	a1, a2, .LBB1_11
.LBB1_12:
	li	a3, 0
.LBB1_13:                               # %return
	mv	a0, a3
	ret
.Lfunc_end1:
	.size	dsps_sqrt_f32_ansi, .Lfunc_end1-dsps_sqrt_f32_ansi
                                        # -- End function
	.globl	dsps_inverted_sqrtf_f32_ansi    # -- Begin function dsps_inverted_sqrtf_f32_ansi
	.p2align	1
	.type	dsps_inverted_sqrtf_f32_ansi,@function
dsps_inverted_sqrtf_f32_ansi:           # @dsps_inverted_sqrtf_f32_ansi
# %bb.0:                                # %entry
	fmv.x.w	a0, fa0
	srli	a0, a0, 1
	lui	a1, 390006
	addi	a1, a1, -1569
	sub	a1, a1, a0
	fmv.w.x	fa5, a1
	lui	a0, 782336
	fmv.w.x	fa4, a0
	fmul.s	fa4, fa0, fa4
	fmul.s	fa4, fa4, fa5
	lui	a0, 261120
	fmv.w.x	fa3, a0
	fmadd.s	fa4, fa4, fa5, fa3
	fmul.s	fa0, fa4, fa5
	ret
.Lfunc_end2:
	.size	dsps_inverted_sqrtf_f32_ansi, .Lfunc_end2-dsps_inverted_sqrtf_f32_ansi
                                        # -- End function
	.ident	"clang version 18.1.2"
	.section	".note.GNU-stack","",@progbits
	.addrsig
