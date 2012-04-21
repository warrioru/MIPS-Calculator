#This is where all of the functions will ultimately go after they're written and tested individually.
#Authors: Michelle Bergeron, Samuel Fleckenstein, Michal Yardeni

	.text
main:
	top:

		#stores the max value (0xffffffffffffffff) in $s8
		#this will be used to see if there will be overflow
	addi $t0, $zero, 32767
	addi $t1, $zero, 4
	mult $t0, $t1
	mflo $t2
	addi $t2, $t2, 8
	mult $t2, $t0
	mflo $t3
	addi $s8, $t3, 3
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	mult $zero, $zero

			#gets the operator
	la $a0, operatorEntry	#loads the address of operatorEntry into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 12		#12 is the syscall for read_character
	syscall			#makes the syscall and stores the operator string

	addi $t1, $zero, 43
	beq $v0, $t1, addition

	addi $t1, $zero, 45
	beq $v0, $t1, subtraction

	addi $t1, $zero, 42
	beq $v0, $t1, multiplication

	addi $t1, $zero, 47
	beq $v0, $t1, division

	addi $t1, $zero, 115
	beq $v0, $t1, computeSin

	addi $t1, $zero, 99
	beq $v0, $t1, computeCos

	addi $t1, $zero, 116
	beq $v0, $t1, computeTan

	addi $t1, $zero, 113
	beq $v0, $t1, quitProgram

end:
	li $v0, 10		#10 is the exit syscall
	syscall			#actually exits the program


addition:
		#gets the first number to operate on
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t0, $v0		#moves the input into $t0


		#gets the second number to operate on
	la $a0, userInput2	#loads the address of userInput4 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t1, $v0		#moves the input into $t3

	sub $s7, $s8, $t0
	sub $s7, $s7, $t1	#s7 is now negative if there will be overflow

	bltz $s7, overflowConditionAddition
	
returnToNormalAddition:
	add $s0, $t0, $t1	#s0 now contains $t0 + $t1

	bne $zero, $s1, printOverflowAddition

printNormalAddition:
	la $a0, equalsSign	#loads the address of userInput4 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	move $a0, $s0		#have to move $s0 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

subtraction:
		#gets the first number to operate on
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t0, $v0		#moves the input into $t0


		#gets the second number to operate on
	la $a0, userInput2	#loads the address of userInput4 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t1, $v0		#moves the input into $t3

	j top			#returns to the input stage

multiplication:
		#gets the first number to operate on
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t0, $v0		#moves the input into $t0


		#gets the second number to operate on
	la $a0, userInput2	#loads the address of userInput4 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t1, $v0		#moves the input into $t3

	j top			#returns to the input stage

division:
		#gets the first number to operate on
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t0, $v0		#moves the input into $t0


		#gets the second number to operate on
	la $a0, userInput2	#loads the address of userInput4 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t1, $v0		#moves the input into $t3

	j top			#returns to the input stage

computeSin:
		#gets the angle in radians
	la $a0, enterAngle	#loads the address of enterAngle into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall
	
	j top			#returns to the input stage

computeCos:
		#gets the angle in radians
	la $a0, enterAngle	#loads the address of enterAngle into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

computeTan:
		#gets the angle in radians
	la $a0, enterAngle	#loads the address of enterAngle into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

quitProgram:
	j end			#jumps to the end tag

#################################
	#ADDITION
overflowConditionAddition:
	#stores the overflow in $s1
	#what to do here?
	j returnToNormalAddition

printOverflowAddition:
	move $a0, $s1 	#have to move $s1 to $a0 because it only prints $a0
	li $v0, 1	#1 is the print_int syscall
	syscall		#makes the syscall
	j printNormalAddition
#################################

	.data
equalsSign:     .asciiz "= "
operatorEntry:	.asciiz "\nOperator:"
userInput1:	.asciiz	"\nFirst number:"
userInput2:	.asciiz "Second number:"
enterAngle:	.asciiz "\nEnter the angle in radians, using the decimal form."
