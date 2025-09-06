%{
#include "parser.tab.h"  // Incluye los tokens generados por Bison
#include <cstdlib>       // Para atoi
#include <cstring>       // Para strdup
%}

%option noyywrap

%%

"if"        { return IF; }
"while"     { return WHILE; }
[0-9]+      { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return IDENT; }
"="         { return '='; }
";"         { return ';'; }
"("         { return '('; }
")"         { return ')'; }
"{"         { return '{'; }
"}"         { return '}'; }
[ \t\n]     ;    // Ignorar espacios, tabs y saltos de línea
.           ;    // Ignorar cualquier otro carácter no reconocido

%%

