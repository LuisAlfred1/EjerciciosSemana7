%{
#include <iostream>
#include <string>
#include <unordered_map>
#include <cstdlib>  // Para free()
extern int yylex();
void yyerror(const char *s){ std::cerr << "Error: " << s << std::endl; }
std::unordered_map<std::string,int> tabla;
%}

%union {
    char* str;
    int num;
}

%token <str> IDENT
%token <num> NUMBER

%type <num> expr stmt program

%left '+' '-'
%left '*' '/'

%%

program:
      /* vacío */
    | program stmt
    ;

stmt:
      IDENT '=' expr ';' {
          tabla[std::string($1)] = $3;
          std::cout << "Asignación: " << $1 << " = " << $3 << std::endl;
          free($1);
      }
    ;

expr:
      expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | NUMBER        { $$ = $1; }
    | IDENT         {
          std::string var($1);
          if(tabla.find(var) != tabla.end())
              $$ = tabla[var];
          else {
              std::cerr << "Error: variable no definida '" << var << "'\n";
              $$ = 0;
          }
          free($1);
      }
    ;

%%
