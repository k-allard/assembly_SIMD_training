	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _Z22matrixTransformG3_SIMDPiS_ii
LCPI0_0:
	.long	0                       ## 0x0
	.long	4294967295              ## 0xffffffff
	.long	4294967295              ## 0xffffffff
	.long	0                       ## 0x0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z22matrixTransformG3_SIMDPiS_ii
	.p2align	4, 0x90
__Z22matrixTransformG3_SIMDPiS_ii:      ## @_Z22matrixTransformG3_SIMDPiS_ii
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	rbx
	test	ecx, ecx
	jle	LBB0_6
## %bb.1:
	cmp	edx, 3
	jl	LBB0_6
## %bb.2:
	movsxd	r9, edx
	imul	rax, r9, 1431655766
	mov	rdx, rax
	shr	rdx, 63
	shr	rax, 32
	add	eax, edx
	movsxd	r11, eax
	add	eax, eax
	cdqe
	mov	r8d, ecx
	add	rsi, 32
	shl	r9, 2
	lea	rcx, [rdi + 4*rax]
	lea	rax, [rdi + 4*r11]
	xor	r10d, r10d
	pxor	xmm0, xmm0
	movdqa	xmm8, xmmword ptr [rip + LCPI0_0] ## xmm8 = [0,4294967295,4294967295,0]
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_4 Depth 2
	mov	rdx, rsi
	xor	ebx, ebx
	.p2align	4, 0x90
LBB0_4:                                 ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqa	xmm1, xmmword ptr [rdi + 4*rbx]
	movdqa	xmm3, xmmword ptr [rax + 4*rbx]
	movdqa	xmm4, xmmword ptr [rcx + 4*rbx]
	movdqa	xmm5, xmm3
	punpckldq	xmm5, xmm0      ## xmm5 = xmm5[0],xmm0[0],xmm5[1],xmm0[1]
	movdqa	xmm6, xmm4
	pslldq	xmm6, 12                ## xmm6 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm6[0,1,2,3]
	movdqa	xmm7, xmm1
	punpcklqdq	xmm7, xmm5      ## xmm7 = xmm7[0],xmm5[0]
	por	xmm7, xmm6
	pshufd	xmm5, xmm7, 120         ## xmm5 = xmm7[0,2,3,1]
	pxor	xmm6, xmm6
	punpckhdq	xmm6, xmm3      ## xmm6 = xmm6[2],xmm3[2],xmm6[3],xmm3[3]
	pand	xmm3, xmm8
	movq	xmm7, xmm4              ## xmm7 = xmm4[0],zero
	psrldq	xmm7, 4                 ## xmm7 = xmm7[4,5,6,7,8,9,10,11,12,13,14,15],zero,zero,zero,zero
	movdqa	xmm2, xmm1
	movsd	xmm2, xmm0              ## xmm2 = xmm0[0],xmm2[1]
	pslldq	xmm2, 4                 ## xmm2 = zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7,8,9,10,11]
	por	xmm2, xmm3
	por	xmm2, xmm7
	pshufd	xmm2, xmm2, 177         ## xmm2 = xmm2[1,0,3,2]
	movsd	xmm4, xmm0              ## xmm4 = xmm0[0],xmm4[1]
	psrldq	xmm1, 12                ## xmm1 = xmm1[12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero
	por	xmm1, xmm4
	psrldq	xmm6, 8                 ## xmm6 = xmm6[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
	por	xmm6, xmm1
	pshufd	xmm1, xmm6, 210         ## xmm1 = xmm6[2,0,1,3]
	movdqa	xmmword ptr [rdx - 32], xmm5
	movdqa	xmmword ptr [rdx - 16], xmm2
	movdqa	xmmword ptr [rdx], xmm1
	add	rbx, 4
	add	rdx, 48
	cmp	rbx, r11
	jl	LBB0_4
## %bb.5:                               ##   in Loop: Header=BB0_3 Depth=1
	inc	r10
	add	rsi, r9
	add	rcx, r9
	add	rax, r9
	add	rdi, r9
	cmp	r10, r8
	jne	LBB0_3
LBB0_6:
	pop	rbx
	pop	rbp
	ret
                                        ## -- End function

.subsections_via_symbols
