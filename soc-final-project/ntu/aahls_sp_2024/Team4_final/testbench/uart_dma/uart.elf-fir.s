	.file	"fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/lab_6_wlos/testbench/uart" "fir.c"
	.globl	taps
	.data
	.align	2
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
	.globl	inputbuffer
	.bss
	.align	2
	.type	inputbuffer, @object
	.size	inputbuffer, 256
inputbuffer:
	.zero	256
	.globl	outputsignal
	.align	2
	.type	outputsignal, @object
	.size	outputsignal, 256
outputsignal:
	.zero	256
	.globl	temp
	.section	.sbss,"aw",@nobits
	.align	2
	.type	temp, @object
	.size	temp, 4
temp:
	.zero	4
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB0:
	.file 1 "fir.c"
	.loc 1 4 61
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 7 3
	li	a5,822083584
	addi	a5,a5,16
	.loc 1 7 38
	li	a4,64
	sw	a4,0(a5)
.LBB2:
	.loc 1 10 16
	sw	zero,-20(s0)
	.loc 1 10 2
	j	.L2
.L3:
	.loc 1 11 53 discriminator 3
	lui	a5,%hi(taps)
	addi	a4,a5,%lo(taps)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a3,0(a5)
	.loc 1 11 38 discriminator 3
	lw	a4,-20(s0)
	li	a5,205520896
	addi	a5,a5,16
	add	a5,a4,a5
	slli	a5,a5,2
	.loc 1 11 53 discriminator 3
	mv	a4,a3
	.loc 1 11 47 discriminator 3
	sw	a4,0(a5)
	.loc 1 10 32 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	.loc 1 10 25 discriminator 1
	lw	a4,-20(s0)
	li	a5,10
	bleu	a4,a5,.L3
.LBE2:
	.loc 1 14 1
	nop
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	initfir, .-initfir
	.align	2
	.globl	fir_excute
	.type	fir_excute, @function
fir_excute:
.LFB1:
	.loc 1 16 64
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	s2,4(sp)
	.cfi_offset 8, -4
	.cfi_offset 9, -8
	.cfi_offset 18, -12
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 18 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 1 18 38
	li	a4,10813440
	sw	a4,0(a5)
	.loc 1 21 3
	li	a5,822083584
	.loc 1 21 38
	li	a4,1
	sw	a4,0(a5)
	.loc 1 23 19
	li	s1,0
	.loc 1 24 19
	li	s2,0
	.loc 1 26 3
	li	a5,822083584
	addi	a5,a5,128
	.loc 1 26 38
	mv	a4,s1
	sw	a4,0(a5)
	.loc 1 28 4
	addi	a5,s1,1
	andi	s1,a5,0xff
	.loc 1 32 3
	li	a5,822083584
	addi	a5,a5,128
	.loc 1 32 38
	mv	a4,s1
	sw	a4,0(a5)
	.loc 1 42 8
	j	.L5
.L6:
	.loc 1 43 11
	li	a5,822083584
	addi	a5,a5,132
	lw	a5,0(a5)
	mv	a4,a5
	.loc 1 43 8
	lui	a5,%hi(temp)
	sw	a4,%lo(temp)(a5)
	.loc 1 44 42
	mv	a5,s1
	addi	a4,a5,1
	.loc 1 44 4
	li	a5,822083584
	addi	a5,a5,128
	.loc 1 44 39
	sw	a4,0(a5)
	.loc 1 45 15
	mv	a2,s2
	.loc 1 45 24
	lui	a5,%hi(temp)
	lw	a4,%lo(temp)(a5)
	lui	a5,%hi(outputsignal)
	addi	a3,a5,%lo(outputsignal)
	slli	a5,a2,2
	add	a5,a3,a5
	sw	a4,0(a5)
	.loc 1 46 5
	addi	a5,s1,1
	andi	s1,a5,0xff
	.loc 1 47 10
	addi	a5,s2,1
	andi	s2,a5,0xff
.L5:
	.loc 1 42 11
	li	a5,62
	bleu	s1,a5,.L6
	.loc 1 50 25
	li	a5,822083584
	addi	a5,a5,132
	lw	a5,0(a5)
	mv	a4,a5
	.loc 1 50 22
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	sw	a4,248(a5)
	.loc 1 51 25
	li	a5,822083584
	addi	a5,a5,132
	lw	a5,0(a5)
	mv	a4,a5
	.loc 1 51 22
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	sw	a4,252(a5)
	.loc 1 56 3
	li	a5,822083584
	lw	a5,0(a5)
	.loc 1 57 52
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	lw	a5,252(a5)
	.loc 1 57 60
	slli	a4,a5,24
	.loc 1 57 66
	li	a5,5898240
	or	a4,a4,a5
	.loc 1 57 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 1 57 38
	sw	a4,0(a5)
	.loc 1 58 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	lw	s1,8(sp)
	.cfi_restore 9
	lw	s2,4(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	fir_excute, .-fir_excute
	.text
.Letext0:
	.file 2 "fir.h"
	.file 3 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x138
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x7
	.4byte	.LASF18
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
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
	.byte	0x16
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
	.byte	0x18
	.4byte	0x54
	.byte	0x5
	.byte	0x3
	.4byte	inputbuffer
	.byte	0x2
	.4byte	.LASF5
	.byte	0x19
	.4byte	0x54
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0x2
	.4byte	.LASF6
	.byte	0x1a
	.4byte	0x3d
	.byte	0x5
	.byte	0x3
	.4byte	temp
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF7
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF8
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.byte	0x5
	.4byte	.LASF13
	.byte	0x2e
	.byte	0x17
	.4byte	0xbb
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF12
	.byte	0x5
	.4byte	.LASF14
	.byte	0x34
	.byte	0x1b
	.4byte	0xd4
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF16
	.byte	0x9
	.4byte	.LASF19
	.byte	0x1
	.byte	0x10
	.byte	0x33
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x112
	.byte	0x6
	.string	"t"
	.byte	0x17
	.byte	0x13
	.4byte	0xb0
	.byte	0x1
	.byte	0x59
	.byte	0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x18
	.byte	0x13
	.4byte	0xb0
	.byte	0x1
	.byte	0x62
	.byte	0
	.byte	0xb
	.4byte	.LASF20
	.byte	0x1
	.byte	0x4
	.byte	0x33
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x6
	.string	"i"
	.byte	0xa
	.byte	0x10
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x6c
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
	.byte	0x18
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
	.byte	0x18
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0
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
.LASF17:
	.string	"t_save"
.LASF11:
	.string	"unsigned char"
.LASF15:
	.string	"long unsigned int"
.LASF6:
	.string	"temp"
.LASF12:
	.string	"short unsigned int"
.LASF14:
	.string	"uint32_t"
.LASF18:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF20:
	.string	"initfir"
.LASF19:
	.string	"fir_excute"
.LASF2:
	.string	"unsigned int"
.LASF3:
	.string	"taps"
.LASF16:
	.string	"long long unsigned int"
.LASF13:
	.string	"uint8_t"
.LASF5:
	.string	"outputsignal"
.LASF10:
	.string	"long long int"
.LASF8:
	.string	"short int"
.LASF4:
	.string	"inputbuffer"
.LASF9:
	.string	"long int"
.LASF7:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"fir.c"
.LASF1:
	.string	"/home/ubuntu/lab_6_wlos/testbench/uart"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
