namespace core {
    GLFWwindow *main_window;
    std::vector<GLFWwindow*> windows_vec;

    int init() {
        // GLFW
        if (!glfwInit()) return 1;

        // GL ES 2.0 + GLSL 100
        const char* glsl_version = "#version 100";
        {
            glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
            glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0);
            glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_ES_API);
        }

        main_window = glfwCreateWindow(1366, 720, "GioEngine", NULL, NULL);
        glfwMakeContextCurrent(main_window);
        glfwSwapInterval(1); // Enable vsync

        // IMGUI
        IMGUI_CHECKVERSION();
        ImGui::CreateContext();

        ImGui_ImplGlfw_InitForOpenGL(main_window, true);
        ImGui_ImplOpenGL3_Init(glsl_version);

    }
}