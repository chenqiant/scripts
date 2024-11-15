	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"after_customlicm.ll"
	.globl	dsps_corr_f32_ansi              # -- Begin function dsps_corr_f32_ansi
	.p2align	1
	.type	dsps_corr_f32_ansi,@function
dsps_corr_f32_ansi:                     # @dsps_corr_f32_ansi
	.cfi_startproc
# %bb.0:                                # %entry
	lui	a5, 112
	addi	a5, a5, 3
	blt	a1, a3, .LBB0_18
# %bb.1:                                # %entry
	beqz	a0, .LBB0_18
# %bb.2:                                # %entry
	beqz	a2, .LBB0_18
# %bb.3:                                # %entry
	beqz	a4, .LBB0_18
# %bb.4:                                # %if.end
	cm.push	{ra}, -32
	.cfi_def_cfa_offset 32
	fsw	fs0, 12(sp)                     # 4-byte Folded Spill
	fsw	fs1, 8(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset fs0, -20
	.cfi_offset fs1, -24
	sub	a6, a1, a3
	li	t1, 0
	li	a5, 16
	blt	a6, a5, .LBB0_10
# %bb.5:                                # %for.cond8.preheader.lr.ph
	addi	a7, a6, -15
	addi	t0, a2, 32
	slli	t3, a3, 2
	add	t3, t3, t0
	fmv.w.x	fa5, zero
	mv	t2, a0
	j	.LBB0_7
.LBB0_6:                                # %for.cond.cleanup
                                        #   in Loop: Header=BB0_7 Depth=1
	slli	a5, t1, 2
	add	a5, a5, a4
	fsw	ft8, 60(a5)
	fsw	fa7, 56(a5)
	fsw	fa6, 52(a5)
	fsw	ft7, 48(a5)
	fsw	ft6, 44(a5)
	fsw	ft5, 40(a5)
	fsw	ft4, 36(a5)
	fsw	ft3, 32(a5)
	fsw	ft2, 28(a5)
	fsw	ft1, 24(a5)
	fsw	ft0, 20(a5)
	fsw	fa0, 16(a5)
	fsw	fa1, 12(a5)
	fsw	fa2, 8(a5)
	fsw	fa3, 4(a5)
	fsw	fa4, 0(a5)
	addi	t1, t1, 16
	addi	t2, t2, 64
	bge	t1, a7, .LBB0_10
.LBB0_7:                                # %for.cond8.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
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
	blez	a3, .LBB0_6
# %bb.8:                                # %for.body10.lr.ph
                                        #   in Loop: Header=BB0_7 Depth=1
	mv	a5, t0
	mv	t4, t2
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
.LBB0_9:                                # %for.body14.us.unroll
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft9, -32(a5)
	flw	ft10, 0(t4)
	flw	ft11, -28(a5)
	flw	fs0, -24(a5)
	flw	fs1, -20(a5)
	fmadd.s	fa4, ft10, ft9, fa4
	flw	ft10, -16(a5)
	fmadd.s	fa3, ft11, ft9, fa3
	flw	ft11, -12(a5)
	fmadd.s	fa2, fs0, ft9, fa2
	flw	fs0, -8(a5)
	fmadd.s	fa1, fs1, ft9, fa1
	flw	fs1, -4(a5)
	fmadd.s	fa0, ft10, ft9, fa0
	flw	ft10, 0(a5)
	fmadd.s	ft0, ft11, ft9, ft0
	flw	ft11, 4(a5)
	fmadd.s	ft1, fs0, ft9, ft1
	flw	fs0, 8(a5)
	fmadd.s	ft2, fs1, ft9, ft2
	flw	fs1, 12(a5)
	fmadd.s	ft3, ft10, ft9, ft3
	flw	ft10, 16(a5)
	fmadd.s	ft4, ft11, ft9, ft4
	flw	ft11, 20(a5)
	fmadd.s	ft5, fs0, ft9, ft5
	flw	fs0, 24(a5)
	fmadd.s	ft6, fs1, ft9, ft6
	flw	fs1, 28(a5)
	fmadd.s	ft7, ft10, ft9, ft7
	fmadd.s	fa6, ft11, ft9, fa6
	fmadd.s	fa7, fs0, ft9, fa7
	fmadd.s	ft8, fs1, ft9, ft8
	addi	t5, a5, 4
	addi	t4, t4, 4
	mv	a5, t5
	bne	t5, t3, .LBB0_9
	j	.LBB0_6
.LBB0_10:                               # %for.cond91.preheader
	blt	a6, t1, .LBB0_17
# %bb.11:                               # %for.cond95.preheader.lr.ph
	blez	a3, .LBB0_16
# %bb.12:                               # %for.cond11.preheader.us.preheader
	addi	a6, a6, 1
	slli	a1, t1, 2
	add	a0, a0, a1
	slli	a1, a3, 2
	add	a1, a1, a2
	fmv.w.x	fa5, zero
.LBB0_13:                               # %for.cond11.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_14 Depth 2
	mv	a7, t1
	mv	a5, a0
	mv	a3, a2
	fmv.s	fa4, fa5
.LBB0_14:                               # %for.body14.us
                                        #   Parent Loop BB0_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a5)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, 4
	addi	a5, a5, 4
	bne	a3, a1, .LBB0_14
# %bb.15:                               # %for.cond11.for.cond.cleanup13_crit_edge.us
                                        #   in Loop: Header=BB0_13 Depth=1
	slli	a3, a7, 2
	add	a3, a3, a4
	fsw	fa4, 0(a3)
	addi	t1, a7, 1
	addi	a0, a0, 4
	bne	a7, a6, .LBB0_13
	j	.LBB0_17
.LBB0_16:                               # %for.cond11.preheader.preheader
	slli	a0, t1, 2
	add	a0, a0, a4
	add	a3, a3, t1
	sub	a1, a1, a3
	slli	a1, a1, 2
	addi	a2, a1, 4
	li	a1, 0
	call	memset
.LBB0_17:
	li	a5, 0
	flw	fs0, 12(sp)                     # 4-byte Folded Reload
	flw	fs1, 8(sp)                      # 4-byte Folded Reload
	cm.pop	{ra}, 32
.LBB0_18:                               # %return
	mv	a0, a5
	ret
.Lfunc_end0:
	.size	dsps_corr_f32_ansi, .Lfunc_end0-dsps_corr_f32_ansi
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
