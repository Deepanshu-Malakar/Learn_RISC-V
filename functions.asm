#creating functions
.data
	msg:		.string	"sum = "
	msg1:	.string	"difference = "
	newline:	.string	"\n"

.text
main:
	li	a0,4
	li	a1,6
	jal	sum
	li	a0,4
	li	a1,6
	jal	diff
exit:
	li	a7,10
	ecall

sum:#(a0,a1) -> a0:
	add	t0,a0,a1
	la	a0,msg
	li	a7,4
	ecall
	mv	a0,t0
	li	a7,1
	ecall
	la 	a0,newline
	li	a7,4
	ecall
	mv	a0,t0
	ret

diff:#(a0,a1) -> a0:
	sub	t0,a0,a1
	la	a0,msg1
	li	a7,4
	ecall
	mv	a0,t0
	li	a7,1
	ecall
	la	a0,newline
	li	a7,4
	ecall
	mv	a0,t0
	ret	