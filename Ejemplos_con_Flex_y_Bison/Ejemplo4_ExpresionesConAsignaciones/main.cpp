#include <iostream>
extern int yyparse();
int main() {
    std::cout << "Ingrese asignaciones y expresiones (ej: x=3+2;):\n";
    yyparse();
    return 0;
}
