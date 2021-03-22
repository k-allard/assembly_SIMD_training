	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	__Z24matrixTransformG2_unpackPiS_ii ## -- Begin function _Z24matrixTransformG2_unpackPiS_ii
	.p2align	4, 0x90
__Z24matrixTransformG2_unpackPiS_ii:    ## @_Z24matrixTransformG2_unpackPiS_ii
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	mov	qword ptr [rbp - 56], rsi ## 8-byte Spill
	mov	qword ptr [rbp - 48], rdi ## 8-byte Spill
	test	ecx, ecx
	jle	LBB0_9
## %bb.1:
	cmp	edx, 2
	jl	LBB0_9
## %bb.2:
	mov	eax, edx
	shr	eax, 31
	add	eax, edx
	sar	eax
	cdqe
	movsxd	rsi, edx
	mov	r11d, ecx
	lea	r14, [rax - 1]
	shr	r14, 4
	lea	r8, [r14 + 1]
	mov	r15d, r8d
	and	r15d, 1
	sub	r8, r15
	mov	qword ptr [rbp - 72], rax ## 8-byte Spill
	mov	rdx, qword ptr [rbp - 48] ## 8-byte Reload
	lea	rcx, [rdx + 4*rax + 64]
	mov	qword ptr [rbp - 64], rsi ## 8-byte Spill
	lea	r12, [4*rsi]
	add	rdx, 64
	mov	rax, qword ptr [rbp - 56] ## 8-byte Reload
	add	rax, 192
	xor	r13d, r13d
	mov	rdi, qword ptr [rbp - 72] ## 8-byte Reload
	xor	ebx, ebx
	test	r14, r14
	jne	LBB0_4
	jmp	LBB0_6
	.p2align	4, 0x90
LBB0_8:                                 ##   in Loop: Header=BB0_6 Depth=1
	inc	r13
	add	rcx, r12
	add	rdx, r12
	add	rax, r12
	cmp	r13, r11
	je	LBB0_9
## %bb.3:                               ##   in Loop: Header=BB0_6 Depth=1
	xor	ebx, ebx
	test	r14, r14
	je	LBB0_6
LBB0_4:
	mov	r10, r8
	.p2align	4, 0x90
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	movaps	xmm0, xmmword ptr [rdx + 4*rbx - 64]
	movaps	xmm1, xmmword ptr [rcx + 4*rbx - 64]
	movaps	xmm2, xmm0
	unpcklps	xmm2, xmm1      ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	unpckhps	xmm0, xmm1      ## xmm0 = xmm0[2],xmm1[2],xmm0[3],xmm1[3]
	movaps	xmmword ptr [rax + 8*rbx - 192], xmm2
	movaps	xmmword ptr [rax + 8*rbx - 128], xmm0
	movaps	xmm0, xmmword ptr [rdx + 4*rbx]
	movaps	xmm1, xmmword ptr [rcx + 4*rbx]
	movaps	xmm2, xmm0
	unpcklps	xmm2, xmm1      ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	unpckhps	xmm0, xmm1      ## xmm0 = xmm0[2],xmm1[2],xmm0[3],xmm1[3]
	movaps	xmmword ptr [rax + 8*rbx - 64], xmm2
	movaps	xmmword ptr [rax + 8*rbx], xmm0
	add	rbx, 32
	add	r10, -2
	jne	LBB0_5
LBB0_6:                                 ## =>This Inner Loop Header: Depth=1
	test	r15, r15
	je	LBB0_8
## %bb.7:                               ##   in Loop: Header=BB0_6 Depth=1
	mov	r9, r13
	imul	r9, qword ptr [rbp - 64] ## 8-byte Folded Reload
	mov	rsi, qword ptr [rbp - 48] ## 8-byte Reload
	lea	r10, [rsi + 4*r9]
	mov	rsi, qword ptr [rbp - 56] ## 8-byte Reload
	lea	rsi, [rsi + 4*r9]
	lea	r9, [r10 + 4*rbx]
	movaps	xmm0, xmmword ptr [r10 + 4*rbx]
	movaps	xmm1, xmmword ptr [r9 + 4*rdi]
	movaps	xmm2, xmm0
	unpcklps	xmm2, xmm1      ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	unpckhps	xmm0, xmm1      ## xmm0 = xmm0[2],xmm1[2],xmm0[3],xmm1[3]
	movaps	xmmword ptr [rsi + 8*rbx], xmm2
	movaps	xmmword ptr [rsi + 8*rbx + 64], xmm0
	jmp	LBB0_8
LBB0_9:
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
                                        ## -- End function

.subsections_via_symbols
