set(CORE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/core)
set(COLOR_DIR ${CMAKE_CURRENT_SOURCE_DIR}/color)
set(CONFIG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/config)
set(CANVAS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/canvas)
set(DIALOG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/filedialog)
add_library(core ${CORE_DIR}/texteditor.cpp ${CORE_DIR}/texteditor.h)
add_library(highlight ${COLOR_DIR}/color.cpp)
add_library(configurations ${CONFIG_DIR}/config.cpp ${CONFIG_DIR}/config.h)
add_subdirectory(filedialog)

add_library(canvas ${CANVAS_DIR}/canvas.cpp ${CANVAS_DIR}/canvas.h)

target_include_directories(core PUBLIC ${CONFIG_DIR} ${COLOR_DIR})
target_include_directories(highlight PUBLIC ${CONFIG_DIR} ${CORE_DIR})

target_link_libraries(highlight configurations core)
target_link_libraries(core configurations highlight IMGUI filedialog)
target_link_libraries(canvas IMGUI)
