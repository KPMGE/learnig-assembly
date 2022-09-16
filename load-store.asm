# NOTE: words define a size, not a type

.data
a: .word 10
b: .word 20
c: .word 0
c: .word 0

.text
main:
  lw $t1, a # loads the contents of a into $t1
  lw $t2, b # loads the contents of b into $t2
  sw $t1, c # stores the contents $t1 into c
  sw $t2, d # stores the contents $t2 into d
  
exit:
  li $v0, 10
  syscall
