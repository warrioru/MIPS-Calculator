	.text
main:

	#Prints out supported operators
	la $a0, welcome 	#loads the address of welcome into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	top:
			#gets the operator
	la $a0, operatorEntry	#loads the address of operatorEntry into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 12		#12 is the syscall for read_character
	syscall			#makes the syscall and stores the operator string
	addi $t7, $v0, 0

	addi $t1, $zero, 43	#43 is +
	beq $t7, $t1, userInputOperators

	addi $t1, $zero, 45	#45 is -
	beq $t7, $t1, userInputOperators

	addi $t1, $zero, 42	#42 is *
	beq $t7, $t1, userInputOperators

	addi $t1, $zero, 47	#47 is /
	beq $t7, $t1, division

	addi $t1, $zero, 94	#94 is ^
	beq $t7, $t1, userInputOperators

	addi $t1, $zero, 115	#115 is s
	beq $t7, $t1, computeSin

	addi $t1, $zero, 99	#99 is c
	beq $t7, $t1, computeCos

	addi $t1, $zero, 116	#116 is t
	beq $t7, $t1, computeTan

	addi $t1, $zero, 113	#113 is q
	beq $t7, $t1, quitProgram

	#If the program gets to here, then the user didn't do it right.
	#Start the program over: 

	la $a0, badOperator	#loads the address of badOperator into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	j top			#Has the user try again with user input. 

end:
	li $v0, 10		#10 is the exit syscall
	syscall			#actually exits the program

userInputOperators:
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
	move $t1, $v0		#moves the input into $t1

	addi $t9, $zero, 43	#43 is +
	beq $t7, $t9, addition	

	addi $t9, $zero, 45	#45 is -
	beq $t7, $t9, subtraction

	addi $t9, $zero, 42	#42 is *
	beq $t7, $t9, multiplication

	#addi $t9, $zero, 47	#47 is /
	#beq $t7, $t9, division

	addi $t9, $zero, 94	#94 is ^
	beq $t7, $t9, exponential

addition:
	add $s0, $t0, $t1	#s0 now contains $t0 + $t1

	move $a0, $t0		#have to move $t0 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	la $a0, addSign		#loads the address of minussSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	move $a0, $t1		#have to move $t1 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	move $a0, $s0		#have to move $s0 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

subtraction:
		#assumes the input is in $t0 and $t1

	sub $s0, $t0, $t1	#$s0 now contains $t0 - $t1

	move $a0, $t0		#have to move $t0 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	la $a0, minusSign	#loads the address of minussSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	move $a0, $t1		#have to move $t1 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	move $a0, $s0		#have to move $s0 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

multiplication:
		#assumes the input is in $t0 and $t1
	addi $t2, $zero, 1
	addi $s0, $t0, 0
	addi $t4, $t1, 1

		multLoop:
	addi $t2, $t2, 1
	slt $t3, $t2, $t4
	bne $t3, $zero, addMult

	move $a0, $t0		#have to move $t0 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	la $a0, timesSign	#loads the address of minussSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	move $a0, $t1		#have to move $t1 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	move $a0, $s0		#have to move $s0 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

division:

		#this uses different input than usual because it needs to handle floats
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 6		#6 is the read_float syscall
	syscall			#makes the syscall
	mov.s $f2, $f0		#moves the input into $f6

		#gets the second number to operate on
	la $a0, userInput2	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 6		#6 is the read_float syscall
	syscall			#makes the syscall
	mov.s $f4, $f0		#moves the input into $f2

	l.s $f16, numberZero	#$f16 = 0
	
	c.eq.s $f4, $f16	#if $f4 == f16, floating point condition flag = true

	bc1t divZero		#if floating point condition flag = true, goto divZero

	div.s $f6, $f2, $f4	#$f6 = $f2 / $f4

	mov.s $f12, $f2		#have to move $f2 to $f12 because it only prints $f12
	li $v0, 2		#1 is the print_float syscall
	syscall			#makes the syscall

	la $a0, divideSign	#loads the address of divideSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.s $f12, $f4		#have to move $f4 to $f12 because it only prints $f12
	li $v0, 2		#2 is the print_float syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.s $f12, $f6		#have to move $f6 to $f12 because it only prints $f12
	li $v0, 2		#2 is the print_float syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

divZero: 
		#Safely returns the user to the top of the program if they are trying to divide by zero.
	la $a0, divZeroMessage	#loads the address of divZeroMessage into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	j top 			#returns to the input stage

exponential:
		#assumes the input is in $t0 and $t1
	addi $t2, $zero, 0	#$t2 is the loop counter
	#addi $t4, $t1, 0	#$t4 is the loop termination condition
	li $s0, 1		#$s0 will contain the result

		expLoop:
	addi $t2, $t2, 1	#i++
	mult $s0, $t0		#lo = $s0 * $t0
	mflo $s0		#$s0 = lo
	slt $t3, $t2, $t1	#if $t2 < $t4 then $t3 = 1 
	bne $t3, $zero, expLoop	#if $t3 != 0 goto expLoop

	move $a0, $t0		#have to move $t0 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	la $a0, printExp	#loads the address of printExp into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	move $a0, $t1		#have to move $t1 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	move $a0, $s0		#have to move $s0 to $a0 because it only prints $a0
	li $v0, 1		#1 is the print_int syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

computeSin:
		#stores the user input in $f2, $f6 will be the output
	la $a0, enterAngle	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 6		#5 is the read_float syscall
	syscall			#makes the syscall
	mov.s $f2, $f0		#moves the input into $f2

	l.s $f4, numberZero

	mul.s $f4, $f2, $f2	#$f4 = x^2
	mul.s $f4, $f4, $f2	#$f4 = x^3

	l.s $f8, threeFactorial	#$f8 = 3!
	div.s $f10, $f4, $f8	#$f10 = x^3 / 3!
	
	sub.s $f6, $f2, $f10	#$f6 = x - x^3/3!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^5

	l.s $f8, fiveFactorial
	div.s $f10, $f4, $f8	#$f10 = x^5 / 5!

	add.s $f6, $f6, $f10	#$f6 = x - x^3/3! + x^5 / 5!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^7

	l.s $f8, sevenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^7 / 7!

	sub.s $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^9

	l.s $f8, nineFactorial
	div.s $f10, $f4, $f8	#$f10 = x^9 / 9!

	add.s $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^11

	l.s $f8, elevenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^11 / 11!

	sub.s $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!

	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^13

	l.s $f8, thirteenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^13 / 13!

	add.s $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^15

	l.s $f8, fifteenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^15 / 15!

	sub.s $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^17

	l.s $f8, seventeenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^17 / 17!

	add.s $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!+x^17/17!

	la $a0, printSin	#loads the address of printSin into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.s $f12, $f2		#have to move $f2 to $f12 because it only prints $f12
	li $v0, 2		#2 is the print_float syscall
	syscall			#makes the syscall

	la $a0, closeParen	#loads the address of closeParentheses into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.s $f12, $f6		#have to move $t0 to $f12 because it only prints $f12
	li $v0, 2		#2 is the print_float syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

computeCos:
			#stores the user input in $f2, $f6 will be the output
	la $a0, enterAngle	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 6		#5 is the read_float syscall
	syscall			#makes the syscall
	mov.s $f2, $f0		#moves the input into $f2

	l.s $f4, numberZero
	l.s $f14, numberOne

	mul.s $f4, $f2, $f2	#$f4 = x^2

	l.s $f8, twoFactorial	#$f8 = 2!
	div.s $f10, $f4, $f8	#$f10 = x^2 / 2!
	
	sub.s $f6, $f14, $f10	#$f6 = 1 - x^2/2!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^4

	l.s $f8, fourFactorial
	div.s $f10, $f4, $f8	#$f10 = x^4 / 4!

	add.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^6

	l.s $f8, sixFactorial
	div.s $f10, $f4, $f8	#$f10 = x^6 / 6!

	sub.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^8

	l.s $f8, eightFactorial
	div.s $f10, $f4, $f8	#$f10 = x^8 / 8!

	add.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^10

	l.s $f8, tenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^10 / 10!

	sub.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!

	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^12

	l.s $f8, twelveFactorial
	div.s $f10, $f4, $f8	#$f10 = x^12 / 12!

	add.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^14

	l.s $f8, fourteenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^14 / 14!

	sub.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^16

	l.s $f8, sixteenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^16 / 16!

	add.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!+x^16/16!

	la $a0, printCos	#loads the address of printCos into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.s $f12, $f2		#have to move $f2 to $f12 because it only prints $f12
	li $v0, 2		#2 is the print_float syscall
	syscall			#makes the syscall

	la $a0, closeParen	#loads the address of closeParentheses into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.s $f12, $f6		#have to move $t0 to $f12 because it only prints $f12
	li $v0, 2		#2 is the print_float syscall
	syscall			#makes the syscall
	j top			#returns to the input stage

computeTan:
		#stores the user input in $f2
	la $a0, enterAngle	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 6		#5 is the read_float syscall
	syscall			#makes the syscall
	mov.s $f2, $f0		#moves the input into $f2





	#Computes cos(x) and stores in $f6

	l.s $f4, numberZero
	l.s $f14, numberOne

	mul.s $f4, $f2, $f2	#$f4 = x^2

	l.s $f8, twoFactorial	#$f8 = 2!
	div.s $f10, $f4, $f8	#$f10 = x^2 / 2!
	
	sub.s $f6, $f14, $f10	#$f6 = 1 - x^2/2!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^4

	l.s $f8, fourFactorial
	div.s $f10, $f4, $f8	#$f10 = x^4 / 4!

	add.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^6

	l.s $f8, sixFactorial
	div.s $f10, $f4, $f8	#$f10 = x^6 / 6!

	sub.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^8

	l.s $f8, eightFactorial
	div.s $f10, $f4, $f8	#$f10 = x^8 / 8!

	add.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^10

	l.s $f8, tenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^10 / 10!

	sub.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!

	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^12

	l.s $f8, twelveFactorial
	div.s $f10, $f4, $f8	#$f10 = x^12 / 12!

	add.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^14

	l.s $f8, fourteenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^14 / 14!

	sub.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^16

	l.s $f8, sixteenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^16 / 16!

	add.s $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!+x^16/16!




	#Computes sin(x) and stores in $f16

	l.s $f4, numberZero

	mul.s $f4, $f2, $f2	#$f4 = x^2
	mul.s $f4, $f4, $f2	#$f4 = x^3

	l.s $f8, threeFactorial	#$f8 = 3!
	div.s $f10, $f4, $f8	#$f10 = x^3 / 3!
	
	sub.s $f16, $f2, $f10	#$f6 = x - x^3/3!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^5

	l.s $f8, fiveFactorial
	div.s $f10, $f4, $f8	#$f10 = x^5 / 5!

	add.s $f16, $f16, $f10	#$f16 = x - x^3/3! + x^5 / 5!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^7

	l.s $f8, sevenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^7 / 7!

	sub.s $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^9

	l.s $f8, nineFactorial
	div.s $f10, $f4, $f8	#$f10 = x^9 / 9!

	add.s $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^11

	l.s $f8, elevenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^11 / 11!

	sub.s $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!

	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^13

	l.s $f8, thirteenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^13 / 13!

	add.s $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^15

	l.s $f8, fifteenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^15 / 15!

	sub.s $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!


	mul.s $f4, $f4, $f2
	mul.s $f4, $f4, $f2	#$f4 = x^17

	l.s $f8, seventeenFactorial
	div.s $f10, $f4, $f8	#$f10 = x^17 / 17!

	add.s $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!+x^17/17!




	div.s $f18, $f16, $f6	#$f18 = sin(x)/cos(x)

	la $a0, printTan	#loads the address of printCos into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.s $f12, $f2		#have to move $f18 to $f12 because it only prints $f12
	li $v0, 2		#2 is the print_float syscall
	syscall			#makes the syscall

	la $a0, closeParen	#loads the address of closeParentheses into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.s $f12, $f18	#have to move $t0 to $f12 because it only prints $f12
	li $v0, 2		#2 is the print_float syscall
	syscall			#makes the syscall
	j top			#returns to the input stage

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

addMult:
		#assumes the input is in $t0 and $t1
	sub $s7, $s8, $t0
	sub $s7, $s7, $t0	#s7 is now negative if there will be overflow

	#bltz $s7, overflowConditionAdditionMult
	
		returnToNormalAdditionMult:
	add $s0, $s0, $t0	#s0 now contains $s0 + $t0

	j multLoop

#################################
	#ADDITION
overflowConditionAdditionMult:
	#stores the overflow in $s1
	#what to do here?
	j returnToNormalAddition

printOverflowAdditionMult:
	move $a0, $s1 	#have to move $s1 to $a0 because it only prints $a0
	li $v0, 1	#1 is the print_int syscall
	syscall		#makes the syscall
	j printNormalAddition
#################################

	.data
welcome: 	.asciiz "MIPS Calculator \nSupported operations: \nAddition (+)   Subtraction (-) \nMultiplication (*)   Division (/) \nExponentiation (^)  Sine  (s)
Cosine (c)   Tangent (t) \n "
addSign:	.asciiz " + "
minusSign:	.asciiz " - "
timesSign:	.asciiz " * "
divideSign:	.asciiz " / "
equalsSign:     .asciiz " = "
operatorEntry:	.asciiz "\nOperator: "
userInput1:	.asciiz	"\nFirst number: "
userInput2:	.asciiz "Second number: "
enterAngle:	.asciiz "\nEnter the angle in radians, using the decimal form: "
printSin:	.asciiz "sin("
printCos:	.asciiz "cos("
printTan:	.asciiz "tan("
closeParen:	.asciiz ")"
printExp:	.asciiz "^"
divZeroMessage: .asciiz "Cannot divide by zero."
badOperator: 	.asciiz "Command not recognized. Please try again."
numberZero:	.float 0.0
numberOne:	.float 1.0

	#these are used to calculate sine
threeFactorial:	.float 6.0
fiveFactorial:	.float 120.0
sevenFactorial:	.float 5040.0
nineFactorial:	.float 362880.0
elevenFactorial:.float 39916800.0
thirteenFactorial:.float 6227020800.0
fifteenFactorial:.float 1307674368000.0
seventeenFactorial:.float 355687428096000.0

	#these are used to calculate cosine
twoFactorial:	.float 2.0
fourFactorial:	.float 24.0
sixFactorial:	.float 720.0
eightFactorial:	.float 40320.0
tenFactorial:	.float 3628800.0
twelveFactorial:.float 479001600.0
fourteenFactorial:.float 87178291299.0
sixteenFactorial:.float 20922789888000.0