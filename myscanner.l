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

{id}	                    {printf("%s : id\n", yytext); return IDENTIFIER;}
{number}  				    {printf("%s : number\n", yytext); return NUMBER;}

"int"                       |
"float"                     |
"double"                    |
"char"                      {printf("%s : TYPE\n", yytext); return TYPE;}

"if"                        {printf("%s : IF\n", yytext); return IF;}
"else"                      {printf("%s : ELSE\n", yytext); return ELSE;}
"while"                     {printf("%s : WHILE\n", yytext); return WHILE;}

"+"                        |
"-"                        |
"*"                        |
"/"                        |
"="                        {printf("%s : OPERATION\n", yytext); return OPERATION;}

"=="                       | 
">"                        | 
"<"                        | 
">="                       | 
"<="                       {printf("%s : RELATIONAL OPERATION\n", yytext); return RELATIONAL_OPERATION;} 

{delim}					    {return DELIM;}
.					        printf("unexpected character ----- \n");

%%

int yywrap(void){return 1;}
int main(void){
    int ntoken = yylex();
    while (ntoken){
        switch(ntoken){
            case NUMBER:
                ntoken = yylex();
                if (ntoken == DELIM){
                    printf("%s is a number\n", yytext);
                }
                else{
                    printf("unexpected character\n");
                }
        }
        ntoken = yylex();
    }
    return 0;
}


