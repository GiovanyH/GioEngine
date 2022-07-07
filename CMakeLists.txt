cmake_minimum_required(VERSION 3.10)

project(GioEngine VERSION 1.0.0)

configure_file(Core/Config.h.in ../Core/Config.h)

add_executable(GioEngine Core/main.cpp)

target_include_directories(GioEngine PUBLIC
	"${PROJECT_BINARY_DIR}"
	)
