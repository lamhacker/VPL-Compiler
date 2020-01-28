VAR_ASSEM = \
"""
    # place address of {N}th local variable into {destreg}
    movq %rdi, {destreg}
    imulq $4, {destreg}, {destreg}
    addq $16, {destreg}
    imulq ${N}, {destreg}, {destreg}
    subq %rbp, {destreg}
    negq {destreg}
    andq $-16, {destreg}
"""

REGISTERS = ["%rdi", "%rsi", "%rdx", "%rcx", "%r8", "%r9"]
PARA_ASSEM = \
"""
    # place address of parameter into {destreg}
    movq {argreg}, {destreg}
"""

# Base Class for Variable and Parameter Class
class BaseVar(object):
    def __init__(self, ident, nth):
        self.ident = ident
        self.nth = nth

    def __str__(self):
        return "{ident}: {nth}".format(ident=self.ident, nth=self.nth)

	
# extend from BaseVar Class
class Variable(BaseVar):
    def __init__(self, ident, nth):
        BaseVar.__init__(self, ident, nth)

    def load(self, destreg):
        return VAR_ASSEM.format(N=self.nth, destreg=destreg)

	
# extend from BaseVar Class
class Parameter(BaseVar):
    def __init__(self, ident, nth):
        BaseVar.__init__(self, ident, nth)
		# assign regester to it
        self.reg = REGISTERS[nth]

    def load(self, destreg):
        return PARA_ASSEM.format(argreg=self.reg, destreg=destreg)
