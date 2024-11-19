# 2024-11-19 14:52:49
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_ccorr_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_ccorr_f32_arp4             # -- Begin function dsps_ccorr_f32_arp4
	.p2align	1
	.type	dsps_ccorr_f32_arp4,@function
dsps_ccorr_f32_arp4:                    # @dsps_ccorr_f32_arp4
# %bb.0:                                # %entry
	lui	a5, 112
	addi	a5, a5, 3
	beqz	a0, .LBB0_42
# %bb.1:                                # %entry
	beqz	a2, .LBB0_42
# %bb.2:                                # %entry
	beqz	a4, .LBB0_42
# %bb.3:                                # %if.end6
	bge	a1, a3, .LBB0_5
# %bb.4:                                # %if.then8
	mv	t3, a1
	mv	a6, a3
	mv	a7, a0
	j	.LBB0_6
.LBB0_5:
	mv	t3, a3
	mv	a6, a1
	mv	a7, a2
	mv	a2, a0
.LBB0_6:                                # %if.end9
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
	slli	t0, t3, 2
	blez	t3, .LBB0_17
# %bb.7:                                # %for.body.preheader
	li	a0, 0
	add	s4, t0, a7
	addi	s3, s4, 12
	addi	t2, a2, 16
	addi	t1, a2, 48
	addi	s4, s4, -4
	lui	t4, 524288
	addi	t4, t4, -8
	fmv.w.x	fa5, zero
	esp.lp.setup	 1, t3, .LBB0_16
.LBB0_8:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #     Child Loop BB0_14 Depth 2
	slli	s2, a0, 2
	andi	t6, s2, -32
	and	a5, a0, t4
	add	t5, a4, s2
	fmv.s	fa4, fa5
	beqz	a5, .LBB0_13
# %bb.9:                                # %for.body14.7.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	addi	a5, t6, -4
	andi	a5, a5, -32
	add	s1, t1, a5
	mv	a5, t2
	mv	s0, s3
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
	sub	t3, s1, a5
	srli	t3, t3, 5
	esp.lp.setup	 0, t3, .LBB0_11
.LBB0_10:                               # %for.body14.7
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -16(a5)
	flw	ft4, -16(s0)
	flw	ft5, -12(a5)
	flw	ft6, -12(s0)
	flw	ft7, -8(a5)
	flw	fa6, -8(s0)
	flw	fa7, -4(a5)
	flw	ft8, -4(s0)
	flw	ft9, 0(a5)
	flw	ft10, 0(s0)
	flw	ft11, 4(a5)
	flw	fs0, 4(s0)
	flw	fs1, 8(a5)
	flw	fs2, 8(s0)
	flw	fs3, 12(a5)
	flw	fs4, 12(s0)
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	fmadd.s	fa0, ft9, ft10, fa0
	fmadd.s	ft0, ft11, fs0, ft0
	fmadd.s	ft1, fs1, fs2, ft1
	fmadd.s	ft2, fs3, fs4, ft2
	addi	a5, a5, 32
.LBB0_11:                               # %for.body14.7
                                        #   in Loop: Header=BB0_10 Depth=2
                                        # Label of block must be emitted
	addi	s0, s0, 32
# %bb.12:                               # %for.end8
                                        #   in Loop: Header=BB0_8 Depth=1
	fadd.s	fa4, fa4, fa3
	fadd.s	fa3, fa2, fa1
	fadd.s	fa2, fa0, ft0
	fadd.s	fa1, ft1, ft2
	fadd.s	fa4, fa4, fa3
	fadd.s	fa3, fa2, fa1
	fadd.s	fa4, fa4, fa3
	fsw	fa4, 0(t5)
.LBB0_13:                               # %for.body14.clone.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	add	a5, s2, a2
	addi	a5, a5, 4
	add	s0, s4, t6
	add	t6, t6, a2
.LBB0_14:                               # %for.body14.clone
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(t6)
	flw	fa2, 0(s0)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	t6, t6, 4
	addi	s0, s0, 4
	bne	t6, a5, .LBB0_14
# %bb.15:                               # %for.cond.for.end_crit_edge
                                        #   in Loop: Header=BB0_8 Depth=1
	fsw	fa4, 0(t5)
	addi	a0, a0, 1
	addi	s3, s3, -4
.LBB0_16:                               # %for.cond.for.end_crit_edge
                                        #   in Loop: Header=BB0_8 Depth=1
                                        # Label of block must be emitted
	addi	s4, s4, -4
.LBB0_17:                               # %for.cond22.preheader
	bge	t3, a6, .LBB0_29
# %bb.18:                               # %for.body25.preheader
	andi	t1, t3, -16
	addi	t5, a2, 32
	addi	t2, a7, 32
	li	t4, -1
	fmv.w.x	fa5, zero
	mv	t6, t3
	j	.LBB0_20
.LBB0_19:                               # %for.end40
                                        #   in Loop: Header=BB0_20 Depth=1
	addi	t6, t6, 1
	addi	t5, t5, 4
	addi	t4, t4, -1
	beq	t6, a6, .LBB0_29
.LBB0_20:                               # %for.body25
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_22 Depth 2
                                        #     Child Loop BB0_27 Depth 2
	sub	a0, t6, t3
	addi	a0, a0, 1
	add	a5, a0, t1
	bgeu	a0, a5, .LBB0_25
# %bb.21:                               # %for.body33.preheader
                                        #   in Loop: Header=BB0_20 Depth=1
	mv	s0, t2
	mv	s1, t5
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
	sub	t3, a5, a0
	srli	t3, t3, 4
	esp.lp.setup	 0, t3, .LBB0_23
.LBB0_22:                               # %for.body33.15
                                        #   Parent Loop BB0_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft9, -28(s1)
	flw	ft10, -32(s0)
	flw	ft11, -24(s1)
	flw	fs0, -28(s0)
	flw	fs1, -20(s1)
	flw	fs2, -24(s0)
	flw	fs3, -16(s1)
	flw	fs4, -20(s0)
	fmadd.s	fa4, ft9, ft10, fa4
	flw	ft9, -12(s1)
	flw	ft10, -16(s0)
	fmadd.s	fa3, ft11, fs0, fa3
	flw	ft11, -8(s1)
	flw	fs0, -12(s0)
	fmadd.s	fa2, fs1, fs2, fa2
	flw	fs1, -4(s1)
	flw	fs2, -8(s0)
	fmadd.s	fa1, fs3, fs4, fa1
	flw	fs3, 0(s1)
	flw	fs4, -4(s0)
	fmadd.s	fa0, ft9, ft10, fa0
	flw	ft9, 4(s1)
	flw	ft10, 0(s0)
	fmadd.s	ft0, ft11, fs0, ft0
	flw	ft11, 8(s1)
	flw	fs0, 4(s0)
	fmadd.s	ft1, fs1, fs2, ft1
	flw	fs1, 12(s1)
	flw	fs2, 8(s0)
	fmadd.s	ft2, fs3, fs4, ft2
	flw	fs3, 16(s1)
	flw	fs4, 12(s0)
	fmadd.s	ft3, ft9, ft10, ft3
	flw	ft9, 20(s1)
	flw	ft10, 16(s0)
	fmadd.s	ft4, ft11, fs0, ft4
	flw	ft11, 24(s1)
	flw	fs0, 20(s0)
	fmadd.s	ft5, fs1, fs2, ft5
	flw	fs1, 28(s1)
	flw	fs2, 24(s0)
	fmadd.s	ft6, fs3, fs4, ft6
	flw	fs3, 32(s1)
	flw	fs4, 28(s0)
	fmadd.s	ft7, ft9, ft10, ft7
	fmadd.s	fa6, ft11, fs0, fa6
	fmadd.s	fa7, fs1, fs2, fa7
	fmadd.s	ft8, fs3, fs4, ft8
	addi	a0, a0, 16
	addi	s1, s1, 64
.LBB0_23:                               # %for.body33.15
                                        #   in Loop: Header=BB0_22 Depth=2
                                        # Label of block must be emitted
	addi	s0, s0, 64
# %bb.24:                               # %for.end40.loopexit
                                        #   in Loop: Header=BB0_20 Depth=1
	fadd.s	fa4, fa4, fa3
	fadd.s	fa3, fa2, fa1
	fadd.s	fa2, fa0, ft0
	fadd.s	fa1, ft1, ft2
	fadd.s	fa0, ft3, ft4
	fadd.s	ft0, ft5, ft6
	fadd.s	ft1, ft7, fa6
	fadd.s	ft2, fa7, ft8
	fadd.s	fa4, fa4, fa3
	fadd.s	fa3, fa2, fa1
	fadd.s	fa2, fa0, ft0
	fadd.s	fa1, ft1, ft2
	fadd.s	fa4, fa4, fa3
	fadd.s	fa3, fa2, fa1
	fadd.s	fa4, fa4, fa3
	slli	a5, t6, 2
	add	a5, a5, a4
	fsw	fa4, 0(a5)
	bltu	t6, a0, .LBB0_19
	j	.LBB0_26
.LBB0_25:                               #   in Loop: Header=BB0_20 Depth=1
	fmv.s	fa4, fa5
	slli	a5, t6, 2
	add	a5, a5, a4
	fsw	fa5, 0(a5)
	bltu	t6, a0, .LBB0_19
.LBB0_26:                               # %for.body33.clone.preheader
                                        #   in Loop: Header=BB0_20 Depth=1
	add	s0, a0, t4
	slli	s0, s0, 2
	add	s0, s0, a7
	slli	s1, a0, 2
	add	s1, s1, a2
.LBB0_27:                               # %for.body33.clone
                                        #   Parent Loop BB0_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s1)
	flw	fa2, 0(s0)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a0, a0, 1
	addi	s0, s0, 4
	addi	s1, s1, 4
	bgeu	t6, a0, .LBB0_27
# %bb.28:                               # %for.cond.for.end_crit_edge25
                                        #   in Loop: Header=BB0_20 Depth=1
	fsw	fa4, 0(a5)
	j	.LBB0_19
.LBB0_29:                               # %for.cond45.preheader
	add	a1, a1, a3
	addi	t1, a1, -1
	bge	a6, t1, .LBB0_41
# %bb.30:                               # %for.body50.lr.ph
	addi	a1, a6, -1
	slli	a0, a6, 2
	sub	a0, a0, t0
	add	a0, a0, a2
	addi	t2, a0, 16
	addi	t0, a7, 16
	not	t4, a6
	add	t4, t4, t3
	fmv.w.x	fa5, zero
	mv	s0, a6
	j	.LBB0_32
.LBB0_31:                               # %for.end67
                                        #   in Loop: Header=BB0_32 Depth=1
	addi	s0, s0, 1
	addi	t2, t2, 4
	addi	t4, t4, -1
	beq	s0, t1, .LBB0_41
.LBB0_32:                               # %for.body50
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_34 Depth 2
                                        #     Child Loop BB0_39 Depth 2
	sub	a0, s0, t3
	addi	s1, a0, 1
	not	a0, a0
	add	a0, a0, a6
	andi	a0, a0, -8
	add	a0, a0, s1
	bgeu	s1, a0, .LBB0_37
# %bb.33:                               # %for.body60.preheader
                                        #   in Loop: Header=BB0_32 Depth=1
	mv	a3, t0
	mv	a5, t2
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
	sub	t3, a0, s1
	srli	t3, t3, 3
	esp.lp.setup	 0, t3, .LBB0_35
.LBB0_34:                               # %for.body60.7
                                        #   Parent Loop BB0_32 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	s1, s1, 8
	flw	ft3, -12(a5)
	flw	ft4, -16(a3)
	flw	ft5, -8(a5)
	flw	ft6, -12(a3)
	flw	ft7, -4(a5)
	flw	fa6, -8(a3)
	flw	fa7, 0(a5)
	flw	ft8, -4(a3)
	flw	ft9, 4(a5)
	flw	ft10, 0(a3)
	flw	ft11, 8(a5)
	flw	fs0, 4(a3)
	flw	fs1, 12(a5)
	flw	fs2, 8(a3)
	flw	fs3, 16(a5)
	flw	fs4, 12(a3)
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	fmadd.s	fa0, ft9, ft10, fa0
	fmadd.s	ft0, ft11, fs0, ft0
	fmadd.s	ft1, fs1, fs2, ft1
	fmadd.s	ft2, fs3, fs4, ft2
	addi	a5, a5, 32
.LBB0_35:                               # %for.body60.7
                                        #   in Loop: Header=BB0_34 Depth=2
                                        # Label of block must be emitted
	addi	a3, a3, 32
# %bb.36:                               # %for.end67.loopexit
                                        #   in Loop: Header=BB0_32 Depth=1
	fadd.s	fa4, fa4, fa3
	fadd.s	fa3, fa2, fa1
	fadd.s	fa2, fa0, ft0
	fadd.s	fa1, ft1, ft2
	fadd.s	fa4, fa4, fa3
	fadd.s	fa3, fa2, fa1
	fadd.s	fa4, fa4, fa3
	slli	a0, s0, 2
	add	a0, a0, a4
	fsw	fa4, 0(a0)
	bltu	a1, s1, .LBB0_31
	j	.LBB0_38
.LBB0_37:                               #   in Loop: Header=BB0_32 Depth=1
	fmv.s	fa4, fa5
	slli	a0, s0, 2
	add	a0, a0, a4
	fsw	fa5, 0(a0)
	bltu	a1, s1, .LBB0_31
.LBB0_38:                               # %for.body60.clone.preheader
                                        #   in Loop: Header=BB0_32 Depth=1
	add	a3, s1, t4
	slli	a3, a3, 2
	add	a3, a3, a7
	slli	a5, s1, 2
	add	a5, a5, a2
.LBB0_39:                               # %for.body60.clone
                                        #   Parent Loop BB0_32 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a5)
	flw	fa2, 0(a3)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	s1, s1, 1
	addi	a3, a3, 4
	addi	a5, a5, 4
	bgeu	a1, s1, .LBB0_39
# %bb.40:                               # %for.cond.for.end_crit_edge38
                                        #   in Loop: Header=BB0_32 Depth=1
	fsw	fa4, 0(a0)
	j	.LBB0_31
.LBB0_41:
	li	a5, 0
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
.LBB0_42:                               # %return
	mv	a0, a5
	ret
.Lfunc_end0:
	.size	dsps_ccorr_f32_arp4, .Lfunc_end0-dsps_ccorr_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99)"
	.section	".note.GNU-stack","",@progbits
