namespace core {
    void Ready();
    void Update();
    void Clear();

    void main_loop(GLFWwindow *window) {
        while(!glfwWindowShouldClose(window)) {
            glfwPollEvents();
            ImGui_ImplOpenGL3_NewFrame();
            ImGui_ImplGlfw_NewFrame();
            ImGui::NewFrame();
            Update();
        }
    }

    void clear() {
        Clear();

        ImGui_ImplOpenGL3_Shutdown();
        ImGui_ImplGlfw_Shutdown();
        ImGui::DestroyContext();

        glfwDestroyWindow(core::main_window);
        glfwTerminate();
    }
}