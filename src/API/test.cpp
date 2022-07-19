#include "OS.h"
#include <iostream>
#include <cstddef>

using namespace API;

int main(void) {
	if(!OS::glfwInit()) {
		std::cout << "GLFW error" << std::endl;
	}
	OS::glfwWindowHint(OS::glfw_get_version_major(), 2);
	OS::glfwWindowHint(OS::glfw_get_version_minor(), 0);
	OS::glfwWindowHint(OS::glfw_get_client_api(), OS::glfw_get_opengl_es_api());
	OS::glfwCreateWindow(640, 480, "giovany", NULL, NULL);
	return 0;
}
