	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"after_customlicm.ll"
	.globl	test_loop                       # -- Begin function test_loop
	.p2align	1
	.type	test_loop,@function
test_loop:                              # @test_loop
	.cfi_startproc
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
	fadd.s	fa5, fa5, fa0
	fadd.s	fa5, fa4, fa5
	fadd.s	fa5, fa3, fa5
	fadd.s	fa5, fa2, fa5
	fadd.s	fa5, fa1, fa5
	fadd.s	fa0, ft0, fa5
	ret
.Lfunc_end0:
	.size	test_loop, .Lfunc_end0-test_loop
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
