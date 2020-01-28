from varparam import *
from constant import *
from assignstatment import *
from expression import *
from scope import *
from ifstatement import *
from whilestatement import *

FUNC_ASSEM= \
"""
.text
.global {name}
.type {name}, @function
.p2align 4,,15

{name}:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx

    # allocate {num} local variables
    movq %rdi, %rax
    imulq $4, %rax, %rax
    addq $16, %rax
    imulq ${num}, %rax, %rax
    subq %rax, %rsp
    andq $-16, %rsp

    {body}

    popq    %rbx
    leave
    ret
"""

class Function():
    def __init__(self, name, loopCount, consts, condConsts, usedVars):
        self.name = name
        self.loopCount = loopCount
        self.consts = consts
        self.condConsts = condConsts
        self.paras = {}
        self.vars = {}
        # use function itself as an initial scope
        self.curScope = Scope(self)
        self.usedVars = usedVars

    def addParas(self, paras):
        # store length of parameters in first register
        self.paras[len(paras)] = Parameter(len(paras), 0) 
        for idx, para in enumerate(paras):
            self.paras[para] = Parameter(para, idx + 1)

    def addVars(self, variables):
        for idx, var in enumerate(variables):
            if var in self.usedVars:
                self.vars[var] = Variable(var, idx + 1)

    # add assignment assembly code for factor assignment
    def addAssignFactor(self, ident, expr):
        # convert strings on two sides into objects
        lhs = self.getIdent(ident)
        rhs = self.generateExpr(expr)

        assign = Assign(self.loopCount, lhs, rhs)
        
        # add assignment assembly code into current scope
        self.curScope.addAssem(assign.assign())
        self.loopCount += 1

    # add assignment assembly code for operation assignment
    def addAssignOp(self, op, expr1, expr2):
        rhs1 = self.generateExpr(expr1)
        rhs2 = self.generateExpr(expr2) 
        lhs = self.generateTempVar()
        
        expression = Expression(op, rhs1, rhs2, lhs, self.loopCount)
        # add expression assembly code into current scope
        self.curScope.addAssem(expression.assign())
        self.loopCount += 1

        return expression.lhs.ident

    # add if assembly code for if block
    def addIf(self, expr, num, condType):
        lhs = self.generateExpr(expr)
        ifstmt = IfStatement(lhs, num, self.condConsts, self.loopCount, condType)
        
        # create a nested scope in function for if block 
        # and set current scope to it
        scope = self.curScope.addNext(ifstmt)
        self.curScope = scope

        self.loopCount += 2
        return scope

    # create a scope for while block
    def createWhile(self):
        whilestmt = WhileStatement(None, None, self.condConsts, None, None)
        
        # create a nested scope in function for while block 
        # and set current scope to it
        scope = self.curScope.addNext(whilestmt)

        self.curScope = scope
        # bind the assemble code storage of current scope to exprCompution label
        # in Condition assemble code
        self.curScope.bindScope("exprCompution")

        return self.curScope

    # add details for while statement 
    def addWhile(self, expr, num, condType):
        lhs = self.generateExpr(expr)
        self.curScope.stmt.addDetails(lhs, num, self.loopCount, condType)

        self.loopCount += 2
        # set the assemble code storage of current scope back to the body of while statement
        self.curScope.unbindScope()
    
    # create new temporary variables for store expression result
    def generateTempVar(self):
        ident = "temp" + str(self.loopCount)
        tempVar = Variable(ident, len(self.vars) + 1)
        self.vars[ident] = tempVar
        
        return tempVar

    # get instance from expression name
    def generateExpr(self, expr):
        if expr.__class__.__name__ == "str":
            exprInstance = self.getIdent(expr)
        else:
            exprInstance = self.getConst(expr) 

        return exprInstance

    # get consts instance from value
    def getConst(self, val):
        if val in self.consts:
            return self.consts[val]

        const = Constant(val)
        self.consts[val] = const
        return const
            
    # get ident instance from variable name
    def getIdent(self, ident):
        if ident in self.paras:
            return self.paras[ident]
        if ident in self.vars:
            return self.vars[ident]
        return None

    # get whole assemble code of function
    def getAssem(self, body):
        return FUNC_ASSEM.format(
            name=self.name,
            num=len(self.vars), 
            body=body
        )

    # overwrite function to easily print
    def __str__(self):
        return str(self.curScope)
