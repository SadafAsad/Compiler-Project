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

"int"                       |
"float"                     |
"double"                    |
"char"                      {printf("%s : TYPE\n", yytext); return TYPE;}

"if"                        {printf("%s : IF\n", yytext); return IF;}
"else"                      {printf("%s : ELSE\n", yytext); return ELSE;}
"while"                     {printf("%s : WHILE\n", yytext); return WHILE;}
"for"                       {printf("%s : FOR\n", yytext); return FOR;}

"+"                         |
"-"                         |
"*"                         |
"/"                         |
"="                         {printf("%s : OPERATION\n", yytext); return OPERATION;}

"=="                        | 
">"                         | 
"<"                         | 
">="                        | 
"<="                        {printf("%s : RELATIONAL OPERATION\n", yytext); return RELATIONAL_OPERATION;} 

";"                         {printf("%s : SEMICOLON\n", yytext); return SEMICOLON;}
"("                         {printf("%s : LEFT_PARANTHES\n", yytext); return LEFT_PARANTHES;}
")"                         {printf("%s : RIGHT_PARANTHES\n", yytext); return RIGHT_PARANTHES;}
"{"                         {printf("%s : LEFT_BRACE\n", yytext); return LEFT_BRACE;}
"}"                         {printf("%s : RIGHT_BRACE\n", yytext); return RIGHT_BRACE;}

.					        printf("unexpected character\n");

%%

int yywrap(void){return 1;}
int main(void){

    while(yylex()){}
    return 0;
    
}


