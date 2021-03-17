	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	__Z20matrixTransformG3AsmPiS_ ## -- Begin function _Z17matrixTransformG3PiS_
	.p2align	4, 0x90
__Z20matrixTransformG3AsmPiS_:             ## @_Z17matrixTransformG3PiS_
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	add	rsi, 8
	add	rdi, 640
	xor	r8d, r8d
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
	mov	rcx, -80
	mov	rdx, rsi
	.p2align	4, 0x90
LBB0_2:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	eax, dword ptr [rdi + 4*rcx - 320]
	mov	dword ptr [rdx - 8], eax
	mov	eax, dword ptr [rdi + 4*rcx]
	mov	dword ptr [rdx - 4], eax
	mov	eax, dword ptr [rdi + 4*rcx + 320]
	mov	dword ptr [rdx], eax
	add	rdx, 12
	inc	rcx
	jne	LBB0_2
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	inc	r8
	add	rsi, 960
	add	rdi, 960
	cmp	r8, 180
	jne	LBB0_1
## %bb.4:
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
