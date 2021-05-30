.data
a: .word 0
b: .word 100
c: .word 80
d: .word 60

.text
lw $s0, a
lw $s1, b
lw $s2, c
lw $s3, d
bne $s0, $s3, Else
# if a == d, then
add $s0, $s1, $s2
j Exit
Else:
# else
sub $s0, $s1, $s2
Exit:
sw $s0, a 