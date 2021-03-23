	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _Z22matrixTransformG5_SIMDPiS_ii
LCPI0_0:
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
LCPI0_1:
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
LCPI0_2:
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z22matrixTransformG5_SIMDPiS_ii
	.p2align	4, 0x90
__Z22matrixTransformG5_SIMDPiS_ii:      
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	rbx
## %bb.2:
	movsxd	r9, edx 				# L(кол-во рядов) movsxd - Пересылка DWord в QWord 
	imul	rax, r9, 0x66666667
	mov	rdx, rax
	shr	rdx, 63
	sar	rax, 33
	add	eax, edx					# eax = blockLength ???


	lea	edx, [rax + rax]
	movsxd	r10, eax
	shl	eax, 2
	movsxd	rdx, edx
	lea	ebx, [r10 + 2*r10]
	movsxd	rbx, ebx
	cdqe							# Convert dword (eax) to qword (rax)
	mov	r8d, ecx
	add	rsi, 64					# rsi - указатель на newMatrix
	shl	r9, 2
	lea	r11, [rdi + 4*rax]		# rdi - указатель на исходную matrix
	lea	r15, [rdi + 4*rbx]
	lea	rdx, [rdi + 4*rdx]
	lea	rcx, [rdi + 4*r10]
	xor	r14d, r14d
	pxor	xmm8, xmm8			# занулили ???
	mov	eax, 0xffff
	movd	xmm12, eax
	movdqa	xmm9, xmmword ptr [rip + LCPI0_0] 		# xmm9 = [0,0,0xFFFF,0,0,0,0,0]
	movdqa	xmm10, xmmword ptr [rip + LCPI0_1] 		# xmm10 = [0,0,0,0,0xFFFF,0,0,0]
	movdqa	xmm11, xmmword ptr [rip + LCPI0_2] 		# xmm11 = [0,0,0,0,0,0,0xFFFF,0]
	.p2align	4, 0x90
LBB0_3:                               				# начало цикла for (int q = 0; q < Q; q++)
	mov	rbx, rsi
	xor	eax, eax
	.p2align	4, 0x90
LBB0_4:                                 			# начало цикла for(int i = 0; i < blockLength; i += 4)
	movdqa	xmm2, xmmword ptr [rdi + 4*rax]		# rax - это i
	movdqa	xmm1, xmmword ptr [rcx + 4*rax]
	movdqa	xmm4, xmmword ptr [rdx + 4*rax]
	movdqa	xmm3, xmmword ptr [r15 + 4*rax]
	movdqa	xmm7, xmmword ptr [r11 + 4*rax]
	movdqa	xmm0, xmm3
	punpcklwd	xmm0, xmm8      					# xmm0 = xmm0[0],xmm8[0],xmm0[1],xmm8[1],xmm0[2],xmm8[2],xmm0[3],xmm8[3]
	pslldq	xmm0, 12                				# Shift left: xmm0 = 0,0,0,0,0,0,0,0,0,0,0,0,xmm0[0,1,2,3]
	movdqa	xmm6, xmm4
	punpcklwd	xmm6, xmm8      					# xmm6 = xmm6[0],xmm8[0],xmm6[1],xmm8[1],xmm6[2],xmm8[2],xmm6[3],xmm8[3]
	punpckldq	xmm6, xmm8      					# xmm6 = xmm6[0],xmm8[0],xmm6[1],xmm8[1]
	pslldq	xmm6, 8                 				# Shift left: xmm6 = 0,0,0,0,0,0,0,0,xmm6[0,1,2,3,4,5,6,7]
	movdqa	xmm5, xmm1
	pand	xmm5, xmm12
	pslldq	xmm5, 4                 				# Shift left: xmm5 = 0,0,0,0,xmm5[0,1,2,3,4,5,6,7,8,9,10,11]
	por	xmm5, xmm0
	por	xmm5, xmm6
	movdqa	xmm0, xmm2
	pand	xmm0, xmm12
	por	xmm0, xmm5
	movdqa	xmmword ptr [rbx - 64], xmm0	# записали 1ый регистр в newMatrix
	movdqa	xmm0, xmm4
	pand	xmm0, xmm9
	pslldq	xmm0, 8                 				# Shift left: xmm0 = 0,0,0,0,0,0,0,0,xmm0[0,1,2,3,4,5,6,7]
	movdqa	xmm5, xmm1
	pand	xmm5, xmm9
	pslldq	xmm5, 4                 				# Shift left: xmm5 = 0,0,0,0,xmm5[0,1,2,3,4,5,6,7,8,9,10,11]
	por	xmm5, xmm0
	movdqa	xmm0, xmm2
	pand	xmm0, xmm9
	movdqa	xmm6, xmm7
	pand	xmm6, xmm12
	por	xmm6, xmm0
	por	xmm6, xmm5
	movdqa	xmmword ptr [rbx - 48], xmm6	# записали 2ой регистр в newMatrix
	movdqa	xmm0, xmm1
	pand	xmm0, xmm10
	pslldq	xmm0, 4                 				# Shift left: xmm0 = 0,0,0,0,xmm0[0,1,2,3,4,5,6,7,8,9,10,11]
	movdqa	xmm5, xmm2
	pand	xmm5, xmm10
	movdqa	xmm6, xmm7
	pand	xmm6, xmm9
	por	xmm6, xmm5
	por	xmm6, xmm0
	movdqa	xmm0, xmm3
	pand	xmm0, xmm9
	psrldq	xmm0, 4                 				# Shift right: xmm0 = xmm0[4,5,6,7,8,9,10,11,12,13,14,15],0,0,0,0
	por	xmm0, xmm6
	movdqa	xmmword ptr [rbx - 32], xmm0	# записали 3ий регистр в newMatrix
	pand	xmm2, xmm11
	movdqa	xmm0, xmm7
	pand	xmm0, xmm10
	por	xmm0, xmm2
	movdqa	xmm2, xmm3
	pand	xmm2, xmm10
	psrldq	xmm2, 4                 				# Shift right: xmm2 = xmm2[4,5,6,7,8,9,10,11,12,13,14,15],0,0,0,0
	movdqa	xmm5, xmm4
	pand	xmm5, xmm10
	psrldq	xmm5, 8                 				# Shift right: xmm5 = xmm5[8,9,10,11,12,13,14,15],0,0,0,0,0,0,0,0
	por	xmm5, xmm0
	por	xmm5, xmm2
	movdqa	xmmword ptr [rbx - 16], xmm5	# записали 4ый регистр в newMatrix
	pand	xmm7, xmm11
	pand	xmm3, xmm11
	psrldq	xmm3, 4                 				# Shift right: xmm3 = xmm3[4,5,6,7,8,9,10,11,12,13,14,15],0,0,0,0
	pand	xmm4, xmm11
	psrldq	xmm4, 8                 				# Shift right: xmm4 = xmm4[8,9,10,11,12,13,14,15],0,0,0,0,0,0,0,0
	por	xmm4, xmm3
	pand	xmm1, xmm11
	psrldq	xmm1, 12                				# Shift right: xmm1 = xmm1[12,13,14,15],0,0,0,0,0,0,0,0,0,0,0,0
	por	xmm1, xmm7
	por	xmm1, xmm4
	movdqa	xmmword ptr [rbx], xmm1			# записали 5ый регистр в newMatrix
	add	rax, 4		# i += 4
	add	rbx, 80								# сдвинули указатель на newMatrix
	cmp	rax, r10
	jl	LBB0_4											# конец цикла for(int i = 0; i < blockLength; i += 4)
## %bb.5:                               
	inc	r14			# q++
	add	rsi, r9		# r9 - это L (кол-во рядов)
	add	r11, r9
	add	r15, r9
	add	rdx, r9
	add	rcx, r9
	add	rdi, r9		# rdi - указатель на исходную matrix
	cmp	r14, r8											# конец цикла for (int q = 0; q < Q; q++) 
	jne	LBB0_3
LBB0_6:
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	ret

.subsections_via_symbols
