.option	arch, -zcb, +zcmp
# 2024-12-12 10:12:50
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspi_dotprod_s16_arp4_best.c"
	.option	push
	#.option	arch, -zcb, -zcmt
	.globl	dspi_dotprod_s16_arp4           # -- Begin function dspi_dotprod_s16_arp4
	.p2align	1
	.type	dspi_dotprod_s16_arp4,@function
dspi_dotprod_s16_arp4:                  # @dspi_dotprod_s16_arp4
# %bb.0:                                # %entry
	cm.push	{ra, s0-s11}, -112
	addi	sp, sp, -128
	lw	t3, 4(a0)
	lw	t4, 12(a0)
	mul	s1, t3, a3
	lui	a6, 112
	addi	a6, a6, 3
	blt	t4, s1, .LBB0_20
# %bb.1:                                # %if.end
	lw	t1, 8(a0)
	lw	s0, 16(a0)
	mul	s1, t1, a4
	blt	s0, s1, .LBB0_20
# %bb.2:                                # %if.end4
	lw	t0, 4(a1)
	lw	t2, 12(a1)
	mv	s1, a3
	mul	s1, t0, a3
	lui	a6, 112
	addi	a6, a6, 3
	blt	t2, s1, .LBB0_20
# %bb.3:                                # %if.end10
	lw	a7, 8(a1)
	lw	s1, 16(a1)
	mul	s0, a7, a4
	blt	s1, s0, .LBB0_20
# %bb.4:                                # %if.end16
	sw	a5, 12(sp)                      # 4-byte Folded Spill
	sw	a2, 16(sp)                      # 4-byte Folded Spill
	li	s1, 0
	li	s2, 0
	blez	a4, .LBB0_16
# %bb.5:                                # %for.cond25.preheader.lr.ph
	li	s4, 0
	lw	a1, 0(a1)
	lw	a2, 0(a0)
	mv	s5, a3
	addi	a0, a3, -15
	sw	a0, 104(sp)                     # 4-byte Folded Spill
	andi	a0, a3, -16
	sw	a0, 20(sp)                      # 4-byte Folded Spill
	mul	a0, a7, t2
	mv	a3, a2
	slli	a0, a0, 1
	sw	a0, 48(sp)                      # 4-byte Folded Spill
	slli	a2, t0, 5
	mul	a0, t1, t4
	slli	a0, a0, 1
	sw	a0, 44(sp)                      # 4-byte Folded Spill
	slli	a0, t3, 5
	sw	a0, 96(sp)                      # 4-byte Folded Spill
	slli	t3, t3, 1
	slli	t6, t0, 1
	mv	t0, a1
	sw	a2, 100(sp)                     # 4-byte Folded Spill
	sw	a4, 52(sp)                      # 4-byte Folded Spill
	sw	s5, 56(sp)                      # 4-byte Folded Spill
	j	.LBB0_8
.LBB0_6:                                #   in Loop: Header=BB0_8 Depth=1
	lw	s7, 60(sp)                      # 4-byte Folded Reload
	mv	t2, s1
	lw	a4, 84(sp)                      # 4-byte Folded Reload
	lw	s6, 88(sp)                      # 4-byte Folded Reload
.LBB0_7:                                # %for.end248
                                        #   in Loop: Header=BB0_8 Depth=1
	lw	a0, 140(sp)                     # 4-byte Folded Reload
	lw	a1, 68(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	lw	a1, 72(sp)                      # 4-byte Folded Reload
	add	a0, a0, a1
	lw	a1, 80(sp)                      # 4-byte Folded Reload
	lw	s11, 76(sp)                     # 4-byte Folded Reload
	add	s11, s11, a1
	sltu	a1, s11, a1
	add	a0, a0, a1
	add	s5, s11, s3
	sltu	a1, s5, s11
	add	a0, a0, a1
	lw	a1, 144(sp)                     # 4-byte Folded Reload
	add	a0, a0, a1
	add	s3, s5, s7
	sltu	a1, s3, s5
	add	a1, a1, s10
	add	a0, a0, a1
	add	t5, s3, t1
	sltu	a1, t5, s3
	add	a1, a1, a7
	add	a0, a0, a1
	lw	a7, 132(sp)                     # 4-byte Folded Reload
	add	a7, a7, t5
	sltu	a1, a7, t5
	add	a1, a1, t4
	add	a0, a0, a1
	add	a6, a6, a7
	sltu	a1, a6, a7
	lw	a2, 152(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	add	a0, a0, a1
	lw	t4, 64(sp)                      # 4-byte Folded Reload
	add	t4, t4, a6
	sltu	a1, t4, a6
	add	a1, a1, s8
	add	a0, a0, a1
	lw	s8, 120(sp)                     # 4-byte Folded Reload
	add	s8, s8, t4
	sltu	a1, s8, t4
	lw	a2, 156(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	add	a0, a0, a1
	add	t1, s8, s9
	sltu	a1, t1, s8
	lw	a2, 160(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	add	a0, a0, a1
	lw	s9, 136(sp)                     # 4-byte Folded Reload
	add	s9, s9, t1
	sltu	a1, s9, t1
	lw	a2, 164(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	add	a0, a0, a1
	add	s6, s6, s9
	sltu	a1, s6, s9
	add	a1, a1, ra
	add	a0, a0, a1
	lw	ra, 92(sp)                      # 4-byte Folded Reload
	add	ra, ra, s6
	sltu	a1, ra, s6
	lw	a2, 168(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	add	a0, a0, a1
	add	s10, ra, a4
	sltu	a1, s10, ra
	lw	a2, 172(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	add	a0, a0, a1
	lw	a1, 124(sp)                     # 4-byte Folded Reload
	add	a1, a1, s10
	sltu	a2, a1, s10
	lw	a5, 148(sp)                     # 4-byte Folded Reload
	add	a2, a2, a5
	add	a0, a0, a2
	lw	a2, 128(sp)                     # 4-byte Folded Reload
	add	a2, a2, a1
	sltu	a1, a2, a1
	add	a1, a1, s2
	add	a0, a0, a1
	add	s1, a2, t2
	sltu	a1, s1, a2
	add	s2, a0, a1
	addi	s4, s4, 1
	lw	a0, 48(sp)                      # 4-byte Folded Reload
	add	t0, t0, a0
	lw	a0, 44(sp)                      # 4-byte Folded Reload
	add	a3, a3, a0
	lw	a4, 52(sp)                      # 4-byte Folded Reload
	lw	s5, 56(sp)                      # 4-byte Folded Reload
	beq	s4, a4, .LBB0_16
.LBB0_8:                                # %for.cond25.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #     Child Loop BB0_15 Depth 2
	li	a0, 16
	blt	s5, a0, .LBB0_12
# %bb.9:                                # %for.body27.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	sw	s1, 24(sp)                      # 4-byte Folded Spill
	sw	s4, 36(sp)                      # 4-byte Folded Spill
	sw	s2, 40(sp)                      # 4-byte Folded Spill
	li	s10, 0
	li	s0, 0
	li	a1, 0
	sw	zero, 172(sp)                   # 4-byte Folded Spill
	li	ra, 0
	sw	zero, 168(sp)                   # 4-byte Folded Spill
	li	s9, 0
	sw	zero, 128(sp)                   # 4-byte Folded Spill
	li	s8, 0
	sw	zero, 164(sp)                   # 4-byte Folded Spill
	sw	zero, 136(sp)                   # 4-byte Folded Spill
	sw	zero, 160(sp)                   # 4-byte Folded Spill
	sw	zero, 108(sp)                   # 4-byte Folded Spill
	sw	zero, 156(sp)                   # 4-byte Folded Spill
	li	s6, 0
	sw	zero, 124(sp)                   # 4-byte Folded Spill
	li	t4, 0
	sw	zero, 152(sp)                   # 4-byte Folded Spill
	li	s11, 0
	sw	zero, 116(sp)                   # 4-byte Folded Spill
	li	t5, 0
	sw	zero, 132(sp)                   # 4-byte Folded Spill
	sw	zero, 120(sp)                   # 4-byte Folded Spill
	li	t1, 0
	sw	zero, 112(sp)                   # 4-byte Folded Spill
	li	s7, 0
	li	a4, 0
	li	s3, 0
	li	s1, 0
	li	a7, 0
	li	s4, 0
	li	s5, 0
	sw	zero, 140(sp)                   # 4-byte Folded Spill
	sw	a3, 28(sp)                      # 4-byte Folded Spill
	mv	s2, a3
	sw	t0, 32(sp)                      # 4-byte Folded Spill
	mv	a6, t0
.LBB0_10:                               # %for.body27
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sw	a4, 144(sp)                     # 4-byte Folded Spill
	lh	a0, 0(s2)
	lh	a5, 0(a6)
	mul	a0, a5, a0
	srai	a5, a0, 31
	add	a5, a5, s0
	mv	s0, s10
	add	t0, s2, t3
	lh	t2, 0(t0)
	add	a3, a6, t6
	mv	a4, s1
	mv	s1, s4
	lh	s4, 0(a3)
	add	s10, s10, a0
	sltu	a0, s10, s0
	add	a0, a0, a5
	sw	a0, 148(sp)                     # 4-byte Folded Spill
	mul	a0, s4, t2
	srai	a5, a0, 31
	lw	a2, 172(sp)                     # 4-byte Folded Reload
	add	a5, a5, a2
	mv	s0, a1
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a1, 0(t0)
	lh	a2, 0(a3)
	add	t2, s0, a0
	sltu	a0, t2, s0
	add	a0, a0, a5
	sw	a0, 172(sp)                     # 4-byte Folded Spill
	mul	a0, a2, a1
	srai	a1, a0, 31
	lw	a2, 168(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	mv	a2, ra
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	ra, ra, a0
	sltu	a0, ra, a2
	add	a0, a0, a1
	sw	a0, 168(sp)                     # 4-byte Folded Spill
	mul	a0, s0, a5
	srai	a1, a0, 31
	lw	a2, 128(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	mv	a2, s9
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	s9, s9, a0
	sltu	a0, s9, a2
	add	a0, a0, a1
	sw	a0, 128(sp)                     # 4-byte Folded Spill
	mul	a0, s0, a5
	srai	a1, a0, 31
	lw	a2, 164(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	mv	a2, s8
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	s8, s8, a0
	sltu	a0, s8, a2
	add	a0, a0, a1
	sw	a0, 164(sp)                     # 4-byte Folded Spill
	mul	a0, s0, a5
	srai	a1, a0, 31
	lw	a2, 160(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	lw	a2, 136(sp)                     # 4-byte Folded Reload
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	a0, a0, a2
	sw	a0, 136(sp)                     # 4-byte Folded Spill
	sltu	a0, a0, a2
	add	a0, a0, a1
	sw	a0, 160(sp)                     # 4-byte Folded Spill
	mul	a0, s0, a5
	srai	a1, a0, 31
	lw	a2, 156(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	lw	a2, 108(sp)                     # 4-byte Folded Reload
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	a0, a0, a2
	sw	a0, 108(sp)                     # 4-byte Folded Spill
	sltu	a0, a0, a2
	add	a0, a0, a1
	sw	a0, 156(sp)                     # 4-byte Folded Spill
	mul	a0, s0, a5
	srai	a1, a0, 31
	lw	a2, 124(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	mv	a2, s6
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	s6, s6, a0
	sltu	a0, s6, a2
	add	a0, a0, a1
	sw	a0, 124(sp)                     # 4-byte Folded Spill
	mul	a0, s0, a5
	srai	a1, a0, 31
	lw	a2, 152(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	mv	a2, t4
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	t4, t4, a0
	sltu	a0, t4, a2
	add	a0, a0, a1
	sw	a0, 152(sp)                     # 4-byte Folded Spill
	mul	a0, s0, a5
	srai	a1, a0, 31
	lw	a2, 116(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	mv	a2, s11
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	s11, s11, a0
	sltu	a0, s11, a2
	add	a0, a0, a1
	sw	a0, 116(sp)                     # 4-byte Folded Spill
	mul	a0, s0, a5
	srai	a1, a0, 31
	lw	a2, 140(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	mv	a2, s5
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	s5, s5, a0
	sltu	a0, s5, a2
	add	a0, a0, a1
	sw	a0, 140(sp)                     # 4-byte Folded Spill
	mul	a0, s0, a5
	srai	a1, a0, 31
	add	a1, a1, s1
	mv	a2, a7
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	a7, a7, a0
	sltu	a0, a7, a2
	add	s4, a1, a0
	mul	a0, s0, a5
	srai	a1, a0, 31
	add	a1, a1, a4
	mv	a2, s3
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	s3, s3, a0
	sltu	a0, s3, a2
	add	s1, a1, a0
	mul	a0, s0, a5
	srai	a1, a0, 31
	lw	a2, 144(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	mv	a2, s7
	add	t0, t0, t3
	add	a3, a3, t6
	lh	a5, 0(t0)
	lh	s0, 0(a3)
	add	s7, s7, a0
	sltu	a0, s7, a2
	add	a4, a1, a0
	mul	a0, s0, a5
	srai	a1, a0, 31
	lw	a2, 112(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	mv	a2, t1
	add	t0, t0, t3
	lh	a5, 0(t0)
	add	a3, a3, t6
	lh	a3, 0(a3)
	add	t1, t1, a0
	sltu	a0, t1, a2
	add	a0, a0, a1
	sw	a0, 112(sp)                     # 4-byte Folded Spill
	mul	a0, a3, a5
	srai	a1, a0, 31
	lw	a2, 120(sp)                     # 4-byte Folded Reload
	add	a1, a1, a2
	lw	a2, 132(sp)                     # 4-byte Folded Reload
	add	a0, a0, a2
	sw	a0, 132(sp)                     # 4-byte Folded Spill
	sltu	a0, a0, a2
	add	a0, a0, a1
	sw	a0, 120(sp)                     # 4-byte Folded Spill
	mv	a1, t2
	lw	s0, 148(sp)                     # 4-byte Folded Reload
	addi	t5, t5, 16
	lw	a0, 100(sp)                     # 4-byte Folded Reload
	add	a6, a6, a0
	lw	a0, 96(sp)                      # 4-byte Folded Reload
	add	s2, s2, a0
	lw	a0, 104(sp)                     # 4-byte Folded Reload
	blt	t5, a0, .LBB0_10
# %bb.11:                               #   in Loop: Header=BB0_8 Depth=1
	sw	s4, 68(sp)                      # 4-byte Folded Spill
	sw	s1, 72(sp)                      # 4-byte Folded Spill
	sw	s5, 76(sp)                      # 4-byte Folded Spill
	sw	a4, 144(sp)                     # 4-byte Folded Spill
	sw	a7, 80(sp)                      # 4-byte Folded Spill
	sw	s8, 88(sp)                      # 4-byte Folded Spill
	sw	s9, 92(sp)                      # 4-byte Folded Spill
	sw	ra, 84(sp)                      # 4-byte Folded Spill
	lw	a0, 20(sp)                      # 4-byte Folded Reload
	lw	s5, 56(sp)                      # 4-byte Folded Reload
	lw	s2, 40(sp)                      # 4-byte Folded Reload
	lw	s4, 36(sp)                      # 4-byte Folded Reload
	lw	t0, 32(sp)                      # 4-byte Folded Reload
	lw	a3, 28(sp)                      # 4-byte Folded Reload
	lw	s1, 24(sp)                      # 4-byte Folded Reload
	lw	a5, 172(sp)                     # 4-byte Folded Reload
	lw	a2, 168(sp)                     # 4-byte Folded Reload
	lw	ra, 128(sp)                     # 4-byte Folded Reload
	lw	a4, 164(sp)                     # 4-byte Folded Reload
	lw	s9, 108(sp)                     # 4-byte Folded Reload
	lw	t2, 160(sp)                     # 4-byte Folded Reload
	lw	t5, 156(sp)                     # 4-byte Folded Reload
	sw	t4, 64(sp)                      # 4-byte Folded Spill
	lw	s8, 124(sp)                     # 4-byte Folded Reload
	mv	a6, s11
	lw	s11, 152(sp)                    # 4-byte Folded Reload
	lw	a7, 120(sp)                     # 4-byte Folded Reload
	lw	t4, 116(sp)                     # 4-byte Folded Reload
	sw	s7, 60(sp)                      # 4-byte Folded Spill
	lw	s7, 112(sp)                     # 4-byte Folded Reload
	j	.LBB0_13
.LBB0_12:                               #   in Loop: Header=BB0_8 Depth=1
	sw	zero, 76(sp)                    # 4-byte Folded Spill
	sw	zero, 140(sp)                   # 4-byte Folded Spill
	sw	zero, 80(sp)                    # 4-byte Folded Spill
	sw	zero, 68(sp)                    # 4-byte Folded Spill
	li	s3, 0
	sw	zero, 72(sp)                    # 4-byte Folded Spill
	sw	zero, 60(sp)                    # 4-byte Folded Spill
	sw	zero, 144(sp)                   # 4-byte Folded Spill
	li	t1, 0
	li	s7, 0
	sw	zero, 132(sp)                   # 4-byte Folded Spill
	li	a7, 0
	li	a0, 0
	li	a6, 0
	li	t4, 0
	sw	zero, 64(sp)                    # 4-byte Folded Spill
	li	s11, 0
	li	s6, 0
	li	s8, 0
	li	s9, 0
	li	t5, 0
	sw	zero, 136(sp)                   # 4-byte Folded Spill
	li	t2, 0
	sw	zero, 88(sp)                    # 4-byte Folded Spill
	li	a4, 0
	sw	zero, 92(sp)                    # 4-byte Folded Spill
	li	ra, 0
	sw	zero, 84(sp)                    # 4-byte Folded Spill
	li	a2, 0
	li	a1, 0
	li	a5, 0
	li	s10, 0
	li	s0, 0
.LBB0_13:                               # %for.cond232.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	sw	a5, 172(sp)                     # 4-byte Folded Spill
	sw	s0, 148(sp)                     # 4-byte Folded Spill
	sw	s10, 128(sp)                    # 4-byte Folded Spill
	sw	a1, 124(sp)                     # 4-byte Folded Spill
	sw	a2, 168(sp)                     # 4-byte Folded Spill
	sw	a4, 164(sp)                     # 4-byte Folded Spill
	sw	t2, 160(sp)                     # 4-byte Folded Spill
	sw	t5, 156(sp)                     # 4-byte Folded Spill
	sw	s6, 120(sp)                     # 4-byte Folded Spill
	sw	s11, 152(sp)                    # 4-byte Folded Spill
	mv	s10, s7
	bge	a0, s5, .LBB0_6
# %bb.14:                               # %for.body235.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	lw	s7, 60(sp)                      # 4-byte Folded Reload
	sub	a5, s5, a0
	mul	s0, t6, a0
	add	s0, s0, t0
	mul	a0, t3, a0
	add	a0, a0, a3
	lw	a4, 84(sp)                      # 4-byte Folded Reload
	lw	s6, 88(sp)                      # 4-byte Folded Reload
.LBB0_15:                               # %for.body235
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	a1, 0(a0)
	lh	a2, 0(s0)
	mul	t2, a2, a1
	srai	a1, t2, 31
	add	t2, t2, s1
	sltu	a2, t2, s1
	add	a1, a1, s2
	add	s2, a1, a2
	addi	a5, a5, -1
	add	s0, s0, t6
	add	a0, a0, t3
	mv	s1, t2
	bnez	a5, .LBB0_15
	j	.LBB0_7
.LBB0_16:                               # %for.cond.cleanup
	lw	a3, 12(sp)                      # 4-byte Folded Reload
	addi	a0, a3, -1
	li	a1, 1
	sll	a0, a1, a0
	srai	a1, a0, 31
	add	a0, a0, s1
	sltu	a2, a0, s1
	add	a1, a1, a2
	addi	a2, a3, -32
	add	a1, a1, s2
	bltz	a2, .LBB0_18
# %bb.17:                               # %for.cond.cleanup
	sra	a0, a1, a3
	j	.LBB0_19
.LBB0_18:
	slli	a1, a1, 1
	not	a2, a3
	sll	a1, a1, a2
	srl	a0, a0, a3
	or	a0, a0, a1
.LBB0_19:                               # %for.cond.cleanup
	lw	a1, 16(sp)                      # 4-byte Folded Reload
	li	a6, 0
	sh	a0, 0(a1)
.LBB0_20:                               # %return
	mv	a0, a6
	addi	sp, sp, 128
	cm.popret	{ra, s0-s11}, 112
.Lfunc_end0:
	.size	dspi_dotprod_s16_arp4, .Lfunc_end0-dspi_dotprod_s16_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
