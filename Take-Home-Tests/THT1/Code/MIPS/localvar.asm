.text
addi $s0, $s0, 5
addi $s1, $s1, 10
addi $t0, $t0, 0
addi $sp, $sp, -8 # adjust stack pointer (push)

sw $s0, 4($sp)
sw $s1, 0($sp)

add $t0, $zero, $s0 # t0 = s0
add $s0, $zero, $s1 # s0 = s1
add $s1, $zero, $t0 # s1 = s0

sw $s0, 4($sp)
sw $s1, 0($sp)

addi $sp, $sp, 8 # restore stack pointer (pop)
