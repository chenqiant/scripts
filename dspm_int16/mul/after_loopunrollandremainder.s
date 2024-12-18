.option	arch, -zcb, +zcmp
# 2024-12-18 17:25:40
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspm_mult_s16_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dspm_mult_s16_arp4              # -- Begin function dspm_mult_s16_arp4
	.p2align	1
	.type	dspm_mult_s16_arp4,@function
dspm_mult_s16_arp4:                     # @dspm_mult_s16_arp4
# %bb.0:                                # %entry
	addi	sp, sp, -80
	sw	ra, 76(sp)                      # 4-byte Folded Spill
	sw	s0, 72(sp)                      # 4-byte Folded Spill
	sw	s1, 68(sp)                      # 4-byte Folded Spill
	sw	s2, 64(sp)                      # 4-byte Folded Spill
	sw	s3, 60(sp)                      # 4-byte Folded Spill
	sw	s4, 56(sp)                      # 4-byte Folded Spill
	sw	s5, 52(sp)                      # 4-byte Folded Spill
	sw	s6, 48(sp)                      # 4-byte Folded Spill
	sw	s7, 44(sp)                      # 4-byte Folded Spill
	sw	s8, 40(sp)                      # 4-byte Folded Spill
	sw	s9, 36(sp)                      # 4-byte Folded Spill
	sw	s10, 32(sp)                     # 4-byte Folded Spill
	sw	s11, 28(sp)                     # 4-byte Folded Spill
	sw	a2, 16(sp)                      # 4-byte Folded Spill
	sw	a1, 12(sp)                      # 4-byte Folded Spill
	sw	a3, 24(sp)                      # 4-byte Folded Spill
	blez	a3, .LBB0_18
# %bb.1:                                # %for.cond1.preheader.lr.ph
	li	a7, 0
	addi	t0, a6, -15
	lui	s1, 8
	addi	s1, s1, -1
	srl	t1, s1, a6
	addi	t2, a4, -7
	andi	t3, a4, -8
	li	t4, 15
	sub	t5, t4, a6
	slli	t6, a5, 4
	addi	s4, a0, 8
	slli	a1, a4, 1
	sw	a1, 20(sp)                      # 4-byte Folded Spill
	slli	s8, a5, 1
	li	s3, 8
	j	.LBB0_3
.LBB0_2:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_3 Depth=1
	addi	a7, a7, 1
	lw	a1, 20(sp)                      # 4-byte Folded Reload
	add	s4, s4, a1
	add	a0, a0, a1
	lw	a1, 24(sp)                      # 4-byte Folded Reload
	beq	a7, a1, .LBB0_18
.LBB0_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_8 Depth 3
                                        #       Child Loop BB0_13 Depth 3
	blez	a5, .LBB0_2
# %bb.4:                                # %for.body4.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	li	s7, 0
	mul	s0, a7, a5
	slli	s0, s0, 1
	lw	s5, 16(sp)                      # 4-byte Folded Reload
	add	s5, s5, s0
	lw	s6, 12(sp)                      # 4-byte Folded Reload
	j	.LBB0_6
.LBB0_5:                                # %for.cond.cleanup8
                                        #   in Loop: Header=BB0_6 Depth=2
	slli	a1, s7, 1
	add	a1, a1, s5
	sh	s0, 0(a1)
	addi	s7, s7, 1
	addi	s6, s6, 2
	beq	s7, a5, .LBB0_2
.LBB0_6:                                # %for.body4
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_8 Depth 3
                                        #       Child Loop BB0_13 Depth 3
	blt	a4, s3, .LBB0_11
# %bb.7:                                # %for.body9.7.preheader
                                        #   in Loop: Header=BB0_6 Depth=2
	li	s9, 0
	li	s11, 0
	mv	s1, s4
	mv	s10, s6
	mv	ra, t1
.LBB0_8:                                # %for.body9.7
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lh	s0, -8(s1)
	lh	s2, 0(s10)
	mul	s0, s2, s0
	srai	s2, s0, 31
	add	s0, s0, ra
	lh	a1, -6(s1)
	add	a3, s10, s8
	lh	a2, 0(a3)
	sltu	ra, s0, ra
	add	s2, s2, s11
	add	s2, s2, ra
	mul	a1, a2, a1
	srai	s11, a1, 31
	lh	ra, -4(s1)
	add	a3, a3, s8
	lh	a2, 0(a3)
	add	a1, a1, s0
	sltu	s0, a1, s0
	add	s2, s2, s11
	mul	s11, a2, ra
	srai	a2, s11, 31
	add	ra, s0, a2
	lh	s0, -2(s1)
	add	a3, a3, s8
	lh	a2, 0(a3)
	add	s11, s11, a1
	sltu	a1, s11, a1
	add	s2, s2, ra
	mul	a2, a2, s0
	srai	s0, a2, 31
	add	ra, a1, s0
	lh	s0, 0(s1)
	add	a3, a3, s8
	lh	a1, 0(a3)
	add	s2, s2, ra
	add	a2, a2, s11
	sltu	s11, a2, s11
	mul	a1, a1, s0
	srai	s0, a1, 31
	add	s11, s11, s0
	lh	ra, 2(s1)
	add	a3, a3, s8
	lh	s0, 0(a3)
	add	s2, s2, s11
	add	a1, a1, a2
	sltu	s11, a1, a2
	mul	a2, s0, ra
	srai	s0, a2, 31
	add	s11, s11, s0
	lh	ra, 4(s1)
	add	a3, a3, s8
	lh	s0, 0(a3)
	add	s2, s2, s11
	add	a2, a2, a1
	sltu	s11, a2, a1
	mul	a1, s0, ra
	srai	s0, a1, 31
	add	s11, s11, s0
	lh	s0, 6(s1)
	add	a3, a3, s8
	lh	a3, 0(a3)
	add	s2, s2, s11
	add	a1, a1, a2
	sltu	a2, a1, a2
	mul	ra, a3, s0
	srai	a3, ra, 31
	add	a2, a2, a3
	add	a2, a2, s2
	add	ra, ra, a1
	sltu	s11, ra, a1
	add	s11, s11, a2
	addi	s9, s9, 8
	add	s10, s10, t6
	addi	s1, s1, 16
	blt	s9, t2, .LBB0_8
# %bb.9:                                #   in Loop: Header=BB0_6 Depth=2
	mv	s0, t3
	blt	t3, a4, .LBB0_12
.LBB0_10:                               #   in Loop: Header=BB0_6 Depth=2
	mv	s9, ra
	j	.LBB0_14
.LBB0_11:                               #   in Loop: Header=BB0_6 Depth=2
	li	s11, 0
	li	s0, 0
	mv	ra, t1
	blez	a4, .LBB0_10
.LBB0_12:                               # %for.body9.clone.preheader
                                        #   in Loop: Header=BB0_6 Depth=2
	sub	s10, a4, s0
	mul	s1, s8, s0
	add	s1, s1, s6
	slli	s0, s0, 1
	add	s0, s0, a0
.LBB0_13:                               # %for.body9.clone
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lh	a1, 0(s0)
	lh	a2, 0(s1)
	mul	s9, a2, a1
	srai	a1, s9, 31
	add	s9, s9, ra
	sltu	a2, s9, ra
	add	a1, a1, s11
	add	s11, a1, a2
	addi	s10, s10, -1
	add	s1, s1, s8
	addi	s0, s0, 2
	mv	ra, s9
	bnez	s10, .LBB0_13
.LBB0_14:                               # %for.cond.cleanup8
                                        #   in Loop: Header=BB0_6 Depth=2
	addi	a1, t5, -32
	bltz	a1, .LBB0_16
# %bb.15:                               # %for.cond.cleanup8
                                        #   in Loop: Header=BB0_6 Depth=2
	sra	s0, s11, t5
	bge	t4, a6, .LBB0_5
	j	.LBB0_17
.LBB0_16:                               #   in Loop: Header=BB0_6 Depth=2
	srl	a1, s9, t5
	not	a2, t5
	slli	s11, s11, 1
	sll	s0, s11, a2
	or	s0, s0, a1
	bge	t4, a6, .LBB0_5
.LBB0_17:                               #   in Loop: Header=BB0_6 Depth=2
	sll	a1, s9, t0
	addi	a2, t0, -32
	srai	a2, a2, 31
	and	s0, a2, a1
	j	.LBB0_5
.LBB0_18:                               # %for.cond.cleanup
	li	a0, 0
	lw	ra, 76(sp)                      # 4-byte Folded Reload
	lw	s0, 72(sp)                      # 4-byte Folded Reload
	lw	s1, 68(sp)                      # 4-byte Folded Reload
	lw	s2, 64(sp)                      # 4-byte Folded Reload
	lw	s3, 60(sp)                      # 4-byte Folded Reload
	lw	s4, 56(sp)                      # 4-byte Folded Reload
	lw	s5, 52(sp)                      # 4-byte Folded Reload
	lw	s6, 48(sp)                      # 4-byte Folded Reload
	lw	s7, 44(sp)                      # 4-byte Folded Reload
	lw	s8, 40(sp)                      # 4-byte Folded Reload
	lw	s9, 36(sp)                      # 4-byte Folded Reload
	lw	s10, 32(sp)                     # 4-byte Folded Reload
	lw	s11, 28(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	dspm_mult_s16_arp4, .Lfunc_end0-dspm_mult_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
