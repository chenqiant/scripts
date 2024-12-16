	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fir_f32_ansi.c"
	.option	push
	.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fir_f32_ansi               # -- Begin function dsps_fir_f32_ansi
	.p2align	1
	.type	dsps_fir_f32_ansi,@function
dsps_fir_f32_ansi:                      # @dsps_fir_f32_ansi
# %bb.0:                                # %entry
	addi	sp, sp, -48
	sw	s0, 44(sp)                      # 4-byte Folded Spill
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	sw	s2, 36(sp)                      # 4-byte Folded Spill
	sw	s3, 32(sp)                      # 4-byte Folded Spill
	sw	s4, 28(sp)                      # 4-byte Folded Spill
	sw	s5, 24(sp)                      # 4-byte Folded Spill
	fsw	fs0, 20(sp)                     # 4-byte Folded Spill
	fsw	fs1, 16(sp)                     # 4-byte Folded Spill
	fsw	fs2, 12(sp)                     # 4-byte Folded Spill
	fsw	fs3, 8(sp)                      # 4-byte Folded Spill
	fsw	fs4, 4(sp)                      # 4-byte Folded Spill
	li	a4, 3
	blt	a3, a4, .LBB0_19
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
	fadd.s	fa3, fa2, fa1
	fadd.s	fa2, fa0, ft0
	fadd.s	fa1, ft1, ft2
	fadd.s	fa4, fa3, fa4
	fadd.s	fa3, fa2, fa1
	fadd.s	fa4, fa3, fa4
	add	t4, t4, a2
	addi	t2, t2, 1
	fsw	fa4, 0(t4)
	beq	t2, a3, .LBB0_30
.LBB0_3:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_9 Depth 2
                                        #     Child Loop BB0_13 Depth 2
                                        #     Child Loop BB0_18 Depth 2
	slli	t4, t2, 2
	add	a4, a1, t4
	flw	fa4, 0(a4)
	li	s5, 0
	slli	a4, s2, 2
	add	a4, a4, a6
	fsw	fa4, 0(a4)
	addi	s2, s2, 1
	slt	a4, s2, a7
	neg	a4, a4
	and	s2, a4, s2
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
	bge	s2, t6, .LBB0_7
# %bb.4:                                # %for.body11.lr.ph.modify
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a5, 0(a0)
	li	s5, 0
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
	sub	t6, t6, s0
	srli	t6, t6, 0
	esp.lp.setup	 0, t6, .LBB0_6
.LBB0_5:                                # %for.body11.modify
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	s5, s5, 8
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
	addi	a5, a5, 32
	add	s0, s2, s5
.LBB0_6:                                # %for.body11.modify
                                        #   in Loop: Header=BB0_5 Depth=2
                                        # Label of block must be emitted
	addi	s1, s1, 32
.LBB0_7:                                # %for.cond18.preheader.modify
                                        #   in Loop: Header=BB0_3 Depth=1
	bge	s0, a7, .LBB0_11
# %bb.8:                                # %for.body11.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s3, 0(a0)
	sub	a5, a7, s0
	slli	s1, s0, 2
	add	s1, s1, a6
	slli	a4, s5, 2
	add	a4, a4, s3
.LBB0_9:                                # %for.body11
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(a4)
	flw	ft4, 0(s1)
	fmadd.s	fa4, ft3, ft4, fa4
	addi	a5, a5, -1
	addi	s1, s1, 4
	addi	a4, a4, 4
	bnez	a5, .LBB0_9
# %bb.10:                               # %for.cond18.preheader.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	sub	a4, a7, s0
	add	s5, s5, a4
.LBB0_11:                               # %for.cond18.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	bge	t1, s2, .LBB0_16
# %bb.12:                               # %for.body22.lr.ph.modify
                                        #   in Loop: Header=BB0_3 Depth=1
	li	s1, 0
	lw	a4, 0(a0)
	addi	s4, s2, -7
	and	s3, s2, t3
	slli	a5, s5, 2
	add	a4, a4, a5
	addi	s0, a4, 16
	mv	a5, t0
	sub	s4, s4, s1
	srli	s4, s4, 3
	esp.lp.setup	 0, s4, .LBB0_14
.LBB0_13:                               # %for.body22.modify
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	s1, s1, 8
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
	addi	s0, s0, 32
.LBB0_14:                               # %for.body22.modify
                                        #   in Loop: Header=BB0_13 Depth=2
                                        # Label of block must be emitted
	addi	a5, a5, 32
# %bb.15:                               # %for.cond.cleanup21.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	add	s5, s5, s1
	bge	s3, s2, .LBB0_2
	j	.LBB0_17
.LBB0_16:                               #   in Loop: Header=BB0_3 Depth=1
	li	s3, 0
	blez	s2, .LBB0_2
.LBB0_17:                               # %for.body22.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a5, 0(a0)
	slli	a4, s3, 2
	add	a4, a4, a6
	slli	s5, s5, 2
	add	a5, a5, s5
	add	t5, t5, a6
.LBB0_18:                               # %for.body22
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(a5)
	flw	ft4, 0(a4)
	fmadd.s	fa4, ft3, ft4, fa4
	addi	a4, a4, 4
	addi	a5, a5, 4
	bne	a4, t5, .LBB0_18
	j	.LBB0_2
.LBB0_19:                               # %for.body.lr.ph.clone.preheader
	blez	a3, .LBB0_30
# %bb.20:                               # %for.body.lr.ph.clone
	lw	a6, 4(a0)
	lw	a7, 8(a0)
	lw	s0, 12(a0)
	li	t2, 0
	fmv.w.x	fa5, zero
	j	.LBB0_22
.LBB0_21:                               # %for.cond.cleanup21.clone
                                        #   in Loop: Header=BB0_22 Depth=1
	add	t0, t0, a2
	addi	t2, t2, 1
	fsw	fa4, 0(t0)
	beq	t2, a3, .LBB0_30
.LBB0_22:                               # %for.body.clone
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_24 Depth 2
                                        #     Child Loop BB0_29 Depth 2
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
	bge	s0, a7, .LBB0_25
# %bb.23:                               # %for.body11.lr.ph.clone
                                        #   in Loop: Header=BB0_22 Depth=1
	lw	a5, 0(a0)
	sub	s1, a7, s0
	add	a4, a6, t1
	fmv.s	fa4, fa5
.LBB0_24:                               # %for.body11.clone
                                        #   Parent Loop BB0_22 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a5)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a4, a4, 4
	addi	s1, s1, -1
	addi	a5, a5, 4
	bnez	s1, .LBB0_24
.LBB0_25:                               # %for.cond18.preheader.clone
                                        #   in Loop: Header=BB0_22 Depth=1
	blez	s0, .LBB0_21
# %bb.26:                               # %for.body22.lr.ph.clone
                                        #   in Loop: Header=BB0_22 Depth=1
	mv	a4, s0
	blt	a7, s0, .LBB0_28
# %bb.27:                               # %for.body22.lr.ph.clone
                                        #   in Loop: Header=BB0_22 Depth=1
	mv	a4, a7
.LBB0_28:                               # %for.body22.lr.ph.clone
                                        #   in Loop: Header=BB0_22 Depth=1
	lw	a5, 0(a0)
	slli	a4, a4, 2
	sub	a4, a4, t1
	add	a4, a4, a5
	add	t1, t1, a6
	mv	a5, a6
.LBB0_29:                               # %for.body22.clone
                                        #   Parent Loop BB0_22 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a4)
	flw	fa2, 0(a5)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, 4
	addi	a4, a4, 4
	bne	a5, t1, .LBB0_29
	j	.LBB0_21
.LBB0_30:                               # %if.end
	li	a0, 0
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	lw	s5, 24(sp)                      # 4-byte Folded Reload
	flw	fs0, 20(sp)                     # 4-byte Folded Reload
	flw	fs1, 16(sp)                     # 4-byte Folded Reload
	flw	fs2, 12(sp)                     # 4-byte Folded Reload
	flw	fs3, 8(sp)                      # 4-byte Folded Reload
	flw	fs4, 4(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	dsps_fir_f32_ansi, .Lfunc_end0-dsps_fir_f32_ansi
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197)"
	.section	".note.GNU-stack","",@progbits