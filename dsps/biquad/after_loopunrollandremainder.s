# 2024-11-19 14:52:48
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
	blt	a2, a5, .LBB0_5
# %bb.1:                                # %for.cond.preheader
	flw	fa5, 0(a4)
	flw	ft0, 4(a4)
	flw	fa1, 12(a3)
	flw	fa0, 16(a3)
	flw	fa4, 0(a3)
	flw	fa3, 4(a3)
	flw	fa2, 8(a3)
	fneg.s	fa1, fa1
	fneg.s	fa0, fa0
	slli	a2, a2, 2
	add	a2, a2, a1
	fmv.s	ft1, fa5
	esp.lp.setup	 0, a2, .LBB0_3
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	ft2, 0(a0)
	fmv.s	ft3, ft1
	fmadd.s	ft1, fa1, ft1, ft2
	fmadd.s	ft1, fa0, ft0, ft1
	fmul.s	ft2, fa3, ft3
	fmadd.s	ft2, fa4, ft1, ft2
	fmadd.s	ft0, fa2, ft0, ft2
	fsw	ft0, 0(a1)
	addi	a1, a1, 4
	addi	a0, a0, 4
.LBB0_3:                                # %for.body
                                        #   in Loop: Header=BB0_2 Depth=1
                                        # Label of block must be emitted
	fmv.s	ft0, ft3
# %bb.4:                                # %for.cond.cleanup
	fsw	fa5, 4(a4)
	fsw	ft1, 0(a4)
	li	a0, 0
	ret
.LBB0_5:                                # %for.body.lr.ph.clone
	flw	fa4, 0(a4)
	flw	fa5, 4(a4)
	slli	a2, a2, 2
	add	a2, a2, a1
	esp.lp.setup	 0, a2, .LBB0_7
.LBB0_6:                                # %for.body.clone
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
	fmadd.s	fa4, ft0, fa5, fa4
	flw	fa5, 0(a4)
	fsw	fa4, 0(a1)
	fsw	fa5, 4(a4)
	fsw	fa3, 0(a4)
	addi	a1, a1, 4
	addi	a0, a0, 4
.LBB0_7:                                # %for.body.clone
                                        #   in Loop: Header=BB0_6 Depth=1
                                        # Label of block must be emitted
	fmv.s	fa4, fa3
# %bb.8:                                # %if.end
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_biquad_f32_arp4, .Lfunc_end0-dsps_biquad_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699)"
	.section	".note.GNU-stack","",@progbits
