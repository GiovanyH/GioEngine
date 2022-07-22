set(CONFIG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/config)
set(CANVAS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/canvas)
set(ZEP_DIR ${CMAKE_CURRENT_SOURCE_DIR}/zep/zep)
add_subdirectory(zep)
add_library(configurations ${CONFIG_DIR}/config.cpp ${CONFIG_DIR}/config.h)

add_library(canvas ${CANVAS_DIR}/canvas.cpp ${CANVAS_DIR}/canvas.h)

target_include_directories(zep PUBLIC ${CONFIG_DIR} ${COLOR_DIR})

target_link_libraries(configurations zep IMGUI filedialog)
target_link_libraries(canvas IMGUI)
