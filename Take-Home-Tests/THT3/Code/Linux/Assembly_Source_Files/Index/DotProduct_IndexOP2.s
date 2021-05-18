	.file	"DotProduct_Index.cpp"
	.text
	.p2align 4,,15
	.globl	_Z16DotProduct_IndexPiS_i
	.type	_Z16DotProduct_IndexPiS_i, @function
_Z16DotProduct_IndexPiS_i:
.LFB0:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L4
	leal	-1(%rdx), %eax
	xorl	%edx, %edx
	leaq	4(,%rax,4), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rdi,%rdx), %ecx
	imull	(%rsi,%rdx), %ecx
	addq	$4, %rdx
	addl	%ecx, %eax
	cmpq	%rdx, %r8
	jne	.L3
	rep ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	_Z16DotProduct_IndexPiS_i, .-_Z16DotProduct_IndexPiS_i
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
