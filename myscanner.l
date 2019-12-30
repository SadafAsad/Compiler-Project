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

{letter}({letter}|{digit})*	                               {return IDENTIFIER;}
{digit}+(\.{digit}+)?(E[+\-]?{digit}+)?  				   {return NUMBER;}

"+"                         {return PLUS;}
"-"                         {return MINUS;}
"*"                         {return MULTIPLICATION;}
"/"                         {return DIVISION;}
"=="                        {return EQUAL;}
">"                         {return GT;}
"<"                         {return LT;}
">="                        {return GTE;}
"<="                        {return LTE;}

{delim}					    ;
.					        printf("unexpected character ----- \n");

%%

int yywrap(void){return 1;}
int main(void){
    int ntoken = yylex();
    while (ntoken){
        switch(ntoken){
            case NUMBER:
                ntoken = yylex();
                if(ntoken != NUMBER){
                    printf("unexpected character\n");
                }
                else{
                    printf("%s is a number \n", yytext);
                }
        }
        ntoken = yylex();
    }
    return 0;
}
