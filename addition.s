#This is the addition function for MIPS-Calculator
#To be incorporated into the final calculator later
#Function computes the sum of the numbers in $t0 and $t1 and places it in $s0.
#I don't know at all how to make it do large numbers...
#To handle large numbers, it needs to be able to detect if there is going to be carryout into the next 32 bit chunk if say $t0 + $t3 is bigger than 32 bits.

main:
#Get first number from user and place in $t0
li $v0, 5 #5 is read int syscall
syscall #do the syscall
move $t0, $v0  #takes the user input and puts it into $t0

#Get second number from user and place in $t1
li $v0, 5 #5 is read int syscall
syscall #do the syscall
move $t1, $v0  #takes the user input and puts it into $t1

add $s0, $t0,  $t1 #takes sum of $t0 and $t1 and places it into $s0

move $a0, $s0 #get $s0 ready to print
li $v0, 1 #1 is the print integer syscall
syscall #makes the syscall


li $v0, 10 #10 is the exit syscall
syscall #make the syscall


