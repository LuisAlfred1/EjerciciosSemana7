#include <iostream>
#include <string>
#include <sstream>
#include <unordered_map>

std::unordered_map<std::string,std::string> tabla;

bool esReservada(const std::string &lex) {
    return lex=="if" || lex=="while" || lex=="for";
}

bool esOperador(const std::string &lex) {
    return lex=="=="||lex=="!="||lex=="<"||lex=="<="||lex==">"||lex==">=";
}

//Se agregó la función para operadores aritmeticos
bool esOperadorArit(const std::string &lex) {
    return lex=="+"||lex=="-"||lex=="*"||lex=="/"||lex=="=";
}

//Se agregó la función para signos de agrupación
bool esAgrupacion(const std::string &lex) {
    return lex=="("||lex==")"||lex=="{"||lex=="}"||lex=="["||lex=="]";
}

int main() {
    std::cout << "Ingrese codigo (ejemplo: if x <= 5 { while y != 0 { y = y - 1; } }):\n";
    std::string entrada;
    std::getline(std::cin, entrada);
    std::stringstream ss(entrada);
    std::string tok;
    while (ss >> tok) {
        if (esReservada(tok)) {
            std::cout << "Reservada: " << tok << std::endl;
        } else if (esOperador(tok)) {
            std::cout << "Operador relacional: " << tok << std::endl;
        }else if (esOperadorArit(tok)) {
            std::cout << "Operador aritmetico: " << tok << std::endl;
        }else if (esAgrupacion(tok)) {
            std::cout << "Signo de Agrupacion: " << tok << std::endl;
        }else if (isdigit(tok[0])) {
            std::cout << "Numero: " << tok << std::endl;
        } else if (isalpha(tok[0])) {
            std::cout << "Identificador: " << tok << std::endl;
            tabla[tok]="var";
        } else {
            std::cout << "Simbolo: " << tok << std::endl;
        }
    }
    std::cout << "--- Tabla de simbolos ---\n";
    for (auto &p: tabla) std::cout << p.first << " : " << p.second << std::endl;
}

/*
 Mejora de este codigo:
 Se agrego funciones para reconoces los operadores aritmeticos y signos de agrupación.
 *
 */