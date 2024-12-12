.option	arch, -zcb, +zcmp
# 2024-12-06 11:12:53
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_mul_s8_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_mul_s8_arp4                # -- Begin function dsps_mul_s8_arp4
	.p2align	1
	.type	dsps_mul_s8_arp4,@function
dsps_mul_s8_arp4:                       # @dsps_mul_s8_arp4
# %bb.0:                                # %entry
	lui	t0, 112
	addi	t0, t0, 3
	beqz	a0, .LBB0_10
# %bb.1:                                # %entry
	beqz	a1, .LBB0_10
# %bb.2:                                # %entry
	beqz	a2, .LBB0_10
# %bb.3:                                # %for.cond.preheader
	addi	sp, sp, -32
	sw	s0, 28(sp)                      # 4-byte Folded Spill
	sw	s1, 24(sp)                      # 4-byte Folded Spill
	sw	s2, 20(sp)                      # 4-byte Folded Spill
	sw	s3, 16(sp)                      # 4-byte Folded Spill
	sw	s4, 12(sp)                      # 4-byte Folded Spill
	sw	s5, 8(sp)                       # 4-byte Folded Spill
	sw	s6, 4(sp)                       # 4-byte Folded Spill
	sw	s7, 0(sp)                       # 4-byte Folded Spill
	li	t1, 0
	andi	t0, a3, -15
	blez	t0, .LBB0_6
# %bb.4:                                # %for.body.15.preheader
	slli	t2, a6, 4
	slli	t3, a5, 4
	slli	t4, a4, 4
	mv	t5, a0
	mv	t6, a1
	mv	s2, a2
.LBB0_5:                                # %for.body.15
                                        # =>This Inner Loop Header: Depth=1
	lb	s3, 0(t5)
	lb	s4, 0(t6)
	add	s1, t5, a4
	lb	s5, 0(s1)
	add	s7, t6, a5
	lb	s6, 0(s7)
	mul	s0, s4, s3
	sra	s0, s0, a7
	sb	s0, 0(s2)
	mul	s3, s6, s5
	add	s1, s1, a4
	lb	s4, 0(s1)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s3, s3, a7
	add	s0, s2, a6
	sb	s3, 0(s0)
	mul	s3, s5, s4
	add	s1, s1, a4
	lb	s4, 0(s1)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s3, s3, a7
	add	s0, s0, a6
	sb	s3, 0(s0)
	mul	s3, s5, s4
	add	s1, s1, a4
	lb	s4, 0(s1)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s3, s3, a7
	add	s0, s0, a6
	sb	s3, 0(s0)
	mul	s3, s5, s4
	add	s1, s1, a4
	lb	s4, 0(s1)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s3, s3, a7
	add	s0, s0, a6
	sb	s3, 0(s0)
	mul	s3, s5, s4
	add	s6, s1, a4
	lb	s4, 0(s6)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s3, s3, a7
	add	s0, s0, a6
	sb	s3, 0(s0)
	mul	s1, s5, s4
	sra	s1, s1, a7
	add	s0, s0, a6
	sb	s1, 0(s0)
	add	s6, s6, a4
	lb	s3, 0(s6)
	add	s7, s7, a5
	lb	s1, 0(s7)
	mul	s3, s1, s3
	add	s6, s6, a4
	lb	s4, 0(s6)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s1, s3, a7
	add	s0, s0, a6
	sb	s1, 0(s0)
	mul	s3, s5, s4
	add	s6, s6, a4
	lb	s4, 0(s6)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s1, s3, a7
	add	s0, s0, a6
	sb	s1, 0(s0)
	mul	s3, s5, s4
	add	s6, s6, a4
	lb	s4, 0(s6)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s1, s3, a7
	add	s0, s0, a6
	sb	s1, 0(s0)
	mul	s3, s5, s4
	add	s6, s6, a4
	lb	s4, 0(s6)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s1, s3, a7
	add	s0, s0, a6
	sb	s1, 0(s0)
	mul	s3, s5, s4
	add	s6, s6, a4
	lb	s4, 0(s6)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s1, s3, a7
	add	s0, s0, a6
	sb	s1, 0(s0)
	mul	s1, s5, s4
	sra	s1, s1, a7
	add	s0, s0, a6
	sb	s1, 0(s0)
	add	s6, s6, a4
	lb	s3, 0(s6)
	add	s7, s7, a5
	lb	s1, 0(s7)
	mul	s3, s1, s3
	add	s6, s6, a4
	lb	s4, 0(s6)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s1, s3, a7
	add	s0, s0, a6
	sb	s1, 0(s0)
	mul	s3, s5, s4
	add	s6, s6, a4
	lb	s4, 0(s6)
	add	s7, s7, a5
	lb	s5, 0(s7)
	sra	s1, s3, a7
	add	s0, s0, a6
	sb	s1, 0(s0)
	mul	s1, s5, s4
	sra	s1, s1, a7
	add	s0, s0, a6
	sb	s1, 0(s0)
	addi	t1, t1, 16
	add	s2, s2, t2
	add	t6, t6, t3
	add	t5, t5, t4
	blt	t1, t0, .LBB0_5
.LBB0_6:                                # %for.body.preheader
	bge	t1, a3, .LBB0_9
# %bb.7:                                # %for.body.clone.preheader
	sub	a3, a3, t1
	mul	s0, t1, a6
	add	a2, a2, s0
	mul	s0, t1, a5
	add	a1, a1, s0
	mul	s0, t1, a4
	add	a0, a0, s0
.LBB0_8:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	lb	s1, 0(a0)
	lb	s0, 0(a1)
	mul	s1, s0, s1
	sra	s1, s1, a7
	sb	s1, 0(a2)
	addi	a3, a3, -1
	add	a2, a2, a6
	add	a1, a1, a5
	add	a0, a0, a4
	bnez	a3, .LBB0_8
.LBB0_9:
	li	t0, 0
	lw	s0, 28(sp)                      # 4-byte Folded Reload
	lw	s1, 24(sp)                      # 4-byte Folded Reload
	lw	s2, 20(sp)                      # 4-byte Folded Reload
	lw	s3, 16(sp)                      # 4-byte Folded Reload
	lw	s4, 12(sp)                      # 4-byte Folded Reload
	lw	s5, 8(sp)                       # 4-byte Folded Reload
	lw	s6, 4(sp)                       # 4-byte Folded Reload
	lw	s7, 0(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 32
.LBB0_10:                               # %return
	mv	a0, t0
	ret
.Lfunc_end0:
	.size	dsps_mul_s8_arp4, .Lfunc_end0-dsps_mul_s8_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49)"
	.section	".note.GNU-stack","",@progbits