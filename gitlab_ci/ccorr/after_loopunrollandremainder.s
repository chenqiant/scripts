	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"after_customlicm.ll"
	.globl	dsps_ccorr_f32_ansi             # -- Begin function dsps_ccorr_f32_ansi
	.p2align	1
	.type	dsps_ccorr_f32_ansi,@function
dsps_ccorr_f32_ansi:                    # @dsps_ccorr_f32_ansi
	.cfi_startproc
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
	mv	t3, a1
	mv	a6, a3
	mv	a7, a0
	j	.LBB0_6
.LBB0_5:
	mv	t3, a3
	mv	a6, a1
	mv	a7, a2
	mv	a2, a0
.LBB0_6:                                # %if.end9
	cm.push	{ra, s0-s4}, -64
	.cfi_def_cfa_offset 64
	fsw	fs0, 28(sp)                     # 4-byte Folded Spill
	fsw	fs1, 24(sp)                     # 4-byte Folded Spill
	fsw	fs2, 20(sp)                     # 4-byte Folded Spill
	fsw	fs3, 16(sp)                     # 4-byte Folded Spill
	fsw	fs4, 12(sp)                     # 4-byte Folded Spill
	.cfi_offset s0, -20
	.cfi_offset s1, -16
	.cfi_offset s2, -12
	.cfi_offset s3, -8
	.cfi_offset s4, -4
	.cfi_offset fs0, -36
	.cfi_offset fs1, -40
	.cfi_offset fs2, -44
	.cfi_offset fs3, -48
	.cfi_offset fs4, -52
	slli	t0, t3, 2
	blez	t3, .LBB0_17
# %bb.7:                                # %for.body.preheader
	li	a0, 0
	lui	t1, 524288
	addi	t1, t1, -8
	add	t5, t0, a7
	addi	t5, t5, 12
	addi	t2, a2, 16
	addi	t4, a2, 48
	addi	t6, t3, -1
	li	s4, -1
	fmv.w.x	fa5, zero
	j	.LBB0_10
.LBB0_8:                                # %for.cond.for.end_crit_edge
                                        #   in Loop: Header=BB0_10 Depth=1
	fsw	fa4, 0(s2)
.LBB0_9:                                # %for.end
                                        #   in Loop: Header=BB0_10 Depth=1
	addi	a0, a0, 1
	addi	t5, t5, -4
	addi	s4, s4, -1
	addi	t6, t6, -1
	beq	a0, t3, .LBB0_17
.LBB0_10:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_12 Depth 2
                                        #     Child Loop BB0_16 Depth 2
	slli	s0, a0, 2
	and	a5, a0, t1
	add	s2, a4, s0
	beqz	a5, .LBB0_14
# %bb.11:                               # %for.body14.7.preheader
                                        #   in Loop: Header=BB0_10 Depth=1
	andi	s0, s0, -32
	addi	s0, s0, -4
	andi	s0, s0, -32
	add	s0, s0, t4
	addi	a5, a5, -1
	andi	a5, a5, -8
	addi	s3, a5, 8
	mv	s1, t2
	mv	a5, t5
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
.LBB0_12:                               # %for.body14.7
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -16(s1)
	flw	ft4, -16(a5)
	flw	ft5, -12(s1)
	flw	ft6, -12(a5)
	flw	ft7, -8(s1)
	flw	fa6, -8(a5)
	flw	fa7, -4(s1)
	flw	ft8, -4(a5)
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	flw	ft3, 0(s1)
	flw	ft4, 0(a5)
	flw	ft5, 4(s1)
	flw	ft6, 4(a5)
	flw	ft7, 8(s1)
	flw	fa6, 8(a5)
	flw	fa7, 12(s1)
	flw	ft8, 12(a5)
	fmadd.s	fa0, ft3, ft4, fa0
	fmadd.s	ft0, ft5, ft6, ft0
	fmadd.s	ft1, ft7, fa6, ft1
	fmadd.s	ft2, fa7, ft8, ft2
	addi	s1, s1, 32
	addi	a5, a5, 32
	bne	s1, s0, .LBB0_12
# %bb.13:                               # %for.end22
                                        #   in Loop: Header=BB0_10 Depth=1
	fadd.s	fa4, fa4, fa3
	fadd.s	fa4, fa4, fa2
	fadd.s	fa4, fa4, fa1
	fadd.s	fa4, fa4, fa0
	fadd.s	fa4, fa4, ft0
	fadd.s	fa4, fa4, ft1
	fadd.s	fa4, fa4, ft2
	fsw	fa4, 0(s2)
	bltu	a0, s3, .LBB0_9
	j	.LBB0_15
.LBB0_14:                               #   in Loop: Header=BB0_10 Depth=1
	li	s3, 0
	fmv.s	fa4, fa5
.LBB0_15:                               # %for.body14.clone.preheader
                                        #   in Loop: Header=BB0_10 Depth=1
	add	a5, s3, s4
	add	s0, s3, t6
	slli	s0, s0, 2
	add	s0, s0, a7
	slli	s1, s3, 2
	add	s1, s1, a2
.LBB0_16:                               # %for.body14.clone
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s1)
	flw	fa2, 0(s0)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, 1
	addi	s0, s0, 4
	addi	s1, s1, 4
	bnez	a5, .LBB0_16
	j	.LBB0_8
.LBB0_17:                               # %for.cond22.preheader
	bge	t3, a6, .LBB0_28
# %bb.18:                               # %for.body25.preheader
	andi	t2, t3, -16
	addi	t1, a7, 32
	addi	t5, a2, 32
	li	t4, -1
	fmv.w.x	fa5, zero
	mv	t6, t3
	j	.LBB0_20
.LBB0_19:                               # %for.end40
                                        #   in Loop: Header=BB0_20 Depth=1
	addi	t6, t6, 1
	addi	t5, t5, 4
	addi	t4, t4, -1
	beq	t6, a6, .LBB0_28
.LBB0_20:                               # %for.body25
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_22 Depth 2
                                        #     Child Loop BB0_26 Depth 2
	sub	a0, t6, t3
	addi	a0, a0, 1
	add	s0, t2, a0
	bgeu	a0, s0, .LBB0_24
# %bb.21:                               # %for.body33.preheader
                                        #   in Loop: Header=BB0_20 Depth=1
	mv	a5, t5
	mv	s1, t1
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
.LBB0_22:                               # %for.body33.15
                                        #   Parent Loop BB0_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft9, -28(a5)
	flw	ft10, -32(s1)
	flw	ft11, -24(a5)
	flw	fs0, -28(s1)
	flw	fs1, -20(a5)
	flw	fs2, -24(s1)
	flw	fs3, -16(a5)
	flw	fs4, -20(s1)
	fmadd.s	fa4, ft9, ft10, fa4
	fmadd.s	fa3, ft11, fs0, fa3
	fmadd.s	fa2, fs1, fs2, fa2
	fmadd.s	fa1, fs3, fs4, fa1
	flw	ft9, -12(a5)
	flw	ft10, -16(s1)
	flw	ft11, -8(a5)
	flw	fs0, -12(s1)
	flw	fs1, -4(a5)
	flw	fs2, -8(s1)
	flw	fs3, 0(a5)
	flw	fs4, -4(s1)
	fmadd.s	fa0, ft9, ft10, fa0
	fmadd.s	ft0, ft11, fs0, ft0
	fmadd.s	ft1, fs1, fs2, ft1
	fmadd.s	ft2, fs3, fs4, ft2
	flw	ft9, 4(a5)
	flw	ft10, 0(s1)
	flw	ft11, 8(a5)
	flw	fs0, 4(s1)
	flw	fs1, 12(a5)
	flw	fs2, 8(s1)
	flw	fs3, 16(a5)
	flw	fs4, 12(s1)
	fmadd.s	ft3, ft9, ft10, ft3
	fmadd.s	ft4, ft11, fs0, ft4
	fmadd.s	ft5, fs1, fs2, ft5
	fmadd.s	ft6, fs3, fs4, ft6
	flw	ft9, 20(a5)
	flw	ft10, 16(s1)
	flw	ft11, 24(a5)
	flw	fs0, 20(s1)
	flw	fs1, 28(a5)
	flw	fs2, 24(s1)
	flw	fs3, 32(a5)
	flw	fs4, 28(s1)
	fmadd.s	ft7, ft9, ft10, ft7
	fmadd.s	fa6, ft11, fs0, fa6
	fmadd.s	fa7, fs1, fs2, fa7
	fmadd.s	ft8, fs3, fs4, ft8
	addi	a0, a0, 16
	addi	s1, s1, 64
	addi	a5, a5, 64
	bltu	a0, s0, .LBB0_22
# %bb.23:                               # %for.end40.loopexit
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
	slli	a5, t6, 2
	add	a5, a5, a4
	fsw	fa4, 0(a5)
	bltu	t6, a0, .LBB0_19
	j	.LBB0_25
.LBB0_24:                               #   in Loop: Header=BB0_20 Depth=1
	fmv.s	fa4, fa5
	slli	a5, t6, 2
	add	a5, a5, a4
	fsw	fa5, 0(a5)
	bltu	t6, a0, .LBB0_19
.LBB0_25:                               # %for.body33.clone.preheader
                                        #   in Loop: Header=BB0_20 Depth=1
	add	s0, a0, t4
	slli	s0, s0, 2
	add	s0, s0, a7
	slli	s1, a0, 2
	add	s1, s1, a2
.LBB0_26:                               # %for.body33.clone
                                        #   Parent Loop BB0_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s1)
	flw	fa2, 0(s0)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a0, a0, 1
	addi	s0, s0, 4
	addi	s1, s1, 4
	bgeu	t6, a0, .LBB0_26
# %bb.27:                               # %for.cond.for.end_crit_edge60
                                        #   in Loop: Header=BB0_20 Depth=1
	fsw	fa4, 0(a5)
	j	.LBB0_19
.LBB0_28:                               # %for.cond45.preheader
	add	a1, a1, a3
	addi	t2, a1, -1
	bge	a6, t2, .LBB0_39
# %bb.29:                               # %for.body50.lr.ph
	addi	a1, a6, -1
	addi	t1, a7, 16
	slli	a0, a6, 2
	sub	a0, a0, t0
	add	a0, a0, a2
	addi	t0, a0, 16
	not	t4, a6
	add	t4, t4, t3
	fmv.w.x	fa5, zero
	mv	a0, a6
	j	.LBB0_31
.LBB0_30:                               # %for.end67
                                        #   in Loop: Header=BB0_31 Depth=1
	addi	a0, a0, 1
	addi	t0, t0, 4
	addi	t4, t4, -1
	beq	a0, t2, .LBB0_39
.LBB0_31:                               # %for.body50
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_33 Depth 2
                                        #     Child Loop BB0_37 Depth 2
	sub	a3, a0, t3
	addi	s0, a3, 1
	not	a3, a3
	add	a3, a3, a6
	andi	a3, a3, -8
	add	s1, a3, s0
	bgeu	s0, s1, .LBB0_35
# %bb.32:                               # %for.body60.preheader
                                        #   in Loop: Header=BB0_31 Depth=1
	mv	a5, t0
	mv	a3, t1
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
.LBB0_33:                               # %for.body60.7
                                        #   Parent Loop BB0_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -12(a5)
	flw	ft4, -16(a3)
	flw	ft5, -8(a5)
	flw	ft6, -12(a3)
	flw	ft7, -4(a5)
	flw	fa6, -8(a3)
	flw	fa7, 0(a5)
	flw	ft8, -4(a3)
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	flw	ft3, 4(a5)
	flw	ft4, 0(a3)
	flw	ft5, 8(a5)
	flw	ft6, 4(a3)
	flw	ft7, 12(a5)
	flw	fa6, 8(a3)
	flw	fa7, 16(a5)
	flw	ft8, 12(a3)
	fmadd.s	fa0, ft3, ft4, fa0
	fmadd.s	ft0, ft5, ft6, ft0
	fmadd.s	ft1, ft7, fa6, ft1
	fmadd.s	ft2, fa7, ft8, ft2
	addi	s0, s0, 8
	addi	a3, a3, 32
	addi	a5, a5, 32
	bltu	s0, s1, .LBB0_33
# %bb.34:                               # %for.end67.loopexit
                                        #   in Loop: Header=BB0_31 Depth=1
	fadd.s	fa4, fa4, fa3
	fadd.s	fa4, fa4, fa2
	fadd.s	fa4, fa4, fa1
	fadd.s	fa4, fa4, fa0
	fadd.s	fa4, fa4, ft0
	fadd.s	fa4, fa4, ft1
	fadd.s	fa4, fa4, ft2
	slli	a3, a0, 2
	add	a3, a3, a4
	fsw	fa4, 0(a3)
	bltu	a1, s0, .LBB0_30
	j	.LBB0_36
.LBB0_35:                               #   in Loop: Header=BB0_31 Depth=1
	fmv.s	fa4, fa5
	slli	a3, a0, 2
	add	a3, a3, a4
	fsw	fa5, 0(a3)
	bltu	a1, s0, .LBB0_30
.LBB0_36:                               # %for.body60.clone.preheader
                                        #   in Loop: Header=BB0_31 Depth=1
	add	a5, s0, t4
	slli	a5, a5, 2
	add	a5, a5, a7
	slli	s1, s0, 2
	add	s1, s1, a2
.LBB0_37:                               # %for.body60.clone
                                        #   Parent Loop BB0_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s1)
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s0, s0, 1
	addi	a5, a5, 4
	addi	s1, s1, 4
	bgeu	a1, s0, .LBB0_37
# %bb.38:                               # %for.cond.for.end_crit_edge80
                                        #   in Loop: Header=BB0_31 Depth=1
	fsw	fa4, 0(a3)
	j	.LBB0_30
.LBB0_39:
	li	a5, 0
	flw	fs0, 28(sp)                     # 4-byte Folded Reload
	flw	fs1, 24(sp)                     # 4-byte Folded Reload
	flw	fs2, 20(sp)                     # 4-byte Folded Reload
	flw	fs3, 16(sp)                     # 4-byte Folded Reload
	flw	fs4, 12(sp)                     # 4-byte Folded Reload
	cm.pop	{ra, s0-s4}, 64
.LBB0_40:                               # %return
	mv	a0, a5
	ret
.Lfunc_end0:
	.size	dsps_ccorr_f32_ansi, .Lfunc_end0-dsps_ccorr_f32_ansi
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
