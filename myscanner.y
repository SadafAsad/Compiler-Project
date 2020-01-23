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
%token RELOP

//priorities

%right '='
%left RELOP
%left '-' '+'
%left '*' '/' 

%%

Program:    
    block   {;}
    ;

block:      
    '{' {printf("{\n");} decls stms '}' {printf(";\n}\n");}
    ;

decls:      
    INT IDs ';'         {printf("int %s", $2);}
    |FLOAT IDs ';'      {printf("float %s", $2);}
    |DOUBLE IDs ';'     {printf("double %s", $2);}
    |CHAR IDs ';'       {printf("char %s", $2);}
    ;

IDs:        
    IDs ',' ID          {sprintf($$, "%s, %s", $1, $3);} 
    |ID                 {sprintf($$, "%s",$1);}
    |ID '=' expr        {sprintf($$, "%s = %s", $1, $3);}
    ;

stms:       
    stmts stmt  {;}
    |%empty     {;}
    ;

stmt:       
    expr ';'
    |IF '(' expr ')' stmt ELSE stmt
    |WHILE '(' expr ')' stmt
    |FOR '(' optexpr ';' optexpr ';' optexpr ')' stmt
    |block
    ;

optexpr:    
    expr            {strcpy($$, $1);}
    |%empty         {;}
    ;

expr:       
    ID '=' expr     {strcpy($$, $3); printf("%s = %s;\n", $1, $3);}
    |rel            {strcpy($$, $1);}
    ;

rel:        
    rel RELOP add       {sprintf($$, "t%d", tempVar++); printf("int %s = %s %s %s;\n", $$, $1, $2, $3);}
    |add                {strcpy($$, $1);}
    ;

add:        
    add '+' term        {sprintf($$, "t%d", tempVar++); printf("int %s = %s + %s;\n", $$, $1, $3);}
    |add '-' term       {sprintf($$, "t%d", tempVar++); printf("int %s = %s - %s;\n", $$, $1, $3);}
    |term               {strcpy($$, $1);}
    ;

term:       
    term '*' factor     {sprintf($$, "t%d", tempVar++); printf("int %s = %s * %s;\n", $$, $1, $3);}
    |term '/' factor    {sprintf($$, "t%d", tempVar++); printf("int %s = %s / %s;\n", $$, $1, $3);}
    |factor             {strcpy($$, $1);}
    ;

factor:     
    '(' expr ')'        {strcpy($$, $2);}
    |num                {strcpy($$, $1);}
    |id                 {strcpy($$, $1);}
    ;

%%


