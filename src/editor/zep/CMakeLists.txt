cmake_minimum_required(VERSION 3.15)

if (WIN32)
    set(VCPKG_TARGET_TRIPLET x64-windows-static-md)
endif()

project(Example)

find_package(Freetype REQUIRED)

# Set this if we are sitting on SDL
add_definitions(-DZEP_USE_SDL)

# Set this to get the default file system
add_definitions(-DZEP_FEATURE_CPP_FILE_SYSTEM)

# Set this to use a lib instead of the single header build
#set (ZEP_LIB 1)

if (DEFINED ZEP_LIB)
add_subdirectory(zep/src)
else()
add_definitions(-DZEP_SINGLE_HEADER=1)
endif()

set(APP_ROOT ${CMAKE_CURRENT_LIST_DIR})
configure_file(${CMAKE_CURRENT_LIST_DIR}/cmake/config_app.h.cmake ${CMAKE_BINARY_DIR}/config_app.h)

set(SOURCES src/main.cpp
    src/editor.cpp
    include/editor.h)

if (WIN32)
set(SOURCES ${SOURCES}
    src/app.manifest)
endif()
add_library(zep ${SOURCES})

target_include_directories(zep
    PRIVATE
    ${CMAKE_CURRENT_LIST_DIR} 
    ${CMAKE_BINARY_DIR}
    zep/include
    include
    )

SET(GCC_COVERAGE_COMPILE_FLAGS "-lstdc++fs")
target_link_libraries(zep PRIVATE IMGUI freetype stdc++fs)

if (DEFINED ZEP_LIB)
target_link_libraries(zep PRIVATE Zep::Zep)
endif()
