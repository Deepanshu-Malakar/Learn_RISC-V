#prime number
.data
	msg:			.string	"Enter number : "
	prime_msg:	.string	"It is prime number"
	not_prime_msg:	.string	"It is not a prime number"
.text

check_prime:
	#for( i=2;i<n;i++) :
	#	if( n% i == 0 ) :
	#		print( not prime)
	#		break
	#print(prime)
	la	a0,msg
	li	a7,4
	ecall
	li	a7,5
	ecall
	mv	t0,a0	#t0 contains number
	li	t1,2		#t2 is iteration variable
	loop:	bge	t1,t0,exit_loop
		rem	t3,t0,t1
		if:	bnez	t3,exit_if
			la	a0,not_prime_msg
			li	a7,4
			ecall
			li	a7,10
			ecall
		exit_if:
		addi	t1,t1,1
		jal	loop
	exit_loop:
	la	a0,prime_msg
	li	a7,4
	ecall
	li	a7,10
	ecall	