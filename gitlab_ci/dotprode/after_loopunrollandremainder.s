	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"after_customlicm.ll"
	.globl	dsps_dotprode_f32_ansi          # -- Begin function dsps_dotprode_f32_ansi
	.p2align	1
	.type	dsps_dotprode_f32_ansi,@function
dsps_dotprode_f32_ansi:                 # @dsps_dotprode_f32_ansi
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	fsw	fs0, 12(sp)                     # 4-byte Folded Spill
	.cfi_offset fs0, -4
	li	a6, 2
	bge	a6, a3, .LBB0_7
# %bb.1:                                # %for.cond.preheader1
	li	a6, 8
	bltu	a3, a6, .LBB0_10
# %bb.2:                                # %for.body.preheader
	addi	t1, a3, -7
	lui	a7, 524288
	addi	a7, a7, -8
	blt	a6, t1, .LBB0_4
# %bb.3:                                # %for.body.preheader
	li	t1, 8
.LBB0_4:                                # %for.body.preheader
	and	a6, a3, a7
	addi	a7, a0, 16
	addi	t0, a1, 16
	slli	t1, t1, 2
	addi	t1, t1, -4
	andi	t1, t1, -32
	add	t1, t1, a0
	fmv.w.x	fa5, zero
	addi	t1, t1, 48
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
.LBB0_5:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	ft1, -12(a7)
	flw	ft2, -12(t0)
	flw	ft3, -8(a7)
	flw	ft4, -8(t0)
	flw	ft5, -4(a7)
	flw	ft6, -4(t0)
	flw	ft7, 0(a7)
	flw	fa6, 0(t0)
	flw	fa7, 4(a7)
	flw	ft8, 4(t0)
	flw	ft9, 8(a7)
	flw	ft10, 8(t0)
	flw	ft11, 12(a7)
	flw	fs0, 12(t0)
	fmadd.s	fa5, ft1, ft2, fa5
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	fmadd.s	fa0, ft9, ft10, fa0
	fmadd.s	ft0, ft11, fs0, ft0
	addi	a7, a7, 32
	addi	t0, t0, 32
	bne	a7, t1, .LBB0_5
# %bb.6:                                # %for.cond31.preheader
	fmv.s	ft1, fa5
	blt	a6, a3, .LBB0_11
	j	.LBB0_13
.LBB0_7:                                # %for.cond.preheader
	blez	a3, .LBB0_14
# %bb.8:                                # %for.body.clone.preheader
	slli	a5, a5, 2
	slli	a4, a4, 2
	fmv.w.x	fa5, zero
.LBB0_9:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	flw	fa4, 0(a0)
	flw	fa3, 0(a1)
	fmadd.s	fa5, fa4, fa3, fa5
	addi	a3, a3, -1
	add	a1, a1, a5
	add	a0, a0, a4
	bnez	a3, .LBB0_9
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
	sub	a7, a3, a6
	mul	a3, a6, a5
	slli	a3, a3, 2
	add	a1, a1, a3
	slli	a5, a5, 2
	mul	a3, a6, a4
	slli	a3, a3, 2
	add	a0, a0, a3
	slli	a4, a4, 2
	fmv.s	ft1, fa5
.LBB0_12:                               # %for.body33
                                        # =>This Inner Loop Header: Depth=1
	flw	ft2, 0(a0)
	flw	ft3, 0(a1)
	fmadd.s	ft1, ft2, ft3, ft1
	addi	a7, a7, -1
	add	a1, a1, a5
	add	a0, a0, a4
	bnez	a7, .LBB0_12
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
	.size	dsps_dotprode_f32_ansi, .Lfunc_end0-dsps_dotprode_f32_ansi
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
