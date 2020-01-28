import sys
import antlr4
from VPLLexer import VPLLexer
from VPLParser import VPLParser
from translateVisitor import TranslateVisitor
from semanticVisitor import semanticVisitor
from varCheckVisitor import varCheckVisitor
from VPLVisitor import VPLVisitor


char_stream = antlr4.FileStream(sys.argv[1])
lexer = VPLLexer(char_stream)
tokens = antlr4.CommonTokenStream(lexer)
parser = VPLParser(tokens)
tree = parser.program()
# semantic analysis
semanticChecker = semanticVisitor()
semanticChecker.visit(tree)
varChecker = varCheckVisitor()
varChecker.visit(tree)

translator = TranslateVisitor(varChecker.usedVars)
translator.visit(tree)

print(translator)
