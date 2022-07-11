cmake_minimum_required(VERSION 3.16)

project(GioEngine VERSION 1.2.0)

set(PROJECT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory("libs")
add_subdirectory("Editor")

configure_file(Core/Config.h.in ${PROJECT_DIR}/Core/Config.h)

add_executable(GioEngine)
include_directories(${PROJECT_DIR}/Editor/Core)
target_sources(GioEngine PUBLIC ${PROJECT_DIR}/Core/main.cpp)
target_link_libraries(GioEngine PUBLIC IMGUI Core)
set_target_properties(GioEngine PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
