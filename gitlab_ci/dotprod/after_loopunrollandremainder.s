	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"after_customlicm.ll"
	.globl	dsps_dotprod_f32_ansi           # -- Begin function dsps_dotprod_f32_ansi
	.p2align	1
	.type	dsps_dotprod_f32_ansi,@function
dsps_dotprod_f32_ansi:                  # @dsps_dotprod_f32_ansi
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	fsw	fs0, 12(sp)                     # 4-byte Folded Spill
	.cfi_offset fs0, -4
	li	a4, 2
	bge	a4, a3, .LBB0_7
# %bb.1:                                # %for.cond.preheader1
	li	a4, 8
	bltu	a3, a4, .LBB0_10
# %bb.2:                                # %for.body.preheader
	addi	a7, a3, -7
	lui	a5, 524288
	addi	a5, a5, -8
	blt	a4, a7, .LBB0_4
# %bb.3:                                # %for.body.preheader
	li	a7, 8
.LBB0_4:                                # %for.body.preheader
	and	a6, a3, a5
	addi	a5, a1, 16
	addi	t0, a0, 16
	slli	a7, a7, 2
	addi	a7, a7, -4
	andi	a4, a7, -32
	add	a4, a4, a1
	fmv.w.x	fa5, zero
	addi	a7, a4, 48
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	ft1, -12(t0)
	flw	ft2, -12(a5)
	flw	ft3, -8(t0)
	flw	ft4, -8(a5)
	flw	ft5, -4(t0)
	flw	ft6, -4(a5)
	flw	ft7, 0(t0)
	flw	fa6, 0(a5)
	flw	fa7, 4(t0)
	flw	ft8, 4(a5)
	flw	ft9, 8(t0)
	flw	ft10, 8(a5)
	flw	ft11, 12(t0)
	flw	fs0, 12(a5)
	fmadd.s	fa5, ft1, ft2, fa5
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	fmadd.s	fa0, ft9, ft10, fa0
	fmadd.s	ft0, ft11, fs0, ft0
	addi	a5, a5, 32
	addi	t0, t0, 32
	bne	a5, a7, .LBB0_5
# %bb.6:                                # %for.cond31.preheader
	fmv.s	ft1, fa5
	blt	a6, a3, .LBB0_11
	j	.LBB0_13
.LBB0_7:                                # %for.cond.preheader
	blez	a3, .LBB0_14
# %bb.8:                                # %for.body.clone.preheader
	slli	a3, a3, 2
	add	a3, a3, a1
	fmv.w.x	fa5, zero
.LBB0_9:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	flw	fa4, 0(a0)
	flw	fa3, 0(a1)
	fmadd.s	fa5, fa4, fa3, fa5
	addi	a1, a1, 4
	addi	a0, a0, 4
	bne	a1, a3, .LBB0_9
	j	.LBB0_15
.LBB0_10:
	fmv.w.x	fa5, zero
	li	a6, 0
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	blez	a3, .LBB0_13
.LBB0_11:                               # %for.body33.preheader
	slli	a6, a6, 2
	add	a4, a1, a6
	add	a0, a0, a6
	slli	a3, a3, 2
	add	a1, a1, a3
	fmv.s	ft1, fa5
.LBB0_12:                               # %for.body33
                                        # =>This Inner Loop Header: Depth=1
	flw	ft2, 0(a0)
	flw	ft3, 0(a4)
	fmadd.s	ft1, ft2, ft3, ft1
	addi	a4, a4, 4
	addi	a0, a0, 4
	bne	a4, a1, .LBB0_12
.LBB0_13:                               # %for.end37
	fadd.s	fa5, fa5, ft1
	fadd.s	fa5, fa4, fa5
	fadd.s	fa5, fa3, fa5
	fadd.s	fa5, fa2, fa5
	fadd.s	fa5, fa1, fa5
	fadd.s	fa5, fa0, fa5
	fadd.s	fa5, ft0, fa5
	j	.LBB0_15
.LBB0_14:
	fmv.w.x	fa5, zero
.LBB0_15:                               # %if.end
	fsw	fa5, 0(a2)
	li	a0, 0
	flw	fs0, 12(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	dsps_dotprod_f32_ansi, .Lfunc_end0-dsps_dotprod_f32_ansi
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits