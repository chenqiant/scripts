# 2024-12-05 16:03:37
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_dotprod_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_dotprod_f32_arp4           # -- Begin function dsps_dotprod_f32_arp4
	.p2align	1
	.type	dsps_dotprod_f32_arp4,@function
dsps_dotprod_f32_arp4:                  # @dsps_dotprod_f32_arp4
# %bb.0:                                # %entry
	blez	a3, .LBB0_3
# %bb.1:                                # %for.body.preheader
	addi	a4, a3, -1
	li	a5, 7
	andi	a6, a3, 7
	li	t0, 0
	bgeu	a4, a5, .LBB0_4
# %bb.2:
	fmv.w.x	fa5, zero
	j	.LBB0_6
.LBB0_3:
	fmv.w.x	fa5, zero
	fsw	fa5, 0(a2)
	li	a0, 0
	ret
.LBB0_4:                                # %for.body.preheader.new
	sub	a7, a3, a6
	addi	a4, a0, 16
	addi	a5, a1, 16
	fmv.w.x	fa5, zero
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa4, -16(a4)
	flw	fa3, -16(a5)
	flw	fa2, -12(a4)
	flw	fa1, -12(a5)
	flw	fa0, -8(a4)
	flw	ft0, -8(a5)
	flw	ft1, -4(a4)
	flw	ft2, -4(a5)
	fmadd.s	fa5, fa4, fa3, fa5
	fmadd.s	fa5, fa2, fa1, fa5
	fmadd.s	fa5, fa0, ft0, fa5
	fmadd.s	fa5, ft1, ft2, fa5
	flw	fa4, 0(a4)
	flw	fa3, 0(a5)
	flw	fa2, 4(a4)
	flw	fa1, 4(a5)
	flw	fa0, 8(a4)
	flw	ft0, 8(a5)
	flw	ft1, 12(a4)
	flw	ft2, 12(a5)
	fmadd.s	fa5, fa4, fa3, fa5
	fmadd.s	fa5, fa2, fa1, fa5
	fmadd.s	fa5, fa0, ft0, fa5
	fmadd.s	fa5, ft1, ft2, fa5
	addi	t0, t0, 8
	addi	a4, a4, 32
	addi	a5, a5, 32
	bne	a7, t0, .LBB0_5
.LBB0_6:                                # %for.cond.cleanup.loopexit.unr-lcssa
	beqz	a6, .LBB0_9
# %bb.7:                                # %for.body.epil.preheader
	not	a4, t0
	add	a3, a3, a4
	slli	t0, t0, 2
	add	a4, a1, t0
	add	a0, a0, t0
	slli	a6, a6, 2
	add	a1, a1, a6
	add	a1, a1, t0
.LBB0_8:                                # %for.body.epil
                                        # =>This Inner Loop Header: Depth=1
	flw	fa4, 0(a0)
	flw	fa3, 0(a4)
	fmadd.s	fa5, fa4, fa3, fa5
	addi	a3, a3, -1
	addi	a4, a4, 4
	addi	a0, a0, 4
	bne	a4, a1, .LBB0_8
.LBB0_9:                                # %for.cond.cleanup
	fsw	fa5, 0(a2)
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_dotprod_f32_arp4, .Lfunc_end0-dsps_dotprod_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb)"
	.section	".note.GNU-stack","",@progbits
