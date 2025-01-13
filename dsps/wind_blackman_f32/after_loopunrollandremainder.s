# 2024-12-26 10:17:43
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_wind_blackman_f32.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.section	.sdata,"aw",@progbits
	.p2align	2, 0x0                          # -- Begin function dsps_wind_blackman_f32_arp4
.LCPI0_0:
	.word	0x3ed70a3d                      # float 0.419999987
.LCPI0_1:
	.word	0x3da3d70a                      # float 0.0799999982
	.text
	.globl	dsps_wind_blackman_f32_arp4
	.p2align	1
	.type	dsps_wind_blackman_f32_arp4,@function
dsps_wind_blackman_f32_arp4:            # @dsps_wind_blackman_f32_arp4
# %bb.0:                                # %entry
	blez	a1, .LBB0_8
# %bb.1:                                # %for.body.lr.ph
	addi	sp, sp, -144
	sw	ra, 140(sp)                     # 4-byte Folded Spill
	sw	s0, 136(sp)                     # 4-byte Folded Spill
	sw	s1, 132(sp)                     # 4-byte Folded Spill
	sw	s2, 128(sp)                     # 4-byte Folded Spill
	sw	s3, 124(sp)                     # 4-byte Folded Spill
	sw	s4, 120(sp)                     # 4-byte Folded Spill
	fsw	fs0, 116(sp)                    # 4-byte Folded Spill
	fsw	fs1, 112(sp)                    # 4-byte Folded Spill
	fsw	fs2, 108(sp)                    # 4-byte Folded Spill
	fsw	fs3, 104(sp)                    # 4-byte Folded Spill
	fsw	fs4, 100(sp)                    # 4-byte Folded Spill
	fsw	fs5, 96(sp)                     # 4-byte Folded Spill
	fsw	fs6, 92(sp)                     # 4-byte Folded Spill
	fsw	fs7, 88(sp)                     # 4-byte Folded Spill
	fsw	fs8, 84(sp)                     # 4-byte Folded Spill
	fsw	fs9, 80(sp)                     # 4-byte Folded Spill
	fsw	fs10, 76(sp)                    # 4-byte Folded Spill
	fsw	fs11, 72(sp)                    # 4-byte Folded Spill
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
	li	a0, 8
	fadd.s	fs1, fa0, fa0
	li	s1, 0
	blt	s3, a0, .LBB0_4
# %bb.2:                                # %for.body.7.preheader
	addi	s4, s3, -7
	lui	a0, %hi(.LCPI0_0)
	flw	fs11, %lo(.LCPI0_0)(a0)
	lui	a0, %hi(.LCPI0_1)
	flw	fs2, %lo(.LCPI0_1)(a0)
	addi	s0, s2, 16
	lui	a0, 782336
	fmv.w.x	fs10, a0
.LBB0_3:                                # %for.body.7
                                        # =>This Inner Loop Header: Depth=1
	fcvt.s.w	fa5, s1
	addi	a0, s1, 1
	fcvt.s.w	fa4, a0
	addi	a0, s1, 2
	fcvt.s.w	fa3, a0
	addi	a0, s1, 3
	fcvt.s.w	fa2, a0
	addi	a0, s1, 4
	fcvt.s.w	fa1, a0
	addi	a0, s1, 5
	fcvt.s.w	ft0, a0
	addi	a0, s1, 6
	addi	a1, s1, 7
	addi	s1, s1, 8
	fcvt.s.w	ft1, a0
	fcvt.s.w	ft2, a1
	fmul.s	fa0, fs0, fa5
	fmul.s	fs4, fs0, fa4
	fmul.s	fs5, fs0, fa3
	fmul.s	fs7, fs0, fa2
	fmul.s	fs9, fs0, fa1
	fmul.s	fs3, fs0, ft0
	fmul.s	fs6, fs0, ft1
	fmul.s	fs8, fs0, ft2
	fmul.s	fa5, fs1, fa5
	fsw	fa5, 8(sp)                      # 4-byte Folded Spill
	fmul.s	fa5, fs1, fa4
	fsw	fa5, 12(sp)                     # 4-byte Folded Spill
	fmul.s	fa5, fs1, fa3
	fsw	fa5, 20(sp)                     # 4-byte Folded Spill
	fmul.s	fa5, fs1, fa2
	fsw	fa5, 32(sp)                     # 4-byte Folded Spill
	fmul.s	fa5, fs1, fa1
	fsw	fa5, 40(sp)                     # 4-byte Folded Spill
	fmul.s	fa5, fs1, ft0
	fsw	fa5, 48(sp)                     # 4-byte Folded Spill
	fmul.s	fa5, fs1, ft1
	fsw	fa5, 60(sp)                     # 4-byte Folded Spill
	fmul.s	fa5, fs1, ft2
	fsw	fa5, 68(sp)                     # 4-byte Folded Spill
	call	cosf
	fsw	fa0, 64(sp)                     # 4-byte Folded Spill
	fmv.s	fa0, fs4
	call	cosf
	fsw	fa0, 56(sp)                     # 4-byte Folded Spill
	fmv.s	fa0, fs5
	call	cosf
	fsw	fa0, 52(sp)                     # 4-byte Folded Spill
	fmv.s	fa0, fs7
	call	cosf
	fsw	fa0, 44(sp)                     # 4-byte Folded Spill
	fmv.s	fa0, fs9
	call	cosf
	fsw	fa0, 36(sp)                     # 4-byte Folded Spill
	fmv.s	fa0, fs3
	call	cosf
	fsw	fa0, 28(sp)                     # 4-byte Folded Spill
	fmv.s	fa0, fs6
	call	cosf
	fsw	fa0, 24(sp)                     # 4-byte Folded Spill
	fmv.s	fa0, fs8
	call	cosf
	fsw	fa0, 16(sp)                     # 4-byte Folded Spill
	flw	fa0, 8(sp)                      # 4-byte Folded Reload
	call	cosf
	fmv.s	fs9, fa0
	flw	fa0, 12(sp)                     # 4-byte Folded Reload
	call	cosf
	fmv.s	fs3, fa0
	flw	fa0, 20(sp)                     # 4-byte Folded Reload
	call	cosf
	fmv.s	fs6, fa0
	flw	fa0, 32(sp)                     # 4-byte Folded Reload
	call	cosf
	fmv.s	fs8, fa0
	flw	fa0, 40(sp)                     # 4-byte Folded Reload
	call	cosf
	fmv.s	fs4, fa0
	flw	fa0, 48(sp)                     # 4-byte Folded Reload
	call	cosf
	fmv.s	fs5, fa0
	flw	fa0, 60(sp)                     # 4-byte Folded Reload
	call	cosf
	fmv.s	fs7, fa0
	flw	fa0, 68(sp)                     # 4-byte Folded Reload
	call	cosf
	flw	fa5, 64(sp)                     # 4-byte Folded Reload
	fmadd.s	fa5, fa5, fs10, fs11
	fmadd.s	fa5, fs9, fs2, fa5
	flw	fa4, 56(sp)                     # 4-byte Folded Reload
	fmadd.s	fa4, fa4, fs10, fs11
	fmadd.s	fa4, fs3, fs2, fa4
	flw	fa3, 52(sp)                     # 4-byte Folded Reload
	fmadd.s	fa3, fa3, fs10, fs11
	fmadd.s	fa3, fs6, fs2, fa3
	flw	fa2, 44(sp)                     # 4-byte Folded Reload
	fmadd.s	fa2, fa2, fs10, fs11
	fmadd.s	fa2, fs8, fs2, fa2
	flw	fa1, 36(sp)                     # 4-byte Folded Reload
	fmadd.s	fa1, fa1, fs10, fs11
	fmadd.s	fa1, fs4, fs2, fa1
	flw	ft0, 28(sp)                     # 4-byte Folded Reload
	fmadd.s	ft0, ft0, fs10, fs11
	fmadd.s	ft0, fs5, fs2, ft0
	flw	ft1, 24(sp)                     # 4-byte Folded Reload
	fmadd.s	ft1, ft1, fs10, fs11
	fmadd.s	ft1, fs7, fs2, ft1
	flw	ft2, 16(sp)                     # 4-byte Folded Reload
	fmadd.s	ft2, ft2, fs10, fs11
	fmadd.s	fa0, fa0, fs2, ft2
	fsw	fa5, -16(s0)
	fsw	fa4, -12(s0)
	fsw	fa3, -8(s0)
	fsw	fa2, -4(s0)
	fsw	fa1, 0(s0)
	fsw	ft0, 4(s0)
	fsw	ft1, 8(s0)
	fsw	fa0, 12(s0)
	addi	s0, s0, 32
	blt	s1, s4, .LBB0_3
.LBB0_4:                                # %for.cond97.preheader
	bge	s1, s3, .LBB0_7
# %bb.5:                                # %for.body.clone.preheader
	slli	a0, s1, 2
	lui	a1, %hi(.LCPI0_0)
	flw	fs2, %lo(.LCPI0_0)(a1)
	lui	a1, %hi(.LCPI0_1)
	flw	fs3, %lo(.LCPI0_1)(a1)
	add	s2, s2, a0
	lui	a0, 782336
	fmv.w.x	fs4, a0
.LBB0_6:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	fcvt.s.w	fs5, s1
	fmul.s	fa0, fs0, fs5
	call	cosf
	fmadd.s	fs6, fa0, fs4, fs2
	fmul.s	fa0, fs1, fs5
	call	cosf
	fmadd.s	fa5, fa0, fs3, fs6
	fsw	fa5, 0(s2)
	addi	s1, s1, 1
	addi	s2, s2, 4
	bne	s3, s1, .LBB0_6
.LBB0_7:
	lw	ra, 140(sp)                     # 4-byte Folded Reload
	lw	s0, 136(sp)                     # 4-byte Folded Reload
	lw	s1, 132(sp)                     # 4-byte Folded Reload
	lw	s2, 128(sp)                     # 4-byte Folded Reload
	lw	s3, 124(sp)                     # 4-byte Folded Reload
	lw	s4, 120(sp)                     # 4-byte Folded Reload
	flw	fs0, 116(sp)                    # 4-byte Folded Reload
	flw	fs1, 112(sp)                    # 4-byte Folded Reload
	flw	fs2, 108(sp)                    # 4-byte Folded Reload
	flw	fs3, 104(sp)                    # 4-byte Folded Reload
	flw	fs4, 100(sp)                    # 4-byte Folded Reload
	flw	fs5, 96(sp)                     # 4-byte Folded Reload
	flw	fs6, 92(sp)                     # 4-byte Folded Reload
	flw	fs7, 88(sp)                     # 4-byte Folded Reload
	flw	fs8, 84(sp)                     # 4-byte Folded Reload
	flw	fs9, 80(sp)                     # 4-byte Folded Reload
	flw	fs10, 76(sp)                    # 4-byte Folded Reload
	flw	fs11, 72(sp)                    # 4-byte Folded Reload
	addi	sp, sp, 144
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	dsps_wind_blackman_f32_arp4, .Lfunc_end0-dsps_wind_blackman_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"
	.section	".note.GNU-stack","",@progbits
