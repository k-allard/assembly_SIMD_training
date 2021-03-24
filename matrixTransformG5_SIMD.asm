.text
	.intel_syntax noprefix
.literal16
	.p2align	4
MASK1:
	.long	0                      
	.long	0xffffffff              
	.long	0                       
	.long	0                      
MASK2:
	.long	0                       
	.long	0                       
	.long	0xffffffff              
	.long	0                      
MASK3:
	.long	0                      
	.long	0                       
	.long	0                       
	.long	0xffffffff             
.text
	.globl	__Z22matrixTransformG5_SIMDPiS_ii
	.p2align	4, 0x90

__Z22matrixTransformG5_SIMDPiS_ii:      
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	rbx
# деление L / 5
	movsxd	r9, edx						# L - кол-во рядов
	imul	rax, r9, 0x66666667
	mov	rdx, rax
	shr	rdx, 63
	sar	rax, 33
	add	eax, edx						# eax = blockLength = L / 5

	lea	rdx, [rax + rax]				# rdx = blockLength * 2
	mov	r10, rax						# r10 = blockLength
	shl	rax, 2							# rax = blockLength * 4
	lea	rbx, [r10 + 2*r10]				# rbx = blockLength * 3
	mov	r8d, ecx						# r8d = Q
	add	rsi, 64							# rsi - newMatrix
	shl	r9, 2							# r9  = L * 4
	lea	rcx, [rdi + 4*r10]				# matrix[blockLength * 1]  или matrix+4*blockLength
	lea	rdx, [rdi + 4*rdx]				# matrix[blockLength * 2]  или matrix+4*blockLength*2
	lea	r15, [rdi + 4*rbx]				# matrix[blockLength * 3]  или matrix+4*blockLength*3
	lea	r11, [rdi + 4*rax]				# matrix[blockLength * 4]  или matrix+4*blockLength*4
	xor	r14d, r14d
	pxor	xmm8, xmm8
	movdqa	xmm9, xmmword ptr [rip + MASK1] 		# xmm9 =  [0,0xffffffff,0,0]
	movdqa	xmm10, xmmword ptr [rip + MASK2] 		# xmm10 = [0,0,0xffffffff,0]
	movdqa	xmm11, xmmword ptr [rip + MASK3] 		# xmm11 = [0,0,0,0xffffffff]
	.p2align	4, 0x90

# начало цикла for (int q = 0; q < Q; q++)
LOOP_ROWS:                               
	mov	rbx, rsi
	xor	eax, eax						# i = 0
	.p2align	4, 0x90

# начало цикла for(int i = 0; i < blockLength; i += 4)
	LOOP_BLOCKS:                                
		movdqa	xmm0, xmmword ptr [rdi + 4*rax]		# matrix[i] 				или matrix+4*i
		movdqa	xmm1, xmmword ptr [rcx + 4*rax] 	# matrix[i+blockLength] 	или matrix+4*i+4*blockLength
		movdqa	xmm2, xmmword ptr [rdx + 4*rax] 	# matrix[i+blockLength*2] 	или matrix+4*i+4*blockLength*2
		movdqa	xmm3, xmmword ptr [r15 + 4*rax] 	# matrix[i+blockLength*3] 	или matrix+4*i+4*blockLength*3
		movdqa	xmm4, xmmword ptr [r11 + 4*rax] 	# matrix[i+blockLength*4] 	или matrix+4*i+4*blockLength*4

		movdqa	xmm5, xmm3
		pslldq	xmm5, 12                # xmm5 = 0000000,0000000,0000000,xmm3[0]
		movdqa	xmm6, xmm2
		punpckldq	xmm6, xmm8      	# xmm6 = xmm2[0],0000000,xmm2[1],0000000
		pslldq	xmm6, 8                 # xmm6 = 0000000,0000000,xmm2[0],0000000
		xorps	xmm7, xmm7				# xmm7 = 0000000,0000000,0000000,0000000
		movss	xmm7, xmm1              # xmm7 = xmm1[0],0000000,0000000,0000000
		pslldq	xmm7, 4                 # xmm7 = 0000000,xmm1[0],0000000,0000000
		por	xmm7, xmm5					# xmm7 = 0000000,xmm1[0],0000000,xmm3[0]
		pxor	xmm5, xmm5				# xmm5 = 0000000,0000000,0000000,0000000
		movss	xmm5, xmm0              # xmm5 = xmm0[0],0000000,0000000,0000000
		orps	xmm5, xmm6				# xmm5 = xmm0[0],0000000,xmm2[0],0000000
		orps	xmm5, xmm7				# xmm5 = xmm0[0],xmm1[0],xmm2[0],xmm3[0]
		movdqa	xmmword ptr [rbx - 64], xmm5

		movdqa	xmm7, xmm2
		pand	xmm7, xmm9
		pslldq	xmm7, 8                 # xmm7 = 0,0,0,0,0,0,0,0,xmm7[0,1,2,3,4,5,6,7]
		movdqa	xmm5, xmm1
		andps	xmm5, xmm9
		pslldq	xmm5, 4                 # xmm5 = 0,0,0,0,xmm5[0,1,2,3,4,5,6,7,8,9,10,11]
		por	xmm5, xmm7
		movdqa	xmm7, xmm0
		andps	xmm7, xmm9
		xorps	xmm6, xmm6
		movss	xmm6, xmm4              # xmm6 = xmm4[0],xmm6[1,2,3]
		orps	xmm6, xmm7
		orps	xmm6, xmm5
		movdqa	xmmword ptr [rbx - 48], xmm6
		movdqa	xmm7, xmm1
		movsd	xmm7, xmm8              # xmm7 = xmm8[0],xmm7[1]
		pslldq	xmm7, 4                 # xmm7 = 0,0,0,0,xmm7[0,1,2,3,4,5,6,7,8,9,10,11]
		movdqa	xmm5, xmm0
		andps	xmm5, xmm10
		movdqa	xmm6, xmm4
		andps	xmm6, xmm9
		orps	xmm6, xmm5
		orps	xmm6, xmm7
		movq	xmm7, xmm3              # xmm7 = xmm3[0],0
		psrldq	xmm7, 4                 # xmm7 = xmm7[4,5,6,7,8,9,10,11,12,13,14,15],0,0,0,0
		por	xmm7, xmm6
		movdqa	xmmword ptr [rbx - 32], xmm7
		andps	xmm0, xmm11
		movdqa	xmm7, xmm4
		andps	xmm7, xmm10
		orps	xmm7, xmm0
		movdqa	xmm0, xmm3
		pand	xmm0, xmm10
		psrldq	xmm0, 4                 # xmm0 = xmm0[4,5,6,7,8,9,10,11,12,13,14,15],0,0,0,0
		movdqa	xmm5, xmm2
		pand	xmm5, xmm10
		psrldq	xmm5, 8                 # xmm5 = xmm5[8,9,10,11,12,13,14,15],0,0,0,0,0,0,0,0
		por	xmm5, xmm7
		por	xmm5, xmm0
		movdqa	xmmword ptr [rbx - 16], xmm5
		andps	xmm4, xmm11
		pand	xmm3, xmm11
		psrldq	xmm3, 4                 # xmm3 = xmm3[4,5,6,7,8,9,10,11,12,13,14,15],0,0,0,0
		pand	xmm2, xmm11
		psrldq	xmm2, 8                 # xmm2 = xmm2[8,9,10,11,12,13,14,15],0,0,0,0,0,0,0,0
		psrldq	xmm1, 12                # xmm1 = xmm1[12,13,14,15],0,0,0,0,0,0,0,0,0,0,0,0
		por	xmm1, xmm4
		por	xmm1, xmm2
		por	xmm1, xmm3
		movdqa	xmmword ptr [rbx], xmm1
		add	rax, 4						# i += 4
		add	rbx, 80						# newMatrix += G*i
		cmp	rax, r10
		jl	LOOP_BLOCKS
# конец цикла for(int i = 0; i < blockLength; i += 4)

## %bb.5:         
	inc	r14
	add	rsi, r9
	add	r11, r9
	add	r15, r9
	add	rdx, r9
	add	rcx, r9
	add	rdi, r9
	cmp	r14, r8
	jne	LOOP_ROWS
# конец цикла for (int q = 0; q < Q; q++)

	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	ret
