.data
age: .word 0
ask_msg: .asciiz "Enter your age: " 
result_msg: .asciiz "Your age is: "

.text
main:
  la $a0, ask_msg # loads the address of ask_msg into $a0
  li $v0, 4       # instruction to display message on the console
  syscall         

  li $v0, 5   # instruction to wait for user input
  syscall 
  sw $v0, age # copy value entered into age
  
  la $a0, result_msg # copy address of result_msg into $a0
  li $v0, 4          # instruction to display message on the console
  syscall 

  lw $a0, age # instruction to display integer on the console
  li $v0, 1
  syscall

exit:
  li $v0, 10
  syscall
