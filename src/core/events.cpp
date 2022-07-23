namespace core {
    void Ready();
    void Update();

    void main_loop(bool running = false) {
        while(running) {
            glfwPollEvents();
            ImGui_ImplOpenGL3_NewFrame();
            ImGui_ImplGlfw_NewFrame();
            ImGui::NewFrame();
            Update();
        }
    }
}