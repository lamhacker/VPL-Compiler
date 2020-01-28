// Define a grammar called VPL

grammar VPL;

program
        : function_declaration program 
        | EOF // not sure about this
        ;

function_declaration 
    : FUNC IDENT parameter variable_declaration statement END
    ;
    

parameter 
    : '(' name ')'
    ;

name 
    : IDENT                                             # parameterName
    | IDENT ',' name                                    # multParameterName
    ;


variable_declaration 
    : VAR name ';'
    |
    ;

statement 
    : IF compare THEN statement ENDIF nest_statement          # condition
    | WHILE compare DO statement ENDWHILE nest_statement      # whileloop
    | IDENT '=' expression nest_statement                     # assign
    |                                                    # noneStatement
    ;

nest_statement
    : ';' statement nest_statement                      
    |
    ;

expression 
    : ADD '(' expression ',' expression ')'              # addExpression
    | MINUS '(' expression ',' expression ')'            # minusExpression
    | MULT '(' expression ',' expression ')'             # multExpression
    | DIV '(' expression ',' expression ')'              # divExpression
    | MIN '(' expression ',' expression ')'              # minExpression
    | '(' expression ')'                                 # parenthesisExpression
    | IDENT                                              # idenetExpression
    | NUM                                                # numExpression
    ;

compare 
    : expression '<' NUM                                # lessThan
    | expression '>=' NUM                               # largeThan
    ;

fragment LETTER : [a-zA-Z] ;
fragment DIGIT  : [0-9] ;


FUNC    : 'func' ;
END    : 'end' ;
VAR    : 'var' ;
IF     : 'if' ;
THEN   : 'then' ;
ENDIF  : 'endif' ;
ENDWHILE : 'endwhile' ;
WHILE  : 'while' ;
DO     : 'do' ;
ADD    : 'add' ;
MINUS  : 'minus' ;
MULT   : 'mult' ;
DIV    : 'div' ;
MIN    : 'min' ;


IDENT   : (LETTER | '_') (LETTER | '_' | DIGIT)* ;
NUM     : DIGIT+ ('.' DIGIT+)? ;

WS      : (' ' | '\t'| '\n') -> channel(HIDDEN);