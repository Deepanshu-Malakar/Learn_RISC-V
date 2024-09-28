.data
	arr: .word 1000
	msg1: .string "Enter no of elements : "
	msg2: .string "Enter value : "
	comma: .string " , "
.text

create_array:
	la t0,arr
	la a0,msg1
	li a7,4
	ecall
	li a7,5
	ecall
	li a1,4
	mul t3,a0,a1  #t3 contains no of elements of array
	li t1,0  #index
	loop:
		la a0,msg2
		li a7,4
		ecall
		li a7,5
		ecall
		sw a0,(t0)
		addi t0,t0,4
		addi t1,t1,4
	blt t1,t3,loop

print_array:
	la t0,arr
	li t2,0 #index
	
	loop1:
		lw a0,(t0)
		li a7,1
		ecall
		la a0,comma
		li a7,4
		ecall
		addi t0,t0,4
		addi t2,t2,4
	blt t2,t3,loop1

bubble_sort:
	la t0,arr
	li t1,0 #value of i
	outer_loop:
		li t2,0 #value of j
		inner_loop:
			lw s1,(t0)    #s1 = arr[j]
			addi t0,t0,4
			lw s2,(t0)   #s2 = arr[j+1]
			blt s2,s1,swap
			bge s2,s1,else
			swap:
				mv s3,s1
				mv s1,s2
				mv s2,s3
				sw s2,(t0)
				addi t0,t0,-4
				sw s1,(t0)
			else:
			addi t0,t0,4
			addi t2,t2,4
			sub t4,t3,t1  #t4 = n-i
		blt t2,t4,inner_loop
		addi t4,t3,-4   #t4 = n-1
		addi t1,t1,4
	blt t1,t4,outer_loop

print_array2:
	la t0,arr
	li t2,0 #index
	
	loop2:
		lw a0,(t0)
		li a7,1
		ecall
		la a0,comma
		li a7,4
		ecall
		addi t0,t0,4
		addi t2,t2,4
	blt t2,t3,loop2
			

	
	