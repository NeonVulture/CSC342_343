.data
a: .word 0
b: .word 10
.text
lw $s0, a
lw $s1, b

WhileLoop: 
	bgt $s0, $s1, Exit
	
	addi $s0, $s0, 1 #i++
	
	j WhileLoop
Exit:

sw $s0, a