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



int yywrap(){
	return 1;
}

int main(){
	yyparse();
}