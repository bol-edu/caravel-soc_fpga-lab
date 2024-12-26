	.file	"counter_la_uart2.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/lab_6_wlos/testbench/uart" "counter_la_uart2.c"
	.align	2
	.type	flush_cpu_icache, @function
flush_cpu_icache:
.LFB21:
	.file 1 "../../firmware/system.h"
	.loc 1 15 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 26 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	flush_cpu_icache, .-flush_cpu_icache
	.align	2
	.type	flush_cpu_dcache, @function
flush_cpu_dcache:
.LFB22:
	.loc 1 29 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 33 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	flush_cpu_dcache, .-flush_cpu_dcache
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB316:
	.file 2 "counter_la_uart2.c"
	.loc 2 53 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 83 6
	li	a5,-268419072
	addi	a5,a5,-2048
	.loc 2 83 53
	li	a4,1
	sw	a4,0(a5)
	.loc 2 85 6
	li	a5,637534208
	addi	a5,a5,160
	.loc 2 85 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 86 6
	li	a5,637534208
	addi	a5,a5,156
	.loc 2 86 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 87 6
	li	a5,637534208
	addi	a5,a5,152
	.loc 2 87 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 88 6
	li	a5,637534208
	addi	a5,a5,148
	.loc 2 88 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 89 6
	li	a5,637534208
	addi	a5,a5,144
	.loc 2 89 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 90 6
	li	a5,637534208
	addi	a5,a5,140
	.loc 2 90 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 91 6
	li	a5,637534208
	addi	a5,a5,136
	.loc 2 91 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 92 6
	li	a5,637534208
	addi	a5,a5,132
	.loc 2 92 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 93 6
	li	a5,637534208
	addi	a5,a5,128
	.loc 2 93 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 94 6
	li	a5,637534208
	addi	a5,a5,124
	.loc 2 94 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 95 6
	li	a5,637534208
	addi	a5,a5,120
	.loc 2 95 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 96 6
	li	a5,637534208
	addi	a5,a5,116
	.loc 2 96 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 97 6
	li	a5,637534208
	addi	a5,a5,112
	.loc 2 97 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 98 6
	li	a5,637534208
	addi	a5,a5,108
	.loc 2 98 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 99 6
	li	a5,637534208
	addi	a5,a5,104
	.loc 2 99 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 100 6
	li	a5,637534208
	addi	a5,a5,100
	.loc 2 100 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 102 6
	li	a5,637534208
	addi	a5,a5,96
	.loc 2 102 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 103 6
	li	a5,637534208
	addi	a5,a5,92
	.loc 2 103 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 104 6
	li	a5,637534208
	addi	a5,a5,88
	.loc 2 104 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 105 6
	li	a5,637534208
	addi	a5,a5,84
	.loc 2 105 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 106 6
	li	a5,637534208
	addi	a5,a5,80
	.loc 2 106 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 107 6
	li	a5,637534208
	addi	a5,a5,76
	.loc 2 107 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 108 6
	li	a5,637534208
	addi	a5,a5,72
	.loc 2 108 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 109 6
	li	a5,637534208
	addi	a5,a5,68
	.loc 2 109 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 110 6
	li	a5,637534208
	addi	a5,a5,64
	.loc 2 110 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 111 6
	li	a5,637534208
	addi	a5,a5,52
	.loc 2 111 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 112 6
	li	a5,637534208
	addi	a5,a5,48
	.loc 2 112 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 113 6
	li	a5,637534208
	addi	a5,a5,44
	.loc 2 113 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 114 6
	li	a5,637534208
	addi	a5,a5,40
	.loc 2 114 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 115 6
	li	a5,637534208
	addi	a5,a5,36
	.loc 2 115 39
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 2 117 6
	li	a5,637534208
	addi	a5,a5,60
	.loc 2 117 39
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 2 118 6
	li	a5,637534208
	addi	a5,a5,56
	.loc 2 118 39
	li	a4,1026
	sw	a4,0(a5)
	.loc 2 122 3
	li	a5,637534208
	.loc 2 122 36
	li	a4,1
	sw	a4,0(a5)
	.loc 2 123 8
	nop
.L4:
	.loc 2 123 10 discriminator 1
	li	a5,637534208
	lw	a4,0(a5)
	.loc 2 123 43 discriminator 1
	li	a5,1
	beq	a4,a5,.L4
	.loc 2 127 60
	li	a5,-268423168
	addi	a4,a5,12
	.loc 2 127 114
	li	a5,0
	sw	a5,0(a4)
	.loc 2 127 3
	li	a4,-268423168
	addi	a4,a4,28
	.loc 2 127 57
	sw	a5,0(a4)
	.loc 2 128 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 2 128 112
	li	a5,-1
	sw	a5,0(a4)
	.loc 2 128 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 2 128 56
	sw	a5,0(a4)
	.loc 2 129 59
	li	a5,-268423168
	addi	a4,a5,4
	.loc 2 129 112
	li	a5,0
	sw	a5,0(a4)
	.loc 2 129 3
	li	a4,-268423168
	addi	a4,a4,20
	.loc 2 129 56
	sw	a5,0(a4)
	.loc 2 130 53
	li	a4,-268423168
	.loc 2 130 100
	li	a5,0
	sw	a5,0(a4)
	.loc 2 130 3
	li	a4,-268423168
	addi	a4,a4,16
	.loc 2 130 50
	sw	a5,0(a4)
	.loc 2 133 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 133 36
	li	a4,-1421869056
	sw	a4,0(a5)
	.loc 2 136 3
	li	a5,-268423168
	addi	a5,a5,56
	.loc 2 136 56
	sw	zero,0(a5)
	.loc 2 139 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 2 139 112
	li	a5,0
	sw	a5,0(a4)
	.loc 2 139 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 2 139 56
	sw	a5,0(a4)
	.loc 2 141 2
	call	initfir
	.loc 2 142 2
	call	fir_excute
	.loc 2 164 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 164 36
	li	a4,-1421803520
	sw	a4,0(a5)
	.loc 2 166 2
	call	matmul
	.loc 2 167 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 167 36
	li	a4,-1421737984
	sw	a4,0(a5)
	.loc 2 169 2
	call	qsort
	.loc 2 170 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 170 36
	li	a4,-1421672448
	sw	a4,0(a5)
	.loc 2 187 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 187 36
	li	a4,-1420754944
	sw	a4,0(a5)
	.loc 2 188 1
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE316:
	.size	main, .-main
	.align	2
	.globl	delay
	.type	delay, @function
delay:
.LFB317:
	.loc 2 190 18
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,44(sp)
	.cfi_offset 8, -4
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	.loc 2 192 15
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	.loc 2 192 10
	lw	a5,-20(s0)
	sw	a5,-24(s0)
	.loc 2 192 5
	lw	a5,-24(s0)
	sw	a5,-28(s0)
	.loc 2 194 7
	j	.L6
.L9:
	.loc 2 196 9
	nop
.L8:
	.loc 2 196 12 discriminator 1
	lw	a5,-20(s0)
	addi	a4,a5,-1
	sw	a4,-20(s0)
	.loc 2 196 14 discriminator 1
	bgt	a5,zero,.L8
.L7:
	.loc 2 195 11
	lw	a5,-24(s0)
	addi	a4,a5,-1
	sw	a4,-24(s0)
	.loc 2 195 13
	bgt	a5,zero,.L9
.L6:
	.loc 2 194 10
	lw	a5,-28(s0)
	addi	a4,a5,-1
	sw	a4,-28(s0)
	.loc 2 194 12
	bgt	a5,zero,.L7
	.loc 2 199 1
	nop
	nop
	lw	s0,44(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE317:
	.size	delay, .-delay
.Letext0:
	.file 3 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x146
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x6
	.4byte	.LASF17
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x7
	.4byte	.LASF18
	.byte	0x3
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x2
	.4byte	.LASF11
	.byte	0x26
	.4byte	0x88
	.4byte	0x88
	.byte	0x3
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x6a
	.byte	0x2
	.4byte	.LASF12
	.byte	0x24
	.4byte	0x88
	.4byte	0x9e
	.byte	0x3
	.byte	0
	.byte	0x2
	.4byte	.LASF13
	.byte	0x22
	.4byte	0x88
	.4byte	0xae
	.byte	0x3
	.byte	0
	.byte	0x2
	.4byte	.LASF14
	.byte	0x21
	.4byte	0x88
	.4byte	0xbe
	.byte	0x3
	.byte	0
	.byte	0xa
	.4byte	.LASF19
	.byte	0x2
	.byte	0xbe
	.byte	0x6
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x106
	.byte	0xb
	.string	"n"
	.byte	0x2
	.byte	0xbe
	.byte	0x10
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x4
	.string	"t1"
	.byte	0x6
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x4
	.string	"t2"
	.byte	0xa
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.string	"t3"
	.byte	0xe
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0xc
	.4byte	.LASF20
	.byte	0x2
	.byte	0x34
	.byte	0x6
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x129
	.byte	0xd
	.4byte	.LASF21
	.byte	0x2
	.byte	0x37
	.byte	0x9
	.4byte	0x6a
	.byte	0
	.byte	0x5
	.4byte	.LASF15
	.byte	0x1c
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0x5
	.4byte	.LASF16
	.byte	0xe
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
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
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xd
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0x21
	.byte	0xbf,0x1
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x2e
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
	.byte	0x25
	.byte	0x27
	.byte	0x19
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
	.byte	0x6
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0xf
	.byte	0
	.byte	0xb
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
	.byte	0x27
	.byte	0x19
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
	.byte	0x5
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
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
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"initfir"
.LASF15:
	.string	"flush_cpu_dcache"
.LASF12:
	.string	"matmul"
.LASF11:
	.string	"qsort"
.LASF19:
	.string	"delay"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF17:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF20:
	.string	"main"
.LASF13:
	.string	"fir_excute"
.LASF10:
	.string	"unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF16:
	.string	"flush_cpu_icache"
.LASF5:
	.string	"long long int"
.LASF21:
	.string	"mask"
.LASF3:
	.string	"short int"
.LASF18:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/lab_6_wlos/testbench/uart"
.LASF0:
	.string	"counter_la_uart2.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
