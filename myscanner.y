%{
#include <stdio.h>
#include <stdlib.h>
%}

%union {int num; char id;}
%start line
%token print
%token exit_command
%token <num> number
%token <id> identifier
%type <num> line exp term
%type <id> assignment

%%

line    :    assignment ';'      {;}
        |    exit_command ';'    {exit(EXIT_SUCCESS);}
        |    print exp ';'       {printf("Printing %d\n", $2);} 
        ;  

expr    :   expr '+' term
        |   expr '-' term
        |   term
        ;

term    :   term '*' factor
        |   term '/' factor
        |   factor
        ;

factor  :   '(' expr ')'
        |   num
        |   id
        ;


%%

void yyerror(char *s){fprintf(stderr, "%s\n", s);}
