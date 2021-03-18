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
	movdqu	xmm0, XMMWORD PTR [rdx] # Взять адрес psrc и поместить 16 байт в xmm0
	add	rdx, 16						# Сдвинуть адрес psrcs на 16 байт (это psrcs++)
	add	rax, 32						
	pshufd	xmm1, xmm0, 85 # 85 = 01 01 01 01 b
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
