# 2024-12-09 10:32:33
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fird_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fird_f32_arp4              # -- Begin function dsps_fird_f32_arp4
	.p2align	1
	.type	dsps_fird_f32_arp4,@function
dsps_fird_f32_arp4:                     # @dsps_fird_f32_arp4
# %bb.0:                                # %entry
	blez	a3, .LBB0_15
# %bb.1:                                # %for.cond1.preheader.lr.ph
	mv	t0, a3
	lw	a6, 16(a0)
	lw	t3, 8(a0)
	lw	t4, 12(a0)
	li	t1, 0
	slli	a7, a6, 2
	fmv.w.x	fa5, zero
	j	.LBB0_3
.LBB0_2:                                # %for.cond.cleanup26
                                        #   in Loop: Header=BB0_3 Depth=1
	addi	a3, t1, 1
	slli	t1, t1, 2
	add	t1, t1, a2
	fsw	fa4, 0(t1)
	mv	t1, a3
	beq	a3, t0, .LBB0_16
.LBB0_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_9 Depth 2
                                        #     Child Loop BB0_14 Depth 2
	blez	a6, .LBB0_7
# %bb.4:                                # %for.body4.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	t2, 4(a0)
	add	a4, a1, a7
.LBB0_5:                                # %for.body4
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa4, 0(a1)
	addi	a1, a1, 4
	addi	a5, t4, 1
	slli	t4, t4, 2
	add	t4, t4, t2
	fsw	fa4, 0(t4)
	slt	a3, a5, t3
	neg	a3, a3
	and	t4, a3, a5
	bne	a1, a4, .LBB0_5
# %bb.6:                                # %for.cond1.for.cond.cleanup3_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=1
	sw	t4, 12(a0)
.LBB0_7:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_3 Depth=1
	slli	t2, t4, 2
	fmv.s	fa4, fa5
	bge	t4, t3, .LBB0_10
# %bb.8:                                # %for.body14.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a4, 4(a0)
	lw	a3, 0(a0)
	sub	a5, t3, t4
	add	a4, a4, t2
	fmv.s	fa4, fa5
.LBB0_9:                                # %for.body14
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a3)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a4, a4, 4
	addi	a5, a5, -1
	addi	a3, a3, 4
	bnez	a5, .LBB0_9
.LBB0_10:                               # %for.cond23.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	blez	t4, .LBB0_2
# %bb.11:                               # %for.body27.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	mv	a4, t4
	blt	t3, t4, .LBB0_13
# %bb.12:                               # %for.body27.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	mv	a4, t3
.LBB0_13:                               # %for.body27.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a5, 0(a0)
	lw	a3, 4(a0)
	slli	a4, a4, 2
	sub	a4, a4, t2
	add	a4, a4, a5
	add	t2, t2, a3
.LBB0_14:                               # %for.body27
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a4)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, 4
	addi	a4, a4, 4
	bne	a3, t2, .LBB0_14
	j	.LBB0_2
.LBB0_15:
	li	t0, 0
.LBB0_16:                               # %for.cond.cleanup
	mv	a0, t0
	ret
.Lfunc_end0:
	.size	dsps_fird_f32_arp4, .Lfunc_end0-dsps_fird_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
