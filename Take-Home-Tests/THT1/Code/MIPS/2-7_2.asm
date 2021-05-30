.data
i: .word 8
k: .word 20
A: .word 0-100
size: .word 100

.text
lw $s0, i
lw $s1, k
la $s6, A
sw $s1, 32($s6)
sw $s1, 36($s6)

Loop:
sll $t1, $s0, 2
add $t1, $t1, $s6
lw $t0, 0($t1)
bne $t0, $s1, Exit
addi $s0, $s0, 1
j Loop
Exit:
sw $zero, k
