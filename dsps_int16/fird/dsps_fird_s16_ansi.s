.option	arch, -zcb, +zcmp
# 2024-12-09 11:35:02
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fird_s16_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fird_s16_arp4              # -- Begin function dsps_fird_s16_arp4
	.p2align	1
	.type	dsps_fird_s16_arp4,@function
dsps_fird_s16_arp4:                     # @dsps_fird_s16_arp4
# %bb.0:                                # %entry
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
	mv	s4, a0
	lh	a7, 16(a0)
	lw	s0, 24(a0)
	mv	a0, a3
	bltz	a7, .LBB0_3
# %bb.1:                                # %if.then
	addi	a5, a7, -32
	srai	a4, s0, 31
	bltz	a5, .LBB0_5
# %bb.2:                                # %if.then
	mv	a6, a4
	bgtz	a0, .LBB0_10
	j	.LBB0_6
.LBB0_3:                                # %if.else
	li	a3, -32
	sub	a5, a3, a7
	neg	s1, a7
	bltz	a5, .LBB0_8
# %bb.4:                                # %if.else
	neg	a3, a7
	sll	a4, s0, a3
	j	.LBB0_9
.LBB0_5:
	srl	s1, s0, a7
	not	a5, a7
	slli	a3, a4, 1
	sll	a3, a3, a5
	or	a6, s1, a3
	bgtz	a0, .LBB0_10
.LBB0_6:
	li	a0, 0
.LBB0_7:                                # %for.cond.cleanup
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	lw	s5, 24(sp)                      # 4-byte Folded Reload
	lw	s6, 20(sp)                      # 4-byte Folded Reload
	lw	s7, 16(sp)                      # 4-byte Folded Reload
	lw	s8, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.LBB0_8:
	srai	a6, s0, 31
	addi	a3, a7, 31
	srli	a4, s0, 1
	srl	a3, a4, a3
	sll	a4, a6, s1
	or	a4, a4, a3
.LBB0_9:                                # %if.else
	sll	a3, s0, s1
	srai	a5, a5, 31
	and	a6, a5, a3
	blez	a0, .LBB0_6
.LBB0_10:                               # %for.cond14.preheader.lr.ph
	li	t5, 0
	li	t3, 0
	addi	t0, a7, -15
	andi	t1, a4, 255
	li	t2, 15
	sub	t4, t2, a7
	lui	t6, 16
	addi	t6, t6, -1
	j	.LBB0_12
.LBB0_11:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	slli	a4, t5, 1
	add	a4, a4, a2
	addi	t5, t5, 1
	sh	a3, 0(a4)
	beq	t5, a0, .LBB0_7
.LBB0_12:                               # %for.cond14.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
                                        #     Child Loop BB0_20 Depth 2
                                        #     Child Loop BB0_27 Depth 2
	lh	a3, 12(s4)
	lh	a4, 14(s4)
	bge	a4, a3, .LBB0_18
# %bb.13:                               # %for.body21.lr.ph
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	s2, 4(s4)
	li	a4, 0
	slli	a5, t3, 1
	add	a5, a5, a1
	j	.LBB0_15
.LBB0_14:                               # %if.end28
                                        #   in Loop: Header=BB0_15 Depth=2
	lh	s1, 0(a5)
	addi	s0, a3, 1
	sh	s0, 10(s4)
	slli	a3, a3, 1
	add	a3, a3, s2
	sh	s1, 0(a3)
	lh	a3, 12(s4)
	lh	s0, 14(s4)
	addi	a4, a4, 1
	sub	a3, a3, s0
	addi	a5, a5, 2
	bge	a4, a3, .LBB0_17
.LBB0_15:                               # %for.body21
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	a3, 10(s4)
	lh	s1, 8(s4)
	blt	a3, s1, .LBB0_14
# %bb.16:                               # %if.then26
                                        #   in Loop: Header=BB0_15 Depth=2
	li	a3, 0
	sh	zero, 10(s4)
	j	.LBB0_14
.LBB0_17:                               # %for.cond.cleanup20.loopexit
                                        #   in Loop: Header=BB0_12 Depth=1
	add	t3, t3, a4
.LBB0_18:                               # %for.cond.cleanup20
                                        #   in Loop: Header=BB0_12 Depth=1
	lh	s2, 8(s4)
	lh	s3, 10(s4)
	sh	zero, 14(s4)
	addi	s0, s2, -1
	bge	s3, s2, .LBB0_23
# %bb.19:                               # %for.body46.lr.ph
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	a4, 4(s4)
	lw	s5, 0(s4)
	slli	s1, s3, 1
	add	s1, s1, a4
	slli	a3, s2, 1
	add	s7, a4, a3
	mv	a3, a6
	mv	s6, t1
.LBB0_20:                               # %for.body46
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a5, s0, 16
	srai	a5, a5, 16
	slli	a5, a5, 1
	add	a5, a5, s5
	lh	s8, 0(a5)
	lh	a4, 0(s1)
	mv	a5, a3
	mul	a3, a4, s8
	srai	a4, a3, 31
	add	a3, a3, a5
	sltu	a5, a3, a5
	add	a4, a4, s6
	add	s6, a4, a5
	addi	s1, s1, 2
	addi	s0, s0, -1
	bne	s1, s7, .LBB0_20
# %bb.21:                               # %for.cond58.preheader.loopexit
                                        #   in Loop: Header=BB0_12 Depth=1
	addi	s0, s3, -1
	bgtz	s3, .LBB0_24
.LBB0_22:                               #   in Loop: Header=BB0_12 Depth=1
	mv	s1, a3
	j	.LBB0_28
.LBB0_23:                               #   in Loop: Header=BB0_12 Depth=1
	mv	a3, a6
	mv	s6, t1
	blez	s3, .LBB0_22
.LBB0_24:                               # %for.body64.lr.ph
                                        #   in Loop: Header=BB0_12 Depth=1
	mv	s5, s3
	blt	s3, s2, .LBB0_26
# %bb.25:                               # %for.body64.lr.ph
                                        #   in Loop: Header=BB0_12 Depth=1
	mv	s5, s2
.LBB0_26:                               # %for.body64.lr.ph
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	s2, 0(s4)
	lw	a4, 4(s4)
	not	s1, s3
	add	s1, s1, s5
	and	s3, s1, t6
.LBB0_27:                               # %for.body64
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a5, s0, 16
	srai	a5, a5, 16
	slli	a5, a5, 1
	add	a5, a5, s2
	lh	a5, 0(a5)
	lh	s1, 0(a4)
	addi	s0, s0, -1
	and	s5, s0, t6
	mul	s1, s1, a5
	srai	a5, s1, 31
	add	s1, s1, a3
	sltu	a3, s1, a3
	add	a5, a5, s6
	add	s6, a5, a3
	addi	a4, a4, 2
	mv	a3, s1
	bne	s5, s3, .LBB0_27
.LBB0_28:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	addi	a3, t4, -32
	bltz	a3, .LBB0_30
# %bb.29:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	sra	a3, s6, t4
	bge	t2, a7, .LBB0_11
	j	.LBB0_31
.LBB0_30:                               #   in Loop: Header=BB0_12 Depth=1
	srl	a3, s1, t4
	not	a4, t4
	slli	s6, s6, 1
	sll	a4, s6, a4
	or	a3, a3, a4
	bge	t2, a7, .LBB0_11
.LBB0_31:                               #   in Loop: Header=BB0_12 Depth=1
	sll	a3, s1, t0
	addi	a4, t0, -32
	srai	a4, a4, 31
	and	a3, a3, a4
	j	.LBB0_11
.Lfunc_end0:
	.size	dsps_fird_s16_arp4, .Lfunc_end0-dsps_fird_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
