cmake_minimum_required(VERSION 3.1)

set(PROJECT_LIB filedialog)

enable_language(C CXX)

add_definitions(-DCUSTOM_IMGUIFILEDIALOG_CONFIG="customfiledialogconfig.h")
add_definitions(-D_CRT_SECURE_NO_WARNINGS)

if (USE_NEW_IMGUI_KEY_SYSTEM)
	add_definitions(-DIMGUI_DISABLE_OBSOLETE_KEYIO)
endif()

file(GLOB CUSTOM_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/customimguifiledialogconfig.h)

file(GLOB RES_SOURCES 
	${CMAKE_CURRENT_SOURCE_DIR}/customfont.cpp 
	${CMAKE_CURRENT_SOURCE_DIR}/customfont.h)

file(GLOB IMGUIFILEDIALOG_SOURCES 
	${CMAKE_CURRENT_SOURCE_DIR}/imguifiledialog/*.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/imguifiledialog/*.h)

file(GLOB IMGUIIMPL_SOURCES 
	${LIBS_DIR}/imgui/backends/imgui_impl_glfw.cpp
	${LIBS_DIR}/imgui/backends/imgui_impl_glfw.h
	${LIBS_DIR}/imgui/backends/imgui_impl_opengl3.cpp
	${LIBS_DIR}/imgui/backends/imgui_impl_opengl3.h)

source_group(src\\custom FILES ${CUSTOM_SOURCES})
source_group(src\\res FILES ${RES_SOURCES})
source_group(src\\filedialog FILES ${IMGUIFILEDIALOG_SOURCES})
source_group(src\\imGuiimpl FILES ${IMGUIIMPL_SOURCES})

add_library(${PROJECT_LIB} STATIC 
	${CUSTOM_SOURCES}
	${RES_SOURCES}
	${IMGUIFILEDIALOG_SOURCES}
	${IMGUIIMPL_SOURCES}
)

target_include_directories(${PROJECT_LIB} PUBLIC
	${LIBS_DIR}/glfw
	${LIBS_DIR}/imgui
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}/filedialog
)

target_link_libraries(${PROJECT_LIB} PRIVATE
	glfw
	IMGUI
)

set_target_properties(${PROJECT_LIB} PROPERTIES FOLDER Lib)
