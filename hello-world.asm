# simple hello world program in mips asm
# NOTE: syscalls are necessary when our program needs to do something its has no permition to do, 
# just like displaying something on the console, or returning the control to the OS.

# section for static data
.data 
msg: .asciiz "Hello world!"

# section for code
.text 
main:
  la $a0, msg # loads the address of the message into $a0
  li $v0, 4   #  loads the value 4 into $v0. This value is the one used to indicate that we want to display
  # the value that is in $a0 on the screen
  syscall

exit:
  li $v0, 10
  syscall
