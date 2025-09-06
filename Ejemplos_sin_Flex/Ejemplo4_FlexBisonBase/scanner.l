%{
#include <cstdlib>
#include <cstring>
#include "parser.tab.h"  /* generado por Bison gracias a %defines */
%}

%%

[ \t\r\n]+           /* ignorar espacios */ ;

[A-Za-z_][A-Za-z0-9_]* {
  /* Copia yytext, porque Flex reutiliza el buffer */
  yylval.sval = _strdup(yytext); /* en MSVC: _strdup */
  return ID;
}

[0-9]+ {
  yylval.ival = std::atoi(yytext);
  return NUMBER;
}

"="                  return '=';
";"                  return ';';
"("                  return '(';
")"                  return ')';
"+"                  return '+';
"-"                  return '-';
"*"                  return '*';
"/"                  return '/';

. { /* caracter inesperado, podrías reportar un error si lo deseas */ }

%%

int yywrap(void) { return 1; }