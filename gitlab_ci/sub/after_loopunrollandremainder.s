	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"after_customlicm.ll"
	.globl	dsps_sub_f32_ansi               # -- Begin function dsps_sub_f32_ansi
	.p2align	1
	.type	dsps_sub_f32_ansi,@function
dsps_sub_f32_ansi:                      # @dsps_sub_f32_ansi
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	fsw	fs0, 44(sp)                     # 4-byte Folded Spill
	fsw	fs1, 40(sp)                     # 4-byte Folded Spill
	fsw	fs2, 36(sp)                     # 4-byte Folded Spill
	fsw	fs3, 32(sp)                     # 4-byte Folded Spill
	fsw	fs4, 28(sp)                     # 4-byte Folded Spill
	fsw	fs5, 24(sp)                     # 4-byte Folded Spill
	fsw	fs6, 20(sp)                     # 4-byte Folded Spill
	fsw	fs7, 16(sp)                     # 4-byte Folded Spill
	fsw	fs8, 12(sp)                     # 4-byte Folded Spill
	fsw	fs9, 8(sp)                      # 4-byte Folded Spill
	fsw	fs10, 4(sp)                     # 4-byte Folded Spill
	fsw	fs11, 0(sp)                     # 4-byte Folded Spill
	.cfi_offset fs0, -4
	.cfi_offset fs1, -8
	.cfi_offset fs2, -12
	.cfi_offset fs3, -16
	.cfi_offset fs4, -20
	.cfi_offset fs5, -24
	.cfi_offset fs6, -28
	.cfi_offset fs7, -32
	.cfi_offset fs8, -36
	.cfi_offset fs9, -40
	.cfi_offset fs10, -44
	.cfi_offset fs11, -48
	lui	a7, 112
	addi	a7, a7, 3
	beqz	a0, .LBB0_15
# %bb.1:                                # %entry
	beqz	a1, .LBB0_15
# %bb.2:                                # %entry
	beqz	a2, .LBB0_15
# %bb.3:                                # %if.end
	li	a7, 2
	bge	a7, a3, .LBB0_6
# %bb.4:                                # %for.cond.preheader.new
	li	a7, 16
	bgeu	a3, a7, .LBB0_9
# %bb.5:
	li	a7, 0
	j	.LBB0_11
.LBB0_6:                                # %for.cond.preheader
	blez	a3, .LBB0_14
# %bb.7:                                # %for.body.clone.preheader
	slli	a6, a6, 2
	slli	a5, a5, 2
	slli	a4, a4, 2
.LBB0_8:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a0)
	flw	fa4, 0(a1)
	fsub.s	fa5, fa5, fa4
	fsw	fa5, 0(a2)
	addi	a3, a3, -1
	add	a2, a2, a6
	add	a1, a1, a5
	add	a0, a0, a4
	bnez	a3, .LBB0_8
	j	.LBB0_14
.LBB0_9:                                # %for.body.modify.preheader
	li	a7, 0
	addi	t0, a3, -16
	addi	t1, a2, 32
	addi	t2, a1, 32
	addi	t3, a0, 32
.LBB0_10:                               # %for.body.modify
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, -32(t3)
	flw	fa4, -32(t2)
	flw	fa3, -28(t3)
	flw	fa2, -28(t2)
	flw	fa1, -24(t3)
	flw	fa0, -24(t2)
	flw	ft0, -20(t3)
	flw	ft1, -20(t2)
	flw	ft2, -16(t3)
	flw	ft3, -16(t2)
	flw	ft4, -12(t3)
	flw	ft5, -12(t2)
	flw	ft6, -8(t3)
	flw	ft7, -8(t2)
	flw	fa6, -4(t3)
	flw	fa7, -4(t2)
	flw	ft8, 0(t3)
	flw	ft9, 0(t2)
	flw	ft10, 4(t3)
	flw	ft11, 4(t2)
	flw	fs0, 8(t3)
	flw	fs1, 8(t2)
	flw	fs2, 12(t3)
	flw	fs3, 12(t2)
	flw	fs4, 16(t3)
	flw	fs5, 16(t2)
	flw	fs6, 20(t3)
	flw	fs7, 20(t2)
	flw	fs8, 24(t3)
	flw	fs9, 24(t2)
	flw	fs10, 28(t3)
	flw	fs11, 28(t2)
	fsub.s	fa5, fa5, fa4
	fsub.s	fa4, fa3, fa2
	fsub.s	fa3, fa1, fa0
	fsub.s	fa2, ft0, ft1
	fsub.s	fa1, ft2, ft3
	fsub.s	fa0, ft4, ft5
	fsub.s	ft0, ft6, ft7
	fsub.s	ft1, fa6, fa7
	fsub.s	ft2, ft8, ft9
	fsub.s	ft3, ft10, ft11
	fsub.s	ft4, fs0, fs1
	fsub.s	ft5, fs2, fs3
	fsub.s	ft6, fs4, fs5
	fsub.s	ft7, fs6, fs7
	fsub.s	fa6, fs8, fs9
	fsub.s	fa7, fs10, fs11
	fsw	fa7, 28(t1)
	fsw	fa6, 24(t1)
	fsw	ft7, 20(t1)
	fsw	ft6, 16(t1)
	fsw	ft5, 12(t1)
	fsw	ft4, 8(t1)
	fsw	ft3, 4(t1)
	fsw	ft2, 0(t1)
	fsw	ft1, -4(t1)
	fsw	ft0, -8(t1)
	fsw	fa0, -12(t1)
	fsw	fa1, -16(t1)
	fsw	fa2, -20(t1)
	fsw	fa3, -24(t1)
	fsw	fa4, -28(t1)
	fsw	fa5, -32(t1)
	addi	a7, a7, 16
	addi	t1, t1, 64
	addi	t2, t2, 64
	addi	t3, t3, 64
	bge	t0, a7, .LBB0_10
.LBB0_11:                               # %for.cond.preheader.new2
	bge	a7, a3, .LBB0_14
# %bb.12:                               # %for.body.preheader
	sub	t0, a3, a7
	mul	a3, a7, a6
	slli	a3, a3, 2
	add	a2, a2, a3
	slli	a6, a6, 2
	mul	a3, a7, a5
	slli	a3, a3, 2
	add	a1, a1, a3
	slli	a5, a5, 2
	mul	a3, a7, a4
	slli	a3, a3, 2
	add	a0, a0, a3
	slli	a4, a4, 2
.LBB0_13:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a0)
	flw	fa4, 0(a1)
	fsub.s	fa5, fa5, fa4
	fsw	fa5, 0(a2)
	addi	t0, t0, -1
	add	a2, a2, a6
	add	a1, a1, a5
	add	a0, a0, a4
	bnez	t0, .LBB0_13
.LBB0_14:
	li	a7, 0
.LBB0_15:                               # %return
	mv	a0, a7
	flw	fs0, 44(sp)                     # 4-byte Folded Reload
	flw	fs1, 40(sp)                     # 4-byte Folded Reload
	flw	fs2, 36(sp)                     # 4-byte Folded Reload
	flw	fs3, 32(sp)                     # 4-byte Folded Reload
	flw	fs4, 28(sp)                     # 4-byte Folded Reload
	flw	fs5, 24(sp)                     # 4-byte Folded Reload
	flw	fs6, 20(sp)                     # 4-byte Folded Reload
	flw	fs7, 16(sp)                     # 4-byte Folded Reload
	flw	fs8, 12(sp)                     # 4-byte Folded Reload
	flw	fs9, 8(sp)                      # 4-byte Folded Reload
	flw	fs10, 4(sp)                     # 4-byte Folded Reload
	flw	fs11, 0(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	dsps_sub_f32_ansi, .Lfunc_end0-dsps_sub_f32_ansi
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
