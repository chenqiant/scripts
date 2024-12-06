	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fird_s16_ansi-best.c"
	.option	push
	.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fird_s16_ansi              # -- Begin function dsps_fird_s16_ansi
	.p2align	1
	.type	dsps_fird_s16_ansi,@function
dsps_fird_s16_ansi:                     # @dsps_fird_s16_ansi
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
	li	a3, 0
.LBB0_7:                                # %for.cond.cleanup
	mv	a0, a3
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
	li	t0, 0
	lw	s5, 0(a0)
	addi	a1, a4, -15
	sw	a1, 4(sp)                       # 4-byte Folded Spill
	andi	t1, s1, 255
	lh	t4, 12(a0)
	lw	t5, 4(a0)
	lh	ra, 8(a0)
	li	a1, 15
	sub	s4, a1, a4
	addi	a1, t5, 16
	sw	a1, 12(sp)                      # 4-byte Folded Spill
	slli	s7, ra, 1
	add	s7, s7, t5
	addi	s6, ra, -1
	addi	s11, ra, -15
	lui	a5, 8
	addi	a5, a5, -16
	sw	a5, 0(sp)                       # 4-byte Folded Spill
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
	sh	s1, 0(a1)
	beq	t3, a3, .LBB0_7
.LBB0_12:                               # %for.cond14.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
                                        #     Child Loop BB0_20 Depth 2
                                        #     Child Loop BB0_23 Depth 2
                                        #     Child Loop BB0_27 Depth 2
                                        #     Child Loop BB0_32 Depth 2
	lh	a5, 14(a0)
	bge	a5, t4, .LBB0_18
# %bb.13:                               # %for.body21.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	li	a5, 0
	slli	s1, t0, 1
	lw	a1, 8(sp)                       # 4-byte Folded Reload
	add	s1, s1, a1
	j	.LBB0_15
.LBB0_14:                               # %if.end28
                                        #   in Loop: Header=BB0_15 Depth=2
	lh	a1, 0(s1)
	addi	s0, a2, 1
	sh	s0, 10(a0)
	slli	a2, a2, 1
	lh	s0, 14(a0)
	add	a2, a2, t5
	sh	a1, 0(a2)
	addi	a5, a5, 1
	sub	a1, t4, s0
	addi	s1, s1, 2
	bge	a5, a1, .LBB0_17
.LBB0_15:                               # %for.body21
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	a2, 10(a0)
	blt	a2, ra, .LBB0_14
# %bb.16:                               # %if.then26
                                        #   in Loop: Header=BB0_15 Depth=2
	li	a2, 0
	sh	zero, 10(a0)
	j	.LBB0_14
.LBB0_17:                               # %for.cond.cleanup20.loopexit
                                        #   in Loop: Header=BB0_12 Depth=1
	add	t0, t0, a5
.LBB0_18:                               # %for.cond.cleanup20
                                        #   in Loop: Header=BB0_12 Depth=1
	lh	s10, 10(a0)
	sh	zero, 14(a0)
	slli	s9, s10, 1
	mv	a7, t6
	mv	t2, t1
	mv	s3, s6
	mv	s2, s10
	bge	s10, s11, .LBB0_21
# %bb.19:                               # %for.body46.15.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	a5, 12(sp)                      # 4-byte Folded Reload
	add	a5, a5, s9
	mv	s3, s6
	mv	s2, s10
	mv	a7, t6
	mv	t2, t1
.LBB0_20:                               # %for.body46.15
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a1, s3, 16
	srai	a1, a1, 16
	slli	a1, a1, 1
	add	a1, a1, s5
	lh	a2, 0(a1)
	lh	s1, -16(a5)
	mul	a2, s1, a2
	srai	s1, a2, 31
	add	a2, a2, a7
	lh	a1, -2(a1)
	lh	a4, -14(a5)
	sltu	s0, a2, a7
	add	t2, t2, s1
	add	t2, t2, s0
	mul	a1, a4, a1
	srai	a4, a1, 31
	addi	s1, s3, -2
	slli	s1, s1, 16
	srai	s1, s1, 16
	slli	s1, s1, 1
	add	s1, s1, s5
	lh	s1, 0(s1)
	lh	s0, -12(a5)
	add	a1, a1, a2
	sltu	a2, a1, a2
	add	a4, a4, t2
	mul	s0, s0, s1
	srai	s1, s0, 31
	add	a2, a2, s1
	addi	s1, s3, -3
	slli	s1, s1, 16
	srai	s1, s1, 16
	slli	s1, s1, 1
	add	s1, s1, s5
	lh	s1, 0(s1)
	lh	a3, -10(a5)
	add	s0, s0, a1
	sltu	a1, s0, a1
	add	a2, a2, a4
	mul	a3, a3, s1
	srai	a4, a3, 31
	add	a1, a1, a4
	addi	a4, s3, -4
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s1, -8(a5)
	add	a1, a1, a2
	add	a3, a3, s0
	sltu	a2, a3, s0
	mul	s1, s1, a4
	srai	a4, s1, 31
	add	a2, a2, a4
	addi	a4, s3, -5
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, -6(a5)
	add	a1, a1, a2
	add	s1, s1, a3
	sltu	a2, s1, a3
	mul	a3, s0, a4
	srai	a4, a3, 31
	add	a2, a2, a4
	addi	a4, s3, -6
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, -4(a5)
	add	a1, a1, a2
	add	a3, a3, s1
	sltu	a2, a3, s1
	mul	s1, s0, a4
	srai	a4, s1, 31
	add	a2, a2, a4
	addi	a4, s3, -7
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, -2(a5)
	add	a1, a1, a2
	add	s1, s1, a3
	sltu	a2, s1, a3
	mul	a3, s0, a4
	srai	a4, a3, 31
	add	a2, a2, a4
	addi	a4, s3, -8
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, 0(a5)
	add	a1, a1, a2
	add	a3, a3, s1
	sltu	a2, a3, s1
	mul	s1, s0, a4
	srai	a4, s1, 31
	add	a2, a2, a4
	addi	a4, s3, -9
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, 2(a5)
	add	a1, a1, a2
	add	s1, s1, a3
	sltu	a2, s1, a3
	mul	a3, s0, a4
	srai	a4, a3, 31
	add	a2, a2, a4
	addi	a4, s3, -10
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, 4(a5)
	add	a1, a1, a2
	add	a3, a3, s1
	sltu	a2, a3, s1
	mul	s1, s0, a4
	srai	a4, s1, 31
	add	a2, a2, a4
	addi	a4, s3, -11
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, 6(a5)
	add	a1, a1, a2
	add	s1, s1, a3
	sltu	a2, s1, a3
	mul	a3, s0, a4
	srai	a4, a3, 31
	add	a2, a2, a4
	addi	a4, s3, -12
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, 8(a5)
	add	a1, a1, a2
	add	a3, a3, s1
	sltu	a2, a3, s1
	mul	s1, s0, a4
	srai	a4, s1, 31
	add	a2, a2, a4
	addi	a4, s3, -13
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, 10(a5)
	add	a1, a1, a2
	add	s1, s1, a3
	sltu	a2, s1, a3
	mul	a3, s0, a4
	srai	a4, a3, 31
	add	a2, a2, a4
	addi	a4, s3, -14
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, 12(a5)
	add	a1, a1, a2
	add	a3, a3, s1
	sltu	a2, a3, s1
	mul	s1, s0, a4
	srai	a4, s1, 31
	add	a2, a2, a4
	addi	a4, s3, -15
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, 14(a5)
	add	a1, a1, a2
	add	s1, s1, a3
	sltu	a2, s1, a3
	mul	a7, s0, a4
	srai	a3, a7, 31
	add	a2, a2, a3
	add	a1, a1, a2
	add	a7, a7, s1
	sltu	t2, a7, s1
	add	t2, t2, a1
	addi	s2, s2, 16
	addi	s3, s3, -16
	addi	a5, a5, 32
	blt	s2, s11, .LBB0_20
.LBB0_21:                               # %for.cond58.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	bge	s2, ra, .LBB0_25
# %bb.22:                               # %for.body64.lr.ph
                                        #   in Loop: Header=BB0_12 Depth=1
	slli	a5, s2, 1
	add	a5, a5, t5
	mv	s1, s3
.LBB0_23:                               # %for.body46.clone
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a1, s1, 16
	srai	a1, a1, 16
	slli	a1, a1, 1
	add	a1, a1, s5
	lh	a1, 0(a1)
	lh	a2, 0(a5)
	mv	a3, a7
	mul	a7, a2, a1
	srai	a1, a7, 31
	add	a7, a7, a3
	sltu	a2, a7, a3
	add	a1, a1, t2
	add	t2, a1, a2
	addi	a5, a5, 2
	addi	s1, s1, -1
	bne	a5, s7, .LBB0_23
# %bb.24:                               # %for.cond227.preheader.loopexit
                                        #   in Loop: Header=BB0_12 Depth=1
	sub	s3, s3, ra
	add	s3, s3, s2
.LBB0_25:                               # %for.cond227.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	li	a1, 16
	blt	s10, a1, .LBB0_28
# %bb.26:                               # %for.body233.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	a1, 0(sp)                       # 4-byte Folded Reload
	and	a6, s10, a1
	addi	a1, s10, -16
	andi	a1, a1, -16
	sub	a1, s3, a1
	addi	a1, a1, -16
	and	a5, a1, s8
	lw	s2, 12(sp)                      # 4-byte Folded Reload
.LBB0_27:                               # %for.body64.15
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a1, s3, 16
	srai	a1, a1, 16
	slli	a1, a1, 1
	add	a1, a1, s5
	lh	a1, 0(a1)
	lh	a2, -16(s2)
	addi	a3, s3, -1
	mul	a1, a2, a1
	srai	a2, a1, 31
	add	a1, a1, a7
	sltu	a4, a1, a7
	slli	a3, a3, 16
	srai	a3, a3, 16
	slli	a3, a3, 1
	add	a3, a3, s5
	lh	a3, 0(a3)
	lh	s1, -14(s2)
	add	a2, a2, t2
	add	a2, a2, a4
	addi	a4, s3, -2
	mul	a3, s1, a3
	srai	s1, a3, 31
	add	a3, a3, a1
	slli	a4, a4, 16
	srai	a4, a4, 16
	slli	a4, a4, 1
	add	a4, a4, s5
	lh	a4, 0(a4)
	lh	s0, -12(s2)
	sltu	a1, a3, a1
	add	a2, a2, s1
	addi	s1, s3, -3
	mul	a4, s0, a4
	srai	s0, a4, 31
	add	a4, a4, a3
	add	a1, a1, s0
	slli	s1, s1, 16
	srai	s1, s1, 16
	slli	s1, s1, 1
	add	s1, s1, s5
	lh	s1, 0(s1)
	lh	s0, -10(s2)
	sltu	a3, a4, a3
	add	a1, a1, a2
	addi	a2, s3, -4
	mul	s0, s0, s1
	srai	s1, s0, 31
	add	a3, a3, s1
	add	a1, a1, a3
	slli	a2, a2, 16
	srai	a2, a2, 16
	slli	a2, a2, 1
	add	a2, a2, s5
	lh	a2, 0(a2)
	lh	a3, -8(s2)
	add	s0, s0, a4
	sltu	a4, s0, a4
	addi	s1, s3, -5
	mul	a2, a3, a2
	srai	a3, a2, 31
	add	a3, a3, a4
	add	a1, a1, a3
	slli	s1, s1, 16
	srai	s1, s1, 16
	slli	s1, s1, 1
	add	s1, s1, s5
	lh	a3, 0(s1)
	lh	a4, -6(s2)
	add	a2, a2, s0
	sltu	s1, a2, s0
	addi	s0, s3, -6
	mul	a3, a4, a3
	srai	a4, a3, 31
	add	a4, a4, s1
	add	a1, a1, a4
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s5
	lh	a4, 0(s0)
	lh	s1, -4(s2)
	add	a3, a3, a2
	sltu	a2, a3, a2
	addi	s0, s3, -7
	mul	s1, s1, a4
	srai	a4, s1, 31
	add	a2, a2, a4
	add	a1, a1, a2
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s5
	lh	a2, 0(s0)
	lh	a4, -2(s2)
	add	s1, s1, a3
	sltu	a3, s1, a3
	addi	s0, s3, -8
	mul	a2, a4, a2
	srai	a4, a2, 31
	add	a3, a3, a4
	add	a1, a1, a3
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s5
	lh	a3, 0(s0)
	lh	a4, 0(s2)
	add	a2, a2, s1
	sltu	s1, a2, s1
	addi	s0, s3, -9
	mul	a3, a4, a3
	srai	a4, a3, 31
	add	a4, a4, s1
	add	a1, a1, a4
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s5
	lh	a4, 0(s0)
	lh	s1, 2(s2)
	add	a3, a3, a2
	sltu	a2, a3, a2
	addi	s0, s3, -10
	mul	s1, s1, a4
	srai	a4, s1, 31
	add	a2, a2, a4
	add	a1, a1, a2
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s5
	lh	a2, 0(s0)
	lh	a4, 4(s2)
	add	s1, s1, a3
	sltu	a3, s1, a3
	addi	s0, s3, -11
	mul	a2, a4, a2
	srai	a4, a2, 31
	add	a3, a3, a4
	add	a1, a1, a3
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s5
	lh	a3, 0(s0)
	lh	a4, 6(s2)
	add	a2, a2, s1
	sltu	s1, a2, s1
	addi	s0, s3, -12
	mul	a3, a4, a3
	srai	a4, a3, 31
	add	a4, a4, s1
	add	a1, a1, a4
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s5
	lh	a4, 0(s0)
	lh	s1, 8(s2)
	add	a3, a3, a2
	sltu	a2, a3, a2
	addi	s0, s3, -13
	mul	s1, s1, a4
	srai	a4, s1, 31
	add	a2, a2, a4
	add	a1, a1, a2
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s5
	lh	a2, 0(s0)
	lh	a4, 10(s2)
	add	s1, s1, a3
	sltu	a3, s1, a3
	addi	s0, s3, -14
	mul	a2, a4, a2
	srai	a4, a2, 31
	add	a3, a3, a4
	add	a1, a1, a3
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s5
	lh	a3, 0(s0)
	lh	a4, 12(s2)
	add	a2, a2, s1
	sltu	s1, a2, s1
	addi	s0, s3, -15
	mul	a3, a4, a3
	srai	a4, a3, 31
	add	a4, a4, s1
	add	a1, a1, a4
	add	a3, a3, a2
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s5
	lh	a4, 0(s0)
	lh	s1, 14(s2)
	sltu	a2, a3, a2
	addi	s3, s3, -16
	and	s0, s3, s8
	mul	a7, s1, a4
	srai	a4, a7, 31
	add	a2, a2, a4
	add	a1, a1, a2
	add	a7, a7, a3
	sltu	t2, a7, a3
	add	t2, t2, a1
	addi	s2, s2, 32
	bne	s0, a5, .LBB0_27
	j	.LBB0_29
.LBB0_28:                               #   in Loop: Header=BB0_12 Depth=1
	li	a6, 0
.LBB0_29:                               #   in Loop: Header=BB0_12 Depth=1
	lw	a3, 20(sp)                      # 4-byte Folded Reload
	lw	a4, 16(sp)                      # 4-byte Folded Reload
# %bb.30:                               # %for.cond398.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	bge	a6, s10, .LBB0_35
# %bb.31:                               # %for.body64.clone.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	slli	s0, a6, 1
	add	s0, s0, t5
	add	s9, s9, t5
.LBB0_32:                               # %for.body64.clone
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a1, s3, 16
	srai	a1, a1, 16
	slli	a1, a1, 1
	add	a1, a1, s5
	lh	a1, 0(a1)
	lh	a2, 0(s0)
	addi	s3, s3, -1
	mul	a5, a2, a1
	srai	a1, a5, 31
	add	a5, a5, a7
	sltu	a2, a5, a7
	add	a1, a1, t2
	addi	s0, s0, 2
	add	t2, a1, a2
	mv	a7, a5
	bne	s0, s9, .LBB0_32
# %bb.33:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	addi	a1, s4, -32
	bltz	a1, .LBB0_36
.LBB0_34:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	sra	s1, t2, s4
	li	a1, 15
	bge	a1, a4, .LBB0_11
	j	.LBB0_37
.LBB0_35:                               #   in Loop: Header=BB0_12 Depth=1
	mv	a5, a7
	addi	a1, s4, -32
	bgez	a1, .LBB0_34
.LBB0_36:                               #   in Loop: Header=BB0_12 Depth=1
	srl	a1, a5, s4
	not	a2, s4
	slli	t2, t2, 1
	sll	s1, t2, a2
	or	s1, s1, a1
	li	a1, 15
	bge	a1, a4, .LBB0_11
.LBB0_37:                               #   in Loop: Header=BB0_12 Depth=1
	lw	a2, 4(sp)                       # 4-byte Folded Reload
	sll	a1, a5, a2
	addi	a2, a2, -32
	srai	a2, a2, 31
	and	s1, a2, a1
	j	.LBB0_11
.Lfunc_end0:
	.size	dsps_fird_s16_ansi, .Lfunc_end0-dsps_fird_s16_ansi
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a)"
	.section	".note.GNU-stack","",@progbits
