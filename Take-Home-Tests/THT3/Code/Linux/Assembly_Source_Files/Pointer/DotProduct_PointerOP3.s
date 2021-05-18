	.file	"DotProduct_Pointer.cpp"
	.text
	.p2align 4,,15
	.globl	_Z18DotProduct_PointerPiS_i
	.type	_Z18DotProduct_PointerPiS_i, @function
_Z18DotProduct_PointerPiS_i:
.LFB0:
	.cfi_startproc
	movslq	%edx, %rdx
	leaq	(%rdi,%rdx,4), %r8
	cmpq	%r8, %rdi
	jnb	.L9
	movq	%rdi, %rdx
	leaq	4(%rdi), %r9
	leaq	3(%r8), %rcx
	shrq	$2, %rdx
	movl	$5, %r11d
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	negq	%rdx
	subq	%r9, %rcx
	movq	%r9, %r10
	andl	$3, %edx
	shrq	$2, %rcx
	leaq	3(%rdx), %rax
	cmpq	$5, %rax
	cmovb	%r11, %rax
	cmpq	%rax, %rcx
	jb	.L10
	testq	%rdx, %rdx
	je	.L11
	movl	(%rdi), %eax
	leaq	4(%rsi), %r11
	imull	(%rsi), %eax
	cmpq	$1, %rdx
	movl	%eax, %r9d
	je	.L4
	movl	4(%rdi), %eax
	leaq	8(%rdi), %r10
	leaq	8(%rsi), %r11
	imull	4(%rsi), %eax
	addl	%eax, %r9d
	cmpq	$2, %rdx
	je	.L4
	movl	8(%rdi), %eax
	leaq	12(%rdi), %r10
	leaq	12(%rsi), %r11
	imull	8(%rsi), %eax
	addl	%eax, %r9d
.L4:
	subq	%rdx, %rcx
	pxor	%xmm3, %xmm3
	leaq	1(%rcx), %rbx
	salq	$2, %rdx
	xorl	%ecx, %ecx
	addq	%rdx, %rdi
	addq	%rdx, %rsi
	xorl	%edx, %edx
	movq	%rbx, %rax
	shrq	$2, %rax
	.p2align 4,,10
	.p2align 3
.L7:
	movdqu	(%rsi,%rdx), %xmm0
	addq	$1, %rcx
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm0
	movdqa	(%rdi,%rdx), %xmm2
	pmuludq	(%rdi,%rdx), %xmm1
	pshufd	$8, %xmm1, %xmm1
	addq	$16, %rdx
	psrlq	$32, %xmm2
	pmuludq	%xmm2, %xmm0
	pshufd	$8, %xmm0, %xmm0
	cmpq	%rax, %rcx
	punpckldq	%xmm0, %xmm1
	paddd	%xmm1, %xmm3
	jb	.L7
	movdqa	%xmm3, %xmm0
	movq	%rbx, %rdx
	andq	$-4, %rdx
	psrldq	$8, %xmm0
	paddd	%xmm0, %xmm3
	movdqa	%xmm3, %xmm0
	leaq	0(,%rdx,4), %rsi
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm3
	movd	%xmm3, %eax
	leaq	(%r10,%rsi), %rdi
	addq	%r11, %rsi
	addl	%r9d, %eax
	cmpq	%rdx, %rbx
	leaq	4(%rdi), %r9
	je	.L1
.L3:
	movl	(%rsi), %edx
	imull	(%rdi), %edx
	addl	%edx, %eax
	cmpq	%r9, %r8
	jbe	.L1
	movl	4(%rdi), %edx
	imull	4(%rsi), %edx
	addl	%edx, %eax
	leaq	8(%rdi), %rdx
	cmpq	%rdx, %r8
	jbe	.L1
	movl	8(%rdi), %edx
	imull	8(%rsi), %edx
	addl	%edx, %eax
	leaq	12(%rdi), %rdx
	cmpq	%rdx, %r8
	jbe	.L1
	movl	12(%rdi), %edx
	imull	12(%rsi), %edx
	addl	%edx, %eax
	leaq	16(%rdi), %rdx
	cmpq	%rdx, %r8
	jbe	.L1
	movl	16(%rdi), %edx
	imull	16(%rsi), %edx
	addl	%edx, %eax
	leaq	20(%rdi), %rdx
	cmpq	%rdx, %r8
	jbe	.L1
	movl	20(%rdi), %edx
	imull	20(%rsi), %edx
	addl	%edx, %eax
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	movq	%rsi, %r11
	movq	%rdi, %r10
	xorl	%r9d, %r9d
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	jmp	.L3
	.cfi_endproc
.LFE0:
	.size	_Z18DotProduct_PointerPiS_i, .-_Z18DotProduct_PointerPiS_i
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
