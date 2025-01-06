.option	arch, -zcb, +zcmp
# 2025-01-03 17:58:19
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
	addi	sp, sp, -240
	sw	ra, 236(sp)                     # 4-byte Folded Spill
	sw	s0, 232(sp)                     # 4-byte Folded Spill
	sw	s1, 228(sp)                     # 4-byte Folded Spill
	sw	s2, 224(sp)                     # 4-byte Folded Spill
	sw	s3, 220(sp)                     # 4-byte Folded Spill
	sw	s4, 216(sp)                     # 4-byte Folded Spill
	sw	s5, 212(sp)                     # 4-byte Folded Spill
	sw	s6, 208(sp)                     # 4-byte Folded Spill
	sw	s7, 204(sp)                     # 4-byte Folded Spill
	sw	s8, 200(sp)                     # 4-byte Folded Spill
	sw	s9, 196(sp)                     # 4-byte Folded Spill
	sw	s10, 192(sp)                    # 4-byte Folded Spill
	sw	s11, 188(sp)                    # 4-byte Folded Spill
	lw	t6, 4(a0)
	lw	a7, 8(a0)
	lw	a6, 12(a0)
	lw	a4, 20(a0)
	lw	t3, 24(a0)
	lw	t1, 4(a1)
	lw	t0, 8(a1)
	lw	t2, 12(a1)
	lw	s9, 20(a1)
	lw	a5, 24(a1)
	lw	a3, 4(a2)
	sw	a3, 156(sp)                     # 4-byte Folded Spill
	lw	t4, 8(a2)
	lw	a3, 12(a2)
	lw	a0, 0(a0)
	sw	a0, 164(sp)                     # 4-byte Folded Spill
	lw	a0, 0(a2)
	sw	a0, 104(sp)                     # 4-byte Folded Spill
	lw	a0, 0(a1)
	sw	a0, 152(sp)                     # 4-byte Folded Spill
	addi	s1, s9, -1
	srai	s0, s1, 1
	addi	a2, a5, -1
	sw	a2, 176(sp)                     # 4-byte Folded Spill
	srai	a2, a2, 1
	mul	a0, a6, a7
	sw	a0, 168(sp)                     # 4-byte Folded Spill
	mul	a0, t2, t0
	mul	a1, a3, t4
	sw	a1, 100(sp)                     # 4-byte Folded Spill
	srli	a1, s9, 31
	add	a1, a1, s9
	srai	a1, a1, 1
	neg	a3, a1
	sw	a3, 12(sp)                      # 4-byte Folded Spill
	sw	a4, 148(sp)                     # 4-byte Folded Spill
	sub	a3, a4, a1
	srli	a1, a5, 31
	sw	a5, 180(sp)                     # 4-byte Folded Spill
	add	a1, a1, a5
	mv	a4, t1
	srai	a1, a1, 1
	sw	t3, 60(sp)                      # 4-byte Folded Spill
	sub	a1, t3, a1
	sw	a1, 76(sp)                      # 4-byte Folded Spill
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	add	s1, s1, a3
	sw	s1, 128(sp)                     # 4-byte Folded Spill
	sw	a3, 120(sp)                     # 4-byte Folded Spill
	addi	a3, a3, -1
	sw	a3, 56(sp)                      # 4-byte Folded Spill
	slli	a7, t6, 2
	slli	a6, t1, 2
	addi	t5, s9, -7
	andi	a1, s9, -8
	sw	a1, 160(sp)                     # 4-byte Folded Spill
	mul	a1, t1, s0
	sw	a1, 4(sp)                       # 4-byte Folded Spill
	addi	a1, s0, 8
	sw	a1, 8(sp)                       # 4-byte Folded Spill
	slli	a0, a0, 2
	sw	a0, 184(sp)                     # 4-byte Folded Spill
	slli	s5, t1, 3
	slli	s2, t6, 3
	sw	a2, 72(sp)                      # 4-byte Folded Spill
	sw	s0, 132(sp)                     # 4-byte Folded Spill
	sw	t1, 172(sp)                     # 4-byte Folded Spill
	blez	a2, .LBB0_59
# %bb.1:                                # %for.body.lr.ph
	li	s1, 0
	li	a1, 0
	mul	a3, t6, s0
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	slli	a0, a0, 2
	sw	a0, 68(sp)                      # 4-byte Folded Spill
	lw	t1, 156(sp)                     # 4-byte Folded Reload
	slli	a0, t1, 2
	sw	a0, 64(sp)                      # 4-byte Folded Spill
	lw	a0, 4(sp)                       # 4-byte Folded Reload
	slli	a0, a0, 2
	lw	a5, 152(sp)                     # 4-byte Folded Reload
	add	a0, a0, a5
	sw	a0, 36(sp)                      # 4-byte Folded Spill
	neg	a0, a6
	sw	a0, 116(sp)                     # 4-byte Folded Spill
	sw	a3, 92(sp)                      # 4-byte Folded Spill
	slli	a0, a3, 2
	lw	a4, 164(sp)                     # 4-byte Folded Reload
	add	a0, a0, a4
	sw	a0, 112(sp)                     # 4-byte Folded Spill
	lw	s11, 168(sp)                    # 4-byte Folded Reload
	slli	s11, s11, 2
	lw	s6, 172(sp)                     # 4-byte Folded Reload
	slli	s6, s6, 5
	slli	t0, t6, 5
	lw	a0, 172(sp)                     # 4-byte Folded Reload
	lw	a3, 8(sp)                       # 4-byte Folded Reload
	mul	a0, a0, a3
	sw	a0, 32(sp)                      # 4-byte Folded Spill
	mul	a0, t6, a3
	sw	a0, 28(sp)                      # 4-byte Folded Spill
	lw	a0, 148(sp)                     # 4-byte Folded Reload
	lw	a3, 12(sp)                      # 4-byte Folded Reload
	add	a0, a0, a3
	sub	a3, a0, s0
	mul	a0, t1, s0
	slli	a0, a0, 2
	lw	t1, 104(sp)                     # 4-byte Folded Reload
	add	a0, a0, t1
	sw	a0, 88(sp)                      # 4-byte Folded Spill
	sw	a3, 24(sp)                      # 4-byte Folded Spill
	mul	a0, t6, a3
	sw	a0, 20(sp)                      # 4-byte Folded Spill
	andi	a0, s9, 7
	sw	a0, 52(sp)                      # 4-byte Folded Spill
	srli	a0, s9, 3
	lw	a3, 172(sp)                     # 4-byte Folded Reload
	mul	a3, a3, a0
	slli	a3, a3, 5
	add	a3, a3, a5
	sw	a3, 48(sp)                      # 4-byte Folded Spill
	mul	a0, t6, a0
	slli	a0, a0, 5
	add	a0, a0, a4
	sw	a0, 16(sp)                      # 4-byte Folded Spill
	add	a5, a5, s6
	sw	a5, 108(sp)                     # 4-byte Folded Spill
	add	a4, a4, t0
	sw	a4, 44(sp)                      # 4-byte Folded Spill
	fmv.w.x	fa5, zero
	sw	t1, 96(sp)                      # 4-byte Folded Spill
	j	.LBB0_3
.LBB0_2:                                # %for.cond.cleanup203
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 168(sp)                     # 4-byte Folded Reload
	lw	s1, 84(sp)                      # 4-byte Folded Reload
	add	s1, s1, a0
	lw	a1, 80(sp)                      # 4-byte Folded Reload
	addi	a1, a1, 1
	lw	a2, 92(sp)                      # 4-byte Folded Reload
	add	a2, a2, a0
	sw	a2, 92(sp)                      # 4-byte Folded Spill
	lw	a0, 68(sp)                      # 4-byte Folded Reload
	lw	a2, 96(sp)                      # 4-byte Folded Reload
	add	a2, a2, a0
	sw	a2, 96(sp)                      # 4-byte Folded Spill
	lw	a2, 112(sp)                     # 4-byte Folded Reload
	add	a2, a2, s11
	sw	a2, 112(sp)                     # 4-byte Folded Spill
	lw	a2, 88(sp)                      # 4-byte Folded Reload
	add	a2, a2, a0
	sw	a2, 88(sp)                      # 4-byte Folded Spill
	lw	a2, 72(sp)                      # 4-byte Folded Reload
	lw	s0, 132(sp)                     # 4-byte Folded Reload
	lw	a4, 172(sp)                     # 4-byte Folded Reload
	beq	a1, a2, .LBB0_59
.LBB0_3:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #     Child Loop BB0_13 Depth 2
                                        #       Child Loop BB0_22 Depth 3
                                        #         Child Loop BB0_23 Depth 4
                                        #       Child Loop BB0_16 Depth 3
                                        #         Child Loop BB0_17 Depth 4
                                        #         Child Loop BB0_19 Depth 4
                                        #     Child Loop BB0_33 Depth 2
                                        #     Child Loop BB0_42 Depth 2
                                        #     Child Loop BB0_36 Depth 2
                                        #       Child Loop BB0_37 Depth 3
                                        #         Child Loop BB0_38 Depth 4
                                        #     Child Loop BB0_26 Depth 2
                                        #       Child Loop BB0_28 Depth 3
                                        #         Child Loop BB0_29 Depth 4
                                        #         Child Loop BB0_31 Depth 4
                                        #     Child Loop BB0_46 Depth 2
                                        #       Child Loop BB0_56 Depth 3
                                        #         Child Loop BB0_57 Depth 4
                                        #       Child Loop BB0_50 Depth 3
                                        #         Child Loop BB0_51 Depth 4
                                        #         Child Loop BB0_53 Depth 4
	sub	a2, a2, a1
	sw	a2, 144(sp)                     # 4-byte Folded Spill
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	sw	a1, 80(sp)                      # 4-byte Folded Spill
	mul	a0, a1, a0
	slli	a0, a0, 2
	lw	a1, 104(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 136(sp)                     # 4-byte Folded Spill
	sw	s1, 84(sp)                      # 4-byte Folded Spill
	mv	s10, s1
	blez	s0, .LBB0_8
# %bb.4:                                # %for.body39.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	mv	a3, s0
	lw	a1, 180(sp)                     # 4-byte Folded Reload
	lw	a2, 64(sp)                      # 4-byte Folded Reload
	lw	a4, 144(sp)                     # 4-byte Folded Reload
	bge	a4, a1, .LBB0_6
# %bb.5:                                # %for.body39.us.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	li	t4, 0
	lw	s8, 28(sp)                      # 4-byte Folded Reload
	lw	a2, 32(sp)                      # 4-byte Folded Reload
	lw	t3, 36(sp)                      # 4-byte Folded Reload
	lw	s10, 84(sp)                     # 4-byte Folded Reload
	j	.LBB0_13
.LBB0_6:                                # %for.body39
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	zero, 0(a0)
	addi	a3, a3, -1
	add	a0, a0, a2
	bnez	a3, .LBB0_6
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	lw	s10, 92(sp)                     # 4-byte Folded Reload
.LBB0_8:                                # %for.cond113.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a2, 120(sp)                     # 4-byte Folded Reload
	bge	s0, a2, .LBB0_43
# %bb.9:                                # %for.cond121.preheader.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 180(sp)                     # 4-byte Folded Reload
	lw	s4, 52(sp)                      # 4-byte Folded Reload
	lw	s7, 48(sp)                      # 4-byte Folded Reload
	lw	a1, 144(sp)                     # 4-byte Folded Reload
	bge	a1, a0, .LBB0_32
# %bb.10:                               # %for.cond121.preheader.lr.ph.split.us
                                        #   in Loop: Header=BB0_3 Depth=1
	li	a0, 8
	blt	s9, a0, .LBB0_34
# %bb.11:                               # %for.cond121.preheader.us.us.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	slli	t3, s10, 2
	lw	t2, 164(sp)                     # 4-byte Folded Reload
	add	t2, t2, t3
	lw	a0, 16(sp)                      # 4-byte Folded Reload
	add	t3, t3, a0
	mv	t4, s0
	j	.LBB0_26
.LBB0_12:                               # %for.cond41.for.cond.cleanup43_crit_edge.us
                                        #   in Loop: Header=BB0_13 Depth=2
	lw	s10, 124(sp)                    # 4-byte Folded Reload
	add	s10, s10, t6
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, t4, a0
	slli	a0, a0, 2
	lw	a1, 136(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	t4, t4, 1
	lw	a0, 116(sp)                     # 4-byte Folded Reload
	lw	t3, 140(sp)                     # 4-byte Folded Reload
	add	t3, t3, a0
	lw	a0, 172(sp)                     # 4-byte Folded Reload
	sub	a2, a2, a0
	sub	s8, s8, t6
	lw	s0, 132(sp)                     # 4-byte Folded Reload
	beq	t4, s0, .LBB0_8
.LBB0_13:                               # %for.body39.us
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_22 Depth 3
                                        #         Child Loop BB0_23 Depth 4
                                        #       Child Loop BB0_16 Depth 3
                                        #         Child Loop BB0_17 Depth 4
                                        #         Child Loop BB0_19 Depth 4
	sub	t1, s0, t4
	sw	s10, 124(sp)                    # 4-byte Folded Spill
	sw	t3, 140(sp)                     # 4-byte Folded Spill
	bge	t1, t5, .LBB0_20
# %bb.14:                               # %for.cond45.preheader.us.us.preheader
                                        #   in Loop: Header=BB0_13 Depth=2
	lw	s7, 112(sp)                     # 4-byte Folded Reload
	mv	s4, s10
	fmv.s	fa4, fa5
	lw	s1, 152(sp)                     # 4-byte Folded Reload
	lw	s10, 144(sp)                    # 4-byte Folded Reload
	j	.LBB0_16
.LBB0_15:                               # %for.end100.us.us
                                        #   in Loop: Header=BB0_16 Depth=3
	lw	a0, 184(sp)                     # 4-byte Folded Reload
	add	s1, s1, a0
	lw	a1, 168(sp)                     # 4-byte Folded Reload
	add	s4, s4, a1
	addi	s10, s10, 1
	add	t3, t3, a0
	add	s7, s7, s11
	lw	a0, 180(sp)                     # 4-byte Folded Reload
	bge	s10, a0, .LBB0_12
.LBB0_16:                               # %for.cond45.preheader.us.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_17 Depth 4
                                        #         Child Loop BB0_19 Depth 4
	slli	s3, s4, 2
	lw	a0, 164(sp)                     # 4-byte Folded Reload
	add	s3, s3, a0
	mv	ra, s8
	mv	s0, a2
	mv	a0, s7
	mv	a5, t3
	mv	t2, t1
.LBB0_17:                               # %for.body48.us.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        #       Parent Loop BB0_16 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a0)
	flw	fa2, 0(a5)
	add	a3, a0, a7
	flw	fa1, 0(a3)
	add	a4, a5, a6
	flw	fa0, 0(a4)
	add	a3, a3, a7
	flw	ft0, 0(a3)
	add	a4, a4, a6
	flw	ft1, 0(a4)
	add	a3, a3, a7
	flw	ft2, 0(a3)
	add	a4, a4, a6
	flw	ft3, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	add	a3, a3, a7
	flw	fa3, 0(a3)
	add	a4, a4, a6
	flw	fa2, 0(a4)
	add	a3, a3, a7
	flw	fa1, 0(a3)
	add	a4, a4, a6
	flw	fa0, 0(a4)
	add	a3, a3, a7
	flw	ft0, 0(a3)
	add	a4, a4, a6
	flw	ft1, 0(a4)
	add	a3, a3, a7
	flw	ft2, 0(a3)
	add	a4, a4, a6
	flw	ft3, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	mv	a3, s0
	mv	a4, ra
	fmadd.s	fa4, ft2, ft3, fa4
	addi	t2, t2, 8
	add	a5, a5, s6
	add	a0, a0, t0
	add	s0, s0, s5
	add	ra, ra, s2
	blt	t2, t5, .LBB0_17
# %bb.18:                               # %for.cond45.for.cond90.preheader_crit_edge.us.us
                                        #   in Loop: Header=BB0_16 Depth=3
	lw	a1, 172(sp)                     # 4-byte Folded Reload
	bge	t2, s9, .LBB0_15
.LBB0_19:                               # %for.body92.us.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        #       Parent Loop BB0_16 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	slli	a0, a4, 2
	add	a0, a0, s3
	flw	fa3, 0(a0)
	slli	a0, a3, 2
	add	a0, a0, s1
	flw	fa2, 0(a0)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	t2, t2, 1
	add	a3, a3, a1
	add	a4, a4, t6
	blt	t2, s9, .LBB0_19
	j	.LBB0_15
.LBB0_20:                               # %for.cond45.preheader.lr.ph.split.us1720
                                        #   in Loop: Header=BB0_13 Depth=2
	fmv.s	fa4, fa5
	bge	t1, s9, .LBB0_12
# %bb.21:                               # %for.cond45.preheader.us1681.us.preheader
                                        #   in Loop: Header=BB0_13 Depth=2
	lw	a0, 112(sp)                     # 4-byte Folded Reload
	lw	s1, 140(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
	lw	a4, 144(sp)                     # 4-byte Folded Reload
.LBB0_22:                               # %for.cond45.preheader.us1681.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_23 Depth 4
	mv	a5, a0
	mv	a3, s1
	mv	s0, t1
.LBB0_23:                               # %for.body92.us1692.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        #       Parent Loop BB0_22 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, 1
	add	a3, a3, a6
	add	a5, a5, a7
	blt	s0, s9, .LBB0_23
# %bb.24:                               # %for.cond90.for.end100_crit_edge.us1702.us
                                        #   in Loop: Header=BB0_22 Depth=3
	addi	a4, a4, 1
	lw	a1, 184(sp)                     # 4-byte Folded Reload
	add	s1, s1, a1
	add	a0, a0, s11
	lw	a1, 180(sp)                     # 4-byte Folded Reload
	blt	a4, a1, .LBB0_22
	j	.LBB0_12
.LBB0_25:                               # %for.cond121.for.cond.cleanup123_crit_edge.split.us.us.us
                                        #   in Loop: Header=BB0_26 Depth=2
	add	s10, s10, t6
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, t4, a0
	slli	a0, a0, 2
	lw	a1, 136(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	t4, t4, 1
	add	t2, t2, a7
	add	t3, t3, a7
	lw	a2, 120(sp)                     # 4-byte Folded Reload
	beq	t4, a2, .LBB0_43
.LBB0_26:                               # %for.cond121.preheader.us.us
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_28 Depth 3
                                        #         Child Loop BB0_29 Depth 4
                                        #         Child Loop BB0_31 Depth 4
	mv	t1, t3
	mv	s3, s7
	mv	a5, t2
	lw	s1, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
	lw	a0, 144(sp)                     # 4-byte Folded Reload
	j	.LBB0_28
.LBB0_27:                               # %for.end187.us.us.us
                                        #   in Loop: Header=BB0_28 Depth=3
	addi	a0, a0, 1
	lw	a1, 184(sp)                     # 4-byte Folded Reload
	add	s1, s1, a1
	add	a5, a5, s11
	add	s3, s3, a1
	add	t1, t1, s11
	lw	a1, 180(sp)                     # 4-byte Folded Reload
	bge	a0, a1, .LBB0_25
.LBB0_28:                               # %for.cond126.preheader.us.us.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_26 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_29 Depth 4
                                        #         Child Loop BB0_31 Depth 4
	li	a4, 0
	mv	s0, a5
	mv	a3, s1
.LBB0_29:                               # %for.body129.us.us.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_26 Depth=2
                                        #       Parent Loop BB0_28 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s0)
	flw	fa2, 0(a3)
	add	a2, s0, a7
	flw	fa1, 0(a2)
	add	a1, a3, a6
	flw	fa0, 0(a1)
	add	a2, a2, a7
	flw	ft0, 0(a2)
	add	a1, a1, a6
	flw	ft1, 0(a1)
	add	a2, a2, a7
	flw	ft2, 0(a2)
	add	a1, a1, a6
	flw	ft3, 0(a1)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	add	a2, a2, a7
	flw	fa3, 0(a2)
	add	a1, a1, a6
	flw	fa2, 0(a1)
	add	a2, a2, a7
	flw	fa1, 0(a2)
	add	a1, a1, a6
	flw	fa0, 0(a1)
	add	a2, a2, a7
	flw	ft0, 0(a2)
	add	a1, a1, a6
	flw	ft1, 0(a1)
	add	a2, a2, a7
	flw	ft2, 0(a2)
	add	a1, a1, a6
	flw	ft3, 0(a1)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	addi	a4, a4, 8
	add	a3, a3, s6
	add	s0, s0, t0
	blt	a4, t5, .LBB0_29
# %bb.30:                               # %for.cond126.for.cond176.preheader_crit_edge.us.us.us
                                        #   in Loop: Header=BB0_28 Depth=3
	mv	a3, t1
	mv	a4, s3
	mv	s0, s4
	lw	a1, 160(sp)                     # 4-byte Folded Reload
	bge	a1, s9, .LBB0_27
.LBB0_31:                               # %for.body178.us.us.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_26 Depth=2
                                        #       Parent Loop BB0_28 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a3)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, -1
	add	a4, a4, a6
	add	a3, a3, a7
	bnez	s0, .LBB0_31
	j	.LBB0_27
.LBB0_32:                               # %for.cond121.preheader.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	add	s10, s10, a0
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	lw	a3, 24(sp)                      # 4-byte Folded Reload
	lw	a1, 64(sp)                      # 4-byte Folded Reload
.LBB0_33:                               # %for.cond121.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	zero, 0(a0)
	addi	a3, a3, -1
	add	a0, a0, a1
	bnez	a3, .LBB0_33
	j	.LBB0_43
.LBB0_34:                               # %for.cond121.preheader.lr.ph.split.us.split
                                        #   in Loop: Header=BB0_3 Depth=1
	blez	s9, .LBB0_41
# %bb.35:                               # %for.cond121.preheader.us.us1788.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	slli	t1, s10, 2
	lw	a0, 164(sp)                     # 4-byte Folded Reload
	add	t1, t1, a0
	mv	t2, s0
.LBB0_36:                               # %for.cond121.preheader.us.us1788
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_37 Depth 3
                                        #         Child Loop BB0_38 Depth 4
	mv	a0, t1
	lw	s0, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
	lw	s1, 144(sp)                     # 4-byte Folded Reload
.LBB0_37:                               # %for.cond126.preheader.us1741.us.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_36 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_38 Depth 4
	mv	a4, a0
	mv	a5, s0
	mv	a3, s9
.LBB0_38:                               # %for.body178.us1752.us.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_36 Depth=2
                                        #       Parent Loop BB0_37 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a4)
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, -1
	add	a5, a5, a6
	add	a4, a4, a7
	bnez	a3, .LBB0_38
# %bb.39:                               # %for.cond176.for.end187_crit_edge.us1762.us.us
                                        #   in Loop: Header=BB0_37 Depth=3
	addi	s1, s1, 1
	lw	a1, 184(sp)                     # 4-byte Folded Reload
	add	s0, s0, a1
	add	a0, a0, s11
	lw	a1, 180(sp)                     # 4-byte Folded Reload
	blt	s1, a1, .LBB0_37
# %bb.40:                               # %for.cond121.for.cond.cleanup123_crit_edge.split.split.us.us.us
                                        #   in Loop: Header=BB0_36 Depth=2
	add	s10, s10, t6
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, t2, a0
	slli	a0, a0, 2
	lw	a1, 136(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	t2, t2, 1
	add	t1, t1, a7
	bne	t2, a2, .LBB0_36
	j	.LBB0_43
.LBB0_41:                               # %for.cond121.preheader.us.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	add	s10, s10, a0
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	lw	a3, 24(sp)                      # 4-byte Folded Reload
	lw	a1, 64(sp)                      # 4-byte Folded Reload
.LBB0_42:                               # %for.cond121.preheader.us
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	zero, 0(a0)
	addi	a3, a3, -1
	add	a0, a0, a1
	bnez	a3, .LBB0_42
.LBB0_43:                               # %for.cond201.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 148(sp)                     # 4-byte Folded Reload
	blt	a0, a2, .LBB0_2
# %bb.44:                               # %for.body204.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	slli	a0, s10, 2
	lw	a2, 164(sp)                     # 4-byte Folded Reload
	add	a2, a2, a0
	lw	a1, 44(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 140(sp)                     # 4-byte Folded Spill
	mv	t2, s9
	lw	t3, 56(sp)                      # 4-byte Folded Reload
	j	.LBB0_46
.LBB0_45:                               # %for.cond.cleanup212
                                        #   in Loop: Header=BB0_46 Depth=2
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, t3, a0
	slli	a0, a0, 2
	lw	a1, 136(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	t3, t3, 1
	addi	t2, t2, -1
	add	a2, a2, a7
	lw	a0, 140(sp)                     # 4-byte Folded Reload
	add	a0, a0, a7
	sw	a0, 140(sp)                     # 4-byte Folded Spill
	lw	a0, 148(sp)                     # 4-byte Folded Reload
	beq	t3, a0, .LBB0_2
.LBB0_46:                               # %for.body204
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_56 Depth 3
                                        #         Child Loop BB0_57 Depth 4
                                        #       Child Loop BB0_50 Depth 3
                                        #         Child Loop BB0_51 Depth 4
                                        #         Child Loop BB0_53 Depth 4
	fmv.s	fa4, fa5
	lw	a0, 180(sp)                     # 4-byte Folded Reload
	lw	a1, 144(sp)                     # 4-byte Folded Reload
	bge	a1, a0, .LBB0_45
# %bb.47:                               # %for.cond215.preheader.lr.ph
                                        #   in Loop: Header=BB0_46 Depth=2
	lw	a0, 128(sp)                     # 4-byte Folded Reload
	sub	s3, a0, t3
	li	a0, 8
	blt	s3, a0, .LBB0_54
# %bb.48:                               # %for.cond215.preheader.us.preheader
                                        #   in Loop: Header=BB0_46 Depth=2
	addi	s10, s3, -7
	lw	s4, 140(sp)                     # 4-byte Folded Reload
	lw	ra, 108(sp)                     # 4-byte Folded Reload
	mv	t1, a2
	lw	t4, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
	lw	s7, 144(sp)                     # 4-byte Folded Reload
	j	.LBB0_50
.LBB0_49:                               # %for.end276.us
                                        #   in Loop: Header=BB0_50 Depth=3
	addi	s7, s7, 1
	lw	a0, 184(sp)                     # 4-byte Folded Reload
	add	t4, t4, a0
	add	t1, t1, s11
	add	ra, ra, a0
	add	s4, s4, s11
	lw	a0, 180(sp)                     # 4-byte Folded Reload
	bge	s7, a0, .LBB0_45
.LBB0_50:                               # %for.cond215.preheader.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_46 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_51 Depth 4
                                        #         Child Loop BB0_53 Depth 4
	li	a5, 0
	mv	s8, s4
	mv	a0, ra
	mv	s1, t1
	mv	a4, t4
.LBB0_51:                               # %for.body218.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_46 Depth=2
                                        #       Parent Loop BB0_50 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s1)
	flw	fa2, 0(a4)
	add	a1, s1, a7
	flw	fa1, 0(a1)
	add	a3, a4, a6
	flw	fa0, 0(a3)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a3, a3, a6
	flw	ft1, 0(a3)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a3, a3, a6
	flw	ft3, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	add	a1, a1, a7
	flw	fa3, 0(a1)
	add	a3, a3, a6
	flw	fa2, 0(a3)
	add	a1, a1, a7
	flw	fa1, 0(a1)
	add	a3, a3, a6
	flw	fa0, 0(a3)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a3, a3, a6
	flw	ft1, 0(a3)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a3, a3, a6
	flw	ft3, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	mv	a3, a0
	mv	s0, s8
	fmadd.s	fa4, ft2, ft3, fa4
	addi	a5, a5, 8
	add	a4, a4, s6
	add	s1, s1, t0
	add	a0, a0, s6
	add	s8, s8, t0
	blt	a5, s10, .LBB0_51
# %bb.52:                               # %for.cond215.for.cond265.preheader_crit_edge.us
                                        #   in Loop: Header=BB0_50 Depth=3
	bge	a5, s3, .LBB0_49
.LBB0_53:                               # %for.body267.us
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_46 Depth=2
                                        #       Parent Loop BB0_50 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s0)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, 1
	add	a3, a3, a6
	add	s0, s0, a7
	blt	a5, s3, .LBB0_53
	j	.LBB0_49
.LBB0_54:                               # %for.cond215.preheader.lr.ph.split
                                        #   in Loop: Header=BB0_46 Depth=2
	fmv.s	fa4, fa5
	blez	s3, .LBB0_45
# %bb.55:                               # %for.cond215.preheader.us1814.preheader
                                        #   in Loop: Header=BB0_46 Depth=2
	mv	a0, a2
	lw	s1, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
	lw	a4, 144(sp)                     # 4-byte Folded Reload
.LBB0_56:                               # %for.cond215.preheader.us1814
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_46 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_57 Depth 4
	mv	a5, a0
	mv	a3, s1
	mv	s0, t2
.LBB0_57:                               # %for.body267.us1825
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_46 Depth=2
                                        #       Parent Loop BB0_56 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, -1
	add	a3, a3, a6
	add	a5, a5, a7
	bnez	s0, .LBB0_57
# %bb.58:                               # %for.cond265.for.end276_crit_edge.us1835
                                        #   in Loop: Header=BB0_56 Depth=3
	addi	a4, a4, 1
	lw	a1, 184(sp)                     # 4-byte Folded Reload
	add	s1, s1, a1
	add	a0, a0, s11
	lw	a1, 180(sp)                     # 4-byte Folded Reload
	blt	a4, a1, .LBB0_56
	j	.LBB0_45
.LBB0_59:                               # %for.cond294.preheader
	lw	a0, 76(sp)                      # 4-byte Folded Reload
	bge	a2, a0, .LBB0_97
# %bb.60:                               # %for.body297.lr.ph
	li	a5, 0
	mul	s1, t6, s0
	lw	t0, 72(sp)                      # 4-byte Folded Reload
	lw	a2, 100(sp)                     # 4-byte Folded Reload
	mul	a0, a2, t0
	slli	t1, a0, 2
	lw	t3, 104(sp)                     # 4-byte Folded Reload
	add	a0, t3, t1
	sw	a0, 96(sp)                      # 4-byte Folded Spill
	slli	a2, a2, 2
	sw	a2, 68(sp)                      # 4-byte Folded Spill
	lw	a4, 156(sp)                     # 4-byte Folded Reload
	slli	a0, a4, 2
	sw	a0, 112(sp)                     # 4-byte Folded Spill
	lw	a3, 4(sp)                       # 4-byte Folded Reload
	slli	a3, a3, 2
	lw	a1, 152(sp)                     # 4-byte Folded Reload
	add	a3, a3, a1
	sw	a3, 52(sp)                      # 4-byte Folded Spill
	neg	a0, a6
	sw	a0, 124(sp)                     # 4-byte Folded Spill
	sw	s1, 84(sp)                      # 4-byte Folded Spill
	slli	a3, s1, 2
	lw	s1, 164(sp)                     # 4-byte Folded Reload
	add	a3, a3, s1
	sw	a3, 116(sp)                     # 4-byte Folded Spill
	lw	a2, 168(sp)                     # 4-byte Folded Reload
	slli	a2, a2, 2
	lw	s3, 172(sp)                     # 4-byte Folded Reload
	slli	s3, s3, 5
	slli	t2, t6, 5
	lw	a3, 172(sp)                     # 4-byte Folded Reload
	lw	a0, 8(sp)                       # 4-byte Folded Reload
	mul	a3, a3, a0
	sw	a3, 48(sp)                      # 4-byte Folded Spill
	mul	a0, t6, a0
	sw	a0, 44(sp)                      # 4-byte Folded Spill
	lw	a3, 12(sp)                      # 4-byte Folded Reload
	addi	a3, a3, -1
	sw	a3, 64(sp)                      # 4-byte Folded Spill
	lw	a0, 56(sp)                      # 4-byte Folded Reload
	mul	a3, a4, a0
	slli	a3, a3, 2
	add	a0, t3, t1
	add	a0, a0, a3
	sw	a0, 92(sp)                      # 4-byte Folded Spill
	add	a1, a1, s3
	sw	a1, 108(sp)                     # 4-byte Folded Spill
	add	s1, s1, t2
	sw	s1, 36(sp)                      # 4-byte Folded Spill
	fmv.w.x	fa5, zero
	j	.LBB0_62
.LBB0_61:                               # %for.cond.cleanup393
                                        #   in Loop: Header=BB0_62 Depth=1
	lw	a0, 168(sp)                     # 4-byte Folded Reload
	lw	a5, 88(sp)                      # 4-byte Folded Reload
	add	a5, a5, a0
	lw	t0, 80(sp)                      # 4-byte Folded Reload
	addi	t0, t0, 1
	lw	a1, 84(sp)                      # 4-byte Folded Reload
	add	a1, a1, a0
	sw	a1, 84(sp)                      # 4-byte Folded Spill
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	lw	a1, 68(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 96(sp)                      # 4-byte Folded Spill
	lw	a0, 116(sp)                     # 4-byte Folded Reload
	add	a0, a0, a2
	sw	a0, 116(sp)                     # 4-byte Folded Spill
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 92(sp)                      # 4-byte Folded Spill
	lw	a0, 76(sp)                      # 4-byte Folded Reload
	lw	s0, 132(sp)                     # 4-byte Folded Reload
	lw	a4, 172(sp)                     # 4-byte Folded Reload
	beq	t0, a0, .LBB0_97
.LBB0_62:                               # %for.body297
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_78 Depth 2
                                        #     Child Loop BB0_66 Depth 2
                                        #       Child Loop BB0_75 Depth 3
                                        #         Child Loop BB0_76 Depth 4
                                        #       Child Loop BB0_69 Depth 3
                                        #         Child Loop BB0_70 Depth 4
                                        #         Child Loop BB0_72 Depth 4
                                        #     Child Loop BB0_96 Depth 2
                                        #     Child Loop BB0_84 Depth 2
                                        #       Child Loop BB0_93 Depth 3
                                        #         Child Loop BB0_94 Depth 4
                                        #       Child Loop BB0_87 Depth 3
                                        #         Child Loop BB0_88 Depth 4
                                        #         Child Loop BB0_90 Depth 4
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	sw	t0, 80(sp)                      # 4-byte Folded Spill
	mul	a0, t0, a0
	slli	a0, a0, 2
	lw	a1, 104(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 136(sp)                     # 4-byte Folded Spill
	sw	a5, 88(sp)                      # 4-byte Folded Spill
	mv	s1, a5
	blez	s0, .LBB0_80
# %bb.63:                               # %for.body305.lr.ph
                                        #   in Loop: Header=BB0_62 Depth=1
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	mv	a3, s0
	lw	a1, 180(sp)                     # 4-byte Folded Reload
	lw	a4, 112(sp)                     # 4-byte Folded Reload
	blez	a1, .LBB0_78
# %bb.64:                               # %for.body305.us.preheader
                                        #   in Loop: Header=BB0_62 Depth=1
	li	t1, 0
	lw	s4, 44(sp)                      # 4-byte Folded Reload
	lw	s6, 48(sp)                      # 4-byte Folded Reload
	lw	s8, 52(sp)                      # 4-byte Folded Reload
	lw	s1, 88(sp)                      # 4-byte Folded Reload
	j	.LBB0_66
.LBB0_65:                               # %for.cond311.for.cond.cleanup313_crit_edge.us
                                        #   in Loop: Header=BB0_66 Depth=2
	lw	s1, 140(sp)                     # 4-byte Folded Reload
	add	s1, s1, t6
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, t1, a0
	slli	a0, a0, 2
	lw	a1, 136(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	t1, t1, 1
	lw	a0, 124(sp)                     # 4-byte Folded Reload
	lw	s8, 144(sp)                     # 4-byte Folded Reload
	add	s8, s8, a0
	lw	a0, 172(sp)                     # 4-byte Folded Reload
	sub	s6, s6, a0
	sub	s4, s4, t6
	lw	s0, 132(sp)                     # 4-byte Folded Reload
	beq	t1, s0, .LBB0_80
.LBB0_66:                               # %for.body305.us
                                        #   Parent Loop BB0_62 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_75 Depth 3
                                        #         Child Loop BB0_76 Depth 4
                                        #       Child Loop BB0_69 Depth 3
                                        #         Child Loop BB0_70 Depth 4
                                        #         Child Loop BB0_72 Depth 4
	sub	s11, s0, t1
	sw	s1, 140(sp)                     # 4-byte Folded Spill
	sw	s8, 144(sp)                     # 4-byte Folded Spill
	bge	s11, t5, .LBB0_73
# %bb.67:                               # %for.cond316.preheader.us.us.preheader
                                        #   in Loop: Header=BB0_66 Depth=2
	li	s10, 0
	lw	ra, 116(sp)                     # 4-byte Folded Reload
	lw	t4, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
	j	.LBB0_69
.LBB0_68:                               # %for.end377.us.us
                                        #   in Loop: Header=BB0_69 Depth=3
	lw	a0, 184(sp)                     # 4-byte Folded Reload
	add	t4, t4, a0
	lw	a1, 168(sp)                     # 4-byte Folded Reload
	add	s1, s1, a1
	addi	s10, s10, 1
	add	s8, s8, a0
	add	ra, ra, a2
	lw	a0, 180(sp)                     # 4-byte Folded Reload
	beq	s10, a0, .LBB0_65
.LBB0_69:                               # %for.cond316.preheader.us.us
                                        #   Parent Loop BB0_62 Depth=1
                                        #     Parent Loop BB0_66 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_70 Depth 4
                                        #         Child Loop BB0_72 Depth 4
	slli	s0, s1, 2
	lw	a0, 164(sp)                     # 4-byte Folded Reload
	add	s0, s0, a0
	mv	t0, s4
	mv	a0, s6
	mv	a5, ra
	mv	s7, s8
	mv	t3, s11
.LBB0_70:                               # %for.body319.us.us
                                        #   Parent Loop BB0_62 Depth=1
                                        #     Parent Loop BB0_66 Depth=2
                                        #       Parent Loop BB0_69 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(s7)
	add	a1, a5, a7
	flw	fa1, 0(a1)
	add	a3, s7, a6
	flw	fa0, 0(a3)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a3, a3, a6
	flw	ft1, 0(a3)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a3, a3, a6
	flw	ft3, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	add	a1, a1, a7
	flw	fa3, 0(a1)
	add	a3, a3, a6
	flw	fa2, 0(a3)
	add	a1, a1, a7
	flw	fa1, 0(a1)
	add	a3, a3, a6
	flw	fa0, 0(a3)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a3, a3, a6
	flw	ft1, 0(a3)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a3, a3, a6
	flw	ft3, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	mv	a4, a0
	mv	a3, t0
	fmadd.s	fa4, ft2, ft3, fa4
	addi	t3, t3, 8
	add	s7, s7, s3
	add	a5, a5, t2
	add	a0, a0, s5
	add	t0, t0, s2
	blt	t3, t5, .LBB0_70
# %bb.71:                               # %for.cond316.for.cond366.preheader_crit_edge.us.us
                                        #   in Loop: Header=BB0_69 Depth=3
	lw	a1, 172(sp)                     # 4-byte Folded Reload
	bge	t3, s9, .LBB0_68
.LBB0_72:                               # %for.body368.us.us
                                        #   Parent Loop BB0_62 Depth=1
                                        #     Parent Loop BB0_66 Depth=2
                                        #       Parent Loop BB0_69 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	slli	a0, a3, 2
	add	a0, a0, s0
	flw	fa3, 0(a0)
	slli	a0, a4, 2
	add	a0, a0, t4
	flw	fa2, 0(a0)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	t3, t3, 1
	add	a4, a4, a1
	add	a3, a3, t6
	blt	t3, s9, .LBB0_72
	j	.LBB0_68
.LBB0_73:                               # %for.cond316.preheader.lr.ph.split.us1908
                                        #   in Loop: Header=BB0_66 Depth=2
	fmv.s	fa4, fa5
	bge	s11, s9, .LBB0_65
# %bb.74:                               # %for.cond316.preheader.us1866.us.preheader
                                        #   in Loop: Header=BB0_66 Depth=2
	li	a0, 0
	lw	a3, 116(sp)                     # 4-byte Folded Reload
	lw	s1, 144(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
.LBB0_75:                               # %for.cond316.preheader.us1866.us
                                        #   Parent Loop BB0_62 Depth=1
                                        #     Parent Loop BB0_66 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_76 Depth 4
	mv	a5, a3
	mv	a4, s1
	mv	s0, s11
.LBB0_76:                               # %for.body368.us1877.us
                                        #   Parent Loop BB0_62 Depth=1
                                        #     Parent Loop BB0_66 Depth=2
                                        #       Parent Loop BB0_75 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, 1
	add	a4, a4, a6
	add	a5, a5, a7
	blt	s0, s9, .LBB0_76
# %bb.77:                               # %for.cond366.for.end377_crit_edge.us1887.us
                                        #   in Loop: Header=BB0_75 Depth=3
	addi	a0, a0, 1
	lw	a1, 184(sp)                     # 4-byte Folded Reload
	add	s1, s1, a1
	add	a3, a3, a2
	lw	a1, 180(sp)                     # 4-byte Folded Reload
	bne	a0, a1, .LBB0_75
	j	.LBB0_65
.LBB0_78:                               # %for.body305
                                        #   Parent Loop BB0_62 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	zero, 0(a0)
	addi	a3, a3, -1
	add	a0, a0, a4
	bnez	a3, .LBB0_78
# %bb.79:                               #   in Loop: Header=BB0_62 Depth=1
	lw	s1, 84(sp)                      # 4-byte Folded Reload
.LBB0_80:                               # %for.cond391.preheader
                                        #   in Loop: Header=BB0_62 Depth=1
	lw	a0, 120(sp)                     # 4-byte Folded Reload
	lw	a1, 148(sp)                     # 4-byte Folded Reload
	blt	a1, a0, .LBB0_61
# %bb.81:                               # %for.body394.lr.ph
                                        #   in Loop: Header=BB0_62 Depth=1
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	lw	a3, 64(sp)                      # 4-byte Folded Reload
	lw	a1, 180(sp)                     # 4-byte Folded Reload
	blez	a1, .LBB0_96
# %bb.82:                               # %for.body394.us.preheader
                                        #   in Loop: Header=BB0_62 Depth=1
	slli	a0, s1, 2
	lw	s4, 164(sp)                     # 4-byte Folded Reload
	add	s4, s4, a0
	lw	a1, 36(sp)                      # 4-byte Folded Reload
	add	t1, a1, a0
	mv	t0, s9
	lw	s6, 56(sp)                      # 4-byte Folded Reload
	j	.LBB0_84
.LBB0_83:                               # %for.cond400.for.cond.cleanup402_crit_edge.us
                                        #   in Loop: Header=BB0_84 Depth=2
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, s6, a0
	slli	a0, a0, 2
	lw	a1, 136(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	s6, s6, 1
	addi	t0, t0, -1
	add	s4, s4, a7
	lw	t1, 144(sp)                     # 4-byte Folded Reload
	add	t1, t1, a7
	lw	a0, 148(sp)                     # 4-byte Folded Reload
	beq	s6, a0, .LBB0_61
.LBB0_84:                               # %for.body394.us
                                        #   Parent Loop BB0_62 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_93 Depth 3
                                        #         Child Loop BB0_94 Depth 4
                                        #       Child Loop BB0_87 Depth 3
                                        #         Child Loop BB0_88 Depth 4
                                        #         Child Loop BB0_90 Depth 4
	lw	a0, 128(sp)                     # 4-byte Folded Reload
	sub	s10, a0, s6
	li	a0, 8
	sw	t1, 144(sp)                     # 4-byte Folded Spill
	blt	s10, a0, .LBB0_91
# %bb.85:                               # %for.cond405.preheader.us.us.preheader
                                        #   in Loop: Header=BB0_84 Depth=2
	li	t3, 0
	addi	ra, s10, -7
	lw	s8, 108(sp)                     # 4-byte Folded Reload
	mv	t4, s4
	lw	s11, 152(sp)                    # 4-byte Folded Reload
	fmv.s	fa4, fa5
	j	.LBB0_87
.LBB0_86:                               # %for.end466.us.us
                                        #   in Loop: Header=BB0_87 Depth=3
	addi	t3, t3, 1
	lw	a0, 184(sp)                     # 4-byte Folded Reload
	add	s11, s11, a0
	add	t4, t4, a2
	add	s8, s8, a0
	add	t1, t1, a2
	lw	a0, 180(sp)                     # 4-byte Folded Reload
	beq	t3, a0, .LBB0_83
.LBB0_87:                               # %for.cond405.preheader.us.us
                                        #   Parent Loop BB0_62 Depth=1
                                        #     Parent Loop BB0_84 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_88 Depth 4
                                        #         Child Loop BB0_90 Depth 4
	li	s0, 0
	mv	s7, t1
	mv	a0, s8
	mv	s1, t4
	mv	a3, s11
.LBB0_88:                               # %for.body408.us.us
                                        #   Parent Loop BB0_62 Depth=1
                                        #     Parent Loop BB0_84 Depth=2
                                        #       Parent Loop BB0_87 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s1)
	flw	fa2, 0(a3)
	add	a1, s1, a7
	flw	fa1, 0(a1)
	add	a4, a3, a6
	flw	fa0, 0(a4)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a4, a4, a6
	flw	ft1, 0(a4)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a4, a4, a6
	flw	ft3, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	add	a1, a1, a7
	flw	fa3, 0(a1)
	add	a4, a4, a6
	flw	fa2, 0(a4)
	add	a1, a1, a7
	flw	fa1, 0(a1)
	add	a4, a4, a6
	flw	fa0, 0(a4)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a4, a4, a6
	flw	ft1, 0(a4)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a4, a4, a6
	flw	ft3, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	mv	a4, a0
	mv	a5, s7
	fmadd.s	fa4, ft2, ft3, fa4
	addi	s0, s0, 8
	add	a3, a3, s3
	add	s1, s1, t2
	add	a0, a0, s3
	add	s7, s7, t2
	blt	s0, ra, .LBB0_88
# %bb.89:                               # %for.cond405.for.cond455.preheader_crit_edge.us.us
                                        #   in Loop: Header=BB0_87 Depth=3
	bge	s0, s10, .LBB0_86
.LBB0_90:                               # %for.body457.us.us
                                        #   Parent Loop BB0_62 Depth=1
                                        #     Parent Loop BB0_84 Depth=2
                                        #       Parent Loop BB0_87 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, 1
	add	a4, a4, a6
	add	a5, a5, a7
	blt	s0, s10, .LBB0_90
	j	.LBB0_86
.LBB0_91:                               # %for.cond405.preheader.lr.ph.split.us1970
                                        #   in Loop: Header=BB0_84 Depth=2
	fmv.s	fa4, fa5
	blez	s10, .LBB0_83
# %bb.92:                               # %for.cond405.preheader.us1929.us.preheader
                                        #   in Loop: Header=BB0_84 Depth=2
	li	a0, 0
	mv	a3, s4
	lw	s1, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
.LBB0_93:                               # %for.cond405.preheader.us1929.us
                                        #   Parent Loop BB0_62 Depth=1
                                        #     Parent Loop BB0_84 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_94 Depth 4
	mv	a5, a3
	mv	a4, s1
	mv	s0, t0
.LBB0_94:                               # %for.body457.us1940.us
                                        #   Parent Loop BB0_62 Depth=1
                                        #     Parent Loop BB0_84 Depth=2
                                        #       Parent Loop BB0_93 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, -1
	add	a4, a4, a6
	add	a5, a5, a7
	bnez	s0, .LBB0_94
# %bb.95:                               # %for.cond455.for.end466_crit_edge.us1950.us
                                        #   in Loop: Header=BB0_93 Depth=3
	addi	a0, a0, 1
	lw	a1, 184(sp)                     # 4-byte Folded Reload
	add	s1, s1, a1
	add	a3, a3, a2
	lw	a1, 180(sp)                     # 4-byte Folded Reload
	bne	a0, a1, .LBB0_93
	j	.LBB0_83
.LBB0_96:                               # %for.body394
                                        #   Parent Loop BB0_62 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	zero, 0(a0)
	addi	a3, a3, 1
	lw	a1, 112(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	bnez	a3, .LBB0_96
	j	.LBB0_61
.LBB0_97:                               # %for.cond484.preheader
	lw	a0, 76(sp)                      # 4-byte Folded Reload
	lw	a1, 60(sp)                      # 4-byte Folded Reload
	bge	a0, a1, .LBB0_157
# %bb.98:                               # %for.body487.lr.ph
	li	a3, 0
	lw	t0, 76(sp)                      # 4-byte Folded Reload
	lw	a0, 180(sp)                     # 4-byte Folded Reload
	add	a0, a0, t0
	sw	a0, 68(sp)                      # 4-byte Folded Spill
	mul	a2, t6, s0
	andi	a0, s9, 7
	sw	a0, 20(sp)                      # 4-byte Folded Spill
	lw	a1, 100(sp)                     # 4-byte Folded Reload
	mul	a0, a1, t0
	slli	a0, a0, 2
	lw	t1, 104(sp)                     # 4-byte Folded Reload
	add	a4, t1, a0
	sw	a4, 96(sp)                      # 4-byte Folded Spill
	slli	a1, a1, 2
	sw	a1, 64(sp)                      # 4-byte Folded Spill
	lw	a4, 156(sp)                     # 4-byte Folded Reload
	slli	a1, a4, 2
	sw	a1, 56(sp)                      # 4-byte Folded Spill
	lw	a1, 4(sp)                       # 4-byte Folded Reload
	slli	a1, a1, 2
	lw	s1, 152(sp)                     # 4-byte Folded Reload
	add	a1, a1, s1
	sw	a1, 48(sp)                      # 4-byte Folded Spill
	neg	a1, a6
	sw	a1, 116(sp)                     # 4-byte Folded Spill
	sw	a2, 84(sp)                      # 4-byte Folded Spill
	slli	a1, a2, 2
	lw	a5, 164(sp)                     # 4-byte Folded Reload
	add	a1, a1, a5
	sw	a1, 112(sp)                     # 4-byte Folded Spill
	lw	s4, 168(sp)                     # 4-byte Folded Reload
	slli	s4, s4, 2
	lw	s11, 172(sp)                    # 4-byte Folded Reload
	slli	s11, s11, 5
	slli	s10, t6, 5
	lw	a1, 172(sp)                     # 4-byte Folded Reload
	lw	a2, 8(sp)                       # 4-byte Folded Reload
	mul	a1, a1, a2
	sw	a1, 44(sp)                      # 4-byte Folded Spill
	mul	a1, t6, a2
	sw	a1, 36(sp)                      # 4-byte Folded Spill
	lw	a1, 148(sp)                     # 4-byte Folded Reload
	lw	a2, 12(sp)                      # 4-byte Folded Reload
	add	a1, a1, a2
	sub	a2, a1, s0
	mul	a1, a4, s0
	slli	a1, a1, 2
	add	a0, a0, a1
	add	a0, a0, t1
	sw	a0, 88(sp)                      # 4-byte Folded Spill
	sw	a2, 28(sp)                      # 4-byte Folded Spill
	mul	a0, t6, a2
	sw	a0, 24(sp)                      # 4-byte Folded Spill
	srli	a0, s9, 3
	lw	a1, 172(sp)                     # 4-byte Folded Reload
	mul	a1, a1, a0
	slli	a1, a1, 5
	add	a1, a1, s1
	sw	a1, 32(sp)                      # 4-byte Folded Spill
	mul	a0, t6, a0
	slli	a0, a0, 5
	add	a0, a0, a5
	sw	a0, 16(sp)                      # 4-byte Folded Spill
	add	s1, s1, s11
	sw	s1, 108(sp)                     # 4-byte Folded Spill
	add	a5, a5, s10
	sw	a5, 52(sp)                      # 4-byte Folded Spill
	fmv.w.x	fa5, zero
	j	.LBB0_100
.LBB0_99:                               # %for.cond.cleanup673
                                        #   in Loop: Header=BB0_100 Depth=1
	lw	a0, 168(sp)                     # 4-byte Folded Reload
	lw	a3, 92(sp)                      # 4-byte Folded Reload
	add	a3, a3, a0
	lw	t0, 80(sp)                      # 4-byte Folded Reload
	addi	t0, t0, 1
	lw	a1, 84(sp)                      # 4-byte Folded Reload
	add	a1, a1, a0
	sw	a1, 84(sp)                      # 4-byte Folded Spill
	lw	a0, 176(sp)                     # 4-byte Folded Reload
	addi	a0, a0, -1
	sw	a0, 176(sp)                     # 4-byte Folded Spill
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	lw	a1, 64(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 96(sp)                      # 4-byte Folded Spill
	lw	a0, 112(sp)                     # 4-byte Folded Reload
	add	a0, a0, s4
	sw	a0, 112(sp)                     # 4-byte Folded Spill
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 88(sp)                      # 4-byte Folded Spill
	lw	s0, 132(sp)                     # 4-byte Folded Reload
	lw	a4, 172(sp)                     # 4-byte Folded Reload
	lw	a0, 60(sp)                      # 4-byte Folded Reload
	beq	t0, a0, .LBB0_157
.LBB0_100:                              # %for.body487
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_116 Depth 2
                                        #     Child Loop BB0_104 Depth 2
                                        #       Child Loop BB0_113 Depth 3
                                        #         Child Loop BB0_114 Depth 4
                                        #       Child Loop BB0_107 Depth 3
                                        #         Child Loop BB0_108 Depth 4
                                        #         Child Loop BB0_110 Depth 4
                                        #     Child Loop BB0_131 Depth 2
                                        #     Child Loop BB0_140 Depth 2
                                        #     Child Loop BB0_134 Depth 2
                                        #       Child Loop BB0_135 Depth 3
                                        #         Child Loop BB0_136 Depth 4
                                        #     Child Loop BB0_123 Depth 2
                                        #       Child Loop BB0_125 Depth 3
                                        #         Child Loop BB0_126 Depth 4
                                        #         Child Loop BB0_128 Depth 4
                                        #     Child Loop BB0_144 Depth 2
                                        #       Child Loop BB0_154 Depth 3
                                        #         Child Loop BB0_155 Depth 4
                                        #       Child Loop BB0_148 Depth 3
                                        #         Child Loop BB0_149 Depth 4
                                        #         Child Loop BB0_151 Depth 4
	not	a0, t0
	lw	a1, 68(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 124(sp)                     # 4-byte Folded Spill
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	sw	t0, 80(sp)                      # 4-byte Folded Spill
	mul	a0, t0, a0
	slli	a0, a0, 2
	lw	a1, 104(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 144(sp)                     # 4-byte Folded Spill
	sw	a3, 92(sp)                      # 4-byte Folded Spill
	sw	a3, 140(sp)                     # 4-byte Folded Spill
	blez	s0, .LBB0_118
# %bb.101:                              # %for.body496.lr.ph
                                        #   in Loop: Header=BB0_100 Depth=1
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	mv	a3, s0
	lw	a1, 56(sp)                      # 4-byte Folded Reload
	lw	a2, 124(sp)                     # 4-byte Folded Reload
	blez	a2, .LBB0_116
# %bb.102:                              # %for.body496.us.preheader
                                        #   in Loop: Header=BB0_100 Depth=1
	li	s7, 0
	lw	t2, 36(sp)                      # 4-byte Folded Reload
	lw	ra, 44(sp)                      # 4-byte Folded Reload
	lw	t0, 48(sp)                      # 4-byte Folded Reload
	lw	a0, 92(sp)                      # 4-byte Folded Reload
	sw	a0, 140(sp)                     # 4-byte Folded Spill
	j	.LBB0_104
.LBB0_103:                              # %for.cond503.for.cond.cleanup505_crit_edge.us
                                        #   in Loop: Header=BB0_104 Depth=2
	lw	a0, 140(sp)                     # 4-byte Folded Reload
	add	a0, a0, t6
	sw	a0, 140(sp)                     # 4-byte Folded Spill
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, s7, a0
	slli	a0, a0, 2
	lw	a1, 144(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	s7, s7, 1
	lw	a0, 116(sp)                     # 4-byte Folded Reload
	lw	t0, 136(sp)                     # 4-byte Folded Reload
	add	t0, t0, a0
	lw	a0, 172(sp)                     # 4-byte Folded Reload
	sub	ra, ra, a0
	sub	t2, t2, t6
	lw	s0, 132(sp)                     # 4-byte Folded Reload
	beq	s7, s0, .LBB0_118
.LBB0_104:                              # %for.body496.us
                                        #   Parent Loop BB0_100 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_113 Depth 3
                                        #         Child Loop BB0_114 Depth 4
                                        #       Child Loop BB0_107 Depth 3
                                        #         Child Loop BB0_108 Depth 4
                                        #         Child Loop BB0_110 Depth 4
	sub	s6, s0, s7
	sw	t0, 136(sp)                     # 4-byte Folded Spill
	bge	s6, t5, .LBB0_111
# %bb.105:                              # %for.cond508.preheader.us.us.preheader
                                        #   in Loop: Header=BB0_104 Depth=2
	li	t4, 0
	lw	a2, 112(sp)                     # 4-byte Folded Reload
	lw	s1, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
	lw	s3, 140(sp)                     # 4-byte Folded Reload
	j	.LBB0_107
.LBB0_106:                              # %for.end569.us.us
                                        #   in Loop: Header=BB0_107 Depth=3
	lw	a0, 184(sp)                     # 4-byte Folded Reload
	add	s1, s1, a0
	lw	a1, 168(sp)                     # 4-byte Folded Reload
	add	s3, s3, a1
	addi	t4, t4, 1
	add	t0, t0, a0
	add	a2, a2, s4
	lw	a0, 176(sp)                     # 4-byte Folded Reload
	beq	t4, a0, .LBB0_103
.LBB0_107:                              # %for.cond508.preheader.us.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_104 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_108 Depth 4
                                        #         Child Loop BB0_110 Depth 4
	slli	a0, s3, 2
	lw	a1, 164(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	mv	s8, t2
	mv	s0, ra
	mv	a5, a2
	mv	t1, t0
	mv	t3, s6
.LBB0_108:                              # %for.body511.us.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_104 Depth=2
                                        #       Parent Loop BB0_107 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(t1)
	add	a1, a5, a7
	flw	fa1, 0(a1)
	add	a3, t1, a6
	flw	fa0, 0(a3)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a3, a3, a6
	flw	ft1, 0(a3)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a3, a3, a6
	flw	ft3, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	add	a1, a1, a7
	flw	fa3, 0(a1)
	add	a3, a3, a6
	flw	fa2, 0(a3)
	add	a1, a1, a7
	flw	fa1, 0(a1)
	add	a3, a3, a6
	flw	fa0, 0(a3)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a3, a3, a6
	flw	ft1, 0(a3)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a3, a3, a6
	flw	ft3, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	mv	a4, s0
	mv	a3, s8
	fmadd.s	fa4, ft2, ft3, fa4
	addi	t3, t3, 8
	add	t1, t1, s11
	add	a5, a5, s10
	add	s0, s0, s5
	add	s8, s8, s2
	blt	t3, t5, .LBB0_108
# %bb.109:                              # %for.cond508.for.cond558.preheader_crit_edge.us.us
                                        #   in Loop: Header=BB0_107 Depth=3
	lw	a5, 172(sp)                     # 4-byte Folded Reload
	bge	t3, s9, .LBB0_106
.LBB0_110:                              # %for.body560.us.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_104 Depth=2
                                        #       Parent Loop BB0_107 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	slli	a1, a3, 2
	add	a1, a1, a0
	flw	fa3, 0(a1)
	slli	a1, a4, 2
	add	a1, a1, s1
	flw	fa2, 0(a1)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	t3, t3, 1
	add	a4, a4, a5
	add	a3, a3, t6
	blt	t3, s9, .LBB0_110
	j	.LBB0_106
.LBB0_111:                              # %for.cond508.preheader.lr.ph.split.us2036
                                        #   in Loop: Header=BB0_104 Depth=2
	fmv.s	fa4, fa5
	bge	s6, s9, .LBB0_103
# %bb.112:                              # %for.cond508.preheader.us1994.us.preheader
                                        #   in Loop: Header=BB0_104 Depth=2
	li	a0, 0
	lw	a3, 112(sp)                     # 4-byte Folded Reload
	lw	s1, 136(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
.LBB0_113:                              # %for.cond508.preheader.us1994.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_104 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_114 Depth 4
	mv	a5, a3
	mv	a4, s1
	mv	s0, s6
.LBB0_114:                              # %for.body560.us2005.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_104 Depth=2
                                        #       Parent Loop BB0_113 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, 1
	add	a4, a4, a6
	add	a5, a5, a7
	blt	s0, s9, .LBB0_114
# %bb.115:                              # %for.cond558.for.end569_crit_edge.us2015.us
                                        #   in Loop: Header=BB0_113 Depth=3
	addi	a0, a0, 1
	lw	a1, 184(sp)                     # 4-byte Folded Reload
	add	s1, s1, a1
	add	a3, a3, s4
	lw	a1, 176(sp)                     # 4-byte Folded Reload
	bne	a0, a1, .LBB0_113
	j	.LBB0_103
.LBB0_116:                              # %for.body496
                                        #   Parent Loop BB0_100 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	zero, 0(a0)
	addi	a3, a3, -1
	add	a0, a0, a1
	bnez	a3, .LBB0_116
# %bb.117:                              #   in Loop: Header=BB0_100 Depth=1
	lw	a0, 84(sp)                      # 4-byte Folded Reload
	sw	a0, 140(sp)                     # 4-byte Folded Spill
.LBB0_118:                              # %for.cond583.preheader
                                        #   in Loop: Header=BB0_100 Depth=1
	lw	s3, 120(sp)                     # 4-byte Folded Reload
	bge	s0, s3, .LBB0_129
# %bb.119:                              # %for.cond591.preheader.lr.ph
                                        #   in Loop: Header=BB0_100 Depth=1
	lw	a0, 124(sp)                     # 4-byte Folded Reload
	lw	s8, 140(sp)                     # 4-byte Folded Reload
	blez	a0, .LBB0_130
# %bb.120:                              # %for.cond591.preheader.lr.ph.split.us
                                        #   in Loop: Header=BB0_100 Depth=1
	lw	s7, 32(sp)                      # 4-byte Folded Reload
	li	a0, 8
	blt	s9, a0, .LBB0_132
# %bb.121:                              # %for.cond591.preheader.us.us.preheader
                                        #   in Loop: Header=BB0_100 Depth=1
	slli	t3, s8, 2
	lw	t1, 164(sp)                     # 4-byte Folded Reload
	add	t1, t1, t3
	lw	a0, 16(sp)                      # 4-byte Folded Reload
	add	t3, t3, a0
	mv	t0, s0
	lw	s6, 20(sp)                      # 4-byte Folded Reload
	j	.LBB0_123
.LBB0_122:                              # %for.cond591.for.cond.cleanup593_crit_edge.split.us.us.us
                                        #   in Loop: Header=BB0_123 Depth=2
	add	s8, s8, t6
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, t0, a0
	slli	a0, a0, 2
	lw	a1, 144(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	t0, t0, 1
	add	t1, t1, a7
	add	t3, t3, a7
	beq	t0, s3, .LBB0_141
.LBB0_123:                              # %for.cond591.preheader.us.us
                                        #   Parent Loop BB0_100 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_125 Depth 3
                                        #         Child Loop BB0_126 Depth 4
                                        #         Child Loop BB0_128 Depth 4
	li	t4, 0
	mv	t2, t3
	mv	s0, s7
	mv	a0, t1
	lw	a2, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
	j	.LBB0_125
.LBB0_124:                              # %for.end657.us.us.us
                                        #   in Loop: Header=BB0_125 Depth=3
	addi	t4, t4, 1
	lw	a1, 184(sp)                     # 4-byte Folded Reload
	add	a2, a2, a1
	add	a0, a0, s4
	add	s0, s0, a1
	add	t2, t2, s4
	lw	a1, 176(sp)                     # 4-byte Folded Reload
	beq	t4, a1, .LBB0_122
.LBB0_125:                              # %for.cond596.preheader.us.us.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_123 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_126 Depth 4
                                        #         Child Loop BB0_128 Depth 4
	li	a3, 0
	mv	a4, a0
	mv	s1, a2
.LBB0_126:                              # %for.body599.us.us.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_123 Depth=2
                                        #       Parent Loop BB0_125 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a4)
	flw	fa2, 0(s1)
	add	a1, a4, a7
	flw	fa1, 0(a1)
	add	a5, s1, a6
	flw	fa0, 0(a5)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a5, a5, a6
	flw	ft1, 0(a5)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a5, a5, a6
	flw	ft3, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	add	a1, a1, a7
	flw	fa3, 0(a1)
	add	a5, a5, a6
	flw	fa2, 0(a5)
	add	a1, a1, a7
	flw	fa1, 0(a1)
	add	a5, a5, a6
	flw	fa0, 0(a5)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a5, a5, a6
	flw	ft1, 0(a5)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a5, a5, a6
	flw	ft3, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	addi	a3, a3, 8
	add	s1, s1, s11
	add	a4, a4, s10
	blt	a3, t5, .LBB0_126
# %bb.127:                              # %for.cond596.for.cond646.preheader_crit_edge.us.us.us
                                        #   in Loop: Header=BB0_125 Depth=3
	mv	a3, t2
	mv	a4, s0
	mv	a5, s6
	lw	a1, 160(sp)                     # 4-byte Folded Reload
	bge	a1, s9, .LBB0_124
.LBB0_128:                              # %for.body648.us.us.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_123 Depth=2
                                        #       Parent Loop BB0_125 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a3)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, -1
	add	a4, a4, a6
	add	a3, a3, a7
	bnez	a5, .LBB0_128
	j	.LBB0_124
.LBB0_129:                              #   in Loop: Header=BB0_100 Depth=1
	lw	s8, 140(sp)                     # 4-byte Folded Reload
	j	.LBB0_141
.LBB0_130:                              # %for.cond591.preheader.preheader
                                        #   in Loop: Header=BB0_100 Depth=1
	lw	a0, 24(sp)                      # 4-byte Folded Reload
	add	s8, s8, a0
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	lw	a3, 28(sp)                      # 4-byte Folded Reload
	lw	a1, 56(sp)                      # 4-byte Folded Reload
.LBB0_131:                              # %for.cond591.preheader
                                        #   Parent Loop BB0_100 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	zero, 0(a0)
	addi	a3, a3, -1
	add	a0, a0, a1
	bnez	a3, .LBB0_131
	j	.LBB0_141
.LBB0_132:                              # %for.cond591.preheader.lr.ph.split.us.split
                                        #   in Loop: Header=BB0_100 Depth=1
	blez	s9, .LBB0_139
# %bb.133:                              # %for.cond591.preheader.us.us2104.preheader
                                        #   in Loop: Header=BB0_100 Depth=1
	slli	a2, s8, 2
	lw	a0, 164(sp)                     # 4-byte Folded Reload
	add	a2, a2, a0
	mv	t0, s0
.LBB0_134:                              # %for.cond591.preheader.us.us2104
                                        #   Parent Loop BB0_100 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_135 Depth 3
                                        #         Child Loop BB0_136 Depth 4
	li	a4, 0
	mv	a0, a2
	lw	s0, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
.LBB0_135:                              # %for.cond596.preheader.us2057.us.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_134 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_136 Depth 4
	mv	a5, a0
	mv	s1, s0
	mv	a3, s9
.LBB0_136:                              # %for.body648.us2068.us.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_134 Depth=2
                                        #       Parent Loop BB0_135 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, -1
	add	s1, s1, a6
	add	a5, a5, a7
	bnez	a3, .LBB0_136
# %bb.137:                              # %for.cond646.for.end657_crit_edge.us2078.us.us
                                        #   in Loop: Header=BB0_135 Depth=3
	addi	a4, a4, 1
	lw	a1, 184(sp)                     # 4-byte Folded Reload
	add	s0, s0, a1
	add	a0, a0, s4
	lw	a1, 176(sp)                     # 4-byte Folded Reload
	bne	a4, a1, .LBB0_135
# %bb.138:                              # %for.cond591.for.cond.cleanup593_crit_edge.split.split.us.us.us
                                        #   in Loop: Header=BB0_134 Depth=2
	add	s8, s8, t6
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, t0, a0
	slli	a0, a0, 2
	lw	a1, 144(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	t0, t0, 1
	add	a2, a2, a7
	bne	t0, s3, .LBB0_134
	j	.LBB0_141
.LBB0_139:                              # %for.cond591.preheader.us.preheader
                                        #   in Loop: Header=BB0_100 Depth=1
	lw	a0, 24(sp)                      # 4-byte Folded Reload
	add	s8, s8, a0
	lw	a0, 88(sp)                      # 4-byte Folded Reload
	lw	a3, 28(sp)                      # 4-byte Folded Reload
	lw	a1, 56(sp)                      # 4-byte Folded Reload
.LBB0_140:                              # %for.cond591.preheader.us
                                        #   Parent Loop BB0_100 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	zero, 0(a0)
	addi	a3, a3, -1
	add	a0, a0, a1
	bnez	a3, .LBB0_140
.LBB0_141:                              # %for.cond671.preheader
                                        #   in Loop: Header=BB0_100 Depth=1
	lw	a0, 148(sp)                     # 4-byte Folded Reload
	bge	s3, a0, .LBB0_99
# %bb.142:                              # %for.cond679.preheader.lr.ph
                                        #   in Loop: Header=BB0_100 Depth=1
	slli	a0, s8, 2
	lw	t2, 164(sp)                     # 4-byte Folded Reload
	add	t2, t2, a0
	lw	a1, 52(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sw	a0, 140(sp)                     # 4-byte Folded Spill
	lw	ra, 40(sp)                      # 4-byte Folded Reload
	lw	s7, 120(sp)                     # 4-byte Folded Reload
	j	.LBB0_144
.LBB0_143:                              # %for.cond.cleanup681
                                        #   in Loop: Header=BB0_144 Depth=2
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, s7, a0
	slli	a0, a0, 2
	lw	a1, 144(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	s7, s7, 1
	addi	ra, ra, -1
	add	t2, t2, a7
	lw	a0, 140(sp)                     # 4-byte Folded Reload
	add	a0, a0, a7
	sw	a0, 140(sp)                     # 4-byte Folded Spill
	lw	a0, 148(sp)                     # 4-byte Folded Reload
	beq	s7, a0, .LBB0_99
.LBB0_144:                              # %for.cond679.preheader
                                        #   Parent Loop BB0_100 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_154 Depth 3
                                        #         Child Loop BB0_155 Depth 4
                                        #       Child Loop BB0_148 Depth 3
                                        #         Child Loop BB0_149 Depth 4
                                        #         Child Loop BB0_151 Depth 4
	fmv.s	fa4, fa5
	lw	a0, 124(sp)                     # 4-byte Folded Reload
	blez	a0, .LBB0_143
# %bb.145:                              # %for.cond684.preheader.lr.ph
                                        #   in Loop: Header=BB0_144 Depth=2
	lw	a0, 128(sp)                     # 4-byte Folded Reload
	sub	s3, a0, s7
	li	a0, 8
	blt	s3, a0, .LBB0_152
# %bb.146:                              # %for.cond684.preheader.us.preheader
                                        #   in Loop: Header=BB0_144 Depth=2
	li	t1, 0
	addi	s6, s3, -7
	lw	s8, 140(sp)                     # 4-byte Folded Reload
	lw	t3, 108(sp)                     # 4-byte Folded Reload
	mv	t4, t2
	lw	a2, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
	j	.LBB0_148
.LBB0_147:                              # %for.end747.us
                                        #   in Loop: Header=BB0_148 Depth=3
	addi	t1, t1, 1
	lw	a0, 184(sp)                     # 4-byte Folded Reload
	add	a2, a2, a0
	add	t4, t4, s4
	add	t3, t3, a0
	add	s8, s8, s4
	lw	a0, 176(sp)                     # 4-byte Folded Reload
	beq	t1, a0, .LBB0_143
.LBB0_148:                              # %for.cond684.preheader.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_144 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_149 Depth 4
                                        #         Child Loop BB0_151 Depth 4
	li	s1, 0
	mv	t0, s8
	mv	a0, t3
	mv	a3, t4
	mv	a4, a2
.LBB0_149:                              # %for.body688.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_144 Depth=2
                                        #       Parent Loop BB0_148 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a3)
	flw	fa2, 0(a4)
	add	a1, a3, a7
	flw	fa1, 0(a1)
	add	a5, a4, a6
	flw	fa0, 0(a5)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a5, a5, a6
	flw	ft1, 0(a5)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a5, a5, a6
	flw	ft3, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	add	a1, a1, a7
	flw	fa3, 0(a1)
	add	a5, a5, a6
	flw	fa2, 0(a5)
	add	a1, a1, a7
	flw	fa1, 0(a1)
	add	a5, a5, a6
	flw	fa0, 0(a5)
	add	a1, a1, a7
	flw	ft0, 0(a1)
	add	a5, a5, a6
	flw	ft1, 0(a5)
	add	a1, a1, a7
	flw	ft2, 0(a1)
	add	a5, a5, a6
	flw	ft3, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	mv	a5, a0
	mv	s0, t0
	fmadd.s	fa4, ft2, ft3, fa4
	addi	s1, s1, 8
	add	a4, a4, s11
	add	a3, a3, s10
	add	a0, a0, s11
	add	t0, t0, s10
	blt	s1, s6, .LBB0_149
# %bb.150:                              # %for.cond684.for.cond735.preheader_crit_edge.us
                                        #   in Loop: Header=BB0_148 Depth=3
	bge	s1, s3, .LBB0_147
.LBB0_151:                              # %for.body738.us
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_144 Depth=2
                                        #       Parent Loop BB0_148 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s0)
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s1, s1, 1
	add	a5, a5, a6
	add	s0, s0, a7
	blt	s1, s3, .LBB0_151
	j	.LBB0_147
.LBB0_152:                              # %for.cond684.preheader.lr.ph.split
                                        #   in Loop: Header=BB0_144 Depth=2
	fmv.s	fa4, fa5
	blez	s3, .LBB0_143
# %bb.153:                              # %for.cond684.preheader.us2131.preheader
                                        #   in Loop: Header=BB0_144 Depth=2
	li	a0, 0
	mv	a3, t2
	lw	s1, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
.LBB0_154:                              # %for.cond684.preheader.us2131
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_144 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_155 Depth 4
	mv	a5, a3
	mv	a4, s1
	mv	s0, ra
.LBB0_155:                              # %for.body738.us2142
                                        #   Parent Loop BB0_100 Depth=1
                                        #     Parent Loop BB0_144 Depth=2
                                        #       Parent Loop BB0_154 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a5)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, -1
	add	a4, a4, a6
	add	a5, a5, a7
	bnez	s0, .LBB0_155
# %bb.156:                              # %for.cond735.for.end747_crit_edge.us2152
                                        #   in Loop: Header=BB0_154 Depth=3
	addi	a0, a0, 1
	lw	a1, 184(sp)                     # 4-byte Folded Reload
	add	s1, s1, a1
	add	a3, a3, s4
	lw	a1, 176(sp)                     # 4-byte Folded Reload
	bne	a0, a1, .LBB0_154
	j	.LBB0_143
.LBB0_157:                              # %for.cond765.preheader
	lw	t2, 72(sp)                      # 4-byte Folded Reload
	lw	a0, 76(sp)                      # 4-byte Folded Reload
	lw	s11, 164(sp)                    # 4-byte Folded Reload
	lw	t3, 120(sp)                     # 4-byte Folded Reload
	bge	t2, a0, .LBB0_188
# %bb.158:                              # %for.body768.lr.ph
	bge	s0, t3, .LBB0_188
# %bb.159:                              # %for.body768.lr.ph.split.us
	lw	a0, 180(sp)                     # 4-byte Folded Reload
	blez	a0, .LBB0_171
# %bb.160:                              # %for.body768.lr.ph.split.us.split.us
	li	a0, 8
	blt	s9, a0, .LBB0_175
# %bb.161:                              # %for.body768.us.us.us.preheader
	lui	a0, 524288
	addi	a1, a0, -8
	and	s7, s9, a1
	slli	s1, a4, 5
	lw	s6, 168(sp)                     # 4-byte Folded Reload
	slli	s6, s6, 2
	slli	a2, t6, 5
	addi	a0, a0, 7
	and	s4, s9, a0
	srli	a0, s9, 3
	mul	a1, a4, a0
	slli	a1, a1, 5
	lw	t0, 152(sp)                     # 4-byte Folded Reload
	add	t0, t0, a1
	mul	a0, t6, a0
	slli	a0, a0, 5
	add	t1, s11, a0
	fmv.w.x	fa5, zero
	j	.LBB0_163
.LBB0_162:                              # %for.cond773.for.cond.cleanup775_crit_edge.split.us.split.us.us.us.us
                                        #   in Loop: Header=BB0_163 Depth=1
	mv	t2, s10
	addi	t2, s10, 1
	add	s11, s11, s6
	add	t1, t1, s6
	lw	a0, 76(sp)                      # 4-byte Folded Reload
	lw	s0, 132(sp)                     # 4-byte Folded Reload
	beq	t2, a0, .LBB0_188
.LBB0_163:                              # %for.body768.us.us.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_165 Depth 2
                                        #       Child Loop BB0_167 Depth 3
                                        #         Child Loop BB0_168 Depth 4
                                        #         Child Loop BB0_170 Depth 4
	mv	s10, t2
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	mul	a0, t2, a0
	slli	a0, a0, 2
	lw	t2, 104(sp)                     # 4-byte Folded Reload
	add	t2, t2, a0
	mv	t3, t1
	mv	s2, s11
	mv	t4, s0
	j	.LBB0_165
.LBB0_164:                              # %for.cond781.for.cond.cleanup783_crit_edge.split.us.us.us.us.us.us
                                        #   in Loop: Header=BB0_165 Depth=2
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, t4, a0
	slli	a0, a0, 2
	add	a0, a0, t2
	fsw	fa4, 0(a0)
	addi	t4, t4, 1
	add	s2, s2, a7
	add	t3, t3, a7
	lw	a0, 120(sp)                     # 4-byte Folded Reload
	beq	t4, a0, .LBB0_162
.LBB0_165:                              # %for.cond781.preheader.us.us.us.us.us
                                        #   Parent Loop BB0_163 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_167 Depth 3
                                        #         Child Loop BB0_168 Depth 4
                                        #         Child Loop BB0_170 Depth 4
	li	s3, 0
	mv	s5, t3
	mv	s8, t0
	mv	t6, s2
	lw	a1, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
	j	.LBB0_167
.LBB0_166:                              # %for.end847.us.us.us.us.us.us
                                        #   in Loop: Header=BB0_167 Depth=3
	addi	s3, s3, 1
	lw	a0, 184(sp)                     # 4-byte Folded Reload
	add	a1, a1, a0
	add	t6, t6, s6
	add	s8, s8, a0
	add	s5, s5, s6
	lw	a0, 180(sp)                     # 4-byte Folded Reload
	beq	s3, a0, .LBB0_164
.LBB0_167:                              # %for.cond786.preheader.us.us.us.us.us.us
                                        #   Parent Loop BB0_163 Depth=1
                                        #     Parent Loop BB0_165 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_168 Depth 4
                                        #         Child Loop BB0_170 Depth 4
	li	a4, 0
	mv	s0, t6
	mv	a3, a1
.LBB0_168:                              # %for.body789.us.us.us.us.us.us
                                        #   Parent Loop BB0_163 Depth=1
                                        #     Parent Loop BB0_165 Depth=2
                                        #       Parent Loop BB0_167 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(s0)
	flw	fa2, 0(a3)
	add	a5, s0, a7
	flw	fa1, 0(a5)
	add	a0, a3, a6
	flw	fa0, 0(a0)
	add	a5, a5, a7
	flw	ft0, 0(a5)
	add	a0, a0, a6
	flw	ft1, 0(a0)
	add	a5, a5, a7
	flw	ft2, 0(a5)
	add	a0, a0, a6
	flw	ft3, 0(a0)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	add	a5, a5, a7
	flw	fa3, 0(a5)
	add	a0, a0, a6
	flw	fa2, 0(a0)
	add	a5, a5, a7
	flw	fa1, 0(a5)
	add	a0, a0, a6
	flw	fa0, 0(a0)
	add	a5, a5, a7
	flw	ft0, 0(a5)
	add	a0, a0, a6
	flw	ft1, 0(a0)
	add	a5, a5, a7
	flw	ft2, 0(a5)
	add	a0, a0, a6
	flw	ft3, 0(a0)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	addi	a4, a4, 8
	add	a3, a3, s1
	add	s0, s0, a2
	blt	a4, t5, .LBB0_168
# %bb.169:                              # %for.cond786.for.cond836.preheader_crit_edge.us.us.us.us.us.us
                                        #   in Loop: Header=BB0_167 Depth=3
	mv	a0, s5
	mv	a4, s8
	mv	a5, s4
	bge	s7, s9, .LBB0_166
.LBB0_170:                              # %for.body838.us.us.us.us.us.us
                                        #   Parent Loop BB0_163 Depth=1
                                        #     Parent Loop BB0_165 Depth=2
                                        #       Parent Loop BB0_167 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a0)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, -1
	add	a4, a4, a6
	add	a0, a0, a7
	bnez	a5, .LBB0_170
	j	.LBB0_166
.LBB0_171:                              # %for.body768.us.preheader
	lw	a0, 148(sp)                     # 4-byte Folded Reload
	lw	a1, 12(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sub	a0, a0, s0
	lw	a4, 100(sp)                     # 4-byte Folded Reload
	mul	a1, a4, t2
	slli	a1, a1, 2
	lw	a3, 156(sp)                     # 4-byte Folded Reload
	mul	a2, a3, s0
	slli	a2, a2, 2
	add	a1, a1, a2
	lw	a2, 104(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	slli	a2, a4, 2
	slli	a3, a3, 2
.LBB0_172:                              # %for.body768.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_173 Depth 2
	mv	a4, a1
	mv	a5, a0
.LBB0_173:                              # %for.cond781.preheader.us2241
                                        #   Parent Loop BB0_172 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	zero, 0(a4)
	addi	a5, a5, -1
	add	a4, a4, a3
	bnez	a5, .LBB0_173
# %bb.174:                              # %for.cond773.for.cond.cleanup775_crit_edge.split.us2249
                                        #   in Loop: Header=BB0_172 Depth=1
	addi	t2, t2, 1
	add	a1, a1, a2
	lw	a4, 76(sp)                      # 4-byte Folded Reload
	bne	t2, a4, .LBB0_172
	j	.LBB0_188
.LBB0_175:                              # %for.body768.lr.ph.split.us.split.us.split
	blez	s9, .LBB0_184
# %bb.176:                              # %for.body768.us.us.us2263.preheader
	lw	t1, 168(sp)                     # 4-byte Folded Reload
	slli	t1, t1, 2
	fmv.w.x	fa5, zero
.LBB0_177:                              # %for.body768.us.us.us2263
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_178 Depth 2
                                        #       Child Loop BB0_179 Depth 3
                                        #         Child Loop BB0_180 Depth 4
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	mul	a0, t2, a0
	slli	a0, a0, 2
	lw	a1, 104(sp)                     # 4-byte Folded Reload
	add	a1, a1, a0
	mv	a2, s11
	mv	t0, s0
.LBB0_178:                              # %for.cond781.preheader.us.us2227.us.us.us
                                        #   Parent Loop BB0_177 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_179 Depth 3
                                        #         Child Loop BB0_180 Depth 4
	li	s1, 0
	mv	s0, a2
	lw	a5, 152(sp)                     # 4-byte Folded Reload
	fmv.s	fa4, fa5
.LBB0_179:                              # %for.cond786.preheader.us2183.us.us.us.us.us
                                        #   Parent Loop BB0_177 Depth=1
                                        #     Parent Loop BB0_178 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_180 Depth 4
	mv	a4, s0
	mv	a3, a5
	mv	a0, s9
.LBB0_180:                              # %for.body838.us2194.us.us.us.us.us
                                        #   Parent Loop BB0_177 Depth=1
                                        #     Parent Loop BB0_178 Depth=2
                                        #       Parent Loop BB0_179 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	flw	fa3, 0(a4)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a0, a0, -1
	add	a3, a3, a6
	add	a4, a4, a7
	bnez	a0, .LBB0_180
# %bb.181:                              # %for.cond836.for.end847_crit_edge.us2204.us.us.us.us.us
                                        #   in Loop: Header=BB0_179 Depth=3
	addi	s1, s1, 1
	lw	a0, 184(sp)                     # 4-byte Folded Reload
	add	a5, a5, a0
	add	s0, s0, t1
	lw	a0, 180(sp)                     # 4-byte Folded Reload
	bne	s1, a0, .LBB0_179
# %bb.182:                              # %for.cond781.for.cond.cleanup783_crit_edge.split.split.us.us.us.us.us.us
                                        #   in Loop: Header=BB0_178 Depth=2
	lw	a0, 156(sp)                     # 4-byte Folded Reload
	mul	a0, t0, a0
	slli	a0, a0, 2
	add	a0, a0, a1
	fsw	fa4, 0(a0)
	addi	t0, t0, 1
	add	a2, a2, a7
	bne	t0, t3, .LBB0_178
# %bb.183:                              # %for.cond773.for.cond.cleanup775_crit_edge.split.us.split.split.us.us.us.us
                                        #   in Loop: Header=BB0_177 Depth=1
	addi	t2, t2, 1
	add	s11, s11, t1
	lw	a0, 76(sp)                      # 4-byte Folded Reload
	lw	s0, 132(sp)                     # 4-byte Folded Reload
	bne	t2, a0, .LBB0_177
	j	.LBB0_188
.LBB0_184:                              # %for.body768.us.us.preheader
	lw	a0, 148(sp)                     # 4-byte Folded Reload
	lw	a1, 12(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	sub	a0, a0, s0
	lw	a4, 100(sp)                     # 4-byte Folded Reload
	mul	a1, a4, t2
	slli	a1, a1, 2
	lw	a3, 156(sp)                     # 4-byte Folded Reload
	mul	a2, a3, s0
	slli	a2, a2, 2
	add	a1, a1, a2
	lw	a2, 104(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	slli	a2, a4, 2
	slli	a3, a3, 2
.LBB0_185:                              # %for.body768.us.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_186 Depth 2
	mv	a4, a1
	mv	a5, a0
.LBB0_186:                              # %for.cond781.preheader.us.us2251.us
                                        #   Parent Loop BB0_185 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	zero, 0(a4)
	addi	a5, a5, -1
	add	a4, a4, a3
	bnez	a5, .LBB0_186
# %bb.187:                              # %for.cond773.for.cond.cleanup775_crit_edge.split.us.split.split.us2259.us
                                        #   in Loop: Header=BB0_185 Depth=1
	addi	t2, t2, 1
	add	a1, a1, a2
	lw	a4, 76(sp)                      # 4-byte Folded Reload
	bne	t2, a4, .LBB0_185
.LBB0_188:                              # %for.cond.cleanup767
	li	a0, 0
	lw	ra, 236(sp)                     # 4-byte Folded Reload
	lw	s0, 232(sp)                     # 4-byte Folded Reload
	lw	s1, 228(sp)                     # 4-byte Folded Reload
	lw	s2, 224(sp)                     # 4-byte Folded Reload
	lw	s3, 220(sp)                     # 4-byte Folded Reload
	lw	s4, 216(sp)                     # 4-byte Folded Reload
	lw	s5, 212(sp)                     # 4-byte Folded Reload
	lw	s6, 208(sp)                     # 4-byte Folded Reload
	lw	s7, 204(sp)                     # 4-byte Folded Reload
	lw	s8, 200(sp)                     # 4-byte Folded Reload
	lw	s9, 196(sp)                     # 4-byte Folded Reload
	lw	s10, 192(sp)                    # 4-byte Folded Reload
	lw	s11, 188(sp)                    # 4-byte Folded Reload
	addi	sp, sp, 240
	ret
.Lfunc_end0:
	.size	dspi_conv_f32_arp4, .Lfunc_end0-dspi_conv_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"
	.section	".note.GNU-stack","",@progbits
