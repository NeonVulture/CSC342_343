	.file	"DotProduct_Index.cpp"
	.text
	.p2align 4,,15
	.globl	_Z16DotProduct_IndexPiS_i
	.type	_Z16DotProduct_IndexPiS_i, @function
_Z16DotProduct_IndexPiS_i:
.LFB0:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L9
	movq	%rdi, %r9
	leal	-1(%rdx), %ecx
	movl	$5, %r8d
	shrq	$2, %r9
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	negq	%r9
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	andl	$3, %r9d
	leal	3(%r9), %eax
	cmpl	$5, %eax
	cmovb	%r8d, %eax
	cmpl	%eax, %ecx
	jb	.L10
	testl	%r9d, %r9d
	je	.L11
	movl	(%rdi), %eax
	movl	$1, %ebp
	imull	(%rsi), %eax
	cmpl	$1, %r9d
	movl	%eax, %r12d
	je	.L4
	movl	4(%rdi), %eax
	movl	$2, %ebp
	imull	4(%rsi), %eax
	addl	%eax, %r12d
	cmpl	$2, %r9d
	je	.L4
	movl	8(%rsi), %eax
	movl	$3, %ebp
	imull	8(%rdi), %eax
	addl	%eax, %r12d
.L4:
	movl	%edx, %ebx
	pxor	%xmm3, %xmm3
	subl	%r9d, %ebx
	salq	$2, %r9
	xorl	%ecx, %ecx
	movl	%ebx, %r11d
	leaq	(%rdi,%r9), %r10
	xorl	%r8d, %r8d
	shrl	$2, %r11d
	addq	%rsi, %r9
	.p2align 4,,10
	.p2align 3
.L7:
	movdqu	(%r9,%rcx), %xmm0
	addl	$1, %r8d
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm0
	movdqa	(%r10,%rcx), %xmm2
	pmuludq	(%r10,%rcx), %xmm1
	pshufd	$8, %xmm1, %xmm1
	addq	$16, %rcx
	psrlq	$32, %xmm2
	pmuludq	%xmm2, %xmm0
	pshufd	$8, %xmm0, %xmm0
	cmpl	%r11d, %r8d
	punpckldq	%xmm0, %xmm1
	paddd	%xmm1, %xmm3
	jb	.L7
	movdqa	%xmm3, %xmm0
	movl	%ebx, %r8d
	andl	$-4, %r8d
	psrldq	$8, %xmm0
	paddd	%xmm0, %xmm3
	movdqa	%xmm3, %xmm0
	leal	(%r8,%rbp), %ecx
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm3
	movd	%xmm3, %eax
	addl	%r12d, %eax
	cmpl	%r8d, %ebx
	je	.L1
.L3:
	movslq	%ecx, %r9
	movl	(%rdi,%r9,4), %r8d
	imull	(%rsi,%r9,4), %r8d
	addl	%r8d, %eax
	leal	1(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	movslq	%r8d, %r8
	movl	(%rdi,%r8,4), %r9d
	imull	(%rsi,%r8,4), %r9d
	leal	2(%rcx), %r8d
	addl	%r9d, %eax
	cmpl	%r8d, %edx
	jle	.L1
	movslq	%r8d, %r8
	movl	(%rdi,%r8,4), %r9d
	imull	(%rsi,%r8,4), %r9d
	leal	3(%rcx), %r8d
	addl	%r9d, %eax
	cmpl	%r8d, %edx
	jle	.L1
	movslq	%r8d, %r8
	movl	(%rdi,%r8,4), %r9d
	imull	(%rsi,%r8,4), %r9d
	leal	4(%rcx), %r8d
	addl	%r9d, %eax
	cmpl	%r8d, %edx
	jle	.L1
	movslq	%r8d, %r8
	addl	$5, %ecx
	movl	(%rdi,%r8,4), %r9d
	imull	(%rsi,%r8,4), %r9d
	addl	%r9d, %eax
	cmpl	%ecx, %edx
	jle	.L1
	movslq	%ecx, %rcx
	movl	(%rdi,%rcx,4), %edx
	imull	(%rsi,%rcx,4), %edx
	addl	%edx, %eax
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.L3
	.cfi_endproc
.LFE0:
	.size	_Z16DotProduct_IndexPiS_i, .-_Z16DotProduct_IndexPiS_i
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
