# simple file operation example in MIPS assembly

.data
fout:   .asciiz "output.txt"
buffer: .asciiz "This is content that has been saved from MIPS!"
read_buf: .space 100

.text
main:
  # open file for writing
  li $v0, 13    # code for opening a file
  la $a0, fout  # name of the output file
  li $a1, 1     # 1 => write mode
  li $a2, 0     # mode is ignored
  syscall
  move $s0, $v0 # save file descriptor

  # write content to the file just opened
  li $v0, 15     # code for writing to a file
  move $a0, $s0  # move file descriptor
  la $a1, buffer # buffer that we wanna save to the file
  li $a2, 46     # hardcoded file length
  syscall

  # close the file
  li $v0, 16    # code for closing the file
  move $a0, $s0 # file descriptor to close
  syscall

  # open file for reading
  li $v0, 13    # code for opening a file
  la $a0, fout  # name of the output file
  li $a1, 0     # 1 => read mode
  li $a2, 0     # mode is ignored
  syscall
  move $s0, $v0 # save file descriptor

  # read contents of the file into the read_buf
  li $v0, 14       # syscall for opening a file
  move $a0, $s0    # copy file descriptor
  la $a1, read_buf # buffer to read into
  li $a2, 100      # hardcoded buffer length
  syscall

  # print file contents
  li $v0, 4         # syscall for printing on the screen
  la $a0, read_buf  # address of the string to print
  syscall

  # close the file
  li $v0, 16    # code for closing the file
  move $a0, $s0 # file descriptor to close
  syscall

exit:
  li $v0, 10
  syscall
