	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_dotprod_s16_best.c"
	.option	push
	.option	arch, -zcb, -zcmt
	.globl	dsps_dotprod_s16_ansi           # -- Begin function dsps_dotprod_s16_ansi
	.p2align	1
	.type	dsps_dotprod_s16_ansi,@function
dsps_dotprod_s16_ansi:                  # @dsps_dotprod_s16_ansi
# %bb.0:                                # %entry
	cm.push	{ra, s0-s1}, -16
	lui	a5, 8
	addi	a5, a5, -1
	andi	a6, a3, -8
	srl	t1, a5, a4
	blez	a6, .LBB0_8
# %bb.1:                                # %for.body.preheader
	li	a7, 0
	addi	t2, a6, -1
	andi	a6, t2, -8
	addi	t3, a1, 8
	addi	t0, a0, 8
	slli	t2, t2, 1
	andi	a5, t2, -16
	add	a5, a5, a1
	addi	t2, a5, 24
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	t4, -8(t0)
	lh	a5, -8(t3)
	lh	t5, -6(t0)
	lh	t6, -6(t3)
	mul	a5, a5, t4
	srai	t4, a5, 31
	add	a5, a5, t1
	sltu	t1, a5, t1
	add	a7, a7, t4
	add	a7, a7, t1
	mul	t1, t6, t5
	srai	t4, t1, 31
	lh	t5, -4(t0)
	lh	t6, -4(t3)
	lh	t5, -2(t0)
	lh	a5, -2(t3)
	add	t1, t1, a5
	sltu	s1, t1, a5
	add	a7, a7, t4
	mul	s0, t6, t5
	srai	a5, s0, 31
	add	t4, s1, a5

	add	s0, s0, t1
	sltu	t1, s0, t1
	add	a7, a7, t4
	mul	s1, a5, t5
	srai	a5, s1, 31
	add	t1, t1, a5
	lh	t4, 0(t0)
	lh	a5, 0(t3)
	add	a7, a7, t1
	add	s1, s1, s0
	sltu	t1, s1, s0
	mul	s0, a5, t4
	srai	a5, s0, 31
	add	t1, t1, a5
	lh	t4, 2(t0)
	lh	a5, 2(t3)
	add	a7, a7, t1
	add	s0, s0, s1
	sltu	t1, s0, s1
	mul	s1, a5, t4
	srai	a5, s1, 31
	add	t1, t1, a5
	lh	t4, 4(t0)
	lh	a5, 4(t3)
	add	a7, a7, t1
	add	s1, s1, s0
	sltu	t1, s1, s0
	mul	s0, a5, t4
	srai	a5, s0, 31
	add	t1, t1, a5
	lh	t4, 6(t0)
	lh	a5, 6(t3)
	add	a7, a7, t1
	add	s0, s0, s1
	sltu	s1, s0, s1
	mul	t1, a5, t4
	srai	a5, t1, 31
	add	a5, a5, s1
	add	a5, a5, a7
	add	t1, t1, s0
	sltu	a7, t1, s0
	add	a7, a7, a5
	addi	t3, t3, 16
	addi	t0, t0, 16
	bne	t3, t2, .LBB0_2
# %bb.3:                                # %for.cond73.preheader.loopexit
	addi	a6, a6, 8
	bge	a6, a3, .LBB0_9
.LBB0_4:                                # %for.body76.preheader
	sub	a3, a3, a6
	slli	a5, a6, 1
	add	a1, a1, a5
	add	a5, a5, a0
.LBB0_5:                                # %for.body76
                                        # =>This Inner Loop Header: Depth=1
	lh	a0, 0(a5)
	lh	s1, 0(a1)
	mul	a0, s1, a0
	srai	s1, a0, 31
	add	a0, a0, t1
	sltu	s0, a0, t1
	add	a7, a7, s1
	add	a7, a7, s0
	addi	a3, a3, -1
	addi	a1, a1, 2
	addi	a5, a5, 2
	mv	t1, a0
	bnez	a3, .LBB0_5
# %bb.6:                                # %for.end85
	li	a1, 16
	blt	a4, a1, .LBB0_10
.LBB0_7:                                # %if.then
	addi	a1, a4, -15
	sll	a0, a0, a1
	addi	a1, a4, -47
	srai	a1, a1, 31
	and	a0, a0, a1
	sh	a0, 0(a2)
	cm.popretz	{ra, s0-s1}, 16
.LBB0_8:
	li	a6, 0
	li	a7, 0
	bgtz	a3, .LBB0_4
.LBB0_9:
	mv	a0, t1
	li	a1, 16
	bge	a4, a1, .LBB0_7
.LBB0_10:                               # %if.else
	li	a1, -17
	sub	a1, a1, a4
	bltz	a1, .LBB0_12
# %bb.11:                               # %if.else
	sra	a0, a7, a1
	sh	a0, 0(a2)
	cm.popretz	{ra, s0-s1}, 16
.LBB0_12:
	li	a1, 15
	sub	a1, a1, a4
	srl	a0, a0, a1
	not	a1, a1
	slli	a7, a7, 1
	sll	a1, a7, a1
	or	a0, a0, a1
	sh	a0, 0(a2)
	cm.popretz	{ra, s0-s1}, 16
.Lfunc_end0:
	.size	dsps_dotprod_s16_ansi, .Lfunc_end0-dsps_dotprod_s16_ansi
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda)"
	.section	".note.GNU-stack","",@progbits
