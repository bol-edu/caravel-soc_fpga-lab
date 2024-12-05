	.file	"fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/lab_4_2_optim/lab-caravel_fir/testbench/counter_la_fir" "fir.c"
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB0:
	.file 1 "fir.c"
	.loc 1 4 61
	.cfi_startproc
	.loc 1 7 2
	.loc 1 7 38 is_stmt 0
	li	a4,805306368
	li	a5,64
	sw	a5,16(a4)
	.loc 1 10 2 is_stmt 1
.LBB2:
	.loc 1 10 7
.LVL0:
	.loc 1 10 25
	.loc 1 11 3
	.loc 1 11 53 is_stmt 0
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lw	a3,0(a5)
	lw	a1,4(a5)
	lw	a2,8(a5)
	.loc 1 11 47
	sw	a3,64(a4)
	.loc 1 10 32 is_stmt 1
.LVL1:
	.loc 1 10 25
	.loc 1 11 3
	.loc 1 11 53 is_stmt 0
	lw	a3,12(a5)
	.loc 1 11 47
	sw	a1,68(a4)
	.loc 1 10 32 is_stmt 1
.LVL2:
	.loc 1 10 25
	.loc 1 11 3
	.loc 1 11 53 is_stmt 0
	lw	a1,16(a5)
	.loc 1 11 47
	sw	a2,72(a4)
	.loc 1 10 32 is_stmt 1
.LVL3:
	.loc 1 10 25
	.loc 1 11 3
	.loc 1 11 53 is_stmt 0
	lw	a2,20(a5)
	.loc 1 11 47
	sw	a3,76(a4)
	.loc 1 10 32 is_stmt 1
.LVL4:
	.loc 1 10 25
	.loc 1 11 3
	.loc 1 11 53 is_stmt 0
	lw	a3,24(a5)
	.loc 1 11 47
	sw	a1,80(a4)
	.loc 1 10 32 is_stmt 1
.LVL5:
	.loc 1 10 25
	.loc 1 11 3
	.loc 1 11 53 is_stmt 0
	lw	a1,28(a5)
	.loc 1 11 47
	sw	a2,84(a4)
	.loc 1 10 32 is_stmt 1
.LVL6:
	.loc 1 10 25
	.loc 1 11 3
	.loc 1 11 53 is_stmt 0
	lw	a2,32(a5)
	.loc 1 11 47
	sw	a3,88(a4)
	.loc 1 10 32 is_stmt 1
.LVL7:
	.loc 1 10 25
	.loc 1 11 3
	.loc 1 11 53 is_stmt 0
	lw	a3,36(a5)
	lw	a5,40(a5)
	.loc 1 11 47
	sw	a1,92(a4)
	.loc 1 10 32 is_stmt 1
.LVL8:
	.loc 1 10 25
	.loc 1 11 3
	.loc 1 11 47 is_stmt 0
	sw	a2,96(a4)
	.loc 1 10 32 is_stmt 1
.LVL9:
	.loc 1 10 25
	.loc 1 11 3
	.loc 1 11 47 is_stmt 0
	sw	a3,100(a4)
	.loc 1 10 32 is_stmt 1
.LVL10:
	.loc 1 10 25
	.loc 1 11 3
	.loc 1 11 47 is_stmt 0
	sw	a5,104(a4)
	.loc 1 10 32 is_stmt 1
.LVL11:
	.loc 1 10 25
.LBE2:
	.loc 1 14 1 is_stmt 0
	ret
	.cfi_endproc
.LFE0:
	.size	initfir, .-initfir
	.align	2
	.globl	fir_excute
	.type	fir_excute, @function
fir_excute:
.LFB1:
	.loc 1 16 64 is_stmt 1
	.cfi_startproc
	.loc 1 18 2
	.loc 1 18 38 is_stmt 0
	li	a5,637534208
	li	a4,10813440
	sw	a4,12(a5)
	.loc 1 21 2 is_stmt 1
	.loc 1 21 38 is_stmt 0
	li	a5,805306368
	li	a4,1
	sw	a4,0(a5)
	.loc 1 23 2 is_stmt 1
.LVL12:
	.loc 1 25 2
	lui	a0,%hi(.LANCHOR1)
	.loc 1 25 38 is_stmt 0
	sw	zero,128(a5)
	.loc 1 27 2 is_stmt 1
.LVL13:
	.loc 1 29 2
	addi	a0,a0,%lo(.LANCHOR1)
	.loc 1 29 38 is_stmt 0
	sw	a4,128(a5)
	.loc 1 31 2 is_stmt 1
	.loc 1 31 11
	.loc 1 32 22 is_stmt 0
	li	a3,805306368
	addi	a4,a0,4
	.loc 1 29 38
	li	a5,2
	.loc 1 31 11
	li	a1,64
.LVL14:
.L4:
	.loc 1 32 3 is_stmt 1
	.loc 1 32 22 is_stmt 0
	lw	a2,132(a3)
	.loc 1 31 11
	addi	a4,a4,4
	.loc 1 32 19
	sw	a2,-4(a4)
	.loc 1 34 3 is_stmt 1
.LVL15:
	.loc 1 36 3
	.loc 1 36 39 is_stmt 0
	sw	a5,128(a3)
	.loc 1 31 11 is_stmt 1
	addi	a5,a5,1
.LVL16:
	bne	a5,a1,.L4
	.loc 1 39 2
	.loc 1 39 25 is_stmt 0
	lw	a4,132(a3)
	.loc 1 46 66
	li	a2,5898240
	.loc 1 45 3
	lw	a3,0(a3)
	.loc 1 46 60
	slli	a5,a4,24
	.loc 1 39 22
	sw	a4,252(a0)
	.loc 1 45 2 is_stmt 1
	.loc 1 46 2
	.loc 1 46 66 is_stmt 0
	or	a5,a5,a2
	.loc 1 46 38
	li	a4,637534208
	sw	a5,12(a4)
	.loc 1 47 1
	ret
	.cfi_endproc
.LFE1:
	.size	fir_excute, .-fir_excute
	.globl	outputsignal
	.globl	taps
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	taps, @object
	.size	taps, 44
taps:
	.word	0
	.word	-10
	.word	-9
	.word	23
	.word	56
	.word	63
	.word	56
	.word	23
	.word	-9
	.word	-10
	.word	0
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	outputsignal, @object
	.size	outputsignal, 256
outputsignal:
	.zero	256
	.text
.Letext0:
	.file 2 "fir.h"
	.file 3 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x10d
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x7
	.4byte	.LASF15
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL2
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	0x3d
	.4byte	0x36
	.byte	0x3
	.4byte	0x36
	.byte	0xa
	.byte	0
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.4byte	.LASF3
	.byte	0x12
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x2
	.4byte	0x3d
	.4byte	0x64
	.byte	0x3
	.4byte	0x36
	.byte	0x3f
	.byte	0
	.byte	0x4
	.4byte	.LASF4
	.byte	0x14
	.4byte	0x54
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF5
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x5
	.4byte	.LASF11
	.byte	0x2e
	.byte	0x17
	.4byte	0x9b
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF10
	.byte	0x5
	.4byte	.LASF12
	.byte	0x34
	.byte	0x1b
	.4byte	0xb4
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF14
	.byte	0x9
	.4byte	.LASF16
	.byte	0x1
	.byte	0x10
	.byte	0x33
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0xe6
	.byte	0x6
	.string	"t"
	.byte	0x17
	.byte	0x13
	.4byte	0x90
	.4byte	.LLST1
	.byte	0
	.byte	0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x4
	.byte	0x33
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0xb
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x6
	.string	"i"
	.byte	0xa
	.byte	0x10
	.4byte	0xa9
	.4byte	.LLST0
	.byte	0
	.byte	0
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
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
	.byte	0x5
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0xb
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST1:
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL13
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL14
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL15
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL16
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x2
	.byte	0x34
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x2
	.byte	0x35
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL7
	.byte	0x2
	.byte	0x36
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL8
	.byte	0x2
	.byte	0x37
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LVL9
	.byte	0x2
	.byte	0x38
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL10
	.byte	0x2
	.byte	0x39
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LFE0
	.byte	0x2
	.byte	0x3b
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x24
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
.LLRL2:
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"long long int"
.LASF2:
	.string	"unsigned int"
.LASF15:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Ofast -ffreestanding"
.LASF3:
	.string	"taps"
.LASF4:
	.string	"outputsignal"
.LASF13:
	.string	"long unsigned int"
.LASF14:
	.string	"long long unsigned int"
.LASF11:
	.string	"uint8_t"
.LASF9:
	.string	"unsigned char"
.LASF17:
	.string	"initfir"
.LASF12:
	.string	"uint32_t"
.LASF7:
	.string	"long int"
.LASF10:
	.string	"short unsigned int"
.LASF5:
	.string	"signed char"
.LASF16:
	.string	"fir_excute"
.LASF6:
	.string	"short int"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"fir.c"
.LASF1:
	.string	"/home/ubuntu/lab_4_2_optim/lab-caravel_fir/testbench/counter_la_fir"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
