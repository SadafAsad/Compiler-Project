%{

#include "myscanner.tab.h"


%}

delim     [ \t\n\r] 
letter    [A-Za-z] 
digit     [0-9]	

%%

{delim}+                                        {;} 
{letter}({letter}|{digit})*                     {return ID;}
{digit}+(\.{digit}+)?(E[+\-]?{digit}+)?         {return NUM;}
[+-*/=(){};]                                    {return yytext[0];}

"int"                       {return INT;}
"float"                     {return FLOAT;}
"double"                    {return DOUBLE;}
"char"                      {return CHAR;}

"if"                        {return IF;}
"else"                      {return ELSE;}
"while"                     {return WHILE;}
"for"                       {return FOR;}

"=="                        {return EQ;} 
">"                         {return GT;} 
"<"                         {return LT;} 
">="                        {return GET;} 
"<="                        {return LET;}

.					        printf("unexpected character\n");

%%



