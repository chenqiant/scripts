	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"test.c"
	.option	push
	.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	test_loop                       # -- Begin function test_loop
	.p2align	1
	.type	test_loop,@function
test_loop:                              # @test_loop
# %bb.0:                                # %entry
	addi	a6, a3, -8
	slli	t0, a5, 2
	slli	a7, a4, 2
	bge	a6, a2, .LBB0_2
# %bb.1:
	fmv.w.x	ft2, zero
	fmv.s	fa5, ft2
	fmv.s	fa4, ft2
	fmv.s	fa3, ft2
	fmv.s	fa2, ft2
	fmv.s	fa1, ft2
	fmv.s	ft0, ft2
	fmv.s	ft1, ft2
	blt	a2, a3, .LBB0_5
	j	.LBB0_7
.LBB0_2:                                # %for.body.7.preheader
	slli	a4, a2, 2
	add	a5, t0, a4
	add	a5, a5, a1
	addi	t1, a5, 16
	add	a4, a4, a7
	add	a4, a4, a0
	fmv.w.x	fa5, zero
	addi	t2, a4, 16
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
.LBB0_3:                                # %for.body.7
                                        # =>This Inner Loop Header: Depth=1
	mv	a4, t1
	mv	a5, t2
	flw	ft2, -16(t2)
	flw	ft3, -16(t1)
	fmadd.s	ft2, ft2, ft3, fa0
	flw	ft3, -12(t2)
	flw	ft4, -12(t1)
	flw	ft5, -8(t2)
	flw	ft6, -8(t1)
	fadd.s	ft1, ft1, ft2
	fmadd.s	ft2, ft3, ft4, fa0
	fadd.s	ft0, ft0, ft2
	fmadd.s	ft2, ft5, ft6, fa0
	flw	ft3, -4(t2)
	flw	ft4, -4(t1)
	flw	ft5, 0(t2)
	flw	ft6, 0(t1)
	fadd.s	fa1, fa1, ft2
	fmadd.s	ft2, ft3, ft4, fa0
	fadd.s	fa2, fa2, ft2
	fmadd.s	ft2, ft5, ft6, fa0
	flw	ft3, 4(t2)
	flw	ft4, 4(t1)
	flw	ft5, 8(t2)
	flw	ft6, 8(t1)
	fadd.s	fa3, fa3, ft2
	fmadd.s	ft2, ft3, ft4, fa0
	fadd.s	fa4, fa4, ft2
	fmadd.s	ft2, ft5, ft6, fa0
	fadd.s	fa5, fa5, ft2
	addi	a2, a2, 8
	addi	t1, t1, 32
	addi	t2, t2, 32
	bge	a2, a6, .LBB0_3
# %bb.4:
	flw	ft2, 12(a5)
	flw	ft3, 12(a4)
	fmadd.s	ft2, ft2, ft3, fa0
	fadd.s	ft2, fa5, ft2
	bge	a2, a3, .LBB0_7
.LBB0_5:                                # %for.body.clone.preheader
	sub	a3, a3, a2
	slli	a2, a2, 2
	add	t0, t0, a2
	add	a1, a1, t0
	add	a2, a2, a7
	add	a0, a0, a2
.LBB0_6:                                # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	flw	ft3, 0(a0)
	flw	ft4, 0(a1)
	fmadd.s	ft3, ft3, ft4, fa0
	fadd.s	ft1, ft1, ft3
	addi	a3, a3, -1
	addi	a1, a1, 4
	addi	a0, a0, 4
	bnez	a3, .LBB0_6
.LBB0_7:                                # %for.end
	fadd.s	fa0, ft2, ft1
	fadd.s	fa5, fa5, fa4
	fadd.s	fa4, fa3, fa2
	fadd.s	fa3, fa1, ft0
	fadd.s	fa5, fa5, fa0
	fadd.s	fa4, fa4, fa3
	fadd.s	fa0, fa4, fa5
	ret
.Lfunc_end0:
	.size	test_loop, .Lfunc_end0-test_loop
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99)"
	.section	".note.GNU-stack","",@progbits
