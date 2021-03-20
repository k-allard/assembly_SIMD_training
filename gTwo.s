	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	__Z20matrixTransformG2AsmPiS_ ## -- Begin function _Z17matrixTransformG2PiS_
	.p2align	4, 0x90
__Z20matrixTransformG2AsmPiS_:             ## @_Z17matrixTransformG2PiS_
	.cfi_startproc
/*
#define L 240
#define Q 180
#define G 2

void	matrixTransformG2(int matrix[], int matrixNew[])
{					
	int blockLength = L / 2; 					
 	int index;
 
 	for (int q = 0; q < Q; q++) {					
 		for (int i = 0; i < blockLength; i++) { 	
			for (int g = 0; g < 2; g++) {
				matrixNew[q * L + 2 * i + g] = matrix [q * L + i + g * blockLength];
 			}
 		}
    }
}

void	matrixTransformG2(int matrix[], int matrixNew[])
{					
	int blockLength = 240 / 2; 					
 	int index;
 
 	for (int q = 0; q < 180; q++) {					
 		for (int i = 0; i < 120; i++) { 	
			for (int g = 0; g < 2; g++) {
				matrixNew[q * 240 + 2 * i + g] = matrix [q * 240 + i + g * 120];
 			}
 		}
    }
}

*/
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	# %rdi, %rsi, %rdx, %rcx, %r8, %r9,
	xor	r8d, r8d			# int q = 0
	mov	r11, rsi			# r11 = rsi = matrixNew (2-st argument)
	mov	rdx, rdi			# rdx = rdi = matrix (1-st argument)
	jmp	LBB0_1
	.p2align	4, 0x90


LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
					# for (int q = 0; q < 180; q++, matrix += 4*L, matrixNew += 4*L) {
	inc	r8			# q++
	add	rdx, 960	# matrix = matrix + 960 = matrix + 4 * L
	add	r11, 960	# matrixNew = matrixNew + 960 = matrixNew + 4 * L
	cmp	r8, 180		
	je	LBB0_8		# if (q == 180) goto END
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_4 Depth 2
                                        ##     Child Loop BB0_6 Depth 2
	imul	r10, r8, 960		# r10 = r8 * 960 = q * 960 =  q * L * 4
	lea	r9, [rdi + r10 + 960]	# r9 	= matrix 	+ r10 + 960 = matrix 	+ (q + 1) * L * 4
	lea	rax, [rsi + r10]		# rax 	= matrixNew + r10		= matrixNew	+ q * L * 4
	cmp	rax, r9					
	jae	LBB0_3					# if(matrix 	+ (q + 1) * L * 4 >= matrixNew 	+ q * L * 4) GOTO LBB0_3
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	lea	r9, [rdi + r10]			# r9 	= matrix 	+ r10 		= matrix 	+ q * L * 4
	lea	rax, [rsi + r10 + 960]	# rax 	= matrixNew + r10 + 960	= matrixNew	+ (q+1) * L * 4
	cmp	r9, rax
	jae	LBB0_3					# if(matrix 	+ q * L * 4 >= matrixNew 	+ (q + 1) * L * 4) GOTO LBB0_3
## %bb.5:                               ##   in Loop: Header=BB0_1 Depth=1
								# for (int i = 0; i < 120; i += 2) {
								#	matrixNew[2*i] = matrix[i]
								#	matrixNew[2*i+1] = matrix[i + L / 2]
								#	matrixNew[2*i+2] = matrix[i + 1]
								#	matrixNew[2*i+3] = matrix[i + L / 2 + 1]
								# }
								#
	xor	eax, eax				# int i = 0
	.p2align	4, 0x90
LBB0_6:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	ecx, dword ptr [rdx + 4*rax]		# ecx = matrix[i]
	mov	dword ptr [r11 + 8*rax], ecx		# matrixNew[2*i] = ecx = matrix[i]
	mov	ecx, dword ptr [rdx + 4*rax + 480]	# ecx = matrix[i + L / 2]
	mov	dword ptr [r11 + 8*rax + 4], ecx	# matrixNew[2*i+1] = matrix[i + L / 2]
	mov	ecx, dword ptr [rdx + 4*rax + 4]	# ecx = matrix[i + 1]
	mov	dword ptr [r11 + 8*rax + 8], ecx	# matrixNew[2*i+2] = matrix[i + 1]
	mov	ecx, dword ptr [rdx + 4*rax + 484]	# ecx = matrix[i + L / 2 + 1]
	mov	dword ptr [r11 + 8*rax + 12], ecx	# matrixNew[2*i+3] = matrix[i + L / 2 + 1]
	add	rax, 2								# i+=2
	cmp	rax, 120							
	jne	LBB0_6
	jmp	LBB0_7
	.p2align	4, 0x90
LBB0_3:                                 ##   in Loop: Header=BB0_1 Depth=1
									# for(int i = 4; i < 124; i+=8)
									{
										__m128 x0 = (__m128*)(matrix + 4*i - 4*4)[0]
										__m128 x1 = (__m128*)(matrix + 4*i + L*2 - 4*4)[0]
										__m128 x2 = x0
										x2 = _mm_unpacklo_ps (x2, x1)
										x0 = _mm_unpackhi_ps(x0, x1)
										(__m128*)(matrixNew + 8*i - 16)[0] = x0 
										(__m128*)(matrixNew + 8*i - 32)[0] = x2
										
										x0 = (__m128*)(matrix + 4*i)[0]
										x1 = (__m128*)(matrix + 4*i + L*2)[0]
										x2 = x0
										x2 = _mm_unpacklo_ps (x2, x1)
										x0 = _mm_unpackhi_ps(x0, x1)
										(__m128*)(matrixNew + 8*i + 16) = x0
										(__m128*)(matrixNew + 8*i) = x2

									}
	mov	eax, 4						# int i = 4
	.p2align	4, 0x90
LBB0_4:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	# LOOP iteration 1 for g = 0
	# rdi == matrix; rsi == matrixNew									
	# __m128 x0 = _mm_loadu_ps(matrix + i - 4) = ((__m128*)(matrix + i - 4))[0]
	movups	xmm0, xmmword ptr [rdx + 4*rax - 16]
	# __m128 x1 = _mm_loadu_ps(matrix + i + L / 2 - 4) = ((__m128*)(matrix + i + L / 2 - 4))[0]
	movups	xmm1, xmmword ptr [rdx + 4*rax + 464]
	# __m128 x2 = x0
	movaps	xmm2, xmm0
	# x2 = x2[31:0] x1[31:0] x2[63:32] x1[63:32]
	# x2 = _mm_unpacklo_ps (x2, x1)
	unpcklps	xmm2, xmm1      ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	# x0 = x0[95:64] x1[95:64] x0[127:962] x1[127:96]
	# x0 = _mm_unpackhi_ps(x0, x1)
	unpckhps	xmm0, xmm1      ## xmm0 = xmm0[2],xmm1[2],xmm0[3],xmm1[3]
	# (__m128*)(matrixNew + 2*i - 4)[0] = x0
	movups	xmmword ptr [r11 + 8*rax - 16], xmm0
	# (__m128*)(matrixNew + 2*i - 8)[0] = x2
	movups	xmmword ptr [r11 + 8*rax - 32], xmm2


	# LOOP iteration 2 for g = 1
	movups	xmm0, xmmword ptr [rdx + 4*rax]			# x0 = (__m128*)(matrix + 4*i)[0]
	movups	xmm1, xmmword ptr [rdx + 4*rax + 480]	# x1 = (__m128*)(matrix + 4*i + 480)[0]
	movaps	xmm2, xmm0								# x2 = x0
													# x2 = x2[31:0] x1[31:0] x2[63:32] x1[63:32]
													# x2 = _mm_unpacklo_ps (x2, x1)
	unpcklps	xmm2, xmm1      ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
													# x0 = x0[95:64] x1[95:64] x0[127:962] x1[127:96]
													# x0 = _mm_unpackhi_ps(x0, x1)
	unpckhps	xmm0, xmm1      ## xmm0 = xmm0[2],xmm1[2],xmm0[3],xmm1[3]
	
	movups	xmmword ptr [r11 + 8*rax + 16], xmm0	# (__m128*)(matrixNew + 8*i + 16)[0] = x0
	movups	xmmword ptr [r11 + 8*rax], xmm2			# (__m128*)(matrixNew + 8*i)[0] = x2
	
	add	rax, 8										# i += 8
	cmp	rax, 124
	jne	LBB0_4										# if(i != 124) goto LBB0_4
	# else goto LBB0_7
	jmp	LBB0_7
LBB0_8:
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
