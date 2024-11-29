.option	arch, -zcb, +zcmp
# 2024-11-29 18:55:44
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fird_s16_arp4-best.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fird_s16_arp4              # -- Begin function dsps_fird_s16_arp4
	.p2align	1
	.type	dsps_fird_s16_arp4,@function
dsps_fird_s16_arp4:                     # @dsps_fird_s16_arp4
# %bb.0:                                # %entry
	addi	sp, sp, -80
	sw	ra, 76(sp)                      # 4-byte Folded Spill
	sw	s0, 72(sp)                      # 4-byte Folded Spill
	sw	s1, 68(sp)                      # 4-byte Folded Spill
	sw	s2, 64(sp)                      # 4-byte Folded Spill
	sw	s3, 60(sp)                      # 4-byte Folded Spill
	sw	s4, 56(sp)                      # 4-byte Folded Spill
	sw	s5, 52(sp)                      # 4-byte Folded Spill
	sw	s6, 48(sp)                      # 4-byte Folded Spill
	sw	s7, 44(sp)                      # 4-byte Folded Spill
	sw	s8, 40(sp)                      # 4-byte Folded Spill
	sw	s9, 36(sp)                      # 4-byte Folded Spill
	sw	s10, 32(sp)                     # 4-byte Folded Spill
	sw	s11, 28(sp)                     # 4-byte Folded Spill
	lh	a4, 16(a0)
	lw	s0, 24(a0)
	sw	a2, 24(sp)                      # 4-byte Folded Spill
	sw	a1, 8(sp)                       # 4-byte Folded Spill
	bltz	a4, .LBB0_3
# %bb.1:                                # %if.then
	addi	a1, a4, -32
	srai	s1, s0, 31
	bltz	a1, .LBB0_5
# %bb.2:                                # %if.then
	mv	t6, s1
	bgtz	a3, .LBB0_10
	j	.LBB0_6
.LBB0_3:                                # %if.else
	li	a1, -32
	sub	a2, a1, a4
	neg	a1, a4
	bltz	a2, .LBB0_8
# %bb.4:                                # %if.else
	neg	a5, a4
	sll	s1, s0, a5
	j	.LBB0_9
.LBB0_5:
	srl	a2, s0, a4
	not	a5, a4
	slli	a1, s1, 1
	sll	a1, a1, a5
	or	t6, a2, a1
	bgtz	a3, .LBB0_10
.LBB0_6:
	li	a4, 0
.LBB0_7:                                # %for.cond.cleanup
	mv	a0, a4
	lw	ra, 76(sp)                      # 4-byte Folded Reload
	lw	s0, 72(sp)                      # 4-byte Folded Reload
	lw	s1, 68(sp)                      # 4-byte Folded Reload
	lw	s2, 64(sp)                      # 4-byte Folded Reload
	lw	s3, 60(sp)                      # 4-byte Folded Reload
	lw	s4, 56(sp)                      # 4-byte Folded Reload
	lw	s5, 52(sp)                      # 4-byte Folded Reload
	lw	s6, 48(sp)                      # 4-byte Folded Reload
	lw	s7, 44(sp)                      # 4-byte Folded Reload
	lw	s8, 40(sp)                      # 4-byte Folded Reload
	lw	s9, 36(sp)                      # 4-byte Folded Reload
	lw	s10, 32(sp)                     # 4-byte Folded Reload
	lw	s11, 28(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 80
	ret
.LBB0_8:
	srai	s1, s0, 31
	addi	a7, a4, 31
	srli	a5, s0, 1
	srl	a5, a5, a7
	sll	s1, s1, a1
	or	s1, s1, a5
.LBB0_9:                                # %if.else
	sll	a1, s0, a1
	srai	a2, a2, 31
	and	t6, a2, a1
	blez	a3, .LBB0_6
.LBB0_10:                               # %for.cond14.preheader.lr.ph
	li	t3, 0
	li	t1, 0
	addi	a1, a4, -15
	sw	a1, 4(sp)                       # 4-byte Folded Spill
	andi	t2, s1, 255
	lh	t4, 12(a0)
	lh	ra, 8(a0)
	lw	t5, 4(a0)
	lw	s6, 0(a0)
	li	a1, 15
	sub	s4, a1, a4
	addi	a1, t5, 16
	sw	a1, 12(sp)                      # 4-byte Folded Spill
	slli	s7, ra, 1
	add	s7, s7, t5
	addi	a6, ra, -1
	addi	s11, ra, -15
	lui	a1, 8
	addi	a1, a1, -16
	sw	a1, 0(sp)                       # 4-byte Folded Spill
	lui	s8, 16
	addi	s8, s8, -1
	sw	a3, 20(sp)                      # 4-byte Folded Spill
	sw	a4, 16(sp)                      # 4-byte Folded Spill
	j	.LBB0_12
.LBB0_11:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	slli	a1, t3, 1
	lw	a2, 24(sp)                      # 4-byte Folded Reload
	add	a1, a1, a2
	addi	t3, t3, 1
	sh	a3, 0(a1)
	beq	t3, a4, .LBB0_7
.LBB0_12:                               # %for.cond14.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
                                        #     Child Loop BB0_20 Depth 2
                                        #     Child Loop BB0_23 Depth 2
                                        #     Child Loop BB0_27 Depth 2
                                        #     Child Loop BB0_30 Depth 2
	lh	a1, 14(a0)
	bge	a1, t4, .LBB0_18
# %bb.13:                               # %for.body21.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	li	a1, 0
	slli	a3, t1, 1
	lw	a2, 8(sp)                       # 4-byte Folded Reload
	add	a3, a3, a2
	j	.LBB0_15
.LBB0_14:                               # %if.end28
                                        #   in Loop: Header=BB0_15 Depth=2
	lh	s1, 0(a3)
	addi	a5, s0, 1
	sh	a5, 10(a0)
	slli	s0, s0, 1
	lh	a5, 14(a0)
	add	s0, s0, t5
	sh	s1, 0(s0)
	addi	a1, a1, 1
	sub	a5, t4, a5
	addi	a3, a3, 2
	bge	a1, a5, .LBB0_17
.LBB0_15:                               # %for.body21
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	s0, 10(a0)
	blt	s0, ra, .LBB0_14
# %bb.16:                               # %if.then26
                                        #   in Loop: Header=BB0_15 Depth=2
	li	s0, 0
	sh	zero, 10(a0)
	j	.LBB0_14
.LBB0_17:                               # %for.cond.cleanup20.loopexit
                                        #   in Loop: Header=BB0_12 Depth=1
	add	t1, t1, a1
.LBB0_18:                               # %for.cond.cleanup20
                                        #   in Loop: Header=BB0_12 Depth=1
	lh	s9, 10(a0)
	sh	zero, 14(a0)
	slli	s5, s9, 1
	mv	a7, t6
	mv	a5, t2
	mv	s3, a6
	mv	s10, s9
	bge	s9, s11, .LBB0_21
# %bb.19:                               # %for.body46.15.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	s2, 12(sp)                      # 4-byte Folded Reload
	add	s2, s2, s5
	mv	s10, s9
	mv	s3, a6
	mv	a7, t6
	mv	a5, t2
.LBB0_20:                               # %for.body46.15
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a1, s3, 16
	srai	a1, a1, 16
	slli	a1, a1, 1
	add	a1, a1, s6
	lh	a3, 0(a1)
	lh	t0, -16(s2)
	mul	a3, t0, a3
	srai	a2, a3, 31
	add	a3, a3, a7
	lh	a4, -2(a1)
	lh	s0, -14(s2)
	sltu	s1, a3, a7
	add	a2, a2, a5
	add	a2, a2, s1
	mul	a4, s0, a4
	srai	a5, a4, 31
	lh	s1, -4(a1)
	lh	s0, -12(s2)
	add	a4, a4, a3
	sltu	a3, a4, a3
	add	a2, a2, a5
	mul	s1, s0, s1
	srai	a5, s1, 31
	add	a3, a3, a5
	lh	a5, -6(a1)
	lh	s0, -10(s2)
	add	s1, s1, a4
	sltu	a4, s1, a4
	add	a2, a2, a3
	mul	a3, s0, a5
	srai	a5, a3, 31
	add	a4, a4, a5
	lh	a5, -8(a1)
	lh	s0, -8(s2)
	add	a2, a2, a4
	add	a3, a3, s1
	sltu	a4, a3, s1
	mul	s1, s0, a5
	srai	a5, s1, 31
	add	a4, a4, a5
	lh	a5, -10(a1)
	lh	s0, -6(s2)
	add	a2, a2, a4
	add	s1, s1, a3
	sltu	a3, s1, a3
	mul	a4, s0, a5
	srai	a5, a4, 31
	add	a3, a3, a5
	lh	a5, -12(a1)
	lh	s0, -4(s2)
	add	a2, a2, a3
	add	a4, a4, s1
	sltu	a3, a4, s1
	mul	s1, s0, a5
	srai	a5, s1, 31
	add	a3, a3, a5
	lh	a5, -14(a1)
	lh	s0, -2(s2)
	add	a2, a2, a3
	add	s1, s1, a4
	sltu	a3, s1, a4
	mul	a4, s0, a5
	srai	a5, a4, 31
	add	a3, a3, a5
	lh	a5, -16(a1)
	lh	s0, 0(s2)
	add	a2, a2, a3
	add	a4, a4, s1
	sltu	a3, a4, s1
	mul	s1, s0, a5
	srai	a5, s1, 31
	add	a3, a3, a5
	lh	a5, -18(a1)
	lh	s0, 2(s2)
	add	a2, a2, a3
	add	s1, s1, a4
	sltu	a3, s1, a4
	mul	a4, s0, a5
	srai	a5, a4, 31
	add	a3, a3, a5
	lh	a5, -20(a1)
	lh	s0, 4(s2)
	add	a2, a2, a3
	add	a4, a4, s1
	sltu	a3, a4, s1
	mul	s1, s0, a5
	srai	a5, s1, 31
	add	a3, a3, a5
	lh	a5, -22(a1)
	lh	s0, 6(s2)
	add	a2, a2, a3
	add	s1, s1, a4
	sltu	a3, s1, a4
	mul	a4, s0, a5
	srai	a5, a4, 31
	add	a3, a3, a5
	lh	a5, -24(a1)
	lh	s0, 8(s2)
	add	a2, a2, a3
	add	a4, a4, s1
	sltu	a3, a4, s1
	mul	s1, s0, a5
	srai	a5, s1, 31
	add	a3, a3, a5
	lh	a5, -26(a1)
	lh	s0, 10(s2)
	add	a2, a2, a3
	add	s1, s1, a4
	sltu	a3, s1, a4
	mul	a4, s0, a5
	srai	a5, a4, 31
	add	a3, a3, a5
	lh	a5, -28(a1)
	lh	s0, 12(s2)
	add	a2, a2, a3
	add	a4, a4, s1
	sltu	a3, a4, s1
	mul	s1, s0, a5
	srai	a5, s1, 31
	add	a3, a3, a5
	lh	a1, -30(a1)
	lh	a5, 14(s2)
	add	a2, a2, a3
	add	s1, s1, a4
	sltu	a3, s1, a4
	mul	a7, a5, a1
	srai	a1, a7, 31
	add	a1, a1, a3
	add	a1, a1, a2
	add	a7, a7, s1
	sltu	a5, a7, s1
	add	a5, a5, a1
	addi	s3, s3, -16
	addi	s10, s10, 16
	addi	s2, s2, 32
	blt	s10, s11, .LBB0_20
.LBB0_21:                               # %for.cond58.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	bge	s10, ra, .LBB0_25
# %bb.22:                               # %for.body64.lr.ph
                                        #   in Loop: Header=BB0_12 Depth=1
	slli	a1, s10, 1
	add	a1, a1, t5
	mv	a3, s3
.LBB0_23:                               # %for.body46.clone
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a2, a3, 16
	srai	a2, a2, 16
	slli	a2, a2, 1
	add	a2, a2, s6
	lh	a2, 0(a2)
	lh	a4, 0(a1)
	mv	s1, a7
	mul	a7, a4, a2
	srai	a2, a7, 31
	add	a7, a7, s1
	sltu	a4, a7, s1
	add	a2, a2, a5
	add	a5, a2, a4
	addi	a1, a1, 2
	addi	a3, a3, -1
	bne	a1, s7, .LBB0_23
# %bb.24:                               # %for.cond227.preheader.loopexit
                                        #   in Loop: Header=BB0_12 Depth=1
	sub	s3, s3, ra
	add	s3, s3, s10
.LBB0_25:                               # %for.cond227.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	li	a1, 16
	blt	s9, a1, .LBB0_33
# %bb.26:                               # %for.body233.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	a1, 0(sp)                       # 4-byte Folded Reload
	and	s2, s9, a1
	addi	a1, s9, -16
	andi	a1, a1, -16
	sub	a1, s3, a1
	addi	a1, a1, -16
	and	t0, a1, s8
	lw	s0, 12(sp)                      # 4-byte Folded Reload
.LBB0_27:                               # %for.body64.15
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a2, s3, 16
	srai	a2, a2, 16
	slli	a2, a2, 1
	add	a3, s6, a2
	lh	a2, 0(a3)
	lh	a4, -16(s0)
	mul	a2, a4, a2
	srai	s10, a2, 31
	add	a2, a2, a7
	lh	s1, -2(a3)
	lh	a1, -14(s0)
	sltu	a4, a2, a7
	add	a5, a5, s10
	add	a7, a5, a4
	mul	a1, a1, s1
	srai	a5, a1, 31
	lh	s1, -4(a3)
	lh	a4, -12(s0)
	add	a1, a1, a2
	sltu	a2, a1, a2
	add	a7, a7, a5
	mul	s1, a4, s1
	srai	a4, s1, 31
	add	a2, a2, a4
	lh	a4, -6(a3)
	lh	a5, -10(s0)
	add	s1, s1, a1
	sltu	a1, s1, a1
	add	a7, a7, a2
	mul	a4, a5, a4
	srai	a5, a4, 31
	add	a1, a1, a5
	lh	a5, -8(a3)
	lh	a2, -8(s0)
	add	a7, a7, a1
	add	a4, a4, s1
	sltu	s1, a4, s1
	mul	a2, a2, a5
	srai	a5, a2, 31
	add	a5, a5, s1
	lh	s1, -10(a3)
	lh	a1, -6(s0)
	add	a7, a7, a5
	add	a2, a2, a4
	sltu	a4, a2, a4
	mul	s1, a1, s1
	srai	a1, s1, 31
	add	a1, a1, a4
	lh	a4, -12(a3)
	lh	a5, -4(s0)
	add	a7, a7, a1
	add	s1, s1, a2
	sltu	a2, s1, a2
	mul	a4, a5, a4
	srai	a5, a4, 31
	add	a2, a2, a5
	lh	a5, -14(a3)
	lh	a1, -2(s0)
	add	a7, a7, a2
	add	a4, a4, s1
	sltu	s1, a4, s1
	mul	a1, a1, a5
	srai	a5, a1, 31
	add	a5, a5, s1
	lh	s1, -16(a3)
	lh	a2, 0(s0)
	add	a7, a7, a5
	add	a1, a1, a4
	sltu	a4, a1, a4
	mul	s1, a2, s1
	srai	a2, s1, 31
	add	a2, a2, a4
	lh	a4, -18(a3)
	lh	a5, 2(s0)
	add	a7, a7, a2
	add	s1, s1, a1
	sltu	a1, s1, a1
	mul	a4, a5, a4
	srai	a5, a4, 31
	add	a1, a1, a5
	lh	a5, -20(a3)
	lh	a2, 4(s0)
	add	a7, a7, a1
	add	a4, a4, s1
	sltu	s1, a4, s1
	mul	a2, a2, a5
	srai	a5, a2, 31
	add	a5, a5, s1
	lh	s1, -22(a3)
	lh	a1, 6(s0)
	add	a7, a7, a5
	add	a2, a2, a4
	sltu	a4, a2, a4
	mul	s1, a1, s1
	srai	a1, s1, 31
	add	a1, a1, a4
	lh	a4, -24(a3)
	lh	a5, 8(s0)
	add	a7, a7, a1
	add	s1, s1, a2
	sltu	a2, s1, a2
	mul	a4, a5, a4
	srai	a5, a4, 31
	add	a2, a2, a5
	lh	a5, -26(a3)
	lh	a1, 10(s0)
	add	a7, a7, a2
	add	a4, a4, s1
	sltu	s1, a4, s1
	mul	a1, a1, a5
	srai	a5, a1, 31
	add	a5, a5, s1
	lh	s1, -28(a3)
	lh	a2, 12(s0)
	add	a5, a5, a7
	add	a1, a1, a4
	sltu	a4, a1, a4
	mul	s1, a2, s1
	srai	a2, s1, 31
	add	a2, a2, a4
	lh	a3, -30(a3)
	lh	a4, 14(s0)
	add	a2, a2, a5
	add	s1, s1, a1
	sltu	a1, s1, a1
	mul	a7, a4, a3
	srai	a3, a7, 31
	add	a1, a1, a3
	add	a1, a1, a2
	add	a7, a7, s1
	sltu	a5, a7, s1
	add	a5, a5, a1
	addi	s3, s3, -16
	and	a1, s3, s8
	addi	s0, s0, 32
	bne	a1, t0, .LBB0_27
# %bb.28:                               # %for.cond398.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	s1, 16(sp)                      # 4-byte Folded Reload
	bge	s2, s9, .LBB0_34
.LBB0_29:                               # %for.body64.clone.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	slli	a3, s2, 1
	add	a3, a3, t5
	add	s9, t5, s5
.LBB0_30:                               # %for.body64.clone
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a1, s3, 16
	srai	a1, a1, 16
	slli	a1, a1, 1
	add	a1, a1, s6
	lh	a1, 0(a1)
	lh	a2, 0(a3)
	addi	s3, s3, -1
	mul	a1, a2, a1
	srai	a2, a1, 31
	add	a1, a1, a7
	sltu	a4, a1, a7
	add	a2, a2, a5
	addi	a3, a3, 2
	add	a5, a2, a4
	mv	a7, a1
	bne	a3, s9, .LBB0_30
# %bb.31:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	addi	a2, s4, -32
	bltz	a2, .LBB0_35
.LBB0_32:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	sra	a3, a5, s4
	lw	a4, 20(sp)                      # 4-byte Folded Reload
	li	a2, 15
	bge	a2, s1, .LBB0_11
	j	.LBB0_36
.LBB0_33:                               #   in Loop: Header=BB0_12 Depth=1
	li	s2, 0
	lw	s1, 16(sp)                      # 4-byte Folded Reload
	bgtz	s9, .LBB0_29
.LBB0_34:                               #   in Loop: Header=BB0_12 Depth=1
	mv	a1, a7
	addi	a2, s4, -32
	bgez	a2, .LBB0_32
.LBB0_35:                               #   in Loop: Header=BB0_12 Depth=1
	srl	a2, a1, s4
	not	a3, s4
	slli	a5, a5, 1
	sll	a3, a5, a3
	or	a3, a3, a2
	lw	a4, 20(sp)                      # 4-byte Folded Reload
	li	a2, 15
	bge	a2, s1, .LBB0_11
.LBB0_36:                               #   in Loop: Header=BB0_12 Depth=1
	lw	a2, 4(sp)                       # 4-byte Folded Reload
	sll	a1, a1, a2
	addi	a2, a2, -32
	srai	a2, a2, 31
	and	a3, a2, a1
	j	.LBB0_11
.Lfunc_end0:
	.size	dsps_fird_s16_arp4, .Lfunc_end0-dsps_fird_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a)"
	.section	".note.GNU-stack","",@progbits
