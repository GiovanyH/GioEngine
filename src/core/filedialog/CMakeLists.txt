cmake_minimum_required(VERSION 3.1)

set(PROJECT_LIB ImGuiFileDialog)

enable_language(C CXX)

add_definitions(-DCUSTOM_IMGUIFILEDIALOG_CONFIG="CustomImGuiFileDialogConfig.h")
add_definitions(-D_CRT_SECURE_NO_WARNINGS)

if (USE_NEW_IMGUI_KEY_SYSTEM)
	add_definitions(-DIMGUI_DISABLE_OBSOLETE_KEYIO)
endif()

file(GLOB CUSTOM_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/CustomImGuiFileDialogConfig.h)

file(GLOB RES_SOURCES 
	${CMAKE_CURRENT_SOURCE_DIR}/CustomFont.cpp 
	${CMAKE_CURRENT_SOURCE_DIR}/CustomFont.h)

file(GLOB IMGUIFILEDIALOG_SOURCES 
	${CMAKE_CURRENT_SOURCE_DIR}/ImGuiFileDialog/*.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/ImGuiFileDialog/*.h)

file(GLOB IMGUIIMPL_SOURCES 
	${LIBS_DIR}/imgui/backends/imgui_impl_glfw.cpp
	${LIBS_DIR}/imgui/backends/imgui_impl_glfw.h
	${LIBS_DIR}/imgui/backends/imgui_impl_opengl3.cpp
	${LIBS_DIR}/imgui/backends/imgui_impl_opengl3.h)

source_group(src\\Custom FILES ${CUSTOM_SOURCES})
source_group(src\\Res FILES ${RES_SOURCES})
source_group(src\\ImGuiFileDialog FILES ${IMGUIFILEDIALOG_SOURCES})
source_group(src\\ImGuiImpl FILES ${IMGUIIMPL_SOURCES})

if (APPLE)
	##set(ICON icon.icns)
	##set_source_files_properties(icon.icns PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")
endif()

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
	${CMAKE_CURRENT_SOURCE_DIR}/ImGuiFileDialog
)

target_link_libraries(${PROJECT_LIB} PRIVATE
	glfw
	IMGUI
)

set_target_properties(${PROJECT_LIB} PROPERTIES FOLDER Lib)
