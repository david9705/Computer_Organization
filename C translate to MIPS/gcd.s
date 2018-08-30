.data
msg1:	.asciiz "Enter first integers: "
msg2:	.asciiz "Enter second integers:  "
msg3:	.asciiz "Greatest common divisor: "
spacemsg:    .asciiz "  "
nl:     .asciiz "\n"



.text
.globl main



main:   
	li      $v0, 4         # printString1
        la      $a0, msg1
        syscall
	#read input one######
	li		$v0, 5		# call system call: read 
	syscall
	move    $t0, $v0       # $t0 = first input
	
	li      $v0, 4         # printString2
        la      $a0, msg2
        syscall
	#read input second######
	li		$v0, 5		# call system call: read 
	syscall
	move    $t1, $v0       # $t1 = second input

	jal     gcd

	li      $v0, 4         # printString3
        la      $a0, msg3
        syscall

	
	move 		$a0, $t3	#print the result
	li		$v0, 1		# call system call: print
	syscall
	

	li		$v0, 10		# call system call exit
	syscall
	


	



gcd:
	addi 	$sp, $sp, -12
	sw   	$ra, 0($sp)
	sw	$t0, 4($sp)	#t1=n t0=m
	sw 	$t1, 8($sp)


	bne 	$t1, $zero, L1	#if t1 != 0, branch

	
	move 	$t3, $t0
	addi 	$sp, $sp, 12
	jr	$ra
	
L1:
	div	$t0,$t1
	mfhi	$t2		#mod store to t2
	
	move 	$t0, $t1
	move	$t1, $t2
	
	jal	gcd

	lw   	$ra, 0($sp)
	lw	$t0, 4($sp)
	lw 	$t1, 8($sp)
	addi	$sp, $sp, 12
	jr	$ra
	
	



	



	