# Generated from VPL.g4 by ANTLR 4.7
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .VPLParser import VPLParser
else:
    from VPLParser import VPLParser

# This class defines a complete listener for a parse tree produced by VPLParser.
class VPLListener(ParseTreeListener):

    # Enter a parse tree produced by VPLParser#program.
    def enterProgram(self, ctx:VPLParser.ProgramContext):
        pass

    # Exit a parse tree produced by VPLParser#program.
    def exitProgram(self, ctx:VPLParser.ProgramContext):
        pass


    # Enter a parse tree produced by VPLParser#function_declaration.
    def enterFunction_declaration(self, ctx:VPLParser.Function_declarationContext):
        pass

    # Exit a parse tree produced by VPLParser#function_declaration.
    def exitFunction_declaration(self, ctx:VPLParser.Function_declarationContext):
        pass


    # Enter a parse tree produced by VPLParser#parameter.
    def enterParameter(self, ctx:VPLParser.ParameterContext):
        pass

    # Exit a parse tree produced by VPLParser#parameter.
    def exitParameter(self, ctx:VPLParser.ParameterContext):
        pass


    # Enter a parse tree produced by VPLParser#parameterName.
    def enterParameterName(self, ctx:VPLParser.ParameterNameContext):
        pass

    # Exit a parse tree produced by VPLParser#parameterName.
    def exitParameterName(self, ctx:VPLParser.ParameterNameContext):
        pass


    # Enter a parse tree produced by VPLParser#multParameterName.
    def enterMultParameterName(self, ctx:VPLParser.MultParameterNameContext):
        pass

    # Exit a parse tree produced by VPLParser#multParameterName.
    def exitMultParameterName(self, ctx:VPLParser.MultParameterNameContext):
        pass


    # Enter a parse tree produced by VPLParser#variable_declaration.
    def enterVariable_declaration(self, ctx:VPLParser.Variable_declarationContext):
        pass

    # Exit a parse tree produced by VPLParser#variable_declaration.
    def exitVariable_declaration(self, ctx:VPLParser.Variable_declarationContext):
        pass


    # Enter a parse tree produced by VPLParser#condition.
    def enterCondition(self, ctx:VPLParser.ConditionContext):
        pass

    # Exit a parse tree produced by VPLParser#condition.
    def exitCondition(self, ctx:VPLParser.ConditionContext):
        pass


    # Enter a parse tree produced by VPLParser#whileloop.
    def enterWhileloop(self, ctx:VPLParser.WhileloopContext):
        pass

    # Exit a parse tree produced by VPLParser#whileloop.
    def exitWhileloop(self, ctx:VPLParser.WhileloopContext):
        pass


    # Enter a parse tree produced by VPLParser#assign.
    def enterAssign(self, ctx:VPLParser.AssignContext):
        pass

    # Exit a parse tree produced by VPLParser#assign.
    def exitAssign(self, ctx:VPLParser.AssignContext):
        pass


    # Enter a parse tree produced by VPLParser#noneStatement.
    def enterNoneStatement(self, ctx:VPLParser.NoneStatementContext):
        pass

    # Exit a parse tree produced by VPLParser#noneStatement.
    def exitNoneStatement(self, ctx:VPLParser.NoneStatementContext):
        pass


    # Enter a parse tree produced by VPLParser#nest_statement.
    def enterNest_statement(self, ctx:VPLParser.Nest_statementContext):
        pass

    # Exit a parse tree produced by VPLParser#nest_statement.
    def exitNest_statement(self, ctx:VPLParser.Nest_statementContext):
        pass


    # Enter a parse tree produced by VPLParser#addExpression.
    def enterAddExpression(self, ctx:VPLParser.AddExpressionContext):
        pass

    # Exit a parse tree produced by VPLParser#addExpression.
    def exitAddExpression(self, ctx:VPLParser.AddExpressionContext):
        pass


    # Enter a parse tree produced by VPLParser#minusExpression.
    def enterMinusExpression(self, ctx:VPLParser.MinusExpressionContext):
        pass

    # Exit a parse tree produced by VPLParser#minusExpression.
    def exitMinusExpression(self, ctx:VPLParser.MinusExpressionContext):
        pass


    # Enter a parse tree produced by VPLParser#multExpression.
    def enterMultExpression(self, ctx:VPLParser.MultExpressionContext):
        pass

    # Exit a parse tree produced by VPLParser#multExpression.
    def exitMultExpression(self, ctx:VPLParser.MultExpressionContext):
        pass


    # Enter a parse tree produced by VPLParser#divExpression.
    def enterDivExpression(self, ctx:VPLParser.DivExpressionContext):
        pass

    # Exit a parse tree produced by VPLParser#divExpression.
    def exitDivExpression(self, ctx:VPLParser.DivExpressionContext):
        pass


    # Enter a parse tree produced by VPLParser#minExpression.
    def enterMinExpression(self, ctx:VPLParser.MinExpressionContext):
        pass

    # Exit a parse tree produced by VPLParser#minExpression.
    def exitMinExpression(self, ctx:VPLParser.MinExpressionContext):
        pass


    # Enter a parse tree produced by VPLParser#parenthesisExpression.
    def enterParenthesisExpression(self, ctx:VPLParser.ParenthesisExpressionContext):
        pass

    # Exit a parse tree produced by VPLParser#parenthesisExpression.
    def exitParenthesisExpression(self, ctx:VPLParser.ParenthesisExpressionContext):
        pass


    # Enter a parse tree produced by VPLParser#idenetExpression.
    def enterIdenetExpression(self, ctx:VPLParser.IdenetExpressionContext):
        pass

    # Exit a parse tree produced by VPLParser#idenetExpression.
    def exitIdenetExpression(self, ctx:VPLParser.IdenetExpressionContext):
        pass


    # Enter a parse tree produced by VPLParser#numExpression.
    def enterNumExpression(self, ctx:VPLParser.NumExpressionContext):
        pass

    # Exit a parse tree produced by VPLParser#numExpression.
    def exitNumExpression(self, ctx:VPLParser.NumExpressionContext):
        pass


    # Enter a parse tree produced by VPLParser#lessThan.
    def enterLessThan(self, ctx:VPLParser.LessThanContext):
        pass

    # Exit a parse tree produced by VPLParser#lessThan.
    def exitLessThan(self, ctx:VPLParser.LessThanContext):
        pass


    # Enter a parse tree produced by VPLParser#largeThan.
    def enterLargeThan(self, ctx:VPLParser.LargeThanContext):
        pass

    # Exit a parse tree produced by VPLParser#largeThan.
    def exitLargeThan(self, ctx:VPLParser.LargeThanContext):
        pass


