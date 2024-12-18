.option	arch, -zcb, +zcmp
# 2024-12-18 09:54:24
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspm_add_f32_best.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dspm_add_f32_arp4               # -- Begin function dspm_add_f32_arp4
	.p2align	1
	.type	dspm_add_f32_arp4,@function
dspm_add_f32_arp4:                      # @dspm_add_f32_arp4
# %bb.0:                                # %entry
	addi	sp, sp, -48
	sw	s0, 44(sp)                      # 4-byte Folded Spill
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	sw	s2, 36(sp)                      # 4-byte Folded Spill
	sw	s3, 32(sp)                      # 4-byte Folded Spill
	sw	s4, 28(sp)                      # 4-byte Folded Spill
	sw	s5, 24(sp)                      # 4-byte Folded Spill
	sw	s6, 20(sp)                      # 4-byte Folded Spill
	sw	s7, 16(sp)                      # 4-byte Folded Spill
	sw	s8, 12(sp)                      # 4-byte Folded Spill
	lw	s0, 56(sp)
	lui	t0, 112
	addi	t0, t0, 3
	blez	s0, .LBB0_19
# %bb.1:                                # %entry
	lw	s6, 52(sp)
	blez	s6, .LBB0_19
# %bb.2:                                # %entry
	lw	t6, 48(sp)
	blez	t6, .LBB0_19
# %bb.3:                                # %entry
	beqz	a0, .LBB0_19
# %bb.4:                                # %entry
	beqz	a1, .LBB0_19
# %bb.5:                                # %entry
	beqz	a2, .LBB0_19
# %bb.6:                                # %entry
	blez	a3, .LBB0_19
# %bb.7:                                # %entry
	blez	a4, .LBB0_19
# %bb.8:                                # %entry
	or	s1, a6, a5
	or	s1, s1, a7
	bltz	s1, .LBB0_19
# %bb.9:                                # %if.end30
	blez	a3, .LBB0_18
# %bb.10:                               # %for.cond34.preheader.lr.ph
	li	t0, 0
	add	a5, a5, a4
	add	t1, a6, a4
	add	a6, a7, a4
	addi	a7, a4, -15
	slli	a6, a6, 2
	slli	t2, s0, 6
	slli	t1, t1, 2
	slli	t4, s6, 6
	slli	t3, a5, 2
	slli	t5, t6, 6
	slli	t6, t6, 2
	slli	s6, s6, 2
	slli	s7, s0, 2
	li	s2, 16
	j	.LBB0_12
.LBB0_11:                               # %for.end204
                                        #   in Loop: Header=BB0_12 Depth=1
	addi	t0, t0, 1
	add	a2, a2, a6
	add	a1, a1, t1
	add	a0, a0, t3
	beq	t0, a3, .LBB0_18
.LBB0_12:                               # %for.cond34.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_14 Depth 2
                                        #     Child Loop BB0_17 Depth 2
	li	s3, 0
	bltu	a4, s2, .LBB0_15
# %bb.13:                               # %for.body36.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	mv	s4, a0
	mv	s5, a1
	mv	s8, a2
.LBB0_14:                               # %for.body36
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa5, 0(s4)
	flw	fa4, 0(s5)
	fadd.s	fa5, fa5, fa4
	fsw	fa5, 0(s8)
	add	a5, s4, t6
	flw	fa5, 0(a5)
	add	s0, s5, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s8, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	add	a5, a5, t6
	flw	fa5, 0(a5)
	add	s0, s0, s6
	flw	fa4, 0(s0)
	fadd.s	fa5, fa5, fa4
	add	s1, s1, s7
	fsw	fa5, 0(s1)
	addi	s3, s3, 16
	add	s8, s8, t2
	add	s5, s5, t4
	add	s4, s4, t5
	blt	s3, a7, .LBB0_14
.LBB0_15:                               # %for.cond193.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	bge	s3, a4, .LBB0_11
# %bb.16:                               # %for.body195.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	sub	s4, a4, s3
	mul	s0, s7, s3
	add	s0, s0, a2
	mul	a5, s6, s3
	add	a5, a5, a1
	mul	s1, t6, s3
	add	s1, s1, a0
.LBB0_17:                               # %for.body195
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa5, 0(s1)
	flw	fa4, 0(a5)
	fadd.s	fa5, fa5, fa4
	fsw	fa5, 0(s0)
	addi	s4, s4, -1
	add	s0, s0, s7
	add	a5, a5, s6
	add	s1, s1, t6
	bnez	s4, .LBB0_17
	j	.LBB0_11
.LBB0_18:
	li	t0, 0
.LBB0_19:                               # %return
	mv	a0, t0
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	lw	s5, 24(sp)                      # 4-byte Folded Reload
	lw	s6, 20(sp)                      # 4-byte Folded Reload
	lw	s7, 16(sp)                      # 4-byte Folded Reload
	lw	s8, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	dspm_add_f32_arp4, .Lfunc_end0-dspm_add_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
