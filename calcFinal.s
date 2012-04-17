#This is where all of the functions will ultimately go after they're written and tested individually.
#Authors: Michelle Bergeron, Samuel Fleckenstein, Michal Yardeni


  .text
main:
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		        #4 is the print_string syscall
	syscall			        #makes the syscall

	li $v0, 5		        #5 is the read_int syscall
	syscall			        #makes the syscall
	move $t0, $v0		    #moves the input into $t0

	la $a0, userInput2	#loads the address of userInput2 into $a0
	li $v0, 4		        #4 is the print_string syscall
	syscall			        #makes the syscall

	li $v0, 5		        #5 is the read_int syscall
	syscall			        #makes the syscall
	move $t1, $v0		    #moves the input into $t1

	la $a0, userInput3	#loads the address of userInput3 into $a0
	li $v0, 4		        #4 is the print_string syscall
	syscall			        #makes the syscall

	li $v0, 5		        #5 is the read_int syscall
	syscall			        #makes the syscall
	move $t2, $v0	    	#moves the input into $t2

	li $v0, 10		      #10 is the exit syscall
	syscall		        	#actually exits the program

	

	.data
userInput1:	.asciiz	"Enter the most significant 32 bits of your number.\n"
userInput2:	.asciiz	"Enter the next 32 bits.\n"
userInput3:	.asciiz	"Enter the least significant bits of your number.\n"