%{

#include <stdio.h>


%}



%start Program

// for each type we need it in union
%union{
    int num;
    char id[100];
}

%token <num> NUM
%token <id> ID
%token INT FLOAT DOUBLE CHAR
%token IF ELSE WHILE FOR
%token EQ GT LT GTE LTE


//priorities

%right '='
%left EQ 
%left LT LTE GT GTE
%left '-' '+'
%left '*' '/' 




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

stmt:       expr
            |IF '(' expr ')' stmt
            |WHILE '(' expr ')' stmt
            |FOR '(' optexpr ';' optexpr ';' optexpr ')' stmt
            |block
            ;

optexpr:    expr
            |%empty
            ;

expr:       rel '=' expr
            |rel
            ;

rel:        rel '>' add
            |rel '<' add
            |rel '>=' add
            |rel '<=' add
            |add
            ;

add:        add '+' term
            |add '-' term
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

