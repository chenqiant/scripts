.option	arch, -zcb, +zcmp
# 2024-12-05 14:55:55
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fft2r_sc16_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fft2r_sc16_arp4_           # -- Begin function dsps_fft2r_sc16_arp4_
	.p2align	1
	.type	dsps_fft2r_sc16_arp4_,@function
dsps_fft2r_sc16_arp4_:                  # @dsps_fft2r_sc16_arp4_
# %bb.0:                                # %entry
	addi	sp, sp, -48
	sw	ra, 44(sp)                      # 4-byte Folded Spill
	sw	s0, 40(sp)                      # 4-byte Folded Spill
	sw	s1, 36(sp)                      # 4-byte Folded Spill
	sw	s2, 32(sp)                      # 4-byte Folded Spill
	sw	s3, 28(sp)                      # 4-byte Folded Spill
	sw	s4, 24(sp)                      # 4-byte Folded Spill
	sw	s5, 20(sp)                      # 4-byte Folded Spill
	sw	s6, 16(sp)                      # 4-byte Folded Spill
	sw	s7, 12(sp)                      # 4-byte Folded Spill
	sw	s8, 8(sp)                       # 4-byte Folded Spill
	sw	s9, 4(sp)                       # 4-byte Folded Spill
	mv	s2, a2
	mv	s4, a1
	mv	s3, a0
	mv	a0, a1
	call	dsp_is_power_of_two
	lui	a1, 112
	beqz	a0, .LBB0_11
# %bb.1:                                # %if.end
	lui	a0, %hi(dsps_fft2r_sc16_initialized)
	lbu	a0, %lo(dsps_fft2r_sc16_initialized)(a0)
	beqz	a0, .LBB0_13
# %bb.2:                                # %if.end2
	li	a6, 2
	blt	s4, a6, .LBB0_12
# %bb.3:                                # %for.cond3.preheader.preheader
	li	t2, 1
	lui	a2, 8
	addi	s5, a2, -1
	lui	t5, 1048560
	li	a7, 3
	j	.LBB0_5
.LBB0_4:                                # %for.cond.cleanup5
                                        #   in Loop: Header=BB0_5 Depth=1
	slli	t2, t2, 1
	bgeu	a7, t0, .LBB0_12
.LBB0_5:                                # %for.cond3.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
                                        #       Child Loop BB0_9 Depth 3
	mv	t0, s4
	srli	s4, s4, 1
	blez	t2, .LBB0_4
# %bb.6:                                # %for.cond3.preheader
                                        #   in Loop: Header=BB0_5 Depth=1
	bltu	t0, a6, .LBB0_4
# %bb.7:                                # %for.body6.us.preheader
                                        #   in Loop: Header=BB0_5 Depth=1
	li	t3, 0
	li	t4, 0
	slli	t6, s4, 2
	slli	t1, s4, 1
.LBB0_8:                                # %for.body6.us
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_9 Depth 3
	slli	a0, t4, 2
	add	a0, a0, s2
	lw	s1, 0(a0)
	slli	a5, s1, 16
	srai	s6, a5, 16
	srai	s7, s1, 16
	slli	a1, t3, 2
	add	a1, a1, s3
	add	t3, t3, t1
	mv	a0, s4
.LBB0_9:                                # %for.body10.us
                                        #   Parent Loop BB0_5 Depth=1
                                        #     Parent Loop BB0_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lw	a2, 0(a1)
	add	s8, a1, t6
	lw	s1, 0(s8)
	slli	a4, a2, 16
	srai	a4, a4, 16
	slli	s9, a4, 15
	slli	a3, s1, 16
	srai	a3, a3, 16
	srai	s1, s1, 16
	mul	s0, a3, s6
	mul	a5, s1, s7
	sub	a4, a4, s5
	sub	a4, s9, a4
	add	a5, a5, s0
	sub	s0, a4, a5
	srli	s9, s0, 16
	srai	a2, a2, 16
	slli	s0, a2, 15
	mul	s1, s1, s6
	mul	a3, a3, s7
	sub	a2, a2, s5
	sub	s0, s0, a2
	sub	a2, s1, s0
	sub	a2, a3, a2
	and	a2, a2, t5
	or	a2, a2, s9
	sw	a2, 0(s8)
	add	a4, a4, a5
	srli	a4, a4, 16
	add	s0, s0, s1
	sub	s0, s0, a3
	and	a2, s0, t5
	or	a2, a2, a4
	sw	a2, 0(a1)
	addi	a0, a0, -1
	addi	a1, a1, 4
	bnez	a0, .LBB0_9
# %bb.10:                               # %for.cond7.for.cond.cleanup9_crit_edge.us
                                        #   in Loop: Header=BB0_8 Depth=2
	addi	t4, t4, 1
	bne	t4, t2, .LBB0_8
	j	.LBB0_4
.LBB0_11:
	addi	a0, a1, 1
	j	.LBB0_14
.LBB0_12:
	li	a0, 0
	j	.LBB0_14
.LBB0_13:
	addi	a0, a1, 4
.LBB0_14:                               # %return
	lw	ra, 44(sp)                      # 4-byte Folded Reload
	lw	s0, 40(sp)                      # 4-byte Folded Reload
	lw	s1, 36(sp)                      # 4-byte Folded Reload
	lw	s2, 32(sp)                      # 4-byte Folded Reload
	lw	s3, 28(sp)                      # 4-byte Folded Reload
	lw	s4, 24(sp)                      # 4-byte Folded Reload
	lw	s5, 20(sp)                      # 4-byte Folded Reload
	lw	s6, 16(sp)                      # 4-byte Folded Reload
	lw	s7, 12(sp)                      # 4-byte Folded Reload
	lw	s8, 8(sp)                       # 4-byte Folded Reload
	lw	s9, 4(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	dsps_fft2r_sc16_arp4_, .Lfunc_end0-dsps_fft2r_sc16_arp4_
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb)"
	.section	".note.GNU-stack","",@progbits
