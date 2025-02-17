# 2024-12-09 10:32:32
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_conv_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_conv_f32_arp4              # -- Begin function dsps_conv_f32_arp4
	.p2align	1
	.type	dsps_conv_f32_arp4,@function
dsps_conv_f32_arp4:                     # @dsps_conv_f32_arp4
# %bb.0:                                # %entry
	lui	a5, 112
	addi	a5, a5, 3
	beqz	a0, .LBB0_23
# %bb.1:                                # %entry
	beqz	a2, .LBB0_23
# %bb.2:                                # %entry
	beqz	a4, .LBB0_23
# %bb.3:                                # %if.end6
	bge	a1, a3, .LBB0_5
# %bb.4:                                # %if.then8
	mv	a6, a1
	mv	t1, a3
	mv	a7, a0
	bgtz	a1, .LBB0_6
	j	.LBB0_10
.LBB0_5:
	mv	a6, a3
	mv	t1, a1
	mv	a7, a2
	mv	a2, a0
	blez	a3, .LBB0_10
.LBB0_6:                                # %for.body.preheader
	li	t2, 0
	fmv.w.x	fa5, zero
	mv	t0, a7
.LBB0_7:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
	slli	t4, t2, 2
	add	t3, t4, a2
	addi	t3, t3, 4
	add	t4, t4, a4
	sw	zero, 0(t4)
	mv	a5, a2
	mv	a0, t0
	fmv.s	fa4, fa5
.LBB0_8:                                # %for.body13
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a5)
	flw	fa2, 0(a0)
	fmadd.s	fa4, fa3, fa2, fa4
	fsw	fa4, 0(t4)
	addi	a5, a5, 4
	addi	a0, a0, -4
	bne	a5, t3, .LBB0_8
# %bb.9:                                # %for.end
                                        #   in Loop: Header=BB0_7 Depth=1
	addi	t2, t2, 1
	addi	t0, t0, 4
	bne	t2, a6, .LBB0_7
.LBB0_10:                               # %for.cond21.preheader
	bge	a6, t1, .LBB0_16
# %bb.11:                               # %for.body24.preheader
	slli	a0, a6, 2
	add	a0, a0, a7
	addi	t0, a0, -4
	addi	t2, a2, 4
	fmv.w.x	fa5, zero
	mv	t4, a6
	j	.LBB0_13
.LBB0_12:                               # %for.end37
                                        #   in Loop: Header=BB0_13 Depth=1
	addi	t4, t4, 1
	addi	t2, t2, 4
	beq	t4, t1, .LBB0_16
.LBB0_13:                               # %for.body24
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
	slli	t3, t4, 2
	add	t3, t3, a4
	sub	t5, t4, a6
	addi	t5, t5, 1
	sw	zero, 0(t3)
	bltu	t4, t5, .LBB0_12
# %bb.14:                               # %for.body30.preheader
                                        #   in Loop: Header=BB0_13 Depth=1
	mv	a5, t2
	mv	a0, t0
	fmv.s	fa4, fa5
.LBB0_15:                               # %for.body30
                                        #   Parent Loop BB0_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a5)
	flw	fa2, 0(a0)
	fmadd.s	fa4, fa3, fa2, fa4
	fsw	fa4, 0(t3)
	addi	t5, t5, 1
	addi	a0, a0, -4
	addi	a5, a5, 4
	bgeu	t4, t5, .LBB0_15
	j	.LBB0_12
.LBB0_16:                               # %for.cond42.preheader
	add	a1, a1, a3
	addi	t0, a1, -1
	bge	t1, t0, .LBB0_22
# %bb.17:                               # %for.body47.lr.ph
	fmv.w.x	fa5, zero
	addi	a1, t1, -1
	slli	a0, a6, 2
	add	a7, a7, a0
	addi	a7, a7, -4
	slli	a3, t1, 2
	sub	a3, a3, a0
	add	a2, a2, a3
	addi	t2, a2, 4
	j	.LBB0_19
.LBB0_18:                               # %for.end64
                                        #   in Loop: Header=BB0_19 Depth=1
	addi	t1, t1, 1
	addi	t2, t2, 4
	beq	t1, t0, .LBB0_22
.LBB0_19:                               # %for.body47
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_21 Depth 2
	slli	a5, t1, 2
	add	a5, a5, a4
	sub	a3, t1, a6
	addi	a3, a3, 1
	sw	zero, 0(a5)
	bltu	a1, a3, .LBB0_18
# %bb.20:                               # %for.body57.preheader
                                        #   in Loop: Header=BB0_19 Depth=1
	mv	a2, t2
	mv	a0, a7
	fmv.s	fa4, fa5
.LBB0_21:                               # %for.body57
                                        #   Parent Loop BB0_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a2)
	flw	fa2, 0(a0)
	fmadd.s	fa4, fa3, fa2, fa4
	fsw	fa4, 0(a5)
	addi	a3, a3, 1
	addi	a0, a0, -4
	addi	a2, a2, 4
	bgeu	a1, a3, .LBB0_21
	j	.LBB0_18
.LBB0_22:
	li	a5, 0
.LBB0_23:                               # %return
	mv	a0, a5
	ret
.Lfunc_end0:
	.size	dsps_conv_f32_arp4, .Lfunc_end0-dsps_conv_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
