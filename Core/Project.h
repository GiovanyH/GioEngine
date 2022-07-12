#pragma once
#include <vector>
#include <string>
void create_gioengine_directory();
void load_gioengine_directory();
void load_gioengine_projects();
void reload_gioengine_projects();
void show_gioengine_projects();
void create_gioengine_project(const char *project_name, const char *project_directory);
void load_gioengine_project(const char *project_name);
std::vector<std::string> get_user_projects();
