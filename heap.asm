# simple program that shows how to allocate memory on the heap using mips assembly
# NOTE: in mips, we can allocate memory on the heap, but we can't deallocate it, which is
# really bad.

.data
array: .word 1, 2, 3, 4, 5
size: .word 5
p: .word 0

.text
main:
  # allocate 20 bytes of memory(cuz we have 5 elements * 4 bytes per word = 20bytes for the array)
  li $v0, 9
  li $a0, 20
  syscall
  # save the address of the allocated memory 
  sw $v0, p

  # loop through the static array and copy each element into the allocated one
  la $t1, array # address of the static array
  lw $t2, p # pointer to the beginning of the allocated array
  li $t0, 0 # i = 0
  lw $t3, size
loop: bge $t0, $t3, exit # i >= size, we do that cuz we're not starting from 0!
  sw $t1, ($t2) # copy the element from the static array into the allocated one
  addi $t1, $t1, 4 # point to the next array element
  addi $t2, $t2, 4 # point to the next array element
  addi $t0, $t0, 1 # i++
  j loop

exit:
  li $v0, 10
  syscall
