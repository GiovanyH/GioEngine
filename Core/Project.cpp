#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stdio.h>
#include <stdlib.h>
#include <filesystem>

#include <unistd.h>
#ifdef linux
#include <sys/types.h>
#include <pwd.h>
#endif
#ifdef _WIN32
#endif

#include "Project.h"

struct passwd *pw = getpwuid(getuid());
std::string homedir = pw->pw_dir;

std::string gioengine_directory = homedir + "/.GioEngine";
std::vector<std::string> UserProjects;

void create_gioengine_directory() {
	std::filesystem::create_directory(gioengine_directory);
}

void load_gioengine_directory() {
	if(!std::filesystem::exists(gioengine_directory)) create_gioengine_directory();
}

void load_gioengine_projects() {
	load_gioengine_directory();

	std::string file_path = gioengine_directory + std::string("/user_projects.gio");

	std::ifstream user_projects_file(file_path.c_str());

	std::string str;
	while(std::getline(user_projects_file, str)) {
		if(str.size() > 0) UserProjects.push_back(str);
	}
	user_projects_file.close();
}

void show_gioengine_projects() {
	for(auto Project : UserProjects) std::cout << Project << std::endl;
}

void create_gioengine_project(const char *project_name) {
	std::string file_path = gioengine_directory + std::string("/user_projects.gio");

	std::ofstream user_projects_file;
	user_projects_file.open(file_path.c_str(), std::ios_base::app);

	user_projects_file << '\n' << project_name;

	user_projects_file.close();
}

void load_gioengine_project(const char *project_name) {
	load_gioengine_directory();
}

int main(void) {
	load_gioengine_projects();
	show_gioengine_projects();

	std::string project_name;
	std::cin >> project_name;

	create_gioengine_project(project_name.c_str());
}
