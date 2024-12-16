	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspi_dotprod_off_s16_ansi_best.c"
	.option	push
	.option	arch, -zcb, -zcmt
	.globl	dspi_dotprod_off_s16_ansi       # -- Begin function dspi_dotprod_off_s16_ansi
	.p2align	1
	.type	dspi_dotprod_off_s16_ansi,@function
dspi_dotprod_off_s16_ansi:              # @dspi_dotprod_off_s16_ansi
# %bb.0:                                # %entry
	cm.push	{ra, s0-s11}, -96
	lw	t3, 4(a0)
	lw	t0, 12(a0)
	mul	s1, t3, a3
	lui	a7, 112
	addi	a7, a7, 3
	blt	t0, s1, .LBB0_19
# %bb.1:                                # %if.end
	lw	t1, 8(a0)
	lw	s0, 16(a0)
	mul	s1, t1, a4
	blt	s0, s1, .LBB0_19
# %bb.2:                                # %if.end4
	lw	t4, 4(a1)
	lw	t2, 12(a1)
	mul	s1, t4, a3
	lui	a7, 112
	addi	a7, a7, 3
	blt	t2, s1, .LBB0_19
# %bb.3:                                # %if.end10
	lw	s2, 8(a1)
	lw	s1, 16(a1)
	mul	s0, s2, a4
	blt	s1, s0, .LBB0_19
# %bb.4:                                # %if.end16
	sw	a5, 0(sp)                       # 4-byte Folded Spill
	sw	a2, 4(sp)                       # 4-byte Folded Spill
	li	s5, 0
	li	a7, 0
	blez	a4, .LBB0_15
# %bb.5:                                # %for.cond25.preheader.lr.ph
	li	a5, 0
	lw	a1, 0(a1)
	lw	t5, 0(a0)
	addi	t6, a3, -7
	andi	a0, a3, -8
	sw	a0, 8(sp)                       # 4-byte Folded Spill
	mul	a0, s2, t2
	slli	a0, a0, 1
	sw	a0, 28(sp)                      # 4-byte Folded Spill
	slli	s2, t4, 4
	sw	a3, 16(sp)                      # 4-byte Folded Spill
	mul	s3, t1, t0
	slli	s3, s3, 1
	sw	s3, 24(sp)                      # 4-byte Folded Spill
	mv	s3, a1
	lw	t1, 16(sp)                      # 4-byte Folded Reload
	slli	s4, t3, 4
	slli	a2, t3, 1
	li	t3, 0
	slli	t2, t4, 1
	li	t4, 8
	sw	a4, 12(sp)                      # 4-byte Folded Spill
	j	.LBB0_8
.LBB0_6:                                #   in Loop: Header=BB0_8 Depth=1
	mv	a5, s5
.LBB0_7:                                # %for.end164
                                        #   in Loop: Header=BB0_8 Depth=1
	add	s0, ra, t0
	add	s10, s10, s11
	add	s8, s8, s9
	add	s6, s6, s7
	add	s0, s0, s10
	add	s6, s6, s8
	add	s0, s0, s6
	srai	a0, s0, 31
	add	s5, a5, s0
	sltu	a1, s5, a5
	add	a0, a0, a7
	add	a7, a0, a1
	addi	t3, t3, 1
	lw	a0, 28(sp)                      # 4-byte Folded Reload
	add	s3, s3, a0
	lw	a0, 24(sp)                      # 4-byte Folded Reload
	add	t5, t5, a0
	beq	t3, a4, .LBB0_15
.LBB0_8:                                # %for.cond25.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #     Child Loop BB0_14 Depth 2
	blt	t1, t4, .LBB0_12
# %bb.9:                                # %for.body27.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	sw	t3, 20(sp)                      # 4-byte Folded Spill
	li	t0, 0
	li	ra, 0
	li	a1, 0
	li	s7, 0
	li	s6, 0
	li	s9, 0
	li	s8, 0
	li	s11, 0
	li	s10, 0
	mv	t4, t5
	mv	s0, s3
	mv	t3, s3
.LBB0_10:                               # %for.body27
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	a0, 0(t3)
	lh	a5, 0(t4)
	add	a0, a0, a6
	add	s1, t4, a2
	add	t1, t3, t2
	lh	s3, 0(t1)
	lh	a4, 0(s1)
	mul	a0, a0, a5
	add	t0, t0, a0
	add	s3, s3, a6
	mul	a0, s3, a4
	add	t1, t1, t2
	lh	a4, 0(t1)
	add	ra, ra, a0
	add	s1, s1, a2
	lh	a0, 0(s1)
	add	a4, a4, a6
	add	s1, s1, a2
	add	t1, t1, t2
	lh	a5, 0(t1)
	lh	a3, 0(s1)
	mul	a0, a4, a0
	add	s10, s10, a0
	add	a5, a5, a6
	mul	a0, a5, a3
	add	t1, t1, t2
	lh	a3, 0(t1)
	add	s11, s11, a0
	add	s1, s1, a2
	lh	a0, 0(s1)
	add	a3, a3, a6
	add	s1, s1, a2
	add	t1, t1, t2
	lh	a4, 0(t1)
	lh	a5, 0(s1)
	mul	a0, a3, a0
	add	s8, s8, a0
	add	a4, a4, a6
	mul	a0, a4, a5
	add	t1, t1, t2
	lh	a3, 0(t1)
	add	s9, s9, a0
	add	s1, s1, a2
	lh	a0, 0(s1)
	add	a3, a3, a6
	add	s1, s1, a2
	add	t1, t1, t2
	lh	a4, 0(t1)
	lh	a5, 0(s1)
	mul	a0, a3, a0
	add	s6, s6, a0
	add	a4, a4, a6
	mul	a0, a4, a5
	add	s7, s7, a0
	addi	a1, a1, 8
	add	t3, t3, s2
	add	t4, t4, s4
	blt	a1, t6, .LBB0_10
# %bb.11:                               #   in Loop: Header=BB0_8 Depth=1
	lw	a5, 8(sp)                       # 4-byte Folded Reload
	lw	a4, 12(sp)                      # 4-byte Folded Reload
	lw	t1, 16(sp)                      # 4-byte Folded Reload
	lw	t3, 20(sp)                      # 4-byte Folded Reload
	mv	s3, s0
	li	t4, 8
	bge	a5, t1, .LBB0_6
	j	.LBB0_13
.LBB0_12:                               #   in Loop: Header=BB0_8 Depth=1
	li	s10, 0
	li	s11, 0
	li	s8, 0
	li	s9, 0
	li	s6, 0
	li	s7, 0
	li	a5, 0
	li	ra, 0
	li	t0, 0
	blez	t1, .LBB0_6
.LBB0_13:                               # %for.body149.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	sub	a1, t1, a5
	mul	a0, t2, a5
	add	a0, a0, s3
	mul	s1, a2, a5
	add	s1, s1, t5
.LBB0_14:                               # %for.body149
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	a3, 0(a0)
	lh	a5, 0(s1)
	add	a3, a3, a6
	mul	a5, a3, a5
	srai	a3, a5, 31
	add	a5, a5, s5
	sltu	s0, a5, s5
	add	a3, a3, a7
	add	a7, a3, s0
	addi	a1, a1, -1
	add	a0, a0, t2
	add	s1, s1, a2
	mv	s5, a5
	bnez	a1, .LBB0_14
	j	.LBB0_7
.LBB0_15:                               # %for.cond.cleanup
	lw	a3, 0(sp)                       # 4-byte Folded Reload
	addi	a0, a3, -1
	li	a1, 1
	sll	a0, a1, a0
	srai	a1, a0, 31
	add	a0, a0, s5
	sltu	a2, a0, s5
	add	a1, a1, a2
	addi	a2, a3, -32
	add	a7, a7, a1
	bltz	a2, .LBB0_17
# %bb.16:                               # %for.cond.cleanup
	sra	a0, a7, a3
	j	.LBB0_18
.LBB0_17:
	slli	a7, a7, 1
	not	a1, a3
	sll	a1, a7, a1
	srl	a0, a0, a3
	or	a0, a0, a1
.LBB0_18:                               # %for.cond.cleanup
	lw	a1, 4(sp)                       # 4-byte Folded Reload
	li	a7, 0
	sh	a0, 0(a1)
.LBB0_19:                               # %return
	mv	a0, a7
	cm.popret	{ra, s0-s11}, 96
.Lfunc_end0:
	.size	dspi_dotprod_off_s16_ansi, .Lfunc_end0-dspi_dotprod_off_s16_ansi
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
