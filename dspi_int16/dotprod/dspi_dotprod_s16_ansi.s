	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dspi_dotprod_s16_ansi.c"
	.option	push
	.option	arch, -zcb, -zcmt
	.globl	dspi_dotprod_s16_ansi           # -- Begin function dspi_dotprod_s16_ansi
	.p2align	1
	.type	dspi_dotprod_s16_ansi,@function
dspi_dotprod_s16_ansi:                  # @dspi_dotprod_s16_ansi
# %bb.0:                                # %entry
	cm.push	{ra, s0-s3}, -32
	lw	t0, 4(a0)
	lw	t1, 12(a0)
	mul	s1, t0, a3
	lui	a6, 112
	addi	a6, a6, 3
	blt	t1, s1, .LBB0_14
# %bb.1:                                # %if.end
	lw	t3, 8(a0)
	lw	s1, 16(a0)
	mul	s0, t3, a4
	blt	s1, s0, .LBB0_14
# %bb.2:                                # %if.end4
	lw	t6, 4(a1)
	lw	t4, 12(a1)
	mul	s1, t6, a3
	lui	a6, 112
	addi	a6, a6, 3
	blt	t4, s1, .LBB0_14
# %bb.3:                                # %if.end10
	lw	s3, 8(a1)
	lw	s1, 16(a1)
	mul	s0, s3, a4
	blt	s1, s0, .LBB0_14
# %bb.4:                                # %if.end16
	li	a6, 0
	li	a7, 0
	blez	a4, .LBB0_10
# %bb.5:                                # %if.end16
	blez	a3, .LBB0_10
# %bb.6:                                # %for.cond25.preheader.us.preheader
	li	t2, 0
	li	a6, 0
	li	a7, 0
	lw	t5, 0(a0)
	lw	s2, 0(a1)
	mul	t4, s3, t4
	slli	t4, t4, 1
	slli	t6, t6, 1
	mul	t1, t3, t1
	slli	t1, t1, 1
	slli	t0, t0, 1
.LBB0_7:                                # %for.cond25.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
	mv	s0, t5
	mv	a1, s2
	mv	s1, a3
.LBB0_8:                                # %for.body28.us
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lh	t3, 0(s0)
	lh	s3, 0(a1)
	mv	a0, a6
	mul	a6, s3, t3
	srai	t3, a6, 31
	add	a6, a6, a0
	sltu	a0, a6, a0
	add	a7, a7, t3
	add	a7, a7, a0
	addi	s1, s1, -1
	add	a1, a1, t6
	add	s0, s0, t0
	bnez	s1, .LBB0_8
# %bb.9:                                # %for.cond25.for.cond.cleanup27_crit_edge.us
                                        #   in Loop: Header=BB0_7 Depth=1
	addi	t2, t2, 1
	add	s2, s2, t4
	add	t5, t5, t1
	bne	t2, a4, .LBB0_7
.LBB0_10:                               # %for.cond.cleanup
	addi	a0, a5, -1
	li	a1, 1
	sll	a0, a1, a0
	srai	a1, a0, 31
	add	a0, a0, a6
	sltu	a3, a0, a6
	add	a1, a1, a7
	addi	a4, a5, -32
	add	a1, a1, a3
	bltz	a4, .LBB0_12
# %bb.11:                               # %for.cond.cleanup
	sra	a0, a1, a5
	j	.LBB0_13
.LBB0_12:
	slli	a1, a1, 1
	not	a3, a5
	sll	a1, a1, a3
	srl	a0, a0, a5
	or	a0, a0, a1
.LBB0_13:                               # %for.cond.cleanup
	li	a6, 0
	sh	a0, 0(a2)
.LBB0_14:                               # %return
	mv	a0, a6
	cm.popret	{ra, s0-s3}, 32
.Lfunc_end0:
	.size	dspi_dotprod_s16_ansi, .Lfunc_end0-dspi_dotprod_s16_ansi
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99 esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-553-ga5c3c9c esp-18.1.2_20240912-9-gf06e8b6 esp-18.1.2_20240912-14-g8070eda esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-22-gda2052a esp-18.1.2_20240912-29-ga622597 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-30-gc7afa9d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-32-g01e9072 esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-34-gf41581d esp-18.1.2_20240912-13-g45f4abc esp-18.1.2_20240912-40-g376cafb esp-18.1.2_20240912-41-g0acc41e esp-18.1.2_20240912-597-g19b0b49 esp-18.1.2_20240912-599-gb58e197 esp-18.1.2_20240912-602-g324d9ea esp-18.1.2_20240912-602-g324d9ea)"
	.section	".note.GNU-stack","",@progbits
