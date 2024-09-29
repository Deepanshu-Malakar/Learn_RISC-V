#eligible to vote
.data
	msg:			.string	"Enter your age : "
	vote_msg:		.string	"You are eligible to vote"
	not_vote_msg:	.string	"You are not eligible to vote"
.text
	la	a0,msg
	li	a7,4
	ecall
	li	a7,5
	ecall
	mv	t0,a0
	li	t1,18
	if:	blt	t0,t1,else
		la	a0,vote_msg
		li	a7,4
		ecall
		jal	exit_if
	else:
		la	a0,not_vote_msg
		li	a7,4
		ecall
		jal	exit_if
	exit_if:
		li	a7,10
		ecall