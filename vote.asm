.data
	msg: .string "Enter your age in years: "
	vote_msg: .string "You are eligible to vote \n"
	no_msg: .string "You are not eligible to vote"

.text
	la a0,msg
	li a7,4
	ecall
	
	li a7,5
	ecall
	mv t0,a0
	
	li a1,18
	bgt t0,a1,vote
	
	la a0,no_msg
	li a7,4
	ecall
	li a7,93
	ecall
	
	vote:
		la a0,vote_msg
		li a7,4
		ecall
		li a7,93
		ecall