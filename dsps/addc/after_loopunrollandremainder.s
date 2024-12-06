# 2024-12-06 14:31:45
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_addc_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_addc_f32_arp4              # -- Begin function dsps_addc_f32_arp4
	.p2align	1
	.type	dsps_addc_f32_arp4,@function
dsps_addc_f32_arp4:                     # @dsps_addc_f32_arp4
# %bb.0:                                # %entry
	lui	a5, 112
	addi	a5, a5, 3
	beqz	a0, .LBB0_14
# %bb.1:                                # %entry
	beqz	a1, .LBB0_14
# %bb.2:                                # %if.end
	li	a5, 2
	bge	a5, a2, .LBB0_10
# %bb.3:                                # %for.cond.preheader.new
	li	a7, 0
	li	a5, 16
	bltu	a2, a5, .LBB0_7
# %bb.4:                                # %for.body.modify.preheader
	addi	t0, a0, 32
	addi	a5, a1, 32
	srli	a7, a2, 4
	esp.lp.setup	 0, a7, .LBB0_6
.LBB0_5:                                # %for.body.modify
                                        # =>This Inner Loop Header: Depth=1
	addi	a7, a7, 16
	flw	fa5, -32(t0)
	flw	fa4, -28(t0)
	flw	fa3, -24(t0)
	flw	fa2, -20(t0)
	flw	fa1, -16(t0)
	flw	ft0, -12(t0)
	flw	ft1, -8(t0)
	flw	ft2, -4(t0)
	flw	ft3, 0(t0)
	flw	ft4, 4(t0)
	flw	ft5, 8(t0)
	flw	ft6, 12(t0)
	flw	ft7, 16(t0)
	flw	fa6, 20(t0)
	flw	fa7, 24(t0)
	flw	ft8, 28(t0)
	fadd.s	fa5, fa0, fa5
	fadd.s	fa4, fa0, fa4
	fadd.s	fa3, fa0, fa3
	fadd.s	fa2, fa0, fa2
	fadd.s	fa1, fa0, fa1
	fadd.s	ft0, fa0, ft0
	fadd.s	ft1, fa0, ft1
	fadd.s	ft2, fa0, ft2
	fadd.s	ft3, fa0, ft3
	fadd.s	ft4, fa0, ft4
	fadd.s	ft5, fa0, ft5
	fadd.s	ft6, fa0, ft6
	fadd.s	ft7, fa0, ft7
	fadd.s	fa6, fa0, fa6
	fadd.s	fa7, fa0, fa7
	fadd.s	ft8, fa0, ft8
	fsw	fa5, -32(a5)
	fsw	fa4, -28(a5)
	fsw	fa3, -24(a5)
	fsw	fa2, -20(a5)
	fsw	fa1, -16(a5)
	fsw	ft0, -12(a5)
	fsw	ft1, -8(a5)
	fsw	ft2, -4(a5)
	fsw	ft3, 0(a5)
	fsw	ft4, 4(a5)
	fsw	ft5, 8(a5)
	fsw	ft6, 12(a5)
	fsw	ft7, 16(a5)
	fsw	fa6, 20(a5)
	fsw	fa7, 24(a5)
	fsw	ft8, 28(a5)
	addi	t0, t0, 64
.LBB0_6:                                # %for.body.modify
                                        #   in Loop: Header=BB0_5 Depth=1
                                        # Label of block must be emitted
	addi	a5, a5, 64
.LBB0_7:                                # %for.cond.preheader.new2
	bge	a7, a2, .LBB0_13
# %bb.8:                                # %for.body.preheader
	sub	a2, a2, a7
	mul	a5, a7, a4
	slli	a5, a5, 2
	add	a1, a1, a5
	slli	a4, a4, 2
	mul	a5, a7, a3
	slli	a5, a5, 2
	add	a0, a0, a5
	slli	a3, a3, 2
.LBB0_9:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a0)
	fadd.s	fa5, fa0, fa5
	fsw	fa5, 0(a1)
	addi	a2, a2, -1
	add	a1, a1, a4
	add	a0, a0, a3
	bnez	a2, .LBB0_9
	j	.LBB0_13
.LBB0_10:                               # %for.cond.preheader
	blez	a2, .LBB0_13
# %bb.11:                               # %for.body.clone.preheader
	slli	a4, a4, 2
	slli	a3, a3, 2
.LBB0_12:                               # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a0)
	fadd.s	fa5, fa0, fa5
	fsw	fa5, 0(a1)
	addi	a2, a2, -1
	add	a1, a1, a4
	add	a0, a0, a3
	bnez	a2, .LBB0_12
.LBB0_13:
	li	a5, 0
.LBB0_14:                               # %return
	mv	a0, a5
	ret
.Lfunc_end0:
	.size	dsps_addc_f32_arp4, .Lfunc_end0-dsps_addc_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49)"
	.section	".note.GNU-stack","",@progbits
