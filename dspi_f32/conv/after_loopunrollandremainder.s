.option	arch, -zcb, +zcmp
# 2025-01-09 14:10:40
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspi_conv_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dspi_conv_f32_arp4              # -- Begin function dspi_conv_f32_arp4
	.p2align	1
	.type	dspi_conv_f32_arp4,@function
dspi_conv_f32_arp4:                     # @dspi_conv_f32_arp4
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
	lw	a3, 0(a0)
	lw	a5, 24(a0)
	lw	s11, 20(a1)
	lw	s4, 24(a1)
	sw	a3, 40(sp)                      # 4-byte Folded Spill
	lw	a3, 0(a2)
	sw	a5, 20(sp)                      # 4-byte Folded Spill
	sw	a5, 24(a2)
	addi	a5, s11, -1
	srai	s1, a5, 1
	addi	a5, s4, -1
	lw	a4, 20(a0)
	srai	s0, a5, 1
	mv	a5, s1
	lw	s1, 8(a2)
	sw	a3, 60(sp)                      # 4-byte Folded Spill
	lw	a6, 12(a0)
	lw	a3, 8(a0)
	lw	a7, 4(a0)
	lw	a0, 0(a1)
	sw	a4, 20(a2)
	sw	s1, 56(sp)                      # 4-byte Folded Spill
	lw	s1, 12(a2)
	lw	a2, 4(a2)
	mul	a3, a3, a6
	lw	t5, 4(a1)
	sw	a0, 88(sp)                      # 4-byte Folded Spill
	srli	a0, s11, 31
	sw	a3, 48(sp)                      # 4-byte Folded Spill
	lw	a6, 12(a1)
	lw	a3, 8(a1)
	add	a0, a0, s11
	srai	a0, a0, 1
	sw	a2, 104(sp)                     # 4-byte Folded Spill
	sub	a2, a4, a0
	sub	a0, a0, a4
	srli	a1, s4, 31
	sw	a0, 76(sp)                      # 4-byte Folded Spill
	mul	a0, t5, a5
	add	a1, a1, s4
	sw	a0, 12(sp)                      # 4-byte Folded Spill
	mul	a0, a3, a6
	srai	a1, a1, 1
	sw	a2, 84(sp)                      # 4-byte Folded Spill
	addi	a2, a2, -1
	slli	s10, t5, 2
	sw	a0, 8(sp)                       # 4-byte Folded Spill
	slli	t5, t5, 5
	mul	a0, a7, a5
	slli	t6, a7, 5
	sw	a7, 68(sp)                      # 4-byte Folded Spill
	slli	a7, a7, 2
	sw	s1, 52(sp)                      # 4-byte Folded Spill
	sw	a1, 4(sp)                       # 4-byte Folded Spill
	sw	a4, 80(sp)                      # 4-byte Folded Spill
	sw	a2, 28(sp)                      # 4-byte Folded Spill
	sw	a0, 32(sp)                      # 4-byte Folded Spill
	sw	a5, 100(sp)                     # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	blez	s0, .LBB0_49
# %bb.1:                                # %for.cond11.preheader.lr.ph
	lw	a0, 12(sp)                      # 4-byte Folded Reload
	lw	a1, 88(sp)                      # 4-byte Folded Reload
	lw	t4, 8(sp)                       # 4-byte Folded Reload
	lw	t3, 48(sp)                      # 4-byte Folded Reload
	slli	a0, a0, 2
	add	a0, a0, a1
	sw	a0, 16(sp)                      # 4-byte Folded Spill
	neg	a0, s10
	sw	a0, 72(sp)                      # 4-byte Folded Spill
	lw	a0, 32(sp)                      # 4-byte Folded Reload
	lw	a1, 40(sp)                      # 4-byte Folded Reload
	li	a2, 0
	li	s2, 0
	slli	a0, a0, 2
	slli	t4, t4, 2
	add	a0, a0, a1
	slli	t3, t3, 2
	fmv.w.x	fa5, zero
	li	s5, 1
	li	s6, 2
	li	s7, 3
	li	ra, 4
	li	s8, 5
	li	s9, 6
	li	a6, 7
	sw	a0, 64(sp)                      # 4-byte Folded Spill
	j	.LBB0_3
.LBB0_2:                                # %for.cond.cleanup113
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 48(sp)                      # 4-byte Folded Reload
	lw	s2, 44(sp)                      # 4-byte Folded Reload
	lw	a2, 36(sp)                      # 4-byte Folded Reload
	lw	a5, 100(sp)                     # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	add	s2, s2, a0
	lw	a0, 64(sp)                      # 4-byte Folded Reload
	addi	a2, a2, 1
	add	a0, a0, t3
	sw	a0, 64(sp)                      # 4-byte Folded Spill
	beq	a2, s0, .LBB0_49
.LBB0_3:                                # %for.cond11.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_9 Depth 3
                                        #         Child Loop BB0_10 Depth 4
                                        #     Child Loop BB0_21 Depth 2
                                        #       Child Loop BB0_24 Depth 3
                                        #         Child Loop BB0_25 Depth 4
                                        #     Child Loop BB0_36 Depth 2
                                        #       Child Loop BB0_39 Depth 3
                                        #         Child Loop BB0_41 Depth 4
	lw	a0, 52(sp)                      # 4-byte Folded Reload
	lw	a1, 56(sp)                      # 4-byte Folded Reload
	sub	s0, s0, a2
	sw	s0, 96(sp)                      # 4-byte Folded Spill
	mul	a0, a0, a2
	mul	a0, a0, a1
	lw	a1, 60(sp)                      # 4-byte Folded Reload
	slli	a0, a0, 2
	sw	a2, 36(sp)                      # 4-byte Folded Spill
	sw	s2, 44(sp)                      # 4-byte Folded Spill
	add	a0, a0, a1
	sw	a0, 92(sp)                      # 4-byte Folded Spill
	blez	a5, .LBB0_18
# %bb.4:                                # %for.body14.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s2, 32(sp)                      # 4-byte Folded Reload
	lw	a0, 44(sp)                      # 4-byte Folded Reload
	lw	t1, 16(sp)                      # 4-byte Folded Reload
	li	a4, 0
	add	s2, s2, a0
	j	.LBB0_6
.LBB0_5:                                # %for.cond.cleanup20
                                        #   in Loop: Header=BB0_6 Depth=2
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	lw	a1, 92(sp)                      # 4-byte Folded Reload
	lw	a5, 100(sp)                     # 4-byte Folded Reload
	mul	a0, a0, a4
	slli	a0, a0, 2
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	lw	a0, 72(sp)                      # 4-byte Folded Reload
	addi	a4, a4, 1
	add	t1, t1, a0
	beq	a4, a5, .LBB0_18
.LBB0_6:                                # %for.body14
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_9 Depth 3
                                        #         Child Loop BB0_10 Depth 4
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	fmv.s	fa4, fa5
	bge	a0, s4, .LBB0_5
# %bb.7:                                # %for.body21.lr.ph
                                        #   in Loop: Header=BB0_6 Depth=2
	lw	a5, 100(sp)                     # 4-byte Folded Reload
	lw	t2, 64(sp)                      # 4-byte Folded Reload
	lw	t0, 96(sp)                      # 4-byte Folded Reload
	mv	s3, t1
	sub	a5, a5, a4
	fmv.s	fa4, fa5
	j	.LBB0_9
.LBB0_8:                                # %for.cond.cleanup26
                                        #   in Loop: Header=BB0_9 Depth=3
	addi	t0, t0, 1
	add	s3, s3, t4
	add	t2, t2, t3
	bge	t0, s4, .LBB0_5
.LBB0_9:                                # %for.body21
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_10 Depth 4
	mv	s0, t2
	mv	s1, s3
	mv	a3, a5
	bge	a5, s11, .LBB0_8
.LBB0_10:                               # %for.body27
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        #       Parent Loop BB0_9 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s0)
	flw	fa2, 0(s1)
	addi	a0, a3, 1
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a0, s11, .LBB0_8
# %bb.11:                               # %for.body27.1
                                        #   in Loop: Header=BB0_10 Depth=4
	add	a0, s0, a7
	add	a1, s1, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a1)
	addi	a2, a3, 2
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_8
# %bb.12:                               # %for.body27.2
                                        #   in Loop: Header=BB0_10 Depth=4
	add	a0, a0, a7
	add	a1, a1, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a1)
	addi	a2, a3, 3
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_8
# %bb.13:                               # %for.body27.3
                                        #   in Loop: Header=BB0_10 Depth=4
	add	a0, a0, a7
	add	a1, a1, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a1)
	addi	a2, a3, 4
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_8
# %bb.14:                               # %for.body27.4
                                        #   in Loop: Header=BB0_10 Depth=4
	add	a0, a0, a7
	add	a1, a1, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a1)
	addi	a2, a3, 5
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_8
# %bb.15:                               # %for.body27.5
                                        #   in Loop: Header=BB0_10 Depth=4
	add	a0, a0, a7
	add	a1, a1, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a1)
	addi	a2, a3, 6
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_8
# %bb.16:                               # %for.body27.6
                                        #   in Loop: Header=BB0_10 Depth=4
	add	a0, a0, a7
	add	a1, a1, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a1)
	addi	a2, a3, 7
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_8
# %bb.17:                               # %for.body27.7
                                        #   in Loop: Header=BB0_10 Depth=4
	add	a0, a0, a7
	add	a1, a1, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a1)
	addi	a3, a3, 8
	add	s1, s1, t5
	add	s0, s0, t6
	fmadd.s	fa4, fa3, fa2, fa4
	blt	a3, s11, .LBB0_10
	j	.LBB0_8
.LBB0_18:                               # %for.cond51.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 84(sp)                      # 4-byte Folded Reload
	bge	a5, a0, .LBB0_33
# %bb.19:                               # %for.body57.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 40(sp)                      # 4-byte Folded Reload
	lw	t1, 68(sp)                      # 4-byte Folded Reload
	slli	s3, s2, 2
	mv	t0, a5
	add	s3, s3, a0
	j	.LBB0_21
.LBB0_20:                               # %for.cond.cleanup67
                                        #   in Loop: Header=BB0_21 Depth=2
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	lw	a1, 92(sp)                      # 4-byte Folded Reload
	add	s2, s2, t1
	add	s3, s3, a7
	mul	a0, a0, t0
	slli	a0, a0, 2
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	lw	a0, 84(sp)                      # 4-byte Folded Reload
	addi	t0, t0, 1
	beq	t0, a0, .LBB0_33
.LBB0_21:                               # %for.body57
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_24 Depth 3
                                        #         Child Loop BB0_25 Depth 4
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	fmv.s	fa4, fa5
	bge	a0, s4, .LBB0_20
# %bb.22:                               # %for.cond70.preheader.preheader
                                        #   in Loop: Header=BB0_21 Depth=2
	lw	a2, 88(sp)                      # 4-byte Folded Reload
	lw	s0, 96(sp)                      # 4-byte Folded Reload
	mv	a5, s3
	fmv.s	fa4, fa5
	j	.LBB0_24
.LBB0_23:                               # %for.cond.cleanup73
                                        #   in Loop: Header=BB0_24 Depth=3
	addi	s0, s0, 1
	add	a2, a2, t4
	add	a5, a5, t3
	bge	s0, s4, .LBB0_20
.LBB0_24:                               # %for.cond70.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_21 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_25 Depth 4
	mv	a0, a5
	mv	s1, a2
	mv	a4, s11
	blez	s11, .LBB0_23
.LBB0_25:                               # %for.body74
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_21 Depth=2
                                        #       Parent Loop BB0_24 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a0)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s5, .LBB0_23
# %bb.26:                               # %for.body74.1
                                        #   in Loop: Header=BB0_25 Depth=4
	add	a1, a0, a7
	add	a3, s1, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s6, .LBB0_23
# %bb.27:                               # %for.body74.2
                                        #   in Loop: Header=BB0_25 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s7, .LBB0_23
# %bb.28:                               # %for.body74.3
                                        #   in Loop: Header=BB0_25 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, ra, .LBB0_23
# %bb.29:                               # %for.body74.4
                                        #   in Loop: Header=BB0_25 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s8, .LBB0_23
# %bb.30:                               # %for.body74.5
                                        #   in Loop: Header=BB0_25 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s9, .LBB0_23
# %bb.31:                               # %for.body74.6
                                        #   in Loop: Header=BB0_25 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, a6, .LBB0_23
# %bb.32:                               # %for.body74.7
                                        #   in Loop: Header=BB0_25 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	addi	a4, a4, -8
	add	s1, s1, t5
	add	a0, a0, t6
	fmadd.s	fa4, fa3, fa2, fa4
	bnez	a4, .LBB0_25
	j	.LBB0_23
.LBB0_33:                               # %for.cond.cleanup56
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 84(sp)                      # 4-byte Folded Reload
	lw	a1, 80(sp)                      # 4-byte Folded Reload
	blt	a1, a0, .LBB0_2
# %bb.34:                               # %for.body114.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	t2, 40(sp)                      # 4-byte Folded Reload
	lw	s3, 28(sp)                      # 4-byte Folded Reload
	slli	a2, s2, 2
	add	t2, t2, a2
	j	.LBB0_36
.LBB0_35:                               # %for.cond.cleanup124
                                        #   in Loop: Header=BB0_36 Depth=2
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	lw	a1, 92(sp)                      # 4-byte Folded Reload
	add	t2, t2, a7
	mul	a0, a0, s3
	slli	a0, a0, 2
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	lw	a0, 80(sp)                      # 4-byte Folded Reload
	addi	s3, s3, 1
	beq	s3, a0, .LBB0_2
.LBB0_36:                               # %for.body114
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_39 Depth 3
                                        #         Child Loop BB0_41 Depth 4
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	fmv.s	fa4, fa5
	bge	a0, s4, .LBB0_35
# %bb.37:                               # %for.cond127.preheader.lr.ph
                                        #   in Loop: Header=BB0_36 Depth=2
	lw	a0, 76(sp)                      # 4-byte Folded Reload
	lw	t1, 88(sp)                      # 4-byte Folded Reload
	lw	a4, 96(sp)                      # 4-byte Folded Reload
	mv	t0, t2
	add	a0, a0, s3
	not	a5, a0
	add	a5, a5, s11
	fmv.s	fa4, fa5
	j	.LBB0_39
.LBB0_38:                               # %for.cond.cleanup137
                                        #   in Loop: Header=BB0_39 Depth=3
	addi	a4, a4, 1
	add	t1, t1, t4
	add	t0, t0, t3
	bge	a4, s4, .LBB0_35
.LBB0_39:                               # %for.cond127.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_36 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_41 Depth 4
	blez	a5, .LBB0_38
# %bb.40:                               # %for.body138.lr.ph
                                        #   in Loop: Header=BB0_39 Depth=3
	li	a0, 0
	mv	s1, t0
	mv	a3, t1
.LBB0_41:                               # %for.body138
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_36 Depth=2
                                        #       Parent Loop BB0_39 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s1)
	flw	fa2, 0(a3)
	addi	a1, a0, 1
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, a5, .LBB0_38
# %bb.42:                               # %for.body138.1
                                        #   in Loop: Header=BB0_41 Depth=4
	add	a1, s1, a7
	add	s0, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s0)
	addi	a2, a0, 2
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_38
# %bb.43:                               # %for.body138.2
                                        #   in Loop: Header=BB0_41 Depth=4
	add	a1, a1, a7
	add	s0, s0, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s0)
	addi	a2, a0, 3
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_38
# %bb.44:                               # %for.body138.3
                                        #   in Loop: Header=BB0_41 Depth=4
	add	a1, a1, a7
	add	s0, s0, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s0)
	addi	a2, a0, 4
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_38
# %bb.45:                               # %for.body138.4
                                        #   in Loop: Header=BB0_41 Depth=4
	add	a1, a1, a7
	add	s0, s0, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s0)
	addi	a2, a0, 5
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_38
# %bb.46:                               # %for.body138.5
                                        #   in Loop: Header=BB0_41 Depth=4
	add	a1, a1, a7
	add	s0, s0, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s0)
	addi	a2, a0, 6
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_38
# %bb.47:                               # %for.body138.6
                                        #   in Loop: Header=BB0_41 Depth=4
	add	a1, a1, a7
	add	s0, s0, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s0)
	addi	a2, a0, 7
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_38
# %bb.48:                               # %for.body138.7
                                        #   in Loop: Header=BB0_41 Depth=4
	add	a1, a1, a7
	add	s0, s0, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s0)
	addi	a0, a0, 8
	add	a3, a3, t5
	add	s1, s1, t6
	fmadd.s	fa4, fa3, fa2, fa4
	blt	a0, a5, .LBB0_41
	j	.LBB0_38
.LBB0_49:                               # %for.cond176.preheader
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	lw	a1, 4(sp)                       # 4-byte Folded Reload
	lw	ra, 40(sp)                      # 4-byte Folded Reload
	sub	a0, a0, a1
	sw	a0, 64(sp)                      # 4-byte Folded Spill
	bge	s0, a0, .LBB0_83
# %bb.50:                               # %for.cond186.preheader.lr.ph
	lw	a6, 12(sp)                      # 4-byte Folded Reload
	lw	t0, 32(sp)                      # 4-byte Folded Reload
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	lw	t3, 8(sp)                       # 4-byte Folded Reload
	lw	t4, 48(sp)                      # 4-byte Folded Reload
	lw	t2, 24(sp)                      # 4-byte Folded Reload
	slli	a6, a6, 2
	slli	t0, t0, 2
	li	s9, 0
	add	a6, a6, a0
	neg	t1, s10
	slli	t3, t3, 2
	add	t0, t0, ra
	slli	t4, t4, 2
	fmv.w.x	fa5, zero
	j	.LBB0_52
.LBB0_51:                               # %for.cond.cleanup245
                                        #   in Loop: Header=BB0_52 Depth=1
	lw	a0, 48(sp)                      # 4-byte Folded Reload
	lw	a5, 100(sp)                     # 4-byte Folded Reload
	addi	t2, t2, 1
	add	t0, t0, t4
	add	s9, s9, a0
	lw	a0, 64(sp)                      # 4-byte Folded Reload
	beq	t2, a0, .LBB0_83
.LBB0_52:                               # %for.cond186.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_55 Depth 2
                                        #       Child Loop BB0_58 Depth 3
                                        #         Child Loop BB0_59 Depth 4
                                        #     Child Loop BB0_70 Depth 2
                                        #       Child Loop BB0_73 Depth 3
                                        #         Child Loop BB0_75 Depth 4
	lw	a0, 52(sp)                      # 4-byte Folded Reload
	lw	a1, 56(sp)                      # 4-byte Folded Reload
	lw	s3, 60(sp)                      # 4-byte Folded Reload
	mv	s5, s9
	mul	a0, a0, t2
	mul	a0, a0, a1
	slli	a0, a0, 2
	add	s3, s3, a0
	blez	a5, .LBB0_67
# %bb.53:                               # %for.body189.lr.ph
                                        #   in Loop: Header=BB0_52 Depth=1
	lw	s5, 32(sp)                      # 4-byte Folded Reload
	li	s7, 0
	mv	s6, a6
	add	s5, s5, s9
	j	.LBB0_55
.LBB0_54:                               # %for.cond.cleanup198
                                        #   in Loop: Header=BB0_55 Depth=2
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	add	s6, s6, t1
	mul	a0, a0, s7
	slli	a0, a0, 2
	add	a0, a0, s3
	fsw	fa4, 0(a0)
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	addi	s7, s7, 1
	beq	s7, a0, .LBB0_67
.LBB0_55:                               # %for.body189
                                        #   Parent Loop BB0_52 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_58 Depth 3
                                        #         Child Loop BB0_59 Depth 4
	fmv.s	fa4, fa5
	blez	s4, .LBB0_54
# %bb.56:                               # %for.body199.lr.ph
                                        #   in Loop: Header=BB0_55 Depth=2
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	li	s8, 0
	mv	s1, t0
	mv	a5, s6
	sub	s2, a0, s7
	fmv.s	fa4, fa5
	j	.LBB0_58
.LBB0_57:                               # %for.cond.cleanup205
                                        #   in Loop: Header=BB0_58 Depth=3
	addi	s8, s8, 1
	add	a5, a5, t3
	add	s1, s1, t4
	beq	s8, s4, .LBB0_54
.LBB0_58:                               # %for.body199
                                        #   Parent Loop BB0_52 Depth=1
                                        #     Parent Loop BB0_55 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_59 Depth 4
	mv	a0, s1
	mv	a4, a5
	mv	s0, s2
	bge	s2, s11, .LBB0_57
.LBB0_59:                               # %for.body206
                                        #   Parent Loop BB0_52 Depth=1
                                        #     Parent Loop BB0_55 Depth=2
                                        #       Parent Loop BB0_58 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a0)
	flw	fa2, 0(a4)
	addi	a1, s0, 1
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_57
# %bb.60:                               # %for.body206.1
                                        #   in Loop: Header=BB0_59 Depth=4
	add	a1, a0, a7
	add	a3, a4, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	addi	a2, s0, 2
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_57
# %bb.61:                               # %for.body206.2
                                        #   in Loop: Header=BB0_59 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	addi	a2, s0, 3
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_57
# %bb.62:                               # %for.body206.3
                                        #   in Loop: Header=BB0_59 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	addi	a2, s0, 4
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_57
# %bb.63:                               # %for.body206.4
                                        #   in Loop: Header=BB0_59 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	addi	a2, s0, 5
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_57
# %bb.64:                               # %for.body206.5
                                        #   in Loop: Header=BB0_59 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	addi	a2, s0, 6
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_57
# %bb.65:                               # %for.body206.6
                                        #   in Loop: Header=BB0_59 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	addi	a2, s0, 7
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, s11, .LBB0_57
# %bb.66:                               # %for.body206.7
                                        #   in Loop: Header=BB0_59 Depth=4
	add	a1, a1, a7
	add	a3, a3, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	addi	s0, s0, 8
	add	a4, a4, t5
	add	a0, a0, t6
	fmadd.s	fa4, fa3, fa2, fa4
	blt	s0, s11, .LBB0_59
	j	.LBB0_57
.LBB0_67:                               # %for.cond.cleanup188
                                        #   in Loop: Header=BB0_52 Depth=1
	lw	a0, 80(sp)                      # 4-byte Folded Reload
	lw	a1, 28(sp)                      # 4-byte Folded Reload
	bge	a1, a0, .LBB0_51
# %bb.68:                               # %for.body246.lr.ph
                                        #   in Loop: Header=BB0_52 Depth=1
	lw	s6, 28(sp)                      # 4-byte Folded Reload
	slli	s5, s5, 2
	add	s5, s5, ra
	j	.LBB0_70
.LBB0_69:                               # %for.cond.cleanup255
                                        #   in Loop: Header=BB0_70 Depth=2
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	add	s5, s5, a7
	mul	a0, a0, s6
	slli	a0, a0, 2
	add	a0, a0, s3
	fsw	fa4, 0(a0)
	lw	a0, 80(sp)                      # 4-byte Folded Reload
	addi	s6, s6, 1
	beq	s6, a0, .LBB0_51
.LBB0_70:                               # %for.body246
                                        #   Parent Loop BB0_52 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_73 Depth 3
                                        #         Child Loop BB0_75 Depth 4
	fmv.s	fa4, fa5
	blez	s4, .LBB0_69
# %bb.71:                               # %for.cond258.preheader.lr.ph
                                        #   in Loop: Header=BB0_70 Depth=2
	lw	a0, 76(sp)                      # 4-byte Folded Reload
	lw	s7, 88(sp)                      # 4-byte Folded Reload
	li	a4, 0
	mv	s2, s5
	add	a0, a0, s6
	not	a5, a0
	add	a5, a5, s11
	fmv.s	fa4, fa5
	j	.LBB0_73
.LBB0_72:                               # %for.cond.cleanup268
                                        #   in Loop: Header=BB0_73 Depth=3
	addi	a4, a4, 1
	add	s7, s7, t3
	add	s2, s2, t4
	beq	a4, s4, .LBB0_69
.LBB0_73:                               # %for.cond258.preheader
                                        #   Parent Loop BB0_52 Depth=1
                                        #     Parent Loop BB0_70 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_75 Depth 4
	blez	a5, .LBB0_72
# %bb.74:                               # %for.body269.lr.ph
                                        #   in Loop: Header=BB0_73 Depth=3
	li	a0, 0
	mv	a3, s2
	mv	s0, s7
.LBB0_75:                               # %for.body269
                                        #   Parent Loop BB0_52 Depth=1
                                        #     Parent Loop BB0_70 Depth=2
                                        #       Parent Loop BB0_73 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a3)
	flw	fa2, 0(s0)
	addi	a1, a0, 1
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, a5, .LBB0_72
# %bb.76:                               # %for.body269.1
                                        #   in Loop: Header=BB0_75 Depth=4
	add	a1, a3, a7
	add	s1, s0, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s1)
	addi	a2, a0, 2
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_72
# %bb.77:                               # %for.body269.2
                                        #   in Loop: Header=BB0_75 Depth=4
	add	a1, a1, a7
	add	s1, s1, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s1)
	addi	a2, a0, 3
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_72
# %bb.78:                               # %for.body269.3
                                        #   in Loop: Header=BB0_75 Depth=4
	add	a1, a1, a7
	add	s1, s1, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s1)
	addi	a2, a0, 4
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_72
# %bb.79:                               # %for.body269.4
                                        #   in Loop: Header=BB0_75 Depth=4
	add	a1, a1, a7
	add	s1, s1, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s1)
	addi	a2, a0, 5
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_72
# %bb.80:                               # %for.body269.5
                                        #   in Loop: Header=BB0_75 Depth=4
	add	a1, a1, a7
	add	s1, s1, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s1)
	addi	a2, a0, 6
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_72
# %bb.81:                               # %for.body269.6
                                        #   in Loop: Header=BB0_75 Depth=4
	add	a1, a1, a7
	add	s1, s1, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s1)
	addi	a2, a0, 7
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_72
# %bb.82:                               # %for.body269.7
                                        #   in Loop: Header=BB0_75 Depth=4
	add	a1, a1, a7
	add	s1, s1, s10
	flw	fa3, 0(a1)
	flw	fa2, 0(s1)
	addi	a0, a0, 8
	add	s0, s0, t5
	add	a3, a3, t6
	fmadd.s	fa4, fa3, fa2, fa4
	blt	a0, a5, .LBB0_75
	j	.LBB0_72
.LBB0_83:                               # %for.cond311.preheader
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	lw	a1, 64(sp)                      # 4-byte Folded Reload
	bge	a1, a0, .LBB0_133
# %bb.84:                               # %for.cond318.preheader.lr.ph
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	lw	a1, 4(sp)                       # 4-byte Folded Reload
	lw	t3, 8(sp)                       # 4-byte Folded Reload
	lw	s5, 48(sp)                      # 4-byte Folded Reload
	lw	a3, 64(sp)                      # 4-byte Folded Reload
	sub	a1, a1, a0
	lw	a0, 12(sp)                      # 4-byte Folded Reload
	sw	a1, 16(sp)                      # 4-byte Folded Spill
	lw	a1, 88(sp)                      # 4-byte Folded Reload
	li	a2, 0
	slli	a0, a0, 2
	slli	t3, t3, 2
	add	a0, a0, a1
	sw	a0, 12(sp)                      # 4-byte Folded Spill
	neg	a0, s10
	sw	a0, 92(sp)                      # 4-byte Folded Spill
	lw	a0, 32(sp)                      # 4-byte Folded Reload
	lw	a1, 40(sp)                      # 4-byte Folded Reload
	slli	s5, s5, 2
	fmv.w.x	fa5, zero
	slli	a0, a0, 2
	add	a0, a0, a1
	li	s9, 1
	li	s6, 2
	li	s8, 3
	li	s7, 4
	li	a6, 5
	li	t1, 6
	li	t2, 7
	sw	a0, 72(sp)                      # 4-byte Folded Spill
	j	.LBB0_86
.LBB0_85:                               # %for.cond.cleanup444
                                        #   in Loop: Header=BB0_86 Depth=1
	lw	a0, 48(sp)                      # 4-byte Folded Reload
	lw	a2, 44(sp)                      # 4-byte Folded Reload
	lw	a3, 36(sp)                      # 4-byte Folded Reload
	lw	a5, 100(sp)                     # 4-byte Folded Reload
	add	a2, a2, a0
	lw	a0, 72(sp)                      # 4-byte Folded Reload
	addi	a3, a3, 1
	add	a0, a0, s5
	sw	a0, 72(sp)                      # 4-byte Folded Spill
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	beq	a3, a0, .LBB0_133
.LBB0_86:                               # %for.cond318.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_89 Depth 2
                                        #       Child Loop BB0_92 Depth 3
                                        #         Child Loop BB0_93 Depth 4
                                        #     Child Loop BB0_105 Depth 2
                                        #       Child Loop BB0_108 Depth 3
                                        #         Child Loop BB0_109 Depth 4
                                        #     Child Loop BB0_120 Depth 2
                                        #       Child Loop BB0_123 Depth 3
                                        #         Child Loop BB0_125 Depth 4
	lw	a0, 16(sp)                      # 4-byte Folded Reload
	lw	a1, 52(sp)                      # 4-byte Folded Reload
	mv	t0, a2
	sw	a3, 36(sp)                      # 4-byte Folded Spill
	add	a0, a0, a3
	not	t4, a0
	lw	a0, 56(sp)                      # 4-byte Folded Reload
	mul	a1, a1, a3
	add	t4, t4, s4
	sw	a2, 44(sp)                      # 4-byte Folded Spill
	mul	a0, a1, a0
	lw	a1, 60(sp)                      # 4-byte Folded Reload
	slli	a0, a0, 2
	add	a0, a0, a1
	sw	a0, 96(sp)                      # 4-byte Folded Spill
	blez	a5, .LBB0_102
# %bb.87:                               # %for.body321.lr.ph
                                        #   in Loop: Header=BB0_86 Depth=1
	lw	a0, 32(sp)                      # 4-byte Folded Reload
	lw	t0, 12(sp)                      # 4-byte Folded Reload
	li	s2, 0
	add	a0, a0, a2
	sw	a0, 28(sp)                      # 4-byte Folded Spill
	j	.LBB0_89
.LBB0_88:                               # %for.cond.cleanup337
                                        #   in Loop: Header=BB0_89 Depth=2
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	lw	a1, 96(sp)                      # 4-byte Folded Reload
	lw	a5, 100(sp)                     # 4-byte Folded Reload
	mul	a0, a0, s2
	slli	a0, a0, 2
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	addi	s2, s2, 1
	add	t0, t0, a0
	beq	s2, a5, .LBB0_101
.LBB0_89:                               # %for.body321
                                        #   Parent Loop BB0_86 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_92 Depth 3
                                        #         Child Loop BB0_93 Depth 4
	fmv.s	fa4, fa5
	blez	t4, .LBB0_88
# %bb.90:                               # %for.body338.lr.ph
                                        #   in Loop: Header=BB0_89 Depth=2
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	lw	a2, 72(sp)                      # 4-byte Folded Reload
	li	a5, 0
	mv	s3, t0
	sub	a4, a0, s2
	fmv.s	fa4, fa5
	j	.LBB0_92
.LBB0_91:                               # %for.cond.cleanup344
                                        #   in Loop: Header=BB0_92 Depth=3
	addi	a5, a5, 1
	add	s3, s3, t3
	add	a2, a2, s5
	bge	a5, t4, .LBB0_88
.LBB0_92:                               # %for.body338
                                        #   Parent Loop BB0_86 Depth=1
                                        #     Parent Loop BB0_89 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_93 Depth 4
	mv	s1, a2
	mv	ra, s3
	mv	s0, a4
	bge	a4, s11, .LBB0_91
.LBB0_93:                               # %for.body345
                                        #   Parent Loop BB0_86 Depth=1
                                        #     Parent Loop BB0_89 Depth=2
                                        #       Parent Loop BB0_92 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s1)
	flw	fa2, 0(ra)
	addi	a0, s0, 1
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a0, s11, .LBB0_91
# %bb.94:                               # %for.body345.1
                                        #   in Loop: Header=BB0_93 Depth=4
	add	a0, s1, a7
	add	a3, ra, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a3)
	addi	a1, s0, 2
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_91
# %bb.95:                               # %for.body345.2
                                        #   in Loop: Header=BB0_93 Depth=4
	add	a0, a0, a7
	add	a3, a3, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a3)
	addi	a1, s0, 3
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_91
# %bb.96:                               # %for.body345.3
                                        #   in Loop: Header=BB0_93 Depth=4
	add	a0, a0, a7
	add	a3, a3, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a3)
	addi	a1, s0, 4
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_91
# %bb.97:                               # %for.body345.4
                                        #   in Loop: Header=BB0_93 Depth=4
	add	a0, a0, a7
	add	a3, a3, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a3)
	addi	a1, s0, 5
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_91
# %bb.98:                               # %for.body345.5
                                        #   in Loop: Header=BB0_93 Depth=4
	add	a0, a0, a7
	add	a3, a3, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a3)
	addi	a1, s0, 6
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_91
# %bb.99:                               # %for.body345.6
                                        #   in Loop: Header=BB0_93 Depth=4
	add	a0, a0, a7
	add	a3, a3, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a3)
	addi	a1, s0, 7
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_91
# %bb.100:                              # %for.body345.7
                                        #   in Loop: Header=BB0_93 Depth=4
	add	a0, a0, a7
	add	a3, a3, s10
	flw	fa3, 0(a0)
	flw	fa2, 0(a3)
	addi	s0, s0, 8
	add	ra, ra, t5
	add	s1, s1, t6
	fmadd.s	fa4, fa3, fa2, fa4
	blt	s0, s11, .LBB0_93
	j	.LBB0_91
.LBB0_101:                              #   in Loop: Header=BB0_86 Depth=1
	lw	t0, 28(sp)                      # 4-byte Folded Reload
.LBB0_102:                              # %for.cond376.preheader
                                        #   in Loop: Header=BB0_86 Depth=1
	lw	a0, 84(sp)                      # 4-byte Folded Reload
	bge	a5, a0, .LBB0_117
# %bb.103:                              # %for.body383.lr.ph
                                        #   in Loop: Header=BB0_86 Depth=1
	lw	a0, 40(sp)                      # 4-byte Folded Reload
	slli	ra, t0, 2
	mv	s2, a5
	add	ra, ra, a0
	j	.LBB0_105
.LBB0_104:                              # %for.cond.cleanup399
                                        #   in Loop: Header=BB0_105 Depth=2
	lw	a0, 68(sp)                      # 4-byte Folded Reload
	lw	a1, 96(sp)                      # 4-byte Folded Reload
	add	ra, ra, a7
	add	t0, t0, a0
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	mul	a0, a0, s2
	slli	a0, a0, 2
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	lw	a0, 84(sp)                      # 4-byte Folded Reload
	addi	s2, s2, 1
	beq	s2, a0, .LBB0_117
.LBB0_105:                              # %for.body383
                                        #   Parent Loop BB0_86 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_108 Depth 3
                                        #         Child Loop BB0_109 Depth 4
	fmv.s	fa4, fa5
	blez	t4, .LBB0_104
# %bb.106:                              # %for.cond402.preheader.preheader
                                        #   in Loop: Header=BB0_105 Depth=2
	lw	a1, 88(sp)                      # 4-byte Folded Reload
	li	a5, 0
	mv	s0, ra
	fmv.s	fa4, fa5
	j	.LBB0_108
.LBB0_107:                              # %for.cond.cleanup405
                                        #   in Loop: Header=BB0_108 Depth=3
	addi	a5, a5, 1
	add	a1, a1, t3
	add	s0, s0, s5
	bge	a5, t4, .LBB0_104
.LBB0_108:                              # %for.cond402.preheader
                                        #   Parent Loop BB0_86 Depth=1
                                        #     Parent Loop BB0_105 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_109 Depth 4
	mv	a0, s0
	mv	s1, a1
	mv	a4, s11
	blez	s11, .LBB0_107
.LBB0_109:                              # %for.body406
                                        #   Parent Loop BB0_86 Depth=1
                                        #     Parent Loop BB0_105 Depth=2
                                        #       Parent Loop BB0_108 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a0)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s9, .LBB0_107
# %bb.110:                              # %for.body406.1
                                        #   in Loop: Header=BB0_109 Depth=4
	add	a2, a0, a7
	add	a3, s1, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s6, .LBB0_107
# %bb.111:                              # %for.body406.2
                                        #   in Loop: Header=BB0_109 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s8, .LBB0_107
# %bb.112:                              # %for.body406.3
                                        #   in Loop: Header=BB0_109 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s7, .LBB0_107
# %bb.113:                              # %for.body406.4
                                        #   in Loop: Header=BB0_109 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, a6, .LBB0_107
# %bb.114:                              # %for.body406.5
                                        #   in Loop: Header=BB0_109 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, t1, .LBB0_107
# %bb.115:                              # %for.body406.6
                                        #   in Loop: Header=BB0_109 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, t2, .LBB0_107
# %bb.116:                              # %for.body406.7
                                        #   in Loop: Header=BB0_109 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	addi	a4, a4, -8
	add	s1, s1, t5
	add	a0, a0, t6
	fmadd.s	fa4, fa3, fa2, fa4
	bnez	a4, .LBB0_109
	j	.LBB0_107
.LBB0_117:                              # %for.cond441.preheader
                                        #   in Loop: Header=BB0_86 Depth=1
	lw	a0, 84(sp)                      # 4-byte Folded Reload
	lw	a1, 80(sp)                      # 4-byte Folded Reload
	bge	a0, a1, .LBB0_85
# %bb.118:                              # %for.body445.lr.ph
                                        #   in Loop: Header=BB0_86 Depth=1
	lw	a0, 40(sp)                      # 4-byte Folded Reload
	lw	ra, 84(sp)                      # 4-byte Folded Reload
	slli	t0, t0, 2
	add	t0, t0, a0
	j	.LBB0_120
.LBB0_119:                              # %for.cond.cleanup461
                                        #   in Loop: Header=BB0_120 Depth=2
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	lw	a1, 96(sp)                      # 4-byte Folded Reload
	add	t0, t0, a7
	mul	a0, a0, ra
	slli	a0, a0, 2
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	lw	a0, 80(sp)                      # 4-byte Folded Reload
	addi	ra, ra, 1
	beq	ra, a0, .LBB0_85
.LBB0_120:                              # %for.body445
                                        #   Parent Loop BB0_86 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_123 Depth 3
                                        #         Child Loop BB0_125 Depth 4
	fmv.s	fa4, fa5
	blez	t4, .LBB0_119
# %bb.121:                              # %for.cond464.preheader.lr.ph
                                        #   in Loop: Header=BB0_120 Depth=2
	lw	a0, 76(sp)                      # 4-byte Folded Reload
	lw	s3, 88(sp)                      # 4-byte Folded Reload
	li	a4, 0
	mv	s2, t0
	add	a0, a0, ra
	not	a5, a0
	add	a5, a5, s11
	fmv.s	fa4, fa5
	j	.LBB0_123
.LBB0_122:                              # %for.cond.cleanup474
                                        #   in Loop: Header=BB0_123 Depth=3
	addi	a4, a4, 1
	add	s3, s3, t3
	add	s2, s2, s5
	bge	a4, t4, .LBB0_119
.LBB0_123:                              # %for.cond464.preheader
                                        #   Parent Loop BB0_86 Depth=1
                                        #     Parent Loop BB0_120 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_125 Depth 4
	blez	a5, .LBB0_122
# %bb.124:                              # %for.body475.lr.ph
                                        #   in Loop: Header=BB0_123 Depth=3
	li	a0, 0
	mv	a3, s2
	mv	s1, s3
.LBB0_125:                              # %for.body475
                                        #   Parent Loop BB0_86 Depth=1
                                        #     Parent Loop BB0_120 Depth=2
                                        #       Parent Loop BB0_123 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a3)
	flw	fa2, 0(s1)
	addi	a2, a0, 1
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a2, a5, .LBB0_122
# %bb.126:                              # %for.body475.1
                                        #   in Loop: Header=BB0_125 Depth=4
	add	a2, a3, a7
	add	s0, s1, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(s0)
	addi	a1, a0, 2
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, a5, .LBB0_122
# %bb.127:                              # %for.body475.2
                                        #   in Loop: Header=BB0_125 Depth=4
	add	a2, a2, a7
	add	s0, s0, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(s0)
	addi	a1, a0, 3
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, a5, .LBB0_122
# %bb.128:                              # %for.body475.3
                                        #   in Loop: Header=BB0_125 Depth=4
	add	a2, a2, a7
	add	s0, s0, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(s0)
	addi	a1, a0, 4
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, a5, .LBB0_122
# %bb.129:                              # %for.body475.4
                                        #   in Loop: Header=BB0_125 Depth=4
	add	a2, a2, a7
	add	s0, s0, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(s0)
	addi	a1, a0, 5
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, a5, .LBB0_122
# %bb.130:                              # %for.body475.5
                                        #   in Loop: Header=BB0_125 Depth=4
	add	a2, a2, a7
	add	s0, s0, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(s0)
	addi	a1, a0, 6
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, a5, .LBB0_122
# %bb.131:                              # %for.body475.6
                                        #   in Loop: Header=BB0_125 Depth=4
	add	a2, a2, a7
	add	s0, s0, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(s0)
	addi	a1, a0, 7
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, a5, .LBB0_122
# %bb.132:                              # %for.body475.7
                                        #   in Loop: Header=BB0_125 Depth=4
	add	a2, a2, a7
	add	s0, s0, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(s0)
	addi	a0, a0, 8
	add	s1, s1, t5
	add	a3, a3, t6
	fmadd.s	fa4, fa3, fa2, fa4
	blt	a0, a5, .LBB0_125
	j	.LBB0_122
.LBB0_133:                              # %for.cond513.preheader
	lw	s9, 40(sp)                      # 4-byte Folded Reload
	lw	ra, 24(sp)                      # 4-byte Folded Reload
	lw	a0, 64(sp)                      # 4-byte Folded Reload
	bge	ra, a0, .LBB0_151
# %bb.134:                              # %for.cond523.preheader.lr.ph
	lw	a6, 8(sp)                       # 4-byte Folded Reload
	lw	s8, 48(sp)                      # 4-byte Folded Reload
	fmv.w.x	fa5, zero
	li	s7, 1
	slli	a6, a6, 2
	slli	s8, s8, 2
	li	t4, 2
	li	t3, 3
	li	t0, 4
	li	t1, 5
	li	t2, 6
	li	s2, 7
	j	.LBB0_136
.LBB0_135:                              # %for.cond.cleanup529
                                        #   in Loop: Header=BB0_136 Depth=1
	lw	a5, 100(sp)                     # 4-byte Folded Reload
	lw	a0, 64(sp)                      # 4-byte Folded Reload
	addi	ra, ra, 1
	add	s9, s9, s8
	beq	ra, a0, .LBB0_151
.LBB0_136:                              # %for.cond523.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_139 Depth 2
                                        #       Child Loop BB0_142 Depth 3
                                        #         Child Loop BB0_143 Depth 4
	lw	a0, 84(sp)                      # 4-byte Folded Reload
	bge	a5, a0, .LBB0_135
# %bb.137:                              #   in Loop: Header=BB0_136 Depth=1
	lw	a0, 52(sp)                      # 4-byte Folded Reload
	lw	a1, 56(sp)                      # 4-byte Folded Reload
	lw	s3, 60(sp)                      # 4-byte Folded Reload
	lw	s6, 100(sp)                     # 4-byte Folded Reload
	mul	a0, a0, ra
	mul	a0, a0, a1
	slli	a0, a0, 2
	add	s3, s3, a0
	mv	s5, s9
	j	.LBB0_139
.LBB0_138:                              # %for.cond.cleanup539
                                        #   in Loop: Header=BB0_139 Depth=2
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	add	s5, s5, a7
	mul	a0, a0, s6
	slli	a0, a0, 2
	add	a0, a0, s3
	fsw	fa4, 0(a0)
	lw	a0, 84(sp)                      # 4-byte Folded Reload
	addi	s6, s6, 1
	beq	s6, a0, .LBB0_135
.LBB0_139:                              # %for.body530
                                        #   Parent Loop BB0_136 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_142 Depth 3
                                        #         Child Loop BB0_143 Depth 4
	fmv.s	fa4, fa5
	blez	s4, .LBB0_138
# %bb.140:                              # %for.cond542.preheader.preheader
                                        #   in Loop: Header=BB0_139 Depth=2
	lw	a1, 88(sp)                      # 4-byte Folded Reload
	li	a5, 0
	mv	s0, s5
	fmv.s	fa4, fa5
	j	.LBB0_142
.LBB0_141:                              # %for.cond.cleanup545
                                        #   in Loop: Header=BB0_142 Depth=3
	addi	a5, a5, 1
	add	a1, a1, a6
	add	s0, s0, s8
	beq	a5, s4, .LBB0_138
.LBB0_142:                              # %for.cond542.preheader
                                        #   Parent Loop BB0_136 Depth=1
                                        #     Parent Loop BB0_139 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_143 Depth 4
	mv	a0, s0
	mv	s1, a1
	mv	a4, s11
	blez	s11, .LBB0_141
.LBB0_143:                              # %for.body546
                                        #   Parent Loop BB0_136 Depth=1
                                        #     Parent Loop BB0_139 Depth=2
                                        #       Parent Loop BB0_142 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a0)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s7, .LBB0_141
# %bb.144:                              # %for.body546.1
                                        #   in Loop: Header=BB0_143 Depth=4
	add	a2, a0, a7
	add	a3, s1, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, t4, .LBB0_141
# %bb.145:                              # %for.body546.2
                                        #   in Loop: Header=BB0_143 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, t3, .LBB0_141
# %bb.146:                              # %for.body546.3
                                        #   in Loop: Header=BB0_143 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, t0, .LBB0_141
# %bb.147:                              # %for.body546.4
                                        #   in Loop: Header=BB0_143 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, t1, .LBB0_141
# %bb.148:                              # %for.body546.5
                                        #   in Loop: Header=BB0_143 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, t2, .LBB0_141
# %bb.149:                              # %for.body546.6
                                        #   in Loop: Header=BB0_143 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s2, .LBB0_141
# %bb.150:                              # %for.body546.7
                                        #   in Loop: Header=BB0_143 Depth=4
	add	a2, a2, a7
	add	a3, a3, s10
	flw	fa3, 0(a2)
	flw	fa2, 0(a3)
	addi	a4, a4, -8
	add	s1, s1, t5
	add	a0, a0, t6
	fmadd.s	fa4, fa3, fa2, fa4
	bnez	a4, .LBB0_143
	j	.LBB0_141
.LBB0_151:                              # %for.cond.cleanup519
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
	li	a0, 0
	addi	sp, sp, 160
	ret
.Lfunc_end0:
	.size	dspi_conv_f32_arp4, .Lfunc_end0-dspi_conv_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"
	.section	".note.GNU-stack","",@progbits
