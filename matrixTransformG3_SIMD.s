	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _Z22matrixTransformG3_SIMDPiS_ii
LCPI0_0:
	.short	65535                   ## 0xffff
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
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
LCPI0_2:
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
LCPI0_3:
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
LCPI0_4:
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
LCPI0_5:
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
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
	imul	rax, r9, 0x55555556
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
	movdqa	xmm8, xmmword ptr [rip + LCPI0_0] ## xmm8 = [65535,0,65535,0,0,0,0,0]
	pxor	xmm1, xmm1
	movdqa	xmm9, xmmword ptr [rip + LCPI0_1] ## xmm9 = [0,0,65535,0,65535,0,0,0]
	movdqa	xmm10, xmmword ptr [rip + LCPI0_2] ## xmm10 = [0,0,65535,0,0,0,0,0]
	movdqa	xmm11, xmmword ptr [rip + LCPI0_3] ## xmm11 = [0,0,0,0,65535,0,0,0]
	movdqa	xmm12, xmmword ptr [rip + LCPI0_4] ## xmm12 = [0,0,0,0,65535,0,65535,0]
	movdqa	xmm13, xmmword ptr [rip + LCPI0_5] ## xmm13 = [0,0,0,0,0,0,65535,0]
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_4 Depth 2
	mov	rdx, rsi
	xor	ebx, ebx
	.p2align	4, 0x90
LBB0_4:                                 ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqa	xmm6, xmmword ptr [rdi + 4*rbx]
	movdqa	xmm4, xmmword ptr [rax + 4*rbx]
	movdqa	xmm5, xmmword ptr [rcx + 4*rbx]
	movdqa	xmm3, xmm6
	pand	xmm3, xmm8
	movdqa	xmm0, xmm4
	punpcklwd	xmm0, xmm1      ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1],xmm0[2],xmm1[2],xmm0[3],xmm1[3]
	punpckldq	xmm0, xmm1      ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	pslldq	xmm0, 8                 ## xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5,6,7]
	movdqa	xmm2, xmm5
	punpcklwd	xmm2, xmm1      ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1],xmm2[2],xmm1[2],xmm2[3],xmm1[3]
	pslldq	xmm2, 12                ## xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3]
	por	xmm2, xmm3
	por	xmm2, xmm0
	pshufd	xmm0, xmm2, 120         ## xmm0 = xmm2[0,2,3,1]
	movdqa	xmm2, xmm4
	pand	xmm2, xmm9
	movdqa	xmm3, xmm5
	pand	xmm3, xmm10
	psrldq	xmm3, 4                 ## xmm3 = xmm3[4,5,6,7,8,9,10,11,12,13,14,15],zero,zero,zero,zero
	movdqa	xmm7, xmm6
	pand	xmm7, xmm11
	pslldq	xmm7, 4                 ## xmm7 = zero,zero,zero,zero,xmm7[0,1,2,3,4,5,6,7,8,9,10,11]
	por	xmm7, xmm2
	por	xmm7, xmm3
	pshufd	xmm2, xmm7, 177         ## xmm2 = xmm7[1,0,3,2]
	pand	xmm5, xmm12
	pand	xmm6, xmm13
	psrldq	xmm6, 12                ## xmm6 = xmm6[12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero
	por	xmm6, xmm5
	pand	xmm4, xmm13
	psrldq	xmm4, 8                 ## xmm4 = xmm4[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
	por	xmm4, xmm6
	pshufd	xmm3, xmm4, 210         ## xmm3 = xmm4[2,0,1,3]
	movdqa	xmmword ptr [rdx - 32], xmm0
	movdqa	xmmword ptr [rdx - 16], xmm2
	movdqa	xmmword ptr [rdx], xmm3
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
