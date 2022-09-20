# if-else example in MIPS assembly
# Author: Kevin Carvalho de Jesus

# NOTE: if the number entered is 10, prints num_ten_msg, otherwise prints num_not_ten_msg

.data
ask_msg: .asciiz "enter a number: "
num_ten_msg: .asciiz "the number is 10!"
num_not_ten_msg: .asciiz "the number is not 10!"
num: .word 0

.text
main:
  # displays ask_msg
  la $a0, ask_msg
  li $v0, 4
  syscall

  # read number from stdin
  lw $a0, num
  li $v0, 5
  syscall
  # saves read number into num
  sw $v0, num

  # loads 10 into $t0
  li $t0, 10
  # loads the contents of num into $t1
  lw $t1, num
  # if number is not ten, jump to not ten label
  bne $t0, $t1, not_ten
  # otherwise, jump to ten
  j ten

not_ten:
  # displays num_not_ten_msg
  la $a0, num_not_ten_msg
  li $v0, 4
  syscall
  # jump to exit
  j exit

ten: 
  # displays num_ten_msg
  la $a0, num_ten_msg
  li $v0, 4
  syscall
  # jump to exit
  j exit

exit: 
  li $v0, 10
  syscall
