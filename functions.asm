# example of functions in MIPS assembly
# Author: Kevin Carvalho de Jesus

# NOTE: we will implement the following code: 
# int sum(int n1, int n2) {
#   return n1 + n2;
# }
#
# int main() {
#   printf("sum: %d", sum(10, 20));
# }

.data
n1:     .word   0
n2:     .word   0
result: .word   0
ask_msg: .asciiz "enter a number: "
msg:    .asciiz "the sum is: "

.text
main:
  jal get_numbers
  move $a0, $v0

  jal sum
  sw $v0, result
  jal print_num

exit:
  li $v0, 10
  syscall

sum:
  add $v0, $a0, $a1
  jr $ra

get_numbers:
  la $a0, ask_msg
  li $v0, 4
  syscall

  li $v0, 5 
  syscall
  move $a0, $v0

  la $a0, ask_msg
  li $v0, 4
  syscall

  li $v0, 5 
  syscall
  move $a1, $v0
  
  jr $ra

print_num: 
  la $a0, msg
  li $v0, 4
  syscall

  lw $a0, result
  li $v0, 1
  syscall

  jr $ra
