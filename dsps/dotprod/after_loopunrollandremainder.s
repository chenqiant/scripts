# 2024-11-27 15:21:25
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_dotprod_f32_best.c"
	.option	push
	#.option	arch, -zcb, -zcmt
	.globl	dsps_dotprod_f32_arp4           # -- Begin function dsps_dotprod_f32_arp4
	.p2align	1
	.type	dsps_dotprod_f32_arp4,@function
dsps_dotprod_f32_arp4:                  # @dsps_dotprod_f32_arp4
# %bb.0:                                # %entry
	li	a4, 8
	slli	a6, a3, 2
	blt	a3, a4, .LBB0_4
# %bb.1:                                # %for.body.preheader
	lui	a4, 524288
	addi	a4, a4, -8
	and	a7, a3, a4
	addi	a4, a1, 16
	addi	t1, a0, 16
	addi	a5, a6, -32
	andi	a5, a5, -32
	add	a5, a5, a1
	addi	t0, a5, 48
	fmv.w.x	fa5, zero
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa4, -16(t1)
	flw	fa3, -12(t1)
	flw	fa2, -8(t1)
	flw	fa1, -4(t1)
	flw	fa0, 0(t1)
	flw	ft0, 4(t1)
	flw	ft1, 8(t1)
	flw	ft2, 12(t1)
	flw	ft3, -16(a4)
	flw	ft4, -12(a4)
	flw	ft5, -8(a4)
	flw	ft6, -4(a4)
	flw	ft7, 0(a4)
	flw	fa6, 4(a4)
	flw	fa7, 8(a4)
	flw	ft8, 12(a4)
	fmadd.s	fa5, fa4, ft3, fa5
	fmadd.s	fa5, fa3, ft4, fa5
	fmadd.s	fa5, fa2, ft5, fa5
	fmadd.s	fa5, fa1, ft6, fa5
	fmadd.s	fa5, fa0, ft7, fa5
	fmadd.s	fa5, ft0, fa6, fa5
	fmadd.s	fa5, ft1, fa7, fa5
	fmadd.s	fa5, ft2, ft8, fa5
	addi	a4, a4, 32
	addi	t1, t1, 32
	bne	a4, t0, .LBB0_2
# %bb.3:                                # %for.cond30.preheader
	blt	a7, a3, .LBB0_5
	j	.LBB0_7
.LBB0_4:
	li	a7, 0
	fmv.w.x	fa5, zero
	blez	a3, .LBB0_7
.LBB0_5:                                # %for.body32.preheader
	slli	a7, a7, 2
	add	a3, a1, a7
	add	a0, a0, a7
	add	a1, a1, a6
.LBB0_6:                                # %for.body32
                                        # =>This Inner Loop Header: Depth=1
	flw	fa4, 0(a0)
	flw	fa3, 0(a3)
	fmadd.s	fa5, fa4, fa3, fa5
	addi	a3, a3, 4
	addi	a0, a0, 4
	bne	a3, a1, .LBB0_6
.LBB0_7:                                # %for.end36
	fsw	fa5, 0(a2)
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_dotprod_f32_arp4, .Lfunc_end0-dsps_dotprod_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a)"
	.section	".note.GNU-stack","",@progbits
