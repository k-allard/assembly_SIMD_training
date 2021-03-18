	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	__Z17matrixTransformG2PiS_mm ## -- Begin function _Z17matrixTransformG2PiS_mm
	.p2align	4, 0x90
__Z17matrixTransformG2PiS_mm:           ## @_Z17matrixTransformG2PiS_mm
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	mov	qword ptr [rbp - 56], rsi ## 8-byte Spill
	mov	qword ptr [rbp - 64], rdi ## 8-byte Spill
	test	rcx, rcx
	je	LBB0_19
## %bb.1:
	mov	r15, rdx
	mov	rax, rdx
	shr	rax
	mov	qword ptr [rbp - 96], rax ## 8-byte Spill
	test	eax, eax
	jle	LBB0_19
## %bb.2:
	movsxd	rsi, dword ptr [rbp - 96] ## 4-byte Folded Reload
	mov	r11d, esi
	lea	rax, [r11 - 1]
	lea	rdx, [r11 + r11]
	mov	qword ptr [rbp - 120], rdx ## 8-byte Spill
	lea	rdx, [rsi + r11]
	mov	qword ptr [rbp - 112], rdx ## 8-byte Spill
	mov	edx, 8
	mul	rdx
	mov	qword ptr [rbp - 128], rax ## 8-byte Spill
	seto	r12b
	mov	eax, esi
	and	eax, 3
	mov	r8, r11
	mov	qword ptr [rbp - 104], rax ## 8-byte Spill
	sub	r8, rax
	mov	rdi, qword ptr [rbp - 64] ## 8-byte Reload
	mov	qword ptr [rbp - 88], rsi ## 8-byte Spill
	lea	rdx, [rdi + 4*rsi]
	lea	rax, [4*r15]
	mov	qword ptr [rbp - 136], rax ## 8-byte Spill
	xor	r13d, r13d
	mov	rsi, qword ptr [rbp - 56] ## 8-byte Reload
	mov	byte ptr [rbp - 41], r12b ## 1-byte Spill
	mov	qword ptr [rbp - 80], rcx ## 8-byte Spill
	mov	qword ptr [rbp - 72], r15 ## 8-byte Spill
	mov	r14, r13
	imul	r14, r15
	cmp	r11, 4
	jb	LBB0_5
	jmp	LBB0_10
	.p2align	4, 0x90
LBB0_3:
	inc	r13
	mov	rax, qword ptr [rbp - 136] ## 8-byte Reload
	add	rdx, rax
	add	rdi, rax
	add	rsi, rax
	cmp	r13, rcx
	je	LBB0_19
## %bb.4:
	mov	r14, r13
	imul	r14, r15
	cmp	r11, 4
	jae	LBB0_10
LBB0_5:
	xor	r10d, r10d
LBB0_6:
	mov	rax, qword ptr [rbp - 96] ## 8-byte Reload
                                        ## kill: def $eax killed $eax killed $rax def $rax
	sub	eax, r10d
	mov	rbx, r10
	test	al, 1
	je	LBB0_8
## %bb.7:
	lea	r9, [r14 + 2*r10]
	add	r14, r10
	mov	r12, qword ptr [rbp - 64] ## 8-byte Reload
	mov	ebx, dword ptr [r12 + 4*r14]
	mov	rax, qword ptr [rbp - 56] ## 8-byte Reload
	mov	dword ptr [rax + 4*r9], ebx
	add	r14, qword ptr [rbp - 88] ## 8-byte Folded Reload
	mov	ebx, dword ptr [r12 + 4*r14]
	mov	r12b, byte ptr [rbp - 41] ## 1-byte Reload
	mov	dword ptr [rax + 4*r9 + 4], ebx
	lea	rbx, [r10 + 1]
LBB0_8:
	inc	r10
	cmp	r11, r10
	je	LBB0_3
	.p2align	4, 0x90
LBB0_9:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rdi + 4*rbx]
	mov	dword ptr [rsi + 8*rbx], eax
	mov	eax, dword ptr [rdx + 4*rbx]
	mov	dword ptr [rsi + 8*rbx + 4], eax
	mov	eax, dword ptr [rdi + 4*rbx + 4]
	mov	dword ptr [rsi + 8*rbx + 8], eax
	mov	eax, dword ptr [rdx + 4*rbx + 4]
	mov	dword ptr [rsi + 8*rbx + 12], eax
	add	rbx, 2
	cmp	r11, rbx
	jne	LBB0_9
	jmp	LBB0_3
	.p2align	4, 0x90
LBB0_10:
	mov	rax, qword ptr [rbp - 56] ## 8-byte Reload
	lea	r9, [rax + 4*r14]
	lea	rbx, [rax + 4*r14 + 4]
	mov	rax, r9
	not	rax
	mov	r10, qword ptr [rbp - 128] ## 8-byte Reload
	cmp	r10, rax
	seta	al
	or	al, r12b
	not	rbx
	cmp	r10, rbx
	seta	bl
	test	al, al
	jne	LBB0_5
## %bb.11:
	or	bl, r12b
	mov	r10d, 0
	jne	LBB0_6
## %bb.12:
	mov	rax, qword ptr [rbp - 120] ## 8-byte Reload
	lea	rcx, [rax + r14]
	mov	rax, qword ptr [rbp - 88] ## 8-byte Reload
	lea	rbx, [rax + r14]
	mov	rax, qword ptr [rbp - 112] ## 8-byte Reload
	lea	r10, [rax + r14]
	lea	r12, [r11 + r14]
	mov	rax, qword ptr [rbp - 56] ## 8-byte Reload
	lea	r15, [rax + 4*rcx]
	mov	rax, qword ptr [rbp - 64] ## 8-byte Reload
	lea	rcx, [rax + 4*rbx]
	lea	rbx, [rax + 4*r10]
	lea	r10, [rax + 4*r14]
	lea	rax, [rax + 4*r12]
	cmp	r9, rbx
	setb	r12b
	cmp	rcx, r15
	setb	bl
	cmp	r9, rax
	setb	cl
	cmp	r10, r15
	setb	r9b
	test	r12b, bl
	jne	LBB0_18
## %bb.13:
	mov	r10d, 0
	and	cl, r9b
	mov	rcx, qword ptr [rbp - 80] ## 8-byte Reload
	mov	r15, qword ptr [rbp - 72] ## 8-byte Reload
	mov	r12b, byte ptr [rbp - 41] ## 1-byte Reload
	jne	LBB0_6
## %bb.14:
	xor	eax, eax
	.p2align	4, 0x90
LBB0_15:                                ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rdi + 4*rax]
	movups	xmm1, xmmword ptr [rdx + 4*rax]
	movaps	xmm2, xmm0
	unpcklps	xmm2, xmm1      ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	unpckhps	xmm0, xmm1      ## xmm0 = xmm0[2],xmm1[2],xmm0[3],xmm1[3]
	movups	xmmword ptr [rsi + 8*rax + 16], xmm0
	movups	xmmword ptr [rsi + 8*rax], xmm2
	add	rax, 4
	cmp	r8, rax
	jne	LBB0_15
## %bb.16:
	mov	r10, r8
	cmp	qword ptr [rbp - 104], 0 ## 8-byte Folded Reload
	jne	LBB0_6
	jmp	LBB0_3
LBB0_18:
	xor	r10d, r10d
	mov	rcx, qword ptr [rbp - 80] ## 8-byte Reload
	mov	r15, qword ptr [rbp - 72] ## 8-byte Reload
	mov	r12b, byte ptr [rbp - 41] ## 1-byte Reload
	jmp	LBB0_6
LBB0_19:
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
                                        ## -- End function

.subsections_via_symbols
