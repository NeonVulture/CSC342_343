	.file	"DotProduct_Pointer.cpp"
	.text
	.p2align 4,,15
	.globl	_Z18DotProduct_PointerPiS_i
	.type	_Z18DotProduct_PointerPiS_i, @function
_Z18DotProduct_PointerPiS_i:
.LFB0:
	.cfi_startproc
	movslq	%edx, %rdx
	xorl	%eax, %eax
	leaq	(%rdi,%rdx,4), %rcx
	cmpq	%rcx, %rdi
	jnb	.L4
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rdi), %edx
	addq	$4, %rdi
	addq	$4, %rsi
	imull	-4(%rsi), %edx
	addl	%edx, %eax
	cmpq	%rcx, %rdi
	jb	.L3
	rep ret
	.p2align 4,,10
	.p2align 3
.L4:
	rep ret
	.cfi_endproc
.LFE0:
	.size	_Z18DotProduct_PointerPiS_i, .-_Z18DotProduct_PointerPiS_i
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
