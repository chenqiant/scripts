.option	arch, -zcb, +zcmp
# 2024-11-28 20:03:05
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
	lui	a5, 8
	addi	a5, a5, -1
	srl	t0, a5, a4
	blez	a3, .LBB0_3
# %bb.1:                                # %for.body.preheader
	addi	a5, a3, -1
	li	a7, 7
	andi	a6, a3, 7
	bgeu	a5, a7, .LBB0_4
# %bb.2:
	li	a7, 0
	li	t2, 0
	mv	t3, t0
	bnez	a6, .LBB0_7
	j	.LBB0_15
.LBB0_3:
	li	a7, 0
	j	.LBB0_15
.LBB0_4:                                # %for.body.preheader.new
	cm.push	{ra, s0-s1}, -16
	li	a7, 0
	li	t2, 0
	sub	t1, a3, a6
	addi	t4, a0, 8
	addi	a5, a1, 8
	mv	t3, t0
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	t0, -8(t4)
	lh	a3, -8(a5)
	mul	a3, a3, t0
	srai	t0, a3, 31
	add	a3, a3, t3
	lh	t5, -6(t4)
	lh	t6, -6(a5)
	sltu	t3, a3, t3
	add	a7, a7, t0
	add	a7, a7, t3
	mul	t0, t6, t5
	srai	t3, t0, 31
	lh	t5, -4(t4)
	lh	t6, -4(a5)
	add	t0, t0, a3
	sltu	s1, t0, a3
	add	a7, a7, t3
	mul	s0, t6, t5
	srai	a3, s0, 31
	add	t3, s1, a3
	lh	t5, -2(t4)
	lh	a3, -2(a5)
	add	s0, s0, t0
	sltu	t0, s0, t0
	add	a7, a7, t3
	mul	s1, a3, t5
	srai	a3, s1, 31
	add	t0, t0, a3
	lh	t3, 0(t4)
	lh	a3, 0(a5)
	add	a7, a7, t0
	add	s1, s1, s0
	sltu	t0, s1, s0
	mul	s0, a3, t3
	srai	a3, s0, 31
	add	t0, t0, a3
	lh	t3, 2(t4)
	lh	a3, 2(a5)
	add	a7, a7, t0
	add	s0, s0, s1
	sltu	t0, s0, s1
	mul	s1, a3, t3
	srai	a3, s1, 31
	add	t0, t0, a3
	lh	t3, 4(t4)
	lh	a3, 4(a5)
	add	a7, a7, t0
	add	s1, s1, s0
	sltu	t0, s1, s0
	mul	s0, a3, t3
	srai	a3, s0, 31
	add	t0, t0, a3
	lh	t3, 6(t4)
	lh	a3, 6(a5)
	add	a7, a7, t0
	add	s0, s0, s1
	sltu	s1, s0, s1
	mul	t3, a3, t3
	srai	a3, t3, 31
	add	a3, a3, s1
	add	a3, a3, a7
	add	t3, t3, s0
	sltu	a7, t3, s0
	add	a7, a7, a3
	addi	t2, t2, 8
	addi	t4, t4, 16
	addi	a5, a5, 16
	bne	t1, t2, .LBB0_5
# %bb.6:
	cm.pop	{ra, s0-s1}, 16
	mv	t0, t3
	beqz	a6, .LBB0_15
.LBB0_7:                                # %for.body.epil.preheader
	slli	a3, t2, 1
	add	a5, a0, a3
	lh	a5, 0(a5)
	add	a3, a3, a1
	lh	a3, 0(a3)
	mul	t0, a3, a5
	srai	a3, t0, 31
	add	t0, t0, t3
	sltu	a5, t0, t3
	add	a3, a3, a5
	li	a5, 1
	add	a7, a7, a3
	beq	a6, a5, .LBB0_15
# %bb.8:                                # %for.body.epil.1
	addi	a3, t2, 1
	slli	a3, a3, 1
	add	a5, a0, a3
	lh	a5, 0(a5)
	add	a3, a3, a1
	lh	a3, 0(a3)
	mul	a3, a3, a5
	srai	t1, a3, 31
	add	a3, a3, t0
	sltu	a5, a3, t0
	add	a5, a5, t1
	li	t0, 2
	add	a7, a7, a5
	beq	a6, t0, .LBB0_14
# %bb.9:                                # %for.body.epil.2
	addi	a5, t2, 2
	slli	t0, a5, 1
	add	a5, a0, t0
	lh	t1, 0(a5)
	add	t0, t0, a1
	lh	a5, 0(t0)
	mul	t0, a5, t1
	srai	a5, t0, 31
	add	t0, t0, a3
	sltu	a3, t0, a3
	add	a3, a3, a5
	li	a5, 3
	add	a7, a7, a3
	beq	a6, a5, .LBB0_15
# %bb.10:                               # %for.body.epil.3
	addi	a3, t2, 3
	slli	a3, a3, 1
	add	a5, a0, a3
	lh	a5, 0(a5)
	add	a3, a3, a1
	lh	a3, 0(a3)
	mul	a3, a3, a5
	srai	t1, a3, 31
	add	a3, a3, t0
	sltu	a5, a3, t0
	add	a5, a5, t1
	li	t0, 4
	add	a7, a7, a5
	beq	a6, t0, .LBB0_14
# %bb.11:                               # %for.body.epil.4
	addi	a5, t2, 4
	slli	t0, a5, 1
	add	a5, a0, t0
	lh	t1, 0(a5)
	add	t0, t0, a1
	lh	a5, 0(t0)
	mul	t0, a5, t1
	srai	a5, t0, 31
	add	t0, t0, a3
	sltu	a3, t0, a3
	add	a3, a3, a5
	li	a5, 5
	add	a7, a7, a3
	beq	a6, a5, .LBB0_15
# %bb.12:                               # %for.body.epil.5
	addi	a3, t2, 5
	slli	a3, a3, 1
	add	a5, a0, a3
	lh	a5, 0(a5)
	add	a3, a3, a1
	lh	a3, 0(a3)
	mul	a3, a3, a5
	srai	t1, a3, 31
	add	a3, a3, t0
	sltu	a5, a3, t0
	add	a5, a5, t1
	li	t0, 6
	add	a7, a7, a5
	beq	a6, t0, .LBB0_14
# %bb.13:                               # %for.body.epil.6
	addi	t2, t2, 6
	slli	t2, t2, 1
	add	a0, a0, t2
	lh	a0, 0(a0)
	add	a1, a1, t2
	lh	a1, 0(a1)
	mul	t0, a1, a0
	srai	a0, t0, 31
	add	t0, t0, a3
	sltu	a1, t0, a3
	add	a0, a0, a1
	add	a7, a7, a0
	j	.LBB0_15
.LBB0_14:
	mv	t0, a3
.LBB0_15:                               # %for.cond.cleanup
	li	a0, 15
	bge	a0, a4, .LBB0_17
# %bb.16:                               # %if.then
	addi	a0, a4, -15
	sll	a0, t0, a0
	addi	a1, a4, -47
	srai	a1, a1, 31
	and	a0, a0, a1
	sh	a0, 0(a2)
	li	a0, 0
	ret
.LBB0_17:                               # %if.else
	li	a1, -17
	sub	a1, a1, a4
	bltz	a1, .LBB0_19
# %bb.18:                               # %if.else
	sra	a0, a7, a1
	sh	a0, 0(a2)
	li	a0, 0
	ret
.LBB0_19:
	sub	a0, a0, a4
	srl	a1, t0, a0
	not	a0, a0
	slli	a7, a7, 1
	sll	a0, a7, a0
	or	a0, a0, a1
	sh	a0, 0(a2)
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_dotprod_s16_arp4, .Lfunc_end0-dsps_dotprod_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6)"
	.section	".note.GNU-stack","",@progbits
