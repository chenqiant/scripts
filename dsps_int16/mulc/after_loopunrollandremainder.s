.option	arch, -zcb, +zcmp
# 2024-11-25 17:01:42
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_mulc_s16_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_mulc_s16_arp4              # -- Begin function dsps_mulc_s16_arp4
	.p2align	1
	.type	dsps_mulc_s16_arp4,@function
dsps_mulc_s16_arp4:                     # @dsps_mulc_s16_arp4
# %bb.0:                                # %entry
	lui	a6, 112
	addi	a6, a6, 3
	beqz	a0, .LBB0_9
# %bb.1:                                # %entry
	beqz	a1, .LBB0_9
# %bb.2:                                # %for.cond.preheader
	addi	sp, sp, -16
	sw	s0, 12(sp)                      # 4-byte Folded Spill
	sw	s1, 8(sp)                       # 4-byte Folded Spill
	sw	s2, 4(sp)                       # 4-byte Folded Spill
	sw	s3, 0(sp)                       # 4-byte Folded Spill
	andi	t0, a2, -15
	slli	a6, a4, 1
	slli	a7, a5, 1
	li	t1, 0
	blez	t0, .LBB0_5
# %bb.3:                                # %for.body.15.preheader
	slli	t2, a5, 5
	slli	t3, a4, 5
	mv	t4, a0
	mv	t5, a1
.LBB0_4:                                # %for.body.15
                                        # =>This Inner Loop Header: Depth=1
	lh	t6, 0(t4)
	add	s0, t4, a6
	lh	s2, 0(s0)
	mul	s1, t6, a3
	srli	s1, s1, 15
	sh	s1, 0(t5)
	mul	t6, s2, a3
	add	s0, s0, a6
	lh	s2, 0(s0)
	srli	t6, t6, 15
	add	s1, t5, a7
	sh	t6, 0(s1)
	mul	t6, s2, a3
	add	s0, s0, a6
	lh	s2, 0(s0)
	srli	t6, t6, 15
	add	s1, s1, a7
	sh	t6, 0(s1)
	mul	t6, s2, a3
	add	s0, s0, a6
	lh	s2, 0(s0)
	srli	t6, t6, 15
	add	s1, s1, a7
	sh	t6, 0(s1)
	mul	t6, s2, a3
	add	s0, s0, a6
	lh	s2, 0(s0)
	srli	t6, t6, 15
	add	s1, s1, a7
	sh	t6, 0(s1)
	mul	t6, s2, a3
	add	s3, s0, a6
	lh	s2, 0(s3)
	srli	t6, t6, 15
	add	s1, s1, a7
	sh	t6, 0(s1)
	mul	s0, s2, a3
	srli	s0, s0, 15
	add	s1, s1, a7
	sh	s0, 0(s1)
	add	s3, s3, a6
	lh	s0, 0(s3)
	mul	t6, s0, a3
	add	s3, s3, a6
	lh	s2, 0(s3)
	srli	s0, t6, 15
	add	s1, s1, a7
	sh	s0, 0(s1)
	mul	t6, s2, a3
	add	s3, s3, a6
	lh	s2, 0(s3)
	srli	s0, t6, 15
	add	s1, s1, a7
	sh	s0, 0(s1)
	mul	t6, s2, a3
	add	s3, s3, a6
	lh	s2, 0(s3)
	srli	s0, t6, 15
	add	s1, s1, a7
	sh	s0, 0(s1)
	mul	t6, s2, a3
	add	s3, s3, a6
	lh	s2, 0(s3)
	srli	s0, t6, 15
	add	s1, s1, a7
	sh	s0, 0(s1)
	mul	t6, s2, a3
	add	s3, s3, a6
	lh	s2, 0(s3)
	srli	s0, t6, 15
	add	s1, s1, a7
	sh	s0, 0(s1)
	mul	s0, s2, a3
	srli	s0, s0, 15
	add	s1, s1, a7
	sh	s0, 0(s1)
	add	s3, s3, a6
	lh	s0, 0(s3)
	mul	t6, s0, a3
	add	s3, s3, a6
	lh	s2, 0(s3)
	srli	s0, t6, 15
	add	s1, s1, a7
	sh	s0, 0(s1)
	mul	t6, s2, a3
	add	s3, s3, a6
	lh	s2, 0(s3)
	srli	s0, t6, 15
	add	s1, s1, a7
	sh	s0, 0(s1)
	mul	s0, s2, a3
	srli	s0, s0, 15
	add	s1, s1, a7
	sh	s0, 0(s1)
	addi	t1, t1, 16
	add	t5, t5, t2
	add	t4, t4, t3
	blt	t1, t0, .LBB0_4
.LBB0_5:                                # %for.body.preheader
	bge	t1, a2, .LBB0_8
# %bb.6:                                # %for.body.clone.preheader
	sub	a2, a2, t1
	mul	a5, t1, a5
	slli	a5, a5, 1
	add	a1, a1, a5
	mul	a4, t1, a4
	slli	a4, a4, 1
	add	a0, a0, a4
.LBB0_7:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	lh	a4, 0(a0)
	mul	a4, a4, a3
	srli	a4, a4, 15
	sh	a4, 0(a1)
	addi	a2, a2, -1
	add	a1, a1, a7
	add	a0, a0, a6
	bnez	a2, .LBB0_7
.LBB0_8:
	li	a6, 0
	lw	s0, 12(sp)                      # 4-byte Folded Reload
	lw	s1, 8(sp)                       # 4-byte Folded Reload
	lw	s2, 4(sp)                       # 4-byte Folded Reload
	lw	s3, 0(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
.LBB0_9:                                # %return
	mv	a0, a6
	ret
.Lfunc_end0:
	.size	dsps_mulc_s16_arp4, .Lfunc_end0-dsps_mulc_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda)"
	.section	".note.GNU-stack","",@progbits
