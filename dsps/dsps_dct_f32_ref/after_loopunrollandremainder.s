# 2024-10-23 15:56:33
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_dct_f32_ref.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_dct_f32_ref                # -- Begin function dsps_dct_f32_ref
	.p2align	1
	.type	dsps_dct_f32_ref,@function
dsps_dct_f32_ref:                       # @dsps_dct_f32_ref
# %bb.0:                                # %entry
	addi	sp, sp, -64
	sw	ra, 60(sp)                      # 4-byte Folded Spill
	sw	s0, 56(sp)                      # 4-byte Folded Spill
	sw	s1, 52(sp)                      # 4-byte Folded Spill
	sw	s2, 48(sp)                      # 4-byte Folded Spill
	sw	s3, 44(sp)                      # 4-byte Folded Spill
	sw	s4, 40(sp)                      # 4-byte Folded Spill
	sw	s5, 36(sp)                      # 4-byte Folded Spill
	sw	s6, 32(sp)                      # 4-byte Folded Spill
	sw	s7, 28(sp)                      # 4-byte Folded Spill
	sw	s8, 24(sp)                      # 4-byte Folded Spill
	sw	s9, 20(sp)                      # 4-byte Folded Spill
	sw	s10, 16(sp)                     # 4-byte Folded Spill
	fsw	fs0, 12(sp)                     # 4-byte Folded Spill
	fsw	fs1, 8(sp)                      # 4-byte Folded Spill
	fsw	fs2, 4(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 64
	mv	s2, a2
	mv	s4, a1
	mv	s3, a0
	slli	a0, a1, 3
	addi	a0, a0, 15
	andi	a0, a0, -16
	sub	s7, sp, a0
	mv	sp, s7
	mv	a0, a1
	call	__floatsidf
	mv	a2, a0
	mv	a3, a1
	lui	a0, 345155
	addi	a0, a0, -744
	lui	a1, 262290
	addi	a1, a1, 507
	call	__divdf3
	blez	s4, .LBB0_8
# %bb.1:                                # %for.body7.preheader
	mv	s5, a0
	mv	s6, a1
	li	s8, 0
	lui	a0, 258048
	fmv.w.x	fs0, a0
	mv	s1, s7
.LBB0_2:                                # %for.body7
                                        # =>This Inner Loop Header: Depth=1
	fcvt.s.w	fa5, s8
	fadd.s	fa0, fa5, fs0
	call	__extendsfdf2
	mv	a2, a0
	mv	a3, a1
	mv	a0, s5
	mv	a1, s6
	call	__muldf3
	sw	a1, 4(s1)
	sw	a0, 0(s1)
	addi	s8, s8, 1
	addi	s1, s1, 4
	bne	s4, s8, .LBB0_2
# %bb.3:                                # %for.cond3.preheader.lr.ph
	blez	s4, .LBB0_8
# %bb.4:                                # %for.cond3.preheader.preheader
	li	s5, 0
	slli	s8, s4, 2
	add	s8, s8, s3
	fmv.w.x	fs0, zero
.LBB0_5:                                # %for.cond3.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	mv	a0, s5
	call	__floatunsidf
	mv	s6, a0
	mv	s9, a1
	mv	s10, s7
	mv	s1, s3
	fmv.s	fs1, fs0
.LBB0_6:                                # %for.body14.us
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, 0(s10)
	lw	a1, 4(s10)
	flw	fs2, 0(s1)
	mv	a2, s6
	mv	a3, s9
	call	__muldf3
	call	__truncdfsf2
	call	cosf
	fmadd.s	fs1, fs2, fa0, fs1
	addi	s1, s1, 4
	addi	s10, s10, 8
	bne	s1, s8, .LBB0_6
# %bb.7:                                # %for.cond.cleanup6
                                        #   in Loop: Header=BB0_5 Depth=1
	slli	a0, s5, 2
	add	a0, a0, s2
	addi	s5, s5, 1
	fsw	fs1, 0(a0)
	bne	s5, s4, .LBB0_5
.LBB0_8:                                # %for.cond.cleanup
	li	a0, 0
	addi	sp, s0, -64
	lw	ra, 60(sp)                      # 4-byte Folded Reload
	lw	s0, 56(sp)                      # 4-byte Folded Reload
	lw	s1, 52(sp)                      # 4-byte Folded Reload
	lw	s2, 48(sp)                      # 4-byte Folded Reload
	lw	s3, 44(sp)                      # 4-byte Folded Reload
	lw	s4, 40(sp)                      # 4-byte Folded Reload
	lw	s5, 36(sp)                      # 4-byte Folded Reload
	lw	s6, 32(sp)                      # 4-byte Folded Reload
	lw	s7, 28(sp)                      # 4-byte Folded Reload
	lw	s8, 24(sp)                      # 4-byte Folded Reload
	lw	s9, 20(sp)                      # 4-byte Folded Reload
	lw	s10, 16(sp)                     # 4-byte Folded Reload
	flw	fs0, 12(sp)                     # 4-byte Folded Reload
	flw	fs1, 8(sp)                      # 4-byte Folded Reload
	flw	fs2, 4(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end0:
	.size	dsps_dct_f32_ref, .Lfunc_end0-dsps_dct_f32_ref
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17)"
	.section	".note.GNU-stack","",@progbits
