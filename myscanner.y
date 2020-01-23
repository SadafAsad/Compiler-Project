%{

#include <stdio.h>


%}

%start Program

%token <num> NUM
%token <id> ID
%token INT FLOAT DOUBLE CHAR
%token IF ELSE WHILE FOR
%token EQ GT LT GET LET

%%

Program:    block
            ;

block:      '{' decls stms '}'
            ;

decls:      decls decl
            |%empty
            ;

decl:       INT ID
            |FLOAT ID
            |DOUBLE ID
            |CHAR ID
            ;

stms:       stmts stmt
            |%empty
            ;

stmt:       block
            |expr
            ;
            
expr:       expr '+' term
            |expr '-' term
            |term
            ;

term:       term '*' factor
            |term '/' factor
            |factor
            ;

factor:     '(' expr ')'
            |num
            |id
            ;


%%

