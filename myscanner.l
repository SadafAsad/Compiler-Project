%{
#include "myscanner.h"
%}
%option nounput yylineno

delim [ \t\n] 
ws {delim}+ 
letter    [A-Za-z] 
digit     [0-9] 
id        {letter}({letter}|{digit})* 
number    {digit}+(\.{digit}+)?(E[+\-]?{digit}+)?
op        [+-*/]
relop     [(==)|(>)|(<)|(>=)|(<=)]
expr      ({id}|{number})({relop}|{op})({id}|{number}) 

%%

expr                    return EXPRESSION;
id	                    return IDENTIFIER;
number  				return INTEGER;
[ \t\n]					;

.					printf("unexpected character\n");

%%

int yywrap(void)
{
	return 1;
}
