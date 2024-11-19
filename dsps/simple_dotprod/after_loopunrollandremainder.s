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
	addi	sp, sp, -16
	fsw	fs0, 12(sp)                     # 4-byte Folded Spill
	fsw	fs1, 8(sp)                      # 4-byte Folded Spill
	fsw	fs2, 4(sp)                      # 4-byte Folded Spill
	fsw	fs3, 0(sp)                      # 4-byte Folded Spill
	addi	a2, a0, 16
	addi	a1, a1, 16
	addi	a0, a0, 2047
	fmv.w.x	fa5, zero
	addi	a0, a0, 2033
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	ft2, -16(a2)
	flw	ft3, -16(a1)
	flw	ft4, -12(a2)
	flw	ft5, -12(a1)
	flw	ft6, -8(a2)
	flw	ft7, -8(a1)
	flw	fa6, -4(a2)
	flw	fa7, -4(a1)
	flw	ft8, 0(a2)
	flw	ft9, 0(a1)
	flw	ft10, 4(a2)
	flw	ft11, 4(a1)
	flw	fs0, 8(a2)
	flw	fs1, 8(a1)
	flw	fs2, 12(a2)
	flw	fs3, 12(a1)
	fmadd.s	fa5, ft2, ft3, fa5
	fmadd.s	fa4, ft4, ft5, fa4
	fmadd.s	fa3, ft6, ft7, fa3
	fmadd.s	fa2, fa6, fa7, fa2
	fmadd.s	fa1, ft8, ft9, fa1
	fmadd.s	fa0, ft10, ft11, fa0
	fmadd.s	ft0, fs0, fs1, ft0
	fmadd.s	ft1, fs2, fs3, ft1
	addi	a2, a2, 32
	addi	a1, a1, 32
	bne	a2, a0, .LBB0_1
# %bb.2:                                # %for.end
	fadd.s	fa5, fa5, fa4
	fadd.s	fa4, fa3, fa2
	fadd.s	fa3, fa1, fa0
	fadd.s	fa2, ft0, ft1
	fadd.s	fa5, fa5, fa4
	fadd.s	fa4, fa3, fa2
	fadd.s	fa0, fa5, fa4
	flw	fs0, 12(sp)                     # 4-byte Folded Reload
	flw	fs1, 8(sp)                      # 4-byte Folded Reload
	flw	fs2, 4(sp)                      # 4-byte Folded Reload
	flw	fs3, 0(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	test_loop, .Lfunc_end0-test_loop
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-240-g66b4681 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-242-gf3b3614 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-243-g1c09333 esp-18.1.2_20240912-275-g0371b99)"
	.section	".note.GNU-stack","",@progbits
