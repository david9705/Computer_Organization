.data
msg1:	.asciiz "The array before sort : \n"
msg2:	.asciiz "\nThe array after  sort : \n"
spacemsg:    .asciiz "  "
nl:     .asciiz "\n"
array:    .word 5, 3, 6, 7, 31, 23, 43, 12, 45, 1
size:   .word 10


.text
.globl main



main:
	li      $v0, 4				# call system call: print string
	la      $a0, msg1			# load address of string into $a0
	syscall                 		# run the syscall

	addi    $sp, $sp, -12
        sw      $ra, 0($sp)
        sw      $s0, 4($sp)
        sw      $s1, 8($sp)
                
        move    $s0, $zero      # i = 0
        li      $t0, 0          # j = 0
        la      $t1, array	# load $t1 = &array
        lw      $t2, size	# load $t2 = size

	la      $a0, array
        lw      $a1, size






inputi:
        beq     $s0, $zero, notspace
        li      $v0, 4          # print("  ")
        la      $a0, spacemsg
        syscall 

notspace:
        li      $v0, 1          # $v0 function result, call printInt
        add     $t3, $t0, $t1   # $t3 = array + $t0
        lw      $a0, 0($t3)     # printInt($a0) 
        syscall        

        addi    $t0, $t0, 4     # j += 4, 4 bytes(word)
        addi    $s0, $s0, 1     # i = i+1
        bne     $s0, $t2, inputi
        
        li      $v0, 4          # printString("\n")
        la      $a0, nl
        syscall


	la      $a0, array
        lw      $a1, size
        jal     sort
        
        #start output
        move    $s0, $zero      # i = 0
        li      $t0, 0          # j = 0
        la      $t1, array      # load $t1 = &array
        lw      $t2, size       # load $t2 = size        
        
        li      $v0, 4          # printString
        la      $a0, msg2
        syscall
outputi:
        beq     $s0, $zero, notprintspace
        li      $v0, 4          # printString(" ")
        la      $a0, spacemsg
        syscall 
notprintspace:
        li      $v0, 1          # $v0 function result, call printInt
        add     $t3, $t0, $t1   # $t2 = array + $t0
        lw      $a0, 0($t3)     # printInt($a0) 
        syscall        

        addi    $t0, $t0, 4     # j += 4, 4 bytes(word)
        addi    $s0, $s0, 1     # i = i+1
        bne     $s0, $t2, outputi
        # outputi loop end
        li      $v0, 4          # printString("\n")
        la      $a0, nl
        syscall
        
        
       
        
        lw    $s1, 8($sp)
        lw    $s0, 4($sp)
        lw    $ra, 0($sp)
        addi  $sp, $sp, 12
        jr    $ra
        #end process








#function sort(array, n) => ($a0, $a1) begin
sort:   addi $sp, $sp, -20    # make room on stack for 5 registers
        sw   $ra, 16($sp)
        sw   $s3, 12($sp)
        sw   $s2, 8($sp)
        sw   $s1, 4($sp)
        sw   $s0, 0($sp)
        
        move $s2, $a0         # $s2 = &array
        move $s3, $a1         # $s3 = n(array_size)
        move $s0, $s3         # $s0 = i = n
        addi $s0, $s0, -1     # $s0 = n-1

for1tst:
        slt  $t0, $s0, $zero  # while(i >= 0)
        bne  $t0, $zero, exit1# t0 = 1, i < 0
        move $s1, $zero       # $s1 = j = 0

for2tst:        
        slt  $t0, $s1, $s0    # while(j < i)
        beq  $t0, $zero, exit2# t0 = 0, j >= i
        sll  $t1, $s1, 2      # $t1 = 4 * j
        add  $t2, $s2, $t1    # $t2 = &array[j] = $s2 + 4*j
        lw   $t3, 0($t2)      # $t3 = array[j]
        lw   $t4, 4($t2)      # $t4 = array[j+1]
        slt  $t0, $t3, $t4    # if(array[j] > array[j+1]) swap()
        bne  $t0, $zero, for2end# t0 = 1, array[j] < array[j+1]
        move $a0, $s2         # call swap(array, j)
        move $a1, $s1
        jal  swap

for2end:
        addi $s1, $s1, 1      # j++
        j    for2tst

exit2:
        addi $s0, $s0, -1     # i--
        j    for1tst
exit1:
        lw   $s0, 0($sp)
        lw   $s1, 4($sp)
        lw   $s2, 8($sp)
        lw   $s3, 12($sp)
        lw   $ra, 16($sp)
        addi $sp, $sp, 20
        jr   $ra              # return to call routine
#function sort(array, n) end

#function swap(array, j) => ($a0, $a1)begin // swap(array[j], array[j+1])
swap:
        sll $t1, $a1, 2       # $t1 = j*4
        add $t1, $a0, $t1     # $t1 = &array[j] = $a0 + j*4
        
        lw  $t0, 0($t1)       # $t0 = array[j]
        lw  $t2, 4($t1)       # $t2 = array[j+1]
        
        sw  $t2, 0($t1)       # array[j] = $t2
        sw  $t0, 4($t1)       # array[j+1] = $t0
        jr $ra
#function swap end