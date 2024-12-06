# 2024-12-05 16:25:14
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_fird_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_fird_f32_arp4              # -- Begin function dsps_fird_f32_arp4
	.p2align	1
	.type	dsps_fird_f32_arp4,@function
dsps_fird_f32_arp4:                     # @dsps_fird_f32_arp4
# %bb.0:                                # %entry
	blez	a3, .LBB0_31
# %bb.1:                                # %for.cond1.preheader.lr.ph
	addi	sp, sp, -48
	sw	s0, 44(sp)                      # 4-byte Folded Spill
	sw	s1, 40(sp)                      # 4-byte Folded Spill
	sw	s2, 36(sp)                      # 4-byte Folded Spill
	sw	s3, 32(sp)                      # 4-byte Folded Spill
	sw	s4, 28(sp)                      # 4-byte Folded Spill
	sw	s5, 24(sp)                      # 4-byte Folded Spill
	sw	s6, 20(sp)                      # 4-byte Folded Spill
	sw	s7, 16(sp)                      # 4-byte Folded Spill
	sw	s8, 12(sp)                      # 4-byte Folded Spill
	mv	t1, a3
	lw	t0, 16(a0)
	lw	s8, 8(a0)
	li	t6, 0
	lw	a3, 12(a0)
	addi	a6, t0, -1
	addi	a7, s8, -1
	andi	s5, t0, -8
	andi	t2, t0, 7
	slli	t3, t2, 2
	neg	t4, s8
	li	t5, 7
	fmv.w.x	fa5, zero
	j	.LBB0_3
.LBB0_2:                                # %for.cond.cleanup26
                                        #   in Loop: Header=BB0_3 Depth=1
	addi	a4, t6, 1
	slli	t6, t6, 2
	add	t6, t6, a2
	fsw	fa4, 0(t6)
	mv	t6, a4
	beq	a4, t1, .LBB0_30
.LBB0_3:                                # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #     Child Loop BB0_9 Depth 2
                                        #     Child Loop BB0_16 Depth 2
                                        #     Child Loop BB0_19 Depth 2
                                        #     Child Loop BB0_26 Depth 2
                                        #     Child Loop BB0_29 Depth 2
	blez	t0, .LBB0_11
# %bb.4:                                # %for.body4.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s0, 4(a0)
	li	s1, 0
	bltu	a6, t5, .LBB0_7
# %bb.5:                                # %for.body4.lr.ph.new
                                        #   in Loop: Header=BB0_3 Depth=1
	mv	a4, a1
.LBB0_6:                                # %for.body4
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa4, 0(a4)
	addi	a1, a3, 1
	slli	a3, a3, 2
	add	a3, a3, s0
	fsw	fa4, 0(a3)
	slt	a3, a1, s8
	neg	a3, a3
	and	a1, a1, a3
	flw	fa4, 4(a4)
	addi	a3, a1, 1
	slli	a1, a1, 2
	add	a1, a1, s0
	fsw	fa4, 0(a1)
	slt	a1, a3, s8
	neg	a1, a1
	and	a1, a1, a3
	flw	fa4, 8(a4)
	addi	a3, a1, 1
	slli	a1, a1, 2
	add	a1, a1, s0
	fsw	fa4, 0(a1)
	slt	a1, a3, s8
	neg	a1, a1
	and	a1, a1, a3
	flw	fa4, 12(a4)
	addi	a3, a1, 1
	slli	a1, a1, 2
	add	a1, a1, s0
	fsw	fa4, 0(a1)
	slt	a1, a3, s8
	neg	a1, a1
	and	a1, a1, a3
	flw	fa4, 16(a4)
	addi	a3, a1, 1
	slli	a1, a1, 2
	add	a1, a1, s0
	fsw	fa4, 0(a1)
	slt	a1, a3, s8
	neg	a1, a1
	and	a1, a1, a3
	flw	fa4, 20(a4)
	addi	a3, a1, 1
	slli	a1, a1, 2
	add	a1, a1, s0
	fsw	fa4, 0(a1)
	slt	a1, a3, s8
	neg	a1, a1
	and	a1, a1, a3
	flw	fa4, 24(a4)
	addi	a3, a1, 1
	slli	a1, a1, 2
	add	a1, a1, s0
	fsw	fa4, 0(a1)
	slt	a1, a3, s8
	neg	a1, a1
	and	a3, a3, a1
	addi	a1, a4, 32
	flw	fa4, 28(a4)
	addi	a4, a3, 1
	slli	a3, a3, 2
	add	a3, a3, s0
	fsw	fa4, 0(a3)
	slt	a3, a4, s8
	neg	a3, a3
	addi	s1, s1, 8
	and	a3, a3, a4
	mv	a4, a1
	bne	s5, s1, .LBB0_6
.LBB0_7:                                # %for.cond1.for.cond.cleanup3_crit_edge.unr-lcssa
                                        #   in Loop: Header=BB0_3 Depth=1
	mv	a5, a1
	beqz	t2, .LBB0_10
# %bb.8:                                # %for.body4.epil.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	sub	a4, a6, s1
	add	s1, a1, t3
.LBB0_9:                                # %for.body4.epil
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a5, a1, 4
	flw	fa4, 0(a1)
	addi	a1, a3, 1
	slli	a3, a3, 2
	add	a3, a3, s0
	fsw	fa4, 0(a3)
	slt	a3, a1, s8
	neg	a3, a3
	and	a3, a3, a1
	addi	a4, a4, -1
	mv	a1, a5
	bne	a5, s1, .LBB0_9
.LBB0_10:                               # %for.cond1.for.cond.cleanup3_crit_edge
                                        #   in Loop: Header=BB0_3 Depth=1
	sw	a3, 12(a0)
	mv	a1, a5
.LBB0_11:                               # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_3 Depth=1
	bge	a3, s8, .LBB0_14
# %bb.12:                               # %for.body14.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s3, 0(a0)
	lw	s4, 4(a0)
	sub	s2, s8, a3
	sub	a4, a7, a3
	andi	s6, s2, 7
	li	s0, 0
	bgeu	a4, t5, .LBB0_15
# %bb.13:                               #   in Loop: Header=BB0_3 Depth=1
	mv	a4, a3
	fmv.s	fa4, fa5
	bnez	s6, .LBB0_18
	j	.LBB0_20
.LBB0_14:                               #   in Loop: Header=BB0_3 Depth=1
	li	s2, 0
	fmv.s	fa4, fa5
	j	.LBB0_20
.LBB0_15:                               # %for.body14.lr.ph.new
                                        #   in Loop: Header=BB0_3 Depth=1
	add	s7, t4, s6
	add	s7, s7, a3
	addi	s1, s3, 16
	slli	a4, a3, 2
	add	a4, a4, s4
	addi	a4, a4, 16
	fmv.s	fa4, fa5
.LBB0_16:                               # %for.body14
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, -16(s1)
	flw	fa2, -16(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	flw	fa3, -12(s1)
	flw	fa2, -12(a4)
	flw	fa1, -8(s1)
	flw	fa0, -8(a4)
	flw	ft0, -4(s1)
	flw	ft1, -4(a4)
	flw	ft2, 0(s1)
	flw	ft3, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	flw	fa3, 4(s1)
	flw	fa2, 4(a4)
	flw	fa1, 8(s1)
	flw	fa0, 8(a4)
	flw	ft0, 12(s1)
	flw	ft1, 12(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	addi	s0, s0, 8
	fmadd.s	fa4, ft0, ft1, fa4
	add	a5, s7, s0
	addi	s1, s1, 32
	addi	a4, a4, 32
	bnez	a5, .LBB0_16
# %bb.17:                               #   in Loop: Header=BB0_3 Depth=1
	add	a4, a3, s0
	beqz	s6, .LBB0_20
.LBB0_18:                               # %for.body14.epil.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	slli	s1, a4, 2
	add	a4, s4, s1
	slli	a5, s0, 2
	add	s3, s3, a5
	sub	a5, a7, s0
	sub	a5, a5, a3
	slli	s6, s6, 2
	add	s1, s1, s6
	add	s4, s4, s1
.LBB0_19:                               # %for.body14.epil
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s3)
	flw	fa2, 0(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a4, a4, 4
	addi	s3, s3, 4
	addi	a5, a5, -1
	bne	a4, s4, .LBB0_19
.LBB0_20:                               # %for.cond23.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	blez	a3, .LBB0_2
# %bb.21:                               # %for.body27.lr.ph
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	s3, 0(a0)
	lw	s4, 4(a0)
	addi	a4, a3, -1
	andi	s6, a3, 7
	bgeu	a4, t5, .LBB0_23
# %bb.22:                               #   in Loop: Header=BB0_3 Depth=1
	li	s1, 0
	bnez	s6, .LBB0_28
	j	.LBB0_2
.LBB0_23:                               # %for.body27.lr.ph.new
                                        #   in Loop: Header=BB0_3 Depth=1
	mv	a4, a3
	blt	s8, a3, .LBB0_25
# %bb.24:                               # %for.body27.lr.ph.new
                                        #   in Loop: Header=BB0_3 Depth=1
	mv	a4, s8
.LBB0_25:                               # %for.body27.lr.ph.new
                                        #   in Loop: Header=BB0_3 Depth=1
	li	s1, 0
	sub	s7, a3, s6
	slli	a4, a4, 2
	slli	a5, a3, 2
	sub	a4, a4, a5
	add	a4, a4, s3
	addi	s0, a4, 16
	addi	a4, s4, 16
.LBB0_26:                               # %for.body27
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, -16(s0)
	flw	fa2, -16(a4)
	flw	fa1, -12(s0)
	flw	fa0, -12(a4)
	flw	ft0, -8(s0)
	flw	ft1, -8(a4)
	flw	ft2, -4(s0)
	flw	ft3, -4(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	flw	fa3, 0(s0)
	flw	fa2, 0(a4)
	flw	fa1, 4(s0)
	flw	fa0, 4(a4)
	flw	ft0, 8(s0)
	flw	ft1, 8(a4)
	flw	ft2, 12(s0)
	flw	ft3, 12(a4)
	fmadd.s	fa4, fa3, fa2, fa4
	fmadd.s	fa4, fa1, fa0, fa4
	fmadd.s	fa4, ft0, ft1, fa4
	fmadd.s	fa4, ft2, ft3, fa4
	addi	s1, s1, 8
	addi	s0, s0, 32
	addi	a4, a4, 32
	bne	s7, s1, .LBB0_26
# %bb.27:                               #   in Loop: Header=BB0_3 Depth=1
	add	s2, s2, s1
	beqz	s6, .LBB0_2
.LBB0_28:                               # %for.body27.epil.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	not	a4, s1
	add	a4, a4, a3
	slli	s1, s1, 2
	add	s0, s4, s1
	slli	s2, s2, 2
	add	s3, s3, s2
	slli	s6, s6, 2
	add	s1, s1, s6
	add	s4, s4, s1
.LBB0_29:                               # %for.body27.epil
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(s3)
	flw	fa2, 0(s0)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a4, a4, -1
	addi	s0, s0, 4
	addi	s3, s3, 4
	bne	s0, s4, .LBB0_29
	j	.LBB0_2
.LBB0_30:
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	lw	s5, 24(sp)                      # 4-byte Folded Reload
	lw	s6, 20(sp)                      # 4-byte Folded Reload
	lw	s7, 16(sp)                      # 4-byte Folded Reload
	lw	s8, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	mv	a0, t1
	ret
.LBB0_31:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	dsps_fird_f32_arp4, .Lfunc_end0-dsps_fird_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb)"
	.section	".note.GNU-stack","",@progbits
