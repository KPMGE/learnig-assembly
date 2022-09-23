# Example of a while loop in MIPS assembly. 
# Author: Kevin Carvalho de Jesus

# NOTE: we will implement the following C code:
# int i = 0, n = 15;
# while(i < n) {
#   printf("%d", i);
#   i++;
# }

.data 
i: .word 0
n: .word 15
msg: .asciiz "\ncurrent number: "

.text
loop:
  # loads the values of n and i into $t0 and $t1
  lw $t0, i
  lw $t1, n

  # exits if $t0 == $t1
  beq $t0, $t1, exit
  # i++
  addi $t0, $t0, 1
  # saves updated i value
  sw $t0, i
  
  # display message
  li $v0, 4
  la $a0, msg
  syscall

  # display number
  li $v0, 1
  lw $a0, i
  syscall

  # jump to the start of the loop again
  j loop

exit:
  li $v0, 10
  syscall
