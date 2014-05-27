	.syntax unified
	.cpu cortex-m4
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"blink.c"
	.text
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, #134144
	mov	r2, #-1442840576
	str	r2, [r3]
.L6:
	ldr	r3, .L7
	mov	r2, #40960
	str	r2, [r3]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L2
.L3:
@ 25 "blink.c" 1
	nop
@ 0 "" 2
	.thumb
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r2, [r7, #4]
	movw	r3, #9999
	cmp	r2, r3
	ble	.L3
	ldr	r3, .L7
	mov	r2, #20480
	str	r2, [r3]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L4
.L5:
@ 29 "blink.c" 1
	nop
@ 0 "" 2
	.thumb
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L4:
	ldr	r2, [r7, #4]
	movw	r3, #9999
	cmp	r2, r3
	ble	.L5
	b	.L6
.L8:
	.align	2
.L7:
	.word	134164
	.size	main, .-main
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.3 20131129 (release) [ARM/embedded-4_8-branch revision 205641]"
