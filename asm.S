#include "asmdef.h"

.section .data
	number:
		.int 10



#DECLARE_GLOBAL(asm_function)


################################################################################
# name:          asm_function
# action:        
# in:            
#
# out:
# modifies:
# notes:
################################################################################
#FUNC(asm_function):


.global main

main:	
	movl (number), %ecx
	movl $2, %ebx
	

	begin_loop:
		movl %ebx, %eax
		mul %eax
		cmpl %ecx, %eax
		jg end_loop
		incl %ebx
		jmp begin_loop

	end_loop:
		ret

	# gcc -m32 -masm=att -pg asm.S -o asm
