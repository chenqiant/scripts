.option	arch, -zcb, +zcmp
# 2024-12-16 10:37:00
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspi_dotprod_off_s8_arp4.c"
	.option	push
	#.option	arch, -zcb, -zcmt
	.globl	dspi_dotprod_off_s8_arp4        # -- Begin function dspi_dotprod_off_s8_arp4
	.p2align	1
	.type	dspi_dotprod_off_s8_arp4,@function
dspi_dotprod_off_s8_arp4:               # @dspi_dotprod_off_s8_arp4
# %bb.0:                                # %entry
	cm.push	{ra, s0-s11}, -64
	lw	t0, 4(a0)
	lw	t5, 12(a0)
	mul	s1, t0, a3
	lui	a7, 112
	addi	a7, a7, 3
	blt	t5, s1, .LBB0_16
# %bb.1:                                # %if.end
	lw	t2, 8(a0)
	lw	s1, 16(a0)
	mul	s0, t2, a4
	blt	s1, s0, .LBB0_16
# %bb.2:                                # %if.end4
	lw	t1, 4(a1)
	lw	t3, 12(a1)
	mul	s1, t1, a3
	lui	a7, 112
	addi	a7, a7, 3
	blt	t3, s1, .LBB0_16
# %bb.3:                                # %if.end10
	lw	t4, 8(a1)
	lw	s1, 16(a1)
	mul	s0, t4, a4
	blt	s1, s0, .LBB0_16
# %bb.4:                                # %if.end16
	blez	a4, .LBB0_14
# %bb.5:                                # %for.cond25.preheader.lr.ph
	li	a7, 0
	li	s8, 0
	mul	t2, t2, t5
	mul	t3, t4, t3
	lw	t4, 0(a1)
	lw	t6, 0(a0)
	addi	s3, a3, -7
	andi	t5, a3, -8
	slli	s4, t1, 3
	slli	s5, t0, 3
	li	s2, 8
	j	.LBB0_7
.LBB0_6:                                # %for.cond.cleanup27
                                        #   in Loop: Header=BB0_7 Depth=1
	add	t6, t6, t2
	addi	a7, a7, 1
	add	t4, t4, t3
	beq	a7, a4, .LBB0_15
.LBB0_7:                                # %for.cond25.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
                                        #     Child Loop BB0_13 Depth 2
	blt	a3, s2, .LBB0_11
# %bb.8:                                # %for.body28.7.preheader
                                        #   in Loop: Header=BB0_7 Depth=1
	li	s6, 0
	mv	s9, t6
	mv	s1, t4
.LBB0_9:                                # %for.body28.7
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lb	a1, 0(s1)
	lb	s7, 0(s9)
	add	s10, a1, a6
	add	s0, s9, t0
	add	a0, s1, t1
	lb	ra, 0(a0)
	lb	s11, 0(s0)
	mul	a1, s10, s7
	add	s8, s8, a1
	add	ra, ra, a6
	mul	s7, ra, s11
	add	a0, a0, t1
	lb	a1, 0(a0)
	add	s7, s7, s8
	add	s0, s0, t0
	lb	s8, 0(s0)
	add	s10, a1, a6
	add	s0, s0, t0
	add	a0, a0, t1
	lb	ra, 0(a0)
	lb	s11, 0(s0)
	mul	a1, s10, s8
	add	s7, s7, a1
	add	ra, ra, a6
	mul	s8, ra, s11
	add	a0, a0, t1
	lb	a1, 0(a0)
	add	s7, s7, s8
	add	s0, s0, t0
	lb	s8, 0(s0)
	add	s10, a1, a6
	add	s0, s0, t0
	add	a0, a0, t1
	lb	ra, 0(a0)
	lb	s11, 0(s0)
	mul	a1, s10, s8
	add	s7, s7, a1
	add	ra, ra, a6
	mul	s8, ra, s11
	add	a0, a0, t1
	lb	a1, 0(a0)
	add	s7, s7, s8
	add	s0, s0, t0
	lb	s8, 0(s0)
	add	a1, a1, a6
	add	s0, s0, t0
	add	a0, a0, t1
	lb	a0, 0(a0)
	lb	s0, 0(s0)
	mul	a1, a1, s8
	add	a1, a1, s7
	add	a0, a0, a6
	mul	s8, a0, s0
	add	s8, s8, a1
	addi	s6, s6, 8
	add	s1, s1, s4
	add	s9, s9, s5
	blt	s6, s3, .LBB0_9
# %bb.10:                               #   in Loop: Header=BB0_7 Depth=1
	mv	s0, t5
	bge	t5, a3, .LBB0_6
	j	.LBB0_12
.LBB0_11:                               #   in Loop: Header=BB0_7 Depth=1
	li	s0, 0
	blez	a3, .LBB0_6
.LBB0_12:                               # %for.body28.clone.preheader
                                        #   in Loop: Header=BB0_7 Depth=1
	sub	a0, a3, s0
	mul	a1, t1, s0
	add	a1, a1, t4
	mul	s0, t0, s0
	add	s0, s0, t6
.LBB0_13:                               # %for.body28.clone
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lb	s1, 0(a1)
	lb	s6, 0(s0)
	add	s1, s1, a6
	mul	s1, s1, s6
	add	s8, s8, s1
	addi	a0, a0, -1
	add	a1, a1, t1
	add	s0, s0, t0
	bnez	a0, .LBB0_13
	j	.LBB0_6
.LBB0_14:
	li	s8, 0
.LBB0_15:                               # %for.cond.cleanup
	li	a7, 0
	addi	a0, a5, -1
	li	a1, 1
	sll	a0, a1, a0
	add	a0, a0, s8
	sra	a0, a0, a5
	sb	a0, 0(a2)
.LBB0_16:                               # %return
	mv	a0, a7
	cm.popret	{ra, s0-s11}, 64
.Lfunc_end0:
	.size	dspi_dotprod_off_s8_arp4, .Lfunc_end0-dspi_dotprod_off_s8_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
