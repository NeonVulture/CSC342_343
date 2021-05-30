.data 
	a: .word 6 
        b: .word 22 
	gcd_res: .word 0
.text
main: 
	lw $a0, a # load value a
        lw $a1, b # load value b
	jal gcd
	sw $v0, gcd_res # save the return value
	
	li $v0, 10 # end program
	syscall
	
gcd: # procedure to calculate gcd(a,b)
	addi $sp, $sp, -12 # adjust stack pointer for 3 items
	sw $s1, 8($sp) # store the first argument
        sw $s0, 4($sp) # store the second arguement
	sw $ra, 0($sp) # store the return address
     
        add $s0, $a0, $zero # s0 = a0 (s0 = a)
	add $s1, $a1, $zero # s0 = a0 (s1 = b)
	
	# first iteration  	
    	div $a0, $a1 # divide a by b (remainder is stored in $mfhi)
    	mfhi $s0 # store remainder in $a1 (i.e. result of a%b)
    	sw $s0, 4($sp) #save the remainder
    	bne $s0, $zero, L1 # branch to label if remainder != 0
 
 	# base case
	add $v0, $zero, $a1 # $v0 = $a1 (i.e. return b)
	addi $sp, $sp 12 # adjust stack pointer to pop twice 
	jr $ra # jump to return address (i.e. main) 
	
L1: # recursive procedure 
	add $a0, $a1, $zero # $a0 = $s1 (a = b)
	lw $s0, 4($sp) # load remainder
	add $a1, $s0, $zero # $a1 = $s0 (b = remainder)
	
	jal gcd
    
        # exit
        lw $ra, 0($sp) # restore the return address 
	lw $s0, 4($sp) # restore the second argument
    	lw $s1, 8($sp) # restore the first argument 
	addi $sp, $sp, 12 # adjust stack pointer to pop twice 
    	jr $ra # jump to return address

