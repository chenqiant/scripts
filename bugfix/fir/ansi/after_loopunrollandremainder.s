# 2024-11-04 11:08:53
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fir_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fir_f32_arp4               # -- Begin function dsps_fir_f32_arp4
	.p2align	1
	.type	dsps_fir_f32_arp4,@function
dsps_fir_f32_arp4:                      # @dsps_fir_f32_arp4
# %bb.0:                                # %entry
	blez	a3, .LBB0_11
# %bb.1:                                # %for.body.lr.ph
	lw	a6, 4(a0)
	lw	a7, 8(a0)
	lw	t3, 12(a0)
	li	t2, 0
	fmv.w.x	fa5, zero
	j	.LBB0_3
.LBB0_2:                                # %for.cond.cleanup21
                                        #   in Loop: Header=BB0_3 Depth=1
	add	t0, t0, a2
	addi	t2, t2, 1
	fsw	fa4, 0(t0)
	beq	t2, a3, .LBB0_11
.LBB0_3:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_10 Depth 2
	slli	t0, t2, 2
	add	a4, a1, t0
	flw	fa4, 0(a4)
	slli	a4, t3, 2
	add	a4, a4, a6
	fsw	fa4, 0(a4)
	addi	t3, t3, 1
	slt	a4, t3, a7
	neg	a4, a4
	and	t3, a4, t3
	sw	t3, 12(a0)
	slli	t1, t3, 2
	fmv.s	fa4, fa5
	bge	t3, a7, .LBB0_6
# %bb.4:                                # %for.body11.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	t4, 0(a0)
	sub	a4, a7, t3
	add	a5, a6, t1
	fmv.s	fa4, fa5
.LBB0_5:                                # %for.body11
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(t4)
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, 4
	addi	a4, a4, -1
	addi	t4, t4, 4
	bnez	a4, .LBB0_5
.LBB0_6:                                # %for.cond18.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	blez	t3, .LBB0_2
# %bb.7:                                # %for.body22.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	mv	a4, t3
	blt	a7, t3, .LBB0_9
# %bb.8:                                # %for.body22.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	mv	a4, a7
.LBB0_9:                                # %for.body22.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a5, 0(a0)
	slli	a4, a4, 2
	sub	a4, a4, t1
	add	a4, a4, a5
	add	t1, t1, a6
	mv	a5, a6
.LBB0_10:                               # %for.body22
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a4)
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, 4
	addi	a4, a4, 4
	bne	a5, t1, .LBB0_10
	j	.LBB0_2
.LBB0_11:                               # %for.cond.cleanup
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_fir_f32_arp4, .Lfunc_end0-dsps_fir_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333)"
	.section	".note.GNU-stack","",@progbits
