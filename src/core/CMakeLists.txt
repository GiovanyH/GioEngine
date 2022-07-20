add_subdirectory(ImGuiFileDialog)
add_library(ProjectManager ProjectManager/Project.cpp ProjectManager/Project.h) 
target_include_directories(ProjectManager PUBLIC 
	${LIBS_DIR}/filesystem/include
	${LIBS_DIR}/string-view-lite/include
	${PROJECT_DIR}/Core/ImGuiFileDialog/ImGuiFileDialog
	)
