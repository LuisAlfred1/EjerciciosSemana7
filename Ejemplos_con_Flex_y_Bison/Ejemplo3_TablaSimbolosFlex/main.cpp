#include <iostream>
#include <unordered_map>
#include <string>
extern int yyparse();
std::unordered_map<std::string,std::string> tabla;
int main() {
    std::cout << "Ingrese código con variables:\n";
    yyparse();
    std::cout << "=== Tabla de símbolos ===\n";
    for (auto &p: tabla) std::cout << p.first << " -> " << p.second << std::endl;
    return 0;
}
