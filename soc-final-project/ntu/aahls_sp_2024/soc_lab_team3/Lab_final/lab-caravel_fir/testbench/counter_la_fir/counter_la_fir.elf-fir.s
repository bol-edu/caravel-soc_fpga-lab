	.file	"fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/Desktop/SOC/Lab4/lab-caravel_fir/testbench/counter_la_fir" "fir.c"
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
	lui	a5,%hi(.LANCHOR0)
	addi	a1,a5,%lo(.LANCHOR0)
.LBB2:
	.loc 1 11 5
	addi	a2,a4,64
.LBE2:
	.loc 1 7 38
	addi	a5,a5,%lo(.LANCHOR0)
	li	a3,64
	sw	a3,16(a4)
	.loc 1 10 2 is_stmt 1
.LBB3:
	.loc 1 10 7
.LVL0:
	.loc 1 10 25
	addi	a1,a1,44
	.loc 1 11 5 is_stmt 0
	sub	a2,a2,a5
.LVL1:
.L2:
	.loc 1 11 3 is_stmt 1 discriminator 3
	.loc 1 11 53 is_stmt 0 discriminator 3
	lw	a3,0(a5)
	.loc 1 11 5 discriminator 3
	add	a4,a2,a5
	.loc 1 10 25 discriminator 3
	addi	a5,a5,4
	.loc 1 11 47 discriminator 3
	sw	a3,0(a4)
	.loc 1 10 32 is_stmt 1 discriminator 3
	.loc 1 10 25 discriminator 3
	bne	a5,a1,.L2
.LBE3:
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
	li	a3,1
	li	a5,805306368
	sw	a3,0(a5)
	.loc 1 23 2 is_stmt 1
.LVL2:
	.loc 1 24 2
	.loc 1 26 2
	lui	a4,%hi(.LANCHOR1)
	.loc 1 26 38 is_stmt 0
	sw	zero,128(a5)
	.loc 1 28 2 is_stmt 1
.LVL3:
	.loc 1 32 2
	.loc 1 32 38 is_stmt 0
	sw	a3,128(a5)
	.loc 1 40 2 is_stmt 1
	.loc 1 40 11
	addi	a0,a4,%lo(.LANCHOR1)
	.loc 1 32 38 is_stmt 0
	li	a5,2
	addi	a4,a4,%lo(.LANCHOR1)
	.loc 1 41 11
	li	a3,805306368
	.loc 1 40 11
	li	a1,64
.LVL4:
.L6:
	.loc 1 41 3 is_stmt 1
	.loc 1 41 11 is_stmt 0
	lw	a2,132(a3)
	.loc 1 42 3 is_stmt 1
	.loc 1 42 39 is_stmt 0
	sw	a5,128(a3)
	.loc 1 43 3 is_stmt 1
	.loc 1 40 11 is_stmt 0
	addi	a5,a5,1
.LVL5:
	.loc 1 43 24
	sw	a2,0(a4)
	.loc 1 44 3 is_stmt 1
	.loc 1 45 3
.LVL6:
	.loc 1 40 11
	addi	a4,a4,4
	bne	a5,a1,.L6
	lui	a5,%hi(temp)
	sw	a2,%lo(temp)(a5)
	li	a5,63
	sw	a5,128(a3)
	.loc 1 48 25 is_stmt 0
	lw	a1,132(a3)
	.loc 1 49 25
	lw	a4,132(a3)
	.loc 1 55 66
	li	a6,5898240
	.loc 1 54 3
	lw	a3,0(a3)
	.loc 1 55 60
	slli	a5,a4,24
	.loc 1 49 22
	sw	a4,252(a0)
	.loc 1 55 66
	or	a5,a5,a6
	sw	a2,244(a0)
	.loc 1 48 2 is_stmt 1
	.loc 1 48 22 is_stmt 0
	sw	a1,248(a0)
	.loc 1 49 2 is_stmt 1
	.loc 1 54 2
	.loc 1 55 2
	.loc 1 55 38 is_stmt 0
	li	a4,637534208
	sw	a5,12(a4)
	.loc 1 56 1
	ret
	.cfi_endproc
.LFE1:
	.size	fir_excute, .-fir_excute
	.globl	temp
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
	.section	.sbss,"aw",@nobits
	.align	2
	.type	temp, @object
	.size	temp, 4
temp:
	.zero	4
	.text
.Letext0:
	.file 2 "fir.h"
	.file 3 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x129
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x7
	.4byte	.LASF17
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL4
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x3
	.4byte	0x3d
	.4byte	0x36
	.byte	0x4
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
	.byte	0x2
	.4byte	.LASF3
	.byte	0x13
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x3
	.4byte	0x3d
	.4byte	0x64
	.byte	0x4
	.4byte	0x36
	.byte	0x3f
	.byte	0
	.byte	0x2
	.4byte	.LASF4
	.byte	0x15
	.4byte	0x54
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0x2
	.4byte	.LASF5
	.byte	0x16
	.4byte	0x3d
	.byte	0x5
	.byte	0x3
	.4byte	temp
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.byte	0x5
	.4byte	.LASF12
	.byte	0x2e
	.byte	0x17
	.4byte	0xab
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF11
	.byte	0x5
	.4byte	.LASF13
	.byte	0x34
	.byte	0x1b
	.4byte	0xc4
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF15
	.byte	0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0x10
	.byte	0x33
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x106
	.byte	0x6
	.string	"t"
	.byte	0x17
	.byte	0x13
	.4byte	0xa0
	.4byte	.LLST2
	.byte	0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0x18
	.byte	0x13
	.4byte	0xa0
	.4byte	.LLST3
	.byte	0
	.byte	0xb
	.4byte	.LASF19
	.byte	0x1
	.byte	0x4
	.byte	0x33
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LLRL0
	.byte	0x6
	.string	"i"
	.byte	0xa
	.byte	0x10
	.4byte	0xb9
	.4byte	.LLST1
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
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
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
.LLST2:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL4
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x3
	.byte	0x7f
	.byte	0x7e
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x2
	.byte	0x30
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
.LLRL0:
	.byte	0x6
	.4byte	.LBB2
	.4byte	.LBE2
	.byte	0x6
	.4byte	.LBB3
	.4byte	.LBE3
	.byte	0
.LLRL4:
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
.LASF16:
	.string	"t_save"
.LASF17:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O2 -ffreestanding"
.LASF10:
	.string	"unsigned char"
.LASF14:
	.string	"long unsigned int"
.LASF5:
	.string	"temp"
.LASF11:
	.string	"short unsigned int"
.LASF19:
	.string	"initfir"
.LASF18:
	.string	"fir_excute"
.LASF2:
	.string	"unsigned int"
.LASF3:
	.string	"taps"
.LASF15:
	.string	"long long unsigned int"
.LASF12:
	.string	"uint8_t"
.LASF4:
	.string	"outputsignal"
.LASF9:
	.string	"long long int"
.LASF7:
	.string	"short int"
.LASF13:
	.string	"uint32_t"
.LASF8:
	.string	"long int"
.LASF6:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/Desktop/SOC/Lab4/lab-caravel_fir/testbench/counter_la_fir"
.LASF0:
	.string	"fir.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
