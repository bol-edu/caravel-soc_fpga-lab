	.file	"fir_cpu.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/lab_6_wlos/testbench/uart" "fir_cpu.c"
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
	.size	inputbuffer, 40
inputbuffer:
	.zero	40
	.globl	outputsignal
	.align	2
	.type	outputsignal, @object
	.size	outputsignal, 40
outputsignal:
	.zero	40
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
	.file 1 "fir_cpu.c"
	.loc 1 4 61
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB2:
	.loc 1 5 10
	sw	zero,-20(s0)
	.loc 1 5 2
	j	.L2
.L3:
	.loc 1 6 18 discriminator 3
	lui	a5,%hi(inputbuffer)
	addi	a4,a5,%lo(inputbuffer)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	zero,0(a5)
	.loc 1 7 19 discriminator 3
	lui	a5,%hi(outputsignal)
	addi	a4,a5,%lo(outputsignal)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	zero,0(a5)
	.loc 1 5 22 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	.loc 1 5 16 discriminator 1
	lw	a4,-20(s0)
	li	a5,9
	ble	a4,a5,.L3
.LBE2:
	.loc 1 9 1
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
	.globl	__mulsi3
	.align	2
	.globl	firfilter
	.type	firfilter, @function
firfilter:
.LFB1:
	.loc 1 11 76
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
.LBB3:
	.loc 1 12 10
	li	a5,9
	sw	a5,-20(s0)
	.loc 1 12 2
	j	.L5
.L6:
	.loc 1 13 33 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,-1
	.loc 1 13 31 discriminator 3
	lui	a4,%hi(inputbuffer)
	addi	a4,a4,%lo(inputbuffer)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 1 13 18 discriminator 3
	lui	a5,%hi(inputbuffer)
	addi	a3,a5,%lo(inputbuffer)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	.loc 1 12 25 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
.L5:
	.loc 1 12 20 discriminator 1
	lw	a5,-20(s0)
	bgt	a5,zero,.L6
.LBE3:
	.loc 1 15 17
	lui	a5,%hi(inputbuffer)
	addi	a5,a5,%lo(inputbuffer)
	lw	a4,-36(s0)
	sw	a4,0(a5)
	.loc 1 17 6
	sw	zero,-24(s0)
.LBB4:
	.loc 1 18 10
	sw	zero,-28(s0)
	.loc 1 18 2
	j	.L7
.L8:
	.loc 1 19 23 discriminator 3
	lui	a5,%hi(taps)
	addi	a4,a5,%lo(taps)
	lw	a5,-28(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a3,0(a5)
	.loc 1 19 38 discriminator 3
	lui	a5,%hi(inputbuffer)
	addi	a4,a5,%lo(inputbuffer)
	lw	a5,-28(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	.loc 1 19 26 discriminator 3
	mv	a1,a5
	mv	a0,a3
	call	__mulsi3
	mv	a5,a0
	mv	a4,a5
	.loc 1 19 16 discriminator 3
	lw	a5,-24(s0)
	add	a5,a5,a4
	sw	a5,-24(s0)
	.loc 1 18 22 discriminator 3
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L7:
	.loc 1 18 16 discriminator 1
	lw	a4,-28(s0)
	li	a5,10
	ble	a4,a5,.L8
.LBE4:
	.loc 1 21 9
	lw	a5,-24(s0)
	.loc 1 22 1
	mv	a0,a5
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
	.size	firfilter, .-firfilter
	.align	2
	.globl	fir_excute
	.type	fir_excute, @function
fir_excute:
.LFB2:
	.loc 1 24 63
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB5:
	.loc 1 29 10
	sw	zero,-20(s0)
	.loc 1 29 2
	j	.L11
.L12:
	.loc 1 30 21 discriminator 3
	lw	a0,-20(s0)
	call	firfilter
	mv	a3,a0
	.loc 1 30 19 discriminator 3
	lui	a5,%hi(outputsignal)
	addi	a4,a5,%lo(outputsignal)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a3,0(a5)
	.loc 1 29 22 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L11:
	.loc 1 29 16 discriminator 1
	lw	a4,-20(s0)
	li	a5,9
	ble	a4,a5,.L12
.LBE5:
	.loc 1 33 9
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	.loc 1 34 1
	mv	a0,a5
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	fir_excute, .-fir_excute
	.text
.Letext0:
	.file 2 "fir.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x18e
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x7
	.4byte	.LASF16
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
	.byte	0x5
	.4byte	0x3d
	.4byte	0x64
	.byte	0x6
	.4byte	0x36
	.byte	0x9
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
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF14
	.byte	0x9
	.4byte	.LASF17
	.byte	0x1
	.byte	0x18
	.byte	0x33
	.4byte	0xfc
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0xfc
	.byte	0x4
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.byte	0x3
	.string	"i"
	.byte	0x1d
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x4
	.4byte	0x3d
	.byte	0xb
	.4byte	.LASF18
	.byte	0x1
	.byte	0xb
	.byte	0x32
	.4byte	0x3d
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x169
	.byte	0xc
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb
	.byte	0x40
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0xd
	.4byte	.LASF15
	.byte	0x1
	.byte	0x11
	.byte	0x6
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xe
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x153
	.byte	0x3
	.string	"i"
	.byte	0xc
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x4
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x3
	.string	"i"
	.byte	0x12
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	.LASF20
	.byte	0x1
	.byte	0x4
	.byte	0x33
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x4
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x3
	.string	"i"
	.byte	0x5
	.4byte	0x3d
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
	.byte	0xa
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x5
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
	.byte	0xd
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
	.byte	0xe
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
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
.LASF20:
	.string	"initfir"
.LASF11:
	.string	"unsigned char"
.LASF13:
	.string	"long unsigned int"
.LASF6:
	.string	"temp"
.LASF12:
	.string	"short unsigned int"
.LASF16:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF15:
	.string	"outputsample"
.LASF17:
	.string	"fir_excute"
.LASF2:
	.string	"unsigned int"
.LASF3:
	.string	"taps"
.LASF14:
	.string	"long long unsigned int"
.LASF18:
	.string	"firfilter"
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
.LASF19:
	.string	"inputsample"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/lab_6_wlos/testbench/uart"
.LASF0:
	.string	"fir_cpu.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
