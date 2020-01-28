from VPLVisitor import VPLVisitor
from VPLParser import VPLParser
from function import *


class TranslateVisitor(VPLVisitor):
    def __init__(self, usedVars):
        self.funcs = []
        self.curFunc = None
        self.loopCount = 0
        self.consts = {}
        self.condConsts = {}
        self.usedVars = usedVars
    
    # update properties and visit next function if existed
    # Grammar: M -> F M
    def visitProgram(self, ctx:VPLParser.ProgramContext):
        
        # if no function required to parse
        if ctx.function_declaration() is None:
            return None
        
        # update loopCount, consts and condition label and visit next function
        self.visit(ctx.function_declaration())
        self.loopCount = self.curFunc.loopCount
        self.consts = self.curFunc.consts
        self.condConsts = self.curFunc.condConsts

        return self.visit(ctx.program())

    # create function object and add into function list
    # Grammar: F -> func ident P D S end
    def visitFunction_declaration(self, ctx:VPLParser.Function_declarationContext):
        funcName = ctx.IDENT().getText()
        self.curFunc = Function(funcName, self.loopCount, self.consts, self.condConsts, self.usedVars[funcName])
        self.funcs.append(self.curFunc)

        return self.visitChildren(ctx)

    # extract parameter from ctx and pass to function
    # Grammar: P -> ( L )
    def visitParameter(self, ctx:VPLParser.ParameterContext):
        if ctx.name() != None:
            paras = ctx.name().getText().split(',')
            self.curFunc.addParas(paras)
        
        return None

    # extract local variables from ctx and pass to function
    # Grammar: D -> var L;
    def visitVariable_declaration(self, ctx:VPLParser.Variable_declarationContext):
        if ctx.name() != None:
            variables = ctx.name().getText().split(',')
            self.curFunc.addVars(variables)

        return None

    ####################### Statement Visitor #########################

    # add assignment block in function
    # Grammar: S -> ident = E
    def visitAssign(self, ctx:VPLParser.AssignContext):
        if ctx.IDENT().getText() not in self.usedVars[self.curFunc.name] and \
			ctx.IDENT().getText() not in self.curFunc.paras:
            return self.visit(ctx.nest_statement())
        
        # extract expression type from ctx
        exprType = type(ctx.expression())
        
        # base case: expression is atom, just assign the factor
        if exprType == VPLParser.IdenetExpressionContext:
            self.curFunc.addAssignFactor(ctx.IDENT().getText(), self.visit(ctx.expression()))
        elif exprType == VPLParser.NumExpressionContext:
            self.curFunc.addAssignFactor(ctx.IDENT().getText(), self.visit(ctx.expression()))
        # recursion case: recursively parse expression until it ends in one variable
        else:
            rhs = self.visit(ctx.expression())
            self.curFunc.addAssignFactor(ctx.IDENT().getText(), rhs)
        
        # visit next statement if existed
        return self.visit(ctx.nest_statement())

    # visit next statement if existed
    # S -> S ; S
    def visitNest_statement(self, ctx:VPLParser.Nest_statementContext):
        return self.visitChildren(ctx)

    # base case of expression, expression is ident
    # E -> ident
    def visitIdenetExpression(self, ctx:VPLParser.IdenetExpressionContext):
        return ctx.getText()
    
    # base case of expression, expression is num
    # E -> num
    def visitNumExpression(self, ctx:VPLParser.NumExpressionContext):
        return float(ctx.getText())

    # a general function to parse arithmetic expression, help to parse specific expression
    def visitArithmeticExpression(self, ctx):
        expr1 = ctx.expression()[0]
        expr2 = ctx.expression()[1]

        # if it's not a temp local variable
        if expr1.__class__.__name__ != "str":
            ter1 = self.visit(expr1)
        if expr2.__class__.__name__ != "str":
            ter2 = self.visit(expr2)

        return ter1, ter2

    # Grammar: E -> add (E, E)
    def visitAddExpression(self, ctx:VPLParser.AddExpressionContext):
        ter1, ter2 = self.visitArithmeticExpression(ctx)
            
        if ter1.__class__.__name__ == "float" and ter2.__class__.__name__ == "float":
            return ter1 + ter2
        if ter1 == 0:
            return ter2
        if ter2 == 0:
            return ter1
        
        tempIdent = self.curFunc.addAssignOp("add", ter1, ter2)
        return tempIdent

    # Grammar: E -> minus (E, E)
    def visitMinusExpression(self, ctx:VPLParser.MinusExpressionContext):
        ter1, ter2 = self.visitArithmeticExpression(ctx)
        
        if ter1.__class__.__name__ == "float" and ter2.__class__.__name__ == "float":
            return ter1 - ter2
        if ter2 == 0:
            return ter1
        
        tempIdent = self.curFunc.addAssignOp("minus", ter1, ter2)
        return tempIdent

    # Grammar: E -> mult (E, E)
    def visitMultExpression(self, ctx:VPLParser.MultExpressionContext):
        ter1, ter2 = self.visitArithmeticExpression(ctx)

        if ter1.__class__.__name__ == "float" and ter2.__class__.__name__ == "float":
            return ter1 * ter2
        if ter1 == 0 or ter2 == 0:
            return 0
        if ter1 == 1:
            return ter2
        if ter2 == 1:
            return ter1
        
        tempIdent = self.curFunc.addAssignOp("mult", ter1, ter2)
        return tempIdent
        
    # Grammar: E -> div (E, E)
    def visitDivExpression(self, ctx:VPLParser.DivExpressionContext):
        ter1, ter2 = self.visitArithmeticExpression(ctx)
        
        if ter1.__class__.__name__ == "float" and ter2.__class__.__name__ == "float":
            return ter1 / ter2
        if ter1 == 0:
            return 0
        if ter2 == 1:
            return ter1
        
        tempIdent = self.curFunc.addAssignOp("div", ter1, ter2)
        return tempIdent

    # Grammar: E -> min (E, E)
    def visitMinExpression(self, ctx:VPLParser.MinExpressionContext):
        ter1, ter2 = self.visitArithmeticExpression(ctx)
        if ter1.__class__.__name__ == "float" and ter2.__class__.__name__ == "float":
            return min(ter1, ter2)
        
        tempIdent = self.curFunc.addAssignOp("min", ter1, ter2)
        return tempIdent

    # Grammar: E -> ( E )
    def visitParenthesisExpression(self, ctx:VPLParser.ParenthesisExpressionContext):
        # ignore parenthesis, only extract expression
        return self.visit(ctx.expression())

    # parse if statement
    # Grammar: S -> if C then S endif
    def visitCondition(self, ctx:VPLParser.ConditionContext):
        # parse compare expression
        expr, num, condType = self.visit(ctx.compare())
        # create scope for if block
        scope = self.curFunc.addIf(expr, num, condType)

        self.visit(ctx.statement())

        # when statement in if block is parsed, end if scope and get to its parent scope
        prevScope = scope.endScope()
        self.curFunc.curScope = prevScope
        return self.visit(ctx.nest_statement())

    # parse while statement
    # Grammar: S -> while C do S endwhile
    def visitWhileloop(self, ctx:VPLParser.WhileloopContext):
        scope = self.curFunc.createWhile()
        expr, num, condType = self.visit(ctx.compare())
        self.curFunc.addWhile(expr, num, condType)

        self.visit(ctx.statement())

        prevScope = scope.endScope()
        self.curFunc.curScope = prevScope
        return self.visit(ctx.nest_statement())

    # a general functionto help parse compare expression
    def visitCompare(self, ctx, condType):
        # recursively visit expression 
        expr = self.visit(ctx.expression())
        num = float(ctx.NUM().getText())

        return expr, num, condType

    def visitLessThan(self, ctx:VPLParser.LessThanContext):
        return self.visitCompare(ctx, 'less')

    def visitLargeThan(self, ctx:VPLParser.LargeThanContext):
        return self.visitCompare(ctx, 'larger')

    # overwrite to help print out
    def __str__(self):
        strings = ""
        for func in self.funcs:
            strings += str(func)

        for val, const in self.consts.items():
            strings += const.label
        
        return strings
