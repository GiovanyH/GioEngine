cmake_minimum_required(VERSION 3.16)

# Creating project
project(GioEngine VERSION 1.3.0)
set(PROJECT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

# cmake config
set(CONFIG_DIR ${PROJECT_DIR}/Core/Config)
configure_file(${CONFIG_DIR}/Config.h.in ${CONFIG_DIR}/Config.h)

# Compile the libs
add_subdirectory("libs")

# Compile part of the engine
add_subdirectory("src")

add_executable(GioEngine)
target_sources(GioEngine PUBLIC ${PROJECT_DIR}/Core/main.cpp)
target_link_libraries(GioEngine PUBLIC Core ProjectManager Canvas)
