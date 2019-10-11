cmake_minimum_required(VERSION 3.14)

set(CMAKE_CXX_STANDARD 17)

find_package(BISON)
find_package(FLEX)


BISON_TARGET(parser ${CMAKE_CURRENT_SOURCE_DIR}/turing.y ${CMAKE_CURRENT_BINARY_DIR}/turingparser.cpp)
FLEX_TARGET(scanner ${CMAKE_CURRENT_SOURCE_DIR}/turing.l ${CMAKE_CURRENT_BINARY_DIR}/turinglexer.cpp)
ADD_FLEX_BISON_DEPENDENCY(scanner parser)

#add_definitions(-DLLDEBUG)

include_directories(${CMAKE_CURRENT_BINARY_DIR})

add_library(TuringParser ${BISON_parser_OUTPUTS} ${FLEX_scanner_OUTPUTS})

target_link_libraries(TuringParser fl)