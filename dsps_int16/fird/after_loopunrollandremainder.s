.option	arch, -zcb, +zcmp
# 2024-12-09 11:36:11
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
	addi	sp, sp, -160
	sw	ra, 156(sp)                     # 4-byte Folded Spill
	sw	s0, 152(sp)                     # 4-byte Folded Spill
	sw	s1, 148(sp)                     # 4-byte Folded Spill
	sw	s2, 144(sp)                     # 4-byte Folded Spill
	sw	s3, 140(sp)                     # 4-byte Folded Spill
	sw	s4, 136(sp)                     # 4-byte Folded Spill
	sw	s5, 132(sp)                     # 4-byte Folded Spill
	sw	s6, 128(sp)                     # 4-byte Folded Spill
	sw	s7, 124(sp)                     # 4-byte Folded Spill
	sw	s8, 120(sp)                     # 4-byte Folded Spill
	sw	s9, 116(sp)                     # 4-byte Folded Spill
	sw	s10, 112(sp)                    # 4-byte Folded Spill
	sw	s11, 108(sp)                    # 4-byte Folded Spill
	mv	a6, a0
	lh	a5, 16(a0)
	lw	s1, 24(a0)
	sw	a2, 56(sp)                      # 4-byte Folded Spill
	sw	a1, 20(sp)                      # 4-byte Folded Spill
	bltz	a5, .LBB0_5
# %bb.1:                                # %if.then
	addi	a2, a5, -32
	srai	a1, s1, 31
	bltz	a2, .LBB0_7
# %bb.2:                                # %if.then
	sw	a1, 76(sp)                      # 4-byte Folded Spill
	bgtz	a3, .LBB0_10
.LBB0_3:
	li	a0, 0
.LBB0_4:                                # %for.cond.cleanup
	lw	ra, 156(sp)                     # 4-byte Folded Reload
	lw	s0, 152(sp)                     # 4-byte Folded Reload
	lw	s1, 148(sp)                     # 4-byte Folded Reload
	lw	s2, 144(sp)                     # 4-byte Folded Reload
	lw	s3, 140(sp)                     # 4-byte Folded Reload
	lw	s4, 136(sp)                     # 4-byte Folded Reload
	lw	s5, 132(sp)                     # 4-byte Folded Reload
	lw	s6, 128(sp)                     # 4-byte Folded Reload
	lw	s7, 124(sp)                     # 4-byte Folded Reload
	lw	s8, 120(sp)                     # 4-byte Folded Reload
	lw	s9, 116(sp)                     # 4-byte Folded Reload
	lw	s10, 112(sp)                    # 4-byte Folded Reload
	lw	s11, 108(sp)                    # 4-byte Folded Reload
	addi	sp, sp, 160
	ret
.LBB0_5:                                # %if.else
	li	a1, -32
	sub	a2, a1, a5
	neg	a0, a5
	bltz	a2, .LBB0_8
# %bb.6:                                # %if.else
	neg	a1, a5
	sll	a1, s1, a1
	j	.LBB0_9
.LBB0_7:
	srl	a2, s1, a5
	not	a0, a5
	slli	a4, a1, 1
	sll	a0, a4, a0
	or	a0, a0, a2
	sw	a0, 76(sp)                      # 4-byte Folded Spill
	bgtz	a3, .LBB0_10
	j	.LBB0_3
.LBB0_8:
	srai	a1, s1, 31
	addi	s0, a5, 31
	srli	a4, s1, 1
	srl	a4, a4, s0
	sll	a1, a1, a0
	or	a1, a1, a4
.LBB0_9:                                # %if.else
	sll	a0, s1, a0
	srai	a2, a2, 31
	and	a0, a0, a2
	sw	a0, 76(sp)                      # 4-byte Folded Spill
	blez	a3, .LBB0_3
.LBB0_10:                               # %for.cond14.preheader.lr.ph
	li	a2, 0
	sw	zero, 40(sp)                    # 4-byte Folded Spill
	lw	a7, 0(a6)
	addi	a0, a5, -15
	sw	a0, 16(sp)                      # 4-byte Folded Spill
	andi	a0, a1, 255
	sw	a0, 72(sp)                      # 4-byte Folded Spill
	lh	a4, 12(a6)
	lw	t0, 4(a6)
	lh	t1, 8(a6)
	li	a0, 15
	sub	a0, a0, a5
	sw	a0, 32(sp)                      # 4-byte Folded Spill
	addi	a0, t0, 16
	sw	a0, 28(sp)                      # 4-byte Folded Spill
	slli	s7, t1, 1
	add	s7, s7, t0
	sw	s7, 12(sp)                      # 4-byte Folded Spill
	addi	a0, t1, -1
	sw	a0, 60(sp)                      # 4-byte Folded Spill
	addi	t2, t1, -15
	lui	a1, 8
	addi	a1, a1, -16
	sw	a1, 8(sp)                       # 4-byte Folded Spill
	lui	s8, 16
	addi	s8, s8, -1
	sw	s8, 96(sp)                      # 4-byte Folded Spill
	sw	a3, 52(sp)                      # 4-byte Folded Spill
	sw	a5, 44(sp)                      # 4-byte Folded Spill
	sw	a7, 104(sp)                     # 4-byte Folded Spill
	sw	a4, 36(sp)                      # 4-byte Folded Spill
	sw	t0, 68(sp)                      # 4-byte Folded Spill
	sw	t1, 64(sp)                      # 4-byte Folded Spill
	sw	t2, 92(sp)                      # 4-byte Folded Spill
	sw	a6, 48(sp)                      # 4-byte Folded Spill
	j	.LBB0_12
.LBB0_11:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	a3, 84(sp)                      # 4-byte Folded Reload
	slli	a0, a3, 1
	lw	a2, 56(sp)                      # 4-byte Folded Reload
	add	a0, a0, a2
	addi	a2, a3, 1
	sh	a1, 0(a0)
	lw	a0, 52(sp)                      # 4-byte Folded Reload
	lw	a4, 36(sp)                      # 4-byte Folded Reload
	beq	a2, a0, .LBB0_4
.LBB0_12:                               # %for.cond14.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
                                        #     Child Loop BB0_20 Depth 2
                                        #     Child Loop BB0_23 Depth 2
                                        #     Child Loop BB0_28 Depth 2
                                        #     Child Loop BB0_31 Depth 2
	sw	a2, 84(sp)                      # 4-byte Folded Spill
	lh	a3, 14(a6)
	bge	a3, a4, .LBB0_18
# %bb.13:                               # %for.body21.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	li	a1, 0
	lw	s0, 40(sp)                      # 4-byte Folded Reload
	slli	a2, s0, 1
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	add	a2, a2, a0
	sub	a3, a4, a3
	j	.LBB0_15
.LBB0_14:                               # %if.end28
                                        #   in Loop: Header=BB0_15 Depth=2
	lh	a5, 0(a2)
	addi	a4, s1, 1
	sh	a4, 10(a6)
	slli	s1, s1, 1
	add	s1, s1, t0
	sh	a5, 0(s1)
	addi	a1, a1, 1
	addi	a2, a2, 2
	bge	a1, a3, .LBB0_17
.LBB0_15:                               # %for.body21
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	s1, 10(a6)
	blt	s1, t1, .LBB0_14
# %bb.16:                               # %if.then26
                                        #   in Loop: Header=BB0_15 Depth=2
	li	s1, 0
	sh	zero, 10(a6)
	j	.LBB0_14
.LBB0_17:                               # %for.cond.cleanup20.loopexit
                                        #   in Loop: Header=BB0_12 Depth=1
	add	s0, s0, a1
	sw	s0, 40(sp)                      # 4-byte Folded Spill
.LBB0_18:                               # %for.cond.cleanup20
                                        #   in Loop: Header=BB0_12 Depth=1
	lh	a1, 10(a6)
	sh	zero, 14(a6)
	slli	a0, a1, 1
	sw	a0, 80(sp)                      # 4-byte Folded Spill
	lw	s5, 76(sp)                      # 4-byte Folded Reload
	lw	s9, 72(sp)                      # 4-byte Folded Reload
	lw	s10, 60(sp)                     # 4-byte Folded Reload
	mv	s0, a1
	sw	a1, 88(sp)                      # 4-byte Folded Spill
	bge	a1, t2, .LBB0_21
# %bb.19:                               # %for.body46.15.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	a1, 28(sp)                      # 4-byte Folded Reload
	lw	a0, 80(sp)                      # 4-byte Folded Reload
	add	a1, a1, a0
	lw	s10, 60(sp)                     # 4-byte Folded Reload
	lw	s0, 88(sp)                      # 4-byte Folded Reload
	lw	s5, 76(sp)                      # 4-byte Folded Reload
	lw	s9, 72(sp)                      # 4-byte Folded Reload
.LBB0_20:                               # %for.body46.15
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	s0, 100(sp)                     # 4-byte Folded Spill
	slli	a2, s10, 16
	srai	a2, a2, 16
	slli	a2, a2, 1
	add	s1, a7, a2
	lh	a6, 0(s1)
	lh	a3, -16(a1)
	lh	t0, -2(s1)
	lh	a2, -14(a1)
	lh	a7, -4(s1)
	lh	a4, -12(a1)
	lh	t2, -6(s1)
	lh	t3, -10(a1)
	lh	t6, -8(s1)
	lh	s2, -8(a1)
	lh	s3, -10(s1)
	lh	s4, -6(a1)
	lh	s6, -12(s1)
	lh	t4, -4(a1)
	lh	s7, -14(s1)
	lh	s8, -2(a1)
	lh	s11, -16(s1)
	lh	t5, 0(a1)
	lh	ra, -18(s1)
	mul	t1, a3, a6
	lh	a0, 2(a1)
	mul	a6, a2, t0
	lh	t0, -20(s1)
	mul	a2, a4, a7
	lh	a5, 4(a1)
	mul	a4, t3, t2
	lh	a7, -22(s1)
	mul	a3, s2, t6
	lh	t6, 6(a1)
	mul	t3, s4, s3
	lh	s2, -24(s1)
	mul	s4, t4, s6
	lh	t4, 8(a1)
	mul	s3, s8, s7
	lh	s6, -26(s1)
	mul	t2, t5, s11
	lh	t5, 10(a1)
	mul	s8, a0, ra
	lh	s7, -28(s1)
	mul	t0, a5, t0
	lh	a5, 12(a1)
	lh	s1, -30(s1)
	mul	a7, t6, a7
	lh	a0, 14(a1)
	mul	t4, t4, s2
	mul	t6, t5, s6
	mul	s6, a5, s7
	mul	s2, a0, s1
	srai	a0, t1, 31
	add	a0, a0, s9
	add	s0, t1, s5
	sltu	a5, s0, t1
	add	a0, a0, a5
	srai	a5, a6, 31
	add	a0, a0, a5
	srai	a5, a2, 31
	add	a6, a6, s0
	sltu	s1, a6, s0
	add	a5, a5, s1
	add	a0, a0, a5
	srai	a5, a4, 31
	add	a2, a2, a6
	sltu	s1, a2, a6
	lw	s0, 100(sp)                     # 4-byte Folded Reload
	add	a5, a5, s1
	add	a0, a0, a5
	srai	a5, a3, 31
	add	a4, a4, a2
	sltu	a2, a4, a2
	add	a2, a2, a5
	add	a0, a0, a2
	srai	a2, t3, 31
	add	a3, a3, a4
	sltu	a4, a3, a4
	add	a2, a2, a4
	add	a0, a0, a2
	srai	a2, s4, 31
	add	s5, a3, t3
	sltu	a3, s5, a3
	add	a2, a2, a3
	add	a0, a0, a2
	srai	a2, s3, 31
	add	s4, s4, s5
	sltu	a3, s4, s5
	add	a2, a2, a3
	add	a0, a0, a2
	srai	a2, t2, 31
	add	s3, s3, s4
	sltu	a3, s3, s4
	add	a2, a2, a3
	add	a0, a0, a2
	srai	a2, s8, 31
	add	t2, t2, s3
	sltu	a3, t2, s3
	add	a2, a2, a3
	add	a0, a0, a2
	srai	a2, t0, 31
	add	t3, t2, s8
	sltu	a3, t3, t2
	lw	t2, 92(sp)                      # 4-byte Folded Reload
	add	a2, a2, a3
	add	a0, a0, a2
	srai	a2, a7, 31
	add	t0, t0, t3
	sltu	a3, t0, t3
	add	a2, a2, a3
	add	a0, a0, a2
	srai	a2, t4, 31
	add	a7, a7, t0
	sltu	a3, a7, t0
	add	a2, a2, a3
	add	a0, a0, a2
	srai	a2, t6, 31
	add	t4, t4, a7
	sltu	a3, t4, a7
	lw	a7, 104(sp)                     # 4-byte Folded Reload
	add	a2, a2, a3
	add	a0, a0, a2
	srai	a2, s6, 31
	add	t6, t6, t4
	sltu	a3, t6, t4
	add	a2, a2, a3
	add	a0, a0, a2
	srai	a2, s2, 31
	add	s6, s6, t6
	sltu	a3, s6, t6
	add	a2, a2, a3
	add	a0, a0, a2
	add	s5, s6, s2
	sltu	s9, s5, s6
	add	s9, s9, a0
	addi	s0, s0, 16
	addi	s10, s10, -16
	addi	a1, a1, 32
	blt	s0, t2, .LBB0_20
.LBB0_21:                               # %for.cond58.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	t1, 64(sp)                      # 4-byte Folded Reload
	bge	s0, t1, .LBB0_26
# %bb.22:                               # %for.body46.clone.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	slli	a1, s0, 1
	lw	t0, 68(sp)                      # 4-byte Folded Reload
	add	a1, a1, t0
	mv	a2, s10
	lw	a4, 12(sp)                      # 4-byte Folded Reload
	lw	a5, 96(sp)                      # 4-byte Folded Reload
.LBB0_23:                               # %for.body46.clone
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a0, a2, 16
	srai	a0, a0, 16
	slli	a0, a0, 1
	add	a0, a0, a7
	lh	a0, 0(a0)
	lh	a3, 0(a1)
	mul	a0, a3, a0
	srai	a3, a0, 31
	add	s5, s5, a0
	sltu	a0, s5, a0
	add	a3, a3, s9
	add	s9, a3, a0
	addi	a1, a1, 2
	addi	a2, a2, -1
	bne	a1, a4, .LBB0_23
# %bb.24:                               # %for.cond227.preheader.loopexit
                                        #   in Loop: Header=BB0_12 Depth=1
	sub	s10, s10, t1
	add	s10, s10, s0
	li	a0, 16
	lw	a1, 88(sp)                      # 4-byte Folded Reload
	bge	a1, a0, .LBB0_27
.LBB0_25:                               #   in Loop: Header=BB0_12 Depth=1
	li	a0, 0
	lw	a6, 48(sp)                      # 4-byte Folded Reload
	lw	a4, 44(sp)                      # 4-byte Folded Reload
	bgtz	a1, .LBB0_30
	j	.LBB0_32
.LBB0_26:                               #   in Loop: Header=BB0_12 Depth=1
	lw	t0, 68(sp)                      # 4-byte Folded Reload
	lw	a5, 96(sp)                      # 4-byte Folded Reload
	li	a0, 16
	lw	a1, 88(sp)                      # 4-byte Folded Reload
	blt	a1, a0, .LBB0_25
.LBB0_27:                               # %for.body233.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	a0, 8(sp)                       # 4-byte Folded Reload
	and	a0, a0, a1
	sw	a0, 24(sp)                      # 4-byte Folded Spill
	addi	a0, a1, -16
	andi	a0, a0, -16
	sub	a0, s10, a0
	addi	a0, a0, -16
	and	a0, a0, a5
	sw	a0, 100(sp)                     # 4-byte Folded Spill
	lw	s2, 28(sp)                      # 4-byte Folded Reload
.LBB0_28:                               # %for.body64.15
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a0, s10, 16
	srai	a0, a0, 16
	slli	a0, a0, 1
	add	a0, a0, a7
	lh	a7, 0(a0)
	lh	a3, -16(s2)
	lh	t2, -2(a0)
	lh	a5, -14(s2)
	lh	s1, -4(a0)
	lh	a1, -12(s2)
	lh	a6, -6(a0)
	lh	a2, -10(s2)
	lh	t0, -8(a0)
	lh	a4, -8(s2)
	lh	t3, -10(a0)
	lh	t4, -6(s2)
	lh	t5, -12(a0)
	lh	t6, -4(s2)
	lh	s6, -14(a0)
	lh	s7, -2(s2)
	lh	s8, -16(a0)
	lh	s11, 0(s2)
	lh	ra, -18(a0)
	mul	t1, a3, a7
	lh	a3, 2(s2)
	mul	a5, a5, t2
	lh	a7, -20(a0)
	mul	s1, a1, s1
	lh	a1, 4(s2)
	mul	t2, a2, a6
	lh	a6, -22(a0)
	mul	s4, a4, t0
	lh	a4, 6(s2)
	mul	s3, t4, t3
	lh	t4, -24(a0)
	mul	t6, t6, t5
	lh	t5, 8(s2)
	mul	t3, s7, s6
	lh	s6, -26(a0)
	mul	t0, s11, s8
	lh	a2, 10(s2)
	mul	s7, a3, ra
	lh	a3, -28(a0)
	mul	a7, a1, a7
	lh	a1, 12(s2)
	lh	a0, -30(a0)
	mul	s8, a4, a6
	lh	a4, 14(s2)
	mul	a6, t5, t4
	mul	a2, a2, s6
	mul	a1, a1, a3
	mul	s6, a4, a0
	srai	a0, t1, 31
	add	a0, a0, s9
	add	s0, t1, s5
	sltu	a3, s0, t1
	add	a0, a0, a3
	srai	a3, a5, 31
	add	a0, a0, a3
	srai	a3, s1, 31
	add	a5, a5, s0
	sltu	a4, a5, s0
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, t2, 31
	add	s1, s1, a5
	sltu	a4, s1, a5
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, s4, 31
	add	s5, s1, t2
	sltu	a4, s5, s1
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, s3, 31
	add	s4, s4, s5
	sltu	a4, s4, s5
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, t6, 31
	add	s3, s3, s4
	sltu	a4, s3, s4
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, t3, 31
	add	t2, s3, t6
	sltu	a4, t2, s3
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, t0, 31
	add	t3, t3, t2
	sltu	a4, t3, t2
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, s7, 31
	add	t0, t0, t3
	sltu	a4, t0, t3
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, a7, 31
	add	s7, s7, t0
	sltu	a4, s7, t0
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, s8, 31
	add	a7, a7, s7
	sltu	a4, a7, s7
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, a6, 31
	add	t6, a7, s8
	sltu	a4, t6, a7
	lw	a7, 104(sp)                     # 4-byte Folded Reload
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, a2, 31
	add	a6, a6, t6
	sltu	a4, a6, t6
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, a1, 31
	add	a2, a2, a6
	sltu	a4, a2, a6
	add	a3, a3, a4
	add	a0, a0, a3
	srai	a3, s6, 31
	add	a1, a1, a2
	sltu	a2, a1, a2
	add	a2, a2, a3
	add	a0, a0, a2
	addi	s10, s10, -16
	add	s5, a1, s6
	sltu	s9, s5, a1
	add	s9, s9, a0
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	and	a0, s10, a0
	addi	s2, s2, 32
	lw	a1, 100(sp)                     # 4-byte Folded Reload
	bne	a0, a1, .LBB0_28
# %bb.29:                               #   in Loop: Header=BB0_12 Depth=1
	lw	a6, 48(sp)                      # 4-byte Folded Reload
	lw	a4, 44(sp)                      # 4-byte Folded Reload
	lw	t0, 68(sp)                      # 4-byte Folded Reload
	lw	t1, 64(sp)                      # 4-byte Folded Reload
	lw	t2, 92(sp)                      # 4-byte Folded Reload
	lw	a1, 88(sp)                      # 4-byte Folded Reload
	lw	a0, 24(sp)                      # 4-byte Folded Reload
	bge	a0, a1, .LBB0_32
.LBB0_30:                               # %for.body64.clone.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	slli	a1, a0, 1
	add	a1, a1, t0
	lw	a2, 80(sp)                      # 4-byte Folded Reload
	add	a2, a2, t0
.LBB0_31:                               # %for.body64.clone
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a0, s10, 16
	srai	a0, a0, 16
	slli	a0, a0, 1
	add	a0, a0, a7
	lh	a0, 0(a0)
	lh	a3, 0(a1)
	addi	s10, s10, -1
	mul	a0, a3, a0
	srai	a3, a0, 31
	add	s5, s5, a0
	sltu	a0, s5, a0
	add	a3, a3, s9
	addi	a1, a1, 2
	add	s9, a3, a0
	bne	a1, a2, .LBB0_31
.LBB0_32:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	a1, 32(sp)                      # 4-byte Folded Reload
	addi	a0, a1, -32
	bltz	a0, .LBB0_34
# %bb.33:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	sra	a1, s9, a1
	li	a0, 15
	bge	a0, a4, .LBB0_11
	j	.LBB0_35
.LBB0_34:                               #   in Loop: Header=BB0_12 Depth=1
	srl	a0, s5, a1
	not	a1, a1
	slli	s9, s9, 1
	sll	a1, s9, a1
	or	a1, a1, a0
	li	a0, 15
	bge	a0, a4, .LBB0_11
.LBB0_35:                               #   in Loop: Header=BB0_12 Depth=1
	lw	a1, 16(sp)                      # 4-byte Folded Reload
	sll	a0, s5, a1
	addi	a1, a1, -32
	srai	a1, a1, 31
	and	a1, a1, a0
	j	.LBB0_11
.Lfunc_end0:
	.size	dsps_fird_s16_arp4, .Lfunc_end0-dsps_fird_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
