#objective:  to display hello world message on console
#====================================================
.data
	msg:.string "Hello World"
#=================================================
.text
	la a0,msg
	li a7,4
	ecall 
#=========================================================
