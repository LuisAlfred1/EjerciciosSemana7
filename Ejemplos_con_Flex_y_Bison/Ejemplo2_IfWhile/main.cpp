#include <iostream>
extern int yyparse();
int main() {
    std::cout << "Ingrese código (ejemplo: if (x) { y = 5; }):\n";
    yyparse();
    return 0;
}
/*
    Se hicieron cambios en Cmakelist para que genere el archivo parser.tab.h,
    parser.y y scanner.l
*/
