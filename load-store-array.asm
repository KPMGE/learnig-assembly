# NOTE: there is no arrays in assembly, we're just treating those words as if they were, cuz they will
# be stored sequentially on the memory.
# NOTE: when refering to addresses, we must use ()
# NOTE: To get the next value, we need to shift by some amount of bytes, which for words is 4 bytes

.data
arr1: .word 1, 2
arr2: .word 0, 0
# after arr2 1, 2

.text
main:
  la $t0, arr1 # loads the address of arr1 into $t0
  la $t1, arr2 # loads the address of arr2 into $t1

  lw $t2, ($t0) # loads the first element of arr1 into $t2
  sw $t2, ($t1) # saves the first element of arr1 into the first 'position' of arr2

  l2 $t2, 4($t0) # loads the second element of arr1 into $t2
  sw $t2, 4($t1) # saves the second element of arr1 into the second 'position' of arr2



exit:
  li $v0, 10
  syscall
