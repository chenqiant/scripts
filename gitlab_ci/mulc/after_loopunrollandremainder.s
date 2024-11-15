	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"after_customlicm.ll"
	.globl	dsps_mulc_f32_ansi              # -- Begin function dsps_mulc_f32_ansi
	.p2align	1
	.type	dsps_mulc_f32_ansi,@function
dsps_mulc_f32_ansi:                     # @dsps_mulc_f32_ansi
	.cfi_startproc
# %bb.0:                                # %entry
	lui	a5, 112
	addi	a5, a5, 3
	beqz	a0, .LBB0_13
# %bb.1:                                # %entry
	beqz	a1, .LBB0_13
# %bb.2:                                # %if.end
	li	a5, 2
	bge	a5, a2, .LBB0_9
# %bb.3:                                # %for.cond.preheader.new
	li	a7, 0
	li	a5, 16
	bltu	a2, a5, .LBB0_6
# %bb.4:                                # %for.body.modify.preheader
	addi	a6, a2, -16
	addi	t0, a1, 32
	addi	a5, a0, 32
.LBB0_5:                                # %for.body.modify
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, -32(a5)
	flw	fa4, -28(a5)
	flw	fa3, -24(a5)
	flw	fa2, -20(a5)
	flw	fa1, -16(a5)
	flw	ft0, -12(a5)
	flw	ft1, -8(a5)
	flw	ft2, -4(a5)
	flw	ft3, 0(a5)
	flw	ft4, 4(a5)
	flw	ft5, 8(a5)
	flw	ft6, 12(a5)
	flw	ft7, 16(a5)
	flw	fa6, 20(a5)
	flw	fa7, 24(a5)
	flw	ft8, 28(a5)
	fmul.s	fa5, fa5, fa0
	fmul.s	fa4, fa4, fa0
	fmul.s	fa3, fa3, fa0
	fmul.s	fa2, fa2, fa0
	fmul.s	fa1, fa1, fa0
	fmul.s	ft0, ft0, fa0
	fmul.s	ft1, ft1, fa0
	fmul.s	ft2, ft2, fa0
	fmul.s	ft3, ft3, fa0
	fmul.s	ft4, ft4, fa0
	fmul.s	ft5, ft5, fa0
	fmul.s	ft6, ft6, fa0
	fmul.s	ft7, ft7, fa0
	fmul.s	fa6, fa6, fa0
	fmul.s	fa7, fa7, fa0
	fmul.s	ft8, ft8, fa0
	fsw	ft8, 28(t0)
	fsw	fa7, 24(t0)
	fsw	fa6, 20(t0)
	fsw	ft7, 16(t0)
	fsw	ft6, 12(t0)
	fsw	ft5, 8(t0)
	fsw	ft4, 4(t0)
	fsw	ft3, 0(t0)
	fsw	ft2, -4(t0)
	fsw	ft1, -8(t0)
	fsw	ft0, -12(t0)
	fsw	fa1, -16(t0)
	fsw	fa2, -20(t0)
	fsw	fa3, -24(t0)
	fsw	fa4, -28(t0)
	fsw	fa5, -32(t0)
	addi	a7, a7, 16
	addi	t0, t0, 64
	addi	a5, a5, 64
	bge	a6, a7, .LBB0_5
.LBB0_6:                                # %for.cond.preheader.new2
	bge	a7, a2, .LBB0_12
# %bb.7:                                # %for.body.preheader
	sub	a2, a2, a7
	mul	a5, a7, a4
	slli	a5, a5, 2
	add	a1, a1, a5
	slli	a4, a4, 2
	mul	a5, a7, a3
	slli	a5, a5, 2
	add	a0, a0, a5
	slli	a3, a3, 2
.LBB0_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a0)
	fmul.s	fa5, fa5, fa0
	fsw	fa5, 0(a1)
	addi	a2, a2, -1
	add	a1, a1, a4
	add	a0, a0, a3
	bnez	a2, .LBB0_8
	j	.LBB0_12
.LBB0_9:                                # %for.cond.preheader
	blez	a2, .LBB0_12
# %bb.10:                               # %for.body.clone.preheader
	slli	a4, a4, 2
	slli	a3, a3, 2
.LBB0_11:                               # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a0)
	fmul.s	fa5, fa5, fa0
	fsw	fa5, 0(a1)
	addi	a2, a2, -1
	add	a1, a1, a4
	add	a0, a0, a3
	bnez	a2, .LBB0_11
.LBB0_12:
	li	a5, 0
.LBB0_13:                               # %return
	mv	a0, a5
	ret
.Lfunc_end0:
	.size	dsps_mulc_f32_ansi, .Lfunc_end0-dsps_mulc_f32_ansi
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
