cmake_minimum_required(VERSION 3.20)
project(Ejemplo4 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(BISON REQUIRED)
find_package(FLEX  REQUIRED)

# Genera parser.tab.cpp y parser.tab.h
BISON_TARGET(Parser
  ${CMAKE_CURRENT_SOURCE_DIR}/parser.y
  ${CMAKE_CURRENT_BINARY_DIR}/parser.tab.cpp
  DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser.tab.h
)

# Genera lex.yy.cpp
FLEX_TARGET(Scanner
  ${CMAKE_CURRENT_SOURCE_DIR}/scanner.l
  ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.cpp
)

ADD_FLEX_BISON_DEPENDENCY(Scanner Parser)

add_executable(ejemplo4
  ${BISON_Parser_OUTPUTS}
  ${FLEX_Scanner_OUTPUTS}
  ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

# Para que #include "parser.tab.h" funcione al compilar lex.yy.cpp
target_include_directories(ejemplo4 PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

# En Windows/MSVC, para evitar warnings por strdup
if (MSVC)
  target_compile_definitions(ejemplo4 PRIVATE _CRT_SECURE_NO_WARNINGS)
endif()