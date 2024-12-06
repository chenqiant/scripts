.option	arch, -zcb, +zcmp
# 2024-12-06 11:25:58
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_dotprod_s16_arp4.c"
	.option	push
	#.option	arch, -zcb, -zcmt
	.globl	dsps_dotprod_s16_arp4           # -- Begin function dsps_dotprod_s16_arp4
	.p2align	1
	.type	dsps_dotprod_s16_arp4,@function
dsps_dotprod_s16_arp4:                  # @dsps_dotprod_s16_arp4
# %bb.0:                                # %entry
	cm.push	{ra, s0-s11}, -64
	lui	a5, 8
	addi	a5, a5, -1
	andi	a7, a3, -8
	srl	t0, a5, a4
	blez	a7, .LBB0_8
# %bb.1:                                # %for.body.preheader
	li	a6, 0
	addi	t2, a7, -1
	andi	a7, t2, -8
	addi	t3, a1, 8
	addi	t1, a0, 8
	slli	t2, t2, 1
	andi	a5, t2, -16
	add	a5, a5, a1
	addi	t2, a5, 24
.LBB0_2:                                # %for.body.7
                                        # =>This Inner Loop Header: Depth=1
	lh	t4, -8(t1)
	lh	t6, -8(t3)
	lh	t5, -6(t1)
	lh	s2, -6(t3)
	lh	s3, -4(t1)
	lh	s5, -4(t3)
	lh	s4, -2(t1)
	lh	s7, -2(t3)
	lh	s6, 0(t1)
	lh	s9, 0(t3)
	lh	s8, 2(t1)
	lh	s11, 2(t3)
	lh	s10, 4(t1)
	lh	s1, 4(t3)
	lh	ra, 6(t1)
	lh	s0, 6(t3)
	mul	a5, t6, t4
	mul	t4, s2, t5
	mul	t5, s5, s3
	mul	t6, s7, s4
	mul	s2, s9, s6
	mul	s3, s11, s8
	mul	s5, s1, s10
	mul	s4, s0, ra
	srai	s0, a5, 31
	srai	ra, t4, 31
	srai	s6, t5, 31
	srai	s7, t6, 31
	srai	s8, s2, 31
	srai	s9, s3, 31
	srai	s10, s5, 31
	srai	s11, s4, 31
	add	a5, a5, t0
	sltu	s1, a5, t0
	add	a6, a6, s0
	add	a6, a6, s1
	add	t4, t4, a5
	sltu	a5, t4, a5
	add	a6, a6, ra
	add	t5, t5, t4
	sltu	s1, t5, t4
	add	a5, a5, s6
	add	a5, a5, a6
	add	s1, s1, s7
	add	a5, a5, s1
	add	t6, t6, t5
	sltu	s1, t6, t5
	add	s1, s1, s8
	add	a5, a5, s1
	add	s2, s2, t6
	sltu	s1, s2, t6
	add	s1, s1, s9
	add	a5, a5, s1
	add	s3, s3, s2
	sltu	s1, s3, s2
	add	s1, s1, s10
	add	a5, a5, s1
	add	s5, s5, s3
	sltu	s1, s5, s3
	add	s1, s1, s11
	add	a5, a5, s1
	add	t0, s5, s4
	sltu	a6, t0, s5
	add	a6, a6, a5
	addi	t3, t3, 16
	addi	t1, t1, 16
	bne	t3, t2, .LBB0_2
# %bb.3:                                # %for.cond.cleanup.loopexit
	addi	a7, a7, 8
	bge	a7, a3, .LBB0_9
.LBB0_4:                                # %for.body.clone.preheader
	sub	a3, a3, a7
	slli	a5, a7, 1
	add	a1, a1, a5
	add	a5, a5, a0
.LBB0_5:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	lh	a0, 0(a5)
	lh	s1, 0(a1)
	mul	a0, s1, a0
	srai	s1, a0, 31
	add	a0, a0, t0
	sltu	s0, a0, t0
	add	a6, a6, s1
	add	a6, a6, s0
	addi	a3, a3, -1
	addi	a1, a1, 2
	addi	a5, a5, 2
	mv	t0, a0
	bnez	a3, .LBB0_5
# %bb.6:                                # %for.end85
	li	a1, 16
	blt	a4, a1, .LBB0_10
.LBB0_7:                                # %if.then
	addi	a1, a4, -47
	addi	a4, a4, -15
	sll	a0, a0, a4
	srai	a1, a1, 31
	and	a0, a0, a1
	sh	a0, 0(a2)
	cm.popretz	{ra, s0-s11}, 64
.LBB0_8:
	li	a7, 0
	li	a6, 0
	bgtz	a3, .LBB0_4
.LBB0_9:
	mv	a0, t0
	li	a1, 16
	bge	a4, a1, .LBB0_7
.LBB0_10:                               # %if.else
	li	a1, -17
	sub	a1, a1, a4
	bltz	a1, .LBB0_12
# %bb.11:                               # %if.else
	sra	a0, a6, a1
	sh	a0, 0(a2)
	cm.popretz	{ra, s0-s11}, 64
.LBB0_12:
	li	a1, 15
	sub	a1, a1, a4
	srl	a0, a0, a1
	not	a1, a1
	slli	a6, a6, 1
	sll	a1, a6, a1
	or	a0, a0, a1
	sh	a0, 0(a2)
	cm.popretz	{ra, s0-s11}, 64
.Lfunc_end0:
	.size	dsps_dotprod_s16_arp4, .Lfunc_end0-dsps_dotprod_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49)"
	.section	".note.GNU-stack","",@progbits
