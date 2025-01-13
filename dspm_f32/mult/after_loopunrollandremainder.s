.option	arch, -zcb, +zcmp
# 2024-12-23 10:01:15
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspm_mult_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dspm_mult_f32_arp4              # -- Begin function dspm_mult_f32_arp4
	.p2align	1
	.type	dspm_mult_f32_arp4,@function
dspm_mult_f32_arp4:                     # @dspm_mult_f32_arp4
# %bb.0:                                # %entry
	blez	a3, .LBB0_9
# %bb.1:                                # %for.cond1.preheader.lr.ph
	addi	sp, sp, -32
	sw	s0, 28(sp)                      # 4-byte Folded Spill
	sw	s1, 24(sp)                      # 4-byte Folded Spill
	sw	s2, 20(sp)                      # 4-byte Folded Spill
	sw	s3, 16(sp)                      # 4-byte Folded Spill
	sw	s4, 12(sp)                      # 4-byte Folded Spill
	sw	s5, 8(sp)                       # 4-byte Folded Spill
	li	a6, 0
	addi	a7, a4, -1
	slli	t0, a5, 2
	add	t1, a1, t0
	addi	t2, a0, 4
	slli	t3, a4, 2
	li	t4, 2
	j	.LBB0_3
.LBB0_2:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_3 Depth=1
	addi	a6, a6, 1
	add	t2, t2, t3
	beq	a6, a3, .LBB0_8
.LBB0_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_7 Depth 3
	blez	a5, .LBB0_2
# %bb.4:                                # %for.body4.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	li	t5, 0
	mul	s1, a6, a4
	slli	t6, s1, 2
	add	t6, t6, a0
	mul	s0, a6, a5
	slli	s0, s0, 2
	add	s2, a2, s0
	mv	s3, t1
	j	.LBB0_6
.LBB0_5:                                # %for.cond.cleanup11
                                        #   in Loop: Header=BB0_6 Depth=2
	addi	t5, t5, 1
	addi	s3, s3, 4
	beq	t5, a5, .LBB0_2
.LBB0_6:                                # %for.body4
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_7 Depth 3
	flw	fa5, 0(t6)
	slli	s4, t5, 2
	add	s0, a1, s4
	flw	fa4, 0(s0)
	fmul.s	fa5, fa5, fa4
	add	s4, s4, s2
	fsw	fa5, 0(s4)
	mv	s5, t2
	mv	s0, s3
	mv	s1, a7
	blt	a4, t4, .LBB0_5
.LBB0_7:                                # %for.body12
                                        #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	flw	fa4, 0(s5)
	flw	fa3, 0(s0)
	fmadd.s	fa5, fa4, fa3, fa5
	fsw	fa5, 0(s4)
	addi	s1, s1, -1
	add	s0, s0, t0
	addi	s5, s5, 4
	bnez	s1, .LBB0_7
	j	.LBB0_5
.LBB0_8:
	lw	s0, 28(sp)                      # 4-byte Folded Reload
	lw	s1, 24(sp)                      # 4-byte Folded Reload
	lw	s2, 20(sp)                      # 4-byte Folded Reload
	lw	s3, 16(sp)                      # 4-byte Folded Reload
	lw	s4, 12(sp)                      # 4-byte Folded Reload
	lw	s5, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 32
.LBB0_9:                                # %for.cond.cleanup
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dspm_mult_f32_arp4, .Lfunc_end0-dspm_mult_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-13-g45f4abc)"
	.section	".note.GNU-stack","",@progbits
