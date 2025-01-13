# 2024-12-26 11:19:27
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_wind_flat_top_f32.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.section	.sdata,"aw",@progbits
	.p2align	2, 0x0                          # -- Begin function dsps_wind_flat_top_f32
.LCPI0_0:
	.word	0x3e5cc0ba                      # float 0.215578943
.LCPI0_1:
	.word	0xbed550bc                      # float -0.416631579
.LCPI0_2:
	.word	0x3e8df570                      # float 0.277263165
.LCPI0_3:
	.word	0xbdab2b70                      # float -0.0835789442
.LCPI0_4:
	.word	0x3be3a6bf                      # float 0.00694736792
	.text
	.globl	dsps_wind_flat_top_f32
	.p2align	1
	.type	dsps_wind_flat_top_f32,@function
dsps_wind_flat_top_f32:                 # @dsps_wind_flat_top_f32
# %bb.0:                                # %entry
	blez	a1, .LBB0_9
# %bb.1:                                # %for.body.lr.ph
	addi	sp, sp, -80
	sw	ra, 76(sp)                      # 4-byte Folded Spill
	sw	s0, 72(sp)                      # 4-byte Folded Spill
	sw	s1, 68(sp)                      # 4-byte Folded Spill
	sw	s2, 64(sp)                      # 4-byte Folded Spill
	sw	s3, 60(sp)                      # 4-byte Folded Spill
	sw	s4, 56(sp)                      # 4-byte Folded Spill
	fsw	fs0, 52(sp)                     # 4-byte Folded Spill
	fsw	fs1, 48(sp)                     # 4-byte Folded Spill
	fsw	fs2, 44(sp)                     # 4-byte Folded Spill
	fsw	fs3, 40(sp)                     # 4-byte Folded Spill
	fsw	fs4, 36(sp)                     # 4-byte Folded Spill
	fsw	fs5, 32(sp)                     # 4-byte Folded Spill
	fsw	fs6, 28(sp)                     # 4-byte Folded Spill
	fsw	fs7, 24(sp)                     # 4-byte Folded Spill
	fsw	fs8, 20(sp)                     # 4-byte Folded Spill
	fsw	fs9, 16(sp)                     # 4-byte Folded Spill
	fsw	fs10, 12(sp)                    # 4-byte Folded Spill
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
	fmul.s	fs2, fa0, fa5
	lui	a0, 264192
	fmv.w.x	fa5, a0
	li	a0, 8
	fmul.s	fs3, fa0, fa5
	blt	s3, a0, .LBB0_5
# %bb.2:                                # %for.body.7.preheader
	lui	a0, %hi(.LCPI0_0)
	flw	fs4, %lo(.LCPI0_0)(a0)
	lui	a0, %hi(.LCPI0_1)
	flw	fs5, %lo(.LCPI0_1)(a0)
	lui	a0, %hi(.LCPI0_2)
	flw	fs6, %lo(.LCPI0_2)(a0)
	lui	a0, %hi(.LCPI0_3)
	flw	fs7, %lo(.LCPI0_3)(a0)
	lui	a0, %hi(.LCPI0_4)
	flw	fs8, %lo(.LCPI0_4)(a0)
	li	s1, 0
	addi	s4, s3, -7
	addi	s0, s2, 16
.LBB0_3:                                # %for.body.7
                                        # =>This Inner Loop Header: Depth=1
	fcvt.s.w	fs9, s1
	fmul.s	fa0, fs0, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs5, fs4
	fmul.s	fa0, fs1, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs6, fs10
	fmul.s	fa0, fs2, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs7, fs10
	fmul.s	fa0, fs3, fs9
	call	cosf
	fmadd.s	fa5, fa0, fs8, fs10
	fsw	fa5, -16(s0)
	addi	a0, s1, 1
	fcvt.s.w	fs9, a0
	fmul.s	fa0, fs0, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs5, fs4
	fmul.s	fa0, fs1, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs6, fs10
	fmul.s	fa0, fs2, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs7, fs10
	fmul.s	fa0, fs3, fs9
	call	cosf
	fmadd.s	fa5, fa0, fs8, fs10
	fsw	fa5, -12(s0)
	addi	a0, s1, 2
	fcvt.s.w	fs9, a0
	fmul.s	fa0, fs0, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs5, fs4
	fmul.s	fa0, fs1, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs6, fs10
	fmul.s	fa0, fs2, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs7, fs10
	fmul.s	fa0, fs3, fs9
	call	cosf
	fmadd.s	fa5, fa0, fs8, fs10
	fsw	fa5, -8(s0)
	addi	a0, s1, 3
	fcvt.s.w	fs9, a0
	fmul.s	fa0, fs0, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs5, fs4
	fmul.s	fa0, fs1, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs6, fs10
	fmul.s	fa0, fs2, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs7, fs10
	fmul.s	fa0, fs3, fs9
	call	cosf
	fmadd.s	fa5, fa0, fs8, fs10
	fsw	fa5, -4(s0)
	addi	a0, s1, 4
	fcvt.s.w	fs9, a0
	fmul.s	fa0, fs0, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs5, fs4
	fmul.s	fa0, fs1, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs6, fs10
	fmul.s	fa0, fs2, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs7, fs10
	fmul.s	fa0, fs3, fs9
	call	cosf
	fmadd.s	fa5, fa0, fs8, fs10
	fsw	fa5, 0(s0)
	addi	a0, s1, 5
	fcvt.s.w	fs9, a0
	fmul.s	fa0, fs0, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs5, fs4
	fmul.s	fa0, fs1, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs6, fs10
	fmul.s	fa0, fs2, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs7, fs10
	fmul.s	fa0, fs3, fs9
	call	cosf
	fmadd.s	fa5, fa0, fs8, fs10
	fsw	fa5, 4(s0)
	addi	a0, s1, 6
	fcvt.s.w	fs9, a0
	fmul.s	fa0, fs0, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs5, fs4
	fmul.s	fa0, fs1, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs6, fs10
	fmul.s	fa0, fs2, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs7, fs10
	fmul.s	fa0, fs3, fs9
	call	cosf
	fmadd.s	fa5, fa0, fs8, fs10
	fsw	fa5, 8(s0)
	addi	a0, s1, 7
	fcvt.s.w	fs9, a0
	fmul.s	fa0, fs0, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs5, fs4
	fmul.s	fa0, fs1, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs6, fs10
	fmul.s	fa0, fs2, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs7, fs10
	fmul.s	fa0, fs3, fs9
	call	cosf
	fmadd.s	fa5, fa0, fs8, fs10
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
	flw	fs4, %lo(.LCPI0_0)(a0)
	lui	a0, %hi(.LCPI0_1)
	flw	fs5, %lo(.LCPI0_1)(a0)
	lui	a0, %hi(.LCPI0_2)
	flw	fs6, %lo(.LCPI0_2)(a0)
	lui	a0, %hi(.LCPI0_3)
	flw	fs7, %lo(.LCPI0_3)(a0)
	lui	a0, %hi(.LCPI0_4)
	flw	fs8, %lo(.LCPI0_4)(a0)
	slli	a0, s1, 2
	add	s2, s2, a0
.LBB0_7:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	fcvt.s.w	fs9, s1
	fmul.s	fa0, fs0, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs5, fs4
	fmul.s	fa0, fs1, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs6, fs10
	fmul.s	fa0, fs2, fs9
	call	cosf
	fmadd.s	fs10, fa0, fs7, fs10
	fmul.s	fa0, fs3, fs9
	call	cosf
	fmadd.s	fa5, fa0, fs8, fs10
	fsw	fa5, 0(s2)
	addi	s1, s1, 1
	addi	s2, s2, 4
	bne	s3, s1, .LBB0_7
.LBB0_8:
	lw	ra, 76(sp)                      # 4-byte Folded Reload
	lw	s0, 72(sp)                      # 4-byte Folded Reload
	lw	s1, 68(sp)                      # 4-byte Folded Reload
	lw	s2, 64(sp)                      # 4-byte Folded Reload
	lw	s3, 60(sp)                      # 4-byte Folded Reload
	lw	s4, 56(sp)                      # 4-byte Folded Reload
	flw	fs0, 52(sp)                     # 4-byte Folded Reload
	flw	fs1, 48(sp)                     # 4-byte Folded Reload
	flw	fs2, 44(sp)                     # 4-byte Folded Reload
	flw	fs3, 40(sp)                     # 4-byte Folded Reload
	flw	fs4, 36(sp)                     # 4-byte Folded Reload
	flw	fs5, 32(sp)                     # 4-byte Folded Reload
	flw	fs6, 28(sp)                     # 4-byte Folded Reload
	flw	fs7, 24(sp)                     # 4-byte Folded Reload
	flw	fs8, 20(sp)                     # 4-byte Folded Reload
	flw	fs9, 16(sp)                     # 4-byte Folded Reload
	flw	fs10, 12(sp)                    # 4-byte Folded Reload
	addi	sp, sp, 80
.LBB0_9:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	dsps_wind_flat_top_f32, .Lfunc_end0-dsps_wind_flat_top_f32
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"
	.section	".note.GNU-stack","",@progbits
