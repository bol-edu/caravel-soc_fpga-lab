	.file	"mm.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/lab_6_wlos/testbench/uart" "mm.c"
	.globl	A
	.data
	.align	2
	.type	A, @object
	.size	A, 64
A:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.globl	B
	.align	2
	.type	B, @object
	.size	B, 64
B:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.globl	result
	.bss
	.align	2
	.type	result, @object
	.size	result, 64
result:
	.zero	64
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB0:
	.file 1 "mm.c"
	.loc 1 5 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 7 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 1 7 38
	li	a4,10813440
	sw	a4,0(a5)
	.loc 1 9 6
	sw	zero,-20(s0)
	.loc 1 10 6
	sw	zero,-24(s0)
	.loc 1 15 8
	sw	zero,-20(s0)
	.loc 1 15 2
	j	.L2
.L5:
	.loc 1 16 9
	sw	zero,-24(s0)
	.loc 1 16 3
	j	.L3
.L4:
	.loc 1 21 55 discriminator 3
	lw	a5,-20(s0)
	slli	a4,a5,2
	.loc 1 21 59 discriminator 3
	lw	a5,-24(s0)
	add	a5,a4,a5
	.loc 1 21 52 discriminator 3
	lui	a4,%hi(A)
	addi	a4,a4,%lo(A)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 1 21 14 discriminator 3
	li	a5,838860800
	.loc 1 21 49 discriminator 3
	sw	a4,0(a5)
	.loc 1 16 19 discriminator 3
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L3:
	.loc 1 16 14 discriminator 1
	lw	a4,-24(s0)
	li	a5,3
	ble	a4,a5,.L4
	.loc 1 15 18 discriminator 2
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	.loc 1 15 13 discriminator 1
	lw	a4,-20(s0)
	li	a5,3
	ble	a4,a5,.L5
	.loc 1 24 11
	sw	zero,-20(s0)
	.loc 1 24 5
	j	.L6
.L9:
	.loc 1 25 9
	sw	zero,-24(s0)
	.loc 1 25 3
	j	.L7
.L8:
	.loc 1 26 55 discriminator 3
	lw	a5,-20(s0)
	slli	a4,a5,2
	.loc 1 26 59 discriminator 3
	lw	a5,-24(s0)
	add	a5,a4,a5
	.loc 1 26 52 discriminator 3
	lui	a4,%hi(B)
	addi	a4,a4,%lo(B)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 1 26 14 discriminator 3
	li	a5,838860800
	.loc 1 26 49 discriminator 3
	sw	a4,0(a5)
	.loc 1 25 19 discriminator 3
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L7:
	.loc 1 25 14 discriminator 1
	lw	a4,-24(s0)
	li	a5,3
	ble	a4,a5,.L8
	.loc 1 24 21 discriminator 2
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L6:
	.loc 1 24 16 discriminator 1
	lw	a4,-20(s0)
	li	a5,3
	ble	a4,a5,.L9
	.loc 1 29 11
	sw	zero,-20(s0)
	.loc 1 29 5
	j	.L10
.L13:
	.loc 1 30 9
	sw	zero,-24(s0)
	.loc 1 30 3
	j	.L11
.L12:
	.loc 1 31 34 discriminator 3
	li	a5,838860800
	addi	a5,a5,16
	lw	a3,0(a5)
	.loc 1 31 22 discriminator 3
	lw	a5,-20(s0)
	slli	a4,a5,2
	.loc 1 31 26 discriminator 3
	lw	a5,-24(s0)
	add	a5,a4,a5
	.loc 1 31 31 discriminator 3
	lui	a4,%hi(result)
	addi	a4,a4,%lo(result)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a3,0(a5)
	.loc 1 30 19 discriminator 3
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L11:
	.loc 1 30 14 discriminator 1
	lw	a4,-24(s0)
	li	a5,3
	ble	a4,a5,.L12
	.loc 1 29 21 discriminator 2
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L10:
	.loc 1 29 16 discriminator 1
	lw	a4,-20(s0)
	li	a5,3
	ble	a4,a5,.L13
	.loc 1 35 1
	nop
	mv	a0,a5
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	matmul, .-matmul
	.text
.Letext0:
	.file 2 "mm.h"
	.file 3 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xea
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.4byte	.LASF12
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
	.byte	0xf
	.byte	0
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.string	"A"
	.byte	0xb
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0x2
	.string	"B"
	.byte	0x11
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x8
	.4byte	.LASF3
	.byte	0x2
	.byte	0x17
	.byte	0x5
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	result
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF9
	.byte	0x9
	.4byte	.LASF13
	.byte	0x3
	.byte	0x34
	.byte	0x1b
	.4byte	0xa8
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.byte	0xa
	.4byte	.LASF14
	.byte	0x1
	.byte	0x4
	.byte	0x33
	.4byte	0xe7
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xe7
	.byte	0x3
	.string	"i"
	.byte	0x9
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x3
	.string	"j"
	.byte	0xa
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xb
	.byte	0x4
	.4byte	0x3d
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0x2
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
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
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
	.byte	0x16
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
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
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
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"long long int"
.LASF2:
	.string	"unsigned int"
.LASF13:
	.string	"uint32_t"
.LASF10:
	.string	"long unsigned int"
.LASF11:
	.string	"long long unsigned int"
.LASF8:
	.string	"unsigned char"
.LASF3:
	.string	"result"
.LASF6:
	.string	"long int"
.LASF14:
	.string	"matmul"
.LASF9:
	.string	"short unsigned int"
.LASF4:
	.string	"signed char"
.LASF5:
	.string	"short int"
.LASF12:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/lab_6_wlos/testbench/uart"
.LASF0:
	.string	"mm.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
