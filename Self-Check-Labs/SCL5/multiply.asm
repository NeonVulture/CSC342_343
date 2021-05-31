.data
a:  .word 4
b:  .word 5
c:  .word 2147483647
d:  .word 2147483648
e:  .word -1
f:  .word -1610612736
g:  .word -1342177280

.text
lw $s0, a
lw $s1, b
lw $s2, c
lw $s3, d
lw $s4, e
lw $s5, f
lw $s6, g
# a * b
mul $t4, $s0, $s1
# c * e
mul $t5, $s2, $s4
# d * 0
mul $t6, $s3, $zero
# f * g
mul $t7, $s5, $s6 
