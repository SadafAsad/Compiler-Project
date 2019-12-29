%{
#include "myscanner.h"
%}
%option nounput yylineno

%%
+                       return EXPRESSION;
-                       return EXPRESSION;
*                       return EXPRESSION;
/                       return EXPRESSION;
==                      return EXPRESSION;
>                       return EXPRESSION;
<                       return EXPRESSION;
>=                      return EXPRESSION;
<=                      return EXPRESSION;

[a-zA-Z][_a-zA-Z0-9]*	return IDENTIFIER;
[1-9][0-9]*				return INTEGER;
[ \t\n]					;

.					printf("unexpected character\n");

%%

int yywrap(void)
{
	return 1;
}
