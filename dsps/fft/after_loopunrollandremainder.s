# 2025-01-08 17:04:59
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fft2r_fc32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fft2r_fc32_arp4_           # -- Begin function dsps_fft2r_fc32_arp4_
	.p2align	1
	.type	dsps_fft2r_fc32_arp4_,@function
dsps_fft2r_fc32_arp4_:                  # @dsps_fft2r_fc32_arp4_
# %bb.0:                                # %entry
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	sw	s1, 20(sp)                      # 4-byte Folded Spill
	sw	s2, 16(sp)                      # 4-byte Folded Spill
	sw	s3, 12(sp)                      # 4-byte Folded Spill
	sw	s4, 8(sp)                       # 4-byte Folded Spill
	mv	s3, a2
	mv	s4, a1
	mv	s2, a0
	mv	a0, a1
	call	dsp_is_power_of_two
	lui	a1, 112
	beqz	a0, .LBB0_18
# %bb.1:                                # %if.end
	lui	a0, %hi(dsps_fft2r_initialized)
	lbu	a0, %lo(dsps_fft2r_initialized)(a0)
	beqz	a0, .LBB0_20
# %bb.2:                                # %if.end2
	li	a7, 2
	blt	s4, a7, .LBB0_19
# %bb.3:                                # %for.cond3.preheader.preheader
	addi	s2, s2, 16
	li	t1, 1
	li	a2, -1
	li	t3, -2
	li	t2, -3
	li	a6, 4
	j	.LBB0_5
.LBB0_4:                                # %for.cond.cleanup5
                                        #   in Loop: Header=BB0_5 Depth=1
	slli	t1, t1, 1
	bltu	t0, a6, .LBB0_19
.LBB0_5:                                # %for.cond3.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
                                        #       Child Loop BB0_11 Depth 3
	mv	t0, s4
	srli	s4, s4, 1
	blez	t1, .LBB0_4
# %bb.6:                                # %for.body6.lr.ph
                                        #   in Loop: Header=BB0_5 Depth=1
	li	s0, 0
	li	a5, 0
	neg	a3, s4
	j	.LBB0_9
.LBB0_7:                                # %for.body12.for.cond.cleanup11.loopexitsplit_crit_edge
                                        #   in Loop: Header=BB0_9 Depth=2
	add	a5, a5, s1
	addi	a5, a5, 1
.LBB0_8:                                # %for.cond.cleanup11
                                        #   in Loop: Header=BB0_9 Depth=2
	addi	s0, s0, 1
	add	a5, a5, s4
	beq	s0, t1, .LBB0_4
.LBB0_9:                                # %for.body6
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
	bltu	t0, a7, .LBB0_8
# %bb.10:                               # %for.body12.lr.ph
                                        #   in Loop: Header=BB0_9 Depth=2
	slli	a0, s0, 3
	add	a0, a0, s3
	flw	fa5, 4(a0)
	li	s1, 0
	flw	fa4, 0(a0)
	fneg.s	fa3, fa5
	slli	a1, a5, 3
	add	a1, a1, s2
	add	a0, s4, a5
	slli	a0, a0, 3
	add	a4, s2, a0
.LBB0_11:                               # %for.body12
                                        #   Parent Loop BB0_5 Depth=1
                                        #     Parent Loop BB0_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	add	a0, a3, s1
	flw	fa2, -12(a4)
	flw	fa1, -16(a4)
	flw	fa0, -16(a1)
	flw	ft0, -12(a1)
	fmul.s	ft1, fa5, fa2
	fmul.s	ft2, fa1, fa3
	fmadd.s	fa1, fa4, fa1, ft1
	fmadd.s	fa2, fa4, fa2, ft2
	fadd.s	ft1, fa0, fa1
	fadd.s	ft2, fa2, ft0
	fsub.s	fa1, fa0, fa1
	fsub.s	fa2, ft0, fa2
	fsw	fa1, -16(a4)
	fsw	fa2, -12(a4)
	fsw	ft1, -16(a1)
	fsw	ft2, -12(a1)
	beq	a0, a2, .LBB0_7
# %bb.12:                               # %for.body12.1
                                        #   in Loop: Header=BB0_11 Depth=3
	flw	fa2, -4(a4)
	flw	fa1, -8(a4)
	flw	fa0, -8(a1)
	flw	ft0, -4(a1)
	fmul.s	ft1, fa5, fa2
	fmul.s	ft2, fa1, fa3
	fmadd.s	fa1, fa4, fa1, ft1
	fmadd.s	fa2, fa4, fa2, ft2
	fadd.s	ft1, fa0, fa1
	fadd.s	ft2, fa2, ft0
	fsub.s	fa1, fa0, fa1
	fsub.s	fa2, ft0, fa2
	fsw	fa1, -8(a4)
	fsw	fa2, -4(a4)
	fsw	ft1, -8(a1)
	fsw	ft2, -4(a1)
	beq	a0, t3, .LBB0_16
# %bb.13:                               # %for.body12.2
                                        #   in Loop: Header=BB0_11 Depth=3
	flw	fa2, 4(a4)
	flw	fa1, 0(a4)
	flw	fa0, 0(a1)
	flw	ft0, 4(a1)
	fmul.s	ft1, fa5, fa2
	fmul.s	ft2, fa1, fa3
	fmadd.s	fa1, fa4, fa1, ft1
	fmadd.s	fa2, fa4, fa2, ft2
	fadd.s	ft1, fa0, fa1
	fadd.s	ft2, fa2, ft0
	fsub.s	fa1, fa0, fa1
	fsub.s	fa2, ft0, fa2
	fsw	fa1, 0(a4)
	fsw	fa2, 4(a4)
	fsw	ft1, 0(a1)
	fsw	ft2, 4(a1)
	beq	a0, t2, .LBB0_17
# %bb.14:                               # %for.body12.3
                                        #   in Loop: Header=BB0_11 Depth=3
	addi	s1, s1, 4
	flw	fa2, 12(a4)
	flw	fa1, 8(a4)
	flw	fa0, 8(a1)
	flw	ft0, 12(a1)
	fmul.s	ft1, fa5, fa2
	fmul.s	ft2, fa1, fa3
	fmadd.s	fa1, fa4, fa1, ft1
	fmadd.s	fa2, fa4, fa2, ft2
	fadd.s	ft1, fa0, fa1
	fadd.s	ft2, fa2, ft0
	fsub.s	fa1, fa0, fa1
	fsub.s	fa2, ft0, fa2
	fsw	fa1, 8(a4)
	fsw	fa2, 12(a4)
	fsw	ft1, 8(a1)
	fsw	ft2, 12(a1)
	add	a0, a3, s1
	addi	a1, a1, 32
	addi	a4, a4, 32
	bnez	a0, .LBB0_11
# %bb.15:                               # %for.body12.3.for.cond.cleanup11.loopexit_crit_edge
                                        #   in Loop: Header=BB0_9 Depth=2
	add	a5, a5, s1
	j	.LBB0_8
.LBB0_16:                               # %for.body12.1.for.cond.cleanup11.loopexitsplitsplit_crit_edge
                                        #   in Loop: Header=BB0_9 Depth=2
	add	a5, a5, s1
	addi	a5, a5, 2
	j	.LBB0_8
.LBB0_17:                               # %for.cond.cleanup11.loopexitsplitsplitsplit
                                        #   in Loop: Header=BB0_9 Depth=2
	add	a5, a5, s1
	addi	a5, a5, 3
	j	.LBB0_8
.LBB0_18:
	addi	a0, a1, 1
	j	.LBB0_21
.LBB0_19:
	li	a0, 0
	j	.LBB0_21
.LBB0_20:
	addi	a0, a1, 4
.LBB0_21:                               # %return
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	lw	s1, 20(sp)                      # 4-byte Folded Reload
	lw	s2, 16(sp)                      # 4-byte Folded Reload
	lw	s3, 12(sp)                      # 4-byte Folded Reload
	lw	s4, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	dsps_fft2r_fc32_arp4_, .Lfunc_end0-dsps_fft2r_fc32_arp4_
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"
	.section	".note.GNU-stack","",@progbits
