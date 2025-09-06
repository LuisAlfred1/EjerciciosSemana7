%{
#include "parser.tab.h"
#include <string.h>
%}

%option noyywrap

%%

"int"               { return INT; }
"float"             { return FLOAT; }
[a-zA-Z_][a-zA-Z0-9_]* {
                        yylval.str = strdup(yytext);  /* CORRECTO */
                        return IDENT;
                      }
";"                 { return yytext[0]; }
[ \t\n]+            ; /* Ignorar espacios en blanco */

%%
