#happy number
.data
	msg1: .string "Enter your number: "
	msg2: .string "It is a happy number"
.text
	la a0,msg1
	li a7,4
	ecall
	
	li a7,5
	ecall
	mv t0,a0   #taking input and storing in t0
	
	happy:
		li t3,1
		mv t1,t2
		jal digits_square
		li t3,1
		bne t2,t3,happy
		la a0,msg2
		li a7,4
		ecall
		li a7,93
		ecall
		
	
	digits_square: #(t1) --> t2
		li t3,10
		li t4,0 #sum
		loop:
			rem t2,t1,t3   # t2 = t1%10
			div t1,t1,t3     # t1 = t1 / 10
			mul t2,t2,t2
			add t4,t4,t2
			bnez t1,loop
		mv t2,t4
		ret
	