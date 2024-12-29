	.file	"fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
	li	a4,805306368
	lui	a5,%hi(.LANCHOR0)
	addi	a1,a5,%lo(.LANCHOR0)
	addi	a2,a4,64
	addi	a5,a5,%lo(.LANCHOR0)
	li	a3,64
	sw	a3,16(a4)
	addi	a1,a1,44
	sub	a2,a2,a5
.L2:
	lw	a3,0(a5)
	add	a4,a2,a5
	addi	a5,a5,4
	sw	a3,0(a4)
	bne	a5,a1,.L2
	ret
	.size	initfir, .-initfir
	.align	2
	.globl	fir_excute
	.type	fir_excute, @function
fir_excute:
	li	a5,637534208
	li	a4,10813440
	sw	a4,12(a5)
	li	a3,1
	li	a5,805306368
	sw	a3,0(a5)
	lui	a4,%hi(.LANCHOR1)
	sw	zero,128(a5)
	addi	a0,a4,%lo(.LANCHOR1)
	li	a5,1
	addi	a4,a4,%lo(.LANCHOR1)
	li	a3,805306368
	li	a1,64


.L6:
	sw	a5,128(a3)
	addi	a5,a5,1
	sw	a2,0(a4)    # store to array !!!
	addi	a4,a4,4
	lw	a2,132(a3)

	bne	a5,a1,.L6
	lw	a4,132(a3)
	lui	a2,%hi(temp)
	lw	a3,0(a3)
	sw	a4,%lo(temp)(a2)
	slli	a5,a4,24
	li	a2,5898240
	sw	a4,252(a0)
	or	a5,a5,a2
	li	a4,637534208
	sw	a5,12(a4)
	ret
	.size	fir_excute, .-fir_excute
	.globl	temp_pre
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
	.type	temp_pre, @object
	.size	temp_pre, 4
temp_pre:
	.zero	4
	.type	temp, @object
	.size	temp, 4
temp:
	.zero	4
	.ident	"GCC: (g1ea978e3066) 12.1.0"
