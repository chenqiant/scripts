	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_add_s16_ansi.c"
	.option	push
	.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_add_s16_ansi               # -- Begin function dsps_add_s16_ansi
	.p2align	1
	.type	dsps_add_s16_ansi,@function
dsps_add_s16_ansi:                      # @dsps_add_s16_ansi
# %bb.0:                                # %entry
	lui	t0, 112
	addi	t0, t0, 3
	beqz	a0, .LBB0_10
# %bb.1:                                # %entry
	beqz	a1, .LBB0_10
# %bb.2:                                # %entry
	beqz	a2, .LBB0_10
# %bb.3:                                # %for.cond.preheader
	addi	sp, sp, -112
	sw	ra, 108(sp)                     # 4-byte Folded Spill
	sw	s0, 104(sp)                     # 4-byte Folded Spill
	sw	s1, 100(sp)                     # 4-byte Folded Spill
	sw	s2, 96(sp)                      # 4-byte Folded Spill
	sw	s3, 92(sp)                      # 4-byte Folded Spill
	sw	s4, 88(sp)                      # 4-byte Folded Spill
	sw	s5, 84(sp)                      # 4-byte Folded Spill
	sw	s6, 80(sp)                      # 4-byte Folded Spill
	sw	s7, 76(sp)                      # 4-byte Folded Spill
	sw	s8, 72(sp)                      # 4-byte Folded Spill
	sw	s9, 68(sp)                      # 4-byte Folded Spill
	sw	s10, 64(sp)                     # 4-byte Folded Spill
	sw	s11, 60(sp)                     # 4-byte Folded Spill
	sw	a3, 28(sp)                      # 4-byte Folded Spill
	andi	a3, a3, -15
	slli	t0, a4, 1
	slli	t5, a5, 1
	slli	t2, a6, 1
	sw	a4, 24(sp)                      # 4-byte Folded Spill
	sw	a0, 20(sp)                      # 4-byte Folded Spill
	sw	a5, 16(sp)                      # 4-byte Folded Spill
	sw	a1, 12(sp)                      # 4-byte Folded Spill
	sw	a6, 8(sp)                       # 4-byte Folded Spill
	sw	a2, 4(sp)                       # 4-byte Folded Spill
	li	t4, 0
	blez	a3, .LBB0_6
# %bb.4:                                # %for.body.15.preheader
	slli	a6, a6, 5
	sw	a6, 40(sp)                      # 4-byte Folded Spill
	slli	a5, a5, 5
	sw	a5, 36(sp)                      # 4-byte Folded Spill
	slli	a4, a4, 5
	sw	a4, 32(sp)                      # 4-byte Folded Spill
	mv	s3, a0
	mv	s4, a1
	mv	s1, a2
	sw	a3, 44(sp)                      # 4-byte Folded Spill
.LBB0_5:                                # %for.body.15
                                        # =>This Inner Loop Header: Depth=1
	lh	a1, 0(s3)
	add	a3, s3, t0
	lh	a2, 0(a3)
	add	a4, a3, t0
	lh	a3, 0(a4)
	add	a4, a4, t0
	lh	a5, 0(a4)
	add	a4, a4, t0
	lh	t3, 0(a4)
	add	a0, a4, t0
	lh	a4, 0(a0)
	add	a0, a0, t0
	lh	s5, 0(a0)
	add	a0, a0, t0
	lh	ra, 0(a0)
	add	a0, a0, t0
	lh	s11, 0(a0)
	add	a0, a0, t0
	lh	s10, 0(a0)
	add	a0, a0, t0
	lh	s8, 0(a0)
	add	a0, a0, t0
	lh	s6, 0(a0)
	add	a0, a0, t0
	lh	s0, 0(a0)
	sw	s0, 56(sp)                      # 4-byte Folded Spill
	add	a0, a0, t0
	lh	s0, 0(a0)
	sw	s0, 52(sp)                      # 4-byte Folded Spill
	add	a0, a0, t0
	lh	s0, 0(a0)
	sw	s0, 48(sp)                      # 4-byte Folded Spill
	add	a0, a0, t0
	lh	s9, 0(a0)
	lh	a0, 0(s4)
	add	t1, s4, t5
	lh	t6, 0(t1)
	add	t1, t1, t5
	lh	s2, 0(t1)
	add	t1, t1, t5
	add	a6, a0, a1
	lh	a1, 0(t1)
	add	t1, t1, t5
	add	t6, t6, a2
	lh	a2, 0(t1)
	add	t1, t1, t5
	add	s2, s2, a3
	lh	a3, 0(t1)
	add	t1, t1, t5
	add	s7, a1, a5
	lh	a1, 0(t1)
	add	t1, t1, t5
	add	a2, a2, t3
	lh	a5, 0(t1)
	add	t1, t1, t5
	add	a3, a3, a4
	lh	a4, 0(t1)
	add	t1, t1, t5
	add	t3, a1, s5
	lh	a1, 0(t1)
	add	t1, t1, t5
	add	ra, ra, a5
	lh	a5, 0(t1)
	add	t1, t1, t5
	add	s11, s11, a4
	lh	a4, 0(t1)
	add	t1, t1, t5
	add	s10, s10, a1
	lh	a0, 0(t1)
	add	t1, t1, t5
	add	s8, s8, a5
	lh	a5, 0(t1)
	add	t1, t1, t5
	add	s6, s6, a4
	lh	a4, 0(t1)
	add	t1, t1, t5
	lh	s0, 0(t1)
	lw	a1, 56(sp)                      # 4-byte Folded Reload
	add	a1, a1, a0
	lw	a0, 52(sp)                      # 4-byte Folded Reload
	add	a5, a5, a0
	lw	t1, 48(sp)                      # 4-byte Folded Reload
	add	t1, t1, a4
	add	s9, s9, s0
	sra	a0, a6, a7
	sra	a4, t6, a7
	sh	a0, 0(s1)
	add	a0, s1, t2
	sh	a4, 0(a0)
	sra	a4, s2, a7
	add	a0, a0, t2
	sh	a4, 0(a0)
	sra	a4, s7, a7
	add	a0, a0, t2
	sh	a4, 0(a0)
	sra	a2, a2, a7
	add	a0, a0, t2
	sh	a2, 0(a0)
	sra	a2, a3, a7
	lw	a3, 44(sp)                      # 4-byte Folded Reload
	add	a0, a0, t2
	sh	a2, 0(a0)
	sra	a2, t3, a7
	add	a0, a0, t2
	sh	a2, 0(a0)
	sra	a2, ra, a7
	add	a0, a0, t2
	sh	a2, 0(a0)
	sra	a2, s11, a7
	add	a0, a0, t2
	sh	a2, 0(a0)
	sra	a2, s10, a7
	add	a0, a0, t2
	sh	a2, 0(a0)
	sra	a2, s8, a7
	add	a0, a0, t2
	sh	a2, 0(a0)
	sra	a2, s6, a7
	add	a0, a0, t2
	sh	a2, 0(a0)
	sra	a1, a1, a7
	add	a0, a0, t2
	sh	a1, 0(a0)
	sra	a1, a5, a7
	add	a0, a0, t2
	sh	a1, 0(a0)
	sra	a1, t1, a7
	add	a0, a0, t2
	sh	a1, 0(a0)
	sra	a1, s9, a7
	add	a0, a0, t2
	sh	a1, 0(a0)
	addi	t4, t4, 16
	lw	a0, 40(sp)                      # 4-byte Folded Reload
	add	s1, s1, a0
	lw	a0, 36(sp)                      # 4-byte Folded Reload
	add	s4, s4, a0
	lw	a0, 32(sp)                      # 4-byte Folded Reload
	add	s3, s3, a0
	blt	t4, a3, .LBB0_5
.LBB0_6:                                # %for.body.preheader
	lw	a0, 28(sp)                      # 4-byte Folded Reload
	bge	t4, a0, .LBB0_9
# %bb.7:                                # %for.body.clone.preheader
	sub	a0, a0, t4
	lw	a1, 8(sp)                       # 4-byte Folded Reload
	mul	a1, t4, a1
	slli	a1, a1, 1
	lw	a2, 4(sp)                       # 4-byte Folded Reload
	add	a1, a1, a2
	lw	a2, 16(sp)                      # 4-byte Folded Reload
	mul	a2, t4, a2
	slli	a2, a2, 1
	lw	a3, 12(sp)                      # 4-byte Folded Reload
	add	a2, a2, a3
	lw	a3, 24(sp)                      # 4-byte Folded Reload
	mul	a3, t4, a3
	slli	a3, a3, 1
	lw	a4, 20(sp)                      # 4-byte Folded Reload
	add	a3, a3, a4
.LBB0_8:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	lh	a4, 0(a3)
	lh	a5, 0(a2)
	add	a4, a4, a5
	sra	a4, a4, a7
	sh	a4, 0(a1)
	addi	a0, a0, -1
	add	a1, a1, t2
	add	a2, a2, t5
	add	a3, a3, t0
	bnez	a0, .LBB0_8
.LBB0_9:
	li	t0, 0
	lw	ra, 108(sp)                     # 4-byte Folded Reload
	lw	s0, 104(sp)                     # 4-byte Folded Reload
	lw	s1, 100(sp)                     # 4-byte Folded Reload
	lw	s2, 96(sp)                      # 4-byte Folded Reload
	lw	s3, 92(sp)                      # 4-byte Folded Reload
	lw	s4, 88(sp)                      # 4-byte Folded Reload
	lw	s5, 84(sp)                      # 4-byte Folded Reload
	lw	s6, 80(sp)                      # 4-byte Folded Reload
	lw	s7, 76(sp)                      # 4-byte Folded Reload
	lw	s8, 72(sp)                      # 4-byte Folded Reload
	lw	s9, 68(sp)                      # 4-byte Folded Reload
	lw	s10, 64(sp)                     # 4-byte Folded Reload
	lw	s11, 60(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 112
.LBB0_10:                               # %return
	mv	a0, t0
	ret
.Lfunc_end0:
	.size	dsps_add_s16_ansi, .Lfunc_end0-dsps_add_s16_ansi
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d)"
	.section	".note.GNU-stack","",@progbits
