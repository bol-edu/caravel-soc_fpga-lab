	.file	"counter_la_dma.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/lab_6_wlos/testbench/uart_dma" "counter_la_dma.c"
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
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB316:
	.file 2 "../../firmware/stub.c"
	.loc 2 19 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-17(s0)
	.loc 2 20 5
	lbu	a4,-17(s0)
	li	a5,10
	bne	a4,a5,.L6
	.loc 2 21 3
	li	a0,13
	call	putchar
.L6:
	.loc 2 22 11
	nop
.L5:
	.loc 2 22 13 discriminator 1
	li	a5,-268410880
	addi	a5,a5,-2044
	lw	a4,0(a5)
	.loc 2 22 60 discriminator 1
	li	a5,1
	beq	a4,a5,.L5
	.loc 2 23 3
	li	a5,-268410880
	addi	a5,a5,-2048
	.loc 2 23 50
	lbu	a4,-17(s0)
	sw	a4,0(a5)
	.loc 2 24 1
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE316:
	.size	putchar, .-putchar
	.align	2
	.globl	print
	.type	print, @function
print:
.LFB317:
	.loc 2 27 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 2 28 8
	j	.L8
.L9:
	.loc 2 29 14
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	.loc 2 29 3
	lbu	a5,0(a5)
	mv	a0,a5
	call	putchar
.L8:
	.loc 2 28 9
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L9
	.loc 2 30 1
	nop
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE317:
	.size	print, .-print
	.globl	A
	.data
	.align	2
	.type	A, @object
	.size	A, 64
A:
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
	.globl	B
	.align	2
	.type	B, @object
	.size	B, 64
B:
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.word	32
	.globl	C
	.bss
	.align	2
	.type	C, @object
	.size	C, 64
C:
	.zero	64
	.globl	x
	.data
	.align	2
	.type	x, @object
	.size	x, 256
x:
	.word	0
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
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.word	32
	.word	33
	.word	34
	.word	35
	.word	36
	.word	37
	.word	38
	.word	39
	.word	40
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.word	46
	.word	47
	.word	48
	.word	49
	.word	50
	.word	51
	.word	52
	.word	53
	.word	54
	.word	55
	.word	56
	.word	57
	.word	58
	.word	59
	.word	60
	.word	61
	.word	62
	.word	63
	.globl	q
	.align	2
	.type	q, @object
	.size	q, 40
q:
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
	.globl	y
	.bss
	.align	2
	.type	y, @object
	.size	y, 256
y:
	.zero	256
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB318:
	.file 3 "counter_la_dma.c"
	.loc 3 97 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,44(sp)
	.cfi_offset 8, -4
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 3 124 10
	li	a5,637534208
	addi	a5,a5,160
	.loc 3 124 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 125 10
	li	a5,637534208
	addi	a5,a5,156
	.loc 3 125 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 126 10
	li	a5,637534208
	addi	a5,a5,152
	.loc 3 126 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 127 10
	li	a5,637534208
	addi	a5,a5,148
	.loc 3 127 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 128 10
	li	a5,637534208
	addi	a5,a5,144
	.loc 3 128 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 129 10
	li	a5,637534208
	addi	a5,a5,140
	.loc 3 129 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 130 10
	li	a5,637534208
	addi	a5,a5,136
	.loc 3 130 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 131 10
	li	a5,637534208
	addi	a5,a5,132
	.loc 3 131 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 132 10
	li	a5,637534208
	addi	a5,a5,128
	.loc 3 132 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 133 10
	li	a5,637534208
	addi	a5,a5,124
	.loc 3 133 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 134 10
	li	a5,637534208
	addi	a5,a5,120
	.loc 3 134 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 135 10
	li	a5,637534208
	addi	a5,a5,116
	.loc 3 135 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 136 10
	li	a5,637534208
	addi	a5,a5,112
	.loc 3 136 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 137 10
	li	a5,637534208
	addi	a5,a5,108
	.loc 3 137 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 138 10
	li	a5,637534208
	addi	a5,a5,104
	.loc 3 138 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 139 10
	li	a5,637534208
	addi	a5,a5,100
	.loc 3 139 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 141 10
	li	a5,637534208
	addi	a5,a5,96
	.loc 3 141 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 142 10
	li	a5,637534208
	addi	a5,a5,92
	.loc 3 142 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 143 10
	li	a5,637534208
	addi	a5,a5,88
	.loc 3 143 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 144 10
	li	a5,637534208
	addi	a5,a5,84
	.loc 3 144 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 145 10
	li	a5,637534208
	addi	a5,a5,80
	.loc 3 145 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 146 10
	li	a5,637534208
	addi	a5,a5,76
	.loc 3 146 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 147 10
	li	a5,637534208
	addi	a5,a5,72
	.loc 3 147 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 148 10
	li	a5,637534208
	addi	a5,a5,68
	.loc 3 148 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 149 10
	li	a5,637534208
	addi	a5,a5,64
	.loc 3 149 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 150 10
	li	a5,637534208
	addi	a5,a5,56
	.loc 3 150 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 151 10
	li	a5,637534208
	addi	a5,a5,52
	.loc 3 151 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 152 10
	li	a5,637534208
	addi	a5,a5,48
	.loc 3 152 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 153 10
	li	a5,637534208
	addi	a5,a5,44
	.loc 3 153 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 154 10
	li	a5,637534208
	addi	a5,a5,40
	.loc 3 154 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 155 10
	li	a5,637534208
	addi	a5,a5,36
	.loc 3 155 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 157 10
	li	a5,637534208
	addi	a5,a5,60
	.loc 3 157 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 161 3
	li	a5,-268410880
	.loc 3 161 50
	li	a4,1
	sw	a4,0(a5)
	.loc 3 164 3
	li	a5,637534208
	.loc 3 164 36
	li	a4,1
	sw	a4,0(a5)
	.loc 3 165 8
	nop
.L11:
	.loc 3 165 10 discriminator 1
	li	a5,637534208
	lw	a4,0(a5)
	.loc 3 165 43 discriminator 1
	li	a5,1
	beq	a4,a5,.L11
	.loc 3 169 60
	li	a5,-268423168
	addi	a4,a5,12
	.loc 3 169 114
	li	a5,0
	sw	a5,0(a4)
	.loc 3 169 3
	li	a4,-268423168
	addi	a4,a4,28
	.loc 3 169 57
	sw	a5,0(a4)
	.loc 3 170 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 170 112
	li	a5,-1
	sw	a5,0(a4)
	.loc 3 170 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 170 56
	sw	a5,0(a4)
	.loc 3 171 59
	li	a5,-268423168
	addi	a4,a5,4
	.loc 3 171 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 171 3
	li	a4,-268423168
	addi	a4,a4,20
	.loc 3 171 56
	sw	a5,0(a4)
	.loc 3 172 53
	li	a4,-268423168
	.loc 3 172 100
	li	a5,0
	sw	a5,0(a4)
	.loc 3 172 3
	li	a4,-268423168
	addi	a4,a4,16
	.loc 3 172 50
	sw	a5,0(a4)
	.loc 3 177 3
	li	a5,-268423168
	addi	a5,a5,56
	.loc 3 177 56
	sw	zero,0(a5)
	.loc 3 180 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 180 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 180 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 180 56
	sw	a5,0(a4)
	.loc 3 183 3
	li	a5,805306368
	addi	a5,a5,16
	.loc 3 183 36
	li	a4,64
	sw	a4,0(a5)
	.loc 3 185 3
	li	a5,805306368
	addi	a5,a5,64
	.loc 3 185 36
	sw	zero,0(a5)
	.loc 3 186 3
	li	a5,805306368
	addi	a5,a5,68
	.loc 3 186 36
	li	a4,-10
	sw	a4,0(a5)
	.loc 3 187 3
	li	a5,805306368
	addi	a5,a5,72
	.loc 3 187 36
	li	a4,-9
	sw	a4,0(a5)
	.loc 3 188 3
	li	a5,805306368
	addi	a5,a5,76
	.loc 3 188 36
	li	a4,23
	sw	a4,0(a5)
	.loc 3 189 3
	li	a5,805306368
	addi	a5,a5,80
	.loc 3 189 36
	li	a4,56
	sw	a4,0(a5)
	.loc 3 190 3
	li	a5,805306368
	addi	a5,a5,84
	.loc 3 190 36
	li	a4,63
	sw	a4,0(a5)
	.loc 3 191 3
	li	a5,805306368
	addi	a5,a5,88
	.loc 3 191 36
	li	a4,56
	sw	a4,0(a5)
	.loc 3 192 3
	li	a5,805306368
	addi	a5,a5,92
	.loc 3 192 36
	li	a4,23
	sw	a4,0(a5)
	.loc 3 193 3
	li	a5,805306368
	addi	a5,a5,96
	.loc 3 193 36
	li	a4,-9
	sw	a4,0(a5)
	.loc 3 194 3
	li	a5,805306368
	addi	a5,a5,100
	.loc 3 194 36
	li	a4,-10
	sw	a4,0(a5)
	.loc 3 195 3
	li	a5,805306368
	addi	a5,a5,104
	.loc 3 195 36
	sw	zero,0(a5)
	.loc 3 205 6
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 205 39
	li	a4,-1421869056
	sw	a4,0(a5)
	.loc 3 206 14
	lui	a5,%hi(x)
	addi	a5,a5,%lo(x)
	sw	a5,-20(s0)
	.loc 3 207 14
	lui	a5,%hi(y)
	addi	a5,a5,%lo(y)
	sw	a5,-24(s0)
	.loc 3 208 14
	lui	a5,%hi(A)
	addi	a5,a5,%lo(A)
	sw	a5,-28(s0)
	.loc 3 209 14
	lui	a5,%hi(B)
	addi	a5,a5,%lo(B)
	sw	a5,-32(s0)
	.loc 3 210 14
	lui	a5,%hi(C)
	addi	a5,a5,%lo(C)
	sw	a5,-36(s0)
	.loc 3 211 14
	lui	a5,%hi(q)
	addi	a5,a5,%lo(q)
	sw	a5,-40(s0)
	.loc 3 212 6
	li	a5,805306368
	addi	a5,a5,4
	.loc 3 212 40
	lw	a4,-20(s0)
	.loc 3 212 38
	sw	a4,0(a5)
	.loc 3 213 6
	li	a5,805306368
	addi	a5,a5,8
	.loc 3 213 40
	lw	a4,-24(s0)
	.loc 3 213 38
	sw	a4,0(a5)
	.loc 3 214 6
	li	a5,805306368
	addi	a5,a5,132
	.loc 3 214 40
	lw	a4,-28(s0)
	.loc 3 214 38
	sw	a4,0(a5)
	.loc 3 215 6
	li	a5,805306368
	addi	a5,a5,136
	.loc 3 215 40
	lw	a4,-32(s0)
	.loc 3 215 38
	sw	a4,0(a5)
	.loc 3 216 6
	li	a5,805306368
	addi	a5,a5,140
	.loc 3 216 40
	lw	a4,-36(s0)
	.loc 3 216 38
	sw	a4,0(a5)
	.loc 3 217 6
	li	a5,805306368
	addi	a5,a5,128
	.loc 3 217 40
	lw	a4,-40(s0)
	.loc 3 217 38
	sw	a4,0(a5)
	.loc 3 223 6
	li	a5,805306368
	.loc 3 223 39
	li	a4,1
	sw	a4,0(a5)
.L14:
	.loc 3 224 15
	li	a5,805306368
	lw	a4,0(a5)
	.loc 3 224 13
	li	a5,4
	beq	a4,a5,.L16
	j	.L14
.L16:
	.loc 3 224 52
	nop
	.loc 3 238 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 238 36
	li	a4,-1420754944
	sw	a4,0(a5)
	.loc 3 240 1
	nop
	lw	s0,44(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE318:
	.size	main, .-main
	.text
.Letext0:
	.file 4 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1ea
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0xb
	.4byte	.LASF24
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x6
	.4byte	.LASF8
	.byte	0x28
	.byte	0x12
	.4byte	0x3f
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
	.byte	0x6
	.4byte	.LASF9
	.byte	0x34
	.byte	0x1b
	.4byte	0x66
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.byte	0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.byte	0x4
	.4byte	0x34
	.4byte	0x92
	.byte	0x5
	.4byte	0x7b
	.byte	0xf
	.byte	0
	.byte	0x2
	.string	"A"
	.byte	0x17
	.4byte	0x82
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0x2
	.string	"B"
	.byte	0x1c
	.4byte	0x82
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x2
	.string	"C"
	.byte	0x21
	.4byte	0x82
	.byte	0x5
	.byte	0x3
	.4byte	C
	.byte	0x4
	.4byte	0x34
	.4byte	0xcc
	.byte	0x5
	.4byte	0x7b
	.byte	0x3f
	.byte	0
	.byte	0x2
	.string	"x"
	.byte	0x22
	.4byte	0xbc
	.byte	0x5
	.byte	0x3
	.4byte	x
	.byte	0x4
	.4byte	0x34
	.4byte	0xea
	.byte	0x5
	.4byte	0x7b
	.byte	0x9
	.byte	0
	.byte	0x2
	.string	"q"
	.byte	0x2c
	.4byte	0xda
	.byte	0x5
	.byte	0x3
	.4byte	q
	.byte	0x2
	.string	"y"
	.byte	0x2f
	.4byte	0xbc
	.byte	0x5
	.byte	0x3
	.4byte	y
	.byte	0xd
	.4byte	.LASF25
	.byte	0x3
	.byte	0x60
	.byte	0x33
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
	.byte	0x1
	.byte	0x9c
	.4byte	0x175
	.byte	0xe
	.string	"j"
	.byte	0x3
	.byte	0x62
	.byte	0x6
	.4byte	0x74
	.byte	0x3
	.4byte	.LASF13
	.byte	0xce
	.4byte	0x175
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x3
	.4byte	.LASF14
	.byte	0xcf
	.4byte	0x175
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF15
	.byte	0xd0
	.4byte	0x175
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x3
	.4byte	.LASF16
	.byte	0xd1
	.4byte	0x175
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x3
	.4byte	.LASF17
	.byte	0xd2
	.4byte	0x175
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x3
	.4byte	.LASF18
	.byte	0xd3
	.4byte	0x175
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x7
	.4byte	0x34
	.byte	0x8
	.4byte	.LASF20
	.byte	0x1a
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x19b
	.byte	0x9
	.string	"p"
	.byte	0x1a
	.byte	0x18
	.4byte	0x19b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x7
	.4byte	0x1a7
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF19
	.byte	0xf
	.4byte	0x1a0
	.byte	0x8
	.4byte	.LASF21
	.byte	0x12
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x1cd
	.byte	0x9
	.string	"c"
	.byte	0x12
	.byte	0x13
	.4byte	0x1a0
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0xa
	.4byte	.LASF22
	.byte	0x1c
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0xa
	.4byte	.LASF23
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
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x9
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
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xe
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x6
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
	.byte	0x9
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
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
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xe
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
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
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
	.4byte	.Ltext0
	.4byte	.Letext0
	.byte	0x6
	.4byte	.LFB318
	.4byte	.LFE318
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF22:
	.string	"flush_cpu_dcache"
.LASF6:
	.string	"unsigned char"
.LASF10:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF20:
	.string	"print"
.LASF21:
	.string	"putchar"
.LASF24:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF25:
	.string	"main"
.LASF12:
	.string	"unsigned int"
.LASF11:
	.string	"long long unsigned int"
.LASF23:
	.string	"flush_cpu_icache"
.LASF15:
	.string	"addr_A"
.LASF16:
	.string	"addr_B"
.LASF17:
	.string	"addr_C"
.LASF8:
	.string	"int32_t"
.LASF5:
	.string	"long long int"
.LASF19:
	.string	"char"
.LASF3:
	.string	"short int"
.LASF18:
	.string	"addr_q"
.LASF9:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
.LASF13:
	.string	"addr_x"
.LASF14:
	.string	"addr_y"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/lab_6_wlos/testbench/uart_dma"
.LASF0:
	.string	"counter_la_dma.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
