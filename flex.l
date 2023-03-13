%option yylineno
%option noyywrap

%{
#include <stdlib.h>
void yyerror(char *);
#include "bison.tab.h"
%}

%%
[0-9]+      {
				//se convierte a int el char de *yytext
				yylval = atoi(yytext);
				return INTEGER;}

[-+/*()]    {	
				//retorna el caracter
				return *yytext;}

[ \t]       ; /* skip whitespace */

[\n]		{	
				//contador de lineas
				yylineno++;}

.           {	
				//cualquier caracter no perteneciente
				yyerror("invalid character");}

%%

