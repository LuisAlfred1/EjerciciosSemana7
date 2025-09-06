cmake_minimum_required(VERSION 3.10)
project(Ejemplo3_TablaSimbolosFlex)
find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)
#Se añadio DEFINES_FILE para que genero el archivo parser.tab.h, ya que no lo encontraba el compilador
BISON_TARGET(Parser parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.tab.cpp
        DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser.tab.h)

FLEX_TARGET(Scanner scanner.l ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.cpp)
ADD_FLEX_BISON_DEPENDENCY(Scanner Parser)

# Se agrega el directorio donde se generan parser.tab.h y lex.yy.cpp
include_directories(${CMAKE_CURRENT_BINARY_DIR})

add_executable(tabla main.cpp ${BISON_Parser_OUTPUTS} ${FLEX_Scanner_OUTPUTS})
