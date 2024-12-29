	.file	"fir_control.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
	li	a5,10
	beq	a0,a5,.L8
.L2:
	li	a4,-268410880
	li	a3,1
.L4:
	lw	a5,-2044(a4)
	beq	a5,a3,.L4
	sw	a0,-2048(a4)
	ret
.L8:
	li	a4,-268410880
	li	a3,1
.L3:
	lw	a5,-2044(a4)
	beq	a5,a3,.L3
	li	a5,13
	sw	a5,-2048(a4)
	j	.L2
	.size	putchar, .-putchar
	.align	2
	.globl	print
	.type	print, @function
print:
	lbu	a2,0(a0)
	beq	a2,zero,.L9
	li	a1,10
	li	a4,-268410880
	li	a3,1
	li	a6,13
.L14:
	addi	a0,a0,1
	beq	a2,a1,.L12
.L13:
	lw	a5,-2044(a4)
	beq	a5,a3,.L13
	sw	a2,-2048(a4)
	lbu	a2,0(a0)
	bne	a2,zero,.L14
.L9:
	ret
.L12:
	lw	a5,-2044(a4)
	beq	a5,a3,.L12
	sw	a6,-2048(a4)
	j	.L13
	.size	print, .-print
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	a5,8192
	li	a4,637534208
	sw	ra,12(sp)
	addi	a5,a5,-2039
	sw	a5,160(a4)
	sw	a5,156(a4)
	sw	a5,152(a4)
	sw	a5,148(a4)
	sw	a5,144(a4)
	sw	a5,140(a4)
	sw	a5,136(a4)
	sw	a5,132(a4)
	sw	a5,128(a4)
	sw	a5,124(a4)
	sw	a5,120(a4)
	sw	a5,116(a4)
	sw	a5,112(a4)
	sw	a5,108(a4)
	sw	a5,104(a4)
	sw	a5,100(a4)
	li	a5,1
	sw	a5,0(a4)
	li	a3,637534208
	li	a4,1
.L22:
	lw	a5,0(a3)
	beq	a5,a4,.L22
	call	initfir
	call	initfir
	call	fir_excute
	call	initfir
	call	fir_excute
	call	initfir
	lw	ra,12(sp)
	addi	sp,sp,16
	tail	fir_excute
	.size	main, .-main
	.ident	"GCC: (g1ea978e3066) 12.1.0"
