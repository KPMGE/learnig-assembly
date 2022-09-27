# implementation of recursive factorial function
# Author: Kevin Carvalho de Jesus

.data
ask_msg: .asciiz "enter a number: "
result_msg: .asciiz "factorial: "
result_num: .word 0

.text
main: 
  # gets the number and saves into $v0
  jal get_number
  # moves the contents of $v0 into $a0
  move $a0, $v0
  # calculates the factorial of the number 
  jal factorial
  # displays the factorial of the number
  jal display_factorial

exit:
  li $v0, 10
  syscall

display_factorial: 
  # display the result_msg
  la $a0, result_msg
  li $v0, 4
  syscall

  # display number at result_num
  lw $a0, result_num
  li $v0, 1
  syscall

  jr $ra 

get_number: 
  # display message
  la $a0, ask_msg
  li $v0, 4
  syscall

  # waits for the user to enter a number and saves it to $v0
  li $v0, 5
  syscall

  jr $ra

factorial: 
  # push $ra and $a0
  addi $sp, $sp, -8
  sw $ra, 4($sp)
  sw $a0, ($sp)

  # check base case
  li $v0, 1
  beq $a0, $zero, factorial_done

  # call factorial(n - 1) recursively
  addi $a0, $a0, -1
  jal factorial

  # n * factorial(n - 1)
  lw $a0, ($sp)     # pops previous n from stack
  mul $v0, $a0, $v0 # multiply it by the current n

factorial_done: 
  # pop out $ra and adjust $sp
  lw $ra, 4($sp)
  addi $sp, $sp, 8

  # saves result into result_num
  sw $v0, result_num

  jr $ra 
