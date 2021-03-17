	.file	"transform.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	transform3
	.type	transform3, @function
transform3:
	endbr64
	test	rcx, rcx
	je	.L13
	mov	r8, rdi
	mov	rdi, rdx
	push	rbp
	movabs	rdx, -6148914691236517205
	mov	rax, rdi
	push	rbx
	mov	rbx, rcx
	lea	rbp, 0[0+rdi*4]
	mul	rdx
	mov	rcx, rdx
	shr	rcx
	cmp	rdi, 2
	jbe	.L1
	xor	r11d, r11d
	.p2align 4,,10
	.p2align 3
.L5:
	cmp	rdi, rcx
	mov	r10, rcx
	cmovbe	r10, rdi
	xor	r9d, r9d
	.p2align 4,,10
	.p2align 3
.L4:
	mov	rax, r9
	.p2align 4,,10
	.p2align 3
.L3:
	mov	edx, DWORD PTR [r8+rax*4]
	add	rax, rcx
	add	rsi, 4
	mov	DWORD PTR -4[rsi], edx
	cmp	rdi, rax
	ja	.L3
	add	r9, 1
	cmp	r9, r10
	jb	.L4
	add	r11, 1
	add	r8, rbp
	cmp	rbx, r11
	jne	.L5
.L1:
	pop	rbx
	pop	rbp
	ret
.L13:
	ret
	.size	transform3, .-transform3
	.p2align 4
	.globl	transformz2
	.type	transformz2, @function
transformz2:
	endbr64
	test	rcx, rcx
	je	.L57
	push	r15
	lea	rax, -1[rdx]
	mov	r8, rdx
	lea	r10, 4[rsi]
	push	r14
	push	r13
	push	r12
	mov	r12, rcx
	push	rbp
	push	rbx
	lea	rbx, 0[0+rdx*4]
	sub	rsp, 64
	mov	QWORD PTR -64[rsp], rax
	shr	rax
	lea	r15, 1[rax]
	lea	rcx, 0[0+r15*4]
	mov	r14, r15
	mov	rdx, r15
	and	r14, -4
	mov	QWORD PTR -88[rsp], rcx
	shr	rdx, 2
	lea	rcx, 4[0+rax*8]
	mov	QWORD PTR -80[rsp], rcx
	lea	rcx, 0[0+r14*4]
	sal	rdx, 4
	mov	QWORD PTR -32[rsp], rcx
	lea	rcx, 0[0+r14*8]
	lea	r11, 8[rcx]
	mov	QWORD PTR -8[rsp], rcx
	add	rcx, 16
	mov	QWORD PTR 48[rsp], rcx
	lea	rcx, -2[r8]
	mov	rbp, rcx
	mov	QWORD PTR -40[rsp], rdx
	lea	rdx, 2[r14+r14]
	shr	rbp
	mov	QWORD PTR [rsp], rdx
	add	rdx, 2
	lea	rax, 2[rbp+rax]
	add	rbp, 1
	mov	QWORD PTR 32[rsp], rdx
	sal	rax, 2
	mov	r13, rbp
	mov	QWORD PTR -72[rsp], rcx
	mov	QWORD PTR -104[rsp], rax
	lea	rax, 0[0+rbp*8]
	and	r13, -4
	mov	QWORD PTR -96[rsp], rax
	mov	rax, rbp
	lea	rcx, 4[0+r13*8]
	shr	rax, 2
	mov	QWORD PTR -24[rsp], rcx
	sal	rax, 4
	mov	QWORD PTR 24[rsp], r11
	xor	r11d, r11d
	mov	QWORD PTR -56[rsp], rax
	lea	rax, 0[0+r13*4]
	mov	QWORD PTR -48[rsp], rax
	lea	rax, [r13+r13]
	lea	rdx, 3[rax]
	add	rax, 5
	mov	QWORD PTR 16[rsp], rax
	lea	rax, 16[rcx]
	mov	QWORD PTR -16[rsp], rdx
	lea	rdx, 8[rcx]
	mov	QWORD PTR 40[rsp], rax
	lea	rax, 0[0+rbp*4]
	mov	QWORD PTR 8[rsp], rdx
	mov	QWORD PTR -112[rsp], rax
	.p2align 4,,10
	.p2align 3
.L30:
	test	r8, r8
	je	.L19
	mov	rax, QWORD PTR -88[rsp]
	lea	rcx, [rdi+rax]
	mov	rax, QWORD PTR -80[rsp]
	add	rax, rsi
	cmp	rdi, rax
	setnb	dl
	cmp	rsi, rcx
	setnb	al
	or	dl, al
	je	.L32
	cmp	QWORD PTR -64[rsp], 19
	jbe	.L32
	mov	r9, QWORD PTR -40[rsp]
	mov	rdx, rdi
	mov	rax, rsi
	add	r9, rdi
	.p2align 4,,10
	.p2align 3
.L23:
	movdqu	xmm0, XMMWORD PTR [rdx]
	add	rdx, 16
	add	rax, 32
	pshufd	xmm1, xmm0, 85
	movd	DWORD PTR -32[rax], xmm0
	movd	DWORD PTR -24[rax], xmm1
	movdqa	xmm1, xmm0
	punpckhdq	xmm1, xmm0
	pshufd	xmm0, xmm0, 255
	movd	DWORD PTR -16[rax], xmm1
	movd	DWORD PTR -8[rax], xmm0
	cmp	rdx, r9
	jne	.L23
	mov	rax, QWORD PTR -32[rsp]
	add	rax, rdi
	cmp	r15, r14
	je	.L21
	mov	edx, DWORD PTR [rax]
	mov	r9, QWORD PTR -8[rsp]
	mov	DWORD PTR [rsi+r9], edx
	cmp	r8, QWORD PTR [rsp]
	jbe	.L21
	mov	edx, DWORD PTR 4[rax]
	mov	r9, QWORD PTR 24[rsp]
	mov	DWORD PTR [rsi+r9], edx
	cmp	r8, QWORD PTR 32[rsp]
	jbe	.L21
	mov	eax, DWORD PTR 8[rax]
	mov	rdx, QWORD PTR 48[rsp]
	mov	DWORD PTR [rsi+rdx], eax
.L21:
	mov	rax, QWORD PTR -96[rsp]
	add	rdi, QWORD PTR -104[rsp]
	cmp	rdi, r10
	setbe	dl
	add	rax, rsi
	cmp	rcx, rax
	setnb	al
	or	dl, al
	je	.L33
	cmp	QWORD PTR -72[rsp], 19
	jbe	.L33
	mov	rax, QWORD PTR -56[rsp]
	mov	rdx, rcx
	lea	rdi, [rax+rcx]
	mov	rax, r10
	.p2align 4,,10
	.p2align 3
.L27:
	movdqu	xmm0, XMMWORD PTR [rdx]
	add	rdx, 16
	add	rax, 32
	pshufd	xmm1, xmm0, 85
	movd	DWORD PTR -32[rax], xmm0
	movd	DWORD PTR -24[rax], xmm1
	movdqa	xmm1, xmm0
	punpckhdq	xmm1, xmm0
	pshufd	xmm0, xmm0, 255
	movd	DWORD PTR -16[rax], xmm1
	movd	DWORD PTR -8[rax], xmm0
	cmp	rdi, rdx
	jne	.L27
	mov	rax, QWORD PTR -48[rsp]
	add	rax, rcx
	cmp	rbp, r13
	je	.L29
	mov	edx, DWORD PTR [rax]
	mov	rdi, QWORD PTR -24[rsp]
	mov	DWORD PTR [rsi+rdi], edx
	cmp	r8, QWORD PTR -16[rsp]
	jbe	.L29
	mov	edx, DWORD PTR 4[rax]
	mov	rdi, QWORD PTR 8[rsp]
	mov	DWORD PTR [rsi+rdi], edx
	cmp	r8, QWORD PTR 16[rsp]
	jbe	.L29
	mov	eax, DWORD PTR 8[rax]
	mov	rdi, QWORD PTR 40[rsp]
	mov	DWORD PTR [rsi+rdi], eax
.L29:
	mov	rax, QWORD PTR -112[rsp]
	lea	rdi, [rcx+rax]
.L19:
	add	r11, 1
	add	rsi, rbx
	add	r10, rbx
	cmp	r12, r11
	jne	.L30
	add	rsp, 64
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L33:
	mov	eax, 1
	.p2align 4,,10
	.p2align 3
.L26:
	mov	edx, DWORD PTR -2[rcx+rax*2]
	mov	DWORD PTR [rsi+rax*4], edx
	add	rax, 2
	cmp	r8, rax
	ja	.L26
	jmp	.L29
.L32:
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L22:
	mov	edx, DWORD PTR [rdi+rax*2]
	mov	DWORD PTR [rsi+rax*4], edx
	add	rax, 2
	cmp	r8, rax
	ja	.L22
	cmp	r8, 1
	jne	.L21
	mov	rdi, rcx
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L57:
	ret
	.size	transformz2, .-transformz2
	.p2align 4
	.globl	transformz3
	.type	transformz3, @function
transformz3:
	endbr64
	test	rcx, rcx
	je	.L86
	push	r15
	lea	rax, 0[0+rdx*4]
	mov	r8, rsi
	mov	r10, rdx
	push	r14
	movdqa	xmm5, XMMWORD PTR .LC0[rip]
	push	r13
	movdqa	xmm4, XMMWORD PTR .LC1[rip]
	mov	r13, rcx
	push	r12
	movabs	r12, -6148914691236517205
	push	rbp
	xor	ebp, ebp
	push	rbx
	mov	QWORD PTR -24[rsp], rax
	lea	rax, -1[rdx]
	mov	QWORD PTR -16[rsp], rax
	.p2align 4,,10
	.p2align 3
.L68:
	mov	r11, QWORD PTR -16[rsp]
	mov	rbx, r8
	xor	ecx, ecx
.L67:
	lea	r14, 1[rcx]
	cmp	r10, rcx
	jbe	.L62
	mov	rax, r11
	lea	r14, 1[rcx]
	mul	r12
	shr	rdx
	lea	rax, [rdx+rdx*2]
	lea	r9, 1[rdx]
	add	rax, r14
	lea	rax, [r8+rax*4]
	cmp	rdi, rax
	lea	rax, [rdi+r9*4]
	setnb	dl
	cmp	rax, rbx
	setbe	al
	or	dl, al
	je	.L69
	cmp	r10, -3
	setbe	dl
	cmp	r11, 41
	seta	al
	test	dl, al
	je	.L69
	lea	rax, 4[rdi]
	mov	r15, r9
	movq	xmm2, rdi
	xor	edx, edx
	movq	xmm6, rax
	shr	r15, 2
	mov	rax, rbx
	punpcklqdq	xmm2, xmm6
	.p2align 4,,10
	.p2align 3
.L64:
	mov	rsi, rdx
	movdqa	xmm0, xmm2
	add	rdx, 1
	add	rax, 48
	sal	rsi, 4
	movdqa	xmm1, xmm0
	paddq	xmm2, xmm5
	movdqu	xmm0, XMMWORD PTR [rdi+rsi]
	paddq	xmm1, xmm4
	pshufd	xmm3, xmm0, 85
	movd	DWORD PTR -48[rax], xmm0
	movd	DWORD PTR -36[rax], xmm3
	movdqa	xmm3, xmm0
	punpckhdq	xmm3, xmm0
	pshufd	xmm0, xmm0, 255
	movd	DWORD PTR -24[rax], xmm3
	movd	DWORD PTR -12[rax], xmm0
	cmp	rdx, r15
	jb	.L64
	mov	rdx, r9
	movhlps	xmm7, xmm1
	and	rdx, -4
	lea	rax, [rdx+rdx*2]
	add	rax, rcx
	lea	rcx, [rdi+rdx*4]
	movq	rdi, xmm7
	cmp	r9, rdx
	je	.L62
	mov	esi, DWORD PTR [rcx]
	lea	rdi, 4[rcx]
	lea	rdx, 0[0+rax*4]
	mov	DWORD PTR [r8+rax*4], esi
	lea	rsi, 3[rax]
	cmp	r10, rsi
	jbe	.L62
	mov	esi, DWORD PTR 4[rcx]
	add	rax, 6
	lea	rdi, 8[rcx]
	mov	DWORD PTR 12[r8+rdx], esi
	cmp	r10, rax
	jbe	.L62
	mov	eax, DWORD PTR 8[rcx]
	lea	rdi, 12[rcx]
	mov	DWORD PTR 24[r8+rdx], eax
.L62:
	mov	rcx, r14
	add	rbx, 4
	sub	r11, 1
	cmp	r14, 3
	jne	.L67
	add	rbp, 1
	add	r8, QWORD PTR -24[rsp]
	cmp	r13, rbp
	jne	.L68
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
	.p2align 4,,10
	.p2align 3
.L69:
	mov	rax, rcx
	.p2align 4,,10
	.p2align 3
.L63:
	mov	edx, DWORD PTR [rdi]
	add	rdi, 4
	mov	DWORD PTR [r8+rax*4], edx
	add	rax, 3
	cmp	r10, rax
	ja	.L63
	jmp	.L62
.L86:
	ret
	.size	transformz3, .-transformz3
	.p2align 4
	.globl	transformz5
	.type	transformz5, @function
transformz5:
	endbr64
	test	rcx, rcx
	je	.L115
	push	r15
	lea	rax, 0[0+rdx*4]
	mov	r9, rsi
	mov	r10, rdx
	push	r14
	movdqa	xmm5, XMMWORD PTR .LC0[rip]
	push	r13
	movdqa	xmm4, XMMWORD PTR .LC1[rip]
	mov	r13, rcx
	push	r12
	xor	r12d, r12d
	push	rbp
	lea	rbp, -1[rdx]
	push	rbx
	movabs	rbx, -3689348814741910323
	mov	QWORD PTR -16[rsp], rax
	.p2align 4,,10
	.p2align 3
.L97:
	mov	r11, r9
	xor	ecx, ecx
.L96:
	lea	r8, 1[rcx]
	cmp	r10, rcx
	jbe	.L91
	mov	rsi, rbp
	lea	r8, 1[rcx]
	sub	rsi, rcx
	mov	rax, rsi
	mul	rbx
	shr	rdx, 2
	lea	rax, [rdx+rdx*4]
	lea	r14, 1[rdx]
	add	rax, r8
	lea	rax, [r9+rax*4]
	cmp	rdi, rax
	lea	rax, [rdi+r14*4]
	setnb	dl
	cmp	rax, r11
	setbe	al
	or	dl, al
	je	.L98
	cmp	r10, -5
	setbe	dl
	cmp	rsi, 69
	seta	al
	test	dl, al
	je	.L98
	lea	rax, 4[rdi]
	mov	r15, r14
	movq	xmm2, rdi
	xor	edx, edx
	movq	xmm6, rax
	shr	r15, 2
	mov	rax, r11
	punpcklqdq	xmm2, xmm6
	.p2align 4,,10
	.p2align 3
.L93:
	mov	rsi, rdx
	movdqa	xmm0, xmm2
	add	rdx, 1
	add	rax, 80
	sal	rsi, 4
	movdqa	xmm1, xmm0
	paddq	xmm2, xmm5
	movdqu	xmm0, XMMWORD PTR [rdi+rsi]
	paddq	xmm1, xmm4
	pshufd	xmm3, xmm0, 85
	movd	DWORD PTR -80[rax], xmm0
	movd	DWORD PTR -60[rax], xmm3
	movdqa	xmm3, xmm0
	punpckhdq	xmm3, xmm0
	pshufd	xmm0, xmm0, 255
	movd	DWORD PTR -40[rax], xmm3
	movd	DWORD PTR -20[rax], xmm0
	cmp	rdx, r15
	jb	.L93
	mov	rsi, r14
	movhlps	xmm7, xmm1
	and	rsi, -4
	lea	rdx, 0[0+rsi*4]
	lea	rax, [rdx+rsi]
	add	rdx, rdi
	movq	rdi, xmm7
	add	rax, rcx
	cmp	r14, rsi
	je	.L91
	mov	esi, DWORD PTR [rdx]
	lea	rdi, 4[rdx]
	lea	rcx, 0[0+rax*4]
	mov	DWORD PTR [r9+rax*4], esi
	lea	rsi, 5[rax]
	cmp	r10, rsi
	jbe	.L91
	mov	esi, DWORD PTR 4[rdx]
	add	rax, 10
	lea	rdi, 8[rdx]
	mov	DWORD PTR 20[r9+rcx], esi
	cmp	r10, rax
	jbe	.L91
	mov	eax, DWORD PTR 8[rdx]
	lea	rdi, 12[rdx]
	mov	DWORD PTR 40[r9+rcx], eax
.L91:
	mov	rcx, r8
	add	r11, 4
	cmp	r8, 5
	jne	.L96
	add	r12, 1
	add	r9, QWORD PTR -16[rsp]
	cmp	r13, r12
	jne	.L97
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
	.p2align 4,,10
	.p2align 3
.L98:
	mov	rax, rcx
	.p2align 4,,10
	.p2align 3
.L92:
	mov	edx, DWORD PTR [rdi]
	add	rdi, 4
	mov	DWORD PTR [r9+rax*4], edx
	add	rax, 5
	cmp	r10, rax
	ja	.L92
	jmp	.L91
.L115:
	ret
	.size	transformz5, .-transformz5
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	16
	.quad	16
	.align 16
.LC1:
	.quad	12
	.quad	12
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
