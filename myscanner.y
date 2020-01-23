%{
#include <stdio.h>
#include <stdlib.h>
%}

%start Start

%token <num> NUM
%token <id> ID
%token INT FLOAT DOUBLE char
%token IF ELSE WHILE FOR
%token EQ GT LT GET LET

%%

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
