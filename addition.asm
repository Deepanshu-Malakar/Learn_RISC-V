#Objective: take input of 2 numbers from user and display their sum.

.data
	msg1: .string "Enter first number: "
	msg2: .string "Enter second number: "
	msg3: .string "Their sum is : "

.text
#input first number in t0
	la a0,msg1
	li a7,4
	ecall
	
	li a7,5
	ecall
	
	mv t0,a0
	
#input second number in t1	
	la a0,msg2
	li a7,4
	ecall
	
	li a7,5
	ecall
	
	mv t1,a0
	
#adding the numbers
	add t3,t1,t0
	
#displaying the result
	la a0,msg3
	li a7,4
	ecall
	
	mv a0,t3
	li a7,1
	ecall
	
#end of program	
	