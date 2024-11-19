# 2024-11-19 14:52:51
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_sqrt_f32_arp4.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_sqrtf_f32_arp4             # -- Begin function dsps_sqrtf_f32_arp4
	.p2align	1
	.type	dsps_sqrtf_f32_arp4,@function
dsps_sqrtf_f32_arp4:                    # @dsps_sqrtf_f32_arp4
# %bb.0:                                # %entry
	fmv.x.w	a0, fa0
	srai	a0, a0, 1
	lui	a1, 129972
	add	a0, a0, a1
	fmv.w.x	fa0, a0
	ret
.Lfunc_end0:
	.size	dsps_sqrtf_f32_arp4, .Lfunc_end0-dsps_sqrtf_f32_arp4
                                        # -- End function
	.option	pop
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_sqrt_f32_arp4              # -- Begin function dsps_sqrt_f32_arp4
	.p2align	1
	.type	dsps_sqrt_f32_arp4,@function
dsps_sqrt_f32_arp4:                     # @dsps_sqrt_f32_arp4
# %bb.0:                                # %entry
	lui	a3, 112
	addi	a3, a3, 3
	beqz	a0, .LBB1_15
# %bb.1:                                # %entry
	beqz	a1, .LBB1_15
# %bb.2:                                # %if.end
	li	a3, 2
	bge	a3, a2, .LBB1_10
# %bb.3:                                # %for.cond.preheader.new
	li	a7, 0
	li	a3, 16
	bltu	a2, a3, .LBB1_7
# %bb.4:                                # %for.body.modify.preheader
	addi	a5, a1, 32
	addi	a4, a0, 32
	lui	t0, 129972
	srli	a7, a2, 4
	esp.lp.setup	 0, a7, .LBB1_6
.LBB1_5:                                # %for.body.modify
                                        # =>This Inner Loop Header: Depth=1
	lw	t1, -32(a4)
	lw	t2, -28(a4)
	srai	a3, t1, 1
	or	a3, a3, t0
	sw	a3, -32(a5)
	srai	a3, t2, 1
	lw	t1, -24(a4)
	or	a3, a3, t0
	sw	a3, -28(a5)
	lw	t2, -20(a4)
	srai	a3, t1, 1
	or	a3, a3, t0
	sw	a3, -24(a5)
	srai	a3, t2, 1
	lw	t1, -16(a4)
	or	a3, a3, t0
	sw	a3, -20(a5)
	lw	t2, -12(a4)
	srai	a3, t1, 1
	or	a3, a3, t0
	sw	a3, -16(a5)
	srai	a3, t2, 1
	lw	t1, -8(a4)
	or	a3, a3, t0
	sw	a3, -12(a5)
	lw	t2, -4(a4)
	srai	a3, t1, 1
	or	a3, a3, t0
	sw	a3, -8(a5)
	srai	a3, t2, 1
	lw	t1, 0(a4)
	or	a3, a3, t0
	sw	a3, -4(a5)
	lw	t2, 4(a4)
	srai	a3, t1, 1
	or	a3, a3, t0
	sw	a3, 0(a5)
	srai	a3, t2, 1
	lw	t1, 8(a4)
	or	a3, a3, t0
	sw	a3, 4(a5)
	lw	t2, 12(a4)
	srai	a3, t1, 1
	or	a3, a3, t0
	sw	a3, 8(a5)
	srai	a3, t2, 1
	lw	t1, 16(a4)
	or	a3, a3, t0
	sw	a3, 12(a5)
	lw	t2, 20(a4)
	srai	a3, t1, 1
	or	a3, a3, t0
	sw	a3, 16(a5)
	srai	a3, t2, 1
	lw	t1, 24(a4)
	or	a3, a3, t0
	sw	a3, 20(a5)
	lw	t2, 28(a4)
	srai	a3, t1, 1
	or	a3, a3, t0
	sw	a3, 24(a5)
	srai	a3, t2, 1
	or	a3, a3, t0
	sw	a3, 28(a5)
	addi	a7, a7, 16
	addi	a5, a5, 64
.LBB1_6:                                # %for.body.modify
                                        #   in Loop: Header=BB1_5 Depth=1
                                        # Label of block must be emitted
	addi	a4, a4, 64
.LBB1_7:                                # %for.cond.preheader.new2
	bge	a7, a2, .LBB1_14
# %bb.8:                                # %for.body.preheader
	slli	a7, a7, 2
	add	a3, a1, a7
	add	a0, a0, a7
	slli	a2, a2, 2
	add	a1, a1, a2
	lui	a2, 129972
.LBB1_9:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a0)
	srai	a4, a4, 1
	add	a4, a4, a2
	sw	a4, 0(a3)
	addi	a3, a3, 4
	addi	a0, a0, 4
	bne	a3, a1, .LBB1_9
	j	.LBB1_14
.LBB1_10:                               # %for.cond.preheader
	blez	a2, .LBB1_14
# %bb.11:                               # %for.body.clone.preheader
	slli	a2, a2, 2
	add	a2, a2, a1
	lui	a3, 129972
	esp.lp.setup	 0, a2, .LBB1_13
.LBB1_12:                               # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a0)
	srai	a4, a4, 1
	add	a4, a4, a3
	sw	a4, 0(a1)
	addi	a1, a1, 4
.LBB1_13:                               # %for.body.clone
                                        #   in Loop: Header=BB1_12 Depth=1
                                        # Label of block must be emitted
	addi	a0, a0, 4
.LBB1_14:
	li	a3, 0
.LBB1_15:                               # %return
	mv	a0, a3
	ret
.Lfunc_end1:
	.size	dsps_sqrt_f32_arp4, .Lfunc_end1-dsps_sqrt_f32_arp4
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99)"
	.section	".note.GNU-stack","",@progbits
