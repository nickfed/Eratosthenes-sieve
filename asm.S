#include "asmdef.h"

.section .data
	number:
		.int 100000000

DECLARE_GLOBAL(asm_function)


################################################################################
# name:          asm_function
# action:        
# in:            
#
# out:
# modifies:
# notes:
################################################################################
FUNC(asm_function):
	
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

	# Do something here...