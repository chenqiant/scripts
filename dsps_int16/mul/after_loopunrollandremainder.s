.option	arch, -zcb, +zcmp
# 2024-12-06 11:59:03
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_mul_s16_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_mul_s16_arp4               # -- Begin function dsps_mul_s16_arp4
	.p2align	1
	.type	dsps_mul_s16_arp4,@function
dsps_mul_s16_arp4:                      # @dsps_mul_s16_arp4
# %bb.0:                                # %entry
	lui	t0, 112
	addi	t0, t0, 3
	beqz	a0, .LBB0_10
# %bb.1:                                # %entry
	beqz	a1, .LBB0_10
# %bb.2:                                # %entry
	beqz	a2, .LBB0_10
# %bb.3:                                # %for.cond.preheader
	addi	sp, sp, -48
	sw	s0, 44(sp)                      # 4-byte Folded Spill
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	sw	s2, 36(sp)                      # 4-byte Folded Spill
	sw	s3, 32(sp)                      # 4-byte Folded Spill
	sw	s4, 28(sp)                      # 4-byte Folded Spill
	sw	s5, 24(sp)                      # 4-byte Folded Spill
	sw	s6, 20(sp)                      # 4-byte Folded Spill
	sw	s7, 16(sp)                      # 4-byte Folded Spill
	sw	s8, 12(sp)                      # 4-byte Folded Spill
	sw	s9, 8(sp)                       # 4-byte Folded Spill
	sw	s10, 4(sp)                      # 4-byte Folded Spill
	andi	t3, a3, -15
	slli	t0, a4, 1
	slli	t1, a5, 1
	slli	t2, a6, 1
	li	t4, 0
	blez	t3, .LBB0_6
# %bb.4:                                # %for.body.15.preheader
	slli	t5, a6, 5
	slli	t6, a5, 5
	slli	s2, a4, 5
	mv	s3, a0
	mv	s4, a1
	mv	s5, a2
.LBB0_5:                                # %for.body.15
                                        # =>This Inner Loop Header: Depth=1
	lh	s6, 0(s3)
	lh	s7, 0(s4)
	add	s10, s3, t0
	lh	s8, 0(s10)
	add	s1, s4, t1
	lh	s9, 0(s1)
	mul	s0, s7, s6
	sra	s0, s0, a7
	sh	s0, 0(s5)
	mul	s6, s9, s8
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s1, s1, t1
	lh	s8, 0(s1)
	sra	s6, s6, a7
	add	s0, s5, t2
	sh	s6, 0(s0)
	mul	s6, s8, s7
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s1, s1, t1
	lh	s8, 0(s1)
	sra	s6, s6, a7
	add	s0, s0, t2
	sh	s6, 0(s0)
	mul	s6, s8, s7
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s1, s1, t1
	lh	s8, 0(s1)
	sra	s6, s6, a7
	add	s0, s0, t2
	sh	s6, 0(s0)
	mul	s6, s8, s7
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s1, s1, t1
	lh	s8, 0(s1)
	sra	s6, s6, a7
	add	s0, s0, t2
	sh	s6, 0(s0)
	mul	s6, s8, s7
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s9, s1, t1
	lh	s8, 0(s9)
	sra	s6, s6, a7
	add	s0, s0, t2
	sh	s6, 0(s0)
	mul	s1, s8, s7
	sra	s1, s1, a7
	add	s0, s0, t2
	sh	s1, 0(s0)
	add	s10, s10, t0
	lh	s6, 0(s10)
	add	s9, s9, t1
	lh	s1, 0(s9)
	mul	s6, s1, s6
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s9, s9, t1
	lh	s8, 0(s9)
	sra	s1, s6, a7
	add	s0, s0, t2
	sh	s1, 0(s0)
	mul	s6, s8, s7
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s9, s9, t1
	lh	s8, 0(s9)
	sra	s1, s6, a7
	add	s0, s0, t2
	sh	s1, 0(s0)
	mul	s6, s8, s7
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s9, s9, t1
	lh	s8, 0(s9)
	sra	s1, s6, a7
	add	s0, s0, t2
	sh	s1, 0(s0)
	mul	s6, s8, s7
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s9, s9, t1
	lh	s8, 0(s9)
	sra	s1, s6, a7
	add	s0, s0, t2
	sh	s1, 0(s0)
	mul	s6, s8, s7
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s9, s9, t1
	lh	s8, 0(s9)
	sra	s1, s6, a7
	add	s0, s0, t2
	sh	s1, 0(s0)
	mul	s1, s8, s7
	sra	s1, s1, a7
	add	s0, s0, t2
	sh	s1, 0(s0)
	add	s10, s10, t0
	lh	s6, 0(s10)
	add	s9, s9, t1
	lh	s1, 0(s9)
	mul	s6, s1, s6
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s9, s9, t1
	lh	s8, 0(s9)
	sra	s1, s6, a7
	add	s0, s0, t2
	sh	s1, 0(s0)
	mul	s6, s8, s7
	add	s10, s10, t0
	lh	s7, 0(s10)
	add	s9, s9, t1
	lh	s8, 0(s9)
	sra	s1, s6, a7
	add	s0, s0, t2
	sh	s1, 0(s0)
	mul	s1, s8, s7
	sra	s1, s1, a7
	add	s0, s0, t2
	sh	s1, 0(s0)
	addi	t4, t4, 16
	add	s5, s5, t5
	add	s4, s4, t6
	add	s3, s3, s2
	blt	t4, t3, .LBB0_5
.LBB0_6:                                # %for.body.preheader
	bge	t4, a3, .LBB0_9
# %bb.7:                                # %for.body.clone.preheader
	sub	a3, a3, t4
	mul	s1, t4, a6
	slli	s1, s1, 1
	add	a2, a2, s1
	mul	a5, t4, a5
	slli	a5, a5, 1
	add	a1, a1, a5
	mul	a4, t4, a4
	slli	a4, a4, 1
	add	a0, a0, a4
.LBB0_8:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	lh	a4, 0(a0)
	lh	a5, 0(a1)
	mul	a4, a5, a4
	sra	a4, a4, a7
	sh	a4, 0(a2)
	addi	a3, a3, -1
	add	a2, a2, t2
	add	a1, a1, t1
	add	a0, a0, t0
	bnez	a3, .LBB0_8
.LBB0_9:
	li	t0, 0
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	lw	s5, 24(sp)                      # 4-byte Folded Reload
	lw	s6, 20(sp)                      # 4-byte Folded Reload
	lw	s7, 16(sp)                      # 4-byte Folded Reload
	lw	s8, 12(sp)                      # 4-byte Folded Reload
	lw	s9, 8(sp)                       # 4-byte Folded Reload
	lw	s10, 4(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
.LBB0_10:                               # %return
	mv	a0, t0
	ret
.Lfunc_end0:
	.size	dsps_mul_s16_arp4, .Lfunc_end0-dsps_mul_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49)"
	.section	".note.GNU-stack","",@progbits
