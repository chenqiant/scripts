# 2024-12-24 16:08:23
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_biquad_f32_best.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_biquad_f32_arp4            # -- Begin function dsps_biquad_f32_arp4
	.p2align	1
	.type	dsps_biquad_f32_arp4,@function
dsps_biquad_f32_arp4:                   # @dsps_biquad_f32_arp4
# %bb.0:                                # %entry
	li	a5, 2
	bge	a5, a2, .LBB0_7
# %bb.1:                                # %for.cond.preheader
	li	a7, 0
	li	a5, 8
	bltu	a2, a5, .LBB0_4
# %bb.2:                                # %for.body.lr.ph
	flw	fa5, 0(a4)
	flw	fa4, 4(a4)
	addi	a6, a2, -7
	addi	t0, a1, 16
	addi	a5, a0, 16
.LBB0_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa3, -16(a5)
	flw	fa2, 12(a3)
	fnmsub.s	fa3, fa2, fa5, fa3
	flw	fa2, 16(a3)
	flw	fa1, 4(a3)
	flw	fa0, 0(a3)
	flw	ft0, 8(a3)
	fnmsub.s	fa3, fa2, fa4, fa3
	fmul.s	fa5, fa5, fa1
	fmadd.s	fa5, fa0, fa3, fa5
	fmadd.s	fa5, ft0, fa4, fa5
	fsw	fa5, -16(t0)
	flw	fa5, 0(a4)
	fsw	fa5, 4(a4)
	fsw	fa3, 0(a4)
	flw	fa4, -12(a5)
	flw	fa2, 12(a3)
	fnmsub.s	fa4, fa2, fa3, fa4
	flw	fa2, 16(a3)
	flw	fa1, 4(a3)
	flw	fa0, 0(a3)
	flw	ft0, 8(a3)
	fnmsub.s	fa4, fa2, fa5, fa4
	fmul.s	fa3, fa3, fa1
	fmadd.s	fa3, fa0, fa4, fa3
	fmadd.s	fa5, ft0, fa5, fa3
	fsw	fa5, -12(t0)
	flw	fa5, 0(a4)
	fsw	fa5, 4(a4)
	fsw	fa4, 0(a4)
	flw	fa3, -8(a5)
	flw	fa2, 12(a3)
	fnmsub.s	fa3, fa2, fa4, fa3
	flw	fa2, 16(a3)
	flw	fa1, 4(a3)
	flw	fa0, 0(a3)
	flw	ft0, 8(a3)
	fnmsub.s	fa3, fa2, fa5, fa3
	fmul.s	fa4, fa4, fa1
	fmadd.s	fa4, fa0, fa3, fa4
	fmadd.s	fa5, ft0, fa5, fa4
	fsw	fa5, -8(t0)
	flw	fa5, 0(a4)
	fsw	fa5, 4(a4)
	fsw	fa3, 0(a4)
	flw	fa4, -4(a5)
	flw	fa2, 12(a3)
	fnmsub.s	fa4, fa2, fa3, fa4
	flw	fa2, 16(a3)
	flw	fa1, 4(a3)
	flw	fa0, 0(a3)
	flw	ft0, 8(a3)
	fnmsub.s	fa4, fa2, fa5, fa4
	fmul.s	fa3, fa3, fa1
	fmadd.s	fa3, fa0, fa4, fa3
	fmadd.s	fa5, ft0, fa5, fa3
	fsw	fa5, -4(t0)
	flw	fa5, 0(a4)
	fsw	fa5, 4(a4)
	fsw	fa4, 0(a4)
	flw	fa3, 0(a5)
	flw	fa2, 12(a3)
	fnmsub.s	fa3, fa2, fa4, fa3
	flw	fa2, 16(a3)
	flw	fa1, 4(a3)
	flw	fa0, 0(a3)
	flw	ft0, 8(a3)
	fnmsub.s	fa3, fa2, fa5, fa3
	fmul.s	fa4, fa4, fa1
	fmadd.s	fa4, fa0, fa3, fa4
	fmadd.s	fa5, ft0, fa5, fa4
	fsw	fa5, 0(t0)
	flw	fa5, 0(a4)
	fsw	fa5, 4(a4)
	fsw	fa3, 0(a4)
	flw	fa4, 4(a5)
	flw	fa2, 12(a3)
	fnmsub.s	fa4, fa2, fa3, fa4
	flw	fa2, 16(a3)
	flw	fa1, 4(a3)
	flw	fa0, 0(a3)
	flw	ft0, 8(a3)
	fnmsub.s	fa4, fa2, fa5, fa4
	fmul.s	fa3, fa3, fa1
	fmadd.s	fa3, fa0, fa4, fa3
	fmadd.s	fa5, ft0, fa5, fa3
	fsw	fa5, 4(t0)
	flw	fa5, 0(a4)
	fsw	fa5, 4(a4)
	fsw	fa4, 0(a4)
	flw	fa3, 8(a5)
	flw	fa2, 12(a3)
	fnmsub.s	fa3, fa2, fa4, fa3
	flw	fa2, 16(a3)
	flw	fa1, 4(a3)
	flw	fa0, 0(a3)
	flw	ft0, 8(a3)
	fnmsub.s	fa3, fa2, fa5, fa3
	fmul.s	fa4, fa4, fa1
	fmadd.s	fa4, fa0, fa3, fa4
	fmadd.s	fa5, ft0, fa5, fa4
	fsw	fa5, 8(t0)
	flw	fa4, 0(a4)
	fsw	fa4, 4(a4)
	fsw	fa3, 0(a4)
	flw	fa5, 12(a5)
	flw	fa2, 12(a3)
	fnmsub.s	fa5, fa2, fa3, fa5
	flw	fa2, 16(a3)
	flw	fa1, 4(a3)
	flw	fa0, 0(a3)
	flw	ft0, 8(a3)
	fnmsub.s	fa5, fa2, fa4, fa5
	fmul.s	fa3, fa3, fa1
	fmadd.s	fa3, fa0, fa5, fa3
	fmadd.s	fa4, ft0, fa4, fa3
	fsw	fa4, 12(t0)
	flw	fa4, 0(a4)
	fsw	fa4, 4(a4)
	fsw	fa5, 0(a4)
	addi	a7, a7, 8
	addi	t0, t0, 32
	addi	a5, a5, 32
	blt	a7, a6, .LBB0_3
.LBB0_4:                                # %for.cond150.preheader
	bge	a7, a2, .LBB0_10
# %bb.5:                                # %for.body152.lr.ph
	flw	fa4, 0(a4)
	flw	fa5, 4(a4)
	slli	a7, a7, 2
	add	a5, a1, a7
	add	a0, a0, a7
	slli	a2, a2, 2
	add	a1, a1, a2
.LBB0_6:                                # %for.body152
                                        # =>This Inner Loop Header: Depth=1
	flw	fa3, 0(a0)
	flw	fa2, 12(a3)
	fnmsub.s	fa3, fa2, fa4, fa3
	flw	fa2, 4(a3)
	flw	fa1, 16(a3)
	flw	fa0, 0(a3)
	flw	ft0, 8(a3)
	fmul.s	fa4, fa4, fa2
	fnmsub.s	fa3, fa1, fa5, fa3
	fmadd.s	fa4, fa0, fa3, fa4
	fmadd.s	fa5, ft0, fa5, fa4
	fsw	fa5, 0(a5)
	flw	fa5, 0(a4)
	fsw	fa5, 4(a4)
	fsw	fa3, 0(a4)
	addi	a5, a5, 4
	addi	a0, a0, 4
	fmv.s	fa4, fa3
	bne	a5, a1, .LBB0_6
	j	.LBB0_10
.LBB0_7:                                # %for.cond174.preheader
	blez	a2, .LBB0_10
# %bb.8:                                # %for.body176.lr.ph
	flw	fa4, 0(a4)
	flw	fa5, 4(a4)
	slli	a2, a2, 2
	add	a2, a2, a1
.LBB0_9:                                # %for.body176
                                        # =>This Inner Loop Header: Depth=1
	flw	fa3, 0(a0)
	flw	fa2, 12(a3)
	fnmsub.s	fa3, fa2, fa4, fa3
	flw	fa2, 4(a3)
	flw	fa1, 16(a3)
	flw	fa0, 0(a3)
	flw	ft0, 8(a3)
	fmul.s	fa4, fa4, fa2
	fnmsub.s	fa3, fa1, fa5, fa3
	fmadd.s	fa4, fa0, fa3, fa4
	fmadd.s	fa5, ft0, fa5, fa4
	fsw	fa5, 0(a1)
	flw	fa5, 0(a4)
	fsw	fa5, 4(a4)
	fsw	fa3, 0(a4)
	addi	a1, a1, 4
	addi	a0, a0, 4
	fmv.s	fa4, fa3
	bne	a1, a2, .LBB0_9
.LBB0_10:                               # %if.end
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_biquad_f32_arp4, .Lfunc_end0-dsps_biquad_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc)"
	.section	".note.GNU-stack","",@progbits
