# 2024-10-10 18:59:14
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fir_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fir_f32_arp4               # -- Begin function dsps_fir_f32_arp4
	.p2align	1
	.type	dsps_fir_f32_arp4,@function
dsps_fir_f32_arp4:                      # @dsps_fir_f32_arp4
# %bb.0:                                # %entry
	addi	sp, sp, -48
	sw	s0, 44(sp)                      # 4-byte Folded Spill
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	sw	s2, 36(sp)                      # 4-byte Folded Spill
	sw	s3, 32(sp)                      # 4-byte Folded Spill
	sw	s4, 28(sp)                      # 4-byte Folded Spill
	fsw	fs0, 24(sp)                     # 4-byte Folded Spill
	fsw	fs1, 20(sp)                     # 4-byte Folded Spill
	fsw	fs2, 16(sp)                     # 4-byte Folded Spill
	fsw	fs3, 12(sp)                     # 4-byte Folded Spill
	fsw	fs4, 8(sp)                      # 4-byte Folded Spill
	li	a4, 3
	blt	a3, a4, .LBB0_17
# %bb.1:                                # %for.cond.preheader
	lw	a7, 8(a0)
	lw	a6, 4(a0)
	li	t2, 0
	addi	t6, a7, -7
	lw	s2, 12(a0)
	addi	t0, a6, 16
	fmv.w.x	fa5, zero
	li	t1, 7
	lui	t3, 524288
	addi	t3, t3, -8
	j	.LBB0_3
.LBB0_2:                                # %for.end
                                        #   in Loop: Header=BB0_3 Depth=1
	fadd.s	fa4, fa3, fa4
	fadd.s	fa4, fa2, fa4
	fadd.s	fa4, fa1, fa4
	fadd.s	fa4, fa0, fa4
	fadd.s	fa4, ft0, fa4
	fadd.s	fa4, ft1, fa4
	fadd.s	fa4, ft2, fa4
	add	t4, t4, a2
	addi	t2, t2, 1
	fsw	fa4, 0(t4)
	beq	t2, a3, .LBB0_28
.LBB0_3:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_8 Depth 2
                                        #     Child Loop BB0_12 Depth 2
                                        #     Child Loop BB0_16 Depth 2
	slli	t4, t2, 2
	add	a4, a1, t4
	flw	fa4, 0(a4)
	li	a4, 0
	slli	a5, s2, 2
	add	a5, a5, a6
	fsw	fa4, 0(a5)
	addi	s2, s2, 1
	slt	a5, s2, a7
	neg	a5, a5
	and	s2, a5, s2
	sw	s2, 12(a0)
	slli	t5, s2, 2
	mv	s0, s2
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
	bge	s2, t6, .LBB0_6
# %bb.4:                                # %for.body11.lr.ph.modify
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a5, 0(a0)
	li	a4, 0
	addi	a5, a5, 16
	add	s1, t0, t5
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
.LBB0_5:                                # %for.body11.modify
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -16(a5)
	flw	ft4, -16(s1)
	flw	ft5, -12(a5)
	flw	ft6, -12(s1)
	flw	ft7, -8(a5)
	flw	fa6, -8(s1)
	flw	fa7, -4(a5)
	flw	ft8, -4(s1)
	flw	ft9, 0(a5)
	flw	ft10, 0(s1)
	flw	ft11, 4(a5)
	flw	fs0, 4(s1)
	flw	fs1, 8(a5)
	flw	fs2, 8(s1)
	flw	fs3, 12(a5)
	flw	fs4, 12(s1)
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	fmadd.s	fa0, ft9, ft10, fa0
	fmadd.s	ft0, ft11, fs0, ft0
	fmadd.s	ft1, fs1, fs2, ft1
	fmadd.s	ft2, fs3, fs4, ft2
	addi	a4, a4, 8
	add	s0, s2, a4
	addi	a5, a5, 32
	addi	s1, s1, 32
	blt	s0, t6, .LBB0_5
.LBB0_6:                                # %for.cond18.preheader.modify
                                        #   in Loop: Header=BB0_3 Depth=1
	bge	s0, a7, .LBB0_10
# %bb.7:                                # %for.body11.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s4, 0(a0)
	add	s3, a7, a4
	sub	s1, a7, s0
	slli	a5, s0, 2
	add	a5, a5, a6
	slli	a4, a4, 2
	add	a4, a4, s4
.LBB0_8:                                # %for.body11
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(a4)
	flw	ft4, 0(a5)
	fmadd.s	fa4, ft3, ft4, fa4
	addi	s1, s1, -1
	addi	a5, a5, 4
	addi	a4, a4, 4
	bnez	s1, .LBB0_8
# %bb.9:                                # %for.cond18.preheader.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	sub	a4, s3, s0
.LBB0_10:                               # %for.cond18.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	bge	t1, s2, .LBB0_14
# %bb.11:                               # %for.body22.lr.ph.modify
                                        #   in Loop: Header=BB0_3 Depth=1
	li	s1, 0
	lw	a5, 0(a0)
	addi	s4, s2, -7
	and	s3, s2, t3
	slli	s0, a4, 2
	add	a5, a5, s0
	addi	s0, a5, 16
	mv	a5, t0
.LBB0_12:                               # %for.body22.modify
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -16(s0)
	flw	ft4, -16(a5)
	flw	ft5, -12(s0)
	flw	ft6, -12(a5)
	flw	ft7, -8(s0)
	flw	fa6, -8(a5)
	flw	fa7, -4(s0)
	flw	ft8, -4(a5)
	flw	ft9, 0(s0)
	flw	ft10, 0(a5)
	flw	ft11, 4(s0)
	flw	fs0, 4(a5)
	flw	fs1, 8(s0)
	flw	fs2, 8(a5)
	flw	fs3, 12(s0)
	flw	fs4, 12(a5)
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	fmadd.s	fa0, ft9, ft10, fa0
	fmadd.s	ft0, ft11, fs0, ft0
	fmadd.s	ft1, fs1, fs2, ft1
	fmadd.s	ft2, fs3, fs4, ft2
	addi	s1, s1, 8
	addi	s0, s0, 32
	addi	a5, a5, 32
	blt	s1, s4, .LBB0_12
# %bb.13:                               # %for.cond.cleanup21.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	add	a4, a4, s1
	bge	s3, s2, .LBB0_2
	j	.LBB0_15
.LBB0_14:                               #   in Loop: Header=BB0_3 Depth=1
	li	s3, 0
	blez	s2, .LBB0_2
.LBB0_15:                               # %for.body22.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s0, 0(a0)
	slli	a5, s3, 2
	add	a5, a5, a6
	slli	a4, a4, 2
	add	a4, a4, s0
	add	t5, t5, a6
.LBB0_16:                               # %for.body22
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(a4)
	flw	ft4, 0(a5)
	fmadd.s	fa4, ft3, ft4, fa4
	addi	a5, a5, 4
	addi	a4, a4, 4
	bne	a5, t5, .LBB0_16
	j	.LBB0_2
.LBB0_17:                               # %for.body.lr.ph.clone.preheader
	blez	a3, .LBB0_28
# %bb.18:                               # %for.body.lr.ph.clone
	lw	a6, 4(a0)
	lw	a7, 8(a0)
	lw	s0, 12(a0)
	li	t2, 0
	fmv.w.x	fa5, zero
	j	.LBB0_20
.LBB0_19:                               # %for.cond.cleanup21.clone
                                        #   in Loop: Header=BB0_20 Depth=1
	add	t0, t0, a2
	addi	t2, t2, 1
	fsw	fa4, 0(t0)
	beq	t2, a3, .LBB0_28
.LBB0_20:                               # %for.body.clone
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_22 Depth 2
                                        #     Child Loop BB0_27 Depth 2
	slli	t0, t2, 2
	add	a4, a1, t0
	flw	fa4, 0(a4)
	slli	a4, s0, 2
	add	a4, a4, a6
	fsw	fa4, 0(a4)
	addi	s0, s0, 1
	slt	a4, s0, a7
	neg	a4, a4
	and	s0, s0, a4
	sw	s0, 12(a0)
	slli	t1, s0, 2
	fmv.s	fa4, fa5
	bge	s0, a7, .LBB0_23
# %bb.21:                               # %for.body11.lr.ph.clone
                                        #   in Loop: Header=BB0_20 Depth=1
	lw	a5, 0(a0)
	sub	s1, a7, s0
	add	a4, a6, t1
	fmv.s	fa4, fa5
.LBB0_22:                               # %for.body11.clone
                                        #   Parent Loop BB0_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a5)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a4, a4, 4
	addi	s1, s1, -1
	addi	a5, a5, 4
	bnez	s1, .LBB0_22
.LBB0_23:                               # %for.cond18.preheader.clone
                                        #   in Loop: Header=BB0_20 Depth=1
	blez	s0, .LBB0_19
# %bb.24:                               # %for.body22.lr.ph.clone
                                        #   in Loop: Header=BB0_20 Depth=1
	mv	a4, s0
	blt	a7, s0, .LBB0_26
# %bb.25:                               # %for.body22.lr.ph.clone
                                        #   in Loop: Header=BB0_20 Depth=1
	mv	a4, a7
.LBB0_26:                               # %for.body22.lr.ph.clone
                                        #   in Loop: Header=BB0_20 Depth=1
	lw	a5, 0(a0)
	slli	a4, a4, 2
	sub	a4, a4, t1
	add	a4, a4, a5
	add	t1, t1, a6
	mv	a5, a6
.LBB0_27:                               # %for.body22.clone
                                        #   Parent Loop BB0_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a4)
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, 4
	addi	a4, a4, 4
	bne	a5, t1, .LBB0_27
	j	.LBB0_19
.LBB0_28:                               # %if.end
	li	a0, 0
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	flw	fs0, 24(sp)                     # 4-byte Folded Reload
	flw	fs1, 20(sp)                     # 4-byte Folded Reload
	flw	fs2, 16(sp)                     # 4-byte Folded Reload
	flw	fs3, 12(sp)                     # 4-byte Folded Reload
	flw	fs4, 8(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	dsps_fir_f32_arp4, .Lfunc_end0-dsps_fir_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-156-ge5ec068 esp-18.1.2_20240912-172-g9dacbc0)"
	.section	".note.GNU-stack","",@progbits
