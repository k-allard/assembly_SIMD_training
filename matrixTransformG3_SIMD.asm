.text
	.intel_syntax noprefix
.literal16
	.p2align	4        
MASK12:
	.long	0                     
	.long	0xffffffff             
	.long	0xffffffff            
	.long	0                       
.text
	.globl	__Z22matrixTransformG3_SIMDPiS_ii
	.p2align	4, 0x90

__Z22matrixTransformG3_SIMDPiS_ii:     
	push	rbp
	mov	rbp, rsp
	push	rbx
# деление L / 3
	mov	r9, rdx
	imul rax, r9, 0x55555556
	mov	rdx, rax
	shr	rdx, 63
	shr	rax, 32
	add	rax, rdx

	mov	r11, rax				# r11 = blockLength
	add	rax, rax				# rax = blockLength * 2
	mov	r8d, ecx				# r8d = Q
	add	rsi, 32					# rsi - newMatrix
	shl	r9, 2					# r9  = L * 4
	lea	rcx, [rdi + 4*rax]		# matrix[blockLength * 2]  или matrix+4*blockLength*2
	lea	rax, [rdi + 4*r11]		# matrix[blockLength * 1]  или matrix+4*blockLength
	xor	r10d, r10d
	pxor	xmm10, xmm10
	movdqa	xmm12, xmmword ptr [rip + MASK12] 	# xmm12 = [0,0xffffffff,0xffffffff,0]
	.p2align	4, 0x90

# начало цикла	for(int q = 0; q < Q; q++) 
LOOP_ROWS:                                                                 
	mov	rdx, rsi
	xor	ebx, ebx
	.p2align	4, 0x90

# начало цикла for(int i = 0; i < blockLength; i += 4)
LOOP_BLOCKS:                                                                      
		movdqa	xmm0, xmmword ptr [rdi + 4*rbx]		# matrix[i] 				или matrix+4*i
		movdqa	xmm1, xmmword ptr [rax + 4*rbx]		# matrix[i+blockLength] 	или matrix+4*i+4*blockLength
		movdqa	xmm2, xmmword ptr [rcx + 4*rbx]		# matrix[i+blockLength*2] 	или matrix+4*i+4*blockLength*2
		movdqa	xmm3, xmm1
		punpckldq	xmm3, xmm10      				# xmm3 = xmm1[0],0000000,xmm1[1],0000000
		movdqa	xmm4, xmm2
		pslldq	xmm4, 12               				# xmm4 = 0000000,0000000,0000000,xmm2[0]
		movdqa	xmm5, xmm0
		punpcklqdq	xmm5, xmm3      				# xmm5 = xmm0[0],xmm0[1],xmm3[0],xmm3[1]
													# xmm5 = xmm0[0],xmm0[1],xmm1[0],0000000
		por	xmm5, xmm4								# xmm5 = xmm0[0],xmm0[1],xmm1[0],xmm2[0]
		pshufd	xmm3, xmm5, 120       			    # xmm3 = xmm5[0,2,3,1]
													# xmm3 = xmm0[0],xmm1[0],xmm2[0],xmm0[1]
							
		pxor	xmm4, xmm4
		punpckhdq	xmm4, xmm1      				# xmm4 = 0000000,xmm1[2],0000000,xmm1[3]
		pand	xmm1, xmm12							# xmm1 = 0000000,xmm1[1],xmm1[2],0000000
		movq	xmm5, xmm2            			    # xmm5 = xmm2[0],xmm2[1],0000000,0000000
		psrldq	xmm5, 4              			    # xmm5 = xmm2[1],0000000,0000000,0000000
		movdqa	xmm6, xmm0
		movsd	xmm6, xmm10          			    # xmm6 = 0000000,0000000,xmm0[2],xmm0[3]
		pslldq	xmm6, 4               			    # xmm6 = 0000000,0000000,0000000,xmm0[2]
		por	xmm6, xmm1								# xmm6 = 0000000,xmm1[1],xmm1[2],xmm0[2]
		por	xmm6, xmm5								# xmm6 = xmm2[1],xmm1[1],xmm1[2],xmm0[2]
		pshufd	xmm6, xmm6, 177      			    # xmm6 = xmm6[1,0,3,2]
													# xmm6 = xmm1[1],xmm2[1],xmm0[2],xmm1[2]

		movsd	xmm2, xmm10          			    # xmm2 = 0000000,0000000,xmm2[2],xmm2[3]
		psrldq	xmm0, 12            			    # xmm0 = xmm0[3],0000000,0000000,0000000
		por	xmm0, xmm2								# xmm0 = xmm0[3],0000000,xmm2[2],xmm2[3]
		psrldq	xmm4, 8              			    # xmm4 = 0000000,xmm1[3],0000000,0000000
		por	xmm4, xmm0								# xmm4 = xmm0[3],xmm1[3],xmm2[2],xmm2[3]
		pshufd	xmm0, xmm4, 210     			    # xmm0 = xmm4[2,0,1,3]
												 	# xmm0 = xmm2[2],xmm0[3],xmm1[3],xmm2[3]

		movdqa	xmmword ptr [rdx - 32], xmm3
		movdqa	xmmword ptr [rdx - 16], xmm6
		movdqa	xmmword ptr [rdx], xmm0
	
		add	rbx, 4									# i += 4
		add	rdx, 48									# newMatrix += G*i или newMatrix += 3*4*sizeof(int)
		cmp	rbx, r11
		jl	LOOP_BLOCKS
# конец цикла for(int i = 0; i < blockLength; i += 4)

	inc	r10
	add	rsi, r9
	add	rcx, r9
	add	rax, r9
	add	rdi, r9
	cmp	r10, r8
	jne	LOOP_ROWS
# конец цикла for (int q = 0; q < Q; q++)

	pop	rbx
	pop	rbp
	ret
