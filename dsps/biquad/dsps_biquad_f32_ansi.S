	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_xesppie1p0"
	.file	"dsps_biquad_f32_ansi.c"
	.globl	dsps_biquad_f32_ansi            # -- Begin function dsps_biquad_f32_ansi
	.p2align	1
	.type	dsps_biquad_f32_ansi,@function
dsps_biquad_f32_ansi:                   # @dsps_biquad_f32_ansi
# %bb.0:                                # %entry
	li	a5, 3
	blt	a2, a5, .LBB0_5
# %bb.1:                                # %for.cond.preheader
	blez	a2, .LBB0_7
# %bb.2:                                # %for.body.lr.ph
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
.LBB0_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	ft2, 0(a0)
	fmv.s	ft3, ft1
	fmadd.s	ft1, fa1, ft1, ft2
	fmadd.s	ft1, fa0, ft0, ft1
	fmul.s	ft2, ft3, fa3
	fmadd.s	ft2, fa4, ft1, ft2
	fmadd.s	ft0, fa2, ft0, ft2
	fsw	ft0, 0(a1)
	addi	a1, a1, 4
	addi	a0, a0, 4
	fmv.s	ft0, ft3
	bne	a1, a2, .LBB0_3
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
	fmv.s	fa4, fa3
	bne	a1, a2, .LBB0_6
.LBB0_7:                                # %if.end
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_biquad_f32_ansi, .Lfunc_end0-dsps_biquad_f32_ansi
                                        # -- End function
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
