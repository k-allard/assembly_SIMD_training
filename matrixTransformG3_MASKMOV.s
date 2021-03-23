	.section	__TEXT,__text,regular,pure_instructions
#	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.intel_syntax noprefix
	.globl	__Z11transformz3PKjPjmm ## -- Begin function _Z11transformz3PKjPjmm
	.p2align	4, 0x90
__Z11transformz3PKjPjmm:                ## @_Z11transformz3PKjPjmm

#	.file	"transform.cpp"
#	.intel_syntax noprefix
#	.text
#	.p2align 4
#	.globl	transformz3
#	.type	transformz3, @function
    .set shf_axxb, 64
    .set shf_xxcx, 32
    .set shf_xdxx, 12
    .set shf_xaxx, 0
    .set shf_bxxc, 129
    .set shf_xxdx, 48
    .set shf_xxax, 0
    .set shf_xbxx, 4
    .set shf_cxxd, 194
# void transformz3(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
# rdi = psrc
# rsi = pdst
# rdx = L
# rcx = Q
# transformz3:
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
    mov r9, rdi
.lbl0:
    movdqu xmm0, xmmword ptr [rsi]
    pshufd xmm4, xmm0, shf_axxb
    maskmovdqu xmm4, xmm1
    lea rdi, qword ptr [rdi+16]
    pshufd xmm4, xmm0, shf_xxcx
    maskmovdqu xmm4, xmm2
    lea rdi, qword ptr [rdi+16]
    pshufd xmm4, xmm0, shf_xdxx
    maskmovdqu xmm4, xmm3
    lea rsi, [rsi+16]
    cmp rsi, rdx
    jne .lbl0
    mov rdi, r9
    lea rdx, [rsi+4*rax]
.lbl1:
    movdqu xmm0, xmmword ptr [rsi]
    pshufd xmm4, xmm0, shf_xaxx
    maskmovdqu xmm4, xmm3
    lea rdi, qword ptr [rdi+16]
    pshufd xmm4, xmm0, shf_bxxc
    maskmovdqu xmm4, xmm1
    lea rdi, qword ptr [rdi+16]
    pshufd xmm4, xmm0, shf_xxdx
    maskmovdqu xmm4, xmm2
    lea rdi, qword ptr [rdi+16]
    lea rsi, [rsi+16]
    cmp rsi, rdx
    jne .lbl1
    mov rdi, r9
    lea rdx, [rsi+4*rax]
.lbl2:
    movdqu xmm0, xmmword ptr [rsi]
    pshufd xmm4, xmm0, shf_xxax
    maskmovdqu xmm4, xmm2
    lea rdi, qword ptr [rdi+16]
    pshufd xmm4, xmm0, shf_xbxx
    maskmovdqu xmm4, xmm3
    lea rdi, qword ptr [rdi+16]
    pshufd xmm4, xmm0, shf_cxxd
    maskmovdqu xmm4, xmm1
    lea rdi, qword ptr [rdi+16]
    lea rsi, [rsi+16]
    cmp rsi, rdx
    jne .lbl2
    dec rcx
    jne .lbbig
    leave
	ret



.section	__TEXT,__const
.p2align	16

#	.size	transformz3, .-transformz3
#	.section	.rodata.cst16,"aM",@progbits,16
#	.align 16
.msk_1001: 
    .quad 0x0000000080808080
    .quad 0x8080808000000000
.msk_0010:
    .quad 0x0000000000000000
    .quad 0x0000000080808080
.msk_0100:
    .quad 0x8080808000000000
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
