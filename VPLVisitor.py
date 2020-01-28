# Generated from VPL.g4 by ANTLR 4.7
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .VPLParser import VPLParser
else:
    from VPLParser import VPLParser

# This class defines a complete generic visitor for a parse tree produced by VPLParser.

class VPLVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by VPLParser#program.
    def visitProgram(self, ctx:VPLParser.ProgramContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#function_declaration.
    def visitFunction_declaration(self, ctx:VPLParser.Function_declarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#parameter.
    def visitParameter(self, ctx:VPLParser.ParameterContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#parameterName.
    def visitParameterName(self, ctx:VPLParser.ParameterNameContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#multParameterName.
    def visitMultParameterName(self, ctx:VPLParser.MultParameterNameContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#variable_declaration.
    def visitVariable_declaration(self, ctx:VPLParser.Variable_declarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#condition.
    def visitCondition(self, ctx:VPLParser.ConditionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#whileloop.
    def visitWhileloop(self, ctx:VPLParser.WhileloopContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#assign.
    def visitAssign(self, ctx:VPLParser.AssignContext):
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


    # Visit a parse tree produced by VPLParser#divExpression.
    def visitDivExpression(self, ctx:VPLParser.DivExpressionContext):
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
        return self.visitChildren(ctx)


    # Visit a parse tree produced by VPLParser#largeThan.
    def visitLargeThan(self, ctx:VPLParser.LargeThanContext):
        return self.visitChildren(ctx)



del VPLParser