.option	arch, -zcb, +zcmp
# 2024-12-05 17:00:32
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
	addi	sp, sp, -64
	sw	ra, 60(sp)                      # 4-byte Folded Spill
	sw	s0, 56(sp)                      # 4-byte Folded Spill
	sw	s1, 52(sp)                      # 4-byte Folded Spill
	sw	s2, 48(sp)                      # 4-byte Folded Spill
	sw	s3, 44(sp)                      # 4-byte Folded Spill
	sw	s4, 40(sp)                      # 4-byte Folded Spill
	sw	s5, 36(sp)                      # 4-byte Folded Spill
	sw	s6, 32(sp)                      # 4-byte Folded Spill
	sw	s7, 28(sp)                      # 4-byte Folded Spill
	sw	s8, 24(sp)                      # 4-byte Folded Spill
	sw	s9, 20(sp)                      # 4-byte Folded Spill
	sw	s10, 16(sp)                     # 4-byte Folded Spill
	sw	s11, 12(sp)                     # 4-byte Folded Spill
	mv	s6, a0
	lh	a7, 16(a0)
	lw	s0, 24(a0)
	mv	a0, a3
	sw	a1, 8(sp)                       # 4-byte Folded Spill
	bltz	a7, .LBB0_3
# %bb.1:                                # %if.then
	addi	a5, a7, -32
	srai	a4, s0, 31
	bltz	a5, .LBB0_5
# %bb.2:                                # %if.then
	mv	t2, a4
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
	or	t2, s1, a3
	bgtz	a0, .LBB0_10
.LBB0_6:
	li	a0, 0
.LBB0_7:                                # %for.cond.cleanup
	lw	ra, 60(sp)                      # 4-byte Folded Reload
	lw	s0, 56(sp)                      # 4-byte Folded Reload
	lw	s1, 52(sp)                      # 4-byte Folded Reload
	lw	s2, 48(sp)                      # 4-byte Folded Reload
	lw	s3, 44(sp)                      # 4-byte Folded Reload
	lw	s4, 40(sp)                      # 4-byte Folded Reload
	lw	s5, 36(sp)                      # 4-byte Folded Reload
	lw	s6, 32(sp)                      # 4-byte Folded Reload
	lw	s7, 28(sp)                      # 4-byte Folded Reload
	lw	s8, 24(sp)                      # 4-byte Folded Reload
	lw	s9, 20(sp)                      # 4-byte Folded Reload
	lw	s10, 16(sp)                     # 4-byte Folded Reload
	lw	s11, 12(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 64
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
	and	t2, a5, a3
	blez	a0, .LBB0_6
.LBB0_10:                               # %for.cond14.preheader.lr.ph
	li	t6, 0
	li	t3, 0
	addi	t0, a7, -15
	andi	t1, a4, 255
	li	ra, 15
	sub	t4, ra, a7
	lui	s3, 16
	addi	s3, s3, -1
	j	.LBB0_12
.LBB0_11:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	slli	a1, t6, 1
	add	a1, a1, a2
	addi	t6, t6, 1
	sh	a3, 0(a1)
	beq	t6, a0, .LBB0_7
.LBB0_12:                               # %for.cond14.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
                                        #     Child Loop BB0_21 Depth 2
                                        #     Child Loop BB0_27 Depth 2
                                        #     Child Loop BB0_31 Depth 2
                                        #     Child Loop BB0_34 Depth 2
	lh	a3, 12(s6)
	lh	a4, 14(s6)
	bge	a4, a3, .LBB0_18
# %bb.13:                               # %for.body21.lr.ph
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	a3, 4(s6)
	li	a4, 0
	slli	a5, t3, 1
	lw	a1, 8(sp)                       # 4-byte Folded Reload
	add	a5, a5, a1
	j	.LBB0_15
.LBB0_14:                               # %if.end28
                                        #   in Loop: Header=BB0_15 Depth=2
	lh	s1, 0(a5)
	addi	s0, a1, 1
	sh	s0, 10(s6)
	slli	a1, a1, 1
	add	a1, a1, a3
	sh	s1, 0(a1)
	lh	a1, 12(s6)
	lh	s1, 14(s6)
	addi	a4, a4, 1
	sub	a1, a1, s1
	addi	a5, a5, 2
	bge	a4, a1, .LBB0_17
.LBB0_15:                               # %for.body21
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	a1, 10(s6)
	lh	s1, 8(s6)
	blt	a1, s1, .LBB0_14
# %bb.16:                               # %if.then26
                                        #   in Loop: Header=BB0_15 Depth=2
	li	a1, 0
	sh	zero, 10(s6)
	j	.LBB0_14
.LBB0_17:                               #   in Loop: Header=BB0_12 Depth=1
	add	t3, t3, a4
.LBB0_18:                               # %for.cond.cleanup20
                                        #   in Loop: Header=BB0_12 Depth=1
	lh	a5, 8(s6)
	lh	s2, 10(s6)
	sh	zero, 14(s6)
	addi	t5, a5, -1
	bge	s2, a5, .LBB0_23
# %bb.19:                               # %for.body46.lr.ph
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	s10, 0(s6)
	lw	s4, 4(s6)
	sub	s5, a5, s2
	andi	s7, s5, 7
	beqz	s7, .LBB0_25
# %bb.20:                               # %for.body46.prol.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	slli	a4, s2, 1
	add	a4, a4, s4
	add	s8, s2, s7
	not	s0, s5
	ori	s0, s0, -8
	add	a5, a5, s0
	and	s9, a5, s3
	mv	a5, s2
	mv	a6, t2
	mv	s11, t1
.LBB0_21:                               # %for.body46.prol
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a3, t5, 16
	srai	a3, a3, 16
	slli	a3, a3, 1
	add	a3, a3, s10
	lh	ra, 0(a3)
	lh	a3, 0(a4)
	mv	s0, a6
	mul	a6, a3, ra
	srai	a3, a6, 31
	add	a6, a6, s0
	sltu	s0, a6, s0
	add	a3, a3, s11
	add	s11, a3, s0
	addi	a5, a5, 1
	addi	t5, t5, -1
	and	a3, t5, s3
	addi	a4, a4, 2
	bne	a3, s9, .LBB0_21
# %bb.22:                               #   in Loop: Header=BB0_12 Depth=1
	li	ra, 15
	addi	a3, s5, -1
	li	a1, 7
	bgeu	a3, a1, .LBB0_26
	j	.LBB0_28
.LBB0_23:                               #   in Loop: Header=BB0_12 Depth=1
	mv	a6, t2
	mv	s11, t1
	bgtz	s2, .LBB0_29
.LBB0_24:                               #   in Loop: Header=BB0_12 Depth=1
	mv	a4, a6
	j	.LBB0_35
.LBB0_25:                               #   in Loop: Header=BB0_12 Depth=1
	mv	s8, s2
	mv	a6, t2
	mv	s11, t1
	addi	a3, s5, -1
	li	a1, 7
	bltu	a3, a1, .LBB0_28
.LBB0_26:                               # %for.body46.lr.ph.new
                                        #   in Loop: Header=BB0_12 Depth=1
	slli	s8, s8, 1
	add	a4, s4, s8
	addi	a4, a4, 8
	sub	a3, s5, s7
	slli	a3, a3, 1
	addi	a3, a3, -16
	andi	a3, a3, -16
	add	a3, a3, s8
	add	a3, a3, s4
	addi	s4, a3, 24
.LBB0_27:                               # %for.body46
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a1, t5, 16
	srai	a1, a1, 16
	slli	a1, a1, 1
	add	a1, a1, s10
	lh	a1, 0(a1)
	lh	a3, -8(a4)
	mul	a1, a3, a1
	srai	s5, a1, 31
	add	a1, a1, a6
	addi	a5, t5, -1
	slli	a5, a5, 16
	srai	a5, a5, 16
	slli	a5, a5, 1
	add	a5, a5, s10
	lh	a5, 0(a5)
	lh	s0, -6(a4)
	sltu	a3, a1, a6
	add	s5, s5, s11
	add	s5, s5, a3
	mul	a5, s0, a5
	srai	s0, a5, 31
	addi	s1, t5, -2
	slli	s1, s1, 16
	srai	s1, s1, 16
	slli	s1, s1, 1
	add	s1, s1, s10
	lh	s1, 0(s1)
	lh	a3, -4(a4)
	add	a5, a5, a1
	sltu	a1, a5, a1
	add	s5, s5, s0
	mul	s1, a3, s1
	srai	a3, s1, 31
	add	a1, a1, a3
	addi	a3, t5, -3
	slli	a3, a3, 16
	srai	a3, a3, 16
	slli	a3, a3, 1
	add	a3, a3, s10
	lh	a3, 0(a3)
	lh	s0, -2(a4)
	add	s1, s1, a5
	sltu	a5, s1, a5
	add	s5, s5, a1
	mul	s0, s0, a3
	srai	a3, s0, 31
	add	a3, a3, a5
	addi	a5, t5, -4
	slli	a5, a5, 16
	srai	a5, a5, 16
	slli	a5, a5, 1
	add	a5, a5, s10
	lh	a5, 0(a5)
	lh	a1, 0(a4)
	add	s5, s5, a3
	add	s0, s0, s1
	sltu	s1, s0, s1
	mul	a1, a1, a5
	srai	a5, a1, 31
	add	a5, a5, s1
	addi	s1, t5, -5
	slli	s1, s1, 16
	srai	s1, s1, 16
	slli	s1, s1, 1
	add	s1, s1, s10
	lh	s1, 0(s1)
	lh	a3, 2(a4)
	add	s5, s5, a5
	add	a1, a1, s0
	sltu	s0, a1, s0
	mul	s1, a3, s1
	srai	a3, s1, 31
	add	a3, a3, s0
	addi	s0, t5, -6
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s10
	lh	s0, 0(s0)
	lh	a5, 4(a4)
	add	s5, s5, a3
	add	s1, s1, a1
	sltu	a1, s1, a1
	mul	s0, a5, s0
	srai	a5, s0, 31
	add	a1, a1, a5
	addi	a5, t5, -7
	slli	a5, a5, 16
	srai	a5, a5, 16
	slli	a5, a5, 1
	add	a5, a5, s10
	lh	a5, 0(a5)
	lh	a3, 6(a4)
	add	a1, a1, s5
	add	s0, s0, s1
	sltu	s1, s0, s1
	mul	a6, a3, a5
	srai	a3, a6, 31
	add	a3, a3, s1
	add	a1, a1, a3
	add	a6, a6, s0
	sltu	s11, a6, s0
	add	s11, s11, a1
	addi	a4, a4, 16
	addi	t5, t5, -8
	bne	a4, s4, .LBB0_27
.LBB0_28:                               # %for.cond58.preheader.loopexit
                                        #   in Loop: Header=BB0_12 Depth=1
	addi	t5, s2, -1
	blez	s2, .LBB0_24
.LBB0_29:                               # %for.body64.lr.ph
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	s9, 0(s6)
	lw	s4, 4(s6)
	addi	a1, s2, -1
	andi	s5, s2, 7
	li	s8, 0
	li	a3, 7
	bltu	a1, a3, .LBB0_32
# %bb.30:                               # %for.body64.lr.ph.new
                                        #   in Loop: Header=BB0_12 Depth=1
	sub	s7, s2, s5
	addi	a4, s4, 8
.LBB0_31:                               # %for.body64
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a1, t5, 16
	srai	a1, a1, 16
	slli	a1, a1, 1
	add	a1, a1, s9
	lh	a1, 0(a1)
	lh	a3, -8(a4)
	addi	s0, t5, -1
	mul	a1, a3, a1
	srai	a3, a1, 31
	add	a1, a1, a6
	sltu	s1, a1, a6
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s9
	lh	s0, 0(s0)
	lh	a5, -6(a4)
	add	a3, a3, s11
	add	a6, a3, s1
	addi	s1, t5, -2
	mul	a5, a5, s0
	srai	s0, a5, 31
	add	a5, a5, a1
	slli	s1, s1, 16
	srai	s1, s1, 16
	slli	s1, s1, 1
	add	s1, s1, s9
	lh	s1, 0(s1)
	lh	a3, -4(a4)
	sltu	a1, a5, a1
	add	a6, a6, s0
	addi	s0, t5, -3
	mul	a3, a3, s1
	srai	s1, a3, 31
	add	a3, a3, a5
	add	a1, a1, s1
	slli	s0, s0, 16
	srai	s0, s0, 16
	slli	s0, s0, 1
	add	s0, s0, s9
	lh	s0, 0(s0)
	lh	s1, -2(a4)
	sltu	a5, a3, a5
	add	a1, a1, a6
	addi	a6, t5, -4
	mul	s0, s1, s0
	srai	s1, s0, 31
	add	a5, a5, s1
	add	s10, a1, a5
	slli	a6, a6, 16
	srai	a5, a6, 16
	slli	a5, a5, 1
	add	a5, a5, s9
	lh	a5, 0(a5)
	lh	s1, 0(a4)
	add	s0, s0, a3
	sltu	a3, s0, a3
	addi	a1, t5, -5
	mul	s1, s1, a5
	srai	a5, s1, 31
	add	a3, a3, a5
	add	s10, s10, a3
	slli	a1, a1, 16
	srai	a1, a1, 16
	slli	a1, a1, 1
	add	a1, a1, s9
	lh	a1, 0(a1)
	lh	a5, 2(a4)
	add	s1, s1, s0
	sltu	s0, s1, s0
	addi	a3, t5, -6
	mul	a1, a5, a1
	srai	a5, a1, 31
	add	a5, a5, s0
	add	s10, s10, a5
	slli	a3, a3, 16
	srai	a3, a3, 16
	slli	a3, a3, 1
	add	a3, a3, s9
	lh	a3, 0(a3)
	lh	s0, 4(a4)
	add	a1, a1, s1
	sltu	s1, a1, s1
	addi	a5, t5, -7
	mul	s0, s0, a3
	srai	a3, s0, 31
	add	a3, a3, s1
	add	a3, a3, s10
	slli	a5, a5, 16
	srai	a5, a5, 16
	slli	a5, a5, 1
	add	a5, a5, s9
	lh	a5, 0(a5)
	lh	s1, 6(a4)
	add	s0, s0, a1
	sltu	a1, s0, a1
	addi	t5, t5, -8
	mul	a6, s1, a5
	srai	a5, a6, 31
	add	a1, a1, a5
	add	a1, a1, a3
	add	a6, a6, s0
	sltu	s11, a6, s0
	add	s11, s11, a1
	addi	s8, s8, 8
	addi	a4, a4, 16
	bne	s7, s8, .LBB0_31
.LBB0_32:                               # %for.cond.cleanup63.loopexit.unr-lcssa
                                        #   in Loop: Header=BB0_12 Depth=1
	mv	a4, a6
	beqz	s5, .LBB0_35
# %bb.33:                               # %for.body64.epil.preheader
                                        #   in Loop: Header=BB0_12 Depth=1
	not	a1, s8
	add	s2, s2, a1
	slli	s8, s8, 1
	add	s4, s4, s8
	sub	s5, t5, s5
.LBB0_34:                               # %for.body64.epil
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a1, t5, 16
	srai	a1, a1, 16
	slli	a1, a1, 1
	add	a1, a1, s9
	lh	a1, 0(a1)
	lh	a3, 0(s4)
	addi	t5, t5, -1
	and	s0, t5, s3
	mul	a4, a3, a1
	srai	a1, a4, 31
	add	a4, a4, a6
	sltu	a3, a4, a6
	add	a1, a1, s11
	add	s11, a1, a3
	addi	s2, s2, -1
	and	a1, s5, s3
	addi	s4, s4, 2
	mv	a6, a4
	bne	s0, a1, .LBB0_34
.LBB0_35:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	addi	a1, t4, -32
	bltz	a1, .LBB0_37
# %bb.36:                               # %for.cond.cleanup63
                                        #   in Loop: Header=BB0_12 Depth=1
	sra	a3, s11, t4
	bge	ra, a7, .LBB0_11
	j	.LBB0_38
.LBB0_37:                               #   in Loop: Header=BB0_12 Depth=1
	srl	a1, a4, t4
	not	a3, t4
	slli	s11, s11, 1
	sll	a3, s11, a3
	or	a3, a3, a1
	bge	ra, a7, .LBB0_11
.LBB0_38:                               #   in Loop: Header=BB0_12 Depth=1
	sll	a1, a4, t0
	addi	a3, t0, -32
	srai	a3, a3, 31
	and	a3, a3, a1
	j	.LBB0_11
.Lfunc_end0:
	.size	dsps_fird_s16_arp4, .Lfunc_end0-dsps_fird_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb)"
	.section	".note.GNU-stack","",@progbits
