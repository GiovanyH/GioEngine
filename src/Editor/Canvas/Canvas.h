#include <GLFW/glfw3.h>
#include "imgui.h"
#include <string>

ImVec2 get_window_size();
void set_window_size(ImVec2);

ImVec2 get_canvas_scrolling();
void set_canvas_scrolling(ImVec2 scrolling);

ImGuiWindowFlags get_canvas_flags();

bool CanvasBegin(std::string title = "Debug", bool *p_open = nullptr, ImGuiWindowFlags flags = ImGuiWindowFlags_NoTitleBar);

void gioengine_draw_canvas();
