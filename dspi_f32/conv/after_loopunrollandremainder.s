.option	arch, -zcb, +zcmp
# 2025-01-06 10:27:39
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
	lw	a4, 20(a0)
	lw	a3, 24(a0)
	sw	a4, 20(a2)
	lw	s11, 20(a1)
	sw	a3, 20(sp)                      # 4-byte Folded Spill
	sw	a3, 24(a2)
	lw	a3, 0(a0)
	sw	a3, 96(sp)                      # 4-byte Folded Spill
	lw	a3, 0(a2)
	sw	a3, 52(sp)                      # 4-byte Folded Spill
	addi	a3, s11, -1
	lw	ra, 24(a1)
	lw	s1, 12(a0)
	lw	a5, 8(a0)
	srai	s0, a3, 1
	addi	a3, ra, -1
	srai	a3, a3, 1
	mul	a5, a5, s1
	sw	a5, 100(sp)                     # 4-byte Folded Spill
	lw	a6, 12(a1)
	lw	a7, 8(a1)
	lw	s1, 4(a1)
	lw	a5, 8(a2)
	sw	a5, 48(sp)                      # 4-byte Folded Spill
	lw	a5, 12(a2)
	sw	a5, 44(sp)                      # 4-byte Folded Spill
	lw	a2, 4(a2)
	sw	a2, 92(sp)                      # 4-byte Folded Spill
	lw	t6, 4(a0)
	lw	a0, 0(a1)
	sw	a0, 76(sp)                      # 4-byte Folded Spill
	srli	a0, s11, 31
	add	a0, a0, s11
	srai	a0, a0, 1
	sub	a2, a4, a0
	srli	a1, ra, 31
	add	a1, a1, ra
	srai	a1, a1, 1
	sw	a1, 12(sp)                      # 4-byte Folded Spill
	sw	a4, 60(sp)                      # 4-byte Folded Spill
	sub	a0, a0, a4
	sw	a0, 56(sp)                      # 4-byte Folded Spill
	sw	a2, 64(sp)                      # 4-byte Folded Spill
	addi	a2, a2, -1
	sw	a2, 28(sp)                      # 4-byte Folded Spill
	slli	t1, t6, 2
	mul	a0, a7, a6
	sw	a0, 16(sp)                      # 4-byte Folded Spill
	slli	s10, s1, 2
	slli	s6, s1, 5
	slli	s5, t6, 5
	sw	ra, 104(sp)                     # 4-byte Folded Spill
	sw	s0, 88(sp)                      # 4-byte Folded Spill
	sw	a3, 24(sp)                      # 4-byte Folded Spill
	blez	a3, .LBB0_48
# %bb.1:                                # %for.cond11.preheader.lr.ph
	li	a1, 0
	li	a2, 0
	slli	t3, t6, 1
	add	a6, t3, t6
	add	t0, t1, t6
	li	a0, 6
	mul	t2, t6, a0
	slli	a0, t6, 3
	sub	s8, a0, t6
	addi	s4, s11, -7
	lw	s3, 16(sp)                      # 4-byte Folded Reload
	slli	s3, s3, 2
	lw	s9, 100(sp)                     # 4-byte Folded Reload
	slli	s9, s9, 2
	fmv.w.x	fa5, zero
	slli	a6, a6, 2
	slli	t0, t0, 2
	slli	t2, t2, 2
	slli	s8, s8, 2
	li	s2, 1
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	sw	a0, 40(sp)                      # 4-byte Folded Spill
	j	.LBB0_3
.LBB0_2:                                # %for.cond.cleanup113
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	lw	a2, 36(sp)                      # 4-byte Folded Reload
	add	a2, a2, a0
	lw	a1, 32(sp)                      # 4-byte Folded Reload
	addi	a1, a1, 1
	lw	a0, 40(sp)                      # 4-byte Folded Reload
	add	a0, a0, s9
	sw	a0, 40(sp)                      # 4-byte Folded Spill
	lw	s0, 88(sp)                      # 4-byte Folded Reload
	lw	a3, 24(sp)                      # 4-byte Folded Reload
	li	s2, 1
	beq	a1, a3, .LBB0_48
.LBB0_3:                                # %for.cond11.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_10 Depth 3
                                        #         Child Loop BB0_12 Depth 4
                                        #         Child Loop BB0_16 Depth 4
                                        #     Child Loop BB0_20 Depth 2
                                        #       Child Loop BB0_23 Depth 3
                                        #         Child Loop BB0_24 Depth 4
                                        #     Child Loop BB0_35 Depth 2
                                        #       Child Loop BB0_38 Depth 3
                                        #         Child Loop BB0_40 Depth 4
	sub	a3, a3, a1
	sw	a3, 80(sp)                      # 4-byte Folded Spill
	lw	a0, 44(sp)                      # 4-byte Folded Reload
	sw	a1, 32(sp)                      # 4-byte Folded Spill
	mul	a0, a0, a1
	lw	a1, 48(sp)                      # 4-byte Folded Reload
	mul	a0, a0, a1
	slli	a0, a0, 2
	lw	a1, 52(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 72(sp)                      # 4-byte Folded Spill
	sw	a2, 36(sp)                      # 4-byte Folded Spill
	sw	a2, 84(sp)                      # 4-byte Folded Spill
	blez	s0, .LBB0_17
# %bb.4:                                # %for.body14.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	li	a4, 0
	lw	a0, 40(sp)                      # 4-byte Folded Reload
	sw	a0, 68(sp)                      # 4-byte Folded Spill
	lw	a0, 36(sp)                      # 4-byte Folded Reload
	sw	a0, 84(sp)                      # 4-byte Folded Spill
	j	.LBB0_6
.LBB0_5:                                # %for.cond.cleanup20
                                        #   in Loop: Header=BB0_6 Depth=2
	lw	a0, 84(sp)                      # 4-byte Folded Reload
	add	a0, a0, t6
	sw	a0, 84(sp)                      # 4-byte Folded Spill
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	mul	a1, a0, a4
	slli	a1, a1, 2
	lw	a0, 72(sp)                      # 4-byte Folded Reload
	add	a1, a1, a0
	fsw	fa4, 0(a1)
	addi	a4, a4, 1
	lw	a0, 68(sp)                      # 4-byte Folded Reload
	add	a0, a0, t1
	sw	a0, 68(sp)                      # 4-byte Folded Spill
	lw	ra, 104(sp)                     # 4-byte Folded Reload
	lw	s0, 88(sp)                      # 4-byte Folded Reload
	beq	a4, s0, .LBB0_17
.LBB0_6:                                # %for.body14
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_10 Depth 3
                                        #         Child Loop BB0_12 Depth 4
                                        #         Child Loop BB0_16 Depth 4
	fmv.s	fa4, fa5
	lw	a0, 80(sp)                      # 4-byte Folded Reload
	bge	a0, ra, .LBB0_5
# %bb.7:                                # %for.body21.preheader
                                        #   in Loop: Header=BB0_6 Depth=2
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	sub	t4, a0, a4
	lw	a1, 68(sp)                      # 4-byte Folded Reload
	lw	s7, 76(sp)                      # 4-byte Folded Reload
	lw	ra, 80(sp)                      # 4-byte Folded Reload
	fmv.s	fa4, fa5
	lw	t5, 84(sp)                      # 4-byte Folded Reload
	j	.LBB0_10
.LBB0_8:                                #   in Loop: Header=BB0_10 Depth=3
	li	s2, 1
.LBB0_9:                                # %for.cond.cleanup26
                                        #   in Loop: Header=BB0_10 Depth=3
	add	s7, s7, s3
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	add	t5, t5, a0
	addi	ra, ra, 1
	add	a1, a1, s9
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	bge	ra, a0, .LBB0_5
.LBB0_10:                               # %for.body21
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_12 Depth 4
                                        #         Child Loop BB0_16 Depth 4
	bge	t4, s4, .LBB0_14
# %bb.11:                               # %for.body27.7.preheader
                                        #   in Loop: Header=BB0_10 Depth=3
	slli	a3, t5, 2
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	add	a3, a3, a0
	mv	a5, t4
.LBB0_12:                               # %for.body27.7
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        #       Parent Loop BB0_10 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	mul	a2, t6, a5
	slli	a2, a2, 2
	add	s0, a3, a2
	flw	fa3, 0(s0)
	mul	s2, s1, a5
	slli	a2, s2, 2
	add	a2, a2, s7
	flw	fa2, 0(a2)
	fmadd.s	fa4, fa3, fa2, fa4
	add	a2, s2, s1
	add	a7, s0, t1
	flw	fa3, 0(a7)
	slli	a2, a2, 2
	add	a2, a2, s7
	flw	fa2, 0(a2)
	addi	a2, a5, 2
	mul	a2, s1, a2
	slli	a0, t3, 2
	add	a0, a0, s0
	flw	fa1, 0(a0)
	slli	a2, a2, 2
	add	a2, a2, s7
	flw	fa0, 0(a2)
	addi	a0, a5, 3
	mul	a0, s1, a0
	add	a2, s0, a6
	flw	ft0, 0(a2)
	slli	a0, a0, 2
	add	a0, a0, s7
	flw	ft1, 0(a0)
	addi	a0, a5, 4
	mul	a0, s1, a0
	slli	a2, t1, 2
	add	a2, a2, s0
	flw	ft2, 0(a2)
	slli	a0, a0, 2
	add	a0, a0, s7
	flw	ft3, 0(a0)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	addi	a0, a5, 5
	mul	a0, s1, a0
	add	a2, s0, t0
	flw	fa3, 0(a2)
	slli	a0, a0, 2
	add	a0, a0, s7
	flw	fa2, 0(a0)
	addi	a0, a5, 6
	mul	a0, s1, a0
	add	a2, s0, t2
	flw	fa1, 0(a2)
	slli	a0, a0, 2
	add	a0, a0, s7
	flw	fa0, 0(a0)
	addi	a5, a5, 7
	mul	a0, s1, a5
	add	s0, s0, s8
	flw	ft0, 0(s0)
	slli	a0, a0, 2
	add	a0, a0, s7
	flw	ft1, 0(a0)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	addi	a5, s2, 8
	fmadd.s	fa4, ft0, ft1, fa4
	blt	a5, s4, .LBB0_12
# %bb.13:                               # %for.cond.preheader
                                        #   in Loop: Header=BB0_10 Depth=3
	bge	a5, s11, .LBB0_8
	j	.LBB0_15
.LBB0_14:                               #   in Loop: Header=BB0_10 Depth=3
	mv	a5, t4
	bge	t4, s11, .LBB0_8
.LBB0_15:                               # %for.body27.clone.lr.ph
                                        #   in Loop: Header=BB0_10 Depth=3
	sub	a2, s11, a5
	mul	a3, s10, a5
	add	a3, a3, s7
	mul	a5, t1, a5
	add	a5, a5, a1
	li	s2, 1
.LBB0_16:                               # %for.body27.clone
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        #       Parent Loop BB0_10 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a2, a2, -1
	add	a3, a3, s10
	add	a5, a5, t1
	bnez	a2, .LBB0_16
	j	.LBB0_9
.LBB0_17:                               # %for.cond51.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 64(sp)                      # 4-byte Folded Reload
	bge	s0, a0, .LBB0_32
# %bb.18:                               # %for.body57.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s7, 84(sp)                      # 4-byte Folded Reload
	slli	s7, s7, 2
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	add	s7, s7, a0
	mv	t4, s0
	j	.LBB0_20
.LBB0_19:                               # %for.cond.cleanup67
                                        #   in Loop: Header=BB0_20 Depth=2
	lw	a0, 84(sp)                      # 4-byte Folded Reload
	add	a0, a0, t6
	sw	a0, 84(sp)                      # 4-byte Folded Spill
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	mul	a0, a0, t4
	slli	a0, a0, 2
	lw	a1, 72(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	t4, t4, 1
	add	s7, s7, t1
	lw	a0, 64(sp)                      # 4-byte Folded Reload
	beq	t4, a0, .LBB0_32
.LBB0_20:                               # %for.body57
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_23 Depth 3
                                        #         Child Loop BB0_24 Depth 4
	fmv.s	fa4, fa5
	lw	a0, 80(sp)                      # 4-byte Folded Reload
	bge	a0, ra, .LBB0_19
# %bb.21:                               # %for.cond70.preheader.preheader
                                        #   in Loop: Header=BB0_20 Depth=2
	mv	t5, s7
	lw	a7, 76(sp)                      # 4-byte Folded Reload
	lw	s0, 80(sp)                      # 4-byte Folded Reload
	fmv.s	fa4, fa5
	j	.LBB0_23
.LBB0_22:                               # %for.cond.cleanup73
                                        #   in Loop: Header=BB0_23 Depth=3
	addi	s0, s0, 1
	add	a7, a7, s3
	add	t5, t5, s9
	bge	s0, ra, .LBB0_19
.LBB0_23:                               # %for.cond70.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_24 Depth 4
	mv	a3, t5
	mv	a2, a7
	mv	a4, s11
	blez	s11, .LBB0_22
.LBB0_24:                               # %for.body74
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_23 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a3)
	flw	fa2, 0(a2)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s2, .LBB0_22
# %bb.25:                               # %for.body74.1
                                        #   in Loop: Header=BB0_24 Depth=4
	add	a0, a3, t1
	flw	fa3, 0(a0)
	add	a5, a2, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	li	a1, 2
	beq	a4, a1, .LBB0_22
# %bb.26:                               # %for.body74.2
                                        #   in Loop: Header=BB0_24 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	li	a1, 3
	beq	a4, a1, .LBB0_22
# %bb.27:                               # %for.body74.3
                                        #   in Loop: Header=BB0_24 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	li	a1, 4
	beq	a4, a1, .LBB0_22
# %bb.28:                               # %for.body74.4
                                        #   in Loop: Header=BB0_24 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	li	a1, 5
	beq	a4, a1, .LBB0_22
# %bb.29:                               # %for.body74.5
                                        #   in Loop: Header=BB0_24 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	li	a1, 6
	beq	a4, a1, .LBB0_22
# %bb.30:                               # %for.body74.6
                                        #   in Loop: Header=BB0_24 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	li	a1, 7
	beq	a4, a1, .LBB0_22
# %bb.31:                               # %for.body74.7
                                        #   in Loop: Header=BB0_24 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a4, a4, -8
	add	a2, a2, s6
	add	a3, a3, s5
	bnez	a4, .LBB0_24
	j	.LBB0_22
.LBB0_32:                               # %for.cond.cleanup56
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 64(sp)                      # 4-byte Folded Reload
	lw	a1, 60(sp)                      # 4-byte Folded Reload
	blt	a1, a0, .LBB0_2
# %bb.33:                               # %for.body114.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s2, 84(sp)                      # 4-byte Folded Reload
	slli	s2, s2, 2
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	add	s2, s2, a0
	lw	t5, 28(sp)                      # 4-byte Folded Reload
	j	.LBB0_35
.LBB0_34:                               # %for.cond.cleanup124
                                        #   in Loop: Header=BB0_35 Depth=2
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	mul	a0, a0, t5
	slli	a0, a0, 2
	lw	a1, 72(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	t5, t5, 1
	add	s2, s2, t1
	lw	a0, 60(sp)                      # 4-byte Folded Reload
	beq	t5, a0, .LBB0_2
.LBB0_35:                               # %for.body114
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_38 Depth 3
                                        #         Child Loop BB0_40 Depth 4
	fmv.s	fa4, fa5
	lw	a0, 80(sp)                      # 4-byte Folded Reload
	bge	a0, ra, .LBB0_34
# %bb.36:                               # %for.cond127.preheader.preheader
                                        #   in Loop: Header=BB0_35 Depth=2
	lw	a0, 56(sp)                      # 4-byte Folded Reload
	add	a0, a0, t5
	not	a2, a0
	add	a2, a2, s11
	mv	t4, s2
	lw	s7, 76(sp)                      # 4-byte Folded Reload
	lw	a7, 80(sp)                      # 4-byte Folded Reload
	fmv.s	fa4, fa5
	j	.LBB0_38
.LBB0_37:                               # %for.cond.cleanup137
                                        #   in Loop: Header=BB0_38 Depth=3
	addi	a7, a7, 1
	add	s7, s7, s3
	add	t4, t4, s9
	bge	a7, ra, .LBB0_34
.LBB0_38:                               # %for.cond127.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_35 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_40 Depth 4
	blez	a2, .LBB0_37
# %bb.39:                               # %for.body138.preheader
                                        #   in Loop: Header=BB0_38 Depth=3
	li	a3, 0
	mv	a5, t4
	mv	s0, s7
.LBB0_40:                               # %for.body138
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_35 Depth=2
                                        #       Parent Loop BB0_38 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(s0)
	addi	a0, a3, 1
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a0, a2, .LBB0_37
# %bb.41:                               # %for.body138.1
                                        #   in Loop: Header=BB0_40 Depth=4
	add	a1, a5, t1
	flw	fa3, 0(a1)
	add	a0, s0, s10
	flw	fa2, 0(a0)
	addi	a4, a3, 2
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a4, a2, .LBB0_37
# %bb.42:                               # %for.body138.2
                                        #   in Loop: Header=BB0_40 Depth=4
	add	a1, a1, t1
	flw	fa3, 0(a1)
	add	a0, a0, s10
	flw	fa2, 0(a0)
	addi	a4, a3, 3
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a4, a2, .LBB0_37
# %bb.43:                               # %for.body138.3
                                        #   in Loop: Header=BB0_40 Depth=4
	add	a1, a1, t1
	flw	fa3, 0(a1)
	add	a0, a0, s10
	flw	fa2, 0(a0)
	addi	a4, a3, 4
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a4, a2, .LBB0_37
# %bb.44:                               # %for.body138.4
                                        #   in Loop: Header=BB0_40 Depth=4
	add	a1, a1, t1
	flw	fa3, 0(a1)
	add	a0, a0, s10
	flw	fa2, 0(a0)
	addi	a4, a3, 5
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a4, a2, .LBB0_37
# %bb.45:                               # %for.body138.5
                                        #   in Loop: Header=BB0_40 Depth=4
	add	a1, a1, t1
	flw	fa3, 0(a1)
	add	a0, a0, s10
	flw	fa2, 0(a0)
	addi	a4, a3, 6
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a4, a2, .LBB0_37
# %bb.46:                               # %for.body138.6
                                        #   in Loop: Header=BB0_40 Depth=4
	add	a1, a1, t1
	flw	fa3, 0(a1)
	add	a0, a0, s10
	flw	fa2, 0(a0)
	addi	a4, a3, 7
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a4, a2, .LBB0_37
# %bb.47:                               # %for.body138.7
                                        #   in Loop: Header=BB0_40 Depth=4
	add	a1, a1, t1
	flw	fa3, 0(a1)
	add	a0, a0, s10
	flw	fa2, 0(a0)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, 8
	add	s0, s0, s6
	add	a5, a5, s5
	blt	a3, a2, .LBB0_40
	j	.LBB0_37
.LBB0_48:                               # %for.cond176.preheader
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	lw	a1, 12(sp)                      # 4-byte Folded Reload
	sub	s9, a0, a1
	mul	a0, s1, s0
	sw	a0, 80(sp)                      # 4-byte Folded Spill
	mul	a0, t6, s0
	sw	a0, 84(sp)                      # 4-byte Folded Spill
	sw	s9, 36(sp)                      # 4-byte Folded Spill
	bge	a3, s9, .LBB0_82
# %bb.49:                               # %for.cond186.preheader.lr.ph
	li	a7, 0
	lw	t0, 80(sp)                      # 4-byte Folded Reload
	slli	t0, t0, 2
	lw	a0, 76(sp)                      # 4-byte Folded Reload
	add	t0, t0, a0
	neg	t4, s10
	lw	s7, 16(sp)                      # 4-byte Folded Reload
	slli	s7, s7, 2
	lw	t2, 84(sp)                      # 4-byte Folded Reload
	slli	t2, t2, 2
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	add	t2, t2, a0
	lw	s8, 100(sp)                     # 4-byte Folded Reload
	slli	s8, s8, 2
	fmv.w.x	fa5, zero
	lw	t3, 24(sp)                      # 4-byte Folded Reload
	j	.LBB0_51
.LBB0_50:                               # %for.cond.cleanup245
                                        #   in Loop: Header=BB0_51 Depth=1
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	add	a7, a7, a0
	addi	t3, t3, 1
	add	t2, t2, s8
	beq	t3, s9, .LBB0_82
.LBB0_51:                               # %for.cond186.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_54 Depth 2
                                        #       Child Loop BB0_57 Depth 3
                                        #         Child Loop BB0_58 Depth 4
                                        #     Child Loop BB0_69 Depth 2
                                        #       Child Loop BB0_72 Depth 3
                                        #         Child Loop BB0_74 Depth 4
	lw	a0, 44(sp)                      # 4-byte Folded Reload
	mul	a0, a0, t3
	lw	a1, 48(sp)                      # 4-byte Folded Reload
	mul	a0, a0, a1
	slli	a0, a0, 2
	lw	t5, 52(sp)                      # 4-byte Folded Reload
	add	t5, t5, a0
	mv	s3, a7
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	blez	a0, .LBB0_66
# %bb.52:                               # %for.body189.preheader
                                        #   in Loop: Header=BB0_51 Depth=1
	li	s4, 0
	mv	s2, t0
	mv	s3, a7
	j	.LBB0_54
.LBB0_53:                               # %for.cond.cleanup198
                                        #   in Loop: Header=BB0_54 Depth=2
	add	s3, s3, t6
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	mul	a0, a0, s4
	slli	a0, a0, 2
	add	a0, a0, t5
	fsw	fa4, 0(a0)
	addi	s4, s4, 1
	add	s2, s2, t4
	lw	ra, 104(sp)                     # 4-byte Folded Reload
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	beq	s4, a0, .LBB0_66
.LBB0_54:                               # %for.body189
                                        #   Parent Loop BB0_51 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_57 Depth 3
                                        #         Child Loop BB0_58 Depth 4
	fmv.s	fa4, fa5
	blez	ra, .LBB0_53
# %bb.55:                               # %for.body199.preheader
                                        #   in Loop: Header=BB0_54 Depth=2
	li	ra, 0
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	sub	s9, a0, s4
	mv	a2, t2
	mv	a1, s2
	fmv.s	fa4, fa5
	j	.LBB0_57
.LBB0_56:                               # %for.cond.cleanup205
                                        #   in Loop: Header=BB0_57 Depth=3
	addi	ra, ra, 1
	add	a1, a1, s7
	add	a2, a2, s8
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	beq	ra, a0, .LBB0_53
.LBB0_57:                               # %for.body199
                                        #   Parent Loop BB0_51 Depth=1
                                        #     Parent Loop BB0_54 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_58 Depth 4
	mv	s1, a2
	mv	a4, a1
	mv	s0, s9
	bge	s9, s11, .LBB0_56
.LBB0_58:                               # %for.body206
                                        #   Parent Loop BB0_51 Depth=1
                                        #     Parent Loop BB0_54 Depth=2
                                        #       Parent Loop BB0_57 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s1)
	flw	fa2, 0(a4)
	addi	a0, s0, 1
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a0, s11, .LBB0_56
# %bb.59:                               # %for.body206.1
                                        #   in Loop: Header=BB0_58 Depth=4
	add	a0, s1, t1
	flw	fa3, 0(a0)
	add	a3, a4, s10
	flw	fa2, 0(a3)
	addi	a6, s0, 2
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a6, s11, .LBB0_56
# %bb.60:                               # %for.body206.2
                                        #   in Loop: Header=BB0_58 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	addi	a5, s0, 3
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a5, s11, .LBB0_56
# %bb.61:                               # %for.body206.3
                                        #   in Loop: Header=BB0_58 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	addi	a5, s0, 4
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a5, s11, .LBB0_56
# %bb.62:                               # %for.body206.4
                                        #   in Loop: Header=BB0_58 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	addi	a5, s0, 5
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a5, s11, .LBB0_56
# %bb.63:                               # %for.body206.5
                                        #   in Loop: Header=BB0_58 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	addi	a5, s0, 6
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a5, s11, .LBB0_56
# %bb.64:                               # %for.body206.6
                                        #   in Loop: Header=BB0_58 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	addi	a5, s0, 7
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a5, s11, .LBB0_56
# %bb.65:                               # %for.body206.7
                                        #   in Loop: Header=BB0_58 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, 8
	add	a4, a4, s6
	add	s1, s1, s5
	blt	s0, s11, .LBB0_58
	j	.LBB0_56
.LBB0_66:                               # %for.cond.cleanup188
                                        #   in Loop: Header=BB0_51 Depth=1
	lw	a0, 60(sp)                      # 4-byte Folded Reload
	lw	s9, 36(sp)                      # 4-byte Folded Reload
	lw	a1, 28(sp)                      # 4-byte Folded Reload
	bge	a1, a0, .LBB0_50
# %bb.67:                               # %for.body246.preheader
                                        #   in Loop: Header=BB0_51 Depth=1
	slli	s3, s3, 2
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	add	s3, s3, a0
	lw	s2, 28(sp)                      # 4-byte Folded Reload
	j	.LBB0_69
.LBB0_68:                               # %for.cond.cleanup255
                                        #   in Loop: Header=BB0_69 Depth=2
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	mul	a0, a0, s2
	slli	a0, a0, 2
	add	a0, a0, t5
	fsw	fa4, 0(a0)
	addi	s2, s2, 1
	add	s3, s3, t1
	lw	a0, 60(sp)                      # 4-byte Folded Reload
	beq	s2, a0, .LBB0_50
.LBB0_69:                               # %for.body246
                                        #   Parent Loop BB0_51 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_72 Depth 3
                                        #         Child Loop BB0_74 Depth 4
	fmv.s	fa4, fa5
	blez	ra, .LBB0_68
# %bb.70:                               # %for.cond258.preheader.preheader
                                        #   in Loop: Header=BB0_69 Depth=2
	li	a4, 0
	lw	a0, 56(sp)                      # 4-byte Folded Reload
	add	a0, a0, s2
	not	a5, a0
	add	a5, a5, s11
	mv	s4, s3
	lw	a6, 76(sp)                      # 4-byte Folded Reload
	fmv.s	fa4, fa5
	j	.LBB0_72
.LBB0_71:                               # %for.cond.cleanup268
                                        #   in Loop: Header=BB0_72 Depth=3
	addi	a4, a4, 1
	add	a6, a6, s7
	add	s4, s4, s8
	beq	a4, ra, .LBB0_68
.LBB0_72:                               # %for.cond258.preheader
                                        #   Parent Loop BB0_51 Depth=1
                                        #     Parent Loop BB0_69 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_74 Depth 4
	blez	a5, .LBB0_71
# %bb.73:                               # %for.body269.preheader
                                        #   in Loop: Header=BB0_72 Depth=3
	li	a2, 0
	mv	s1, s4
	mv	a3, a6
.LBB0_74:                               # %for.body269
                                        #   Parent Loop BB0_51 Depth=1
                                        #     Parent Loop BB0_69 Depth=2
                                        #       Parent Loop BB0_72 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s1)
	flw	fa2, 0(a3)
	addi	a0, a2, 1
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a0, a5, .LBB0_71
# %bb.75:                               # %for.body269.1
                                        #   in Loop: Header=BB0_74 Depth=4
	add	a0, s1, t1
	flw	fa3, 0(a0)
	add	a1, a3, s10
	flw	fa2, 0(a1)
	addi	s0, a2, 2
	fmadd.s	fa4, fa3, fa2, fa4
	bge	s0, a5, .LBB0_71
# %bb.76:                               # %for.body269.2
                                        #   in Loop: Header=BB0_74 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a1, a1, s10
	flw	fa2, 0(a1)
	addi	s0, a2, 3
	fmadd.s	fa4, fa3, fa2, fa4
	bge	s0, a5, .LBB0_71
# %bb.77:                               # %for.body269.3
                                        #   in Loop: Header=BB0_74 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a1, a1, s10
	flw	fa2, 0(a1)
	addi	s0, a2, 4
	fmadd.s	fa4, fa3, fa2, fa4
	bge	s0, a5, .LBB0_71
# %bb.78:                               # %for.body269.4
                                        #   in Loop: Header=BB0_74 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a1, a1, s10
	flw	fa2, 0(a1)
	addi	s0, a2, 5
	fmadd.s	fa4, fa3, fa2, fa4
	bge	s0, a5, .LBB0_71
# %bb.79:                               # %for.body269.5
                                        #   in Loop: Header=BB0_74 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a1, a1, s10
	flw	fa2, 0(a1)
	addi	s0, a2, 6
	fmadd.s	fa4, fa3, fa2, fa4
	bge	s0, a5, .LBB0_71
# %bb.80:                               # %for.body269.6
                                        #   in Loop: Header=BB0_74 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a1, a1, s10
	flw	fa2, 0(a1)
	addi	s0, a2, 7
	fmadd.s	fa4, fa3, fa2, fa4
	bge	s0, a5, .LBB0_71
# %bb.81:                               # %for.body269.7
                                        #   in Loop: Header=BB0_74 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a1, a1, s10
	flw	fa2, 0(a1)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a2, a2, 8
	add	a3, a3, s6
	add	s1, s1, s5
	blt	a2, a5, .LBB0_74
	j	.LBB0_71
.LBB0_82:                               # %for.cond311.preheader
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	bge	s9, a0, .LBB0_132
# %bb.83:                               # %for.cond318.preheader.lr.ph
	li	s2, 0
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	lw	a1, 12(sp)                      # 4-byte Folded Reload
	sub	a1, a1, a0
	sw	a1, 32(sp)                      # 4-byte Folded Spill
	lw	ra, 80(sp)                      # 4-byte Folded Reload
	slli	ra, ra, 2
	lw	a0, 76(sp)                      # 4-byte Folded Reload
	add	a0, a0, ra
	sw	a0, 28(sp)                      # 4-byte Folded Spill
	lw	ra, 104(sp)                     # 4-byte Folded Reload
	neg	a0, s10
	sw	a0, 80(sp)                      # 4-byte Folded Spill
	lw	s3, 16(sp)                      # 4-byte Folded Reload
	slli	s3, s3, 2
	lw	a6, 84(sp)                      # 4-byte Folded Reload
	slli	a6, a6, 2
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	add	a0, a0, a6
	sw	a0, 72(sp)                      # 4-byte Folded Spill
	lw	a6, 100(sp)                     # 4-byte Folded Reload
	slli	a6, a6, 2
	fmv.w.x	fa5, zero
	li	t5, 1
	li	t0, 2
	li	t2, 3
	li	s4, 4
	li	s9, 5
	li	t3, 6
	lw	a2, 36(sp)                      # 4-byte Folded Reload
	j	.LBB0_85
.LBB0_84:                               # %for.cond.cleanup444
                                        #   in Loop: Header=BB0_85 Depth=1
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	lw	s2, 68(sp)                      # 4-byte Folded Reload
	add	s2, s2, a0
	lw	a2, 40(sp)                      # 4-byte Folded Reload
	addi	a2, a2, 1
	lw	a0, 72(sp)                      # 4-byte Folded Reload
	add	a0, a0, a6
	sw	a0, 72(sp)                      # 4-byte Folded Spill
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	beq	a2, a0, .LBB0_132
.LBB0_85:                               # %for.cond318.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_88 Depth 2
                                        #       Child Loop BB0_91 Depth 3
                                        #         Child Loop BB0_92 Depth 4
                                        #     Child Loop BB0_103 Depth 2
                                        #       Child Loop BB0_106 Depth 3
                                        #         Child Loop BB0_107 Depth 4
                                        #     Child Loop BB0_119 Depth 2
                                        #       Child Loop BB0_122 Depth 3
                                        #         Child Loop BB0_124 Depth 4
	lw	a0, 32(sp)                      # 4-byte Folded Reload
	add	a0, a0, a2
	lw	a1, 44(sp)                      # 4-byte Folded Reload
	sw	a2, 40(sp)                      # 4-byte Folded Spill
	mul	a1, a1, a2
	not	s8, a0
	lw	a0, 48(sp)                      # 4-byte Folded Reload
	mul	a0, a1, a0
	add	s8, s8, ra
	slli	a0, a0, 2
	lw	a1, 52(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 84(sp)                      # 4-byte Folded Spill
	sw	s2, 68(sp)                      # 4-byte Folded Spill
	lw	s7, 88(sp)                      # 4-byte Folded Reload
	blez	s7, .LBB0_100
# %bb.86:                               # %for.body321.preheader
                                        #   in Loop: Header=BB0_85 Depth=1
	li	a2, 0
	lw	t4, 28(sp)                      # 4-byte Folded Reload
	lw	s2, 68(sp)                      # 4-byte Folded Reload
	j	.LBB0_88
.LBB0_87:                               # %for.cond.cleanup337
                                        #   in Loop: Header=BB0_88 Depth=2
	mv	s2, a7
	add	s2, t6, a7
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	mul	a0, a0, a2
	slli	a0, a0, 2
	lw	a1, 84(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	a2, a2, 1
	lw	a0, 80(sp)                      # 4-byte Folded Reload
	add	t4, t4, a0
	lw	s7, 88(sp)                      # 4-byte Folded Reload
	beq	a2, s7, .LBB0_100
.LBB0_88:                               # %for.body321
                                        #   Parent Loop BB0_85 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_91 Depth 3
                                        #         Child Loop BB0_92 Depth 4
	mv	a7, s2
	fmv.s	fa4, fa5
	blez	s8, .LBB0_87
# %bb.89:                               # %for.body338.preheader
                                        #   in Loop: Header=BB0_88 Depth=2
	li	a4, 0
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	sub	ra, a0, a2
	lw	s2, 72(sp)                      # 4-byte Folded Reload
	mv	a0, t4
	fmv.s	fa4, fa5
	j	.LBB0_91
.LBB0_90:                               # %for.cond.cleanup344
                                        #   in Loop: Header=BB0_91 Depth=3
	addi	a4, a4, 1
	add	a0, a0, s3
	add	s2, s2, a6
	bge	a4, s8, .LBB0_87
.LBB0_91:                               # %for.body338
                                        #   Parent Loop BB0_85 Depth=1
                                        #     Parent Loop BB0_88 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_92 Depth 4
	mv	s1, s2
	mv	s7, a0
	mv	s0, ra
	bge	ra, s11, .LBB0_90
.LBB0_92:                               # %for.body345
                                        #   Parent Loop BB0_85 Depth=1
                                        #     Parent Loop BB0_88 Depth=2
                                        #       Parent Loop BB0_91 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s1)
	flw	fa2, 0(s7)
	addi	a1, s0, 1
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_90
# %bb.93:                               # %for.body345.1
                                        #   in Loop: Header=BB0_92 Depth=4
	add	a3, s1, t1
	flw	fa3, 0(a3)
	add	a5, s7, s10
	flw	fa2, 0(a5)
	addi	a1, s0, 2
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_90
# %bb.94:                               # %for.body345.2
                                        #   in Loop: Header=BB0_92 Depth=4
	add	a3, a3, t1
	flw	fa3, 0(a3)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	addi	a1, s0, 3
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_90
# %bb.95:                               # %for.body345.3
                                        #   in Loop: Header=BB0_92 Depth=4
	add	a3, a3, t1
	flw	fa3, 0(a3)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	addi	a1, s0, 4
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_90
# %bb.96:                               # %for.body345.4
                                        #   in Loop: Header=BB0_92 Depth=4
	add	a3, a3, t1
	flw	fa3, 0(a3)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	addi	a1, s0, 5
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_90
# %bb.97:                               # %for.body345.5
                                        #   in Loop: Header=BB0_92 Depth=4
	add	a3, a3, t1
	flw	fa3, 0(a3)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	addi	a1, s0, 6
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_90
# %bb.98:                               # %for.body345.6
                                        #   in Loop: Header=BB0_92 Depth=4
	add	a3, a3, t1
	flw	fa3, 0(a3)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	addi	a1, s0, 7
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a1, s11, .LBB0_90
# %bb.99:                               # %for.body345.7
                                        #   in Loop: Header=BB0_92 Depth=4
	add	a3, a3, t1
	flw	fa3, 0(a3)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, 8
	add	s7, s7, s6
	add	s1, s1, s5
	blt	s0, s11, .LBB0_92
	j	.LBB0_90
.LBB0_100:                              # %for.cond376.preheader
                                        #   in Loop: Header=BB0_85 Depth=1
	lw	a0, 64(sp)                      # 4-byte Folded Reload
	bge	s7, a0, .LBB0_115
# %bb.101:                              # %for.body383.preheader
                                        #   in Loop: Header=BB0_85 Depth=1
	slli	a7, s2, 2
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	add	a7, a7, a0
	lw	ra, 104(sp)                     # 4-byte Folded Reload
	li	t4, 7
	j	.LBB0_103
.LBB0_102:                              # %for.cond.cleanup399
                                        #   in Loop: Header=BB0_103 Depth=2
	add	s2, s2, t6
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	mul	a0, a0, s7
	slli	a0, a0, 2
	lw	a1, 84(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	s7, s7, 1
	add	a7, a7, t1
	lw	a0, 64(sp)                      # 4-byte Folded Reload
	beq	s7, a0, .LBB0_116
.LBB0_103:                              # %for.body383
                                        #   Parent Loop BB0_85 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_106 Depth 3
                                        #         Child Loop BB0_107 Depth 4
	fmv.s	fa4, fa5
	blez	s8, .LBB0_102
# %bb.104:                              # %for.cond402.preheader.preheader
                                        #   in Loop: Header=BB0_103 Depth=2
	li	a4, 0
	mv	a2, a7
	lw	a1, 76(sp)                      # 4-byte Folded Reload
	fmv.s	fa4, fa5
	j	.LBB0_106
.LBB0_105:                              # %for.cond.cleanup405
                                        #   in Loop: Header=BB0_106 Depth=3
	addi	a4, a4, 1
	add	a1, a1, s3
	add	a2, a2, a6
	bge	a4, s8, .LBB0_102
.LBB0_106:                              # %for.cond402.preheader
                                        #   Parent Loop BB0_85 Depth=1
                                        #     Parent Loop BB0_103 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_107 Depth 4
	mv	a3, a2
	mv	s0, a1
	mv	s1, s11
	blez	s11, .LBB0_105
.LBB0_107:                              # %for.body406
                                        #   Parent Loop BB0_85 Depth=1
                                        #     Parent Loop BB0_103 Depth=2
                                        #       Parent Loop BB0_106 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a3)
	flw	fa2, 0(s0)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	s1, t5, .LBB0_105
# %bb.108:                              # %for.body406.1
                                        #   in Loop: Header=BB0_107 Depth=4
	add	a0, a3, t1
	flw	fa3, 0(a0)
	add	a5, s0, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	s1, t0, .LBB0_105
# %bb.109:                              # %for.body406.2
                                        #   in Loop: Header=BB0_107 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	s1, t2, .LBB0_105
# %bb.110:                              # %for.body406.3
                                        #   in Loop: Header=BB0_107 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	s1, s4, .LBB0_105
# %bb.111:                              # %for.body406.4
                                        #   in Loop: Header=BB0_107 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	s1, s9, .LBB0_105
# %bb.112:                              # %for.body406.5
                                        #   in Loop: Header=BB0_107 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	s1, t3, .LBB0_105
# %bb.113:                              # %for.body406.6
                                        #   in Loop: Header=BB0_107 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	s1, t4, .LBB0_105
# %bb.114:                              # %for.body406.7
                                        #   in Loop: Header=BB0_107 Depth=4
	add	a0, a0, t1
	flw	fa3, 0(a0)
	add	a5, a5, s10
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s1, s1, -8
	add	s0, s0, s6
	add	a3, a3, s5
	bnez	s1, .LBB0_107
	j	.LBB0_105
.LBB0_115:                              #   in Loop: Header=BB0_85 Depth=1
	lw	ra, 104(sp)                     # 4-byte Folded Reload
.LBB0_116:                              # %for.cond441.preheader
                                        #   in Loop: Header=BB0_85 Depth=1
	lw	a0, 64(sp)                      # 4-byte Folded Reload
	lw	a1, 60(sp)                      # 4-byte Folded Reload
	bge	a0, a1, .LBB0_84
# %bb.117:                              # %for.body445.preheader
                                        #   in Loop: Header=BB0_85 Depth=1
	slli	t4, s2, 2
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	add	t4, t4, a0
	lw	s7, 64(sp)                      # 4-byte Folded Reload
	j	.LBB0_119
.LBB0_118:                              # %for.cond.cleanup461
                                        #   in Loop: Header=BB0_119 Depth=2
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	mul	a0, a0, s7
	slli	a0, a0, 2
	lw	a1, 84(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	s7, s7, 1
	add	t4, t4, t1
	lw	a0, 60(sp)                      # 4-byte Folded Reload
	beq	s7, a0, .LBB0_84
.LBB0_119:                              # %for.body445
                                        #   Parent Loop BB0_85 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_122 Depth 3
                                        #         Child Loop BB0_124 Depth 4
	fmv.s	fa4, fa5
	blez	s8, .LBB0_118
# %bb.120:                              # %for.cond464.preheader.preheader
                                        #   in Loop: Header=BB0_119 Depth=2
	li	s1, 0
	lw	a0, 56(sp)                      # 4-byte Folded Reload
	add	a0, a0, s7
	not	a2, a0
	add	a2, a2, s11
	mv	a7, t4
	lw	s2, 76(sp)                      # 4-byte Folded Reload
	fmv.s	fa4, fa5
	j	.LBB0_122
.LBB0_121:                              # %for.cond.cleanup474
                                        #   in Loop: Header=BB0_122 Depth=3
	addi	s1, s1, 1
	add	s2, s2, s3
	add	a7, a7, a6
	bge	s1, s8, .LBB0_118
.LBB0_122:                              # %for.cond464.preheader
                                        #   Parent Loop BB0_85 Depth=1
                                        #     Parent Loop BB0_119 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_124 Depth 4
	blez	a2, .LBB0_121
# %bb.123:                              # %for.body475.preheader
                                        #   in Loop: Header=BB0_122 Depth=3
	li	a5, 0
	mv	a1, a7
	mv	a3, s2
.LBB0_124:                              # %for.body475
                                        #   Parent Loop BB0_85 Depth=1
                                        #     Parent Loop BB0_119 Depth=2
                                        #       Parent Loop BB0_122 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a1)
	flw	fa2, 0(a3)
	addi	a4, a5, 1
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a4, a2, .LBB0_121
# %bb.125:                              # %for.body475.1
                                        #   in Loop: Header=BB0_124 Depth=4
	add	a4, a1, t1
	flw	fa3, 0(a4)
	add	s0, a3, s10
	flw	fa2, 0(s0)
	addi	a0, a5, 2
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a0, a2, .LBB0_121
# %bb.126:                              # %for.body475.2
                                        #   in Loop: Header=BB0_124 Depth=4
	add	a4, a4, t1
	flw	fa3, 0(a4)
	add	s0, s0, s10
	flw	fa2, 0(s0)
	addi	a0, a5, 3
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a0, a2, .LBB0_121
# %bb.127:                              # %for.body475.3
                                        #   in Loop: Header=BB0_124 Depth=4
	add	a4, a4, t1
	flw	fa3, 0(a4)
	add	s0, s0, s10
	flw	fa2, 0(s0)
	addi	a0, a5, 4
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a0, a2, .LBB0_121
# %bb.128:                              # %for.body475.4
                                        #   in Loop: Header=BB0_124 Depth=4
	add	a4, a4, t1
	flw	fa3, 0(a4)
	add	s0, s0, s10
	flw	fa2, 0(s0)
	addi	a0, a5, 5
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a0, a2, .LBB0_121
# %bb.129:                              # %for.body475.5
                                        #   in Loop: Header=BB0_124 Depth=4
	add	a4, a4, t1
	flw	fa3, 0(a4)
	add	s0, s0, s10
	flw	fa2, 0(s0)
	addi	a0, a5, 6
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a0, a2, .LBB0_121
# %bb.130:                              # %for.body475.6
                                        #   in Loop: Header=BB0_124 Depth=4
	add	a4, a4, t1
	flw	fa3, 0(a4)
	add	s0, s0, s10
	flw	fa2, 0(s0)
	addi	a0, a5, 7
	fmadd.s	fa4, fa3, fa2, fa4
	bge	a0, a2, .LBB0_121
# %bb.131:                              # %for.body475.7
                                        #   in Loop: Header=BB0_124 Depth=4
	add	a4, a4, t1
	flw	fa3, 0(a4)
	add	s0, s0, s10
	flw	fa2, 0(s0)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, 8
	add	a3, a3, s6
	add	a1, a1, s5
	blt	a5, a2, .LBB0_124
	j	.LBB0_121
.LBB0_132:                              # %for.cond513.preheader
	lw	s8, 24(sp)                      # 4-byte Folded Reload
	lw	s9, 36(sp)                      # 4-byte Folded Reload
	bge	s8, s9, .LBB0_150
# %bb.133:                              # %for.cond523.preheader.lr.ph
	lw	a6, 16(sp)                      # 4-byte Folded Reload
	slli	a6, a6, 2
	lw	s4, 100(sp)                     # 4-byte Folded Reload
	slli	s4, s4, 2
	fmv.w.x	fa5, zero
	li	s3, 1
	li	s2, 2
	li	t6, 3
	li	t5, 4
	li	s7, 5
	li	t0, 6
	li	a7, 7
	j	.LBB0_135
.LBB0_134:                              # %for.cond.cleanup529
                                        #   in Loop: Header=BB0_135 Depth=1
	addi	s8, s8, 1
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	add	a0, a0, s4
	sw	a0, 96(sp)                      # 4-byte Folded Spill
	beq	s8, s9, .LBB0_150
.LBB0_135:                              # %for.cond523.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_138 Depth 2
                                        #       Child Loop BB0_141 Depth 3
                                        #         Child Loop BB0_142 Depth 4
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	lw	a1, 64(sp)                      # 4-byte Folded Reload
	bge	a0, a1, .LBB0_134
# %bb.136:                              #   in Loop: Header=BB0_135 Depth=1
	lw	a0, 44(sp)                      # 4-byte Folded Reload
	mul	a0, a0, s8
	lw	a1, 48(sp)                      # 4-byte Folded Reload
	mul	a0, a0, a1
	slli	a0, a0, 2
	lw	t2, 52(sp)                      # 4-byte Folded Reload
	add	t2, t2, a0
	lw	t3, 96(sp)                      # 4-byte Folded Reload
	lw	t4, 88(sp)                      # 4-byte Folded Reload
	j	.LBB0_138
.LBB0_137:                              # %for.cond.cleanup539
                                        #   in Loop: Header=BB0_138 Depth=2
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	mul	a0, a0, t4
	slli	a0, a0, 2
	add	a0, a0, t2
	fsw	fa4, 0(a0)
	addi	t4, t4, 1
	add	t3, t3, t1
	lw	a0, 64(sp)                      # 4-byte Folded Reload
	beq	t4, a0, .LBB0_134
.LBB0_138:                              # %for.body530
                                        #   Parent Loop BB0_135 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_141 Depth 3
                                        #         Child Loop BB0_142 Depth 4
	fmv.s	fa4, fa5
	blez	ra, .LBB0_137
# %bb.139:                              # %for.cond542.preheader.preheader
                                        #   in Loop: Header=BB0_138 Depth=2
	li	a2, 0
	mv	a0, t3
	lw	a1, 76(sp)                      # 4-byte Folded Reload
	fmv.s	fa4, fa5
	j	.LBB0_141
.LBB0_140:                              # %for.cond.cleanup545
                                        #   in Loop: Header=BB0_141 Depth=3
	addi	a2, a2, 1
	add	a1, a1, a6
	add	a0, a0, s4
	beq	a2, ra, .LBB0_137
.LBB0_141:                              # %for.cond542.preheader
                                        #   Parent Loop BB0_135 Depth=1
                                        #     Parent Loop BB0_138 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_142 Depth 4
	mv	s0, a0
	mv	s1, a1
	mv	a4, s11
	blez	s11, .LBB0_140
.LBB0_142:                              # %for.body546
                                        #   Parent Loop BB0_135 Depth=1
                                        #     Parent Loop BB0_138 Depth=2
                                        #       Parent Loop BB0_141 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s0)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s3, .LBB0_140
# %bb.143:                              # %for.body546.1
                                        #   in Loop: Header=BB0_142 Depth=4
	add	a5, s0, t1
	flw	fa3, 0(a5)
	add	a3, s1, s10
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s2, .LBB0_140
# %bb.144:                              # %for.body546.2
                                        #   in Loop: Header=BB0_142 Depth=4
	add	a5, a5, t1
	flw	fa3, 0(a5)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, t6, .LBB0_140
# %bb.145:                              # %for.body546.3
                                        #   in Loop: Header=BB0_142 Depth=4
	add	a5, a5, t1
	flw	fa3, 0(a5)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, t5, .LBB0_140
# %bb.146:                              # %for.body546.4
                                        #   in Loop: Header=BB0_142 Depth=4
	add	a5, a5, t1
	flw	fa3, 0(a5)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, s7, .LBB0_140
# %bb.147:                              # %for.body546.5
                                        #   in Loop: Header=BB0_142 Depth=4
	add	a5, a5, t1
	flw	fa3, 0(a5)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, t0, .LBB0_140
# %bb.148:                              # %for.body546.6
                                        #   in Loop: Header=BB0_142 Depth=4
	add	a5, a5, t1
	flw	fa3, 0(a5)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	beq	a4, a7, .LBB0_140
# %bb.149:                              # %for.body546.7
                                        #   in Loop: Header=BB0_142 Depth=4
	add	a5, a5, t1
	flw	fa3, 0(a5)
	add	a3, a3, s10
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a4, a4, -8
	add	s1, s1, s6
	add	s0, s0, s5
	bnez	a4, .LBB0_142
	j	.LBB0_140
.LBB0_150:                              # %for.cond.cleanup519
	li	a0, 0
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
.Lfunc_end0:
	.size	dspi_conv_f32_arp4, .Lfunc_end0-dspi_conv_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"
	.section	".note.GNU-stack","",@progbits
