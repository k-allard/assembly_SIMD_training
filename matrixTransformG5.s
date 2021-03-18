	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	__Z17matrixTransformG5PiS_mm ## -- Begin function _Z17matrixTransformG5PiS_mm
	.p2align	4, 0x90
__Z17matrixTransformG5PiS_mm:           ## @_Z17matrixTransformG5PiS_mm
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	mov	rax, rdx
	mov	rbx, rdi
	movabs	rdx, -3689348814741910323
	mov	rdi, rax
	mov	qword ptr [rbp - 48], rax ## 8-byte Spill
	mul	rdx
	mov	qword ptr [rbp - 64], rcx ## 8-byte Spill
	test	rcx, rcx
	je	LBB0_6
## %bb.1:
	shr	rdx, 2
	test	edx, edx
	jle	LBB0_6
## %bb.2:
	movsxd	r10, edx
	mov	rax, qword ptr [rbp - 48] ## 8-byte Reload
	lea	rax, [4*rax]
	mov	qword ptr [rbp - 56], rax ## 8-byte Spill
	lea	r11, [4*r10]
	movsxd	r15, edx
	lea	rax, [4*r15]
	lea	r12, [rax + 2*rax]
	lea	r13, [r10 + r10]
	xor	edi, edi
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_4 Depth 2
	mov	r14, rdi
	imul	r14, qword ptr [rbp - 48] ## 8-byte Folded Reload
	mov	qword ptr [rbp - 72], rbx ## 8-byte Spill
	mov	rax, rbx
	xor	ebx, ebx
	xor	r8d, r8d
	.p2align	4, 0x90
LBB0_4:                                 ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	ecx, ebx
	add	rcx, r14
	mov	r9d, dword ptr [rax]
	mov	dword ptr [rsi + 4*rcx], r9d
	mov	edx, dword ptr [rax + 4*r15]
	mov	dword ptr [rsi + 4*rcx + 4], edx
	mov	edx, dword ptr [rax + 4*r13]
	mov	dword ptr [rsi + 4*rcx + 8], edx
	mov	edx, dword ptr [rax + r12]
	mov	dword ptr [rsi + 4*rcx + 12], edx
	mov	edx, dword ptr [rax + 4*r11]
	mov	dword ptr [rsi + 4*rcx + 16], edx
	inc	r8
	add	rbx, 5
	add	rax, 4
	cmp	r8, r10
	jl	LBB0_4
## %bb.5:                               ##   in Loop: Header=BB0_3 Depth=1
	inc	rdi
	mov	rbx, qword ptr [rbp - 72] ## 8-byte Reload
	add	rbx, qword ptr [rbp - 56] ## 8-byte Folded Reload
	cmp	rdi, qword ptr [rbp - 64] ## 8-byte Folded Reload
	jne	LBB0_3
LBB0_6:
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
                                        ## -- End function

.subsections_via_symbols
