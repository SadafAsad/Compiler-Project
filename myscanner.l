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
[+-*/=(){};]                                    {return *yytext;}

"int"                       |
"float"                     |
"double"                    |
"char"                      {return *yytext;}

"if"                        {printf("%s : IF\n", yytext); return IF;}
"else"                      {printf("%s : ELSE\n", yytext); return ELSE;}
"while"                     {printf("%s : WHILE\n", yytext); return WHILE;}
"for"                       {printf("%s : FOR\n", yytext); return FOR;}

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


