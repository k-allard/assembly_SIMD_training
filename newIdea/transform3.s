	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	_transform3             ## -- Begin function transform3
	.p2align	4, 0x90
_transform3:                            ## @transform3
## %bb.0:
	push	rbp
	mov	rbp, rsp
	xor	eax, eax
	jmp	LBB0_1
	.p2align	4, 0x90
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	inc	rax
	add	rdi, 960
	cmp	rax, 180
	je	LBB0_5
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	mov	ecx, 80
	mov	edx, dword ptr [rdi + 4*rcx - 320]
	mov	dword ptr [rsi], edx
	cmp	rcx, 240
	jb	LBB0_6
	.p2align	4, 0x90
LBB0_3:                                 ##   in Loop: Header=BB0_1 Depth=1
	add	rsi, 4
	inc	rcx
	cmp	rcx, 160
	je	LBB0_4
LBB0_2:                                 ##   in Loop: Header=BB0_1 Depth=1
	mov	edx, dword ptr [rdi + 4*rcx - 320]
	mov	dword ptr [rsi], edx
	cmp	rcx, 240
	jae	LBB0_3
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	mov	edx, dword ptr [rdi + 4*rcx]
	mov	dword ptr [rsi + 4], edx
	lea	rdx, [rcx + 80]
	cmp	rdx, 239
	ja	LBB0_7
## %bb.8:                               ##   in Loop: Header=BB0_1 Depth=1
	mov	edx, dword ptr [rdi + 4*rcx + 320]
	mov	dword ptr [rsi + 8], edx
	add	rsi, 12
	inc	rcx
	cmp	rcx, 160
	jne	LBB0_2
	jmp	LBB0_4
	.p2align	4, 0x90
LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
	add	rsi, 8
	inc	rcx
	cmp	rcx, 160
	jne	LBB0_2
	jmp	LBB0_4
LBB0_5:
	pop	rbp
	ret
                                        ## -- End function

.subsections_via_symbols
