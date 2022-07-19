namespace API {
	namespace OS {
		typedef struct GLFWwindow GLFWwindow;
		typedef struct GLFWmonitor GLFWmonitor;

		int glfw_get_version_major();
		int glfw_get_version_minor();
		int glfw_get_client_api();
		int glfw_get_opengl_es_api();

		bool glfwInit();
		GLFWwindow *glfwCreateWindow(int w, int h, const char *title, GLFWmonitor *monitor, GLFWwindow *share); 
		void glfwWindowHint(int hint, int value);
	}
}
