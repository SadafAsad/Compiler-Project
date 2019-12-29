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
expr      ({id}|{number})({ws})*({relop}|{op})({ws})*({id}|{number}) 

%%

{expr}                     {printf("%s is an EXPRESSION \n", yytext); return EXPRESSION;}
{id}	                   {printf("%s is an id \n", yytext); return IDENTIFIER;}
{number}  				   {printf("%s is a number \n", yytext); return NUMBER;}
{delim}					   ;

"+"                         {printf("%s plus op\n", yytext); return PLUS;}
"-"                         {printf("%s plus op\n", yytext); return MINUS;}
"*"                         {printf("%s plus op\n", yytext); return MULTIPLICATION;}
"/"                         {printf("%s plus op\n", yytext); return DIVISION;}
"=="                        {printf("%s plus op\n", yytext); return EQUAL;}
">"                         {printf("%s plus op\n", yytext); return GT;}
"<"                         {printf("%s plus op\n", yytext); return LT;}
">="                        {printf("%s plus op\n", yytext); return GTE;}
"<="                        {printf("%s plus op\n", yytext); return LTE;}

.					       printf("unexpected character\n");

%%

int yywrap(void){return 1;}
int main(void){
    while (yylex()){
        
    }
    return 0;
}
