.option	arch, -zcb, +zcmp
# 2024-12-13 17:17:47
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspi_dotprod_s16_arp4.c"
	.option	push
	#.option	arch, -zcb, -zcmt
	.globl	dspi_dotprod_s16_arp4           # -- Begin function dspi_dotprod_s16_arp4
	.p2align	1
	.type	dspi_dotprod_s16_arp4,@function
dspi_dotprod_s16_arp4:                  # @dspi_dotprod_s16_arp4
# %bb.0:                                # %entry
	cm.push	{ra, s0-s11}, -64
	lw	s3, 4(a0)
	lw	t6, 12(a0)
	mul	s1, s3, a3
	lui	a6, 112
	addi	a6, a6, 3
	blt	t6, s1, .LBB0_20
# %bb.1:                                # %if.end
	lw	t3, 8(a0)
	lw	s1, 16(a0)
	mul	s0, t3, a4
	blt	s1, s0, .LBB0_20
# %bb.2:                                # %if.end4
	lw	s4, 4(a1)
	lw	t1, 12(a1)
	mul	s1, s4, a3
	lui	a6, 112
	addi	a6, a6, 3
	blt	t1, s1, .LBB0_20
# %bb.3:                                # %if.end10
	lw	t5, 8(a1)
	lw	s1, 16(a1)
	mul	s0, t5, a4
	blt	s1, s0, .LBB0_20
# %bb.4:                                # %if.end16
	blez	a4, .LBB0_15
# %bb.5:                                # %for.cond25.preheader.lr.ph
	li	a6, 0
	li	ra, 0
	li	s5, 0
	lw	a7, 0(a1)
	lw	t2, 0(a0)
	addi	t4, a3, -7
	andi	t0, a3, -8
	mul	t1, t5, t1
	slli	t1, t1, 1
	slli	t5, s4, 4
	mul	t3, t3, t6
	slli	t3, t3, 1
	slli	t6, s3, 4
	slli	s3, s3, 1
	slli	s4, s4, 1
	li	s2, 8
	j	.LBB0_8
.LBB0_6:                                #   in Loop: Header=BB0_8 Depth=1
	mv	s6, ra
.LBB0_7:                                # %for.cond.cleanup27
                                        #   in Loop: Header=BB0_8 Depth=1
	addi	a6, a6, 1
	add	a7, a7, t1
	add	t2, t2, t3
	mv	ra, s6
	beq	a6, a4, .LBB0_16
.LBB0_8:                                # %for.cond25.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #     Child Loop BB0_14 Depth 2
	blt	a3, s2, .LBB0_12
# %bb.9:                                # %for.body28.7.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	li	s6, 0
	mv	s7, t2
	mv	s8, a7
.LBB0_10:                               # %for.body28.7
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	s0, 0(s7)
	lh	a0, 0(s8)
	mul	a0, a0, s0
	srai	s9, a0, 31
	add	a0, a0, ra
	add	a1, s7, s3
	lh	s10, 0(a1)
	add	s0, s8, s4
	lh	s11, 0(s0)
	sltu	s1, a0, ra
	add	s5, s5, s9
	add	s5, s5, s1
	mul	s1, s11, s10
	srai	s9, s1, 31
	add	ra, a1, s3
	lh	s10, 0(ra)
	add	s0, s0, s4
	lh	s11, 0(s0)
	add	s5, s5, s9
	add	s1, s1, a0
	sltu	s9, s1, a0
	mul	a1, s11, s10
	srai	a0, a1, 31
	add	s9, s9, a0
	add	ra, ra, s3
	lh	s10, 0(ra)
	add	s0, s0, s4
	lh	a0, 0(s0)
	add	a1, a1, s1
	sltu	s11, a1, s1
	add	s5, s5, s9
	mul	s1, a0, s10
	srai	a0, s1, 31
	add	s11, s11, a0
	add	ra, ra, s3
	lh	s9, 0(ra)
	add	s0, s0, s4
	lh	a0, 0(s0)
	add	s1, s1, a1
	sltu	s10, s1, a1
	add	s5, s5, s11
	mul	a1, a0, s9
	srai	a0, a1, 31
	add	s10, s10, a0
	add	ra, ra, s3
	lh	s9, 0(ra)
	add	s0, s0, s4
	lh	a0, 0(s0)
	add	s5, s5, s10
	add	a1, a1, s1
	sltu	s10, a1, s1
	mul	s1, a0, s9
	srai	a0, s1, 31
	add	s10, s10, a0
	add	ra, ra, s3
	lh	s9, 0(ra)
	add	s0, s0, s4
	lh	a0, 0(s0)
	add	s5, s5, s10
	add	s1, s1, a1
	sltu	s10, s1, a1
	mul	a1, a0, s9
	srai	a0, a1, 31
	add	s10, s10, a0
	add	ra, ra, s3
	lh	a0, 0(ra)
	add	s0, s0, s4
	lh	s0, 0(s0)
	add	s5, s5, s10
	add	a1, a1, s1
	sltu	s1, a1, s1
	mul	a0, s0, a0
	srai	s0, a0, 31
	add	s0, s0, s1
	add	s0, s0, s5
	add	ra, a1, a0
	sltu	s5, ra, a1
	add	s5, s5, s0
	addi	s6, s6, 8
	add	s8, s8, t5
	add	s7, s7, t6
	blt	s6, t4, .LBB0_10
# %bb.11:                               #   in Loop: Header=BB0_8 Depth=1
	mv	a0, t0
	bge	t0, a3, .LBB0_6
	j	.LBB0_13
.LBB0_12:                               #   in Loop: Header=BB0_8 Depth=1
	li	a0, 0
	blez	a3, .LBB0_6
.LBB0_13:                               # %for.body28.clone.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	sub	a1, a3, a0
	mul	s0, s4, a0
	add	s0, s0, a7
	mul	a0, s3, a0
	add	a0, a0, t2
.LBB0_14:                               # %for.body28.clone
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	s6, 0(a0)
	lh	s1, 0(s0)
	mul	s6, s1, s6
	srai	s7, s6, 31
	add	s6, s6, ra
	sltu	s1, s6, ra
	add	s5, s5, s7
	add	s5, s5, s1
	addi	a1, a1, -1
	add	s0, s0, s4
	add	a0, a0, s3
	mv	ra, s6
	bnez	a1, .LBB0_14
	j	.LBB0_7
.LBB0_15:
	li	s6, 0
	li	s5, 0
.LBB0_16:                               # %for.cond.cleanup
	addi	a0, a5, -1
	li	a1, 1
	sll	a0, a1, a0
	srai	a1, a0, 31
	add	a0, a0, s6
	sltu	a3, a0, s6
	add	a1, a1, s5
	addi	a4, a5, -32
	add	a1, a1, a3
	bltz	a4, .LBB0_18
# %bb.17:                               # %for.cond.cleanup
	sra	a0, a1, a5
	j	.LBB0_19
.LBB0_18:
	slli	a1, a1, 1
	not	a3, a5
	sll	a1, a1, a3
	srl	a0, a0, a5
	or	a0, a0, a1
.LBB0_19:                               # %for.cond.cleanup
	li	a6, 0
	sh	a0, 0(a2)
.LBB0_20:                               # %return
	mv	a0, a6
	cm.popret	{ra, s0-s11}, 64
.Lfunc_end0:
	.size	dspi_dotprod_s16_arp4, .Lfunc_end0-dspi_dotprod_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
