	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	_matrixTransformG2      ## -- Begin function matrixTransformG2
	.p2align	4, 0x90
_matrixTransformG2:                     ## @matrixTransformG2
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	eax, 60
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	mov	ecx, dword ptr [rdi + rax - 60]
	mov	dword ptr [rsi + rax - 60], ecx
	mov	ecx, dword ptr [rdi + rax - 28]
	mov	dword ptr [rsi + rax - 56], ecx
	mov	ecx, dword ptr [rdi + rax - 56]
	mov	dword ptr [rsi + rax - 52], ecx
	mov	ecx, dword ptr [rdi + rax - 24]
	mov	dword ptr [rsi + rax - 48], ecx
	mov	ecx, dword ptr [rdi + rax - 52]
	mov	dword ptr [rsi + rax - 44], ecx
	mov	ecx, dword ptr [rdi + rax - 20]
	mov	dword ptr [rsi + rax - 40], ecx
	mov	ecx, dword ptr [rdi + rax - 48]
	mov	dword ptr [rsi + rax - 36], ecx
	mov	ecx, dword ptr [rdi + rax - 16]
	mov	dword ptr [rsi + rax - 32], ecx
	mov	ecx, dword ptr [rdi + rax - 44]
	mov	dword ptr [rsi + rax - 28], ecx
	mov	ecx, dword ptr [rdi + rax - 12]
	mov	dword ptr [rsi + rax - 24], ecx
	mov	ecx, dword ptr [rdi + rax - 40]
	mov	dword ptr [rsi + rax - 20], ecx
	mov	ecx, dword ptr [rdi + rax - 8]
	mov	dword ptr [rsi + rax - 16], ecx
	mov	ecx, dword ptr [rdi + rax - 36]
	mov	dword ptr [rsi + rax - 12], ecx
	mov	ecx, dword ptr [rdi + rax - 4]
	mov	dword ptr [rsi + rax - 8], ecx
	mov	ecx, dword ptr [rdi + rax - 32]
	mov	dword ptr [rsi + rax - 4], ecx
	mov	ecx, dword ptr [rdi + rax]
	mov	dword ptr [rsi + rax], ecx
	add	rax, 64
	cmp	rax, 1020
	jne	LBB0_1
## %bb.2:
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
