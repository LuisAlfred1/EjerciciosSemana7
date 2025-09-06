cmake_minimum_required(VERSION 3.10)
project(Ejemplo2_IfWhile)
find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)
# Aqui se genera el archivo de bison que anteoriormente no lo generaba correctamente
BISON_TARGET(Parser parser.y
        ${CMAKE_CURRENT_BINARY_DIR}/parser.tab.cpp
        DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser.tab.h
)

FLEX_TARGET(Scanner scanner.l ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.cpp)
ADD_FLEX_BISON_DEPENDENCY(Scanner Parser)

# Se agrega el directorio donde se generan parser.tab.h y lex.yy.cpp
include_directories(${CMAKE_CURRENT_BINARY_DIR})

#Ahora si se crea el ejecutable
add_executable(ifwhile main.cpp ${BISON_Parser_OUTPUTS} ${FLEX_Scanner_OUTPUTS})
