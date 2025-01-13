# 2025-01-09 11:32:12
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_bit_rev_fc32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_bit_rev_fc32_arp4          # -- Begin function dsps_bit_rev_fc32_arp4
	.p2align	1
	.type	dsps_bit_rev_fc32_arp4,@function
dsps_bit_rev_fc32_arp4:                 # @dsps_bit_rev_fc32_arp4
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	sw	s1, 4(sp)                       # 4-byte Folded Spill
	mv	s0, a1
	mv	s1, a0
	mv	a0, a1
	call	dsp_is_power_of_two
	beqz	a0, .LBB0_43
# %bb.1:                                # %for.cond.preheader
	li	a0, 3
	blt	s0, a0, .LBB0_44
# %bb.2:                                # %while.cond.preheader.preheader
	li	a2, 0
	addi	a0, s0, -2
	li	a1, 1
	j	.LBB0_4
.LBB0_3:                                # %for.inc.7
                                        #   in Loop: Header=BB0_4 Depth=1
	addi	a1, a1, 8
	beq	a3, a0, .LBB0_44
.LBB0_4:                                # %while.cond.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_10 Depth 2
                                        #     Child Loop BB0_15 Depth 2
                                        #     Child Loop BB0_20 Depth 2
                                        #     Child Loop BB0_25 Depth 2
                                        #     Child Loop BB0_30 Depth 2
                                        #     Child Loop BB0_35 Depth 2
                                        #     Child Loop BB0_40 Depth 2
	mv	a3, s0
.LBB0_5:                                # %while.cond
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a4, a2
	srli	a3, a3, 1
	sub	a2, a2, a3
	bge	a4, a3, .LBB0_5
# %bb.6:                                # %while.end
                                        #   in Loop: Header=BB0_4 Depth=1
	add	a3, a3, a4
	bge	a1, a3, .LBB0_8
# %bb.7:                                # %if.then5
                                        #   in Loop: Header=BB0_4 Depth=1
	slli	a2, a3, 3
	add	a2, a2, s1
	slli	a4, a1, 3
	add	a4, a4, s1
	flw	fa5, 0(a4)
	flw	fa4, 0(a2)
	flw	fa3, 4(a4)
	flw	fa2, 4(a2)
	fsw	fa5, 0(a2)
	fsw	fa4, 0(a4)
	fsw	fa3, 4(a2)
	fsw	fa2, 4(a4)
.LBB0_8:                                # %for.inc
                                        #   in Loop: Header=BB0_4 Depth=1
	beq	a1, a0, .LBB0_44
# %bb.9:                                # %while.cond.preheader.1
                                        #   in Loop: Header=BB0_4 Depth=1
	addi	a2, a1, 1
	mv	a4, s0
.LBB0_10:                               # %while.cond.1
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a5, a3
	srli	a4, a4, 1
	sub	a3, a3, a4
	bge	a5, a4, .LBB0_10
# %bb.11:                               # %while.end.1
                                        #   in Loop: Header=BB0_4 Depth=1
	add	a3, a5, a4
	bge	a2, a3, .LBB0_13
# %bb.12:                               # %if.then5.1
                                        #   in Loop: Header=BB0_4 Depth=1
	slli	a4, a3, 3
	add	a4, a4, s1
	slli	a5, a2, 3
	add	a5, a5, s1
	flw	fa5, 0(a5)
	flw	fa4, 0(a4)
	flw	fa3, 4(a5)
	flw	fa2, 4(a4)
	fsw	fa5, 0(a4)
	fsw	fa4, 0(a5)
	fsw	fa3, 4(a4)
	fsw	fa2, 4(a5)
.LBB0_13:                               # %for.inc.1
                                        #   in Loop: Header=BB0_4 Depth=1
	beq	a2, a0, .LBB0_44
# %bb.14:                               # %while.cond.preheader.2
                                        #   in Loop: Header=BB0_4 Depth=1
	addi	a2, a1, 2
	mv	a4, s0
.LBB0_15:                               # %while.cond.2
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a5, a3
	srli	a4, a4, 1
	sub	a3, a3, a4
	bge	a5, a4, .LBB0_15
# %bb.16:                               # %while.end.2
                                        #   in Loop: Header=BB0_4 Depth=1
	add	a3, a5, a4
	bge	a2, a3, .LBB0_18
# %bb.17:                               # %if.then5.2
                                        #   in Loop: Header=BB0_4 Depth=1
	slli	a4, a3, 3
	add	a4, a4, s1
	slli	a5, a2, 3
	add	a5, a5, s1
	flw	fa5, 0(a5)
	flw	fa4, 0(a4)
	flw	fa3, 4(a5)
	flw	fa2, 4(a4)
	fsw	fa5, 0(a4)
	fsw	fa4, 0(a5)
	fsw	fa3, 4(a4)
	fsw	fa2, 4(a5)
.LBB0_18:                               # %for.inc.2
                                        #   in Loop: Header=BB0_4 Depth=1
	beq	a2, a0, .LBB0_44
# %bb.19:                               # %while.cond.preheader.3
                                        #   in Loop: Header=BB0_4 Depth=1
	addi	a2, a1, 3
	mv	a4, s0
.LBB0_20:                               # %while.cond.3
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a5, a3
	srli	a4, a4, 1
	sub	a3, a3, a4
	bge	a5, a4, .LBB0_20
# %bb.21:                               # %while.end.3
                                        #   in Loop: Header=BB0_4 Depth=1
	add	a3, a5, a4
	bge	a2, a3, .LBB0_23
# %bb.22:                               # %if.then5.3
                                        #   in Loop: Header=BB0_4 Depth=1
	slli	a4, a3, 3
	add	a4, a4, s1
	slli	a5, a2, 3
	add	a5, a5, s1
	flw	fa5, 0(a5)
	flw	fa4, 0(a4)
	flw	fa3, 4(a5)
	flw	fa2, 4(a4)
	fsw	fa5, 0(a4)
	fsw	fa4, 0(a5)
	fsw	fa3, 4(a4)
	fsw	fa2, 4(a5)
.LBB0_23:                               # %for.inc.3
                                        #   in Loop: Header=BB0_4 Depth=1
	beq	a2, a0, .LBB0_44
# %bb.24:                               # %while.cond.preheader.4
                                        #   in Loop: Header=BB0_4 Depth=1
	addi	a2, a1, 4
	mv	a4, s0
.LBB0_25:                               # %while.cond.4
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a5, a3
	srli	a4, a4, 1
	sub	a3, a3, a4
	bge	a5, a4, .LBB0_25
# %bb.26:                               # %while.end.4
                                        #   in Loop: Header=BB0_4 Depth=1
	add	a3, a5, a4
	bge	a2, a3, .LBB0_28
# %bb.27:                               # %if.then5.4
                                        #   in Loop: Header=BB0_4 Depth=1
	slli	a4, a3, 3
	add	a4, a4, s1
	slli	a5, a2, 3
	add	a5, a5, s1
	flw	fa5, 0(a5)
	flw	fa4, 0(a4)
	flw	fa3, 4(a5)
	flw	fa2, 4(a4)
	fsw	fa5, 0(a4)
	fsw	fa4, 0(a5)
	fsw	fa3, 4(a4)
	fsw	fa2, 4(a5)
.LBB0_28:                               # %for.inc.4
                                        #   in Loop: Header=BB0_4 Depth=1
	beq	a2, a0, .LBB0_44
# %bb.29:                               # %while.cond.preheader.5
                                        #   in Loop: Header=BB0_4 Depth=1
	addi	a2, a1, 5
	mv	a4, s0
.LBB0_30:                               # %while.cond.5
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a5, a3
	srli	a4, a4, 1
	sub	a3, a3, a4
	bge	a5, a4, .LBB0_30
# %bb.31:                               # %while.end.5
                                        #   in Loop: Header=BB0_4 Depth=1
	add	a3, a5, a4
	bge	a2, a3, .LBB0_33
# %bb.32:                               # %if.then5.5
                                        #   in Loop: Header=BB0_4 Depth=1
	slli	a4, a3, 3
	add	a4, a4, s1
	slli	a5, a2, 3
	add	a5, a5, s1
	flw	fa5, 0(a5)
	flw	fa4, 0(a4)
	flw	fa3, 4(a5)
	flw	fa2, 4(a4)
	fsw	fa5, 0(a4)
	fsw	fa4, 0(a5)
	fsw	fa3, 4(a4)
	fsw	fa2, 4(a5)
.LBB0_33:                               # %for.inc.5
                                        #   in Loop: Header=BB0_4 Depth=1
	beq	a2, a0, .LBB0_44
# %bb.34:                               # %while.cond.preheader.6
                                        #   in Loop: Header=BB0_4 Depth=1
	addi	a2, a1, 6
	mv	a4, s0
.LBB0_35:                               # %while.cond.6
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a5, a3
	srli	a4, a4, 1
	sub	a3, a3, a4
	bge	a5, a4, .LBB0_35
# %bb.36:                               # %while.end.6
                                        #   in Loop: Header=BB0_4 Depth=1
	add	a4, a4, a5
	bge	a2, a4, .LBB0_38
# %bb.37:                               # %if.then5.6
                                        #   in Loop: Header=BB0_4 Depth=1
	slli	a3, a4, 3
	add	a3, a3, s1
	slli	a5, a2, 3
	add	a5, a5, s1
	flw	fa5, 0(a5)
	flw	fa4, 0(a3)
	flw	fa3, 4(a5)
	flw	fa2, 4(a3)
	fsw	fa5, 0(a3)
	fsw	fa4, 0(a5)
	fsw	fa3, 4(a3)
	fsw	fa2, 4(a5)
.LBB0_38:                               # %for.inc.6
                                        #   in Loop: Header=BB0_4 Depth=1
	beq	a2, a0, .LBB0_44
# %bb.39:                               # %while.cond.preheader.7
                                        #   in Loop: Header=BB0_4 Depth=1
	addi	a3, a1, 7
	mv	a2, s0
.LBB0_40:                               # %while.cond.7
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a5, a4
	srli	a2, a2, 1
	sub	a4, a4, a2
	bge	a5, a2, .LBB0_40
# %bb.41:                               # %while.end.7
                                        #   in Loop: Header=BB0_4 Depth=1
	add	a2, a2, a5
	bge	a3, a2, .LBB0_3
# %bb.42:                               # %if.then5.7
                                        #   in Loop: Header=BB0_4 Depth=1
	slli	a4, a2, 3
	add	a4, a4, s1
	slli	a5, a3, 3
	add	a5, a5, s1
	flw	fa5, 0(a5)
	flw	fa4, 0(a4)
	flw	fa3, 4(a5)
	flw	fa2, 4(a4)
	fsw	fa5, 0(a4)
	fsw	fa4, 0(a5)
	fsw	fa3, 4(a4)
	fsw	fa2, 4(a5)
	j	.LBB0_3
.LBB0_43:
	lui	a0, 112
	addi	a0, a0, 1
	j	.LBB0_45
.LBB0_44:
	li	a0, 0
.LBB0_45:                               # %return
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	lw	s1, 4(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	dsps_bit_rev_fc32_arp4, .Lfunc_end0-dsps_bit_rev_fc32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"
	.section	".note.GNU-stack","",@progbits
