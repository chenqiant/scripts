.option	arch, -zcb, +zcmp
# 2025-01-06 16:47:53
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspi_conv_f32_best.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dspi_conv_f32_arp4              # -- Begin function dspi_conv_f32_arp4
	.p2align	1
	.type	dspi_conv_f32_arp4,@function
dspi_conv_f32_arp4:                     # @dspi_conv_f32_arp4
# %bb.0:                                # %entry
	addi	sp, sp, -128
	sw	ra, 124(sp)                     # 4-byte Folded Spill
	sw	s0, 120(sp)                     # 4-byte Folded Spill
	sw	s1, 116(sp)                     # 4-byte Folded Spill
	sw	s2, 112(sp)                     # 4-byte Folded Spill
	sw	s3, 108(sp)                     # 4-byte Folded Spill
	sw	s4, 104(sp)                     # 4-byte Folded Spill
	sw	s5, 100(sp)                     # 4-byte Folded Spill
	sw	s6, 96(sp)                      # 4-byte Folded Spill
	sw	s7, 92(sp)                      # 4-byte Folded Spill
	sw	s8, 88(sp)                      # 4-byte Folded Spill
	sw	s9, 84(sp)                      # 4-byte Folded Spill
	sw	s10, 80(sp)                     # 4-byte Folded Spill
	sw	s11, 76(sp)                     # 4-byte Folded Spill
	lw	t5, 4(a0)
	lw	t1, 8(a0)
	lw	t2, 12(a0)
	lw	t6, 20(a0)
	lw	a4, 24(a0)
	lw	a5, 4(a1)
	lw	a6, 8(a1)
	lw	a7, 12(a1)
	lw	s7, 20(a1)
	lw	t0, 24(a1)
	lw	ra, 4(a2)
	lw	s1, 8(a2)
	lw	s0, 12(a2)
	lw	a0, 0(a0)
	sw	a0, 72(sp)                      # 4-byte Folded Spill
	lw	a0, 0(a2)
	sw	a0, 68(sp)                      # 4-byte Folded Spill
	lw	t4, 0(a1)
	addi	t3, s7, -1
	srai	s11, t3, 1
	addi	s5, t0, -1
	srai	a3, s5, 1
	mul	a0, t2, t1
	sw	a0, 60(sp)                      # 4-byte Folded Spill
	mul	a0, s0, s1
	sw	a0, 64(sp)                      # 4-byte Folded Spill
	srli	a0, s7, 31
	add	a0, a0, s7
	srai	a0, a0, 1
	sub	s10, t6, a0
	srli	a0, t0, 31
	add	a0, a0, t0
	srai	a0, a0, 1
	sw	a4, 32(sp)                      # 4-byte Folded Spill
	sub	a0, a4, a0
	sw	a0, 44(sp)                      # 4-byte Folded Spill
	sw	t3, 24(sp)                      # 4-byte Folded Spill
	add	t3, t3, s10
	addi	a0, s10, -1
	sw	a0, 36(sp)                      # 4-byte Folded Spill
	mul	a0, a5, s11
	sw	a0, 12(sp)                      # 4-byte Folded Spill
	slli	a0, a5, 2
	mul	a1, a7, a6
	sw	a1, 20(sp)                      # 4-byte Folded Spill
	mul	a1, t5, s11
	sw	a1, 16(sp)                      # 4-byte Folded Spill
	slli	a1, t5, 2
	sw	a3, 40(sp)                      # 4-byte Folded Spill
	sw	s10, 56(sp)                     # 4-byte Folded Spill
	blez	a3, .LBB0_27
# %bb.1:                                # %for.body.lr.ph
	li	s3, 0
	li	a4, 0
	lw	a2, 12(sp)                      # 4-byte Folded Reload
	slli	a2, a2, 2
	add	a2, a2, t4
	sw	a2, 28(sp)                      # 4-byte Folded Spill
	neg	s9, a0
	lw	t2, 20(sp)                      # 4-byte Folded Reload
	slli	t2, t2, 2
	lw	t1, 16(sp)                      # 4-byte Folded Reload
	slli	t1, t1, 2
	lw	a2, 72(sp)                      # 4-byte Folded Reload
	add	t1, t1, a2
	lw	a7, 60(sp)                      # 4-byte Folded Reload
	slli	a7, a7, 2
	fmv.w.x	fa5, zero
	j	.LBB0_3
.LBB0_2:                                # %for.cond.cleanup95
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a2, 60(sp)                      # 4-byte Folded Reload
	lw	s3, 52(sp)                      # 4-byte Folded Reload
	add	s3, s3, a2
	lw	a4, 48(sp)                      # 4-byte Folded Reload
	addi	a4, a4, 1
	add	t1, t1, a7
	lw	a3, 40(sp)                      # 4-byte Folded Reload
	beq	a4, a3, .LBB0_27
.LBB0_3:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_9 Depth 3
                                        #         Child Loop BB0_10 Depth 4
                                        #     Child Loop BB0_14 Depth 2
                                        #       Child Loop BB0_17 Depth 3
                                        #         Child Loop BB0_18 Depth 4
                                        #     Child Loop BB0_22 Depth 2
                                        #       Child Loop BB0_25 Depth 3
                                        #         Child Loop BB0_26 Depth 4
	sub	s6, a3, a4
	lw	a2, 64(sp)                      # 4-byte Folded Reload
	sw	a4, 48(sp)                      # 4-byte Folded Spill
	mul	a2, a4, a2
	slli	a2, a2, 2
	lw	a6, 68(sp)                      # 4-byte Folded Reload
	add	a6, a6, a2
	sw	s3, 52(sp)                      # 4-byte Folded Spill
	blez	s11, .LBB0_11
# %bb.4:                                # %for.body27.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	li	s0, 0
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	lw	s3, 52(sp)                      # 4-byte Folded Reload
	j	.LBB0_6
.LBB0_5:                                # %for.cond.cleanup31
                                        #   in Loop: Header=BB0_6 Depth=2
	add	s3, s3, t5
	mul	a2, s0, ra
	slli	a2, a2, 2
	add	a2, a2, a6
	fsw	fa4, 0(a2)
	addi	s0, s0, 1
	add	s4, s4, s9
	beq	s0, s11, .LBB0_11
.LBB0_6:                                # %for.body27
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_9 Depth 3
                                        #         Child Loop BB0_10 Depth 4
	fmv.s	fa4, fa5
	bge	s6, t0, .LBB0_5
# %bb.7:                                # %for.cond33.preheader.lr.ph
                                        #   in Loop: Header=BB0_6 Depth=2
	sub	s10, s11, s0
	mv	s2, t1
	mv	a2, s4
	fmv.s	fa4, fa5
	mv	a5, s6
	j	.LBB0_9
.LBB0_8:                                # %for.cond.cleanup35
                                        #   in Loop: Header=BB0_9 Depth=3
	addi	a5, a5, 1
	add	a2, a2, t2
	add	s2, s2, a7
	bge	a5, t0, .LBB0_5
.LBB0_9:                                # %for.cond33.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_10 Depth 4
	mv	a4, s2
	mv	s1, a2
	mv	s8, s10
	bge	s10, s7, .LBB0_8
.LBB0_10:                               # %for.body36
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        #       Parent Loop BB0_9 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a4)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s8, s8, 1
	add	s1, s1, a0
	add	a4, a4, a1
	blt	s8, s7, .LBB0_10
	j	.LBB0_8
.LBB0_11:                               # %for.cond54.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s10, 56(sp)                     # 4-byte Folded Reload
	bge	s11, s10, .LBB0_19
# %bb.12:                               # %for.cond62.preheader.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	slli	s8, s3, 2
	lw	a2, 72(sp)                      # 4-byte Folded Reload
	add	s8, s8, a2
	mv	s2, s11
	j	.LBB0_14
.LBB0_13:                               # %for.cond.cleanup64
                                        #   in Loop: Header=BB0_14 Depth=2
	add	s3, s3, t5
	mul	a2, s2, ra
	slli	a2, a2, 2
	add	a2, a2, a6
	fsw	fa4, 0(a2)
	addi	s2, s2, 1
	add	s8, s8, a1
	beq	s2, s10, .LBB0_19
.LBB0_14:                               # %for.cond62.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_17 Depth 3
                                        #         Child Loop BB0_18 Depth 4
	fmv.s	fa4, fa5
	bge	s6, t0, .LBB0_13
# %bb.15:                               # %for.cond67.preheader.preheader
                                        #   in Loop: Header=BB0_14 Depth=2
	mv	s0, s8
	mv	s1, t4
	mv	a2, s6
	fmv.s	fa4, fa5
	j	.LBB0_17
.LBB0_16:                               # %for.cond.cleanup69
                                        #   in Loop: Header=BB0_17 Depth=3
	addi	a2, a2, 1
	add	s1, s1, t2
	add	s0, s0, a7
	bge	a2, t0, .LBB0_13
.LBB0_17:                               # %for.cond67.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_14 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_18 Depth 4
	mv	a5, s0
	mv	a4, s1
	mv	a3, s7
	blez	s7, .LBB0_16
.LBB0_18:                               # %for.body70
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_14 Depth=2
                                        #       Parent Loop BB0_17 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, -1
	add	a4, a4, a0
	add	a5, a5, a1
	bnez	a3, .LBB0_18
	j	.LBB0_16
.LBB0_19:                               # %for.cond93.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	blt	t6, s10, .LBB0_2
# %bb.20:                               # %for.body96.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	slli	s3, s3, 2
	lw	a2, 72(sp)                      # 4-byte Folded Reload
	add	s3, s3, a2
	mv	s2, s7
	lw	s4, 36(sp)                      # 4-byte Folded Reload
	j	.LBB0_22
.LBB0_21:                               # %for.cond.cleanup104
                                        #   in Loop: Header=BB0_22 Depth=2
	mul	a2, s4, ra
	slli	a2, a2, 2
	add	a2, a2, a6
	fsw	fa4, 0(a2)
	addi	s4, s4, 1
	addi	s2, s2, -1
	add	s3, s3, a1
	beq	s4, t6, .LBB0_2
.LBB0_22:                               # %for.body96
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_25 Depth 3
                                        #         Child Loop BB0_26 Depth 4
	fmv.s	fa4, fa5
	bge	s6, t0, .LBB0_21
# %bb.23:                               # %for.cond107.preheader.lr.ph
                                        #   in Loop: Header=BB0_22 Depth=2
	mv	s0, s3
	mv	s1, t4
	mv	a2, s6
	fmv.s	fa4, fa5
	j	.LBB0_25
.LBB0_24:                               # %for.cond.cleanup109
                                        #   in Loop: Header=BB0_25 Depth=3
	addi	a2, a2, 1
	add	s1, s1, t2
	add	s0, s0, a7
	bge	a2, t0, .LBB0_21
.LBB0_25:                               # %for.cond107.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_22 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_26 Depth 4
	mv	a4, s0
	mv	a5, s1
	mv	a3, s2
	bge	s4, t3, .LBB0_24
.LBB0_26:                               # %for.body110
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_22 Depth=2
                                        #       Parent Loop BB0_25 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a4)
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, -1
	add	a5, a5, a0
	add	a4, a4, a1
	bnez	a3, .LBB0_26
	j	.LBB0_24
.LBB0_27:                               # %for.cond137.preheader
	lw	a2, 44(sp)                      # 4-byte Folded Reload
	bge	a3, a2, .LBB0_46
# %bb.28:                               # %for.body140.lr.ph
	li	a7, 0
	lw	a2, 12(sp)                      # 4-byte Folded Reload
	slli	a2, a2, 2
	add	a2, a2, t4
	sw	a2, 52(sp)                      # 4-byte Folded Spill
	neg	s2, a0
	lw	s3, 20(sp)                      # 4-byte Folded Reload
	slli	s3, s3, 2
	lw	a6, 16(sp)                      # 4-byte Folded Reload
	slli	a6, a6, 2
	lw	a2, 72(sp)                      # 4-byte Folded Reload
	add	a6, a6, a2
	lw	t2, 60(sp)                      # 4-byte Folded Reload
	slli	t2, t2, 2
	fmv.w.x	fa5, zero
	lw	s6, 40(sp)                      # 4-byte Folded Reload
	j	.LBB0_30
.LBB0_29:                               # %for.cond.cleanup187
                                        #   in Loop: Header=BB0_30 Depth=1
	lw	a2, 60(sp)                      # 4-byte Folded Reload
	add	a7, a7, a2
	addi	s6, s6, 1
	add	a6, a6, t2
	lw	a2, 44(sp)                      # 4-byte Folded Reload
	beq	s6, a2, .LBB0_46
.LBB0_30:                               # %for.body140
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_33 Depth 2
                                        #       Child Loop BB0_36 Depth 3
                                        #         Child Loop BB0_37 Depth 4
                                        #     Child Loop BB0_41 Depth 2
                                        #       Child Loop BB0_44 Depth 3
                                        #         Child Loop BB0_45 Depth 4
	lw	a2, 64(sp)                      # 4-byte Folded Reload
	mul	a2, s6, a2
	slli	a2, a2, 2
	lw	s4, 68(sp)                      # 4-byte Folded Reload
	add	s4, s4, a2
	mv	s9, a7
	blez	s11, .LBB0_38
# %bb.31:                               # %for.body148.preheader
                                        #   in Loop: Header=BB0_30 Depth=1
	li	s10, 0
	lw	s8, 52(sp)                      # 4-byte Folded Reload
	mv	s9, a7
	j	.LBB0_33
.LBB0_32:                               # %for.cond.cleanup156
                                        #   in Loop: Header=BB0_33 Depth=2
	add	s9, s9, t5
	mul	a2, s10, ra
	slli	a2, a2, 2
	add	a2, a2, s4
	fsw	fa4, 0(a2)
	addi	s10, s10, 1
	add	s8, s8, s2
	beq	s10, s11, .LBB0_38
.LBB0_33:                               # %for.body148
                                        #   Parent Loop BB0_30 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_36 Depth 3
                                        #         Child Loop BB0_37 Depth 4
	fmv.s	fa4, fa5
	blez	t0, .LBB0_32
# %bb.34:                               # %for.cond159.preheader.lr.ph
                                        #   in Loop: Header=BB0_33 Depth=2
	li	s0, 0
	sub	t1, s11, s10
	mv	a5, a6
	mv	a4, s8
	fmv.s	fa4, fa5
	j	.LBB0_36
.LBB0_35:                               # %for.cond.cleanup161
                                        #   in Loop: Header=BB0_36 Depth=3
	addi	s0, s0, 1
	add	a4, a4, s3
	add	a5, a5, t2
	beq	s0, t0, .LBB0_32
.LBB0_36:                               # %for.cond159.preheader
                                        #   Parent Loop BB0_30 Depth=1
                                        #     Parent Loop BB0_33 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_37 Depth 4
	mv	a2, a5
	mv	s1, a4
	mv	a3, t1
	bge	t1, s7, .LBB0_35
.LBB0_37:                               # %for.body162
                                        #   Parent Loop BB0_30 Depth=1
                                        #     Parent Loop BB0_33 Depth=2
                                        #       Parent Loop BB0_36 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a2)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, 1
	add	s1, s1, a0
	add	a2, a2, a1
	blt	a3, s7, .LBB0_37
	j	.LBB0_35
.LBB0_38:                               # %for.cond185.preheader
                                        #   in Loop: Header=BB0_30 Depth=1
	lw	s10, 56(sp)                     # 4-byte Folded Reload
	blt	t6, s10, .LBB0_29
# %bb.39:                               # %for.body188.preheader
                                        #   in Loop: Header=BB0_30 Depth=1
	slli	s9, s9, 2
	lw	a2, 72(sp)                      # 4-byte Folded Reload
	add	s9, s9, a2
	mv	t1, s7
	lw	s8, 36(sp)                      # 4-byte Folded Reload
	j	.LBB0_41
.LBB0_40:                               # %for.cond.cleanup196
                                        #   in Loop: Header=BB0_41 Depth=2
	mul	a2, s8, ra
	slli	a2, a2, 2
	add	a2, a2, s4
	fsw	fa4, 0(a2)
	addi	s8, s8, 1
	addi	t1, t1, -1
	add	s9, s9, a1
	beq	s8, t6, .LBB0_29
.LBB0_41:                               # %for.body188
                                        #   Parent Loop BB0_30 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_44 Depth 3
                                        #         Child Loop BB0_45 Depth 4
	fmv.s	fa4, fa5
	blez	t0, .LBB0_40
# %bb.42:                               # %for.cond199.preheader.lr.ph
                                        #   in Loop: Header=BB0_41 Depth=2
	li	a4, 0
	mv	s1, s9
	mv	s0, t4
	fmv.s	fa4, fa5
	j	.LBB0_44
.LBB0_43:                               # %for.cond.cleanup201
                                        #   in Loop: Header=BB0_44 Depth=3
	addi	a4, a4, 1
	add	s0, s0, s3
	add	s1, s1, t2
	beq	a4, t0, .LBB0_40
.LBB0_44:                               # %for.cond199.preheader
                                        #   Parent Loop BB0_30 Depth=1
                                        #     Parent Loop BB0_41 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_45 Depth 4
	mv	a5, s1
	mv	a2, s0
	mv	a3, t1
	bge	s8, t3, .LBB0_43
.LBB0_45:                               # %for.body202
                                        #   Parent Loop BB0_30 Depth=1
                                        #     Parent Loop BB0_41 Depth=2
                                        #       Parent Loop BB0_44 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a2)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, -1
	add	a2, a2, a0
	add	a5, a5, a1
	bnez	a3, .LBB0_45
	j	.LBB0_43
.LBB0_46:                               # %for.cond229.preheader
	lw	a2, 44(sp)                      # 4-byte Folded Reload
	lw	a3, 32(sp)                      # 4-byte Folded Reload
	bge	a2, a3, .LBB0_73
# %bb.47:                               # %for.body232.lr.ph
	li	s8, 0
	lw	t2, 44(sp)                      # 4-byte Folded Reload
	add	a2, t2, t0
	sw	a2, 48(sp)                      # 4-byte Folded Spill
	lw	a2, 12(sp)                      # 4-byte Folded Reload
	slli	a2, a2, 2
	add	a2, a2, t4
	sw	a2, 36(sp)                      # 4-byte Folded Spill
	neg	s4, a0
	lw	s9, 20(sp)                      # 4-byte Folded Reload
	slli	s9, s9, 2
	lw	s3, 16(sp)                      # 4-byte Folded Reload
	slli	s3, s3, 2
	lw	a2, 72(sp)                      # 4-byte Folded Reload
	add	s3, s3, a2
	lw	s6, 60(sp)                      # 4-byte Folded Reload
	slli	s6, s6, 2
	fmv.w.x	fa5, zero
	j	.LBB0_49
.LBB0_48:                               # %for.cond.cleanup320
                                        #   in Loop: Header=BB0_49 Depth=1
	lw	a2, 60(sp)                      # 4-byte Folded Reload
	lw	s8, 52(sp)                      # 4-byte Folded Reload
	add	s8, s8, a2
	addi	t2, t2, 1
	addi	s5, s5, -1
	add	s3, s3, s6
	lw	a2, 32(sp)                      # 4-byte Folded Reload
	beq	t2, a2, .LBB0_73
.LBB0_49:                               # %for.body232
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_52 Depth 2
                                        #       Child Loop BB0_55 Depth 3
                                        #         Child Loop BB0_56 Depth 4
                                        #     Child Loop BB0_60 Depth 2
                                        #       Child Loop BB0_63 Depth 3
                                        #         Child Loop BB0_64 Depth 4
                                        #     Child Loop BB0_68 Depth 2
                                        #       Child Loop BB0_71 Depth 3
                                        #         Child Loop BB0_72 Depth 4
	not	a7, t2
	lw	a2, 48(sp)                      # 4-byte Folded Reload
	add	a7, a7, a2
	lw	a2, 64(sp)                      # 4-byte Folded Reload
	mul	a2, t2, a2
	slli	a2, a2, 2
	lw	s2, 68(sp)                      # 4-byte Folded Reload
	add	s2, s2, a2
	sw	s8, 52(sp)                      # 4-byte Folded Spill
	blez	s11, .LBB0_57
# %bb.50:                               # %for.body241.lr.ph
                                        #   in Loop: Header=BB0_49 Depth=1
	li	s1, 0
	lw	s10, 36(sp)                     # 4-byte Folded Reload
	lw	s8, 52(sp)                      # 4-byte Folded Reload
	j	.LBB0_52
.LBB0_51:                               # %for.cond.cleanup250
                                        #   in Loop: Header=BB0_52 Depth=2
	add	s8, s8, t5
	mul	a2, s1, ra
	slli	a2, a2, 2
	add	a2, a2, s2
	fsw	fa4, 0(a2)
	addi	s1, s1, 1
	add	s10, s10, s4
	beq	s1, s11, .LBB0_57
.LBB0_52:                               # %for.body241
                                        #   Parent Loop BB0_49 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_55 Depth 3
                                        #         Child Loop BB0_56 Depth 4
	fmv.s	fa4, fa5
	blez	a7, .LBB0_51
# %bb.53:                               # %for.cond253.preheader.lr.ph
                                        #   in Loop: Header=BB0_52 Depth=2
	li	a6, 0
	sub	a4, s11, s1
	mv	s0, s3
	mv	t1, s10
	fmv.s	fa4, fa5
	j	.LBB0_55
.LBB0_54:                               # %for.cond.cleanup255
                                        #   in Loop: Header=BB0_55 Depth=3
	addi	a6, a6, 1
	add	t1, t1, s9
	add	s0, s0, s6
	beq	a6, s5, .LBB0_51
.LBB0_55:                               # %for.cond253.preheader
                                        #   Parent Loop BB0_49 Depth=1
                                        #     Parent Loop BB0_52 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_56 Depth 4
	mv	a5, s0
	mv	a2, t1
	mv	a3, a4
	bge	a4, s7, .LBB0_54
.LBB0_56:                               # %for.body256
                                        #   Parent Loop BB0_49 Depth=1
                                        #     Parent Loop BB0_52 Depth=2
                                        #       Parent Loop BB0_55 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a2)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, 1
	add	a2, a2, a0
	add	a5, a5, a1
	blt	a3, s7, .LBB0_56
	j	.LBB0_54
.LBB0_57:                               # %for.cond279.preheader
                                        #   in Loop: Header=BB0_49 Depth=1
	lw	s10, 56(sp)                     # 4-byte Folded Reload
	bge	s11, s10, .LBB0_65
# %bb.58:                               # %for.cond287.preheader.lr.ph
                                        #   in Loop: Header=BB0_49 Depth=1
	slli	a6, s8, 2
	lw	a2, 72(sp)                      # 4-byte Folded Reload
	add	a6, a6, a2
	mv	t1, s11
	j	.LBB0_60
.LBB0_59:                               # %for.cond.cleanup289
                                        #   in Loop: Header=BB0_60 Depth=2
	add	s8, s8, t5
	mul	a2, t1, ra
	slli	a2, a2, 2
	add	a2, a2, s2
	fsw	fa4, 0(a2)
	addi	t1, t1, 1
	add	a6, a6, a1
	beq	t1, s10, .LBB0_65
.LBB0_60:                               # %for.cond287.preheader
                                        #   Parent Loop BB0_49 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_63 Depth 3
                                        #         Child Loop BB0_64 Depth 4
	fmv.s	fa4, fa5
	blez	a7, .LBB0_59
# %bb.61:                               # %for.cond292.preheader.preheader
                                        #   in Loop: Header=BB0_60 Depth=2
	li	s1, 0
	mv	a4, a6
	mv	s0, t4
	fmv.s	fa4, fa5
	j	.LBB0_63
.LBB0_62:                               # %for.cond.cleanup294
                                        #   in Loop: Header=BB0_63 Depth=3
	addi	s1, s1, 1
	add	s0, s0, s9
	add	a4, a4, s6
	beq	s1, s5, .LBB0_59
.LBB0_63:                               # %for.cond292.preheader
                                        #   Parent Loop BB0_49 Depth=1
                                        #     Parent Loop BB0_60 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_64 Depth 4
	mv	a2, a4
	mv	a5, s0
	mv	a3, s7
	blez	s7, .LBB0_62
.LBB0_64:                               # %for.body295
                                        #   Parent Loop BB0_49 Depth=1
                                        #     Parent Loop BB0_60 Depth=2
                                        #       Parent Loop BB0_63 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a2)
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, -1
	add	a5, a5, a0
	add	a2, a2, a1
	bnez	a3, .LBB0_64
	j	.LBB0_62
.LBB0_65:                               # %for.cond318.preheader
                                        #   in Loop: Header=BB0_49 Depth=1
	bge	s10, t6, .LBB0_48
# %bb.66:                               # %for.cond326.preheader.lr.ph
                                        #   in Loop: Header=BB0_49 Depth=1
	slli	s8, s8, 2
	lw	a2, 72(sp)                      # 4-byte Folded Reload
	add	s8, s8, a2
	lw	a6, 24(sp)                      # 4-byte Folded Reload
	mv	t1, s10
	j	.LBB0_68
.LBB0_67:                               # %for.cond.cleanup328
                                        #   in Loop: Header=BB0_68 Depth=2
	mul	a2, t1, ra
	slli	a2, a2, 2
	add	a2, a2, s2
	fsw	fa4, 0(a2)
	addi	t1, t1, 1
	addi	a6, a6, -1
	add	s8, s8, a1
	beq	t1, t6, .LBB0_48
.LBB0_68:                               # %for.cond326.preheader
                                        #   Parent Loop BB0_49 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_71 Depth 3
                                        #         Child Loop BB0_72 Depth 4
	fmv.s	fa4, fa5
	blez	a7, .LBB0_67
# %bb.69:                               # %for.cond331.preheader.lr.ph
                                        #   in Loop: Header=BB0_68 Depth=2
	li	a4, 0
	mv	s0, s8
	mv	s1, t4
	fmv.s	fa4, fa5
	j	.LBB0_71
.LBB0_70:                               # %for.cond.cleanup334
                                        #   in Loop: Header=BB0_71 Depth=3
	addi	a4, a4, 1
	add	s1, s1, s9
	add	s0, s0, s6
	beq	a4, s5, .LBB0_67
.LBB0_71:                               # %for.cond331.preheader
                                        #   Parent Loop BB0_49 Depth=1
                                        #     Parent Loop BB0_68 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_72 Depth 4
	mv	a5, s0
	mv	a2, s1
	mv	a3, a6
	bge	t1, t3, .LBB0_70
.LBB0_72:                               # %for.body335
                                        #   Parent Loop BB0_49 Depth=1
                                        #     Parent Loop BB0_68 Depth=2
                                        #       Parent Loop BB0_71 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a2)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, -1
	add	a2, a2, a0
	add	a5, a5, a1
	bnez	a3, .LBB0_72
	j	.LBB0_70
.LBB0_73:                               # %for.cond362.preheader
	lw	t3, 40(sp)                      # 4-byte Folded Reload
	lw	a2, 44(sp)                      # 4-byte Folded Reload
	bge	t3, a2, .LBB0_84
# %bb.74:                               # %for.body365.lr.ph
	lw	t2, 20(sp)                      # 4-byte Folded Reload
	slli	t2, t2, 2
	lw	s5, 60(sp)                      # 4-byte Folded Reload
	slli	s5, s5, 2
	fmv.w.x	fa5, zero
	j	.LBB0_76
.LBB0_75:                               # %for.cond.cleanup372
                                        #   in Loop: Header=BB0_76 Depth=1
	addi	t3, t3, 1
	lw	a2, 72(sp)                      # 4-byte Folded Reload
	add	a2, a2, s5
	sw	a2, 72(sp)                      # 4-byte Folded Spill
	lw	a2, 44(sp)                      # 4-byte Folded Reload
	beq	t3, a2, .LBB0_84
.LBB0_76:                               # %for.body365
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_79 Depth 2
                                        #       Child Loop BB0_82 Depth 3
                                        #         Child Loop BB0_83 Depth 4
	bge	s11, s10, .LBB0_75
# %bb.77:                               # %for.cond378.preheader.preheader
                                        #   in Loop: Header=BB0_76 Depth=1
	lw	a2, 64(sp)                      # 4-byte Folded Reload
	mul	a2, t3, a2
	slli	a2, a2, 2
	lw	a6, 68(sp)                      # 4-byte Folded Reload
	add	a6, a6, a2
	lw	a7, 72(sp)                      # 4-byte Folded Reload
	mv	t1, s11
	j	.LBB0_79
.LBB0_78:                               # %for.cond.cleanup380
                                        #   in Loop: Header=BB0_79 Depth=2
	mul	a2, t1, ra
	slli	a2, a2, 2
	add	a2, a2, a6
	fsw	fa4, 0(a2)
	addi	t1, t1, 1
	add	a7, a7, a1
	beq	t1, s10, .LBB0_75
.LBB0_79:                               # %for.cond378.preheader
                                        #   Parent Loop BB0_76 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_82 Depth 3
                                        #         Child Loop BB0_83 Depth 4
	fmv.s	fa4, fa5
	blez	t0, .LBB0_78
# %bb.80:                               # %for.cond383.preheader.preheader
                                        #   in Loop: Header=BB0_79 Depth=2
	li	a5, 0
	mv	s0, a7
	mv	s1, t4
	fmv.s	fa4, fa5
	j	.LBB0_82
.LBB0_81:                               # %for.cond.cleanup385
                                        #   in Loop: Header=BB0_82 Depth=3
	addi	a5, a5, 1
	add	s1, s1, t2
	add	s0, s0, s5
	beq	a5, t0, .LBB0_78
.LBB0_82:                               # %for.cond383.preheader
                                        #   Parent Loop BB0_76 Depth=1
                                        #     Parent Loop BB0_79 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_83 Depth 4
	mv	a4, s0
	mv	a2, s1
	mv	a3, s7
	blez	s7, .LBB0_81
.LBB0_83:                               # %for.body386
                                        #   Parent Loop BB0_76 Depth=1
                                        #     Parent Loop BB0_79 Depth=2
                                        #       Parent Loop BB0_82 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a4)
	flw	fa2, 0(a2)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, -1
	add	a2, a2, a0
	add	a4, a4, a1
	bnez	a3, .LBB0_83
	j	.LBB0_81
.LBB0_84:                               # %for.cond.cleanup364
	li	a0, 0
	lw	ra, 124(sp)                     # 4-byte Folded Reload
	lw	s0, 120(sp)                     # 4-byte Folded Reload
	lw	s1, 116(sp)                     # 4-byte Folded Reload
	lw	s2, 112(sp)                     # 4-byte Folded Reload
	lw	s3, 108(sp)                     # 4-byte Folded Reload
	lw	s4, 104(sp)                     # 4-byte Folded Reload
	lw	s5, 100(sp)                     # 4-byte Folded Reload
	lw	s6, 96(sp)                      # 4-byte Folded Reload
	lw	s7, 92(sp)                      # 4-byte Folded Reload
	lw	s8, 88(sp)                      # 4-byte Folded Reload
	lw	s9, 84(sp)                      # 4-byte Folded Reload
	lw	s10, 80(sp)                     # 4-byte Folded Reload
	lw	s11, 76(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 128
	ret
.Lfunc_end0:
	.size	dspi_conv_f32_arp4, .Lfunc_end0-dspi_conv_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"
	.section	".note.GNU-stack","",@progbits
