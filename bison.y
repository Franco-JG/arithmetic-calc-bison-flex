%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}

%union{
        char id[20];
        int val;
}
%token <val> INTEGER
%type <val> expr term factor

%%
arithm_expr:
        arithm_expr expr        { printf("%d\n", $<val>2); }
        |
        ;
expr:
        term    { $<val>$ = $<val>1; }
        | expr '+' term { $<val>$ = $<val>1 + $<val>3; }
        | expr '-' term { $<val>$ = $<val>1 - $<val>3; }
        ;
term:
        term '*' factor { $<val>$ = $<val>1 * $<val>3; }
        | term '/' factor { $<val>$ = $<val>1 / $<val>3; }
        | factor        
        ;
factor:
        INTEGER         { $<val>$ = $<val>1; }
        | '('expr')'    { $<val>$ = $<val>2; }
        ;
%%

void yyerror(char *s) {
        fprintf(stderr, "%s\n", s);
}
int main(void) {
        yyparse();
        return 0;
}