.data
msg1:	.asciiz "Pascal Triangle \n"
msg2:	.asciiz "Please enter the number of levels(1~30):\n "
spacemsg:    .asciiz "  "
nl:     .asciiz "\n"



.text
.globl main



main:   
        
        li      $v0, 4         # printString1
        la      $a0, msg1
        syscall

        li      $v0, 4         # printString2
        la      $a0, msg2
        syscall

#read input#read input#read input#read input#read input
	li      $v0, 5         # readInt

        syscall                # return $v0
        move    $t0, $v0       # $t0 = input levels



	move $s0, $zero 		# i = 0=s0
for1tst: 
	slt $t1, $s0, $t0 	
	beq $t1, $zero, exit1 		# go to exit1 if i!<n
	move $s1, $zero 		# j = 0=s1
for2tst: 
	slt $t4, $s0, $s1 		# s1>s0
	bne $t4, $zero, exit2 		# go to exit2 if s1>s0

	beq $s1, $zero, equal	#if j==0	
	beq $s1, $s0, equal  	 #if j==i

	sub $t3, $s0, $s1		
	addi $t3, $t3, 1
	mul $v1, $v1, $t3
	div $v1, $v1, $s1    		#v1=temp
#print #print #print #print #print #print #print #print #print #print 
	li		$v0, 4
	la 		$a0, spacemsg    #print" "
	syscall

	li	$v0, 1
	move 	$a0, $v1
	syscall

	addi $s1, $s1, 1 		# j += 1
	j for2tst 			# jump to test of inner loop

equal:
	addi 		$v1, $zero, 1
#################### #print #print #print #print #print #print #print #print 
	li		$v0, 4
	la 		$a0, spacemsg    #print" "
	syscall

	
	li	$v0, 1
	move 	$a0, $v1
	syscall
##############################print #print #print #print #print #print #print #print #print #print 
	addi $s1, $s1, 1 		# j += 1
	j for2tst 			# jump to test of inner loop

	

	
exit2: 

	li		$v0, 4
	la 		$a0, nl    #print"/n"
	syscall

	addi $s0, $s0, 1 	# i += 1
	j for1tst 			# jump to test of outer loop




exit1: 
	li		$v0, 10		# call system call exit
	syscall








	
