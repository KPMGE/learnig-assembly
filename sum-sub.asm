# simple sum, subtractrion program made in MIPS assembly
# Author: Kevin Carvalho de Jesus

.data 
first_num: .word 0
second_num: .word 0
sum: .word 0
diff: .word 0

first_num_msg: .asciiz "Enter the first number: "
second_num_msg: .asciiz "Enter the second number: "
sum_msg: .asciiz "\nThe sum is: "
diff_msg: .asciiz "\nThe difference is: "
result_msg: .asciiz "Here are the results: \n"

.text
main:
  # ask for first number
  la $a0, first_num_msg
  li $v0, 4
  syscall

  # get first_num
  lw $a0, first_num
  li $v0, 5
  syscall
  sw $v0, first_num

  # ask for second number
  la $a0, second_num_msg
  li $v0, 4
  syscall

  # get second number
  lw $a0, second_num
  li $v0, 5
  syscall
  sw $v0, second_num

  # calculate sum of the numbers
  lw $t0, first_num
  lw $t1, second_num
  add $t2, $t0, $t1
  sw $t2, sum

  # calculate the difference between the numbers
  sub $t2, $t0, $t1
  sw $t2, diff


  # displays result message 
  la $a0, result_msg
  li $v0, 4
  syscall


  # displays sum on screen
  la $a0, sum_msg
  li $v0, 4
  syscall

  lw $a0, sum
  li $v0, 1
  syscall

  # displays difference on screen
  la $a0, diff_msg
  li $v0, 4
  syscall

  lw $a0, diff
  li $v0, 1
  syscall

exit:
  li $v0, 10
  syscall

