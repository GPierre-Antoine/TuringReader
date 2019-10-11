cmake_minimum_required(VERSION 3.14)
project(TuringReader)

set(CMAKE_CXX_STANDARD 17)

include_directories(${CMAKE_CURRENT_BINARY_DIR})

include_directories("${CMAKE_CURRENT_BINARY_DIR}/TuringParser")
add_subdirectory(TuringParser)
set(EXTRA_LIBS ${EXTRA_LIBS} TuringParser)


add_executable(TuringReader main.cpp)
target_link_libraries(TuringReader ${EXTRA_LIBS})