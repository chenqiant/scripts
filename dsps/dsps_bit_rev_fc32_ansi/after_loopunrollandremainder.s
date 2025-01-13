# 2025-01-10 17:28:31
	.text
	.attribute	4, 16
	#.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_c2p0_zicsr2p0_zifencei2p0_zca1p0_zcb1p0_zcmp1p0_zcmt1p0_xesppie1p0"
	.file	"dsps_bit_rev_fc32_arp41.c"
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.globl	dsps_bit_rev_fc32_arp4          # -- Begin function dsps_bit_rev_fc32_arp4
	.p2align	1
	.type	dsps_bit_rev_fc32_arp4,@function
dsps_bit_rev_fc32_arp4:                 # @dsps_bit_rev_fc32_arp4
# %bb.0:                                # %entry
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	sw	s1, 20(sp)                      # 4-byte Folded Spill
	sw	s2, 16(sp)                      # 4-byte Folded Spill
	sw	s3, 12(sp)                      # 4-byte Folded Spill
	sw	s4, 8(sp)                       # 4-byte Folded Spill
	mv	s3, a1
	mv	s2, a0
	mv	a0, a1
	call	dsp_is_power_of_two
	beqz	a0, .LBB0_5
# %bb.1:                                # %for.cond.preheader
	li	a0, 3
	blt	s3, a0, .LBB0_4
# %bb.2:                                # %for.body.preheader
	li	a2, 0
	li	a0, 2
	sub	s0, a0, s3
	li	s4, 1
	li	s1, 1
.LBB0_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	mv	a0, s2
	mv	a1, s1
	mv	a3, s3
	call	bit_rev_single_step
	addi	s1, s1, 1
	add	a1, s0, s1
	mv	a2, a0
	bne	a1, s4, .LBB0_3
.LBB0_4:
	li	a0, 0
	j	.LBB0_6
.LBB0_5:
	lui	a0, 112
	addi	a0, a0, 1
.LBB0_6:                                # %return
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	lw	s1, 20(sp)                      # 4-byte Folded Reload
	lw	s2, 16(sp)                      # 4-byte Folded Reload
	lw	s3, 12(sp)                      # 4-byte Folded Reload
	lw	s4, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	dsps_bit_rev_fc32_arp4, .Lfunc_end0-dsps_bit_rev_fc32_arp4
                                        # -- End function
	.option	pop
	.option	push
	#.option	arch, -zca, -zcb, -zcmp, -zcmt
	.p2align	1                               # -- Begin function bit_rev_single_step
	.type	bit_rev_single_step,@function
bit_rev_single_step:                    # @bit_rev_single_step
# %bb.0:                                # %entry
.LBB1_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	mv	a4, a2
	srai	a3, a3, 1
	sub	a2, a2, a3
	bge	a4, a3, .LBB1_1
# %bb.2:                                # %while.end
	add	a2, a4, a3
	bge	a1, a2, .LBB1_4
# %bb.3:                                # %if.then
	slli	a3, a2, 3
	add	a3, a3, a0
	slli	a1, a1, 3
	add	a0, a0, a1
	flw	fa5, 0(a0)
	flw	fa4, 4(a0)
	flw	fa3, 0(a3)
	flw	fa2, 4(a3)
	fsw	fa5, 0(a3)
	fsw	fa4, 4(a3)
	fsw	fa3, 0(a0)
	fsw	fa2, 4(a0)
.LBB1_4:                                # %if.end
	mv	a0, a2
	ret
.Lfunc_end1:
	.size	bit_rev_single_step, .Lfunc_end1-bit_rev_single_step
                                        # -- End function
	.option	pop
	.ident	"Espressif clang version 18.1.2 (https://gitlab.espressif.cn:6688/idf/llvm-project.git esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595 esp-18.1.2_20240912-624-gcde4595)"
	.section	".note.GNU-stack","",@progbits
