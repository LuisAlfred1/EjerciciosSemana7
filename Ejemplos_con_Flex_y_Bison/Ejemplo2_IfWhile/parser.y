%{
#include <iostream>
#include <string>
#include <unordered_map>
#include <cstring> // Para strdup y free

using namespace std;

extern int yylex();
void yyerror(const char *s) { cerr << "Error: " << s << endl; }

unordered_map<string, int> tabla;
%}

%union {
    int num;      // Para números
    char* str;    // Para identificadores
}

%token <str> IDENT
%token <num> NUMBER
%token IF WHILE

%%

stmt:
      IF '(' IDENT ')' '{' stmt '}'
        {
            cout << "Estructura IF con var: " << $3 << endl;
            free($3);
        }
    | WHILE '(' IDENT ')' '{' stmt '}'
        {
            cout << "Estructura WHILE con var: " << $3 << endl;
            free($3);
        }
    | IDENT '=' NUMBER ';'
        {
            tabla[$1] = $3;
            cout << "Asignación: " << $1 << " = " << $3 << endl;
            free($1);
        }
    ;

%%

