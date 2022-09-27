# Stack and registers conventions
# Author: Kevin Carvalho de Jesus

# By convention, we should keep the value of the $s registers between function  calls.
# We can accomplish that by saving its value on the stack and then at the end of the function, 
# writing it back from the stack. 

# NOTE: before pushing into the stack, we need to adjust the stack pointer($sp) by minus the amount of words we wanna store times 4.
# NOTE: after popping out the stack, we need to adjust the stack pointer($sp) by 4 times the amount of words we stored.
# NOTE: after we pop out the stack, there will be some data in there yet, just the $sp will point below that data. we consider such a data garbage 

.data
s0_msg_before: .asciiz "\nvalue of $s0 register before function call: "
s0_msg_after: .asciiz "\nvalue of $s0 register after function call: "
s1_msg_before: .asciiz "\nvalue of $s1 register before function call: "
s1_msg_after: .asciiz "\nvalue of $s1 register after function call: "

.text
main:
  # sets some default values for $s0 and $s1
  li $s0, 10
  li $s1, 20

  #  displays value of $s0 before function call
  la $a0, s0_msg_before
  jal display_msg
  jal display_s0

  #  displays value of $s1 before function call
  la $a0, s1_msg_before
  jal display_msg
  jal display_s1

  # calls the function, that is supposed to not change the value of $s registers!
  jal calculate_sum

  #  displays value of $s0 after function call
  la $a0, s0_msg_after
  jal display_msg
  jal display_s0

  #  displays value of $s1 after function call
  la $a0, s1_msg_after
  jal display_msg
  jal display_s1

exit: 
  li $v0, 10
  syscall

display_s0:
  # copies the contents of $s0 into $a0
  move $a0, $s0
  li $v0, 1
  syscall
  jr $ra

display_s1:
  # copies the contents of $s1 into $a0
  move $a0, $s1
  li $v0, 1
  syscall
  jr $ra

display_msg:
  li $v0, 4
  syscall
  jr $ra

calculate_sum: 
  # store some values on registers
  li $t0, 10
  li $t1, 20

  # save contents of $s1 on the stack
  addi $sp, $sp, -4
  sw $s1, ($sp)

  # perform sum and save the result in $s0 and $s1
  add $s0, $t0, $t1
  add $s1, $t0, $t1

  # load back the value of $s1 from the stack
  lw $s1, ($sp)
  addi $sp, $sp, 4

  jr $ra
