from VPLVisitor import VPLVisitor
from VPLParser import VPLParser

class varCheckVisitor(VPLVisitor):
    def __init__(self):
        # store used local variables of each function
        self.usedVars = {}
        self.curFunc = None
        # store current function variables
        self.curVars = set()
        
        #### 
        self.assignVars = set()
        self.exprVars = set()
        ####
        
    def visitProgram(self, ctx:VPLParser.ProgramContext):
        # if no function required to parse
        if ctx.function_declaration() is None:
            return None
        
        self.visit(ctx.function_declaration())
        # remove parameters in used variable
        #self.usedVars[self.curFunc] = self.usedVars[self.curFunc].intersection(self.curVars)
        
        ####
        self.usedVars[self.curFunc] = self.assignVars.intersection(self.exprVars).intersection(self.curVars)
        ####

        return self.visit(ctx.program())
    
    def visitFunction_declaration(self, ctx:VPLParser.Function_declarationContext):
        # reset current function and variables
        self.curFunc = ctx.IDENT().getText()
        self.usedVars[self.curFunc] = set()
        self.curVars = set()
        
        ####
        self.assignVars = set()
        self.exprVars = set()
        ####

        return self.visitChildren(ctx)

    def visitAssign(self, ctx:VPLParser.AssignContext):
        # store lhs ident into set
        #self.usedVars[self.curFunc] = self.usedVars[self.curFunc].union(ctx.IDENT().getText())
        
        ####
        self.assignVars = self.assignVars.union(ctx.IDENT().getText())
        ####
        
        return self.visitChildren(ctx)
    
    def visitVariable_declaration(self, ctx:VPLParser.Variable_declarationContext):
        # store all defined local variables in curVars set
        if ctx.name() != None:
            variables = ctx.name().getText().split(',')
            self.curVars = self.curVars.union(variables)
        return None
    
    def visitIdenetExpression(self, ctx:VPLParser.IdenetExpressionContext):
        # store ident from expression into set
        self.usedVars[self.curFunc] = self.usedVars[self.curFunc].union(ctx.getText())
        
        ####
        self.exprVars = self.exprVars.union(ctx.IDENT().getText())
        ####
        return ctx.getText()


