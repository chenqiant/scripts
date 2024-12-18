.option	arch, -zcb, +zcmp
# 2024-12-18 15:24:57
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspm_addc_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dspm_addc_f32_arp4              # -- Begin function dspm_addc_f32_arp4
	.p2align	1
	.type	dspm_addc_f32_arp4,@function
dspm_addc_f32_arp4:                     # @dspm_addc_f32_arp4
# %bb.0:                                # %entry
	lui	t0, 112
	addi	t0, t0, 3
	blez	a7, .LBB0_17
# %bb.1:                                # %entry
	blez	a6, .LBB0_17
# %bb.2:                                # %entry
	beqz	a0, .LBB0_17
# %bb.3:                                # %entry
	beqz	a1, .LBB0_17
# %bb.4:                                # %entry
	blez	a2, .LBB0_17
# %bb.5:                                # %entry
	blez	a3, .LBB0_17
# %bb.6:                                # %entry
	addi	sp, sp, -16
	sw	s0, 12(sp)                      # 4-byte Folded Spill
	sw	s1, 8(sp)                       # 4-byte Folded Spill
	or	s0, a5, a4
	bltz	s0, .LBB0_16
# %bb.7:                                # %if.end21
	li	t0, 0
	add	a4, a4, a3
	add	a5, a5, a3
	addi	t3, a3, -7
	slli	t1, a5, 2
	slli	t5, a7, 5
	slli	t2, a4, 2
	slli	t6, a6, 5
	slli	a6, a6, 2
	slli	a7, a7, 2
	li	t4, 8
	j	.LBB0_9
.LBB0_8:                                # %for.cond.cleanup26
                                        #   in Loop: Header=BB0_9 Depth=1
	addi	t0, t0, 1
	add	a1, a1, t1
	add	a0, a0, t2
	beq	t0, a2, .LBB0_15
.LBB0_9:                                # %for.body27.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_11 Depth 2
                                        #     Child Loop BB0_14 Depth 2
	li	a5, 0
	bltu	a3, t4, .LBB0_12
# %bb.10:                               # %for.body27.7.preheader
                                        #   in Loop: Header=BB0_9 Depth=1
	mv	a4, a0
	mv	s0, a1
.LBB0_11:                               # %for.body27.7
                                        #   Parent Loop BB0_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa5, 0(a4)
	add	s1, a4, a6
	flw	fa4, 0(s1)
	add	s1, s1, a6
	flw	fa3, 0(s1)
	add	s1, s1, a6
	flw	fa2, 0(s1)
	add	s1, s1, a6
	flw	fa1, 0(s1)
	add	s1, s1, a6
	flw	ft0, 0(s1)
	add	s1, s1, a6
	flw	ft1, 0(s1)
	add	s1, s1, a6
	flw	ft2, 0(s1)
	fadd.s	fa5, fa5, fa0
	fadd.s	fa4, fa4, fa0
	fadd.s	fa3, fa3, fa0
	fadd.s	fa2, fa2, fa0
	fadd.s	fa1, fa1, fa0
	fadd.s	ft0, ft0, fa0
	fadd.s	ft1, ft1, fa0
	fadd.s	ft2, ft2, fa0
	fsw	fa5, 0(s0)
	add	s1, s0, a7
	fsw	fa4, 0(s1)
	add	s1, s1, a7
	fsw	fa3, 0(s1)
	add	s1, s1, a7
	fsw	fa2, 0(s1)
	add	s1, s1, a7
	fsw	fa1, 0(s1)
	add	s1, s1, a7
	fsw	ft0, 0(s1)
	add	s1, s1, a7
	fsw	ft1, 0(s1)
	add	s1, s1, a7
	fsw	ft2, 0(s1)
	addi	a5, a5, 8
	add	s0, s0, t5
	add	a4, a4, t6
	blt	a5, t3, .LBB0_11
.LBB0_12:                               # %forCond113Preheader
                                        #   in Loop: Header=BB0_9 Depth=1
	bge	a5, a3, .LBB0_8
# %bb.13:                               # %for.body27.clone.preheader
                                        #   in Loop: Header=BB0_9 Depth=1
	sub	a4, a3, a5
	mul	s0, a7, a5
	add	s0, s0, a1
	mul	a5, a6, a5
	add	a5, a5, a0
.LBB0_14:                               # %for.body27.clone
                                        #   Parent Loop BB0_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa5, 0(a5)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 0(s0)
	addi	a4, a4, -1
	add	s0, s0, a7
	add	a5, a5, a6
	bnez	a4, .LBB0_14
	j	.LBB0_8
.LBB0_15:
	li	t0, 0
.LBB0_16:
	lw	s0, 12(sp)                      # 4-byte Folded Reload
	lw	s1, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
.LBB0_17:                               # %return
	mv	a0, t0
	ret
.Lfunc_end0:
	.size	dspm_addc_f32_arp4, .Lfunc_end0-dspm_addc_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
