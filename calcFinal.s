#This is where all of the functions will ultimately go after they're written and tested individually.
#Authors: Michelle Bergeron, Samuel Fleckenstein, Michal Yardeni

 .text
main:
	top:
			#gets the operator
	la $a0, operatorEntry	#loads the address of operatorEntry into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 12		#12 is the syscall for read_character
	syscall			#makes the syscall and stores the operator string

	addi $t1, $zero, 43
	beq $v0, $t2, addition

	addi $t1, $zero, 45
	beq $v0, $t2, subtraction

	addi $t1, $zero, 42
	beq $v0, $t2, multiplication

	addi $t1, $zero, 47
	beq $v0, $t2, division

	addi $t1, $zero, 115
	beq $v0, $t2, computeSin

	addi $t1, $zero, 99
	beq $v0, $t2, computeCos

	addi $t1, $zero, 116
	beq $v0, $t2, computeTan

	addi $t1, $zero, 113
	beq $v0, $t2, quitProgram

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

	.data
operatorEntry:	.asciiz "Operator:"
userInput1:	.asciiz	"First number:"
userInput2:	.asciiz "Second number:"
enterAngle:	.asciiz "Enter the angle in radians, using the decimal form."
