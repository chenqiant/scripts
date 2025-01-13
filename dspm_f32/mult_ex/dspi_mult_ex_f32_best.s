.option	arch, -zcb, +zcmp
# 2024-12-23 10:37:38
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspm_mult_ex_f32_best.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dspm_mult_ex_f32_arp4           # -- Begin function dspm_mult_ex_f32_arp4
	.p2align	1
	.type	dspm_mult_ex_f32_arp4,@function
dspm_mult_ex_f32_arp4:                  # @dspm_mult_ex_f32_arp4
# %bb.0:                                # %entry
	lui	t0, 112
	addi	t0, t0, 3
	beqz	a0, .LBB0_19
# %bb.1:                                # %entry
	beqz	a1, .LBB0_19
# %bb.2:                                # %entry
	beqz	a2, .LBB0_19
# %bb.3:                                # %entry
	blez	a3, .LBB0_19
# %bb.4:                                # %entry
	blez	a4, .LBB0_19
# %bb.5:                                # %entry
	blez	a5, .LBB0_19
# %bb.6:                                # %entry
	addi	sp, sp, -48
	sw	s0, 44(sp)                      # 4-byte Folded Spill
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	sw	s2, 36(sp)                      # 4-byte Folded Spill
	sw	s3, 32(sp)                      # 4-byte Folded Spill
	sw	s4, 28(sp)                      # 4-byte Folded Spill
	sw	s5, 24(sp)                      # 4-byte Folded Spill
	sw	s6, 20(sp)                      # 4-byte Folded Spill
	sw	s7, 16(sp)                      # 4-byte Folded Spill
	sw	s8, 12(sp)                      # 4-byte Folded Spill
	sw	s9, 8(sp)                       # 4-byte Folded Spill
	sw	s10, 4(sp)                      # 4-byte Folded Spill
	sw	s11, 0(sp)                      # 4-byte Folded Spill
	lw	s1, 48(sp)
	or	s0, a7, a6
	or	s0, s0, s1
	bltz	s0, .LBB0_18
# %bb.7:                                # %if.end24
	li	t0, 0
	add	a6, a6, a4
	add	t4, a7, a5
	add	a7, s1, a5
	addi	t1, a4, -7
	slli	t2, t4, 2
	add	t3, a1, t2
	slli	t4, t4, 5
	addi	t5, a0, 16
	slli	t6, a6, 2
	li	s2, 9
	mv	s3, a0
	j	.LBB0_9
.LBB0_8:                                # %for.cond.cleanup30
                                        #   in Loop: Header=BB0_9 Depth=1
	addi	t0, t0, 1
	add	t5, t5, t6
	add	s3, s3, t6
	beq	t0, a3, .LBB0_17
.LBB0_9:                                # %for.body31.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_11 Depth 2
                                        #       Child Loop BB0_13 Depth 3
                                        #       Child Loop BB0_16 Depth 3
	li	s8, 0
	mul	s0, t0, a6
	slli	s0, s0, 2
	add	s4, a0, s0
	mul	s0, t0, a7
	slli	s0, s0, 2
	add	s5, a2, s0
	mv	s6, a1
	mv	s7, t3
	j	.LBB0_11
.LBB0_10:                               # %for.end149
                                        #   in Loop: Header=BB0_11 Depth=2
	addi	s8, s8, 1
	addi	s7, s7, 4
	addi	s6, s6, 4
	beq	s8, a5, .LBB0_8
.LBB0_11:                               # %for.body31
                                        #   Parent Loop BB0_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_13 Depth 3
                                        #       Child Loop BB0_16 Depth 3
	flw	fa5, 0(s4)
	slli	s9, s8, 2
	add	s0, a1, s9
	flw	fa4, 0(s0)
	fmul.s	fa5, fa5, fa4
	add	s9, s9, s5
	fsw	fa5, 0(s9)
	li	s10, 1
	bltu	a4, s2, .LBB0_14
# %bb.12:                               # %for.body39.preheader
                                        #   in Loop: Header=BB0_11 Depth=2
	li	s10, 1
	mv	s1, t5
	mv	s11, s7
.LBB0_13:                               # %for.body39
                                        #   Parent Loop BB0_9 Depth=1
                                        #     Parent Loop BB0_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	flw	fa4, -12(s1)
	flw	fa3, 0(s11)
	fmadd.s	fa5, fa4, fa3, fa5
	fsw	fa5, 0(s9)
	flw	fa4, -8(s1)
	add	s0, s11, t2
	flw	fa3, 0(s0)
	fmadd.s	fa5, fa4, fa3, fa5
	fsw	fa5, 0(s9)
	flw	fa4, -4(s1)
	add	s0, s0, t2
	flw	fa3, 0(s0)
	fmadd.s	fa5, fa4, fa3, fa5
	fsw	fa5, 0(s9)
	flw	fa4, 0(s1)
	add	s0, s0, t2
	flw	fa3, 0(s0)
	fmadd.s	fa5, fa4, fa3, fa5
	fsw	fa5, 0(s9)
	flw	fa4, 4(s1)
	add	s0, s0, t2
	flw	fa3, 0(s0)
	fmadd.s	fa5, fa4, fa3, fa5
	fsw	fa5, 0(s9)
	flw	fa4, 8(s1)
	add	s0, s0, t2
	flw	fa3, 0(s0)
	fmadd.s	fa5, fa4, fa3, fa5
	fsw	fa5, 0(s9)
	flw	fa4, 12(s1)
	add	s0, s0, t2
	flw	fa3, 0(s0)
	fmadd.s	fa5, fa4, fa3, fa5
	fsw	fa5, 0(s9)
	flw	fa4, 16(s1)
	add	s0, s0, t2
	flw	fa3, 0(s0)
	fmadd.s	fa5, fa4, fa3, fa5
	fsw	fa5, 0(s9)
	addi	s10, s10, 8
	add	s11, s11, t4
	addi	s1, s1, 32
	blt	s10, t1, .LBB0_13
.LBB0_14:                               # %for.cond135.preheader
                                        #   in Loop: Header=BB0_11 Depth=2
	bge	s10, a4, .LBB0_10
# %bb.15:                               # %for.body137.preheader
                                        #   in Loop: Header=BB0_11 Depth=2
	sub	s11, a4, s10
	mul	s1, t2, s10
	add	s1, s1, s6
	slli	s0, s10, 2
	add	s0, s0, s3
.LBB0_16:                               # %for.body137
                                        #   Parent Loop BB0_9 Depth=1
                                        #     Parent Loop BB0_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	flw	fa4, 0(s0)
	flw	fa3, 0(s1)
	fmadd.s	fa5, fa4, fa3, fa5
	fsw	fa5, 0(s9)
	addi	s11, s11, -1
	add	s1, s1, t2
	addi	s0, s0, 4
	bnez	s11, .LBB0_16
	j	.LBB0_10
.LBB0_17:
	li	t0, 0
.LBB0_18:
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	lw	s5, 24(sp)                      # 4-byte Folded Reload
	lw	s6, 20(sp)                      # 4-byte Folded Reload
	lw	s7, 16(sp)                      # 4-byte Folded Reload
	lw	s8, 12(sp)                      # 4-byte Folded Reload
	lw	s9, 8(sp)                       # 4-byte Folded Reload
	lw	s10, 4(sp)                      # 4-byte Folded Reload
	lw	s11, 0(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
.LBB0_19:                               # %return
	mv	a0, t0
	ret
.Lfunc_end0:
	.size	dspm_mult_ex_f32_arp4, .Lfunc_end0-dspm_mult_ex_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc)"
	.section	".note.GNU-stack","",@progbits
