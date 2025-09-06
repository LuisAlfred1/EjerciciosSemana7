#include <iostream>
#include <unordered_map>
#include <string>
#include <sstream>

enum TokenType { IDENT, NUMBER, RESERVED, OPERATOR,AGROUP, UNKNOWN };

std::unordered_map<std::string, std::string> tablaSimbolos;

bool esReservada(const std::string &lex) {
    return (lex=="int" || lex=="float" || lex=="return");
}

// Función para verificar si una palabra es un operador
bool esOperador(const std::string &lex) {
    return (lex=="+" || lex=="-" || lex=="*" || lex=="/" || lex=="=");
}

// Función para verificar si una palabra es un signo de agrupación
bool esAgrupacion(const std::string &lex) {
    return (lex=="(" || lex==")" || lex=="{" || lex=="}" || lex=="[" || lex=="]");
}

void registrar(const std::string &lex, const std::string &tipo) {
    if (tablaSimbolos.find(lex)==tablaSimbolos.end())
        tablaSimbolos[lex]=tipo;
}

int main() {
    std::string linea;
    std::cout << "Ingrese codigo (ejemplo: int x; float y; return x;): ";
    std::getline(std::cin, linea);

    std::stringstream ss(linea);
    std::string palabra;

    while (ss >> palabra) {
        if (esReservada(palabra)) {
            std::cout << "Reservada: " << palabra << std::endl;
        } else if (isdigit(palabra[0])) {
            std::cout << "Numero: " << palabra << std::endl;
        } else if (isalpha(palabra[0])) {
            std::cout << "Identificador: " << palabra << std::endl;
            registrar(palabra, "var");
        } else if (esOperador(palabra)) {
            std::cout << "Operador: " << palabra <<std::endl;
        } else if (esAgrupacion(palabra)) {
            std::cout << "Signo Agrupacion: " << palabra <<std::endl;
        }else {
            std::cout << "Desconocido: " << palabra << std::endl;
        }
    }
    std::cout << "=== Tabla de simbolos ===\n";
    for (auto &p: tablaSimbolos) {
        std::cout << p.first << " -> " << p.second << std::endl;
    }
}

/*
Lo que se mejoro en el codigo:
- Identifica palabras reservadas, identificadores, números, operadores y signos de agrupación
*/