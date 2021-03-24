.text
	.intel_syntax noprefix
	.globl	__Z22matrixTransformG2_SIMDPiS_ii 
	.p2align	4, 0x90

__Z22matrixTransformG2_SIMDPiS_ii:     
	push	rbp
	mov	rbp, rsp
# деление L / 2
	mov	rax, rdx
	shr	rax, 31
	add	rax, rdx
	sar	rax								# rax = blockLength = L / 2

	mov	r9, rdx							# L - кол-во рядов
	mov	r8, rcx							# r8 = Q
	add	rsi, 16							# rsi - newMatrix
	shl	r9, 2							# r9  = L * 4
	lea	rcx, [rdi + 4*rax]				# matrix[blockLength]  или matrix+4*blockLength
	xor	r10d, r10d
	.p2align	4, 0x90

# начало цикла for(int q = 0; q < Q; q++)
LOOP_ROWS:
	xor	edx, edx										# i = 0
	.p2align	4, 0x90

# начало цикла for(int i = 0; i < blockLength; i+=4)
	LOOP_BLOCKS:                                
		movdqa	xmm0, xmmword ptr [rdi + 4*rdx]			# matrix[i] 				или matrix+4*i
		movdqa	xmm1, xmmword ptr [rcx + 4*rdx]			# matrix[i+blockLength] 	или matrix+4*i+4*blockLength
		movdqa	xmm2, xmm0
		unpcklps	xmm2, xmm1      					# xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
		unpckhps	xmm0, xmm1      					# xmm0 = xmm0[2],xmm1[2],xmm0[3],xmm1[3]

		movdqa	xmmword ptr [rsi + 8*rdx - 16], xmm2
		movdqa	xmmword ptr [rsi + 8*rdx], xmm0
		add	rdx, 4
		cmp	rdx, rax
		jl	LOOP_BLOCKS
# конец цикла for(int i = 0; i < blockLength; i+=4)

	inc	r10
	add	rsi, r9
	add	rcx, r9
	add	rdi, r9
	cmp	r10, r8
	jne	LOOP_ROWS
# конец цикла for(int q = 0; q < Q; q++)

	pop	rbp
	ret
                                  