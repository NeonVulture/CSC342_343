	.file	"DotProduct_Index.cpp"
	.text
	.globl	_Z16DotProduct_IndexPiS_i
	.type	_Z16DotProduct_IndexPiS_i, @function
_Z16DotProduct_IndexPiS_i:
.LFB0:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L4
	leal	-1(%rdx), %eax
	leaq	4(,%rax,4), %r8
	movl	$0, %edx
	movl	$0, %eax
.L3:
	movl	(%rdi,%rdx), %ecx
	imull	(%rsi,%rdx), %ecx
	addl	%ecx, %eax
	addq	$4, %rdx
	cmpq	%r8, %rdx
	jne	.L3
	rep ret
.L4:
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	_Z16DotProduct_IndexPiS_i, .-_Z16DotProduct_IndexPiS_i
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
