cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD 17)

# Creating project
project(GioEngine VERSION 1.3.0)
set(PROJECT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(LIBS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs)

# cmake config
set(CONFIG_DIR ${PROJECT_DIR}/core/config)
configure_file(${CONFIG_DIR}/config.h.in ${CONFIG_DIR}/config.h)

# Compile the libs
add_subdirectory("libs")

# Compile part of the engine
add_subdirectory("src")

add_executable(GioEngine)
target_sources(GioEngine PUBLIC ${PROJECT_DIR}/core/main.cpp)
target_include_directories(GioEngine PUBLIC
	libs/filesystem/include/
	src/API/
	src/editor/canvas/
	src/editor/zep/include
	src/editor/zep/zep/include
	)
target_link_libraries(GioEngine PUBLIC core projectmanager canvas filedialog zep)
