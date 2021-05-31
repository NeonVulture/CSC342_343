.data
a:  .word 2
b:  .word 122
c:  .word 100
d:  .word 9
e:  .word 500
f:  .word -2
g:  .word -6
h:  .word 79

.text
lw $s0, a
lw $s1, b
lw $s2, c
lw $s3, d
lw $s4, e
lw $s5, f
lw $s6, g
lw $s7, h
# b / a
div $s1, $s0
# c / d
div $s2, $s3
# e / f 
div $s4, $s5
# g / f
div $s6, $s5
# h / 0
div $s7, $zero
 