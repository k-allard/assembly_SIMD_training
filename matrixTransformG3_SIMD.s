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
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	1                       ## 0x1
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI0_2:
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	0                       ## 0x0
	.byte	1                       ## 0x1
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI0_3:
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
LCPI0_4:
	.byte	4                       ## 0x4
	.byte	5                       ## 0x5
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI0_5:
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	8                       ## 0x8
	.byte	9                       ## 0x9
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI0_6:
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
	.short	65535                   ## 0xffff
	.short	0                       ## 0x0
LCPI0_7:
	.byte	12                      ## 0xc
	.byte	13                      ## 0xd
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI0_8:
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	12                      ## 0xc
	.byte	13                      ## 0xd
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
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
	movdqa	xmm8, xmmword ptr [rip + LCPI0_0] ## xmm8 = [65535,0,65535,0,0,0,0,0]
	movdqa	xmm9, xmmword ptr [rip + LCPI0_1] ## xmm9 = [255,255,255,255,255,255,255,255,0,1,255,255,255,255,255,255]
	movdqa	xmm10, xmmword ptr [rip + LCPI0_2] ## xmm10 = [255,255,255,255,255,255,255,255,255,255,255,255,0,1,255,255]
	movdqa	xmm11, xmmword ptr [rip + LCPI0_3] ## xmm11 = [0,0,65535,0,65535,0,0,0]
	movdqa	xmm12, xmmword ptr [rip + LCPI0_4] ## xmm12 = [4,5,255,255,255,255,255,255,255,255,255,255,255,255,255,255]
	movdqa	xmm13, xmmword ptr [rip + LCPI0_5] ## xmm13 = [255,255,255,255,255,255,255,255,255,255,255,255,8,9,255,255]
	movdqa	xmm14, xmmword ptr [rip + LCPI0_6] ## xmm14 = [0,0,0,0,65535,0,65535,0]
	movdqa	xmm15, xmmword ptr [rip + LCPI0_7] ## xmm15 = [12,13,255,255,255,255,255,255,255,255,255,255,255,255,255,255]
	movdqa	xmm0, xmmword ptr [rip + LCPI0_8] ## xmm0 = [255,255,255,255,12,13,255,255,255,255,255,255,255,255,255,255]
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_4 Depth 2
	mov	rdx, rsi
	xor	ebx, ebx
	.p2align	4, 0x90
LBB0_4:                                 ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movdqa	xmm7, xmmword ptr [rdi + 4*rbx]
	movdqa	xmm5, xmmword ptr [rax + 4*rbx]
	movdqa	xmm6, xmmword ptr [rcx + 4*rbx]
	movdqa	xmm4, xmm7
	pand	xmm4, xmm8
	movdqa	xmm2, xmm5
	pshufb	xmm2, xmm9
	por	xmm2, xmm4
	movdqa	xmm4, xmm6
	pshufb	xmm4, xmm10
	por	xmm4, xmm2
	pshufd	xmm2, xmm4, 120         ## xmm2 = xmm4[0,2,3,1]
	movdqa	xmm4, xmm5
	pand	xmm4, xmm11
	movdqa	xmm3, xmm6
	pshufb	xmm3, xmm12
	movdqa	xmm1, xmm7
	pshufb	xmm1, xmm13
	por	xmm1, xmm4
	por	xmm1, xmm3
	pshufd	xmm1, xmm1, 177         ## xmm1 = xmm1[1,0,3,2]
	pand	xmm6, xmm14
	pshufb	xmm7, xmm15
	por	xmm7, xmm6
	pshufb	xmm5, xmm0
	por	xmm5, xmm7
	pshufd	xmm3, xmm5, 210         ## xmm3 = xmm5[2,0,1,3]
	movdqa	xmmword ptr [rdx - 32], xmm2
	movdqa	xmmword ptr [rdx - 16], xmm1
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
