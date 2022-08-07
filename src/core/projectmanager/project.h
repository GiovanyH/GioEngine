#pragma once
#include <vector>
#include <string>
bool get_gioengine_directory_exists();
void set_gioengine_directory_exists(bool value);
void create_gioengine_directory();
void load_gioengine_directory();
void load_gioengine_projects();
void reload_gioengine_projects();
void show_gioengine_projects();
std::string create_gioengine_project(const char *project_name, const char *project_directory);
void load_gioengine_project(const char *project_name);
void update_included();
void delete_gioengine_project(std::string project_name);
std::vector<std::string> get_user_projects();
std::string get_current_project_dir();
void set_current_project_dir(std::string dir);
