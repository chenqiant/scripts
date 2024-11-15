	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_xesppie1p0"
	.file	"dsps_sqrt_f32_ansi.c"
	.globl	dsps_sqrtf_f32_ansi             # -- Begin function dsps_sqrtf_f32_ansi
	.p2align	1
	.type	dsps_sqrtf_f32_ansi,@function
dsps_sqrtf_f32_ansi:                    # @dsps_sqrtf_f32_ansi
# %bb.0:                                # %entry
	fmv.x.w	a0, fa0
	srai	a0, a0, 1
	lui	a1, 129972
	add	a0, a0, a1
	fmv.w.x	fa0, a0
	ret
.Lfunc_end0:
	.size	dsps_sqrtf_f32_ansi, .Lfunc_end0-dsps_sqrtf_f32_ansi
                                        # -- End function
	.globl	dsps_sqrt_f32_ansi              # -- Begin function dsps_sqrt_f32_ansi
	.p2align	1
	.type	dsps_sqrt_f32_ansi,@function
dsps_sqrt_f32_ansi:                     # @dsps_sqrt_f32_ansi
# %bb.0:                                # %entry
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
	sw	s9, 8(sp)                       # 4-byte Folded Spill
	sw	s10, 4(sp)                      # 4-byte Folded Spill
	lui	a3, 112
	addi	a3, a3, 3
	beqz	a0, .LBB1_13
# %bb.1:                                # %entry
	beqz	a1, .LBB1_13
# %bb.2:                                # %if.end
	li	a3, 2
	bge	a3, a2, .LBB1_9
# %bb.3:                                # %for.cond.preheader.new
	li	a7, 0
	li	a3, 16
	bltu	a2, a3, .LBB1_6
# %bb.4:                                # %for.body.modify.preheader
	addi	a6, a2, -16
	addi	a5, a1, 32
	addi	a4, a0, 32
	lui	a3, 129972
.LBB1_5:                                # %for.body.modify
                                        # =>This Inner Loop Header: Depth=1
	lw	t0, -32(a4)
	lw	t1, -28(a4)
	lw	t2, -24(a4)
	lw	t3, -20(a4)
	lw	t4, -16(a4)
	lw	t5, -12(a4)
	lw	t6, -8(a4)
	lw	s0, -4(a4)
	lw	s9, 0(a4)
	lw	s2, 4(a4)
	lw	s3, 8(a4)
	lw	s4, 12(a4)
	lw	s5, 16(a4)
	lw	s6, 20(a4)
	lw	s7, 24(a4)
	lw	s8, 28(a4)
	srai	s1, t0, 1
	add	t0, s1, a3
	srai	s1, t1, 1
	add	t1, s1, a3
	srai	s1, t2, 1
	add	t2, s1, a3
	srai	s1, t3, 1
	add	t3, s1, a3
	srai	s1, t4, 1
	add	t4, s1, a3
	srai	s1, t5, 1
	add	t5, s1, a3
	srai	s1, t6, 1
	add	t6, s1, a3
	srai	s0, s0, 1
	add	s10, s0, a3
	srai	s1, s9, 1
	add	s9, s1, a3
	srai	s0, s2, 1
	add	s2, s0, a3
	srai	s1, s3, 1
	add	s3, s1, a3
	srai	s0, s4, 1
	add	s4, s0, a3
	srai	s1, s5, 1
	add	s5, s1, a3
	srai	s0, s6, 1
	add	s6, s0, a3
	srai	s1, s7, 1
	add	s1, s1, a3
	srai	s0, s8, 1
	add	s0, s0, a3
	sw	s0, 28(a5)
	sw	s1, 24(a5)
	sw	s6, 20(a5)
	sw	s5, 16(a5)
	sw	s4, 12(a5)
	sw	s3, 8(a5)
	sw	s2, 4(a5)
	sw	s9, 0(a5)
	sw	s10, -4(a5)
	sw	t6, -8(a5)
	sw	t5, -12(a5)
	sw	t4, -16(a5)
	sw	t3, -20(a5)
	sw	t2, -24(a5)
	sw	t1, -28(a5)
	sw	t0, -32(a5)
	addi	a7, a7, 16
	addi	a5, a5, 64
	addi	a4, a4, 64
	bge	a6, a7, .LBB1_5
.LBB1_6:                                # %for.cond.preheader.new2
	bge	a7, a2, .LBB1_12
# %bb.7:                                # %for.body.preheader
	slli	a7, a7, 2
	add	a3, a1, a7
	add	a0, a0, a7
	slli	a2, a2, 2
	add	a1, a1, a2
	lui	a2, 129972
.LBB1_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a0)
	srai	a4, a4, 1
	add	a4, a4, a2
	sw	a4, 0(a3)
	addi	a3, a3, 4
	addi	a0, a0, 4
	bne	a3, a1, .LBB1_8
	j	.LBB1_12
.LBB1_9:                                # %for.cond.preheader
	blez	a2, .LBB1_12
# %bb.10:                               # %for.body.clone.preheader
	slli	a2, a2, 2
	add	a2, a2, a1
	lui	a3, 129972
.LBB1_11:                               # %for.body.clone
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a0)
	srai	a4, a4, 1
	add	a4, a4, a3
	sw	a4, 0(a1)
	addi	a1, a1, 4
	addi	a0, a0, 4
	bne	a1, a2, .LBB1_11
.LBB1_12:
	li	a3, 0
.LBB1_13:                               # %return
	mv	a0, a3
	lw	s0, 44(sp)                      # 4-byte Folded Reload
	lw	s1, 40(sp)                      # 4-byte Folded Reload
	lw	s2, 36(sp)                      # 4-byte Folded Reload
	lw	s3, 32(sp)                      # 4-byte Folded Reload
	lw	s4, 28(sp)                      # 4-byte Folded Reload
	lw	s5, 24(sp)                      # 4-byte Folded Reload
	lw	s6, 20(sp)                      # 4-byte Folded Reload
	lw	s7, 16(sp)                      # 4-byte Folded Reload
	lw	s8, 12(sp)                      # 4-byte Folded Reload
	lw	s9, 8(sp)                       # 4-byte Folded Reload
	lw	s10, 4(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end1:
	.size	dsps_sqrt_f32_ansi, .Lfunc_end1-dsps_sqrt_f32_ansi
                                        # -- End function
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-173-ga680c2f esp-18.1.2_20240912-159-g1d4d6ed esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240912-159-g7f41e83 esp-18.1.2_20240829 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240829 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g19b0f98 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-182-g14aa699 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-g2ce75d8 esp-18.1.2_20240912-2-g4fd8338 esp-18.1.2_20240912-173-g279ba15 esp-18.1.2_20240912-174-gea75913 esp-18.1.2_20240912-188-g4fb459e esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-201-gd45e9b3 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-177-g05a8c17 esp-18.1.2_20240912-202-gc0d5d19 esp-18.1.2_20240912-1-g6d9b6c0 esp-18.1.2_20240912-2-g8cbccfa esp-18.1.2_20240912-2-g0e0e2c1 esp-18.1.2_20240912-2-gff36117 esp-18.1.2_20240912-178-g344e70f esp-18.1.2_20240912-2-g033ac4d esp-18.1.2_20240912-2-g0a05e54 esp-18.1.2_20240912-2-g2639da8 esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-180-gd5bd65d esp-18.1.2_20240912-183-gaf4b702 esp-18.1.2_20240912-5-g39bbb32f esp-18.1.2_20240912-5-gede6d43 esp-18.1.2_20240912-5-gd4169ab esp-18.1.2_20240912-5-ge743d5e esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-204-gb719e68 esp-18.1.2_20240912-6-g07a121a esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-205-g328bc73 esp-18.1.2_20240912-217-g1614480 esp-18.1.2_20240912-224-g675f4cd esp-18.1.2_20240912-227-g17a3e8a esp-18.1.2_20240912-230-gaa5e53d esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-238-g8482f1f esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0 esp-18.1.2_20240912-239-g9c7dcf0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
