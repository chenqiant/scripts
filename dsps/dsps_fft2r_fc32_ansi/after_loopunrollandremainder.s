# 2025-01-09 14:19:12
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
	beqz	a0, .LBB0_12
# %bb.1:                                # %if.end
	lui	a0, %hi(dsps_fft2r_initialized)
	lbu	a0, %lo(dsps_fft2r_initialized)(a0)
	beqz	a0, .LBB0_14
# %bb.2:                                # %if.end2
	li	a7, 2
	blt	s4, a7, .LBB0_13
# %bb.3:                                # %for.cond3.preheader.preheader
	addi	s2, s2, 4
	li	a1, 1
	li	a6, 4
	j	.LBB0_5
.LBB0_4:                                # %for.cond.cleanup5
                                        #   in Loop: Header=BB0_5 Depth=1
	slli	a1, a1, 1
	bltu	a3, a6, .LBB0_13
.LBB0_5:                                # %for.cond3.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
                                        #       Child Loop BB0_10 Depth 3
	mv	a3, s4
	srli	s4, s4, 1
	blez	a1, .LBB0_4
# %bb.6:                                # %for.body6.lr.ph
                                        #   in Loop: Header=BB0_5 Depth=1
	li	a4, 0
	li	a5, 0
	j	.LBB0_8
.LBB0_7:                                # %for.cond.cleanup11
                                        #   in Loop: Header=BB0_8 Depth=2
	addi	a4, a4, 1
	add	a5, a5, s4
	beq	a4, a1, .LBB0_4
.LBB0_8:                                # %for.body6
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_10 Depth 3
	bltu	a3, a7, .LBB0_7
# %bb.9:                                # %for.body12.lr.ph
                                        #   in Loop: Header=BB0_8 Depth=2
	slli	a0, a4, 3
	add	a0, a0, s3
	flw	fa5, 4(a0)
	flw	fa4, 0(a0)
	fneg.s	fa3, fa5
	add	a0, s4, a5
	slli	a2, a0, 3
	add	a2, a2, s2
	slli	a5, a5, 3
	add	s0, s2, a5
	mv	s1, s4
.LBB0_10:                               # %for.body12
                                        #   Parent Loop BB0_5 Depth=1
                                        #     Parent Loop BB0_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	flw	fa2, 0(a2)
	flw	fa1, -4(a2)
	flw	fa0, -4(s0)
	fmul.s	ft0, fa5, fa2
	fmadd.s	ft0, fa4, fa1, ft0
	fsub.s	ft1, fa0, ft0
	fsw	ft1, -4(a2)
	flw	ft1, 0(s0)
	fmul.s	fa1, fa1, fa3
	fmadd.s	fa2, fa4, fa2, fa1
	fsub.s	fa1, ft1, fa2
	fsw	fa1, 0(a2)
	fadd.s	fa1, fa0, ft0
	fsw	fa1, -4(s0)
	fadd.s	fa2, fa2, ft1
	fsw	fa2, 0(s0)
	addi	s1, s1, -1
	addi	a2, a2, 8
	addi	s0, s0, 8
	bnez	s1, .LBB0_10
# %bb.11:                               #   in Loop: Header=BB0_8 Depth=2
	mv	a5, a0
	j	.LBB0_7
.LBB0_12:
	addi	a0, a1, 1
	j	.LBB0_15
.LBB0_13:
	li	a0, 0
	j	.LBB0_15
.LBB0_14:
	addi	a0, a1, 4
.LBB0_15:                               # %return
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
