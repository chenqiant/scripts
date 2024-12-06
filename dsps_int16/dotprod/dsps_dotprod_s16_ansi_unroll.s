.option	arch, -zcb, +zcmp
# 2024-12-05 17:07:32
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
	cm.push	{ra, s0-s1}, -16
	lui	a5, 8
	addi	a5, a5, -1
	srl	t4, a5, a4
	blez	a3, .LBB0_3
# %bb.1:                                # %for.body.preheader
	addi	a5, a3, -1
	li	a7, 7
	andi	a6, a3, 7
	li	t1, 0
	li	t0, 0
	bgeu	a5, a7, .LBB0_4
# %bb.2:
	mv	t5, t4
	j	.LBB0_6
.LBB0_3:
	li	t1, 0
	j	.LBB0_9
.LBB0_4:                                # %for.body.preheader.new
	sub	a7, a3, a6
	addi	t2, a0, 8
	addi	t3, a1, 8
	mv	t5, t4
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	t4, -8(t2)
	lh	a5, -8(t3)
	mul	a5, a5, t4
	srai	t4, a5, 31
	add	a5, a5, t5
	lh	t6, -6(t2)
	lh	s1, -6(t3)
	sltu	s0, a5, t5
	add	t1, t1, t4
	add	t1, t1, s0
	mul	s1, s1, t6
	srai	t4, s1, 31
	lh	t5, -4(t2)
	lh	s0, -4(t3)
	add	s1, s1, a5
	sltu	t6, s1, a5
	add	t1, t1, t4
	mul	a5, s0, t5
	srai	s0, a5, 31
	add	t6, t6, s0
	lh	t4, -2(t2)
	lh	s0, -2(t3)
	add	a5, a5, s1
	sltu	t5, a5, s1
	add	t1, t1, t6
	mul	s1, s0, t4
	srai	s0, s1, 31
	add	t5, t5, s0
	lh	t4, 0(t2)
	lh	s0, 0(t3)
	add	t1, t1, t5
	add	s1, s1, a5
	sltu	t5, s1, a5
	mul	a5, s0, t4
	srai	s0, a5, 31
	add	t5, t5, s0
	lh	t4, 2(t2)
	lh	s0, 2(t3)
	add	t1, t1, t5
	add	a5, a5, s1
	sltu	t5, a5, s1
	mul	s1, s0, t4
	srai	s0, s1, 31
	add	t5, t5, s0
	lh	t4, 4(t2)
	lh	s0, 4(t3)
	add	t1, t1, t5
	add	s1, s1, a5
	sltu	t5, s1, a5
	mul	a5, s0, t4
	srai	s0, a5, 31
	add	t5, t5, s0
	lh	t4, 6(t2)
	lh	s0, 6(t3)
	add	t1, t1, t5
	add	a5, a5, s1
	sltu	s1, a5, s1
	mul	t5, s0, t4
	srai	s0, t5, 31
	add	s0, s0, s1
	add	t1, t1, s0
	add	t5, t5, a5
	sltu	a5, t5, a5
	add	t1, t1, a5
	addi	t0, t0, 8
	addi	t2, t2, 16
	addi	t3, t3, 16
	bne	a7, t0, .LBB0_5
.LBB0_6:                                # %for.cond.cleanup.loopexit.unr-lcssa
	mv	t4, t5
	beqz	a6, .LBB0_9
# %bb.7:                                # %for.body.epil.preheader
	not	a7, t0
	add	a7, a7, a3
	slli	t0, t0, 1
	add	a3, a1, t0
	add	a0, a0, t0
	slli	a6, a6, 1
	add	a1, a1, a6
	add	t0, t0, a1
.LBB0_8:                                # %for.body.epil
                                        # =>This Inner Loop Header: Depth=1
	lh	a6, 0(a0)
	lh	a1, 0(a3)
	mul	t4, a1, a6
	srai	a1, t4, 31
	add	t4, t4, t5
	sltu	a5, t4, t5
	add	a1, a1, t1
	add	t1, a1, a5
	addi	a7, a7, -1
	addi	a3, a3, 2
	addi	a0, a0, 2
	mv	t5, t4
	bne	a3, t0, .LBB0_8
.LBB0_9:                                # %for.cond.cleanup
	li	a0, 15
	bge	a0, a4, .LBB0_11
# %bb.10:                               # %if.then
	addi	a0, a4, -15
	sll	a0, t4, a0
	addi	a1, a4, -47
	srai	a1, a1, 31
	and	a0, a0, a1
	sh	a0, 0(a2)
	cm.popretz	{ra, s0-s1}, 16
.LBB0_11:                               # %if.else
	li	a1, -17
	sub	a1, a1, a4
	bltz	a1, .LBB0_13
# %bb.12:                               # %if.else
	sra	a0, t1, a1
	sh	a0, 0(a2)
	cm.popretz	{ra, s0-s1}, 16
.LBB0_13:
	sub	a0, a0, a4
	srl	a1, t4, a0
	not	a0, a0
	slli	t1, t1, 1
	sll	a0, t1, a0
	or	a0, a0, a1
	sh	a0, 0(a2)
	cm.popretz	{ra, s0-s1}, 16
.Lfunc_end0:
	.size	dsps_dotprod_s16_arp4, .Lfunc_end0-dsps_dotprod_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb)"
	.section	".note.GNU-stack","",@progbits
