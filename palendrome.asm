#check whether a number is palendrome or not
.data	
	msg:		.string	"Enter number : "
	msg1:	.string	"It is palendrome"
	msg2:	.string	"It is not palendrome"
.text
#pseduocode
#n=input("Enter number")
#x=n
#nn=new_number=0
#i=0
#while(n>0):
#	digit=n%10
#	n=n/10
#	nn=nn*10+digit
#if(x == nn):
#	print( palendrome)
#else
#	print(not palendrome)
palendrome:
	la	a0,msg
	li	a7,4
	ecall
	li	a7,5
	ecall
	mv	t0,a0	#t0 contains required number
	mv	s0,t0		#s0 contains copy of original number
	li	t1,0		#t1 = new_number
	li	s1,10
	while_loop:	beqz	s0,exit_while_loop
				rem	t2,s0,s1				#t2 = digit = n%10
				div	s0,s0,s1
				mul	t1,t1,s1
				add	t1,t1,t2			
				jal	while_loop
	exit_while_loop:

	if:			bne	t0,t1,else
				la	a0,msg1
				li	a7,4
				ecall
				jal	exit_if
	else:
				la	a0,msg2
				li	a7,4
				ecall
	exit_if:
				li	a7,10
				ecall
	