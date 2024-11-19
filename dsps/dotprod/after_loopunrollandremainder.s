# 2024-11-19 14:52:49
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_dotprod_f32_arp4.c"
	.option	push
	#.option	arch, -zcb, -zcmt
	.globl	dsps_dotprod_f32_arp4           # -- Begin function dsps_dotprod_f32_arp4
	.p2align	1
	.type	dsps_dotprod_f32_arp4,@function
dsps_dotprod_f32_arp4:                  # @dsps_dotprod_f32_arp4
# %bb.0:                                # %entry
	li	a4, 2
	bge	a4, a3, .LBB0_8
# %bb.1:                                # %for.cond.preheader1
	li	a4, 8
	bltu	a3, a4, .LBB0_13
# %bb.2:                                # %for.body.preheader
	addi	a7, a3, -7
	lui	a5, 524288
	addi	a5, a5, -8
	blt	a4, a7, .LBB0_4
# %bb.3:                                # %for.body.preheader
	li	a7, 8
.LBB0_4:                                # %for.body.preheader
	and	a6, a3, a5
	addi	a5, a1, 16
	addi	t0, a0, 16
	fmv.w.x	fa5, zero
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	srli	a7, a3, 3
	esp.lp.setup	 0, a7, .LBB0_6
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	ft2, -16(t0)
	flw	ft3, -16(a5)
	flw	ft4, -12(t0)
	flw	ft5, -12(a5)
	flw	ft6, -8(t0)
	flw	ft7, -8(a5)
	flw	fa6, -4(t0)
	flw	fa7, -4(a5)
	fmadd.s	fa5, ft2, ft3, fa5
	fmadd.s	fa4, ft4, ft5, fa4
	fmadd.s	fa3, ft6, ft7, fa3
	fmadd.s	fa2, fa6, fa7, fa2
	flw	ft2, 0(t0)
	flw	ft3, 0(a5)
	flw	ft4, 4(t0)
	flw	ft5, 4(a5)
	flw	ft6, 8(t0)
	flw	ft7, 8(a5)
	flw	fa6, 12(t0)
	flw	fa7, 12(a5)
	fmadd.s	fa1, ft2, ft3, fa1
	fmadd.s	fa0, ft4, ft5, fa0
	fmadd.s	ft0, ft6, ft7, ft0
	fmadd.s	ft1, fa6, fa7, ft1
	addi	a5, a5, 32
.LBB0_6:                                # %for.body
                                        #   in Loop: Header=BB0_5 Depth=1
                                        # Label of block must be emitted
	addi	t0, t0, 32
# %bb.7:                                # %for.cond31.preheader
	blt	a6, a3, .LBB0_14
	j	.LBB0_17
.LBB0_8:                                # %for.cond.preheader
	blez	a3, .LBB0_18
# %bb.9:                                # %for.body.clone.preheader
	slli	a3, a3, 2
	add	a3, a3, a1
	fmv.w.x	fa5, zero
	esp.lp.setup	 1, a3, .LBB0_11
.LBB0_10:                               # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	flw	fa4, 0(a0)
	flw	fa3, 0(a1)
	fmadd.s	fa5, fa4, fa3, fa5
	addi	a1, a1, 4
.LBB0_11:                               # %for.body.clone
                                        #   in Loop: Header=BB0_10 Depth=1
                                        # Label of block must be emitted
	addi	a0, a0, 4
# %bb.12:                               # %if.end
	fsw	fa5, 0(a2)
	li	a0, 0
	ret
.LBB0_13:
	fmv.w.x	fa5, zero
	li	a6, 0
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	blez	a3, .LBB0_17
.LBB0_14:                               # %for.body33.preheader
	slli	a6, a6, 2
	add	a4, a1, a6
	add	a0, a0, a6
	slli	a3, a3, 2
	add	a1, a1, a3
	esp.lp.setup	 1, a1, .LBB0_16
.LBB0_15:                               # %for.body33
                                        # =>This Inner Loop Header: Depth=1
	flw	ft2, 0(a0)
	flw	ft3, 0(a4)
	fmadd.s	fa5, ft2, ft3, fa5
	addi	a4, a4, 4
.LBB0_16:                               # %for.body33
                                        #   in Loop: Header=BB0_15 Depth=1
                                        # Label of block must be emitted
	addi	a0, a0, 4
.LBB0_17:                               # %for.end37
	fadd.s	fa5, fa4, fa5
	fadd.s	fa4, fa3, fa2
	fadd.s	fa3, fa1, fa0
	fadd.s	fa2, ft0, ft1
	fadd.s	fa5, fa4, fa5
	fadd.s	fa4, fa3, fa2
	fadd.s	fa5, fa4, fa5
	fsw	fa5, 0(a2)
	li	a0, 0
	ret
.LBB0_18:
	fmv.w.x	fa5, zero
	fsw	fa5, 0(a2)
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_dotprod_f32_arp4, .Lfunc_end0-dsps_dotprod_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99)"
	.section	".note.GNU-stack","",@progbits
