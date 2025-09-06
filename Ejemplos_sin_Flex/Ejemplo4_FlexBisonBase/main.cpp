#include <iostream>
extern int yyparse();
int main() {
    std::cout << "Ingrese una expresion (ejemplo: x = 5 + 3;): " << std::endl;

    int resultado = yyparse(); // yyparse devuelve 0 si todo OK
    if(resultado == 0) {
        std::cout << "Analisis sintactico completado sin errores." << std::endl;
    } else {
        std::cout << "Hubo errores en la expresion." << std::endl;
    }

    return 0;
}

/*
Mejoras aplicadas:
- Mensaje inicial más claro para el usuario
- Mostrar si el parseo fue exitoso o fallido
*/