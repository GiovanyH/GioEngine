set(CORE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Core)
set(COLOR_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Color)
set(CONFIG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Config)
add_library(Core ${CORE_DIR}/TextEditor.cpp ${CORE_DIR}/TextEditor.h)
add_library(Highlight ${COLOR_DIR}/Color.cpp)
add_library(Configurations ${CONFIG_DIR}/Config.cpp ${CONFIG_DIR}/Config.h)

target_include_directories(Core PUBLIC ${CONFIG_DIR} ${COLOR_DIR})
target_include_directories(Highlight PUBLIC ${CONFIG_DIR} ${CORE_DIR})

target_link_libraries(Highlight Configurations Core)
target_link_libraries(Core Configurations Highlight IMGUI)
