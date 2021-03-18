	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	_transformz2            ## -- Begin function transformz2
	.p2align	4, 0x90
_transformz2:                           ## @transformz2
## %bb.0:
	push	rbp
	mov	rbp, rsp
	xor	eax, eax
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
                                        ##     Child Loop BB0_4 Depth 2
	xor	ecx, ecx
	.p2align	4, 0x90
LBB0_2:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	edx, dword ptr [rdi]
	mov	dword ptr [rsi + 4*rcx], edx
	mov	edx, dword ptr [rdi + 4]
	mov	dword ptr [rsi + 4*rcx + 8], edx
	mov	edx, dword ptr [rdi + 8]
	mov	dword ptr [rsi + 4*rcx + 16], edx
	mov	edx, dword ptr [rdi + 12]
	mov	dword ptr [rsi + 4*rcx + 24], edx
	mov	edx, dword ptr [rdi + 16]
	mov	dword ptr [rsi + 4*rcx + 32], edx
	mov	edx, dword ptr [rdi + 20]
	add	rdi, 24
	mov	dword ptr [rsi + 4*rcx + 40], edx
	add	rcx, 12
	cmp	rcx, 240
	jb	LBB0_2
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	mov	ecx, 1
	.p2align	4, 0x90
LBB0_4:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	edx, dword ptr [rdi]
	mov	dword ptr [rsi + 4*rcx], edx
	mov	edx, dword ptr [rdi + 4]
	mov	dword ptr [rsi + 4*rcx + 8], edx
	mov	edx, dword ptr [rdi + 8]
	mov	dword ptr [rsi + 4*rcx + 16], edx
	mov	edx, dword ptr [rdi + 12]
	mov	dword ptr [rsi + 4*rcx + 24], edx
	mov	edx, dword ptr [rdi + 16]
	mov	dword ptr [rsi + 4*rcx + 32], edx
	mov	edx, dword ptr [rdi + 20]
	add	rdi, 24
	mov	dword ptr [rsi + 4*rcx + 40], edx
	add	rcx, 12
	cmp	rcx, 240
	jb	LBB0_4
## %bb.5:                               ##   in Loop: Header=BB0_1 Depth=1
	inc	rax
	add	rsi, 960
	cmp	rax, 180
	jne	LBB0_1
## %bb.6:
	pop	rbp
	ret
                                        ## -- End function

.subsections_via_symbols
