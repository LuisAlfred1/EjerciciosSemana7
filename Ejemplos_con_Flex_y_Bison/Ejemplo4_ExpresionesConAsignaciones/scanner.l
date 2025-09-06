%{
#include "parser.tab.h"
#include <cstdlib>  // atoi
#include <cstring>  // strdup
%}

%option noyywrap

%%

[0-9]+        { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return IDENT; }
"="           { return '='; }
";"           { return ';'; }
[+\-*/]       { return yytext[0]; }
[ \t\n]       ;
.             ;

%%
