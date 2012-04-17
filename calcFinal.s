#This is where all of the functions will ultimately go after they're written and tested individually.
#Authors: Michelle Bergeron, Samuel Fleckenstein, Michal Yardeni


 	.text
main:
		#gets the first number to operate on
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t0, $v0		#moves the input into $t0

	la $a0, userInput2	#loads the address of userInput2 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t1, $v0		#moves the input into $t1

	la $a0, userInput3	#loads the address of userInput3 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t2, $v0		#moves the input into $t2


		#gets the operator
	la $a0, operatorEntry	#loads the address of operatorEntry into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 8		#8 is the syscall for read_string
	la $a0, theOperator	#$a0 now contains the address of theOperator
	li $a1, 64		#length of the operator set to 64 bytes
	syscall			#makes the syscall and stores the operator string


		#gets the second number to operate on
	la $a0, userInput4	#loads the address of userInput4 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t3, $v0		#moves the input into $t3

	la $a0, userInput5	#loads the address of userInput5 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t4, $v0		#moves the input into $t5

	la $a0, userInput6	#loads the address of userInput6 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t5, $v0		#moves the input into $t6

	li $v0, 10		#10 is the exit syscall
	syscall			#actually exits the program

	

	.data
userInput1:	.asciiz	"Enter the most significant 32 bits of the first number.\n"
userInput2:	.asciiz	"Enter the next 32 bits.\n"
userInput3:	.asciiz	"Enter the least significant bits of the first number.\n"
operatorEntry:	.asciiz "Enter the operator.\n"
userInput4:	.asciiz "Enter the most significant 32 bits of the second number.\n"
userInput5:	.asciiz "Enter the next 32 bits.\n"
userInput6:	.asciiz "Enter the least significant bits of the second number.\n"
theOperator:	.space 64