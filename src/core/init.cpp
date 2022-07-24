namespace core {
    GLFWwindow *main_window;
    std::vector<GLFWwindow*> windows_vec;

    ImVec2 init() {
        // GLFW
        if (!glfwInit()) return ImVec2(0, 0);

        // GL ES 2.0 + GLSL 100
        const char* glsl_version = "#version 100";
        {
            glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
            glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0);
            glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_ES_API);
        }

        int window_w = 1366; int window_h = 720;
        main_window = glfwCreateWindow(window_w, window_h, "GioEngine", NULL, NULL);
        glfwMakeContextCurrent(main_window);
        glfwSwapInterval(1); // Enable vsync

        // IMGUI
        IMGUI_CHECKVERSION();
        ImGui::CreateContext();

        ImGui_ImplGlfw_InitForOpenGL(main_window, true);
        ImGui_ImplOpenGL3_Init(glsl_version);

        return ImVec2(window_w, window_h);
    }
}