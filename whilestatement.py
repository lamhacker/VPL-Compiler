from condition import *

WHILE_ASSEM = \
"""
##### While begin #####
jmp .loopcond{num}

.loopbegin{num}:
# while body
{body}

# while condition
.loopcond{num}:
{condition}

.loopexit{num}:
"""

class WhileStatement():
	# Create while block with Condition and condition number
    def __init__(self, expr, num, condConsts, whileNum, condType):
        self.cond = Condition(expr, num, condConsts, whileNum, condType)
        self.whileNum = whileNum
    
	# format assemble code
    def getAssem(self, body):
        return WHILE_ASSEM.format(
            condition = self.cond.evaluateWhile(),
            num = self.whileNum, 
            body = body
        )
    
    def addDetails(self, expr, num, whileNum, condType):
        self.cond.expr = expr
        self.cond.num = num
        self.whileNum = whileNum
        self.cond.condNum = whileNum
        self.cond.condType = condType

    def getCondExpr(self, field):
        return self.cond.__dict__["exprCompution"]

    def setCondExpr(self, exprAssem):
        self.cond.exprCompution = exprAssem


    

    


    
        
