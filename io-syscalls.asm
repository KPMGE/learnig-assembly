# Example of IO syscalls in MIPS assembly
# Author: Kevin Carvalho de Jesus

.data
age: .word 0
ask_msg: .asciiz "Enter your age: " 
result_msg: .asciiz "Your age is: "

.text
main:
  # displays ask_msg on the screen
  la $a0, ask_msg
  li $v0, 4
  syscall

  # reads stdin into age
  li $v0, 5
  syscall
  sw $v0, age
  
  # displays result_msg
  la $a0, result_msg
  li $v0, 4
  syscall 

  # displays age
  lw $a0, age
  li $v0, 1
  syscall

exit:
  li $v0, 10
  syscall
