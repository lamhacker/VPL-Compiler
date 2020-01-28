from condition import *

IF_ASSEM = \
"""
{condition}

.truebranch{num}:
{body}

	jmp .endif{num}

.falsebranch{num}:

.endif{num}:
"""

class IfStatement():
	# Create if block with Condition and condition number 
    def __init__(self, expr, num, condConsts, ifNum, condType):
        self.cond = Condition(expr, num, condConsts, ifNum, condType)
        self.ifNum = ifNum
    
	# format the assemble code
    def getAssem(self, body):
        return IF_ASSEM.format(
            condition = self.cond.evaluateIf(),
            num = self.ifNum, 
            body = body
        )


    

    


    
        
