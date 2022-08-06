#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stdio.h>
#include <stdlib.h>

#include "ghc/filesystem.hpp"

#include <unistd.h>
#ifdef linux
#include <sys/types.h>
#include <pwd.h>
#endif
#ifdef _WIN32
#endif

#include "project.h"

using namespace ghc;

std::vector<std::string> UserProjects;

#ifdef linux
struct passwd *pw = getpwuid(getuid());
std::string homedir = pw->pw_dir;
#endif

#ifdef _WIN32
std::string homedir = getenv("USERPROFILE");
#endif

std::string gioengine_directory = homedir + "/.GioEngine";
std::string current_project_directory;

void create_gioengine_directory() {
	filesystem::create_directory(gioengine_directory);
}

void load_gioengine_directory() {
	if(!filesystem::exists(gioengine_directory)) create_gioengine_directory();
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

void reload_gioengine_projects() {
	UserProjects.clear();
	load_gioengine_projects();
}

void show_gioengine_projects() {
	for(auto Project : UserProjects) std::cout << Project << std::endl;
}

void create_gioengine_project(const char *project_name, const char *project_directory) {
	std::string file_path = gioengine_directory + std::string("/user_projects.gio");

	std::ofstream user_projects_file;
	user_projects_file.open(file_path.c_str(), std::ios_base::app);
	user_projects_file << project_name << '#' << project_directory << '\n';
	user_projects_file.close();

	std::string project_path = std::string(project_directory);
	filesystem::create_directories(project_path);

	system((std::string("cargo new ") + project_path + '/' + project_name).c_str());
}

void load_gioengine_project(const char *project_name) {
	load_gioengine_directory();
}

void erase_file_line(std::string path, std::string eraseLine) {
    std::string line;
    std::ifstream fin;
    
    fin.open(path);
    // contents of path must be copied to a temp file then
    // renamed back to the path file
    std::ofstream temp;
    temp.open("temp.txt");

    while (getline(fin, line)) {
        // write all lines to temp other than the line marked for erasing
        if (line != eraseLine)
            temp << line << std::endl;
    }

    temp.close();
    fin.close();

    // required conversion for remove and rename functions
    const char * p = path.c_str();
    remove(p);
    rename("temp.txt", p);
} 

void delete_gioengine_project(std::string project_name) {
	std::string file_path = gioengine_directory + std::string("/user_projects.gio");
	erase_file_line(file_path, project_name); 
}

std::vector<std::string> get_user_projects() {
	return UserProjects;
}

std::string get_current_project_dir() {
	return current_project_directory;
}

void set_current_project_dir(std::string dir) {
	current_project_directory = dir;
}
