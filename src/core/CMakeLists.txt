add_library(projectmanager projectmanager/project.cpp projectmanager/project.h)
target_include_directories(projectmanager PRIVATE 
	../../libs/filesystem/include/)