	.file	"DotProduct_Pointer.cpp"
	.text
	.globl	_Z18DotProduct_PointerPiS_i
	.type	_Z18DotProduct_PointerPiS_i, @function
_Z18DotProduct_PointerPiS_i:
.LFB0:
	.cfi_startproc
	movslq	%edx, %rdx
	leaq	(%rdi,%rdx,4), %rcx
	cmpq	%rcx, %rdi
	jnb	.L4
	movl	$0, %eax
.L3:
	movl	(%rdi), %edx
	imull	(%rsi), %edx
	addl	%edx, %eax
	addq	$4, %rdi
	addq	$4, %rsi
	cmpq	%rcx, %rdi
	jb	.L3
	rep ret
.L4:
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	_Z18DotProduct_PointerPiS_i, .-_Z18DotProduct_PointerPiS_i
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
