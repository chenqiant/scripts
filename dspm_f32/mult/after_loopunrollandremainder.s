.option	arch, -zcb, +zcmp
# 2024-12-18 18:44:05
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspm_mult_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dspm_mult_f32_arp4              # -- Begin function dspm_mult_f32_arp4
	.p2align	1
	.type	dspm_mult_f32_arp4,@function
dspm_mult_f32_arp4:                     # @dspm_mult_f32_arp4
# %bb.0:                                # %entry
	blez	a3, .LBB0_14
# %bb.1:                                # %for.cond1.preheader.lr.ph
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
	sw	s9, 8(sp)                       # 4-byte Folded Spill
	li	a6, 0
	addi	a7, a4, -7
	slli	t0, a5, 2
	add	t1, a1, t0
	slli	t2, a5, 5
	addi	t3, a0, 16
	slli	t4, a4, 2
	li	t5, 9
	mv	t6, a0
	j	.LBB0_3
.LBB0_2:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_3 Depth=1
	addi	a6, a6, 1
	add	t3, t3, t4
	add	t6, t6, t4
	beq	a6, a3, .LBB0_13
.LBB0_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_8 Depth 3
                                        #       Child Loop BB0_12 Depth 3
	blez	a5, .LBB0_2
# %bb.4:                                # %for.body4.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	li	s6, 0
	mul	s0, a6, a4
	slli	s0, s0, 2
	add	s2, a0, s0
	mul	s0, a6, a5
	slli	s0, s0, 2
	add	s3, a2, s0
	mv	s4, a1
	mv	s5, t1
	j	.LBB0_6
.LBB0_5:                                # %for.cond.cleanup11
                                        #   in Loop: Header=BB0_6 Depth=2
	addi	s6, s6, 1
	addi	s5, s5, 4
	addi	s4, s4, 4
	beq	s6, a5, .LBB0_2
.LBB0_6:                                # %for.body4
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_8 Depth 3
                                        #       Child Loop BB0_12 Depth 3
	flw	fa5, 0(s2)
	slli	s7, s6, 2
	add	s0, a1, s7
	flw	fa4, 0(s0)
	fmul.s	fa5, fa5, fa4
	add	s7, s7, s3
	fsw	fa5, 0(s7)
	li	s0, 1
	blt	a4, t5, .LBB0_10
# %bb.7:                                # %for.body12.7.preheader
                                        #   in Loop: Header=BB0_6 Depth=2
	li	s8, 0
	mv	s0, t3
	mv	s9, s5
.LBB0_8:                                # %for.body12.7
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	flw	fa4, -12(s0)
	flw	fa3, 0(s9)
	flw	fa2, -8(s0)
	add	s1, s9, t0
	flw	fa1, 0(s1)
	flw	fa0, -4(s0)
	add	s1, s1, t0
	flw	ft0, 0(s1)
	flw	ft1, 0(s0)
	add	s1, s1, t0
	flw	ft2, 0(s1)
	flw	ft3, 4(s0)
	add	s1, s1, t0
	flw	ft4, 0(s1)
	flw	ft5, 8(s0)
	add	s1, s1, t0
	flw	ft6, 0(s1)
	flw	ft7, 12(s0)
	add	s1, s1, t0
	flw	fa6, 0(s1)
	flw	fa7, 16(s0)
	add	s1, s1, t0
	flw	ft8, 0(s1)
	fmadd.s	fa5, fa4, fa3, fa5
	fmadd.s	fa5, fa2, fa1, fa5
	fmadd.s	fa5, fa0, ft0, fa5
	fmadd.s	fa5, ft1, ft2, fa5
	fmadd.s	fa5, ft3, ft4, fa5
	fmadd.s	fa5, ft5, ft6, fa5
	fmadd.s	fa5, ft7, fa6, fa5
	fmadd.s	fa5, fa7, ft8, fa5
	fsw	fa5, 0(s7)
	addi	s1, s8, 9
	addi	s8, s8, 8
	add	s9, s9, t2
	addi	s0, s0, 32
	blt	s1, a7, .LBB0_8
# %bb.9:                                # %for.cond110.preheader.loopexit
                                        #   in Loop: Header=BB0_6 Depth=2
	addi	s0, s8, 1
.LBB0_10:                               # %for.cond110.preheader
                                        #   in Loop: Header=BB0_6 Depth=2
	bge	s0, a4, .LBB0_5
# %bb.11:                               # %for.body12.clone.preheader
                                        #   in Loop: Header=BB0_6 Depth=2
	sub	s8, a4, s0
	mul	s1, t0, s0
	add	s1, s1, s4
	slli	s0, s0, 2
	add	s0, s0, t6
.LBB0_12:                               # %for.body12.clone
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	flw	fa4, 0(s0)
	flw	fa3, 0(s1)
	fmadd.s	fa5, fa4, fa3, fa5
	fsw	fa5, 0(s7)
	addi	s8, s8, -1
	add	s1, s1, t0
	addi	s0, s0, 4
	bnez	s8, .LBB0_12
	j	.LBB0_5
.LBB0_13:
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	lw	s5, 24(sp)                      # 4-byte Folded Reload
	lw	s6, 20(sp)                      # 4-byte Folded Reload
	lw	s7, 16(sp)                      # 4-byte Folded Reload
	lw	s8, 12(sp)                      # 4-byte Folded Reload
	lw	s9, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 48
.LBB0_14:                               # %for.cond.cleanup
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dspm_mult_f32_arp4, .Lfunc_end0-dspm_mult_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
