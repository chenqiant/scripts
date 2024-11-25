# 2024-11-20 11:58:00
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_corr_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_corr_f32_arp4              # -- Begin function dsps_corr_f32_arp4
	.p2align	1
	.type	dsps_corr_f32_arp4,@function
dsps_corr_f32_arp4:                     # @dsps_corr_f32_arp4
# %bb.0:                                # %entry
	lui	a5, 112
	addi	a5, a5, 3
	blt	a1, a3, .LBB0_19
# %bb.1:                                # %entry
	beqz	a0, .LBB0_19
# %bb.2:                                # %entry
	beqz	a2, .LBB0_19
# %bb.3:                                # %entry
	beqz	a4, .LBB0_19
# %bb.4:                                # %if.end
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	fsw	fs0, 8(sp)                      # 4-byte Folded Spill
	sub	a6, a1, a3
	li	a5, 16
	blt	a6, a5, .LBB0_10
# %bb.5:                                # %for.cond8.preheader.lr.ph
	li	t2, 0
	li	t3, 0
	addi	a7, a6, -15
	addi	t0, a2, 32
	slli	t1, a3, 2
	fmv.w.x	fa5, zero
	mv	t4, a0
	j	.LBB0_7
.LBB0_6:                                # %for.cond.cleanup
                                        #   in Loop: Header=BB0_7 Depth=1
	addi	t5, t3, 16
	slli	t3, t3, 2
	add	t3, t3, a4
	fsw	fa4, 0(t3)
	fsw	fa3, 4(t3)
	fsw	fa2, 8(t3)
	fsw	fa1, 12(t3)
	fsw	fa0, 16(t3)
	fsw	ft0, 20(t3)
	fsw	ft1, 24(t3)
	fsw	ft2, 28(t3)
	fsw	ft3, 32(t3)
	fsw	ft4, 36(t3)
	fsw	ft5, 40(t3)
	fsw	ft6, 44(t3)
	fsw	ft7, 48(t3)
	fsw	fa6, 52(t3)
	fsw	fa7, 56(t3)
	fsw	ft8, 60(t3)
	addi	t4, t4, 64
	addi	t2, t2, 1
	mv	t3, t5
	bge	t5, a7, .LBB0_11
.LBB0_7:                                # %for.cond8.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
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
	blez	a3, .LBB0_6
# %bb.8:                                # %for.body10.lr.ph
                                        #   in Loop: Header=BB0_7 Depth=1
	slli	a5, t2, 6
	add	a5, a5, t1
	add	t5, a0, a5
	mv	a5, t0
	mv	t6, t4
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
	sub t5, t5, t6
	srli	t5, t5, 2
	esp.lp.setup	 0, t5, .test_loop
.LBB0_9:                                # %for.body14.us.unroll
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft9, -32(a5)
	flw	ft10, 0(t6)
	flw	ft11, -28(a5)
	flw	fs0, -24(a5)
	fmadd.s	fa4, ft10, ft9, fa4
	flw	ft10, -20(a5)
	fmadd.s	fa3, ft11, ft9, fa3
	flw	ft11, -16(a5)
	fmadd.s	fa2, fs0, ft9, fa2
	flw	fs0, -12(a5)
	fmadd.s	fa1, ft10, ft9, fa1
	flw	ft10, -8(a5)
	fmadd.s	fa0, ft11, ft9, fa0
	flw	ft11, -4(a5)
	fmadd.s	ft0, fs0, ft9, ft0
	flw	fs0, 0(a5)
	fmadd.s	ft1, ft10, ft9, ft1
	flw	ft10, 4(a5)
	fmadd.s	ft2, ft11, ft9, ft2
	flw	ft11, 8(a5)
	fmadd.s	ft3, fs0, ft9, ft3
	flw	fs0, 12(a5)
	fmadd.s	ft4, ft10, ft9, ft4
	flw	ft10, 16(a5)
	fmadd.s	ft5, ft11, ft9, ft5
	flw	ft11, 20(a5)
	fmadd.s	ft6, fs0, ft9, ft6
	flw	fs0, 24(a5)
	fmadd.s	ft7, ft10, ft9, ft7
	fmadd.s	fa6, ft11, ft9, fa6
	flw	ft10, 28(a5)
	fmadd.s	fa7, fs0, ft9, fa7
	addi	a5, a5, 4
	addi	t6, t6, 4
.test_loop:	fmadd.s	ft8, ft10, ft9, ft8
	#bne	t6, t5, .LBB0_9
	j	.LBB0_6
.LBB0_10:
	li	t5, 0
.LBB0_11:                               # %for.cond91.preheader
	blt	a6, t5, .LBB0_18
# %bb.12:                               # %for.cond95.preheader.lr.ph
	neg	a5, a3
	blez	a3, .LBB0_17
# %bb.13:                               # %for.cond11.preheader.us.preheader
	add	a1, a1, a5
	addi	a6, a1, 1
	slli	a7, t5, 2
	add	a7, a7, a0
	fmv.w.x	fa5, zero
.LBB0_14:                               # %for.cond11.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
	mv	a0, a7
	mv	a1, a2
	mv	a5, a3
	fmv.s	fa4, fa5
.LBB0_15:                               # %for.body14.us
                                        #   Parent Loop BB0_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa3, 0(a0)
	flw	fa2, 0(a1)
	fmadd.s	fa4, fa3, fa2, fa4
	addi	a5, a5, -1
	addi	a1, a1, 4
	addi	a0, a0, 4
	bnez	a5, .LBB0_15
# %bb.16:                               # %for.cond11.for.cond.cleanup13_crit_edge.us
                                        #   in Loop: Header=BB0_14 Depth=1
	slli	a0, t5, 2
	add	a0, a0, a4
	fsw	fa4, 0(a0)
	addi	t5, t5, 1
	addi	a7, a7, 4
	bne	t5, a6, .LBB0_14
	j	.LBB0_18
.LBB0_17:                               # %for.cond11.preheader.preheader
	slli	a0, t5, 2
	add	a0, a0, a4
	add	a1, a1, a5
	sub	a1, a1, t5
	slli	a1, a1, 2
	addi	a2, a1, 4
	li	a1, 0
	call	memset
.LBB0_18:
	li	a5, 0
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	flw	fs0, 8(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
.LBB0_19:                               # %return
	mv	a0, a5
	ret
.Lfunc_end0:
	.size	dsps_corr_f32_arp4, .Lfunc_end0-dsps_corr_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c)"
	.section	".note.GNU-stack","",@progbits
