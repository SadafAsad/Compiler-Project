%{

#include "myscanner.tab.h"
#include<string.h>

%}

delim     [ \t\n\r] 
letter    [A-Za-z] 
digit     [0-9]	

%%

{delim}+                                        {;} 
{letter}({letter}|{digit})*                     {strcpy(yylval.id , yytext); return ID;}
{digit}+(\.{digit}+)?(E[+\-]?{digit}+)?         {strcpy(yylval.num , yytext); return NUM;}
[+-*/=(){};]                                    {return yytext[0];}

"int"                       {return INT;}
"float"                     {return FLOAT;}
"double"                    {return DOUBLE;}
"char"                      {return CHAR;}

"if"                        {return IF;}
"else"                      {return ELSE;}
"while"                     {return WHILE;}
"for"                       {return FOR;}

"=="                        {strcpy(yylval.str, yytext); return EQ;} 
">"                         {strcpy(yylval.str, yytext); return GT;} 
"<"                         {strcpy(yylval.str, yytext); return LT;} 
">="                        {strcpy(yylval.str, yytext); return GET;} 
"<="                        {strcpy(yylval.str, yytext); return LET;}

.					        printf("unexpected character\n");

%%


