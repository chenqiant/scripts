# 2024-12-26 11:31:39
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_wind_hann_f32.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_wind_hann_f32_arp4         # -- Begin function dsps_wind_hann_f32_arp4
	.p2align	1
	.type	dsps_wind_hann_f32_arp4,@function
dsps_wind_hann_f32_arp4:                # @dsps_wind_hann_f32_arp4
# %bb.0:                                # %entry
	blez	a1, .LBB0_8
# %bb.1:                                # %for.body.lr.ph
	addi	sp, sp, -48
	sw	ra, 44(sp)                      # 4-byte Folded Spill
	sw	s0, 40(sp)                      # 4-byte Folded Spill
	sw	s1, 36(sp)                      # 4-byte Folded Spill
	sw	s2, 32(sp)                      # 4-byte Folded Spill
	sw	s3, 28(sp)                      # 4-byte Folded Spill
	sw	s4, 24(sp)                      # 4-byte Folded Spill
	fsw	fs0, 20(sp)                     # 4-byte Folded Spill
	fsw	fs1, 16(sp)                     # 4-byte Folded Spill
	fsw	fs2, 12(sp)                     # 4-byte Folded Spill
	mv	s3, a1
	mv	s2, a0
	addi	a0, a1, -1
	fcvt.s.w	fa5, a0
	lui	a0, 260096
	fmv.w.x	fs1, a0
	fdiv.s	fa0, fs1, fa5
	call	__extendsfdf2
	lui	a2, 345155
	addi	a2, a2, -744
	lui	a3, 262546
	addi	a3, a3, 507
	call	__muldf3
	call	__truncdfsf2
	li	a0, 8
	fmv.s	fs0, fa0
	li	s1, 0
	blt	s3, a0, .LBB0_4
# %bb.2:                                # %for.body.7.preheader
	addi	s4, s3, -7
	addi	s0, s2, 16
	lui	a0, 258048
	fmv.w.x	fs2, a0
.LBB0_3:                                # %for.body.7
                                        # =>This Inner Loop Header: Depth=1
	fcvt.s.w	fa5, s1
	fmul.s	fa0, fs0, fa5
	call	cosf
	fsub.s	fa5, fs1, fa0
	fmul.s	fa5, fa5, fs2
	fsw	fa5, -16(s0)
	addi	a0, s1, 1
	fcvt.s.w	fa5, a0
	fmul.s	fa0, fs0, fa5
	call	cosf
	fsub.s	fa5, fs1, fa0
	fmul.s	fa5, fa5, fs2
	fsw	fa5, -12(s0)
	addi	a0, s1, 2
	fcvt.s.w	fa5, a0
	fmul.s	fa0, fs0, fa5
	call	cosf
	fsub.s	fa5, fs1, fa0
	fmul.s	fa5, fa5, fs2
	fsw	fa5, -8(s0)
	addi	a0, s1, 3
	fcvt.s.w	fa5, a0
	fmul.s	fa0, fs0, fa5
	call	cosf
	fsub.s	fa5, fs1, fa0
	fmul.s	fa5, fa5, fs2
	fsw	fa5, -4(s0)
	addi	a0, s1, 4
	fcvt.s.w	fa5, a0
	fmul.s	fa0, fs0, fa5
	call	cosf
	fsub.s	fa5, fs1, fa0
	fmul.s	fa5, fa5, fs2
	fsw	fa5, 0(s0)
	addi	a0, s1, 5
	fcvt.s.w	fa5, a0
	fmul.s	fa0, fs0, fa5
	call	cosf
	fsub.s	fa5, fs1, fa0
	fmul.s	fa5, fa5, fs2
	fsw	fa5, 4(s0)
	addi	a0, s1, 6
	fcvt.s.w	fa5, a0
	fmul.s	fa0, fs0, fa5
	call	cosf
	fsub.s	fa5, fs1, fa0
	fmul.s	fa5, fa5, fs2
	fsw	fa5, 8(s0)
	addi	a0, s1, 7
	fcvt.s.w	fa5, a0
	fmul.s	fa0, fs0, fa5
	call	cosf
	fsub.s	fa5, fs1, fa0
	fmul.s	fa5, fa5, fs2
	fsw	fa5, 12(s0)
	addi	s1, s1, 8
	addi	s0, s0, 32
	blt	s1, s4, .LBB0_3
.LBB0_4:                                # %for.cond97.preheader
	bge	s1, s3, .LBB0_7
# %bb.5:                                # %for.body.clone.preheader
	slli	a0, s1, 2
	add	s2, s2, a0
	lui	a0, 260096
	fmv.w.x	fs1, a0
	lui	a0, 258048
	fmv.w.x	fs2, a0
.LBB0_6:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	fcvt.s.w	fa5, s1
	fmul.s	fa0, fs0, fa5
	call	cosf
	fsub.s	fa5, fs1, fa0
	fmul.s	fa5, fa5, fs2
	fsw	fa5, 0(s2)
	addi	s1, s1, 1
	addi	s2, s2, 4
	bne	s3, s1, .LBB0_6
.LBB0_7:
	lw	ra, 44(sp)                      # 4-byte Folded Reload
	lw	s0, 40(sp)                      # 4-byte Folded Reload
	lw	s1, 36(sp)                      # 4-byte Folded Reload
	lw	s2, 32(sp)                      # 4-byte Folded Reload
	lw	s3, 28(sp)                      # 4-byte Folded Reload
	lw	s4, 24(sp)                      # 4-byte Folded Reload
	flw	fs0, 20(sp)                     # 4-byte Folded Reload
	flw	fs1, 16(sp)                     # 4-byte Folded Reload
	flw	fs2, 12(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 48
.LBB0_8:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	dsps_wind_hann_f32_arp4, .Lfunc_end0-dsps_wind_hann_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"
	.section	".note.GNU-stack","",@progbits
