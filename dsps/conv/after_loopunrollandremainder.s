# 2024-12-06 14:31:49
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_conv_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_conv_f32_arp4              # -- Begin function dsps_conv_f32_arp4
	.p2align	1
	.type	dsps_conv_f32_arp4,@function
dsps_conv_f32_arp4:                     # @dsps_conv_f32_arp4
# %bb.0:                                # %entry
	lui	a5, 112
	addi	a5, a5, 3
	beqz	a0, .LBB0_41
# %bb.1:                                # %entry
	beqz	a2, .LBB0_41
# %bb.2:                                # %entry
	beqz	a4, .LBB0_41
# %bb.3:                                # %if.end6
	bge	a1, a3, .LBB0_5
# %bb.4:                                # %if.then8
	mv	t2, a1
	mv	a6, a3
	mv	a7, a0
	j	.LBB0_6
.LBB0_5:
	mv	t2, a3
	mv	a6, a1
	mv	a7, a2
	mv	a2, a0
.LBB0_6:                                # %if.end9
	addi	sp, sp, -48
	sw	s0, 44(sp)                      # 4-byte Folded Spill
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	sw	s2, 36(sp)                      # 4-byte Folded Spill
	sw	s3, 32(sp)                      # 4-byte Folded Spill
	fsw	fs0, 28(sp)                     # 4-byte Folded Spill
	fsw	fs1, 24(sp)                     # 4-byte Folded Spill
	fsw	fs2, 20(sp)                     # 4-byte Folded Spill
	fsw	fs3, 16(sp)                     # 4-byte Folded Spill
	fsw	fs4, 12(sp)                     # 4-byte Folded Spill
	blez	t2, .LBB0_16
# %bb.7:                                # %for.body.preheader
	li	a0, 0
	addi	t0, a2, 16
	addi	s2, a7, -12
	addi	t1, a2, 48
	lui	t3, 524288
	addi	t3, t3, -8
	fmv.w.x	fa5, zero
	mv	s3, a7
.LBB0_8:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #     Child Loop BB0_14 Depth 2
	slli	t6, a0, 2
	andi	t5, t6, -32
	and	a5, a0, t3
	add	t4, a4, t6
	fmv.s	fa4, fa5
	beqz	a5, .LBB0_13
# %bb.9:                                # %for.body13.7.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	addi	a5, t5, -4
	andi	a5, a5, -32
	add	s1, t1, a5
	mv	s0, s2
	mv	a5, t0
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
	sub	s1, s1, a5
	srli	s1, s1, 5
	esp.lp.setup	 0, s1, .LBB0_11
.LBB0_10:                               # %for.body13.7
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, -16(a5)
	flw	ft4, 12(s0)
	flw	ft5, -12(a5)
	flw	ft6, 8(s0)
	flw	ft7, -8(a5)
	flw	fa6, 4(s0)
	flw	fa7, -4(a5)
	flw	ft8, 0(s0)
	flw	ft9, 0(a5)
	flw	ft10, -4(s0)
	flw	ft11, 4(a5)
	flw	fs0, -8(s0)
	flw	fs1, 8(a5)
	flw	fs2, -12(s0)
	flw	fs3, 12(a5)
	flw	fs4, -16(s0)
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	fmadd.s	fa0, ft9, ft10, fa0
	fmadd.s	ft0, ft11, fs0, ft0
	fmadd.s	ft1, fs1, fs2, ft1
	fmadd.s	ft2, fs3, fs4, ft2
	addi	a5, a5, 32
.LBB0_11:                               # %for.body13.7
                                        #   in Loop: Header=BB0_10 Depth=2
                                        # Label of block must be emitted
	addi	s0, s0, -32
# %bb.12:                               # %for.end8
                                        #   in Loop: Header=BB0_8 Depth=1
	fadd.s	fa4, fa4, fa3
	fadd.s	fa3, fa2, fa1
	fadd.s	fa2, fa0, ft0
	fadd.s	fa1, ft1, ft2
	fadd.s	fa4, fa4, fa3
	fadd.s	fa3, fa2, fa1
	fadd.s	fa4, fa4, fa3
	fsw	fa4, 0(t4)
.LBB0_13:                               # %for.body13.clone.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	add	a5, t6, a2
	addi	a5, a5, 4
	sub	s1, s3, t5
	add	t5, t5, a2
.LBB0_14:                               # %for.body13.clone
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(t5)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	t5, t5, 4
	addi	s1, s1, -4
	bne	t5, a5, .LBB0_14
# %bb.15:                               # %for.cond.for.end_crit_edge
                                        #   in Loop: Header=BB0_8 Depth=1
	fsw	fa4, 0(t4)
	addi	a0, a0, 1
	addi	s2, s2, 4
	addi	s3, s3, 4
	bne	a0, t2, .LBB0_8
.LBB0_16:                               # %for.cond21.preheader
	bge	t2, a6, .LBB0_28
# %bb.17:                               # %for.body24.preheader
	andi	t0, t2, -16
	slli	t3, t2, 2
	add	t3, t3, a7
	addi	t1, t3, -32
	addi	t4, a2, 32
	fmv.w.x	fa5, zero
	mv	t6, t2
	j	.LBB0_19
.LBB0_18:                               # %for.end37
                                        #   in Loop: Header=BB0_19 Depth=1
	addi	t6, t6, 1
	addi	t4, t4, 4
	addi	t3, t3, 4
	beq	t6, a6, .LBB0_28
.LBB0_19:                               # %for.body24
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_21 Depth 2
                                        #     Child Loop BB0_26 Depth 2
	sub	a5, t6, t2
	addi	a5, a5, 1
	add	t5, a5, t0
	bgeu	a5, t5, .LBB0_24
# %bb.20:                               # %for.body30.preheader
                                        #   in Loop: Header=BB0_19 Depth=1
	mv	a0, t4
	mv	s0, t1
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
	sub	t5, t5, a5
	srli	t5, t5, 4
	esp.lp.setup	 0, t5, .LBB0_22
.LBB0_21:                               # %for.body30.15
                                        #   Parent Loop BB0_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft9, -28(a0)
	flw	ft10, 28(s0)
	flw	ft11, -24(a0)
	flw	fs0, 24(s0)
	flw	fs1, -20(a0)
	flw	fs2, 20(s0)
	flw	fs3, -16(a0)
	flw	fs4, 16(s0)
	fmadd.s	fa4, ft9, ft10, fa4
	flw	ft9, -12(a0)
	flw	ft10, 12(s0)
	fmadd.s	fa3, ft11, fs0, fa3
	flw	ft11, -8(a0)
	flw	fs0, 8(s0)
	fmadd.s	fa2, fs1, fs2, fa2
	flw	fs1, -4(a0)
	flw	fs2, 4(s0)
	fmadd.s	fa1, fs3, fs4, fa1
	flw	fs3, 0(a0)
	flw	fs4, 0(s0)
	fmadd.s	fa0, ft9, ft10, fa0
	flw	ft9, 4(a0)
	flw	ft10, -4(s0)
	fmadd.s	ft0, ft11, fs0, ft0
	flw	ft11, 8(a0)
	flw	fs0, -8(s0)
	fmadd.s	ft1, fs1, fs2, ft1
	flw	fs1, 12(a0)
	flw	fs2, -12(s0)
	fmadd.s	ft2, fs3, fs4, ft2
	flw	fs3, 16(a0)
	flw	fs4, -16(s0)
	fmadd.s	ft3, ft9, ft10, ft3
	flw	ft9, 20(a0)
	flw	ft10, -20(s0)
	fmadd.s	ft4, ft11, fs0, ft4
	flw	ft11, 24(a0)
	flw	fs0, -24(s0)
	fmadd.s	ft5, fs1, fs2, ft5
	flw	fs1, 28(a0)
	flw	fs2, -28(s0)
	fmadd.s	ft6, fs3, fs4, ft6
	flw	fs3, 32(a0)
	flw	fs4, -32(s0)
	fmadd.s	ft7, ft9, ft10, ft7
	fmadd.s	fa6, ft11, fs0, fa6
	fmadd.s	fa7, fs1, fs2, fa7
	fmadd.s	ft8, fs3, fs4, ft8
	addi	a5, a5, 16
	addi	s0, s0, -64
.LBB0_22:                               # %for.body30.15
                                        #   in Loop: Header=BB0_21 Depth=2
                                        # Label of block must be emitted
	addi	a0, a0, 64
# %bb.23:                               # %for.end37.loopexit
                                        #   in Loop: Header=BB0_19 Depth=1
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
	slli	a0, t6, 2
	add	a0, a0, a4
	fsw	fa4, 0(a0)
	bltu	t6, a5, .LBB0_18
	j	.LBB0_25
.LBB0_24:                               #   in Loop: Header=BB0_19 Depth=1
	fmv.s	fa4, fa5
	slli	a0, t6, 2
	add	a0, a0, a4
	fsw	fa5, 0(a0)
	bltu	t6, a5, .LBB0_18
.LBB0_25:                               # %for.body30.clone.preheader
                                        #   in Loop: Header=BB0_19 Depth=1
	slli	s0, a5, 2
	sub	s1, t3, s0
	add	s0, s0, a2
.LBB0_26:                               # %for.body30.clone
                                        #   Parent Loop BB0_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s0)
	flw	fa2, 0(s1)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, 1
	addi	s1, s1, -4
	addi	s0, s0, 4
	bgeu	t6, a5, .LBB0_26
# %bb.27:                               # %for.cond.for.end_crit_edge25
                                        #   in Loop: Header=BB0_19 Depth=1
	fsw	fa4, 0(a0)
	j	.LBB0_18
.LBB0_28:                               # %for.cond42.preheader
	add	a1, a1, a3
	addi	t1, a1, -1
	bge	a6, t1, .LBB0_40
# %bb.29:                               # %for.body47.lr.ph
	addi	a1, a6, -1
	slli	a0, t2, 2
	add	t0, a0, a7
	addi	t0, t0, -16
	slli	a3, a6, 2
	sub	a0, a3, a0
	add	a0, a0, a2
	addi	t3, a0, 16
	add	a7, a7, a3
	fmv.w.x	fa5, zero
	mv	t4, a6
	j	.LBB0_31
.LBB0_30:                               # %for.end64
                                        #   in Loop: Header=BB0_31 Depth=1
	addi	t4, t4, 1
	addi	t3, t3, 4
	addi	a7, a7, 4
	beq	t4, t1, .LBB0_40
.LBB0_31:                               # %for.body47
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_33 Depth 2
                                        #     Child Loop BB0_38 Depth 2
	sub	a0, t4, t2
	addi	a3, a0, 1
	not	a0, a0
	add	a0, a0, a6
	andi	a0, a0, -8
	add	a0, a0, a3
	bgeu	a3, a0, .LBB0_36
# %bb.32:                               # %for.body57.preheader
                                        #   in Loop: Header=BB0_31 Depth=1
	mv	a5, t3
	mv	s0, t0
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
	fmv.s	ft2, fa5
	sub	a0, a0, a3
	srli	a0, a0, 3
	esp.lp.setup	 0, a0, .LBB0_34
.LBB0_33:                               # %for.body57.7
                                        #   Parent Loop BB0_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a3, a3, 8
	flw	ft3, -12(a5)
	flw	ft4, 12(s0)
	flw	ft5, -8(a5)
	flw	ft6, 8(s0)
	flw	ft7, -4(a5)
	flw	fa6, 4(s0)
	flw	fa7, 0(a5)
	flw	ft8, 0(s0)
	flw	ft9, 4(a5)
	flw	ft10, -4(s0)
	flw	ft11, 8(a5)
	flw	fs0, -8(s0)
	flw	fs1, 12(a5)
	flw	fs2, -12(s0)
	flw	fs3, 16(a5)
	flw	fs4, -16(s0)
	fmadd.s	fa4, ft3, ft4, fa4
	fmadd.s	fa3, ft5, ft6, fa3
	fmadd.s	fa2, ft7, fa6, fa2
	fmadd.s	fa1, fa7, ft8, fa1
	fmadd.s	fa0, ft9, ft10, fa0
	fmadd.s	ft0, ft11, fs0, ft0
	fmadd.s	ft1, fs1, fs2, ft1
	fmadd.s	ft2, fs3, fs4, ft2
	addi	s0, s0, -32
.LBB0_34:                               # %for.body57.7
                                        #   in Loop: Header=BB0_33 Depth=2
                                        # Label of block must be emitted
	addi	a5, a5, 32
# %bb.35:                               # %for.end64.loopexit
                                        #   in Loop: Header=BB0_31 Depth=1
	fadd.s	fa4, fa4, fa3
	fadd.s	fa3, fa2, fa1
	fadd.s	fa2, fa0, ft0
	fadd.s	fa1, ft1, ft2
	fadd.s	fa4, fa4, fa3
	fadd.s	fa3, fa2, fa1
	fadd.s	fa4, fa4, fa3
	slli	a0, t4, 2
	add	a0, a0, a4
	fsw	fa4, 0(a0)
	bltu	a1, a3, .LBB0_30
	j	.LBB0_37
.LBB0_36:                               #   in Loop: Header=BB0_31 Depth=1
	fmv.s	fa4, fa5
	slli	a0, t4, 2
	add	a0, a0, a4
	fsw	fa5, 0(a0)
	bltu	a1, a3, .LBB0_30
.LBB0_37:                               # %for.body57.clone.preheader
                                        #   in Loop: Header=BB0_31 Depth=1
	slli	s1, a3, 2
	sub	a5, a7, s1
	add	s1, s1, a2
.LBB0_38:                               # %for.body57.clone
                                        #   Parent Loop BB0_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s1)
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a3, a3, 1
	addi	a5, a5, -4
	addi	s1, s1, 4
	bgeu	a1, a3, .LBB0_38
# %bb.39:                               # %for.cond.for.end_crit_edge38
                                        #   in Loop: Header=BB0_31 Depth=1
	fsw	fa4, 0(a0)
	j	.LBB0_30
.LBB0_40:
	li	a5, 0
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	flw	fs0, 28(sp)                     # 4-byte Folded Reload
	flw	fs1, 24(sp)                     # 4-byte Folded Reload
	flw	fs2, 20(sp)                     # 4-byte Folded Reload
	flw	fs3, 16(sp)                     # 4-byte Folded Reload
	flw	fs4, 12(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 48
.LBB0_41:                               # %return
	mv	a0, a5
	ret
.Lfunc_end0:
	.size	dsps_conv_f32_arp4, .Lfunc_end0-dsps_conv_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49)"
	.section	".note.GNU-stack","",@progbits
