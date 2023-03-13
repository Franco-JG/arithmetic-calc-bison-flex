%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token INTEGER

%%
arithm_expr:
        arithm_expr expr        { printf("%d\n", $2); }
        |
        ;
expr:
        term    { $$ = $1; }
        | expr '+' term { $$ = $1 + $3; }
        | expr '-' term { $$ = $1 - $3; }
        ;
term:
        term '*' factor { $$ = $1 * $3; }
        | term '/' factor { $$ = $1 / $3; }
        | factor
        ;
factor:
        INTEGER         { $$ = $1; }
        | '('expr')'    { $$ = $2; }
        ;
%%

void yyerror(char *s) {
        fprintf(stderr, "%s\n", s);
}
int main(void) {
        yyparse();
        return 0;
}