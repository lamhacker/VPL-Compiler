COND_ASSEM = \
"""
    # Condition
	{exprCompution}
    # <load source address into %rax> 
    {loadSource}

    xorps %xmm1, %xmm1
    movq %rdi, %rbx
    shrq $2, %rbx

    jz .loop_end{X}

.loop_begin{X}:

    addps (%rax), %xmm1 
    {option}
    decq %rbx
    jnz .loop_begin{X}

.loop_end{X}:
    xorps %xmm0, %xmm0
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0
    shufps $147,%xmm1,%xmm1
    addss %xmm1,%xmm0

    ucomiss .L{number}, %xmm0
    jb {true}
    jmp {false}

{numLabel}
"""

POINTER_ASSEM = \
"""
    # exist when %rax is not pointing to constant
    addq $16, %rax
"""

NUMBER_LABEL = \
"""
    .align 4
.L{number}:
    .float {number}
"""

class Condition():
    def __init__(self, expr, num, condConsts, condNum, condType):
		# left hand expression in condition
        self.expr = expr
		# right hand number in conditino
        self.num = num
		# number label for const on right hand side
        self.condConsts = condConsts
		# unique number for condition
        self.condNum = condNum
		# < or >=
        self.condType = condType
		# the computation required to recalculate in while statement
        self.exprCompution = ""

	# format expression and number label
    def evaluate(self):
		# remove line if pointing to constant
        if self.expr.__class__.__name__ == "Constant":
            option = ""
        else:
            option = POINTER_ASSEM

        if self.num in self.condConsts:
            numLabel = ""
        else:
            numLabel = NUMBER_LABEL.format(number=self.num)
            self.condConsts[self.num] = numLabel

        return option, numLabel

	# format condition in if statement
    def evaluateIf(self):
        option, numLabel = self.evaluate()
        self.true = ".truebranch{num}".format(num = self.condNum)
        self.false = ".falsebranch{num}".format(num = self.condNum)

        return COND_ASSEM.format(
                    exprCompution = "",
                    loadSource = self.expr.load("%rax"),
                    X = self.condNum + 1,
                    option = option,
                    number = self.num,
                    true = self.true if self.condType == "less" else self.false,
                    false = self.false if self.condType == "less" else self.true,
                    numLabel = numLabel
                ) 

	# format condition in while statement
    def evaluateWhile(self):
        option, numLabel = self.evaluate()
        self.true = ".loopbegin{num}".format(num = self.condNum)
        self.false = ".loopexit{num}".format(num = self.condNum)

        return COND_ASSEM.format(
                    exprCompution = self.exprCompution,
                    loadSource = self.expr.load("%rax"),
                    X = self.condNum + 1,
                    option = option,
                    number = self.num,
                    true = self.true if self.condType == "less" else self.false,
                    false = self.false if self.condType == "less" else self.true,
                    numLabel = numLabel
                ) 

