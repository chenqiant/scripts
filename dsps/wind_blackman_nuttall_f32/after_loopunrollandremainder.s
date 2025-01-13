# 2024-12-26 11:13:42
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_wind_blackman_nuttall_f32.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.section	.sdata,"aw",@progbits
	.p2align	2, 0x0                          # -- Begin function dsps_wind_blackman_nuttall_f32
.LCPI0_0:
	.word	0x3eba2768                      # float 0.363581896
.LCPI0_1:
	.word	0xbefa7579                      # float -0.489177495
.LCPI0_2:
	.word	0x3e0be0bd                      # float 0.136599496
.LCPI0_3:
	.word	0xbc2e5802                      # float -0.0106410999
	.text
	.globl	dsps_wind_blackman_nuttall_f32
	.p2align	1
	.type	dsps_wind_blackman_nuttall_f32,@function
dsps_wind_blackman_nuttall_f32:         # @dsps_wind_blackman_nuttall_f32
# %bb.0:                                # %entry
	blez	a1, .LBB0_9
# %bb.1:                                # %for.body.lr.ph
	addi	sp, sp, -64
	sw	ra, 60(sp)                      # 4-byte Folded Spill
	sw	s0, 56(sp)                      # 4-byte Folded Spill
	sw	s1, 52(sp)                      # 4-byte Folded Spill
	sw	s2, 48(sp)                      # 4-byte Folded Spill
	sw	s3, 44(sp)                      # 4-byte Folded Spill
	sw	s4, 40(sp)                      # 4-byte Folded Spill
	fsw	fs0, 36(sp)                     # 4-byte Folded Spill
	fsw	fs1, 32(sp)                     # 4-byte Folded Spill
	fsw	fs2, 28(sp)                     # 4-byte Folded Spill
	fsw	fs3, 24(sp)                     # 4-byte Folded Spill
	fsw	fs4, 20(sp)                     # 4-byte Folded Spill
	fsw	fs5, 16(sp)                     # 4-byte Folded Spill
	fsw	fs6, 12(sp)                     # 4-byte Folded Spill
	fsw	fs7, 8(sp)                      # 4-byte Folded Spill
	fsw	fs8, 4(sp)                      # 4-byte Folded Spill
	mv	s3, a1
	mv	s2, a0
	addi	a0, a1, -1
	fcvt.s.w	fa5, a0
	lui	a0, 260096
	fmv.w.x	fa4, a0
	fdiv.s	fa0, fa4, fa5
	call	__extendsfdf2
	lui	a2, 345155
	addi	a2, a2, -744
	lui	a3, 262546
	addi	a3, a3, 507
	call	__muldf3
	call	__truncdfsf2
	fmv.s	fs0, fa0
	fadd.s	fs1, fa0, fa0
	lui	a0, 263168
	fmv.w.x	fa5, a0
	li	a0, 8
	fmul.s	fs2, fa0, fa5
	blt	s3, a0, .LBB0_5
# %bb.2:                                # %for.body.7.preheader
	lui	a0, %hi(.LCPI0_0)
	flw	fs3, %lo(.LCPI0_0)(a0)
	lui	a0, %hi(.LCPI0_1)
	flw	fs4, %lo(.LCPI0_1)(a0)
	lui	a0, %hi(.LCPI0_2)
	flw	fs5, %lo(.LCPI0_2)(a0)
	lui	a0, %hi(.LCPI0_3)
	flw	fs6, %lo(.LCPI0_3)(a0)
	li	s1, 0
	addi	s4, s3, -7
	addi	s0, s2, 16
.LBB0_3:                                # %for.body.7
                                        # =>This Inner Loop Header: Depth=1
	fcvt.s.w	fs7, s1
	fmul.s	fa0, fs0, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs4, fs3
	fmul.s	fa0, fs1, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs5, fs8
	fmul.s	fa0, fs2, fs7
	call	cosf
	fmadd.s	fa5, fa0, fs6, fs8
	fsw	fa5, -16(s0)
	addi	a0, s1, 1
	fcvt.s.w	fs7, a0
	fmul.s	fa0, fs0, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs4, fs3
	fmul.s	fa0, fs1, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs5, fs8
	fmul.s	fa0, fs2, fs7
	call	cosf
	fmadd.s	fa5, fa0, fs6, fs8
	fsw	fa5, -12(s0)
	addi	a0, s1, 2
	fcvt.s.w	fs7, a0
	fmul.s	fa0, fs0, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs4, fs3
	fmul.s	fa0, fs1, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs5, fs8
	fmul.s	fa0, fs2, fs7
	call	cosf
	fmadd.s	fa5, fa0, fs6, fs8
	fsw	fa5, -8(s0)
	addi	a0, s1, 3
	fcvt.s.w	fs7, a0
	fmul.s	fa0, fs0, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs4, fs3
	fmul.s	fa0, fs1, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs5, fs8
	fmul.s	fa0, fs2, fs7
	call	cosf
	fmadd.s	fa5, fa0, fs6, fs8
	fsw	fa5, -4(s0)
	addi	a0, s1, 4
	fcvt.s.w	fs7, a0
	fmul.s	fa0, fs0, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs4, fs3
	fmul.s	fa0, fs1, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs5, fs8
	fmul.s	fa0, fs2, fs7
	call	cosf
	fmadd.s	fa5, fa0, fs6, fs8
	fsw	fa5, 0(s0)
	addi	a0, s1, 5
	fcvt.s.w	fs7, a0
	fmul.s	fa0, fs0, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs4, fs3
	fmul.s	fa0, fs1, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs5, fs8
	fmul.s	fa0, fs2, fs7
	call	cosf
	fmadd.s	fa5, fa0, fs6, fs8
	fsw	fa5, 4(s0)
	addi	a0, s1, 6
	fcvt.s.w	fs7, a0
	fmul.s	fa0, fs0, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs4, fs3
	fmul.s	fa0, fs1, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs5, fs8
	fmul.s	fa0, fs2, fs7
	call	cosf
	fmadd.s	fa5, fa0, fs6, fs8
	fsw	fa5, 8(s0)
	addi	a0, s1, 7
	fcvt.s.w	fs7, a0
	fmul.s	fa0, fs0, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs4, fs3
	fmul.s	fa0, fs1, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs5, fs8
	fmul.s	fa0, fs2, fs7
	call	cosf
	fmadd.s	fa5, fa0, fs6, fs8
	fsw	fa5, 12(s0)
	addi	s1, s1, 8
	addi	s0, s0, 32
	blt	s1, s4, .LBB0_3
# %bb.4:                                # %for.cond97.preheader
	blt	s1, s3, .LBB0_6
	j	.LBB0_8
.LBB0_5:
	li	s1, 0
	blez	s3, .LBB0_8
.LBB0_6:                                # %for.body.clone.preheader
	lui	a0, %hi(.LCPI0_0)
	flw	fs3, %lo(.LCPI0_0)(a0)
	lui	a0, %hi(.LCPI0_1)
	flw	fs4, %lo(.LCPI0_1)(a0)
	lui	a0, %hi(.LCPI0_2)
	flw	fs5, %lo(.LCPI0_2)(a0)
	lui	a0, %hi(.LCPI0_3)
	flw	fs6, %lo(.LCPI0_3)(a0)
	slli	a0, s1, 2
	add	s2, s2, a0
.LBB0_7:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	fcvt.s.w	fs7, s1
	fmul.s	fa0, fs0, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs4, fs3
	fmul.s	fa0, fs1, fs7
	call	cosf
	fmadd.s	fs8, fa0, fs5, fs8
	fmul.s	fa0, fs2, fs7
	call	cosf
	fmadd.s	fa5, fa0, fs6, fs8
	fsw	fa5, 0(s2)
	addi	s1, s1, 1
	addi	s2, s2, 4
	bne	s3, s1, .LBB0_7
.LBB0_8:
	lw	ra, 60(sp)                      # 4-byte Folded Reload
	lw	s0, 56(sp)                      # 4-byte Folded Reload
	lw	s1, 52(sp)                      # 4-byte Folded Reload
	lw	s2, 48(sp)                      # 4-byte Folded Reload
	lw	s3, 44(sp)                      # 4-byte Folded Reload
	lw	s4, 40(sp)                      # 4-byte Folded Reload
	flw	fs0, 36(sp)                     # 4-byte Folded Reload
	flw	fs1, 32(sp)                     # 4-byte Folded Reload
	flw	fs2, 28(sp)                     # 4-byte Folded Reload
	flw	fs3, 24(sp)                     # 4-byte Folded Reload
	flw	fs4, 20(sp)                     # 4-byte Folded Reload
	flw	fs5, 16(sp)                     # 4-byte Folded Reload
	flw	fs6, 12(sp)                     # 4-byte Folded Reload
	flw	fs7, 8(sp)                      # 4-byte Folded Reload
	flw	fs8, 4(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 64
.LBB0_9:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	dsps_wind_blackman_nuttall_f32, .Lfunc_end0-dsps_wind_blackman_nuttall_f32
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"
	.section	".note.GNU-stack","",@progbits
