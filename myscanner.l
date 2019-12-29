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

expr                    {printf("%s "); return EXPRESSION;}
id	                    {printf("%s ", yytext); return IDENTIFIER;}
number  				{printf("%s ", yytext); return INTEGER;}
op                      {printf("%s ", yytext); return OPERATION}
relop                   {printf("%s ", yytext); return RELATIONAL_OPERATION}
[ \t\n]					;

.					printf("unexpected character\n");

%%

int yywrap(void){return 1;}
int main(void){
    yylex();
    return 0;
}
