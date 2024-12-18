.option	arch, -zcb, +zcmp
# 2024-12-17 17:42:53
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspi_dotprod_off_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dspi_dotprod_off_f32_arp4       # -- Begin function dspi_dotprod_off_f32_arp4
	.p2align	1
	.type	dspi_dotprod_off_f32_arp4,@function
dspi_dotprod_off_f32_arp4:              # @dspi_dotprod_off_f32_arp4
# %bb.0:                                # %entry
	addi	sp, sp, -32
	sw	s0, 28(sp)                      # 4-byte Folded Spill
	sw	s1, 24(sp)                      # 4-byte Folded Spill
	sw	s2, 20(sp)                      # 4-byte Folded Spill
	sw	s3, 16(sp)                      # 4-byte Folded Spill
	sw	s4, 12(sp)                      # 4-byte Folded Spill
	lw	s3, 4(a0)
	lw	s2, 12(a0)
	mul	s1, s3, a3
	lui	a5, 112
	addi	a5, a5, 3
	blt	s2, s1, .LBB0_16
# %bb.1:                                # %if.end
	lw	t2, 8(a0)
	lw	s1, 16(a0)
	mul	s0, t2, a4
	blt	s1, s0, .LBB0_16
# %bb.2:                                # %if.end4
	lw	t6, 4(a1)
	lw	t0, 12(a1)
	mul	s1, t6, a3
	lui	a5, 112
	addi	a5, a5, 3
	blt	t0, s1, .LBB0_16
# %bb.3:                                # %if.end10
	lw	t5, 8(a1)
	lw	s1, 16(a1)
	mul	s0, t5, a4
	blt	s1, s0, .LBB0_16
# %bb.4:                                # %if.end16
	blez	a4, .LBB0_14
# %bb.5:                                # %for.cond25.preheader.lr.ph
	li	a6, 0
	lw	t1, 0(a1)
	lw	t3, 0(a0)
	addi	t4, a3, -7
	andi	a7, a3, -8
	mul	t0, t5, t0
	slli	t0, t0, 2
	slli	t5, t6, 5
	mul	t2, t2, s2
	slli	t2, t2, 2
	slli	s2, s3, 5
	slli	s3, s3, 2
	slli	s4, t6, 2
	fmv.w.x	fa5, zero
	li	t6, 8
	j	.LBB0_7
.LBB0_6:                                # %for.cond.cleanup27
                                        #   in Loop: Header=BB0_7 Depth=1
	addi	a6, a6, 1
	add	t1, t1, t0
	add	t3, t3, t2
	beq	a6, a4, .LBB0_15
.LBB0_7:                                # %for.cond25.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
                                        #     Child Loop BB0_13 Depth 2
	blt	a3, t6, .LBB0_11
# %bb.8:                                # %for.body28.7.preheader
                                        #   in Loop: Header=BB0_7 Depth=1
	li	s0, 0
	mv	s1, t3
	mv	a1, t1
.LBB0_9:                                # %for.body28.7
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa4, 0(s1)
	flw	fa3, 0(a1)
	add	a5, s1, s3
	add	a0, a1, s4
	flw	fa2, 0(a0)
	flw	fa1, 0(a5)
	fadd.s	fa3, fa3, fa0
	fmadd.s	fa5, fa4, fa3, fa5
	fadd.s	fa4, fa2, fa0
	fmadd.s	fa5, fa1, fa4, fa5
	add	a5, a5, s3
	flw	fa4, 0(a5)
	add	a0, a0, s4
	flw	fa3, 0(a0)
	add	a5, a5, s3
	add	a0, a0, s4
	flw	fa2, 0(a0)
	flw	fa1, 0(a5)
	fadd.s	fa3, fa3, fa0
	fmadd.s	fa5, fa4, fa3, fa5
	fadd.s	fa4, fa2, fa0
	fmadd.s	fa5, fa1, fa4, fa5
	add	a5, a5, s3
	flw	fa4, 0(a5)
	add	a0, a0, s4
	flw	fa3, 0(a0)
	add	a5, a5, s3
	add	a0, a0, s4
	flw	fa2, 0(a0)
	flw	fa1, 0(a5)
	fadd.s	fa3, fa3, fa0
	fmadd.s	fa5, fa4, fa3, fa5
	fadd.s	fa4, fa2, fa0
	fmadd.s	fa5, fa1, fa4, fa5
	add	a5, a5, s3
	flw	fa4, 0(a5)
	add	a0, a0, s4
	flw	fa3, 0(a0)
	add	a5, a5, s3
	add	a0, a0, s4
	flw	fa2, 0(a0)
	flw	fa1, 0(a5)
	fadd.s	fa3, fa3, fa0
	fmadd.s	fa5, fa4, fa3, fa5
	fadd.s	fa4, fa2, fa0
	fmadd.s	fa5, fa1, fa4, fa5
	addi	s0, s0, 8
	add	a1, a1, t5
	add	s1, s1, s2
	blt	s0, t4, .LBB0_9
# %bb.10:                               #   in Loop: Header=BB0_7 Depth=1
	mv	s1, a7
	bge	a7, a3, .LBB0_6
	j	.LBB0_12
.LBB0_11:                               #   in Loop: Header=BB0_7 Depth=1
	li	s1, 0
	blez	a3, .LBB0_6
.LBB0_12:                               # %for.body28.clone.preheader
                                        #   in Loop: Header=BB0_7 Depth=1
	sub	a0, a3, s1
	mul	s0, s4, s1
	add	s0, s0, t1
	mul	s1, s3, s1
	add	s1, s1, t3
.LBB0_13:                               # %for.body28.clone
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	fa4, 0(s0)
	flw	fa3, 0(s1)
	fadd.s	fa4, fa4, fa0
	fmadd.s	fa5, fa3, fa4, fa5
	addi	a0, a0, -1
	add	s0, s0, s4
	add	s1, s1, s3
	bnez	a0, .LBB0_13
	j	.LBB0_6
.LBB0_14:
	fmv.w.x	fa5, zero
.LBB0_15:                               # %for.cond.cleanup
	li	a5, 0
	fsw	fa5, 0(a2)
.LBB0_16:                               # %return
	mv	a0, a5
	lw	s0, 28(sp)                      # 4-byte Folded Reload
	lw	s1, 24(sp)                      # 4-byte Folded Reload
	lw	s2, 20(sp)                      # 4-byte Folded Reload
	lw	s3, 16(sp)                      # 4-byte Folded Reload
	lw	s4, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	dspi_dotprod_off_f32_arp4, .Lfunc_end0-dspi_dotprod_off_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
