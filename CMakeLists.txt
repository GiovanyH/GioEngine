cmake_minimum_required(VERSION 3.16)

project(GioEngine VERSION 1.1.0)

set(PROJECT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory("libs")

configure_file(Core/Config.h.in ${PROJECT_DIR}/Core/Config.h)
