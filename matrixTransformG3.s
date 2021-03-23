	.section	__TEXT,__text,regular,pure_instructions
#	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	__Z17matrixTransformG3PiS_mm ## -- Begin function _Z17matrixTransformG3PiS_mm
	.p2align	4, 0x90
__Z17matrixTransformG3PiS_mm:           ## @_Z17matrixTransformG3PiS_mm
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	mov	rax, rdx
	mov	qword ptr [rbp - 56], rdi ## 8-byte Spill
	movabs	rdx, -6148914691236517205
	mov	rdi, rax
	mov	qword ptr [rbp - 64], rax ## 8-byte Spill
	mul	rdx
	mov	qword ptr [rbp - 120], rcx ## 8-byte Spill
	test	rcx, rcx
	je	LBB0_18
## %bb.1:
	shr	rdx
	test	edx, edx
	jle	LBB0_18
## %bb.2:
	movsxd	r10, edx
	lea	r9, [r10 - 1]
	lea	rax, [r10 + r10]
	mov	qword ptr [rbp - 88], rax ## 8-byte Spill
	lea	rax, [r10 + 2*r10]
	mov	qword ptr [rbp - 80], rax ## 8-byte Spill
	mov	ecx, 3
	mov	eax, r9d
	mul	ecx
	seto	al
	mov	rcx, r9
	shr	rcx, 32
	setne	r12b
	or	r12b, al
	mov	ecx, 12
	mov	rax, r9
	mul	rcx
	mov	qword ptr [rbp - 104], rax ## 8-byte Spill
	seto	byte ptr [rbp - 43]     ## 1-byte Folded Spill
	mov	rax, r10
	and	rax, -4
	mov	qword ptr [rbp - 72], rax ## 8-byte Spill
	mov	rdi, qword ptr [rbp - 56] ## 8-byte Reload
	lea	r9, [rdi + 8*r10]
	mov	rax, qword ptr [rbp - 64] ## 8-byte Reload
	lea	rax, [4*rax]
	mov	qword ptr [rbp - 112], rax ## 8-byte Spill
	lea	rbx, [rdi + 4*r10]
	xor	r15d, r15d
	mov	byte ptr [rbp - 41], r12b ## 1-byte Spill
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_13 Depth 2
                                        ##     Child Loop BB0_16 Depth 2
	mov	r11, r15
	imul	r11, qword ptr [rbp - 64] ## 8-byte Folded Reload
	cmp	r10, 4
	jae	LBB0_5
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=1
	xor	r13d, r13d
	jmp	LBB0_15
	.p2align	4, 0x90
LBB0_5:                                 ##   in Loop: Header=BB0_3 Depth=1
	lea	r8, [rsi + 4*r11]
	lea	rcx, [rsi + 4*r11 + 4]
	not	rcx
	mov	rax, qword ptr [rbp - 104] ## 8-byte Reload
	cmp	rax, rcx
	seta	dl
	lea	rcx, [rsi + 4*r11 + 8]
	mov	r14b, byte ptr [rbp - 43] ## 1-byte Reload
	or	dl, r14b
	or	dl, r12b
	not	rcx
	cmp	rax, rcx
	seta	r12b
	mov	rcx, r8
	not	rcx
	cmp	rax, rcx
	seta	r13b
	test	dl, dl
	jne	LBB0_6
## %bb.7:                               ##   in Loop: Header=BB0_3 Depth=1
	or	r12b, r14b
	jne	LBB0_6
## %bb.8:                               ##   in Loop: Header=BB0_3 Depth=1
	or	r13b, r14b
	mov	r13d, 0
	mov	r12b, byte ptr [rbp - 41] ## 1-byte Reload
	jne	LBB0_15
## %bb.9:                               ##   in Loop: Header=BB0_3 Depth=1
	mov	rax, qword ptr [rbp - 88] ## 8-byte Reload
	lea	rcx, [r11 + rax]
	mov	rax, qword ptr [rbp - 80] ## 8-byte Reload
	lea	rdx, [rax + r11]
	lea	rax, [r10 + r11]
	mov	r14, qword ptr [rbp - 56] ## 8-byte Reload
	lea	rcx, [r14 + 4*rcx]
	lea	r12, [r14 + 4*rdx]
	lea	r13, [rsi + 4*rdx]
	lea	rax, [r14 + 4*rax]
	lea	rdx, [r14 + 4*r11]
	mov	qword ptr [rbp - 96], rdx ## 8-byte Spill
	cmp	rcx, r13
	setb	r14b
	cmp	r8, r12
	setb	r12b
	cmp	rax, r13
	setb	dl
	cmp	r8, rcx
	setb	byte ptr [rbp - 42]     ## 1-byte Folded Spill
	cmp	qword ptr [rbp - 96], r13 ## 8-byte Folded Reload
	setb	cl
	cmp	r8, rax
	setb	r8b
	test	r14b, r12b
	jne	LBB0_6
## %bb.10:                              ##   in Loop: Header=BB0_3 Depth=1
	and	dl, byte ptr [rbp - 42] ## 1-byte Folded Reload
	jne	LBB0_6
## %bb.11:                              ##   in Loop: Header=BB0_3 Depth=1
	mov	r13d, 0
	and	cl, r8b
	mov	r12b, byte ptr [rbp - 41] ## 1-byte Reload
	jne	LBB0_15
## %bb.12:                              ##   in Loop: Header=BB0_3 Depth=1
	xor	ecx, ecx
	xor	edx, edx
	mov	r8, qword ptr [rbp - 72] ## 8-byte Reload
	.p2align	4, 0x90
LBB0_13:                                ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	eax, ecx
	and	eax, -4
	add	rax, r11
	movups	xmm0, xmmword ptr [rdi + 4*rdx]
	movups	xmm1, xmmword ptr [rbx + 4*rdx]
	movups	xmm2, xmmword ptr [r9 + 4*rdx]
	movaps	xmm3, xmm2
	shufps	xmm3, xmm0, 16          ## xmm3 = xmm3[0,0],xmm0[1,0]
	movaps	xmm4, xmm0
	unpcklps	xmm4, xmm1      ## xmm4 = xmm4[0],xmm1[0],xmm4[1],xmm1[1]
	shufps	xmm4, xmm3, 132         ## xmm4 = xmm4[0,1],xmm3[0,2]
	movaps	xmm3, xmm0
	shufps	xmm3, xmm1, 98          ## xmm3 = xmm3[2,0],xmm1[2,1]
	movaps	xmm5, xmm2
	shufps	xmm5, xmm1, 17          ## xmm5 = xmm5[1,0],xmm1[1,0]
	shufps	xmm5, xmm3, 130         ## xmm5 = xmm5[2,0],xmm3[0,2]
	shufps	xmm1, xmm2, 187         ## xmm1 = xmm1[3,2],xmm2[3,2]
	unpckhps	xmm2, xmm0      ## xmm2 = xmm2[2],xmm0[2],xmm2[3],xmm0[3]
	shufps	xmm2, xmm1, 140         ## xmm2 = xmm2[0,3],xmm1[0,2]
	movups	xmmword ptr [rsi + 4*rax + 32], xmm2
	movups	xmmword ptr [rsi + 4*rax + 16], xmm5
	movups	xmmword ptr [rsi + 4*rax], xmm4
	add	rdx, 4
	add	rcx, 12
	cmp	r8, rdx
	jne	LBB0_13
## %bb.14:                              ##   in Loop: Header=BB0_3 Depth=1
	mov	r13, r8
	cmp	r10, r8
	jne	LBB0_15
	jmp	LBB0_17
LBB0_6:                                 ##   in Loop: Header=BB0_3 Depth=1
	xor	r13d, r13d
	mov	r12b, byte ptr [rbp - 41] ## 1-byte Reload
	.p2align	4, 0x90
LBB0_15:                                ##   in Loop: Header=BB0_3 Depth=1
	lea	rcx, [r13 + 2*r13]
	.p2align	4, 0x90
LBB0_16:                                ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	eax, ecx
	add	rax, r11
	mov	edx, dword ptr [rdi + 4*r13]
	mov	dword ptr [rsi + 4*rax], edx
	mov	edx, dword ptr [rbx + 4*r13]
	mov	dword ptr [rsi + 4*rax + 4], edx
	mov	edx, dword ptr [r9 + 4*r13]
	mov	dword ptr [rsi + 4*rax + 8], edx
	inc	r13
	add	rcx, 3
	cmp	r13, r10
	jl	LBB0_16
LBB0_17:                                ##   in Loop: Header=BB0_3 Depth=1
	inc	r15
	mov	rax, qword ptr [rbp - 112] ## 8-byte Reload
	add	r9, rax
	add	rbx, rax
	add	rdi, rax
	cmp	r15, qword ptr [rbp - 120] ## 8-byte Folded Reload
	jne	LBB0_3
LBB0_18:
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
                                        ## -- End function

# .subsections_via_symbols
