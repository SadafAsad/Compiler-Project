%{
#include <stdio.h>
#include "myscanner.h"
%}
%option nounput yylineno

delim     [ \t\n] 
ws        {delim}+ 
letter    [A-Za-z] 
digit     [0-9] 
id        {letter}({letter}|{digit})* 
number    {digit}+(\.{digit}+)?(E[+\-]?{digit}+)?
op        [+\-*/]
relop     [(==)|(>)|(<)|(>=)|(<=)]
expr      ({id}|{number})({relop}|{op})({id}|{number}) 

%%

{expr}                     {printf("%s is an EXPRESSION \n", yytext); return EXPRESSION;}
{id}	                   {printf("%s is an id \n", yytext); return IDENTIFIER;}
{number}  				   {printf("%s is a number \n", yytext); return NUMBER;}
{op}                       {printf("%s is an Operation \n", yytext); return OPERATION;}
{relop}                    {printf("%s is a relop \n", yytext); return RELATIONAL_OPERATION;}
{delim}					   ;

.					       printf("unexpected character\n");

%%

int yywrap(void){return 1;}
int main(void){
    while (yylex()){
        
    }
    return 0;
}
