.option	arch, -zcb, +zcmp
# 2024-12-16 17:16:36
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
	addi	sp, sp, -112
	sw	ra, 108(sp)                     # 4-byte Folded Spill
	sw	s0, 104(sp)                     # 4-byte Folded Spill
	sw	s1, 100(sp)                     # 4-byte Folded Spill
	sw	s2, 96(sp)                      # 4-byte Folded Spill
	sw	s3, 92(sp)                      # 4-byte Folded Spill
	sw	s4, 88(sp)                      # 4-byte Folded Spill
	sw	s5, 84(sp)                      # 4-byte Folded Spill
	sw	s6, 80(sp)                      # 4-byte Folded Spill
	sw	s7, 76(sp)                      # 4-byte Folded Spill
	sw	s8, 72(sp)                      # 4-byte Folded Spill
	sw	s9, 68(sp)                      # 4-byte Folded Spill
	sw	s10, 64(sp)                     # 4-byte Folded Spill
	sw	s11, 60(sp)                     # 4-byte Folded Spill
	sw	a2, 12(sp)                      # 4-byte Folded Spill
	sw	a1, 8(sp)                       # 4-byte Folded Spill
	sw	a0, 16(sp)                      # 4-byte Folded Spill
	sw	a3, 20(sp)                      # 4-byte Folded Spill
	blez	a3, .LBB0_18
# %bb.1:                                # %for.cond1.preheader.lr.ph
	sw	zero, 28(sp)                    # 4-byte Folded Spill
	addi	a0, a6, -15
	sw	a0, 40(sp)                      # 4-byte Folded Spill
	lui	a0, 8
	addi	a0, a0, -1
	srl	t1, a0, a6
	andi	a0, a4, -8
	sw	a0, 32(sp)                      # 4-byte Folded Spill
	li	a7, 15
	sub	t4, a7, a6
	slli	t5, a5, 4
	lw	a1, 16(sp)                      # 4-byte Folded Reload
	addi	a0, a1, 8
	sw	a0, 56(sp)                      # 4-byte Folded Spill
	slli	a0, a4, 1
	slli	s10, a5, 1
	sw	a0, 24(sp)                      # 4-byte Folded Spill
	addi	a0, a0, -16
	andi	a0, a0, -16
	addi	a0, a0, 24
	sw	a0, 4(sp)                       # 4-byte Folded Spill
	li	t0, 8
	sw	a1, 52(sp)                      # 4-byte Folded Spill
	sw	a5, 44(sp)                      # 4-byte Folded Spill
	sw	a6, 36(sp)                      # 4-byte Folded Spill
	j	.LBB0_3
.LBB0_2:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a1, 28(sp)                      # 4-byte Folded Reload
	addi	a1, a1, 1
	lw	a0, 56(sp)                      # 4-byte Folded Reload
	lw	a2, 24(sp)                      # 4-byte Folded Reload
	add	a0, a0, a2
	sw	a0, 56(sp)                      # 4-byte Folded Spill
	lw	a0, 52(sp)                      # 4-byte Folded Reload
	add	a0, a0, a2
	sw	a0, 52(sp)                      # 4-byte Folded Spill
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	sw	a1, 28(sp)                      # 4-byte Folded Spill
	beq	a1, a0, .LBB0_18
.LBB0_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_8 Depth 3
                                        #       Child Loop BB0_13 Depth 3
	blez	a5, .LBB0_2
# %bb.4:                                # %for.body4.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	li	s6, 0
	lw	a0, 28(sp)                      # 4-byte Folded Reload
	lw	a1, 24(sp)                      # 4-byte Folded Reload
	mul	a1, a1, a0
	lw	a2, 4(sp)                       # 4-byte Folded Reload
	add	a1, a1, a2
	lw	s9, 16(sp)                      # 4-byte Folded Reload
	add	s9, s9, a1
	mul	a1, a0, a5
	slli	a1, a1, 1
	lw	a0, 12(sp)                      # 4-byte Folded Reload
	add	a3, a0, a1
	lw	s2, 8(sp)                       # 4-byte Folded Reload
	sw	a3, 48(sp)                      # 4-byte Folded Spill
	j	.LBB0_6
.LBB0_5:                                # %for.cond.cleanup8
                                        #   in Loop: Header=BB0_6 Depth=2
	slli	a0, s6, 1
	add	a0, a0, a3
	sh	s0, 0(a0)
	addi	s6, s6, 1
	addi	s2, s2, 2
	beq	s6, a5, .LBB0_2
.LBB0_6:                                # %for.body4
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_8 Depth 3
                                        #       Child Loop BB0_13 Depth 3
	li	s11, 0
	blt	a4, t0, .LBB0_11
# %bb.7:                                # %for.body9.7.preheader
                                        #   in Loop: Header=BB0_6 Depth=2
	lw	s0, 56(sp)                      # 4-byte Folded Reload
	mv	ra, s2
	mv	s7, t1
	mv	s1, t1
.LBB0_8:                                # %for.body9.7
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lh	s5, -8(s0)
	lh	s8, 0(ra)
	lh	a1, -6(s0)
	add	a3, ra, s10
	lh	a2, 0(a3)
	lh	a0, -4(s0)
	add	a3, a3, s10
	lh	a7, 0(a3)
	lh	t3, -2(s0)
	add	a3, a3, s10
	lh	t2, 0(a3)
	lh	s4, 0(s0)
	add	a3, a3, s10
	lh	t6, 0(a3)
	lh	s3, 2(s0)
	add	a3, a3, s10
	lh	t0, 0(a3)
	lh	a6, 4(s0)
	add	a3, a3, s10
	lh	a5, 0(a3)
	lh	t1, 6(s0)
	add	a3, a3, s10
	lh	a3, 0(a3)
	mul	s5, s8, s5
	mul	a1, a2, a1
	mul	a0, a7, a0
	mul	a2, t2, t3
	mul	a7, t6, s4
	mul	t0, t0, s3
	mul	t2, a5, a6
	mul	a6, a3, t1
	srai	a3, s5, 31
	srai	a5, a1, 31
	srai	t1, a0, 31
	srai	t3, a2, 31
	srai	t6, a7, 31
	srai	s3, t0, 31
	srai	s4, t2, 31
	srai	s8, a6, 31
	add	s5, s5, s1
	sltu	s1, s5, s1
	add	a3, a3, s11
	add	a3, a3, s1
	add	a1, a1, s5
	sltu	s1, a1, s5
	add	a3, a3, a5
	add	a0, a0, a1
	sltu	a1, a0, a1
	add	t1, t1, s1
	add	a3, a3, t1
	add	a1, a1, t3
	add	a1, a1, a3
	add	a2, a2, a0
	sltu	a0, a2, a0
	add	a0, a0, t6
	add	a0, a0, a1
	add	a7, a7, a2
	sltu	a1, a7, a2
	add	a1, a1, s3
	add	a0, a0, a1
	add	t0, t0, a7
	sltu	a1, t0, a7
	add	a1, a1, s4
	add	a0, a0, a1
	add	t2, t2, t0
	sltu	a1, t2, t0
	add	a1, a1, s8
	add	a0, a0, a1
	add	s1, t2, a6
	sltu	s11, s1, t2
	add	s11, s11, a0
	addi	s0, s0, 16
	add	ra, ra, t5
	bne	s0, s9, .LBB0_8
# %bb.9:                                #   in Loop: Header=BB0_6 Depth=2
	lw	a2, 32(sp)                      # 4-byte Folded Reload
	lw	a6, 36(sp)                      # 4-byte Folded Reload
	lw	a5, 44(sp)                      # 4-byte Folded Reload
	mv	t1, s7
	li	a7, 15
	li	t0, 8
	lw	a3, 48(sp)                      # 4-byte Folded Reload
	blt	a2, a4, .LBB0_12
.LBB0_10:                               #   in Loop: Header=BB0_6 Depth=2
	mv	ra, s1
	j	.LBB0_14
.LBB0_11:                               #   in Loop: Header=BB0_6 Depth=2
	li	a2, 0
	mv	s1, t1
	blez	a4, .LBB0_10
.LBB0_12:                               # %for.body9.clone.preheader
                                        #   in Loop: Header=BB0_6 Depth=2
	sub	s0, a4, a2
	mul	s8, s10, a2
	add	s8, s8, s2
	slli	a2, a2, 1
	lw	s5, 52(sp)                      # 4-byte Folded Reload
	add	s5, s5, a2
.LBB0_13:                               # %for.body9.clone
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lh	a0, 0(s5)
	lh	a1, 0(s8)
	mul	ra, a1, a0
	srai	a0, ra, 31
	add	ra, ra, s1
	sltu	a1, ra, s1
	add	a0, a0, s11
	add	s11, a0, a1
	addi	s0, s0, -1
	add	s8, s8, s10
	addi	s5, s5, 2
	mv	s1, ra
	bnez	s0, .LBB0_13
.LBB0_14:                               # %for.cond.cleanup8
                                        #   in Loop: Header=BB0_6 Depth=2
	addi	a0, t4, -32
	bltz	a0, .LBB0_16
# %bb.15:                               # %for.cond.cleanup8
                                        #   in Loop: Header=BB0_6 Depth=2
	sra	s0, s11, t4
	bge	a7, a6, .LBB0_5
	j	.LBB0_17
.LBB0_16:                               #   in Loop: Header=BB0_6 Depth=2
	srl	a0, ra, t4
	not	a1, t4
	slli	s11, s11, 1
	sll	s0, s11, a1
	or	s0, s0, a0
	bge	a7, a6, .LBB0_5
.LBB0_17:                               #   in Loop: Header=BB0_6 Depth=2
	lw	a1, 40(sp)                      # 4-byte Folded Reload
	sll	a0, ra, a1
	addi	a1, a1, -32
	srai	a1, a1, 31
	and	s0, a1, a0
	j	.LBB0_5
.LBB0_18:                               # %for.cond.cleanup
	li	a0, 0
	lw	ra, 108(sp)                     # 4-byte Folded Reload
	lw	s0, 104(sp)                     # 4-byte Folded Reload
	lw	s1, 100(sp)                     # 4-byte Folded Reload
	lw	s2, 96(sp)                      # 4-byte Folded Reload
	lw	s3, 92(sp)                      # 4-byte Folded Reload
	lw	s4, 88(sp)                      # 4-byte Folded Reload
	lw	s5, 84(sp)                      # 4-byte Folded Reload
	lw	s6, 80(sp)                      # 4-byte Folded Reload
	lw	s7, 76(sp)                      # 4-byte Folded Reload
	lw	s8, 72(sp)                      # 4-byte Folded Reload
	lw	s9, 68(sp)                      # 4-byte Folded Reload
	lw	s10, 64(sp)                     # 4-byte Folded Reload
	lw	s11, 60(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 112
	ret
.Lfunc_end0:
	.size	dspm_mult_s16_arp4, .Lfunc_end0-dspm_mult_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
