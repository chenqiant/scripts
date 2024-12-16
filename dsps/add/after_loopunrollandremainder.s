# 2024-12-06 17:18:35
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_add_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_add_f32_arp4               # -- Begin function dsps_add_f32_arp4
	.p2align	1
	.type	dsps_add_f32_arp4,@function
dsps_add_f32_arp4:                      # @dsps_add_f32_arp4
# %bb.0:                                # %entry
	addi	sp, sp, -48
	fsw	fs0, 44(sp)                     # 4-byte Folded Spill
	fsw	fs1, 40(sp)                     # 4-byte Folded Spill
	fsw	fs2, 36(sp)                     # 4-byte Folded Spill
	fsw	fs3, 32(sp)                     # 4-byte Folded Spill
	fsw	fs4, 28(sp)                     # 4-byte Folded Spill
	fsw	fs5, 24(sp)                     # 4-byte Folded Spill
	fsw	fs6, 20(sp)                     # 4-byte Folded Spill
	fsw	fs7, 16(sp)                     # 4-byte Folded Spill
	fsw	fs8, 12(sp)                     # 4-byte Folded Spill
	fsw	fs9, 8(sp)                      # 4-byte Folded Spill
	fsw	fs10, 4(sp)                     # 4-byte Folded Spill
	fsw	fs11, 0(sp)                     # 4-byte Folded Spill
	lui	a7, 112
	addi	a7, a7, 3
	beqz	a0, .LBB0_16
# %bb.1:                                # %entry
	beqz	a1, .LBB0_16
# %bb.2:                                # %entry
	beqz	a2, .LBB0_16
# %bb.3:                                # %if.end
	li	a7, 2
	bge	a7, a3, .LBB0_6
# %bb.4:                                # %for.cond.preheader.new
	li	a7, 16
	bgeu	a3, a7, .LBB0_9
# %bb.5:
	li	a7, 0
	j	.LBB0_12
.LBB0_6:                                # %for.cond.preheader
	blez	a3, .LBB0_15
# %bb.7:                                # %for.body.clone.preheader
	slli	a6, a6, 2
	slli	a5, a5, 2
	slli	a4, a4, 2
.LBB0_8:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a0)
	flw	fa4, 0(a1)
	fadd.s	fa5, fa5, fa4
	fsw	fa5, 0(a2)
	addi	a3, a3, -1
	add	a2, a2, a6
	add	a1, a1, a5
	add	a0, a0, a4
	bnez	a3, .LBB0_8
	j	.LBB0_15
.LBB0_9:                                # %for.body.modify.preheader
	addi	t0, a3, -16
	addi	t1, a1, 32
	addi	t2, a0, 32
	addi	t3, a2, 32
	srli	a7, a3, 4
	esp.lp.setup	 0, a7, .LBB0_11
.LBB0_10:                               # %for.body.modify
                                        # =>This Inner Loop Header: Depth=1
	addi	a7, a7, 16
	flw	fa5, -32(t2)
	flw	fa4, -32(t1)
	flw	fa3, -28(t2)
	flw	fa2, -28(t1)
	flw	fa1, -24(t2)
	flw	fa0, -24(t1)
	flw	ft0, -20(t2)
	flw	ft1, -20(t1)
	flw	ft2, -16(t2)
	flw	ft3, -16(t1)
	flw	ft4, -12(t2)
	flw	ft5, -12(t1)
	flw	ft6, -8(t2)
	flw	ft7, -8(t1)
	flw	fa6, -4(t2)
	flw	fa7, -4(t1)
	flw	ft8, 0(t2)
	flw	ft9, 0(t1)
	flw	ft10, 4(t2)
	flw	ft11, 4(t1)
	flw	fs0, 8(t2)
	flw	fs1, 8(t1)
	flw	fs2, 12(t2)
	flw	fs3, 12(t1)
	flw	fs4, 16(t2)
	flw	fs5, 16(t1)
	flw	fs6, 20(t2)
	flw	fs7, 20(t1)
	flw	fs8, 24(t2)
	flw	fs9, 24(t1)
	flw	fs10, 28(t2)
	flw	fs11, 28(t1)
	fadd.s	fa5, fa5, fa4
	fadd.s	fa4, fa3, fa2
	fadd.s	fa3, fa1, fa0
	fadd.s	fa2, ft0, ft1
	fadd.s	fa1, ft2, ft3
	fadd.s	fa0, ft4, ft5
	fadd.s	ft0, ft6, ft7
	fadd.s	ft1, fa6, fa7
	fadd.s	ft2, ft8, ft9
	fadd.s	ft3, ft10, ft11
	fadd.s	ft4, fs0, fs1
	fadd.s	ft5, fs2, fs3
	fadd.s	ft6, fs4, fs5
	fadd.s	ft7, fs6, fs7
	fadd.s	fa6, fs8, fs9
	fadd.s	fa7, fs10, fs11
	fsw	fa5, -32(t3)
	fsw	fa4, -28(t3)
	fsw	fa3, -24(t3)
	fsw	fa2, -20(t3)
	fsw	fa1, -16(t3)
	fsw	fa0, -12(t3)
	fsw	ft0, -8(t3)
	fsw	ft1, -4(t3)
	fsw	ft2, 0(t3)
	fsw	ft3, 4(t3)
	fsw	ft4, 8(t3)
	fsw	ft5, 12(t3)
	fsw	ft6, 16(t3)
	fsw	ft7, 20(t3)
	fsw	fa6, 24(t3)
	fsw	fa7, 28(t3)
	addi	t1, t1, 64
	addi	t2, t2, 64
.LBB0_11:                               # %for.body.modify
                                        #   in Loop: Header=BB0_10 Depth=1
                                        # Label of block must be emitted
	addi	t3, t3, 64
.LBB0_12:                               # %for.cond.preheader.new2
	bge	a7, a3, .LBB0_15
# %bb.13:                               # %for.body.preheader
	sub	t0, a3, a7
	mul	a3, a7, a6
	slli	a3, a3, 2
	add	a2, a2, a3
	slli	a6, a6, 2
	mul	a3, a7, a5
	slli	a3, a3, 2
	add	a1, a1, a3
	slli	a5, a5, 2
	mul	a3, a7, a4
	slli	a3, a3, 2
	add	a0, a0, a3
	slli	a4, a4, 2
.LBB0_14:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a0)
	flw	fa4, 0(a1)
	fadd.s	fa5, fa5, fa4
	fsw	fa5, 0(a2)
	addi	t0, t0, -1
	add	a2, a2, a6
	add	a1, a1, a5
	add	a0, a0, a4
	bnez	t0, .LBB0_14
.LBB0_15:
	li	a7, 0
.LBB0_16:                               # %return
	mv	a0, a7
	flw	fs0, 44(sp)                     # 4-byte Folded Reload
	flw	fs1, 40(sp)                     # 4-byte Folded Reload
	flw	fs2, 36(sp)                     # 4-byte Folded Reload
	flw	fs3, 32(sp)                     # 4-byte Folded Reload
	flw	fs4, 28(sp)                     # 4-byte Folded Reload
	flw	fs5, 24(sp)                     # 4-byte Folded Reload
	flw	fs6, 20(sp)                     # 4-byte Folded Reload
	flw	fs7, 16(sp)                     # 4-byte Folded Reload
	flw	fs8, 12(sp)                     # 4-byte Folded Reload
	flw	fs9, 8(sp)                      # 4-byte Folded Reload
	flw	fs10, 4(sp)                     # 4-byte Folded Reload
	flw	fs11, 0(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	dsps_add_f32_arp4, .Lfunc_end0-dsps_add_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197)"
	.section	".note.GNU-stack","",@progbits
