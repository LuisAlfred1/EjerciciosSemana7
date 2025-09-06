%{
#include <cstdio>
#include <cstdlib>
#include <string>
#include <unordered_map>

// Tabla de símbolos de ejemplo (ajústala a tu diseño)
static std::unordered_map<std::string, int> tabla;

int yylex();
void yyerror(const char* s) { std::fprintf(stderr, "Error: %s\n", s); }
%}

/* Activa la generación del header parser.tab.h para el scanner */
%defines

/* Tipado de valores semánticos (modo C) */
%union {
  int    ival; /* para números/expresiones */
  char*  sval; /* para identificadores */
}

/* Anota tokens con su tipo del %union (ajusta los nombres a tu gramática) */
%token <sval> ID
%token <ival> NUMBER
%type  <ival> expr

%%

/* Reglas de ejemplo; ajusta a tu gramática real */
stmt
  : ID '=' expr ';'
      {
        /* $1 es char*, conviene convertir a std::string para la tabla */
        tabla[std::string($1)] = $3;
        std::free($1); /* evita fugas si usas strdup en el scanner */
      }
  | expr ';'
      { /* ej: imprimir o ignorar */ }
  ;

expr
  : expr '+' expr   { $$ = $1 + $3; }
  | expr '-' expr   { $$ = $1 - $3; }
  | expr '*' expr   { $$ = $1 * $3; }
  | expr '/' expr   { $$ = $1 / $3; }
  | '(' expr ')'    { $$ = $2; }
  | NUMBER          { $$ = $1; }
  | ID
      {
        /* Si el ID no existe en la tabla, operador[] lo crea en 0 */
        $$ = tabla[std::string($1)];
        std::free($1);
      }
  ;

%%

