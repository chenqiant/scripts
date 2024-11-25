.option	arch, -zcb, +zcmp
# 2024-11-25 10:05:23
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
	cm.push	{ra, s0-s11}, -96
	mv	t6, a2
	lui	a5, 8
	addi	a5, a5, -1
	andi	s0, a3, -8
	srl	s9, a5, a4
	blez	s0, .LBB0_6
# %bb.1:                                # %for.body.preheader
	sw	a4, 24(sp)                      # 4-byte Folded Spill
	sw	t6, 28(sp)                      # 4-byte Folded Spill
	li	t4, 0
	li	s3, 0
	li	s6, 0
	li	s8, 0
	li	a6, 0
	li	t0, 0
	li	a7, 0
	li	t1, 0
	li	s4, 0
	li	t2, 0
	li	s2, 0
	li	t3, 0
	li	t5, 0
	addi	s7, s0, -1
	andi	a2, s7, -8
	sw	a2, 12(sp)                      # 4-byte Folded Spill
	addi	s0, a1, 8
	sw	a0, 20(sp)                      # 4-byte Folded Spill
	addi	s1, a0, 8
	slli	s7, s7, 1
	andi	a5, s7, -16
	sw	a1, 16(sp)                      # 4-byte Folded Spill
	add	a5, a5, a1
	addi	a1, a5, 24
.LBB0_2:                                # %for.body.7
                                        # =>This Inner Loop Header: Depth=1
	lh	s10, -8(s1)
	lh	s11, -8(s0)
	mv	a5, s9
	mv	ra, s2
	mv	t6, s4
	mv	s5, a7
	mv	s7, s3
	mv	s3, a6
	mv	a0, s8
	mv	s8, s6
	mul	s9, s11, s10
	srai	a2, s9, 31
	add	t5, t5, a2
	lh	a4, -4(s1)
	lh	a2, -4(s0)
	add	s9, s9, a5
	sltu	a5, s9, a5
	add	t5, t5, a5
	mul	s2, a2, a4
	srai	a2, s2, 31
	add	a2, a2, t3
	lh	a4, -2(s1)
	lh	a5, -2(s0)
	add	s2, s2, ra
	sltu	t3, s2, ra
	add	t3, t3, a2
	mul	s4, a5, a4
	srai	a2, s4, 31
	add	a2, a2, t2
	lh	a4, 0(s1)
	lh	a5, 0(s0)
	add	s4, s4, t6
	sltu	t2, s4, t6
	add	t2, t2, a2
	mul	a2, a5, a4
	srai	a4, a2, 31
	add	t1, t1, a4
	lh	a5, 2(s1)
	lh	a4, 2(s0)
	add	a7, a7, a2
	sltu	a2, a7, s5
	add	t1, t1, a2
	mul	a6, a4, a5
	srai	a2, a6, 31
	add	a2, a2, t0
	lh	a4, 4(s1)
	lh	a5, 4(s0)
	add	a6, a6, s3
	sltu	t0, a6, s3
	add	t0, t0, a2
	mul	s6, a5, a4
	srai	a2, s6, 31
	add	t6, a0, a2
	lh	a4, 6(s1)
	lh	a5, 6(s0)
	add	s6, s6, s8
	sltu	a2, s6, s8
	add	s8, t6, a2
	mv	a2, t4
	mul	t4, a5, a4
	srai	a4, t4, 31
	add	t4, t4, a2
	sltu	a2, t4, a2
	add	a4, a4, s7
	add	s3, a4, a2
	addi	s0, s0, 16
	addi	s1, s1, 16
	bne	s0, a1, .LBB0_2
# %bb.3:                                # %for.cond.cleanup.loopexit
	lw	a5, 12(sp)                      # 4-byte Folded Reload
	addi	a5, a5, 8
	lw	t6, 28(sp)                      # 4-byte Folded Reload
	lw	a4, 24(sp)                      # 4-byte Folded Reload
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	lw	a1, 16(sp)                      # 4-byte Folded Reload
	bge	a5, a3, .LBB0_7
.LBB0_4:                                # %for.body.clone.preheader
	sub	a3, a3, a5
	slli	a5, a5, 1
	add	a1, a1, a5
	add	a0, a0, a5
.LBB0_5:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	lh	a2, 0(a0)
	lh	a5, 0(a1)
	mul	s0, a5, a2
	srai	a2, s0, 31
	add	s0, s0, s9
	sltu	a5, s0, s9
	add	a2, a2, t5
	add	t5, a2, a5
	addi	a3, a3, -1
	addi	a1, a1, 2
	addi	a0, a0, 2
	mv	s9, s0
	bnez	a3, .LBB0_5
	j	.LBB0_8
.LBB0_6:
	li	a5, 0
	li	t4, 0
	li	s3, 0
	li	s6, 0
	li	s8, 0
	li	a6, 0
	li	t0, 0
	li	a7, 0
	li	t1, 0
	li	s4, 0
	li	t2, 0
	li	s2, 0
	li	t3, 0
	li	t5, 0
	bgtz	a3, .LBB0_4
.LBB0_7:
	mv	s0, s9
.LBB0_8:                                # %for.end85
	add	a3, t4, s0
	add	s6, s6, t4
	add	s5, a6, a7
	add	s2, s2, s4
	add	a1, a3, s6
	add	a5, s5, s2
	li	a2, 16
	add	a0, a1, a5
	blt	a4, a2, .LBB0_10
# %bb.9:                                # %if.then
	addi	a1, a4, -15
	sll	a0, a0, a1
	addi	a1, a4, -47
	srai	a1, a1, 31
	and	a0, a0, a1
	sh	a0, 0(t6)
	cm.popretz	{ra, s0-s11}, 96
.LBB0_10:                               # %if.else
	sltu	a2, a3, t4
	add	t5, t5, s3
	sltu	s0, s6, t4
	add	s1, s3, s8
	add	s0, s0, s1
	sltu	s1, s5, a6
	add	t0, t0, t1
	add	t0, t0, s1
	sltu	s1, s2, s4
	add	t2, t2, t3
	add	t2, t2, s1
	add	a2, a2, s0
	add	a2, a2, t5
	sltu	a3, a1, a3
	add	t0, t0, t2
	sltu	a5, a5, s5
	add	a5, a5, t0
	add	a3, a3, a5
	add	a2, a2, a3
	sltu	a1, a0, a1
	li	a3, -17
	sub	a3, a3, a4
	add	a1, a1, a2
	bltz	a3, .LBB0_12
# %bb.11:                               # %if.else
	sra	a0, a1, a3
	sh	a0, 0(t6)
	cm.popretz	{ra, s0-s11}, 96
.LBB0_12:
	li	a2, 15
	sub	a2, a2, a4
	srl	a0, a0, a2
	not	a2, a2
	slli	a1, a1, 1
	sll	a1, a1, a2
	or	a0, a0, a1
	sh	a0, 0(t6)
	cm.popretz	{ra, s0-s11}, 96
.Lfunc_end0:
	.size	dsps_dotprod_s16_arp4, .Lfunc_end0-dsps_dotprod_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda)"
	.section	".note.GNU-stack","",@progbits
