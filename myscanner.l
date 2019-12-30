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

%%

"int"                       |
"float"                     |
"double"                    |
"char"                      {printf("%s : TYPE\n", yytext); return TYPE;}

"if"                        {printf("%s : IF\n", yytext); return IF;}
"else"                      {printf("%s : ELSE\n", yytext); return ELSE;}
"while"                     {printf("%s : WHILE\n", yytext); return WHILE;}
"for"                       {printf("%s : FOR\n", yytext); return FOR;}

{id}	                    {printf("%s : id\n", yytext); return IDENTIFIER;}
{number}  				    {printf("%s : number\n", yytext); return NUMBER;}

"+"                         |
"++"                        |
"-"                         |
"--"                        |
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
"{"                         {printf("%s : LEFT_BRACKET\n", yytext); return LEFT_BRACKET;}
"}"                         {printf("%s : RIGHT_BRACKET\n", yytext); return RIGHT_BRACKET;}

{delim}					    ;
.					        printf("unexpected character\n");

%%

int yywrap(void){return 1;}
int main(void){
    // int ntoken = yylex();
    // while (ntoken){
    //     switch(ntoken){
    //         case NUMBER:
    //             ntoken = yylex();
    //             if (ntoken == DELIM){
    //                 printf("%s is a number\n", yytext);
    //             }
    //             else{
    //                 printf("unexpected character\n");
    //             }
    //     }
    //     ntoken = yylex();
    // }
    while(yylex()){}
    return 0;
}


