.data
	n: .word 5
	N_fact: .word 0
.text
main: 

	lw $a0, n
	jal factorial
	sw $v0, N_fact
	
	li $v0, 10
	syscall

factorial: # procedure to calculate factorial(n)
	addi $sp, $sp, -8 # adjust stack pointer for 2 items
	sw $s0, 4($sp) # store the argument
	sw $ra, 0($sp) # store the return address
	
	# base case
	li $v0, 1
	beq $a0, 0, endcall # if n = 1, go to endcall procedure
	
	move $s0, $a0
	sub $a0, $a0, 1 # set argument for n-1
	jal factorial # call factorial() with n-1 as the argument
	
	mul $v0, $s0, $v0 # compute n * factorial(n-1)
	
	endcall: #return from jal
		lw $ra, 0($sp) # restore the return address 
		lw $s0, 4($sp) # restore the argument n 
		addi $sp, $sp, 8 # adjust stack pointer to pop twice
		
		jr $ra # jump to return address
