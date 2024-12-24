# 2024-12-24 16:58:32
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_biquad_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_biquad_f32_arp4            # -- Begin function dsps_biquad_f32_arp4
	.p2align	1
	.type	dsps_biquad_f32_arp4,@function
dsps_biquad_f32_arp4:                   # @dsps_biquad_f32_arp4
# %bb.0:                                # %entry
	li	a5, 3
	blt	a2, a5, .LBB0_9
# %bb.1:                                # %for.cond.preheader
	li	a5, 0
	addi	a6, a2, -7
	flw	fa5, 0(a4)
	flw	ft2, 4(a4)
	flw	fa2, 12(a3)
	flw	fa1, 16(a3)
	flw	fa4, 0(a3)
	flw	ft1, 4(a3)
	flw	fa3, 8(a3)
	fneg.s	fa2, fa2
	fneg.s	fa1, fa1
	li	a7, -1
	mv	a3, a1
	fmv.s	ft3, fa5
.LBB0_2:                                # %for.body.7
                                        # =>This Inner Loop Header: Depth=1
	flw	fa0, 0(a0)
	fmadd.s	fa0, fa2, ft3, fa0
	fmadd.s	fa0, fa1, ft2, fa0
	fmul.s	ft0, ft1, ft3
	flw	ft4, 4(a0)
	fmadd.s	ft0, fa4, fa0, ft0
	fmadd.s	ft0, fa3, ft2, ft0
	fsw	ft0, 0(a3)
	fmadd.s	ft0, fa2, fa0, ft4
	fmadd.s	ft2, fa1, ft3, ft0
	fmul.s	ft0, ft1, fa0
	flw	ft4, 8(a0)
	fmadd.s	ft5, fa4, ft2, ft0
	fmadd.s	ft3, fa3, ft3, ft5
	fsw	ft3, 4(a3)
	fmadd.s	ft3, fa2, ft2, ft4
	fmadd.s	ft3, fa1, fa0, ft3
	fmul.s	ft4, ft1, ft2
	flw	ft5, 12(a0)
	fmadd.s	ft4, fa4, ft3, ft4
	fmadd.s	ft4, fa3, fa0, ft4
	fsw	ft4, 8(a3)
	fmadd.s	ft4, fa2, ft3, ft5
	fmadd.s	ft4, fa1, ft2, ft4
	fmul.s	ft5, ft1, ft3
	flw	ft6, 16(a0)
	fmadd.s	ft5, fa4, ft4, ft5
	fmadd.s	ft2, fa3, ft2, ft5
	fsw	ft2, 12(a3)
	fmadd.s	ft2, fa2, ft4, ft6
	fmadd.s	ft5, fa1, ft3, ft2
	fmul.s	ft2, ft1, ft4
	flw	ft6, 20(a0)
	fmadd.s	ft2, fa4, ft5, ft2
	fmadd.s	ft2, fa3, ft3, ft2
	fsw	ft2, 16(a3)
	fmadd.s	ft2, fa2, ft5, ft6
	fmadd.s	ft6, fa1, ft4, ft2
	fmul.s	ft2, ft1, ft5
	flw	ft3, 24(a0)
	fmadd.s	ft2, fa4, ft6, ft2
	fmadd.s	ft2, fa3, ft4, ft2
	fsw	ft2, 20(a3)
	fmadd.s	ft2, fa2, ft6, ft3
	fmadd.s	ft2, fa1, ft5, ft2
	fmul.s	ft3, ft1, ft6
	flw	ft4, 28(a0)
	fmadd.s	ft3, fa4, ft2, ft3
	fmadd.s	ft3, fa3, ft5, ft3
	fsw	ft3, 24(a3)
	fmadd.s	ft3, fa2, ft2, ft4
	fmadd.s	ft3, fa1, ft6, ft3
	fmul.s	ft4, ft1, ft2
	fmadd.s	ft4, fa4, ft3, ft4
	fmadd.s	ft4, fa3, ft6, ft4
	fsw	ft4, 28(a3)
	fsw	fa5, 4(a4)
	fsw	fa0, 0(a4)
	addi	a5, a5, 8
	addi	a7, a7, 1
	addi	a0, a0, 32
	addi	a3, a3, 32
	blt	a5, a6, .LBB0_2
# %bb.3:                                # %for.cond150.preheader
	bge	a5, a2, .LBB0_11
# %bb.4:                                # %for.body.lr.ph.clone8
	li	a5, 8
	slli	a2, a2, 2
	blt	a5, a6, .LBB0_6
# %bb.5:                                # %for.body.lr.ph.clone8
	li	a6, 8
.LBB0_6:                                # %for.body.lr.ph.clone8
	slli	a6, a6, 2
	addi	a6, a6, -4
	andi	a5, a6, -32
	slli	a7, a7, 5
	add	a2, a2, a7
	sub	a2, a2, a5
	add	a1, a1, a2
.LBB0_7:                                # %for.body.clone1
                                        # =>This Inner Loop Header: Depth=1
	flw	ft1, 0(a0)
	fmv.s	ft2, fa5
	fmadd.s	fa5, fa2, fa0, ft1
	fmadd.s	fa5, fa1, ft2, fa5
	fmadd.s	ft1, fa4, fa5, ft0
	fmadd.s	ft1, fa3, ft2, ft1
	fsw	ft1, 0(a3)
	addi	a3, a3, 4
	addi	a0, a0, 4
	bne	a3, a1, .LBB0_7
# %bb.8:                                # %for.cond.cleanup.clone
	fsw	fa0, 4(a4)
	fsw	fa5, 0(a4)
	li	a0, 0
	ret
.LBB0_9:                                # %for.body.lr.ph.clone
	flw	fa5, 0(a4)
	flw	ft0, 4(a4)
	flw	fa4, 12(a3)
	flw	fa3, 16(a3)
	flw	fa2, 0(a3)
	flw	fa1, 4(a3)
	flw	fa0, 8(a3)
	slli	a2, a2, 2
	add	a2, a2, a1
.LBB0_10:                               # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	flw	ft1, 0(a0)
	fnmsub.s	ft1, fa4, fa5, ft1
	fnmsub.s	ft1, fa3, ft0, ft1
	fmul.s	ft2, fa1, fa5
	fmadd.s	ft2, fa2, ft1, ft2
	fmadd.s	ft0, fa0, ft0, ft2
	fsw	ft0, 0(a1)
	fsw	fa5, 4(a4)
	fsw	ft1, 0(a4)
	addi	a1, a1, 4
	addi	a0, a0, 4
	fmv.s	ft0, fa5
	fmv.s	fa5, ft1
	bne	a1, a2, .LBB0_10
.LBB0_11:                               # %if.end
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_biquad_f32_arp4, .Lfunc_end0-dsps_biquad_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc)"
	.section	".note.GNU-stack","",@progbits
