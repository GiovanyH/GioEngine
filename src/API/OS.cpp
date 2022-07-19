#include "OS.h"
#include <GLFW/glfw3.h>

using namespace API;

int OS::glfw_get_version_major() {
	return 3;
}
int OS::glfw_get_version_minor() {
	return 3;
}
int OS::glfw_get_client_api() {
	return 0x00022001;
}
int OS::glfw_get_opengl_es_api() {
	return 0x00030002;
}

bool OS::glfwInit() {
	return glfwInit();
}

OS::GLFWwindow *OS::glfwCreateWindow(int w, int h, const char *title, OS::GLFWmonitor *monitor, OS::GLFWwindow *share) {
	//return {glfwCreateWindow(w, h, title, monitor, share)};
}

void OS::glfwWindowHint(int hint, int value) {
	return glfwWindowHint(hint, value);
}
