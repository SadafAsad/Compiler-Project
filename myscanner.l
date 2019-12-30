%{
#include <stdio.h>
#include "myscanner.h"
%}
%option nounput yylineno

delim     [ \t\n] 
ws        {delim}+ 
letter    [A-Za-z] 
digit     [0-9] 

%%

{letter}({letter}|{digit})*	                               {printf("%s is an id \n", yytext); return IDENTIFIER;}
{digit}+(\.{digit}+)?(E[+\-]?{digit}+)?  				   {printf("%s is a number \n", yytext); return NUMBER;}

"+"                         {printf("%s plus op\n", yytext); return PLUS;}
"-"                         {printf("%s minus op\n", yytext); return MINUS;}
"*"                         {printf("%s mutiplication op\n", yytext); return MULTIPLICATION;}
"/"                         {printf("%s division op\n", yytext); return DIVISION;}
"=="                        {printf("%s equal relop\n", yytext); return EQUAL;}
">"                         {printf("%s gt relop\n", yytext); return GT;}
"<"                         {printf("%s lt relop\n", yytext); return LT;}
">="                        {printf("%s gte relop\n", yytext); return GTE;}
"<="                        {printf("%s lte relop\n", yytext); return LTE;}

{delim}					    ;
.					        printf("unexpected character\n");

%%

int yywrap(void){return 1;}
int main(void){
    while (yylex()){}
    return 0;
}
