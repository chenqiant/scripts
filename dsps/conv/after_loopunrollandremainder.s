# 2024-10-10 18:59:16
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_conv_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_conv_f32_arp4              # -- Begin function dsps_conv_f32_arp4
	.p2align	1
	.type	dsps_conv_f32_arp4,@function
dsps_conv_f32_arp4:                     # @dsps_conv_f32_arp4
# %bb.0:                                # %entry
	lui	a5, 112
	addi	a5, a5, 3
	beqz	a0, .LBB0_40
# %bb.1:                                # %entry
	beqz	a2, .LBB0_40
# %bb.2:                                # %entry
	beqz	a4, .LBB0_40
# %bb.3:                                # %if.end6
	bge	a1, a3, .LBB0_5
# %bb.4:                                # %if.then8
	mv	t2, a1
	mv	a6, a3
	mv	a7, a0
	j	.LBB0_6
.LBB0_5:
	mv	t2, a3
	mv	a6, a1
	mv	a7, a2
	mv	a2, a0
.LBB0_6:                                # %if.end9
	addi	sp, sp, -48
	sw	s0, 44(sp)                      # 4-byte Folded Spill
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	sw	s2, 36(sp)                      # 4-byte Folded Spill
	sw	s3, 32(sp)                      # 4-byte Folded Spill
	sw	s4, 28(sp)                      # 4-byte Folded Spill
	fsw	fs0, 24(sp)                     # 4-byte Folded Spill
	fsw	fs1, 20(sp)                     # 4-byte Folded Spill
	fsw	fs2, 16(sp)                     # 4-byte Folded Spill
	fsw	fs3, 12(sp)                     # 4-byte Folded Spill
	fsw	fs4, 8(sp)                      # 4-byte Folded Spill
	blez	t2, .LBB0_17
# %bb.7:                                # %for.body.preheader
	li	s4, 0
	lui	t3, 524288
	addi	t3, t3, -4
	addi	t4, a7, -4
	addi	t0, a2, 8
	addi	t1, a2, 24
	li	s2, -1
	fmv.w.x	fa5, zero
	mv	s3, a7
	j	.LBB0_10
.LBB0_8:                                # %for.cond.for.end_crit_edge
                                        #   in Loop: Header=BB0_10 Depth=1
	fsw	fa4, 0(t5)
.LBB0_9:                                # %for.end
                                        #   in Loop: Header=BB0_10 Depth=1
	addi	s4, s4, 1
	addi	t4, t4, 4
	addi	s2, s2, -1
	addi	s3, s3, 4
	beq	s4, t2, .LBB0_17
.LBB0_10:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_12 Depth 2
                                        #     Child Loop BB0_16 Depth 2
	slli	a0, s4, 2
	and	a5, s4, t3
	add	t5, a4, a0
	beqz	a5, .LBB0_14
# %bb.11:                               # %for.body13.3.preheader
                                        #   in Loop: Header=BB0_10 Depth=1
	andi	a0, a0, -16
	addi	a0, a0, -4
	andi	a0, a0, -16
	add	s1, t1, a0
	addi	a5, a5, -1
	andi	a5, a5, -4
	addi	t6, a5, 4
	mv	a5, t0
	mv	s0, t4
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
.LBB0_12:                               # %for.body13.3
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa0, -8(a5)
	flw	ft0, 4(s0)
	flw	ft1, -4(a5)
	flw	ft2, 0(s0)
	flw	ft3, 0(a5)
	flw	ft4, -4(s0)
	flw	ft5, 4(a5)
	flw	ft6, -8(s0)
	fmadd.s	fa4, fa0, ft0, fa4
	fmadd.s	fa3, ft1, ft2, fa3
	fmadd.s	fa2, ft3, ft4, fa2
	fmadd.s	fa1, ft5, ft6, fa1
	addi	a5, a5, 16
	addi	s0, s0, -16
	bne	a5, s1, .LBB0_12
# %bb.13:                               # %for.end8
                                        #   in Loop: Header=BB0_10 Depth=1
	fadd.s	fa4, fa4, fa3
	fadd.s	fa4, fa4, fa2
	fadd.s	fa4, fa4, fa1
	fsw	fa4, 0(t5)
	bltu	s4, t6, .LBB0_9
	j	.LBB0_15
.LBB0_14:                               #   in Loop: Header=BB0_10 Depth=1
	li	t6, 0
	fmv.s	fa4, fa5
.LBB0_15:                               # %for.body13.clone.preheader
                                        #   in Loop: Header=BB0_10 Depth=1
	add	a5, t6, s2
	slli	t6, t6, 2
	sub	s1, s3, t6
	add	s0, a2, t6
.LBB0_16:                               # %for.body13.clone
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s0)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, 1
	addi	s1, s1, -4
	addi	s0, s0, 4
	bnez	a5, .LBB0_16
	j	.LBB0_8
.LBB0_17:                               # %for.cond21.preheader
	bge	t2, a6, .LBB0_28
# %bb.18:                               # %for.body24.preheader
	andi	t0, t2, -16
	slli	t3, t2, 2
	add	t3, t3, a7
	addi	t1, t3, -32
	addi	t4, a2, 32
	fmv.w.x	fa5, zero
	mv	t5, t2
	j	.LBB0_20
.LBB0_19:                               # %for.end37
                                        #   in Loop: Header=BB0_20 Depth=1
	addi	t5, t5, 1
	addi	t4, t4, 4
	addi	t3, t3, 4
	beq	t5, a6, .LBB0_28
.LBB0_20:                               # %for.body24
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_22 Depth 2
                                        #     Child Loop BB0_26 Depth 2
	sub	a5, t5, t2
	addi	a5, a5, 1
	add	t6, t0, a5
	bgeu	a5, t6, .LBB0_24
# %bb.21:                               # %for.body30.preheader
                                        #   in Loop: Header=BB0_20 Depth=1
	mv	a0, t4
	mv	s0, t1
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
	fmv.s	ft3, fa5
	fmv.s	ft4, fa5
	fmv.s	ft5, fa5
	fmv.s	ft6, fa5
	fmv.s	ft7, fa5
	fmv.s	fa6, fa5
	fmv.s	fa7, fa5
	fmv.s	ft8, fa5
.LBB0_22:                               # %for.body30.15
                                        #   Parent Loop BB0_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft9, -28(a0)
	flw	ft10, 28(s0)
	flw	ft11, -24(a0)
	flw	fs0, 24(s0)
	flw	fs1, -20(a0)
	flw	fs2, 20(s0)
	flw	fs3, -16(a0)
	flw	fs4, 16(s0)
	fmadd.s	fa4, ft9, ft10, fa4
	fmadd.s	fa3, ft11, fs0, fa3
	fmadd.s	fa2, fs1, fs2, fa2
	fmadd.s	fa1, fs3, fs4, fa1
	flw	ft9, -12(a0)
	flw	ft10, 12(s0)
	flw	ft11, -8(a0)
	flw	fs0, 8(s0)
	flw	fs1, -4(a0)
	flw	fs2, 4(s0)
	flw	fs3, 0(a0)
	flw	fs4, 0(s0)
	fmadd.s	fa0, ft9, ft10, fa0
	fmadd.s	ft0, ft11, fs0, ft0
	fmadd.s	ft1, fs1, fs2, ft1
	fmadd.s	ft2, fs3, fs4, ft2
	flw	ft9, 4(a0)
	flw	ft10, -4(s0)
	flw	ft11, 8(a0)
	flw	fs0, -8(s0)
	flw	fs1, 12(a0)
	flw	fs2, -12(s0)
	flw	fs3, 16(a0)
	flw	fs4, -16(s0)
	fmadd.s	ft3, ft9, ft10, ft3
	fmadd.s	ft4, ft11, fs0, ft4
	fmadd.s	ft5, fs1, fs2, ft5
	fmadd.s	ft6, fs3, fs4, ft6
	flw	ft9, 20(a0)
	flw	ft10, -20(s0)
	flw	ft11, 24(a0)
	flw	fs0, -24(s0)
	flw	fs1, 28(a0)
	flw	fs2, -28(s0)
	flw	fs3, 32(a0)
	flw	fs4, -32(s0)
	fmadd.s	ft7, ft9, ft10, ft7
	fmadd.s	fa6, ft11, fs0, fa6
	fmadd.s	fa7, fs1, fs2, fa7
	fmadd.s	ft8, fs3, fs4, ft8
	addi	a5, a5, 16
	addi	s0, s0, -64
	addi	a0, a0, 64
	bltu	a5, t6, .LBB0_22
# %bb.23:                               # %for.end37.loopexit
                                        #   in Loop: Header=BB0_20 Depth=1
	fadd.s	fa4, fa4, fa3
	fadd.s	fa4, fa4, fa2
	fadd.s	fa4, fa4, fa1
	fadd.s	fa4, fa4, fa0
	fadd.s	fa4, fa4, ft0
	fadd.s	fa4, fa4, ft1
	fadd.s	fa4, fa4, ft2
	fadd.s	fa4, fa4, ft3
	fadd.s	fa4, fa4, ft4
	fadd.s	fa4, fa4, ft5
	fadd.s	fa4, fa4, ft6
	fadd.s	fa4, fa4, ft7
	fadd.s	fa4, fa4, fa6
	fadd.s	fa4, fa4, fa7
	fadd.s	fa4, fa4, ft8
	slli	a0, t5, 2
	add	a0, a0, a4
	fsw	fa4, 0(a0)
	bltu	t5, a5, .LBB0_19
	j	.LBB0_25
.LBB0_24:                               #   in Loop: Header=BB0_20 Depth=1
	fmv.s	fa4, fa5
	slli	a0, t5, 2
	add	a0, a0, a4
	fsw	fa5, 0(a0)
	bltu	t5, a5, .LBB0_19
.LBB0_25:                               # %for.body30.clone.preheader
                                        #   in Loop: Header=BB0_20 Depth=1
	slli	s0, a5, 2
	sub	s1, t3, s0
	add	s0, s0, a2
.LBB0_26:                               # %for.body30.clone
                                        #   Parent Loop BB0_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s0)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, 1
	addi	s1, s1, -4
	addi	s0, s0, 4
	bgeu	t5, a5, .LBB0_26
# %bb.27:                               # %for.cond.for.end_crit_edge42
                                        #   in Loop: Header=BB0_20 Depth=1
	fsw	fa4, 0(a0)
	j	.LBB0_19
.LBB0_28:                               # %for.cond42.preheader
	add	a1, a1, a3
	addi	t1, a1, -1
	bge	a6, t1, .LBB0_39
# %bb.29:                               # %for.body47.lr.ph
	addi	a1, a6, -1
	slli	a0, t2, 2
	add	t0, a0, a7
	addi	t0, t0, -16
	slli	a3, a6, 2
	sub	a0, a3, a0
	add	a0, a0, a2
	addi	t3, a0, 16
	add	a7, a7, a3
	fmv.w.x	fa5, zero
	mv	t4, a6
	j	.LBB0_31
.LBB0_30:                               # %for.end64
                                        #   in Loop: Header=BB0_31 Depth=1
	addi	t4, t4, 1
	addi	t3, t3, 4
	addi	a7, a7, 4
	beq	t4, t1, .LBB0_39
.LBB0_31:                               # %for.body47
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_33 Depth 2
                                        #     Child Loop BB0_37 Depth 2
	sub	a3, t4, t2
	addi	a0, a3, 1
	not	a3, a3
	add	a3, a3, a6
	andi	a3, a3, -8
	add	s0, a3, a0
	bgeu	a0, s0, .LBB0_35
# %bb.32:                               # %for.body57.preheader
                                        #   in Loop: Header=BB0_31 Depth=1
	mv	a5, t3
	mv	a3, t0
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
.LBB0_33:                               # %for.body57.7
                                        #   Parent Loop BB0_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -12(a5)
	flw	ft4, 12(a3)
	flw	ft5, -8(a5)
	flw	ft6, 8(a3)
	flw	ft7, -4(a5)
	flw	fa6, 4(a3)
	flw	fa7, 0(a5)
	flw	ft8, 0(a3)
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	flw	ft3, 4(a5)
	flw	ft4, -4(a3)
	flw	ft5, 8(a5)
	flw	ft6, -8(a3)
	flw	ft7, 12(a5)
	flw	fa6, -12(a3)
	flw	fa7, 16(a5)
	flw	ft8, -16(a3)
	fmadd.s	fa0, ft3, ft4, fa0
	fmadd.s	ft0, ft5, ft6, ft0
	fmadd.s	ft1, ft7, fa6, ft1
	fmadd.s	ft2, fa7, ft8, ft2
	addi	a0, a0, 8
	addi	a3, a3, -32
	addi	a5, a5, 32
	bltu	a0, s0, .LBB0_33
# %bb.34:                               # %for.end64.loopexit
                                        #   in Loop: Header=BB0_31 Depth=1
	fadd.s	fa4, fa4, fa3
	fadd.s	fa4, fa4, fa2
	fadd.s	fa4, fa4, fa1
	fadd.s	fa4, fa4, fa0
	fadd.s	fa4, fa4, ft0
	fadd.s	fa4, fa4, ft1
	fadd.s	fa4, fa4, ft2
	slli	a3, t4, 2
	add	a3, a3, a4
	fsw	fa4, 0(a3)
	bltu	a1, a0, .LBB0_30
	j	.LBB0_36
.LBB0_35:                               #   in Loop: Header=BB0_31 Depth=1
	fmv.s	fa4, fa5
	slli	a3, t4, 2
	add	a3, a3, a4
	fsw	fa5, 0(a3)
	bltu	a1, a0, .LBB0_30
.LBB0_36:                               # %for.body57.clone.preheader
                                        #   in Loop: Header=BB0_31 Depth=1
	slli	s1, a0, 2
	sub	a5, a7, s1
	add	s1, s1, a2
.LBB0_37:                               # %for.body57.clone
                                        #   Parent Loop BB0_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s1)
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a0, a0, 1
	addi	a5, a5, -4
	addi	s1, s1, 4
	bgeu	a1, a0, .LBB0_37
# %bb.38:                               # %for.cond.for.end_crit_edge61
                                        #   in Loop: Header=BB0_31 Depth=1
	fsw	fa4, 0(a3)
	j	.LBB0_30
.LBB0_39:
	li	a5, 0
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	flw	fs0, 24(sp)                     # 4-byte Folded Reload
	flw	fs1, 20(sp)                     # 4-byte Folded Reload
	flw	fs2, 16(sp)                     # 4-byte Folded Reload
	flw	fs3, 12(sp)                     # 4-byte Folded Reload
	flw	fs4, 8(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
.LBB0_40:                               # %return
	mv	a0, a5
	ret
.Lfunc_end0:
	.size	dsps_conv_f32_arp4, .Lfunc_end0-dsps_conv_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-172-g9dacbc0)"
	.section	".note.GNU-stack","",@progbits
