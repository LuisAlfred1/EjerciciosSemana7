%{
#include <iostream>
#include <string>
#include <unordered_map>
#include <cstdlib> // Para free()

extern int yylex();
void yyerror(const char *s){ std::cerr << "Error: " << s << std::endl; }
extern std::unordered_map<std::string,std::string> tabla;
%}

%union {
    char* str;  /* Esto define que yylval puede almacenar un char* */
}

%token <str> IDENT
%token INT FLOAT

%%

decl:
      INT IDENT ';' {
          tabla[std::string($2)] = "int";
          std::cout << "Decl int: " << $2 << std::endl;
          free($2); /* Liberar memoria reservada con strdup */
      }
    | FLOAT IDENT ';' {
          tabla[std::string($2)] = "float";
          std::cout << "Decl float: " << $2 << std::endl;
          free($2);
      }
    ;

%%
