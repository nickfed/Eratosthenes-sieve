#include "asmdef.h"
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

.data 			#Values
number:
	.int 100000000		#Maximum number, which will be checked.


.text
.global asm_function
.type asm_function, @function

asm_function:
	
	pushl %ebp
movl %esp, %ebp
movl 8(%ebp),%eax          #Get pointer to start of array passed from C
movl 12(%ebp),%ecx         #Get size of array
xorl %edi, %edi            #Zero out our array index
 
start_loop:                #Start loop
	cmpl %edi, %ecx            #Check to see if we’ve hit the end
	je loop_exit
	movl (%eax,%edi,4), %edx   #Store the element in %edx for calculations

	cmpl $0, %edx
	je continue

	leal 5(,%edx,2), %edx      #Multiply array element by 2 and add 5
	movl %edx, (%eax,%edi,4)   #Overwrite old element with new value
	continue:
		incl %edi                  #Increment the index, moving through the array.
		jmp start_loop             #Jump to loop beginning
 
		loop_exit:                 # function epilogue
			movl %ebp, %esp
			popl %ebp
			ret  