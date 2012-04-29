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

	li $v0, 5		#5 is the syscall for read_int
	syscall			#makes the syscall and stores the operator string
	addi $t7, $v0, 0

	addi $t1, $zero, 1	#1 is +
	beq $t7, $t1, addition

	addi $t1, $zero, 2	#2 is -
	beq $t7, $t1, subtraction

	addi $t1, $zero, 3	#3 is *
	beq $t7, $t1, multiplication

	addi $t1, $zero, 4	#4 is /
	beq $t7, $t1, division

	addi $t1, $zero, 5	#5 is ^
	beq $t7, $t1, exponential

	addi $t1, $zero, 6	#6 is sin
	beq $t7, $t1, computeSin

	addi $t1, $zero, 7	#7 is cos
	beq $t7, $t1, computeCos

	addi $t1, $zero, 8	#8 is tan
	beq $t7, $t1, computeTan

	addi $t1, $zero, 9	#9 is cosecant
	beq $t7, $t1, computeCosec

	addi $t1, $zero, 10	#10 is secant
	beq $t7, $t1, computeSec

	addi $t1, $zero, 11	#11 is cotangent
	beq $t7, $t1, computeCotan

	addi $t1, $zero, 0	#0 is quit
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

addition:
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 7		#7 is the read_double syscall
	syscall			#makes the syscall
	mov.d $f2, $f0		#moves the input into $f6

		#gets the second number to operate on
	la $a0, userInput2	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 7		#7 is the read_double syscall
	syscall			#makes the syscall
	mov.d $f4, $f0		#moves the input into $f2

	add.d $f6, $f2, $f4	#$f6 = $f2 + $f4

	mov.d $f12, $f2		#have to move $f2 to $f12 because it only prints $f12
	li $v0, 3		#1 is the print_float syscall
	syscall			#makes the syscall

	la $a0, addSign		#loads the address of addSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f4		#have to move $f4 to $f12 because it only prints $f12
	li $v0, 3		#2 is the print_float syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f6		#have to move $f6 to $f12 because it only prints $f12
	li $v0, 3		#2 is the print_float syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

subtraction:
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 7		#6 is the read_float syscall
	syscall			#makes the syscall
	mov.d $f2, $f0		#moves the input into $f6

		#gets the second number to operate on
	la $a0, userInput2	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 7		#6 is the read_float syscall
	syscall			#makes the syscall
	mov.d $f4, $f0		#moves the input into $f2

	sub.d $f6, $f2, $f4	#$f6 = $f2 - $f4

	mov.d $f12, $f2		#have to move $f2 to $f12 because it only prints $f12
	li $v0, 3		#1 is the print_double syscall
	syscall			#makes the syscall

	la $a0, minusSign	#loads the address of minusSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f4		#have to move $f4 to $f12 because it only prints $f12
	li $v0, 3		#2 is the print_double syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f6		#have to move $f6 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

multiplication:
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 7		#6 is the read_float syscall
	syscall			#makes the syscall
	mov.d $f2, $f0		#moves the input into $f6

		#gets the second number to operate on
	la $a0, userInput2	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 7		#7 is the read_double syscall
	syscall			#makes the syscall
	mov.d $f4, $f0		#moves the input into $f2

	mul.d $f6, $f2, $f4	#$f6 = $f2 * $f4

	mov.d $f12, $f2		#have to move $f2 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	la $a0, timesSign	#loads the address of timesSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f4		#have to move $f4 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f6		#have to move $f6 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

division:
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 7		#6 is the read_float syscall
	syscall			#makes the syscall
	mov.d $f2, $f0		#moves the input into $f6

		#gets the second number to operate on
	la $a0, userInput2	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 7		#7 is the read_double syscall
	syscall			#makes the syscall
	mov.d $f4, $f0		#moves the input into $f2

	l.d $f16, numberZero	#$f16 = 0
	
	c.eq.d $f4, $f16	#if $f4 == f16, floating point condition flag = true

	bc1t divZero		#if floating point condition flag = true, goto divZero

	div.d $f6, $f2, $f4	#$f6 = $f2 / $f4

	mov.d $f12, $f2		#have to move $f2 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	la $a0, divideSign	#loads the address of timesSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f4		#have to move $f4 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f6		#have to move $f6 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

divZero: 
		#Safely returns the user to the top of the program if they are trying to divide by zero.
	la $a0, divZeroMessage	#loads the address of divZeroMessage into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	j top 			#returns to the input stage

exponential:
	la $a0, userInput1	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t0, $v0		#moves the input into $f6

		#gets the second number to operate on
	la $a0, userInput2	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 5		#5 is the read_int syscall
	syscall			#makes the syscall
	move $t1, $v0		#moves the input into $f2

	addi $t2, $zero, 0	#$t2 is the loop counter
	li $s0, 1		#$s0 will contain the result

	addi $t3, $zero, 0	#$t3 = 0

	beq $t3, $t2, expZero	#if $t2 = 0, goto expZero

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

expZero: 
	addi $s0, $zero, 1	#$s0 = 1

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

	j top 			#returns to the input stage

computeSin:
		#stores the user input in $f2, $f6 will be the output
	la $a0, enterAngle	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 7		#7 is the read_double syscall
	syscall			#makes the syscall
	mov.d $f2, $f0		#moves the input into $f2

	l.d $f4, numberZero

	mul.d $f4, $f2, $f2	#$f4 = x^2
	mul.d $f4, $f4, $f2	#$f4 = x^3

	l.d $f8, threeFactorial	#$f8 = 3!
	div.d $f10, $f4, $f8	#$f10 = x^3 / 3!
	
	sub.d $f6, $f2, $f10	#$f6 = x - x^3/3!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^5

	l.d $f8, fiveFactorial
	div.d $f10, $f4, $f8	#$f10 = x^5 / 5!

	add.d $f6, $f6, $f10	#$f6 = x - x^3/3! + x^5 / 5!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^7

	l.d $f8, sevenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^7 / 7!

	sub.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^9

	l.d $f8, nineFactorial
	div.d $f10, $f4, $f8	#$f10 = x^9 / 9!

	add.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^11

	l.d $f8, elevenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^11 / 11!

	sub.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!

	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^13

	l.d $f8, thirteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^13 / 13!

	add.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^15

	l.d $f8, fifteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^15 / 15!

	sub.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^17

	l.d $f8, seventeenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^17 / 17!

	add.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!+x^17/17!

	la $a0, printSin	#loads the address of printSin into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f2		#have to move $f2 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	la $a0, closeParen	#loads the address of closeParentheses into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f6		#have to move $t0 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

computeCos:
			#stores the user input in $f2, $f6 will be the output
	la $a0, enterAngle	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 6		#5 is the read_float syscall
	syscall			#makes the syscall
	mov.d $f2, $f0		#moves the input into $f2

	l.d $f4, numberZero
	l.d $f14, numberOne

	mul.d $f4, $f2, $f2	#$f4 = x^2

	l.d $f8, twoFactorial	#$f8 = 2!
	div.d $f10, $f4, $f8	#$f10 = x^2 / 2!
	
	sub.d $f6, $f14, $f10	#$f6 = 1 - x^2/2!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^4

	l.d $f8, fourFactorial
	div.d $f10, $f4, $f8	#$f10 = x^4 / 4!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^6

	l.d $f8, sixFactorial
	div.d $f10, $f4, $f8	#$f10 = x^6 / 6!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^8

	l.d $f8, eightFactorial
	div.d $f10, $f4, $f8	#$f10 = x^8 / 8!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^10

	l.d $f8, tenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^10 / 10!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!

	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^12

	l.d $f8, twelveFactorial
	div.d $f10, $f4, $f8	#$f10 = x^12 / 12!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^14

	l.d $f8, fourteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^14 / 14!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^16

	l.d $f8, sixteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^16 / 16!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!+x^16/16!

	la $a0, printCos	#loads the address of printCos into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f2		#have to move $f2 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	la $a0, closeParen	#loads the address of closeParentheses into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f6		#have to move $t0 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

computeTan:
		#stores the user input in $f2
	la $a0, enterAngle	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 6		#5 is the read_float syscall
	syscall			#makes the syscall
	mov.d $f2, $f0		#moves the input into $f2

		#Computes cos(x) and stores in $f6

	l.d $f4, numberZero
	l.d $f14, numberOne

	mul.d $f4, $f2, $f2	#$f4 = x^2

	l.d $f8, twoFactorial	#$f8 = 2!
	div.d $f10, $f4, $f8	#$f10 = x^2 / 2!
	
	sub.d $f6, $f14, $f10	#$f6 = 1 - x^2/2!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^4

	l.d $f8, fourFactorial
	div.d $f10, $f4, $f8	#$f10 = x^4 / 4!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^6

	l.d $f8, sixFactorial
	div.d $f10, $f4, $f8	#$f10 = x^6 / 6!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^8

	l.d $f8, eightFactorial
	div.d $f10, $f4, $f8	#$f10 = x^8 / 8!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^10

	l.d $f8, tenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^10 / 10!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!

	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^12

	l.d $f8, twelveFactorial
	div.d $f10, $f4, $f8	#$f10 = x^12 / 12!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^14

	l.d $f8, fourteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^14 / 14!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^16

	l.d $f8, sixteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^16 / 16!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!+x^16/16!




	#Computes sin(x) and stores in $f16

		l.d $f4, numberZero

	mul.d $f4, $f2, $f2	#$f4 = x^2
	mul.d $f4, $f4, $f2	#$f4 = x^3

	l.d $f8, threeFactorial	#$f8 = 3!
	div.d $f10, $f4, $f8	#$f10 = x^3 / 3!
	
	sub.d $f6, $f2, $f10	#$f6 = x - x^3/3!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^5

	l.d $f8, fiveFactorial
	div.d $f10, $f4, $f8	#$f10 = x^5 / 5!

	add.d $f6, $f6, $f10	#$f6 = x - x^3/3! + x^5 / 5!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^7

	l.d $f8, sevenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^7 / 7!

	sub.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^9

	l.d $f8, nineFactorial
	div.d $f10, $f4, $f8	#$f10 = x^9 / 9!

	add.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^11

	l.d $f8, elevenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^11 / 11!

	sub.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!

	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^13

	l.d $f8, thirteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^13 / 13!

	add.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^15

	l.d $f8, fifteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^15 / 15!

	sub.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^17

	l.d $f8, seventeenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^17 / 17!

	add.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!+x^17/17!


	div.d $f18, $f16, $f6	#$f18 = sin(x)/cos(x)

	la $a0, printTan	#loads the address of printCos into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f2		#have to move $f18 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	la $a0, closeParen	#loads the address of closeParentheses into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f18	#have to move $t0 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

computeCosec:
		#stores the user input in $f2, $f6 will be the output
	la $a0, enterAngle	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 7		#7 is the read_double syscall
	syscall			#makes the syscall
	mov.d $f2, $f0		#moves the input into $f2

	
	l.d $f4, numberZero

	mul.d $f4, $f2, $f2	#$f4 = x^2
	mul.d $f4, $f4, $f2	#$f4 = x^3

	l.d $f8, threeFactorial	#$f8 = 3!
	div.d $f10, $f4, $f8	#$f10 = x^3 / 3!
	
	sub.d $f6, $f2, $f10	#$f6 = x - x^3/3!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^5

	l.d $f8, fiveFactorial
	div.d $f10, $f4, $f8	#$f10 = x^5 / 5!

	add.d $f6, $f6, $f10	#$f6 = x - x^3/3! + x^5 / 5!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^7

	l.d $f8, sevenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^7 / 7!

	sub.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^9

	l.d $f8, nineFactorial
	div.d $f10, $f4, $f8	#$f10 = x^9 / 9!

	add.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^11

	l.d $f8, elevenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^11 / 11!

	sub.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!

	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^13

	l.d $f8, thirteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^13 / 13!

	add.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^15

	l.d $f8, fifteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^15 / 15!

	sub.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^17

	l.d $f8, seventeenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^17 / 17!

	add.d $f6, $f6, $f10	#$f6 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!+x^17/17!

	l.d $f14, numberOne

	div.d $f6, $f14, $f6

	la $a0, printCsc	#loads the address of printCsc into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f2		#have to move $f2 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	la $a0, closeParen	#loads the address of closeParentheses into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f6		#have to move $f6 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

computeSec:
						#stores the user input in $f2, $f6 will be the output
	la $a0, enterAngle	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 7		#7 is the read_double syscall
	syscall			#makes the syscall
	mov.d $f2, $f0		#moves the input into $f2

	l.d $f4, numberZero
	l.d $f14, numberOne

	mul.d $f4, $f2, $f2	#$f4 = x^2

	l.d $f8, twoFactorial	#$f8 = 2!
	div.d $f10, $f4, $f8	#$f10 = x^2 / 2!
	
	sub.d $f6, $f14, $f10	#$f6 = 1 - x^2/2!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^4

	l.d $f8, fourFactorial
	div.d $f10, $f4, $f8	#$f10 = x^4 / 4!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^6

	l.d $f8, sixFactorial
	div.d $f10, $f4, $f8	#$f10 = x^6 / 6!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^8

	l.d $f8, eightFactorial
	div.d $f10, $f4, $f8	#$f10 = x^8 / 8!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^10

	l.d $f8, tenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^10 / 10!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!

	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^12

	l.d $f8, twelveFactorial
	div.d $f10, $f4, $f8	#$f10 = x^12 / 12!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^14

	l.d $f8, fourteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^14 / 14!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^16

	l.d $f8, sixteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^16 / 16!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!+x^16/16!

	l.d $f14, numberOne

	div.d $f6, $f14, $f6

	la $a0, printSec	#loads the address of printSec into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f2		#have to move $f18 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	la $a0, closeParen	#loads the address of closeParentheses into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f6		#have to move $f6 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

computeCotan:
		#stores the user input in $f2
	la $a0, enterAngle	#loads the address of userInput1 into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	li $v0, 6		#5 is the read_float syscall
	syscall			#makes the syscall
	mov.d $f2, $f0		#moves the input into $f2

		#Computes cos(x) and stores in $f6

	l.d $f4, numberZero
	l.d $f14, numberOne

	mul.d $f4, $f2, $f2	#$f4 = x^2

	l.d $f8, twoFactorial	#$f8 = 2!
	div.d $f10, $f4, $f8	#$f10 = x^2 / 2!
	
	sub.d $f6, $f14, $f10	#$f6 = 1 - x^2/2!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^4

	l.d $f8, fourFactorial
	div.d $f10, $f4, $f8	#$f10 = x^4 / 4!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^6

	l.d $f8, sixFactorial
	div.d $f10, $f4, $f8	#$f10 = x^6 / 6!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^8

	l.d $f8, eightFactorial
	div.d $f10, $f4, $f8	#$f10 = x^8 / 8!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^10

	l.d $f8, tenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^10 / 10!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!

	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^12

	l.d $f8, twelveFactorial
	div.d $f10, $f4, $f8	#$f10 = x^12 / 12!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^14

	l.d $f8, fourteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^14 / 14!

	sub.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^16

	l.d $f8, sixteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^16 / 16!

	add.d $f6, $f6, $f10	#$f6 = 1-x^2/2!+x^4/4!-x^6/6!+x^8/8!-x^10/10!+x^12/12!-x^14/14!+x^16/16!


		#Computes sin(x) and stores in $f16

	l.d $f4, numberZero

	mul.d $f4, $f2, $f2	#$f4 = x^2
	mul.d $f4, $f4, $f2	#$f4 = x^3

	l.d $f8, threeFactorial	#$f8 = 3!
	div.d $f10, $f4, $f8	#$f10 = x^3 / 3!
	
	sub.d $f16, $f2, $f10	#$f16 = x - x^3/3!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^5

	l.d $f8, fiveFactorial
	div.d $f10, $f4, $f8	#$f10 = x^5 / 5!

	add.d $f16, $f16, $f10	#$f16 = x - x^3/3! + x^5 / 5!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^7

	l.d $f8, sevenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^7 / 7!

	sub.d $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^9

	l.d $f8, nineFactorial
	div.d $f10, $f4, $f8	#$f10 = x^9 / 9!

	add.d $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^11

	l.d $f8, elevenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^11 / 11!

	sub.d $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!

	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^13

	l.d $f8, thirteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^13 / 13!

	add.d $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^15

	l.d $f8, fifteenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^15 / 15!

	sub.d $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!


	mul.d $f4, $f4, $f2
	mul.d $f4, $f4, $f2	#$f4 = x^17

	l.d $f8, seventeenFactorial
	div.d $f10, $f4, $f8	#$f10 = x^17 / 17!

	add.d $f16, $f16, $f10	#$f16 = x-x^3/3!+x^5/5!-x^7/7!+x^9/9!-x^11/11!+x^13/13!-x^15/15!+x^17/17!


	div.d $f18, $f6, $f16	#$f18 = cos(x)/sin(x)


	la $a0, printCot	#loads the address of printCot into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f2		#have to move $f18 to $f12 because it only prints $f12
	li $v0, 3		#3 is the print_double syscall
	syscall			#makes the syscall

	la $a0, closeParen	#loads the address of closeParentheses into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	la $a0, equalsSign	#loads the address of equalsSign into $a0
	li $v0, 4		#4 is the print_string syscall
	syscall			#makes the syscall

	mov.d $f12, $f18	#have to move $t0 to $f12 because it only prints $f12
	li $v0, 3		#2 is the print_double syscall
	syscall			#makes the syscall

	j top			#returns to the input stage

quitProgram:
	j end			#jumps to the end tag

	.data
welcome: 	.asciiz "MIPS Calculator \nSupported operations: \n1. Addition \n2. Subtraction \n3. Multiplication \n4. Division \n5. Exponentiation \n6. Sine \n7. 

Cosine \n8. Tangent \n9. Cosecant \n10. Secant \n11. Cotangent \n0. Quit \n"
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
printCsc:	.asciiz "csc("
printSec:	.asciiz "sec("
printCot:	.asciiz "cot("
closeParen:	.asciiz ")"
printExp:	.asciiz "^"
divZeroMessage: .asciiz "Cannot divide by zero."
badOperator: 	.asciiz "Command not recognized. Please try again."
numberZero:	.double 0.0
numberOne:	.double 1.0

	#these are used to calculate sine
threeFactorial:	.double 6.0
fiveFactorial:	.double 120.0
sevenFactorial:	.double 5040.0
nineFactorial:	.double 362880.0
elevenFactorial:.double 39916800.0
thirteenFactorial:.double 6227020800.0
fifteenFactorial:.double 1307674368000.0
seventeenFactorial:.double 355687428096000.0

	#these are used to calculate cosine
twoFactorial:	.double 2.0
fourFactorial:	.double 24.0
sixFactorial:	.double 720.0
eightFactorial:	.double 40320.0
tenFactorial:	.double 3628800.0
twelveFactorial:.double 479001600.0
fourteenFactorial:.double 87178291299.0
sixteenFactorial:.double 20922789888000.0