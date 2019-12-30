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

{id}	                    {return IDENTIFIER;}
{number}  				    {return NUMBER;}

"+"                         {return PLUS;}
"-"                         {return MINUS;}
"*"                         {return MULTIPLICATION;}
"/"                         {return DIVISION;}
"=="                        {return EQUAL;}
">"                         {return GT;}
"<"                         {return LT;}
">="                        {return GTE;}
"<="                        {return LTE;}

{delim}					    {return DELIM;}
.					        printf("unexpected character ----- \n");

%%

int yywrap(void){return 1;}
int main(void){
    int ntoken = yylex();
    while (ntoken){
        switch(ntoken){
            char* vtoken = yytext;
            case NUMBER:
                ntoken = yylex();
                if (ntoken == DELIM){
                    printf("%s is a number\n", vtoken);
                }
                else{
                    printf("unexpected character\n");
                }
        }
        ntoken = yylex();
    }
    return 0;
}
