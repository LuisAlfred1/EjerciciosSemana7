#include <iostream>
extern int yyparse();
int main() {
    std::cout << "Ingrese una expresion (ejemplo: x = 5 + 3;): ";
    yyparse();
    return 0;
}

/*
 Mejoras en el codigo:

 */