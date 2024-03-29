cmake_policy(SET CMP0077 NEW)
set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)

add_subdirectory(glfw)
add_subdirectory(string-view-lite)

#================== FILEDIALOG ================= 
add_library(filedialog STATIC)

set(DIALOG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/nativefiledialog)

if (UNIX)
target_sources(filedialog
	PRIVATE
		${DIALOG_DIR}/src/nfd_common.c
		${DIALOG_DIR}/src/nfd_zenity.c
	)
endif (UNIX)
if (WIN32)
target_sources(filedialog
	PRIVATE
		${DIALOG_DIR}/src/nfd_common.c
		${DIALOG_DIR}/src/nfd_win.c
	)
endif (WIN32)
target_include_directories(filedialog
		PUBLIC ${DIALOG_DIR}/src/include
		PUBLIC ${DIALOG_DIR}/src/
	)
#================== IMGUI ================= 

set(IMGUI_DIR ${CMAKE_CURRENT_SOURCE_DIR}/imgui)
add_library(IMGUI STATIC)

target_sources(IMGUI
	PRIVATE
		${IMGUI_DIR}/imgui_demo.cpp
		${IMGUI_DIR}/imgui_draw.cpp
		${IMGUI_DIR}/imgui_tables.cpp
		${IMGUI_DIR}/imgui_widgets.cpp
		${IMGUI_DIR}/imgui.cpp

	PRIVATE
		${IMGUI_DIR}/backends/imgui_impl_opengl3.cpp
		${IMGUI_DIR}/backends/imgui_impl_glfw.cpp
	)

target_include_directories(IMGUI
	PUBLIC ${PROJECT_DIR}/Core
	PUBLIC ${PROJECT_DIR}/Editor/Canvas
	PUBLIC ${IMGUI_DIR}
	PUBLIC ${IMGUI_DIR}/backends
	)

if(USE_GLES OR RASPBIAN)
	target_compile_definitions(IMGUI PUBLIC -DIMGUI_IMPL_OPENGL_ES2)

	if(RASPBIAN AND RPI_USE_BROADCOM_DRIVER)
		target_link_directories(IMGUI PUBLIC /opt/vc/lib)
		target_link_libraries(IMGUI PUBLIC brcmGLESv2 brcmEGL)
	else()
		target_link_libraries(IMGUI PUBLIC GLESv2)
	endif()
else()
	find_package(OpenGL REQUIRED)
	target_link_libraries(IMGUI PUBLIC ${OPENGL_LIBRARIES})
endif()

target_link_libraries(IMGUI PUBLIC glfw ${OPENGL_gl_LIBRARY} ${CMAKE_DL_LIBS})