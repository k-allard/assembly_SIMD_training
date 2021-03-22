	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	__Z11transformz4PKjPjmm ## -- Begin function _Z11transformz3PKjPjmm
	.p2align	4, 0x90
__Z11transformz4PKjPjmm:                ## @_Z11transformz4PKjPjmm
    .set shf_axxb, 64
    .set shf_xxcx, 32
    .set shf_xdxx, 12
    .set shf_xaxx, 0
    .set shf_bxxc, 129
    .set shf_xxdx, 48
    .set shf_xxax, 0
    .set shf_xbxx, 4
    .set shf_cxxd, 194
# void transformz4(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
# rdi = psrc
# rsi = pdst
# rdx = L
# rcx = Q
# transformz4:
    push rbp
    mov rbp, rsp
    xchg rdi, rsi
    movdqa xmm1, xmmword ptr .msk_1001[rip]
    movdqa xmm2, xmmword ptr .msk_0010[rip]
    movdqa xmm3, xmmword ptr .msk_0100[rip]
    mov r8, rdx
    mov rax, rdx
    xor rdx, rdx
    mov r9, 3
    div r9
.lbbig:
    lea rdx, [rsi+4*rax]
.lbl0:
    movdqu xmm0, xmmword ptr [rsi]
    movdqu xmm5, xmmword ptr [rsi+4*rax]
    movdqu xmm6, xmmword ptr [rsi+8*rax]
    pshufd xmm4, xmm0, shf_axxb
    pand xmm4, xmm1
    pshufd xmm7, xmm5, shf_xaxx
    pand xmm7, xmm3
    por xmm4, xmm7
    pshufd xmm7, xmm6, shf_xxax
    pand xmm7, xmm2
    por xmm4, xmm7
    movdqu xmmword ptr [rdi], xmm4
    lea rdi, qword ptr [rdi+16]
    pshufd xmm4, xmm0, shf_xxcx
    pand xmm4, xmm2
    pshufd xmm7, xmm5, shf_bxxc
    pand xmm7, xmm1
    por xmm4, xmm7
    pshufd xmm7, xmm6, shf_xbxx
    pand xmm7, xmm3
    por xmm4, xmm7
    movdqu xmmword ptr [rdi], xmm4
    lea rdi, qword ptr [rdi+16]
    pshufd xmm4, xmm0, shf_xdxx
    pand xmm4, xmm3
    pshufd xmm7, xmm5, shf_xxdx
    pand xmm7, xmm2
    por xmm4, xmm7
    pshufd xmm7, xmm6, shf_cxxd
    pand xmm7, xmm1
    por xmm4, xmm7
    movdqu xmmword ptr [rdi], xmm4
    lea rsi, [rsi+16]
    lea rdi, [rdi+16]
    cmp rsi, rdx
    jne .lbl0
    lea rsi, [rdx+rax*8]
    dec rcx
    jne .lbbig
    leave
	ret
.section	__TEXT,__const
.p2align	16
.msk_1001: 
    .quad 0x00000000FFFFFFFF
    .quad 0xFFFFFFFF00000000
.msk_0010:
    .quad 0x0000000000000000
    .quad 0x00000000FFFFFFFF
.msk_0100:
    .quad 0xFFFFFFFF00000000
    .quad 0x0000000000000000
#
#	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
#	.section	.note.GNU-stack,"",@progbits
#	.section	.note.gnu.property,"a"
#	.align 8
#	.long	 1f - 0f
#	.long	 4f - 1f
#	.long	 5
#0:
#	.string	 "GNU"
#1:
#	.align 8
#	.long	 0xc0000002
#	.long	 3f - 2f
#2:
#	.long	 0x3
#3:
#	.align 8
#4:
