add_library(node-editor
	imgui_extra_math.h
	imgui_bezier_math.h
	imgui_node_editor_internal.h
	imgui_canvas.cpp
	imgui_canvas.h
	imgui_node_editor_api.cpp
	imgui_node_editor.cpp
	imgui_node_editor.h
	crude_json.cpp
	crude_json.h
	)

target_link_libraries(node-editor PUBLIC IMGUI)
