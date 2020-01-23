%{
#include "y.tab.h"
%}

delim     [ \t\n\r] 
letter    [A-Za-z] 
digit     [0-9]	

%%

{delim}+                                        {;} 
{letter}({letter}|{digit})*                     {yylval.id = yytext; return id;}
{digit}+(\.{digit}+)?(E[+\-]?{digit}+)?         {yylval.num = yytext; return num;}
[+-*/=(){};]                                    {return yytext[0];}

"int"                       {return INT;}
"float"                     {return FLOAT;}
"double"                    {return DOUBLE;}
"char"                      {return CHAR;}

"if"                        {return IF;}
"else"                      {return ELSE;}
"while"                     {return WHILE;}
"for"                       {return FOR;}

"=="                        | 
">"                         | 
"<"                         | 
">="                        | 
"<="                        {printf("%s : RELATIONAL OPERATION\n", yytext); return RELATIONAL_OPERATION;} 

.					        printf("unexpected character\n");

%%

int yywrap(void){return 1;}
int main(void){

    while(yylex()){}
    return 0;
    
}


