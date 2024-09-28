#bubble sort
.data
	arr:		.word 	1000
	msg:		.string 	"Enter length of array: "
	msg1:	.string	"Enter element: "
	msg2:	.string	"Bubble sort completed\n"
	space:	.string	" "
	newline:	.string	"\n"
.text

create_array:
		la	a0,msg
		li	a7,4
		ecall
		li	a7,5
		ecall
		mv	t1,a0	#t1 contains length of array
		li	a0,4
		mul	t1,t1,a0
		la	t0,arr	#t0 = base address of array
		li	t2,0		#t2 represents index
		
	loop:	bge	t2,t1	,exit_loop
		la	a0,msg1
		li	a7,4
		ecall
		li	a7,5
		ecall
		sw	a0,(t0)
		addi	t0,t0,4
		addi	t2,t2,4
		jal	loop
	exit_loop:


print_array:
	la	t0,arr	#t0 = base address of array
	addi	t1,t1,0	#t1 = size of array
	li	t2,0		#t2 = Current index
	print_loop:	bge	t2,t1,exit_print_loop
				lw	a0,(t0)
				li	a7,1
				ecall
				la	a0,space
				li	a7,4
				ecall
				addi	t0,t0,4
				addi	t2,t2,4
				jal	print_loop
	exit_print_loop:
	

#bubble sort pseduo code
#for(int i=0 ; i<n-1 ; i++):
#	for(int j=0 ; j<n-i-1; j++):
#		if(arr[j] > arr[j+1]):
#			swap(arr[j] , arr[j+1])
bubble_sort:
	la	t0,arr	#t0 = base address of array
	addi	t1,t1,-4	#t1 = size of array = n-1
	li	t2,0		#t2 = i
	outer_loop:	bge	t2,t1,exit_outer_loop
				la	t0,arr
				li	t3,0		#t3 = j = 0 initially
				sub	t4,t1,t2	#t4 = n-i-1
				
				inner_loop:	bge	t3,t4,exit_inner_loop
							lw	s0,0(t0)	#s0 = arr[j]
							lw	s1,4(t0)	#s1 = arr[j+1]
							if:	ble	s0,s1,exit_if
								sw	s1,0(t0)
								sw	s0,4(t0)	
							exit_if:
							addi	t0,t0,4
							addi	t3,t3,4
							jal	inner_loop
				exit_inner_loop:
				addi	t2,t2,4
				jal	outer_loop
	exit_outer_loop:
	
la	a0,msg2
li	a7,4
ecall	

print_array_again:
	la	t0,arr	#t0 = base address of array
	addi	t1,t1,4	#t1 = size of array
	li	t2,0		#t2 = Current index
	print_loop1:	bge	t2,t1,exit_print_loop1
				lw	a0,(t0)
				li	a7,1
				ecall
				la	a0,space
				li	a7,4
				ecall
				addi	t0,t0,4
				addi	t2,t2,4
				jal	print_loop1
	exit_print_loop1:


	