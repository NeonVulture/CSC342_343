.data
b: .word -1 #static variable declaration 

.text
lw $s0, b # b = -1
addi $s1, $s1, 1 # a = 1 
addi $sp, $sp, -4 # adjust stack pointer (push)
add $s0, $s0, 1 # b += 1
add $s0, $s1, $s0 # a+b
addi $sp, $sp, 4 # restore stack pointer (pop)
