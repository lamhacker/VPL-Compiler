# Generated from /Users/franklan123/Desktop/VPL_ANTLR/VPL/VPL.g by ANTLR 4.7
from antlr4 import *
from VPLVisitor import VPLVisitor
if __name__ is not None and "." in __name__:
    from .VPLParser import VPLParser
else:
    from VPLParser import VPLParser
import sys

'''
Semantic Checker
This class check 6 kinds of errors

(1): Error 1, function redefined
        Description: two functions have same name and same parameters.
        Example:     func mymin(a,b,c)end     func mymin(a,b,c)end

(2): Error 2, parameter redefined
        Description: a function has more than one duplicated parameter names
        Example:     func mymin(a,a)end

(3): Error 3, variable redefined
        Description: a function has more than one duplicated variable name
        Example:     func mymin(a,b) var c,c;end

(4): Error 4, variable and function argument have the same name
        Description: A variable and a function argument with the same name
        Example:     func mymin(a,b) var a;end

(5): Error 5, variable undefined
        Description: variable undefined
        Example:     func mymin(a,b) var a; d = 2 end

(6): Error 6, assign to a variable that does not have value
        Description: assign to a variable that does not have value
        Example:     func mymin(a,b) var c; a = c end



'''


parameterList = []
variableList = []
allIdentList = []
functionNameList = []

#newList = []
#eList = []

# This class defines a complete generic visitor for a parse tree produced by VPLParser.
class semanticVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by VPLParser#program.
    def visitProgram(self, ctx:VPLParser.ProgramContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#function_declaration.
    def visitFunction_declaration(self, ctx:VPLParser.Function_declarationContext):
        functionNameList.append(ctx.IDENT().getText())
        # clear allidentlist
        global allIdentList
        allIdentList = []
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#parameter.
    def visitParameter(self, ctx:VPLParser.ParameterContext):
        if ctx.name() == None:
            return self.visitChildren(ctx)
        parameter = ctx.name().getText().split(',')
        
        # check same functions name
        if len(functionNameList) != len(set(functionNameList)):
            for i in range(len(parameterList)):
                if len(parameterList[i]) == len(parameter):
                    count = 0
                    for j in range(len(parameter)):
                        if parameter[j] in parameterList[i]:
                            count = count + 1
                    if count == len(parameterList[i]):
                        print("Error 1, function redefined")
                        sys.exit()
                    
        parameterList.append(parameter)
    
        if len(parameter) != len(set(parameter)):
            print("Error 2, parameter redefined")
            sys.exit()
        
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#parameterName.
    def visitParameterName(self, ctx:VPLParser.ParameterNameContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#multParameterName.
    def visitMultParameterName(self, ctx:VPLParser.MultParameterNameContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#variable_declaration.
    def visitVariable_declaration(self, ctx:VPLParser.Variable_declarationContext):
        if ctx.name() == None:
            return self.visitChildren(ctx)

        variableName = ctx.name().getText().split(',')
        variableList.append(variableName)
        
        if len(variableName) != len(set(variableName)):
            print("Error 3, variable redefined")
            sys.exit()
        
        targetParameter = parameterList[-1]
        targetVariable = variableList[-1]
        targetParameterLength = len(targetParameter)
        targetVariableLength = len(targetVariable)
        
        for i in range(targetParameterLength):
            for j in range(targetVariableLength):
                if targetVariable[j] == targetParameter[i]:
                    print("Error 4, variable and function argument have the same name")
                    sys.exit()
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#condition.
    def visitCondition(self, ctx:VPLParser.ConditionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#whileloop.
    def visitWhileloop(self, ctx:VPLParser.WhileloopContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#assign.
    def visitAssign(self, ctx:VPLParser.AssignContext):
        # get all the parameters in this scope
        targetParameter = []
        targetParameter = parameterList[-1]
        # get all the varialbes in this scope
        targetVariable = []
        if len(variableList) != 0:
            targetVariable = variableList[-1]
        # merge all the parameters and variables
        canUseList = targetParameter + targetVariable
        # get all idents which are assigned
        allIdentList.append(ctx.IDENT().getText())
        # check whether left hand side is defined
        temp = 0
        if ctx.IDENT().getText() in targetParameter:
            temp = temp + 1
        if ctx.IDENT().getText() in targetVariable:
            temp = temp + 1
    
        if temp == 0:
            print("Error 5, variable undefined")
            sys.exit()
        # check right hand side
        # a list contain elements that can generate further
        newList = []
        # a list contain elements that cannot generate further
        eList = []
        
         # get all assign IDENT
        assignedIdentList = []
        if len(allIdentList) > 1:
            for i in range(len(allIdentList) - 1):
                assignedIdentList.append(allIdentList[i])
        rightHandSide = ctx.expression()
        while str(type(rightHandSide)) == "<class 'VPLParser.VPLParser.ParenthesisExpressionContext'>":
            rightHandSide = rightHandSide.expression()
    
        # check whether e is a number
        if str(type(rightHandSide)) == "<class 'VPLParser.VPLParser.NumExpressionContext'>":
            return self.visitChildren(ctx)
        
        # check whether e is an ident, if it is, check whether it is defined,and have value
        if str(type(rightHandSide)) == "<class 'VPLParser.VPLParser.IdenetExpressionContext'>":
            # check define
            if rightHandSide.getText() not in canUseList:
                print("Error 5, variable undefined")
                sys.exit()
            
            # handle first ident
            if len(assignedIdentList) == 0:
                if(len(variableList) != 0):
                    # if first ident does not in the variable list, throw error
                    if rightHandSide.getText() in variableList[-1]:
                        print("Error 6, assign to a variable that does not have value")
                        sys.exit()
                            
            # handle the ident after the first, if ident does not belong to parameters and assignIdent,throw error
            if len(assignedIdentList) != 0 and rightHandSide.getText() not in assignedIdentList and rightHandSide.getText() not in targetParameter:
                print("Error 6, assign to a variable that does not have value")
                sys.exit()
            
            return self.visitChildren(ctx)
        else:
            newList.append(ctx.expression())
        i = 0
        #check whether E generate operation(+,-,*,/,min) or (E) or ident/num
        while i < len(newList):
            rhs = newList[i].expression()
            # if E generate operation
            if type(rhs) is list:
                while str(type(rhs[0])) == "<class 'VPLParser.VPLParser.ParenthesisExpressionContext'>":
                    rhs[0] = rhs[0].expression()
                while str(type(rhs[1])) == "<class 'VPLParser.VPLParser.ParenthesisExpressionContext'>":
                    rhs[1] = rhs[1].expression()
                # check whether left hand side is Ident, if it is a Ident, then put into the atom(cannot generate further)list
                if str(type(rhs[0])) == "<class 'VPLParser.VPLParser.IdenetExpressionContext'>":
                    eList.append(rhs[0])
                # check whether left hand side is number, if it is a number, then ignore it
                elif str(type(rhs[0])) == "<class 'VPLParser.VPLParser.NumExpressionContext'>":
                    pass
                # if it is not a Ident or number, then it can generate further
                else:
                    newList.append(rhs[0])
                # check whether right hand side is Ident, if it is a Ident, then put into the atom(cannot generate further)list
                if str(type(rhs[1])) == "<class 'VPLParser.VPLParser.IdenetExpressionContext'>":
                    eList.append(rhs[1])
                # check whether left hand side is number, if it is a number, then ignore it
                elif str(type(rhs[1])) == "<class 'VPLParser.VPLParser.NumExpressionContext'>":
                    pass
                # if it is not a Ident or number, then it can generate further
                else:
                    newList.append(rhs[1])
            # if E generate non operation
            else:
                newList.append(rhs)
            i = i + 1
        
        # check whether all the Ident is defined
        for i in range(len(eList)):
            if eList[i].getText() not in canUseList:
                print("Error 5, variable undefined")
                sys.exit()
        # handle first ident
        if len(assignedIdentList) == 0:
            if(len(variableList) != 0):
                for i in range (len(eList)):
                    if eList[i].getText() in targetVariable:
                        print("Error 6, assign to a variable that does not have value")
                        sys.exit()
        # handle the rest ident
        if len(assignedIdentList) != 0:
            for i in range (len(eList)):
                if eList[i].getText() not in assignedIdentList and eList[i].getText() not in targetParameter:
                    print("Error 6, assign to a variable that does not have value")
                    sys.exit()
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#noneStatement.
    def visitNoneStatement(self, ctx:VPLParser.NoneStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#nest_statement.
    def visitNest_statement(self, ctx:VPLParser.Nest_statementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#addExpression.
    def visitAddExpression(self, ctx:VPLParser.AddExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#minusExpression.
    def visitMinusExpression(self, ctx:VPLParser.MinusExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#multExpression.
    def visitMultExpression(self, ctx:VPLParser.MultExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#dicExpression.
    def visitDicExpression(self, ctx:VPLParser.DivExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#minExpression.
    def visitMinExpression(self, ctx:VPLParser.MinExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#parenthesisExpression.
    def visitParenthesisExpression(self, ctx:VPLParser.ParenthesisExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#idenetExpression.
    def visitIdenetExpression(self, ctx:VPLParser.IdenetExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#numExpression.
    def visitNumExpression(self, ctx:VPLParser.NumExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#lessThan.
    def visitLessThan(self, ctx:VPLParser.LessThanContext):
        # get all the parameters in this scope
        targetParameter = parameterList[-1]
        # get all the varialbes in this scope
        targetVariable = []
        if len(variableList) != 0:
            targetVariable = variableList[-1]
        # merge all the parameters and variables
        canUseList = targetParameter + targetVariable
        
        # get all assign IDENT
        assignedIdentList = []
        if len(allIdentList) > 0:
            for i in range(len(allIdentList)):
                assignedIdentList.append(allIdentList[i])
    
        # a list contain elements that can generate further
        newList = []
        # a list contain elements that cannot generate further
        eList = []
        leftHandSide = ctx.expression()
        while str(type(leftHandSide)) == "<class 'VPLParser.VPLParser.ParenthesisExpressionContext'>":
            leftHandSide = leftHandSide.expression()
        
        # check whether e is a number
        if str(type(leftHandSide)) == "<class 'VPLParser.VPLParser.NumExpressionContext'>":
            return self.visitChildren(ctx)
                
        
        # check whether e is an ident, if it is, check whether it is defined,and have value
        if str(type(leftHandSide)) == "<class 'VPLParser.VPLParser.IdenetExpressionContext'>":
            # check define
            if leftHandSide.getText() not in canUseList:
                print("Error 5, variable undefined")
                sys.exit()
            
            # handle first ident
            if len(assignedIdentList) == 0:
                if(len(variableList) != 0):
                    # if first ident does not in the variable list, throw error
                    if leftHandSide.getText() in variableList[-1]:
                        print("Error 6, assign to a variable that does not have value")
                        sys.exit()
        
            # handle the ident after the first, if ident does not belong to parameters and assignIdent,throw error
            if len(assignedIdentList) != 0 and leftHandSide.getText() not in assignedIdentList and leftHandSide.getText() not in targetParameter:
                print("Error 6, assign to a variable that does not have value")
                sys.exit()
            
            return self.visitChildren(ctx)
        else:
            newList.append(leftHandSide)
        i = 0

        #check whether E generate operation(+,-,*,/,min) or (E) or ident/num
        while i < len(newList):
            # if E generate operation
            lhs = newList[i].expression()

            if type(lhs) is list:
                while str(type(lhs[0])) == "<class 'VPLParser.VPLParser.ParenthesisExpressionContext'>":
                    lhs[0] = lhs[0].expression()
                while str(type(lhs[1])) == "<class 'VPLParser.VPLParser.ParenthesisExpressionContext'>":
                    lhs[1] = lhs[1].expression()

                # check whether left hand side is Ident, if it is a Ident, then put into the atom(cannot generate further)list
                if str(type(lhs[0])) == "<class 'VPLParser.VPLParser.IdenetExpressionContext'>":
                    eList.append(lhs[0])
                # check whether left hand side is number, if it is a number, then ignore it
                elif str(type(lhs[0])) == "<class 'VPLParser.VPLParser.NumExpressionContext'>":
                    pass
                # if it is not a Ident or number, then it can generate further
                else:
                    newList.append(lhs[0])
                # check whether right hand side is Ident, if it is a Ident, then put into the atom(cannot generate further)list
                if str(type(lhs[1])) == "<class 'VPLParser.VPLParser.IdenetExpressionContext'>":
                    eList.append(lhs[1])
                # check whether left hand side is number, if it is a number, then ignore it
                elif str(type(lhs[1])) == "<class 'VPLParser.VPLParser.NumExpressionContext'>":
                    pass
                # if it is not a Ident or number, then it can generate further
                else:
                    newList.append(lhs[1])
            # if E generate non operation
            else:
                newList.append(lhs)
            i = i + 1
            
               # check whether all the Ident is defined
        for i in range(len(eList)):
            if eList[i].getText() not in canUseList:
                print("Error 5, variable undefined")
                sys.exit()
        # handle first ident
        if len(assignedIdentList) == 0:
            if(len(variableList) != 0):
                for i in range (len(eList)):
                    if eList[i].getText() in targetVariable:
                        print("Error 6, assign to a variable that does not have value")
                        sys.exit()
        # handle the rest ident
        if len(assignedIdentList) != 0:
            for i in range (len(eList)):
                if eList[i].getText() not in assignedIdentList and eList[i].getText() not in targetParameter:
                    print("Error 6, assign to a variable that does not have value")
                    sys.exit()
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#largeThan.
    def visitLargeThan(self, ctx:VPLParser.LargeThanContext):
        # get all the parameters in this scope
        targetParameter = parameterList[-1]
        # get all the varialbes in this scope
        targetVariable = []
        if len(variableList) != 0:
            targetVariable = variableList[-1]
        # merge all the parameters and variables
        canUseList = targetParameter + targetVariable
        
        # get all assign IDENT
        assignedIdentList = []
        if len(allIdentList) > 0:
            for i in range(len(allIdentList)):
                assignedIdentList.append(allIdentList[i])
    
        # a list contain elements that can generate further
        newList = []
        # a list contain elements that cannot generate further
        eList = []
        leftHandSide = ctx.expression()
        while str(type(leftHandSide)) == "<class 'VPLParser.VPLParser.ParenthesisExpressionContext'>":
            leftHandSide = leftHandSide.expression()
        
        # check whether e is a number
        if str(type(leftHandSide)) == "<class 'VPLParser.VPLParser.NumExpressionContext'>":
            return self.visitChildren(ctx)
                
        
        # check whether e is an ident, if it is, check whether it is defined,and have value
        if str(type(leftHandSide)) == "<class 'VPLParser.VPLParser.IdenetExpressionContext'>":
            # check define
            if leftHandSide.getText() not in canUseList:
                print("Error 5, variable undefined")
                sys.exit()
            
            # handle first ident
            if len(assignedIdentList) == 0:
                if(len(variableList) != 0):
                    # if first ident does not in the variable list, throw error
                    if leftHandSide.getText() in variableList[-1]:
                        print("Error 6, assign to a variable that does not have value")
                        sys.exit()
        
            # handle the ident after the first, if ident does not belong to parameters and assignIdent,throw error
            if len(assignedIdentList) != 0 and leftHandSide.getText() not in assignedIdentList and leftHandSide.getText() not in targetParameter:
                print("Error 6, assign to a variable that does not have value")
                sys.exit()
            
            return self.visitChildren(ctx)
        else:
            newList.append(leftHandSide)
        i = 0

        #check whether E generate operation(+,-,*,/,min) or (E) or ident/num
        while i < len(newList):
            # if E generate operation
            lhs = newList[i].expression()

            if type(lhs) is list:
                while str(type(lhs[0])) == "<class 'VPLParser.VPLParser.ParenthesisExpressionContext'>":
                    lhs[0] = lhs[0].expression()
                while str(type(lhs[1])) == "<class 'VPLParser.VPLParser.ParenthesisExpressionContext'>":
                    lhs[1] = lhs[1].expression()

                # check whether left hand side is Ident, if it is a Ident, then put into the atom(cannot generate further)list
                if str(type(lhs[0])) == "<class 'VPLParser.VPLParser.IdenetExpressionContext'>":
                    eList.append(lhs[0])
                # check whether left hand side is number, if it is a number, then ignore it
                elif str(type(lhs[0])) == "<class 'VPLParser.VPLParser.NumExpressionContext'>":
                    pass
                # if it is not a Ident or number, then it can generate further
                else:
                    newList.append(lhs[0])
                # check whether right hand side is Ident, if it is a Ident, then put into the atom(cannot generate further)list
                if str(type(lhs[1])) == "<class 'VPLParser.VPLParser.IdenetExpressionContext'>":
                    eList.append(lhs[1])
                # check whether left hand side is number, if it is a number, then ignore it
                elif str(type(lhs[1])) == "<class 'VPLParser.VPLParser.NumExpressionContext'>":
                    pass
                # if it is not a Ident or number, then it can generate further
                else:
                    newList.append(lhs[1])
            # if E generate non operation
            else:
                newList.append(lhs)
            i = i + 1
            
               # check whether all the Ident is defined
        for i in range(len(eList)):
            if eList[i].getText() not in canUseList:
                print("Error 5, variable undefined")
                sys.exit()
        # handle first ident
        if len(assignedIdentList) == 0:
            if(len(variableList) != 0):
                for i in range (len(eList)):
                    if eList[i].getText() in targetVariable:
                        print("Error 6, assign to a variable that does not have value")
                        sys.exit()
        # handle the rest ident
        if len(assignedIdentList) != 0:
            for i in range (len(eList)):
                if eList[i].getText() not in assignedIdentList and eList[i].getText() not in targetParameter:
                    print("Error 6, assign to a variable that does not have value")
                    sys.exit()
        return self.visitChildren(ctx)



del VPLParser
