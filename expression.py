EXPR_ASSEM = \
"""
    # load souce1 address into %rax
    {loadSource1}
    # load source2 address into %r10
    {loadSource2}
    # load destination address into %r11
    {loadDest}

    movq %rdi, %rbx                    # load vector length into counter %rbx
    shrq $2, %rbx                      # divide counter reg by 4
                                       # (per loop iteration 4 floats)
    jz .loop_end{X}                    # check whether number is equal to zero

.loop_begin{X}:
        movaps (%rax), %xmm0           # load first operand into %xmm0
        movaps (%r10), %xmm1           # load second operand into %xmm1

        # perform operation
        {operation} %xmm1, %xmm0    

        movaps %xmm0, (%r11)           # store result

        # increment pointers
        {option1}
        {option2}

        addq $16, %r11                 

        decq %rbx                      # decrement counter
        jnz .loop_begin{X}             # jump to loop header if counter is not zero
.loop_end{X}:
"""

INCR_POINTER1 = \
"""
    addq $16, %rax
"""

INCR_POINTER2 = \
"""
    addq $16, %r10
"""


class Expression():
    def __init__(self, op, rhs1, rhs2, lhs, loopCount):
        self.op = self.mapOp(op)
        self.rhs1 = rhs1
        self.rhs2 = rhs2
        self.lhs = lhs
        self.loopCount = loopCount

	# map operation to label
    def mapOp(self, op):
        if op == "add":
            return "addps"
        elif op == "minus":
            return "subps"
        elif op == "mult":
            return "mulps"
        elif op == "div":
            return "divps"
        elif op == "min":
            return "minps"
    
	# format all the assemble code
    def assign(self):
		# load sources and destionation address
        loadSource1 = self.rhs1.load("%rax")
        loadSource2 = self.rhs2.load("%r10")
        loadDest = self.lhs.load("%r11")

		# remove lines if pointing to constants
        if self.rhs1.__class__.__name__ == "Constant":
            optionAssem1 = ""
        else:
            optionAssem1 = INCR_POINTER1

        if self.rhs2.__class__.__name__ == "Constant":
            optionAssem2 = ""
        else:
            optionAssem2 = INCR_POINTER2

        assem = EXPR_ASSEM.format(
                    loadSource1 = loadSource1, 
                    loadSource2 = loadSource2,
                    loadDest = loadDest, 
                    X = self.loopCount, 
                    operation = self.op, 
                    option1 = optionAssem1, 
                    option2 = optionAssem2
                )

        return assem


