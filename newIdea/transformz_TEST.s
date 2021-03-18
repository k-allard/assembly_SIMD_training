	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	_transform3             ## -- Begin function transform3
	.p2align	4, 0x90
_transform3:                            ## @transform3
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r14
	push	rbx
	test	rcx, rcx
	je	LBB0_9
## %bb.1:
	mov	r8, rdx
	movabs	rdx, -6148914691236517205
	mov	rax, r8
	mul	rdx
	cmp	r8, 3
	jb	LBB0_9
## %bb.2:
	shr	rdx
	lea	r9, [4*r8]
	xor	r10d, r10d
	mov	r11, rdi
	xor	r14d, r14d
	cmp	r14, r8
	jae	LBB0_5
	jmp	LBB0_7
	.p2align	4, 0x90
LBB0_8:                                 ##   in Loop: Header=BB0_5 Depth=1
	inc	r10
	add	rdi, r9
	cmp	r10, rcx
	je	LBB0_9
## %bb.3:                               ##   in Loop: Header=BB0_5 Depth=1
	mov	r11, rdi
	xor	r14d, r14d
	cmp	r14, r8
	jb	LBB0_7
	.p2align	4, 0x90
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	inc	r14
	add	r11, 4
	cmp	r14, rdx
	jae	LBB0_8
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=1
	cmp	r14, r8
	jae	LBB0_5
LBB0_7:
	xor	ebx, ebx
	.p2align	4, 0x90
LBB0_4:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [r11 + 4*rbx]
	mov	dword ptr [rsi], eax
	add	rsi, 4
	add	rbx, rdx
	lea	rax, [r14 + rbx]
	cmp	rax, r8
	jb	LBB0_4
	jmp	LBB0_5
LBB0_9:
	pop	rbx
	pop	r14
	pop	rbp
	ret
                                        ## -- End function
	.globl	_transformz2            ## -- Begin function transformz2
	.p2align	4, 0x90
_transformz2:                           ## @transformz2
## %bb.0:
	push	rbp
	mov	rbp, rsp
	test	rcx, rcx
	je	LBB1_9
## %bb.1:
	test	rdx, rdx
	je	LBB1_9
## %bb.2:
	cmp	rdx, 1
	jne	LBB1_3
## %bb.10:
	cmp	rcx, 7
	jbe	LBB1_11
## %bb.19:
	lea	rax, [rdi + 4*rcx]
	cmp	rax, rsi
	jbe	LBB1_21
## %bb.20:
	lea	rax, [rsi + 4*rcx]
	cmp	rax, rdi
	jbe	LBB1_21
LBB1_11:
	xor	r8d, r8d
LBB1_12:
	mov	r9, r8
	not	r9
	add	r9, rcx
	mov	r10, rcx
	and	r10, 7
	je	LBB1_16
## %bb.13:
	neg	r10
	xor	edx, edx
	.p2align	4, 0x90
LBB1_14:                                ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rdi]
	add	rdi, 4
	mov	dword ptr [rsi], eax
	add	rsi, 4
	dec	rdx
	cmp	r10, rdx
	jne	LBB1_14
## %bb.15:
	sub	r8, rdx
LBB1_16:
	cmp	r9, 7
	jb	LBB1_9
## %bb.17:
	sub	rcx, r8
	xor	eax, eax
	.p2align	4, 0x90
LBB1_18:                                ## =>This Inner Loop Header: Depth=1
	mov	edx, dword ptr [rdi + 4*rax]
	mov	dword ptr [rsi + 4*rax], edx
	mov	edx, dword ptr [rdi + 4*rax + 4]
	mov	dword ptr [rsi + 4*rax + 4], edx
	mov	edx, dword ptr [rdi + 4*rax + 8]
	mov	dword ptr [rsi + 4*rax + 8], edx
	mov	edx, dword ptr [rdi + 4*rax + 12]
	mov	dword ptr [rsi + 4*rax + 12], edx
	mov	edx, dword ptr [rdi + 4*rax + 16]
	mov	dword ptr [rsi + 4*rax + 16], edx
	mov	edx, dword ptr [rdi + 4*rax + 20]
	mov	dword ptr [rsi + 4*rax + 20], edx
	mov	edx, dword ptr [rdi + 4*rax + 24]
	mov	dword ptr [rsi + 4*rax + 24], edx
	mov	edx, dword ptr [rdi + 4*rax + 28]
	mov	dword ptr [rsi + 4*rax + 28], edx
	add	rax, 8
	cmp	rcx, rax
	jne	LBB1_18
	jmp	LBB1_9
LBB1_3:
	lea	r8, [4*rdx]
	xor	r9d, r9d
	.p2align	4, 0x90
LBB1_4:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_5 Depth 2
                                        ##     Child Loop BB1_7 Depth 2
	xor	r10d, r10d
	xor	r11d, r11d
	.p2align	4, 0x90
LBB1_5:                                 ##   Parent Loop BB1_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	eax, dword ptr [rdi + 2*r11]
	mov	dword ptr [rsi + 4*r11], eax
	add	r11, 2
	add	r10, 4
	cmp	r11, rdx
	jb	LBB1_5
## %bb.6:                               ##   in Loop: Header=BB1_4 Depth=1
	add	rdi, r10
	mov	r11d, 1
	xor	r10d, r10d
	.p2align	4, 0x90
LBB1_7:                                 ##   Parent Loop BB1_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	eax, dword ptr [rdi + 2*r11 - 2]
	mov	dword ptr [rsi + 4*r11], eax
	add	r11, 2
	add	r10, 4
	cmp	r11, rdx
	jb	LBB1_7
## %bb.8:                               ##   in Loop: Header=BB1_4 Depth=1
	inc	r9
	add	rsi, r8
	add	rdi, r10
	cmp	r9, rcx
	jne	LBB1_4
LBB1_9:
	pop	rbp
	ret
LBB1_21:
	mov	r8, rcx
	and	r8, -8
	lea	rax, [r8 - 8]
	mov	rdx, rax
	shr	rdx, 3
	inc	rdx
	mov	r9d, edx
	and	r9d, 3
	cmp	rax, 24
	jae	LBB1_23
## %bb.22:
	xor	eax, eax
	test	r9, r9
	jne	LBB1_26
	jmp	LBB1_28
LBB1_23:
	sub	rdx, r9
	xor	eax, eax
	.p2align	4, 0x90
LBB1_24:                                ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rdi + 4*rax]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 16]
	movups	xmmword ptr [rsi + 4*rax], xmm0
	movups	xmmword ptr [rsi + 4*rax + 16], xmm1
	movups	xmm0, xmmword ptr [rdi + 4*rax + 32]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 48]
	movups	xmmword ptr [rsi + 4*rax + 32], xmm0
	movups	xmmword ptr [rsi + 4*rax + 48], xmm1
	movups	xmm0, xmmword ptr [rdi + 4*rax + 64]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 80]
	movups	xmmword ptr [rsi + 4*rax + 64], xmm0
	movups	xmmword ptr [rsi + 4*rax + 80], xmm1
	movups	xmm0, xmmword ptr [rdi + 4*rax + 96]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 112]
	movups	xmmword ptr [rsi + 4*rax + 96], xmm0
	movups	xmmword ptr [rsi + 4*rax + 112], xmm1
	add	rax, 32
	add	rdx, -4
	jne	LBB1_24
## %bb.25:
	test	r9, r9
	je	LBB1_28
LBB1_26:
	lea	rax, [4*rax + 16]
	neg	r9
	.p2align	4, 0x90
LBB1_27:                                ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rdi + rax - 16]
	movups	xmm1, xmmword ptr [rdi + rax]
	movups	xmmword ptr [rsi + rax - 16], xmm0
	movups	xmmword ptr [rsi + rax], xmm1
	add	rax, 32
	inc	r9
	jne	LBB1_27
LBB1_28:
	cmp	r8, rcx
	je	LBB1_9
## %bb.29:
	lea	rdi, [rdi + 4*r8]
	lea	rsi, [rsi + 4*r8]
	jmp	LBB1_12
                                        ## -- End function
	.globl	_transformz3            ## -- Begin function transformz3
	.p2align	4, 0x90
_transformz3:                           ## @transformz3
## %bb.0:
	push	rbp
	mov	rbp, rsp
	test	rcx, rcx
	je	LBB2_21
## %bb.1:
	test	rdx, rdx
	je	LBB2_21
## %bb.2:
	cmp	rdx, 1
	jne	LBB2_3
## %bb.12:
	cmp	rcx, 7
	jbe	LBB2_13
## %bb.22:
	lea	rax, [rdi + 4*rcx]
	cmp	rax, rsi
	jbe	LBB2_24
## %bb.23:
	lea	rax, [rsi + 4*rcx]
	cmp	rax, rdi
	jbe	LBB2_24
LBB2_13:
	xor	r8d, r8d
LBB2_14:
	mov	r9, r8
	not	r9
	add	r9, rcx
	mov	r10, rcx
	and	r10, 7
	je	LBB2_18
## %bb.15:
	neg	r10
	xor	edx, edx
	.p2align	4, 0x90
LBB2_16:                                ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rdi]
	add	rdi, 4
	mov	dword ptr [rsi], eax
	add	rsi, 4
	dec	rdx
	cmp	r10, rdx
	jne	LBB2_16
## %bb.17:
	sub	r8, rdx
LBB2_18:
	cmp	r9, 7
	jb	LBB2_21
## %bb.19:
	sub	rcx, r8
	xor	eax, eax
	.p2align	4, 0x90
LBB2_20:                                ## =>This Inner Loop Header: Depth=1
	mov	edx, dword ptr [rdi + 4*rax]
	mov	dword ptr [rsi + 4*rax], edx
	mov	edx, dword ptr [rdi + 4*rax + 4]
	mov	dword ptr [rsi + 4*rax + 4], edx
	mov	edx, dword ptr [rdi + 4*rax + 8]
	mov	dword ptr [rsi + 4*rax + 8], edx
	mov	edx, dword ptr [rdi + 4*rax + 12]
	mov	dword ptr [rsi + 4*rax + 12], edx
	mov	edx, dword ptr [rdi + 4*rax + 16]
	mov	dword ptr [rsi + 4*rax + 16], edx
	mov	edx, dword ptr [rdi + 4*rax + 20]
	mov	dword ptr [rsi + 4*rax + 20], edx
	mov	edx, dword ptr [rdi + 4*rax + 24]
	mov	dword ptr [rsi + 4*rax + 24], edx
	mov	edx, dword ptr [rdi + 4*rax + 28]
	mov	dword ptr [rsi + 4*rax + 28], edx
	add	rax, 8
	cmp	rcx, rax
	jne	LBB2_20
	jmp	LBB2_21
LBB2_3:
	lea	r8, [4*rdx]
	xor	r9d, r9d
	jmp	LBB2_4
	.p2align	4, 0x90
LBB2_11:                                ##   in Loop: Header=BB2_4 Depth=1
	inc	r9
	add	rsi, r8
	cmp	r9, rcx
	je	LBB2_21
LBB2_4:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_5 Depth 2
                                        ##     Child Loop BB2_7 Depth 2
                                        ##     Child Loop BB2_10 Depth 2
	xor	eax, eax
	.p2align	4, 0x90
LBB2_5:                                 ##   Parent Loop BB2_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	r10d, dword ptr [rdi]
	add	rdi, 4
	mov	dword ptr [rsi + 4*rax], r10d
	add	rax, 3
	cmp	rax, rdx
	jb	LBB2_5
## %bb.6:                               ##   in Loop: Header=BB2_4 Depth=1
	mov	eax, 1
	.p2align	4, 0x90
LBB2_7:                                 ##   Parent Loop BB2_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	r10d, dword ptr [rdi]
	add	rdi, 4
	mov	dword ptr [rsi + 4*rax], r10d
	add	rax, 3
	cmp	rax, rdx
	jb	LBB2_7
## %bb.8:                               ##   in Loop: Header=BB2_4 Depth=1
	cmp	rdx, 3
	jb	LBB2_11
## %bb.9:                               ##   in Loop: Header=BB2_4 Depth=1
	mov	eax, 2
	.p2align	4, 0x90
LBB2_10:                                ##   Parent Loop BB2_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	r10d, dword ptr [rdi]
	add	rdi, 4
	mov	dword ptr [rsi + 4*rax], r10d
	add	rax, 3
	cmp	rax, rdx
	jb	LBB2_10
	jmp	LBB2_11
LBB2_24:
	mov	r8, rcx
	and	r8, -8
	lea	rax, [r8 - 8]
	mov	rdx, rax
	shr	rdx, 3
	inc	rdx
	mov	r9d, edx
	and	r9d, 3
	cmp	rax, 24
	jae	LBB2_26
## %bb.25:
	xor	eax, eax
	test	r9, r9
	jne	LBB2_29
	jmp	LBB2_31
LBB2_26:
	sub	rdx, r9
	xor	eax, eax
	.p2align	4, 0x90
LBB2_27:                                ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rdi + 4*rax]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 16]
	movups	xmmword ptr [rsi + 4*rax], xmm0
	movups	xmmword ptr [rsi + 4*rax + 16], xmm1
	movups	xmm0, xmmword ptr [rdi + 4*rax + 32]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 48]
	movups	xmmword ptr [rsi + 4*rax + 32], xmm0
	movups	xmmword ptr [rsi + 4*rax + 48], xmm1
	movups	xmm0, xmmword ptr [rdi + 4*rax + 64]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 80]
	movups	xmmword ptr [rsi + 4*rax + 64], xmm0
	movups	xmmword ptr [rsi + 4*rax + 80], xmm1
	movups	xmm0, xmmword ptr [rdi + 4*rax + 96]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 112]
	movups	xmmword ptr [rsi + 4*rax + 96], xmm0
	movups	xmmword ptr [rsi + 4*rax + 112], xmm1
	add	rax, 32
	add	rdx, -4
	jne	LBB2_27
## %bb.28:
	test	r9, r9
	je	LBB2_31
LBB2_29:
	lea	rax, [4*rax + 16]
	neg	r9
	.p2align	4, 0x90
LBB2_30:                                ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rdi + rax - 16]
	movups	xmm1, xmmword ptr [rdi + rax]
	movups	xmmword ptr [rsi + rax - 16], xmm0
	movups	xmmword ptr [rsi + rax], xmm1
	add	rax, 32
	inc	r9
	jne	LBB2_30
LBB2_31:
	cmp	r8, rcx
	jne	LBB2_32
LBB2_21:
	pop	rbp
	ret
LBB2_32:
	lea	rdi, [rdi + 4*r8]
	lea	rsi, [rsi + 4*r8]
	jmp	LBB2_14
                                        ## -- End function
	.globl	_transformz5            ## -- Begin function transformz5
	.p2align	4, 0x90
_transformz5:                           ## @transformz5
## %bb.0:
	push	rbp
	mov	rbp, rsp
	test	rcx, rcx
	je	LBB3_27
## %bb.1:
	test	rdx, rdx
	je	LBB3_27
## %bb.2:
	cmp	rdx, 1
	jne	LBB3_3
## %bb.18:
	cmp	rcx, 7
	jbe	LBB3_19
## %bb.28:
	lea	rax, [rdi + 4*rcx]
	cmp	rax, rsi
	jbe	LBB3_30
## %bb.29:
	lea	rax, [rsi + 4*rcx]
	cmp	rax, rdi
	jbe	LBB3_30
LBB3_19:
	xor	r8d, r8d
LBB3_20:
	mov	r9, r8
	not	r9
	add	r9, rcx
	mov	r10, rcx
	and	r10, 7
	je	LBB3_24
## %bb.21:
	neg	r10
	xor	edx, edx
	.p2align	4, 0x90
LBB3_22:                                ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rdi]
	add	rdi, 4
	mov	dword ptr [rsi], eax
	add	rsi, 4
	dec	rdx
	cmp	r10, rdx
	jne	LBB3_22
## %bb.23:
	sub	r8, rdx
LBB3_24:
	cmp	r9, 7
	jb	LBB3_27
## %bb.25:
	sub	rcx, r8
	xor	eax, eax
	.p2align	4, 0x90
LBB3_26:                                ## =>This Inner Loop Header: Depth=1
	mov	edx, dword ptr [rdi + 4*rax]
	mov	dword ptr [rsi + 4*rax], edx
	mov	edx, dword ptr [rdi + 4*rax + 4]
	mov	dword ptr [rsi + 4*rax + 4], edx
	mov	edx, dword ptr [rdi + 4*rax + 8]
	mov	dword ptr [rsi + 4*rax + 8], edx
	mov	edx, dword ptr [rdi + 4*rax + 12]
	mov	dword ptr [rsi + 4*rax + 12], edx
	mov	edx, dword ptr [rdi + 4*rax + 16]
	mov	dword ptr [rsi + 4*rax + 16], edx
	mov	edx, dword ptr [rdi + 4*rax + 20]
	mov	dword ptr [rsi + 4*rax + 20], edx
	mov	edx, dword ptr [rdi + 4*rax + 24]
	mov	dword ptr [rsi + 4*rax + 24], edx
	mov	edx, dword ptr [rdi + 4*rax + 28]
	mov	dword ptr [rsi + 4*rax + 28], edx
	add	rax, 8
	cmp	rcx, rax
	jne	LBB3_26
	jmp	LBB3_27
LBB3_3:
	lea	r8, [4*rdx]
	xor	r9d, r9d
	jmp	LBB3_4
	.p2align	4, 0x90
LBB3_17:                                ##   in Loop: Header=BB3_4 Depth=1
	inc	r9
	add	rsi, r8
	cmp	r9, rcx
	je	LBB3_27
LBB3_4:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_5 Depth 2
                                        ##     Child Loop BB3_7 Depth 2
                                        ##     Child Loop BB3_10 Depth 2
                                        ##     Child Loop BB3_13 Depth 2
                                        ##     Child Loop BB3_16 Depth 2
	xor	eax, eax
	.p2align	4, 0x90
LBB3_5:                                 ##   Parent Loop BB3_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	r10d, dword ptr [rdi]
	add	rdi, 4
	mov	dword ptr [rsi + 4*rax], r10d
	add	rax, 5
	cmp	rax, rdx
	jb	LBB3_5
## %bb.6:                               ##   in Loop: Header=BB3_4 Depth=1
	mov	eax, 1
	.p2align	4, 0x90
LBB3_7:                                 ##   Parent Loop BB3_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	r10d, dword ptr [rdi]
	add	rdi, 4
	mov	dword ptr [rsi + 4*rax], r10d
	add	rax, 5
	cmp	rax, rdx
	jb	LBB3_7
## %bb.8:                               ##   in Loop: Header=BB3_4 Depth=1
	cmp	rdx, 3
	jb	LBB3_17
## %bb.9:                               ##   in Loop: Header=BB3_4 Depth=1
	mov	eax, 2
	.p2align	4, 0x90
LBB3_10:                                ##   Parent Loop BB3_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	r10d, dword ptr [rdi]
	add	rdi, 4
	mov	dword ptr [rsi + 4*rax], r10d
	add	rax, 5
	cmp	rax, rdx
	jb	LBB3_10
## %bb.11:                              ##   in Loop: Header=BB3_4 Depth=1
	cmp	rdx, 4
	jb	LBB3_17
## %bb.12:                              ##   in Loop: Header=BB3_4 Depth=1
	mov	eax, 3
	.p2align	4, 0x90
LBB3_13:                                ##   Parent Loop BB3_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	r10d, dword ptr [rdi]
	add	rdi, 4
	mov	dword ptr [rsi + 4*rax], r10d
	add	rax, 5
	cmp	rax, rdx
	jb	LBB3_13
## %bb.14:                              ##   in Loop: Header=BB3_4 Depth=1
	cmp	rdx, 5
	jb	LBB3_17
## %bb.15:                              ##   in Loop: Header=BB3_4 Depth=1
	mov	eax, 4
	.p2align	4, 0x90
LBB3_16:                                ##   Parent Loop BB3_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	r10d, dword ptr [rdi]
	add	rdi, 4
	mov	dword ptr [rsi + 4*rax], r10d
	add	rax, 5
	cmp	rax, rdx
	jb	LBB3_16
	jmp	LBB3_17
LBB3_30:
	mov	r8, rcx
	and	r8, -8
	lea	rax, [r8 - 8]
	mov	rdx, rax
	shr	rdx, 3
	inc	rdx
	mov	r9d, edx
	and	r9d, 3
	cmp	rax, 24
	jae	LBB3_32
## %bb.31:
	xor	eax, eax
	test	r9, r9
	jne	LBB3_35
	jmp	LBB3_37
LBB3_32:
	sub	rdx, r9
	xor	eax, eax
	.p2align	4, 0x90
LBB3_33:                                ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rdi + 4*rax]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 16]
	movups	xmmword ptr [rsi + 4*rax], xmm0
	movups	xmmword ptr [rsi + 4*rax + 16], xmm1
	movups	xmm0, xmmword ptr [rdi + 4*rax + 32]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 48]
	movups	xmmword ptr [rsi + 4*rax + 32], xmm0
	movups	xmmword ptr [rsi + 4*rax + 48], xmm1
	movups	xmm0, xmmword ptr [rdi + 4*rax + 64]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 80]
	movups	xmmword ptr [rsi + 4*rax + 64], xmm0
	movups	xmmword ptr [rsi + 4*rax + 80], xmm1
	movups	xmm0, xmmword ptr [rdi + 4*rax + 96]
	movups	xmm1, xmmword ptr [rdi + 4*rax + 112]
	movups	xmmword ptr [rsi + 4*rax + 96], xmm0
	movups	xmmword ptr [rsi + 4*rax + 112], xmm1
	add	rax, 32
	add	rdx, -4
	jne	LBB3_33
## %bb.34:
	test	r9, r9
	je	LBB3_37
LBB3_35:
	lea	rax, [4*rax + 16]
	neg	r9
	.p2align	4, 0x90
LBB3_36:                                ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rdi + rax - 16]
	movups	xmm1, xmmword ptr [rdi + rax]
	movups	xmmword ptr [rsi + rax - 16], xmm0
	movups	xmmword ptr [rsi + rax], xmm1
	add	rax, 32
	inc	r9
	jne	LBB3_36
LBB3_37:
	cmp	r8, rcx
	jne	LBB3_38
LBB3_27:
	pop	rbp
	ret
LBB3_38:
	lea	rdi, [rdi + 4*r8]
	lea	rsi, [rsi + 4*r8]
	jmp	LBB3_20
                                        ## -- End function

.subsections_via_symbols
