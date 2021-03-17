	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	__Z20matrixTransformG2AsmPiS_ ## -- Begin function _Z17matrixTransformG2PiS_
	.p2align	4, 0x90
__Z20matrixTransformG2AsmPiS_:             ## @_Z17matrixTransformG2PiS_
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	xor	r8d, r8d
	mov	r11, rsi
	mov	rdx, rdi
	jmp	LBB0_1
	.p2align	4, 0x90
LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
	inc	r8
	add	rdx, 960
	add	r11, 960
	cmp	r8, 180
	je	LBB0_8
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_4 Depth 2
                                        ##     Child Loop BB0_6 Depth 2
	imul	r10, r8, 960
	lea	r9, [rdi + r10 + 960]
	lea	rax, [rsi + r10]
	cmp	rax, r9
	jae	LBB0_3
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	lea	r9, [rdi + r10]
	lea	rax, [rsi + r10 + 960]
	cmp	r9, rax
	jae	LBB0_3
## %bb.5:                               ##   in Loop: Header=BB0_1 Depth=1
	xor	eax, eax
	.p2align	4, 0x90
LBB0_6:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	ecx, dword ptr [rdx + 4*rax]
	mov	dword ptr [r11 + 8*rax], ecx
	mov	ecx, dword ptr [rdx + 4*rax + 480]
	mov	dword ptr [r11 + 8*rax + 4], ecx
	mov	ecx, dword ptr [rdx + 4*rax + 4]
	mov	dword ptr [r11 + 8*rax + 8], ecx
	mov	ecx, dword ptr [rdx + 4*rax + 484]
	mov	dword ptr [r11 + 8*rax + 12], ecx
	add	rax, 2
	cmp	rax, 120
	jne	LBB0_6
	jmp	LBB0_7
	.p2align	4, 0x90
LBB0_3:                                 ##   in Loop: Header=BB0_1 Depth=1
	mov	eax, 4
	.p2align	4, 0x90
LBB0_4:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movups	xmm0, xmmword ptr [rdx + 4*rax - 16]
	movups	xmm1, xmmword ptr [rdx + 4*rax + 464]
	movaps	xmm2, xmm0
	unpcklps	xmm2, xmm1      ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	unpckhps	xmm0, xmm1      ## xmm0 = xmm0[2],xmm1[2],xmm0[3],xmm1[3]
	movups	xmmword ptr [r11 + 8*rax - 16], xmm0
	movups	xmmword ptr [r11 + 8*rax - 32], xmm2
	movups	xmm0, xmmword ptr [rdx + 4*rax]
	movups	xmm1, xmmword ptr [rdx + 4*rax + 480]
	movaps	xmm2, xmm0
	unpcklps	xmm2, xmm1      ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	unpckhps	xmm0, xmm1      ## xmm0 = xmm0[2],xmm1[2],xmm0[3],xmm1[3]
	movups	xmmword ptr [r11 + 8*rax + 16], xmm0
	movups	xmmword ptr [r11 + 8*rax], xmm2
	add	rax, 8
	cmp	rax, 124
	jne	LBB0_4
	jmp	LBB0_7
LBB0_8:
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
