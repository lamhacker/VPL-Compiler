SIMASSIGN_ASSEM_BASE = \
"""
    # load source address into %rax
    {loadSouce}

    # load destination address into %r10
    {loadDest}

    movq %rdi, %rbx                    
    shrq $2, %rbx                      
                                       
    jz .loop_end{X}

.loop_begin{X}:
    movaps (%rax), %xmm0        # load source into %xmm0
    movaps %xmm0, (%r10)        # store %xmm0

{option}
    addq $16, %r10

    decq %rbx
    jnz .loop_begin{X}
.loop_end{X}:
"""

SIMASSIGN_ASSEM_VAR = \
"""
    addq $16, %rax             
"""

class Assign():
    def __init__(self, loopCount, lhs, rhs):
        self.loopCount = loopCount
		# destination 
        self.lhs = lhs
		# source
        self.rhs = rhs
    
	# format assignment 
    def assign(self):
        sourceLoad = self.rhs.load("%rax")
        destLoad = self.lhs.load("%r10")
		
		# remove lines if pointing to constant
        if self.rhs.__class__.__name__ != "Constant":
            optionAssem = SIMASSIGN_ASSEM_VAR
        else:
            optionAssem = ""

        assem = SIMASSIGN_ASSEM_BASE.format(
                    loadSouce=sourceLoad, 
                    loadDest=destLoad, 
                    X=self.loopCount, 
                    option=optionAssem
                )

        return assem


    

        

    
