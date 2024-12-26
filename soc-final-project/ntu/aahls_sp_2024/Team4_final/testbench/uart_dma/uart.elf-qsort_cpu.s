	.file	"qsort_cpu.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/lab_6_wlos/testbench/uart" "qsort_cpu.c"
	.globl	Q
	.data
	.align	2
	.type	Q, @object
	.size	Q, 40
Q:
	.word	893
	.word	40
	.word	3233
	.word	4267
	.word	2669
	.word	2541
	.word	9073
	.word	6023
	.word	5681
	.word	4622
	.globl	result_q
	.bss
	.align	2
	.type	result_q, @object
	.size	result_q, 40
result_q:
	.zero	40
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	partition
	.type	partition, @function
partition:
.LFB0:
	.file 1 "qsort_cpu.c"
	.loc 1 3 75
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,44(sp)
	.cfi_offset 8, -4
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	.loc 1 4 6
	lui	a5,%hi(Q)
	addi	a4,a5,%lo(Q)
	lw	a5,-40(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-28(s0)
	.loc 1 5 6
	lw	a5,-36(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
	.loc 1 7 8
	lw	a5,-36(s0)
	sw	a5,-24(s0)
	.loc 1 7 2
	j	.L2
.L4:
	.loc 1 8 7
	lui	a5,%hi(Q)
	addi	a4,a5,%lo(Q)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	.loc 1 8 5
	lw	a4,-28(s0)
	ble	a4,a5,.L3
	.loc 1 9 6
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	.loc 1 10 9
	lui	a5,%hi(Q)
	addi	a4,a5,%lo(Q)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-32(s0)
	.loc 1 11 12
	lui	a5,%hi(Q)
	addi	a4,a5,%lo(Q)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 1 11 9
	lui	a5,%hi(Q)
	addi	a3,a5,%lo(Q)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	.loc 1 12 9
	lui	a5,%hi(Q)
	addi	a4,a5,%lo(Q)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-32(s0)
	sw	a4,0(a5)
.L3:
	.loc 1 7 20 discriminator 2
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L2:
	.loc 1 7 15 discriminator 1
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L4
	.loc 1 15 6
	lui	a5,%hi(Q)
	addi	a4,a5,%lo(Q)
	lw	a5,-40(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 1 15 16
	lw	a5,-20(s0)
	addi	a5,a5,1
	.loc 1 15 14
	lui	a3,%hi(Q)
	addi	a3,a3,%lo(Q)
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	.loc 1 15 4
	bge	a4,a5,.L5
	.loc 1 16 13
	lw	a5,-20(s0)
	addi	a5,a5,1
	.loc 1 16 8
	lui	a4,%hi(Q)
	addi	a4,a4,%lo(Q)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-32(s0)
	.loc 1 17 6
	lw	a5,-20(s0)
	addi	a5,a5,1
	.loc 1 17 13
	lui	a4,%hi(Q)
	addi	a3,a4,%lo(Q)
	lw	a4,-40(s0)
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	.loc 1 17 10
	lui	a3,%hi(Q)
	addi	a3,a3,%lo(Q)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	.loc 1 18 9
	lui	a5,%hi(Q)
	addi	a4,a5,%lo(Q)
	lw	a5,-40(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-32(s0)
	sw	a4,0(a5)
.L5:
	.loc 1 20 10
	lw	a5,-20(s0)
	addi	a5,a5,1
	.loc 1 21 1
	mv	a0,a5
	lw	s0,44(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	partition, .-partition
	.align	2
	.globl	sort
	.type	sort, @function
sort:
.LFB1:
	.loc 1 23 72
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	.loc 1 24 4
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	bge	a4,a5,.L9
.LBB2:
	.loc 1 25 11
	lw	a1,-40(s0)
	lw	a0,-36(s0)
	call	partition
	sw	a0,-20(s0)
	.loc 1 26 3
	lw	a5,-20(s0)
	addi	a5,a5,-1
	mv	a1,a5
	lw	a0,-36(s0)
	call	sort
	.loc 1 27 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	lw	a1,-40(s0)
	mv	a0,a5
	call	sort
.L9:
.LBE2:
	.loc 1 29 1
	nop
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	sort, .-sort
	.align	2
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB2:
	.loc 1 31 58
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 32 2
	li	a1,9
	li	a0,0
	call	sort
	.loc 1 33 9
	lui	a5,%hi(Q)
	addi	a5,a5,%lo(Q)
	.loc 1 34 1
	mv	a0,a5
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	qsort, .-qsort
	.text
.Letext0:
	.file 2 "qsort.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x12b
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.4byte	.LASF8
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x5
	.4byte	0x3d
	.4byte	0x36
	.byte	0x6
	.4byte	0x36
	.byte	0x9
	.byte	0
	.byte	0x7
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x9
	.string	"Q"
	.byte	0x2
	.byte	0xa
	.byte	0x5
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	Q
	.byte	0xa
	.4byte	.LASF3
	.byte	0x2
	.byte	0xc
	.byte	0x5
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	result_q
	.byte	0xb
	.4byte	.LASF9
	.byte	0x1
	.byte	0x1f
	.byte	0x33
	.4byte	0x7c
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.byte	0x4
	.4byte	0x3d
	.byte	0xd
	.4byte	.LASF4
	.byte	0x1
	.byte	0x17
	.byte	0x33
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0xca
	.byte	0x1
	.string	"low"
	.byte	0x17
	.byte	0x3c
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x1
	.string	"hi"
	.byte	0x17
	.byte	0x45
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xe
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x2
	.string	"p"
	.byte	0x19
	.byte	0x7
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	.LASF5
	.byte	0x1
	.byte	0x3
	.byte	0x32
	.4byte	0x3d
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.string	"low"
	.byte	0x3
	.byte	0x40
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x1
	.string	"hi"
	.byte	0x3
	.byte	0x48
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x3
	.4byte	.LASF6
	.byte	0x4
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x2
	.string	"i"
	.byte	0x5
	.byte	0x6
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x2
	.string	"j"
	.byte	0x5
	.byte	0x10
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF7
	.byte	0x6
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL0:
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"unsigned int"
.LASF6:
	.string	"pivot"
.LASF9:
	.string	"qsort"
.LASF7:
	.string	"temp"
.LASF5:
	.string	"partition"
.LASF3:
	.string	"result_q"
.LASF8:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF4:
	.string	"sort"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/lab_6_wlos/testbench/uart"
.LASF0:
	.string	"qsort_cpu.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
