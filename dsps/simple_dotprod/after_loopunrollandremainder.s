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
	addi	a2, a1, 16
	addi	a0, a0, 16
	addi	a1, a1, 2047
	fmv.w.x	fa5, zero
	addi	a1, a1, 2033
	fmv.s	fa4, fa5
	fmv.s	fa3, fa5
	fmv.s	fa2, fa5
	fmv.s	fa1, fa5
	fmv.s	fa0, fa5
	fmv.s	ft0, fa5
	fmv.s	ft1, fa5
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	ft2, -16(a0)
	flw	ft3, -16(a2)
	flw	ft4, -12(a0)
	flw	ft5, -12(a2)
	flw	ft6, -8(a0)
	flw	ft7, -8(a2)
	flw	fa6, -4(a0)
	flw	fa7, -4(a2)
	flw	ft8, 0(a0)
	flw	ft9, 0(a2)
	flw	ft10, 4(a0)
	flw	ft11, 4(a2)
	flw	fs0, 8(a0)
	flw	fs1, 8(a2)
	flw	fs2, 12(a0)
	flw	fs3, 12(a2)
	fmadd.s	fa5, ft2, ft3, fa5
	fmadd.s	fa4, ft4, ft5, fa4
	fmadd.s	fa3, ft6, ft7, fa3
	fmadd.s	fa2, fa6, fa7, fa2
	fmadd.s	fa1, ft8, ft9, fa1
	fmadd.s	fa0, ft10, ft11, fa0
	fmadd.s	ft0, fs0, fs1, ft0
	fmadd.s	ft1, fs2, fs3, ft1
	addi	a2, a2, 32
	addi	a0, a0, 32
	bne	a2, a1, .LBB0_1
# %bb.2:                                # %for.end
	fadd.s	fa5, fa4, fa5
	fadd.s	fa5, fa3, fa5
	fadd.s	fa5, fa2, fa5
	fadd.s	fa5, fa1, fa5
	fadd.s	fa5, fa0, fa5
	fadd.s	fa5, ft0, fa5
	fadd.s	fa0, ft1, fa5
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
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240815-28-gc81a262 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-29-g5bee3a0 esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-31-g75bbe2d esp-18.1.2_20240815-41-g37c20ad8 esp-18.1.2_20240815-49-g6d94704 esp-18.1.2_20240815-51-gd38faa8 esp-18.1.2_20240815-51-gd38faa8 esp-18.1.2_20240829-52-gea35320 esp-18.1.2_20240829-55-g7607179 esp-18.1.2_20240829-55-g7607179 esp-18.1.2_20240829-55-g7607179 esp-18.1.2_20240829 esp-18.1.2_20240829-62-gc926ada esp-18.1.2_20240829-64-g3274136 esp-18.1.2_20240829-66-gd6973ee esp-18.1.2_20240829-66-gd6973ee esp-18.1.2_20240912-67-g79e337e esp-18.1.2_20240912-71-gbb3778d esp-18.1.2_20240912-71-gbb3778d esp-18.1.2_20240912-72-g9403131)"
	.section	".note.GNU-stack","",@progbits
