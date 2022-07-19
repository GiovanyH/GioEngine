#include "Config.h"
#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"
#include <fstream>
#include <streambuf>
#include "TextEditor.h"
#include "Config/Version.h"
#include <stdio.h>
#include <string>
#include <iostream>
#include "ProjectManager/Project.h"
#if defined(IMGUI_IMPL_OPENGL_ES2)
#include <GLES2/gl2.h>
#endif
#include <GLFW/glfw3.h>

#include "imfilebrowser.h"
#include "Canvas.h"
#include <math.h>

// Better way of doing this later
bool show_text_editor = true;
bool show_project_creation_window = false;
bool show_file_browser = false;

std::string prj_path_;

#define show_text_editor_fn() (show_text_editor = true)
#define show_project_creation_window_fn() (show_project_creation_window = true)

static void glfw_error_callback(int error, const char* description) {
    fprintf(stderr, "Glfw Error %d: %s\n", error, description);
}

void init_engine_windows() {
	show_text_editor = true;
}

// Wide window with two buttons & one text field
static void ShowProjectCreationWindow(bool* p_open) {
	ImGui::SetNextWindowSize(ImVec2(400, 200), ImGuiCond_FirstUseEver);
	CanvasBegin("Project Creation", p_open, ImGuiWindowFlags_NoTitleBar);

	static char prj_name[100];
	static char prj_path[100];
	ImGui::SetNextItemWidth(-FLT_MIN);

	if(ImGui::Button("Create")) {
		create_gioengine_project(prj_name, prj_path);
		reload_gioengine_projects();
		*p_open = false;
	}
	ImGui::SameLine();
	if(ImGui::Button("Cancel")) *p_open = false;
	if(prj_path_.size() != 0) strcpy(prj_path, prj_path_.c_str());

	ImGui::InputText("##Project Name", prj_name, 100);
	ImGui::InputText("##Project Path", prj_path, 100);
	ImGui::SameLine();
	
	if(ImGui::Button("Open")) {
		show_file_browser = true;
	}
	ImGui::Separator();

	ImGui::End();
}

size_t split(const std::string &txt, std::vector<std::string> &strs, char ch) {
    size_t pos = txt.find( ch );
    size_t initialPos = 0;
    strs.clear();

    while( pos != std::string::npos ) {
        strs.push_back( txt.substr( initialPos, pos - initialPos ) );
        initialPos = pos + 1;

        pos = txt.find( ch, initialPos );
    }

    strs.push_back( txt.substr( initialPos, std::min( pos, txt.size() ) - initialPos + 1 ) );

    return strs.size();
}

std::vector<std::string> get_project(std::string project) {
	std::vector<std::string> project_vec;

	split(project, project_vec, '#');

	return project_vec;
}

static void ShowProjectManager(bool* p_open) {
    ImGui::SetNextWindowSize(ImVec2(500, 440), ImGuiCond_FirstUseEver);
    ImGuiWindowFlags flags = ImGuiWindowFlags_MenuBar;
    flags |= ImGuiWindowFlags_NoTitleBar;
    if (CanvasBegin("ProjectTree", p_open, flags)) {
        if (ImGui::BeginMenuBar()) {
            if (ImGui::BeginMenu("File")) {
		if (ImGui::MenuItem("Create")) show_project_creation_window_fn();
		if (ImGui::MenuItem("Reload")) reload_gioengine_projects();
                if (ImGui::MenuItem("Close")) *p_open = false;
                ImGui::EndMenu();
            }
            ImGui::EndMenuBar();
        }
	
	std::vector<std::string> Project;

        static int selected = 0;
        {
            ImGui::BeginChild("left pane", ImVec2(150, 0), true);
            for (int i = 0; i < get_user_projects().size(); i++) {
		Project = get_project(get_user_projects()[i]);
                char label[128];
                sprintf(label, Project[0].c_str());
                if (ImGui::Selectable(label, selected == i))
                    selected = i;
            }
            ImGui::EndChild();
        }
        ImGui::SameLine(); 

	ImGui::BeginGroup();
	ImGui::BeginChild("item view", ImVec2(0, -ImGui::GetFrameHeightWithSpacing()));
	ImGui::Separator();
	if (ImGui::BeginTabBar("##Tabs", ImGuiTabBarFlags_None)) {
		if (ImGui::BeginTabItem("Directory")) {
			if (get_user_projects().size() != 0) {
				Project = get_project(get_user_projects()[selected]);
				std::string text = Project[1];
				ImGui::TextWrapped(text.c_str());
			}
			ImGui::EndTabItem();
		}
		if (ImGui::BeginTabItem("Details")) {
		    ImGui::Text("ID: 0123456789");
		    ImGui::EndTabItem();
		}
		ImGui::EndTabBar();
	}
	ImGui::EndChild();
	if (ImGui::Button("Open")) {
		set_current_project_dir(Project[1] + '/' + Project[0]);
		init_engine_windows();
		*p_open = false;
	}
	ImGui::SameLine();
	if (ImGui::Button("Delete")) {
		delete_gioengine_project(get_user_projects()[selected]);
		reload_gioengine_projects();
	}
	ImGui::EndGroup();
    }
    ImGui::End();
}

int main(int argc, char** argv) {
	glfwSetErrorCallback(glfw_error_callback);
	if (!glfwInit()) return 1;


	std::cout << GLFW_CONTEXT_VERSION_MAJOR << std::endl;
	// GL ES 2.0 + GLSL 100
	const char* glsl_version = "#version 100";
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0);
	glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_ES_API);
	
	int window_w, window_h;
	window_w = 1280; window_h = 720;
	GLFWwindow *window = glfwCreateWindow(window_w, window_h, "GioEngine", NULL, NULL);
	set_window_size(ImVec2(window_w, window_h));
	if (window == NULL) return 1;
	glfwMakeContextCurrent(window);
	glfwSwapInterval(1); // Enable vsync

	IMGUI_CHECKVERSION();
	ImGui::CreateContext();
	ImGuiIO& io = ImGui::GetIO(); (void)io;

	ImGui::StyleColorsDark();

	ImGui_ImplGlfw_InitForOpenGL(window, true);
	ImGui_ImplOpenGL3_Init(glsl_version);

	ImVec4 clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);
	// TEXT EDITOR SAMPLE
	TextEditor editor;
	auto lang = TextEditor::RustLang::Rust();
	
	bool show_demo_window = false;
	bool show_project_manager = true;
	load_gioengine_projects();

	ImVec4* colors = ImGui::GetStyle().Colors;
	colors[ImGuiCol_Text]                   = ImVec4(0.89f, 0.83f, 0.674f, 1.0f);
	colors[ImGuiCol_TextDisabled]           = ImVec4(0.50f, 0.50f, 0.50f, 1.00f);
	colors[ImGuiCol_WindowBg]               = ImVec4(0.196f, 0.188f, 0.184f, 1.00f);
	colors[ImGuiCol_ChildBg]                = ImVec4(0.00f, 0.00f, 0.00f, 0.00f);
	colors[ImGuiCol_PopupBg]                = ImVec4(0.19f, 0.19f, 0.19f, 0.92f);
	colors[ImGuiCol_Border]                 = ImVec4(0.82f, 0.77f, 0.63f, 1.0f);
	colors[ImGuiCol_BorderShadow]           = ImVec4(0.82f, 0.77f, 0.63f, 1.0f);
	colors[ImGuiCol_FrameBg]                = ImVec4(0.05f, 0.05f, 0.05f, 0.54f);
	colors[ImGuiCol_FrameBgHovered]         = ImVec4(0.19f, 0.19f, 0.19f, 0.54f);
	colors[ImGuiCol_FrameBgActive]          = ImVec4(0.20f, 0.22f, 0.23f, 1.00f);
	colors[ImGuiCol_TitleBg]                = ImVec4(0.00f, 0.00f, 0.00f, 1.00f);
	colors[ImGuiCol_TitleBgActive]          = ImVec4(0.06f, 0.06f, 0.06f, 1.00f);
	colors[ImGuiCol_TitleBgCollapsed]       = ImVec4(0.00f, 0.00f, 0.00f, 1.00f);
	colors[ImGuiCol_MenuBarBg]              = ImVec4(0.647f, 0.6f, 0.55f, 1.00f);
	colors[ImGuiCol_ScrollbarBg]            = ImVec4(0.05f, 0.05f, 0.05f, 0.54f);
	colors[ImGuiCol_ScrollbarGrab]          = ImVec4(0.34f, 0.34f, 0.34f, 0.54f);
	colors[ImGuiCol_ScrollbarGrabHovered]   = ImVec4(0.40f, 0.40f, 0.40f, 0.54f);
	colors[ImGuiCol_ScrollbarGrabActive]    = ImVec4(0.56f, 0.56f, 0.56f, 0.54f);
	colors[ImGuiCol_CheckMark]              = ImVec4(0.33f, 0.67f, 0.86f, 1.00f);
	colors[ImGuiCol_SliderGrab]             = ImVec4(0.34f, 0.34f, 0.34f, 0.54f);
	colors[ImGuiCol_SliderGrabActive]       = ImVec4(0.56f, 0.56f, 0.56f, 0.54f);
	colors[ImGuiCol_Button]                 = ImVec4(0.50f, 0.64f, 0.59f, 0.25f);
	colors[ImGuiCol_ButtonHovered]          = ImVec4(0.50f, 0.64f, 0.59f, 0.50f);
	colors[ImGuiCol_ButtonActive]           = ImVec4(0.20f, 0.22f, 0.23f, 1.00f);
	colors[ImGuiCol_Header]                 = ImVec4(0.50f, 0.64f, 0.59f, 0.50f);
	colors[ImGuiCol_HeaderHovered]          = ImVec4(0.50f, 0.64f, 0.59f, 0.25f);
	colors[ImGuiCol_HeaderActive]           = ImVec4(0.50f, 0.64f, 0.59f, 0.50f);
	colors[ImGuiCol_Separator]              = ImVec4(0.28f, 0.28f, 0.28f, 0.29f);
	colors[ImGuiCol_SeparatorHovered]       = ImVec4(0.44f, 0.44f, 0.44f, 0.29f);
	colors[ImGuiCol_SeparatorActive]        = ImVec4(0.40f, 0.44f, 0.47f, 1.00f);
	colors[ImGuiCol_ResizeGrip]             = ImVec4(0.28f, 0.28f, 0.28f, 0.29f);
	colors[ImGuiCol_ResizeGripHovered]      = ImVec4(0.44f, 0.44f, 0.44f, 0.29f);
	colors[ImGuiCol_ResizeGripActive]       = ImVec4(0.40f, 0.44f, 0.47f, 1.00f);
	colors[ImGuiCol_Tab]                    = ImVec4(0.50f, 0.64f, 0.59f, 0.25f);
	colors[ImGuiCol_TabHovered]             = ImVec4(0.50f, 0.64f, 0.59f, 0.50f);
	colors[ImGuiCol_TabActive]              = ImVec4(0.20f, 0.20f, 0.20f, 0.36f);
	colors[ImGuiCol_TabUnfocused]           = ImVec4(0.00f, 0.00f, 0.00f, 0.52f);
	colors[ImGuiCol_TabUnfocusedActive]     = ImVec4(0.14f, 0.14f, 0.14f, 1.00f);
	colors[ImGuiCol_PlotLines]              = ImVec4(1.00f, 0.00f, 0.00f, 1.00f);
	colors[ImGuiCol_PlotLinesHovered]       = ImVec4(1.00f, 0.00f, 0.00f, 1.00f);
	colors[ImGuiCol_PlotHistogram]          = ImVec4(1.00f, 0.00f, 0.00f, 1.00f);
	colors[ImGuiCol_PlotHistogramHovered]   = ImVec4(1.00f, 0.00f, 0.00f, 1.00f);
	colors[ImGuiCol_TableHeaderBg]          = ImVec4(0.50f, 0.64f, 0.59f, 1.00f);
	colors[ImGuiCol_TableBorderStrong]      = ImVec4(0.00f, 0.00f, 0.00f, 0.52f);
	colors[ImGuiCol_TableBorderLight]       = ImVec4(0.28f, 0.28f, 0.28f, 0.29f);
	colors[ImGuiCol_TableRowBg]             = ImVec4(0.50f, 0.64f, 0.59f, 1.00f);
	colors[ImGuiCol_TableRowBgAlt]          = ImVec4(1.00f, 1.00f, 1.00f, 0.06f);
	colors[ImGuiCol_TextSelectedBg]         = ImVec4(0.20f, 0.22f, 0.23f, 1.00f);
	colors[ImGuiCol_DragDropTarget]         = ImVec4(0.33f, 0.67f, 0.86f, 1.00f);
	colors[ImGuiCol_NavHighlight]           = ImVec4(1.00f, 0.00f, 0.00f, 1.00f);
	colors[ImGuiCol_NavWindowingHighlight]  = ImVec4(1.00f, 0.00f, 0.00f, 0.70f);
	colors[ImGuiCol_NavWindowingDimBg]      = ImVec4(1.00f, 0.00f, 0.00f, 0.20f);
	colors[ImGuiCol_ModalWindowDimBg]       = ImVec4(1.00f, 0.00f, 0.00f, 0.35f);

	ImGuiStyle& style = ImGui::GetStyle();
	style.WindowPadding                     = ImVec2(8.00f, 8.00f);
	style.FramePadding                      = ImVec2(5.00f, 2.00f);
	style.CellPadding                       = ImVec2(6.00f, 6.00f);
	style.ItemSpacing                       = ImVec2(6.00f, 6.00f);
	style.ItemInnerSpacing                  = ImVec2(6.00f, 6.00f);
	style.TouchExtraPadding                 = ImVec2(0.00f, 0.00f);
	style.IndentSpacing                     = 25;
	style.ScrollbarSize                     = 15;
	style.GrabMinSize                       = 10;
	style.WindowBorderSize                  = 1;
	style.ChildBorderSize                   = 0.4;
	style.PopupBorderSize                   = 0.6;
	style.FrameBorderSize                   = 0.2;
	style.TabBorderSize                     = 0.4;
	style.WindowRounding                    = 5;
	style.ChildRounding                     = 1;
	style.FrameRounding                     = 2;
	style.PopupRounding                     = 2;
	style.ScrollbarRounding                 = 5;
	style.GrabRounding                      = 2;
	style.LogSliderDeadzone                 = 4;
	style.TabRounding                       = 2;	

	ImFont * regular = io.Fonts->AddFontFromFileTTF("../style/fonts/Ubuntu-Bold.ttf", 17);
	ImFont * code = io.Fonts->AddFontFromFileTTF("../style/fonts/SpaceMono-Bold.ttf", 19); 

	ImGui::FileBrowser fileDialog(ImGuiFileBrowserFlags_SelectDirectory);
	fileDialog.SetTitle("open project");

	std::string fileToEdit;

	ImVec2 penis;
	penis.x = 0; penis.y = 200;

	while (!glfwWindowShouldClose(window)) {
		glfwPollEvents();
		
		ImGui_ImplOpenGL3_NewFrame();
		ImGui_ImplGlfw_NewFrame();
		ImGui::NewFrame();

		ImGui::PushFont(regular);

		if(show_demo_window) ImGui::ShowDemoWindow(&show_demo_window);
		if(show_project_manager) ShowProjectManager(&show_project_manager);
		if(show_project_creation_window) ShowProjectCreationWindow(&show_project_creation_window);

		if(show_file_browser) {
			fileDialog.Open();
			fileDialog.Display();
		}

		if(fileDialog.HasSelected()) {
		    prj_path_ = fileDialog.GetSelected().string();
		    fileDialog.ClearSelected();
		    show_file_browser = false;
		}

		SimpleOverlay();

		ImGui::PushFont(code);

		if(show_text_editor && std::filesystem::exists(get_current_project_dir())) {
			fileToEdit = (get_current_project_dir() + "/src/main.rs").c_str();
			if(prj_path_.size() == 0) {
				{
					fileToEdit = (get_current_project_dir() + "/src/main.rs").c_str();
					std::ifstream t(fileToEdit.c_str());
					if (t.good()) {
						std::string str((std::istreambuf_iterator<char>(t)), std::istreambuf_iterator<char>());
						editor.SetText(str);
					}
				}
				prj_path_.clear();
			}

			auto cpos = editor.GetCursorPosition();

			CanvasBegin("Editor", nullptr);

			ImGui::Text("%6d/%-6d %6d lines  | %s | %s | %s | %s", cpos.mLine + 1, cpos.mColumn + 1, editor.GetTotalLines(),
				editor.IsOverwrite() ? "Ovr" : "Ins",
				editor.CanUndo() ? "*" : " ",
				editor.GetCurrentMode(), fileToEdit.c_str());

			editor.Render("TextEditor");

			std::ofstream (fileToEdit.c_str()) << editor.GetText();
			ImGui::End();


		}

		ImGui::PopFont();

		gioengine_draw_canvas();

		ImGui::PopFont();

		ImGui::Render();
		int display_w, display_h;
		glfwGetFramebufferSize(window, &display_w, &display_h);
		set_window_size(ImVec2(display_w, display_h));
		glViewport(0, 0, display_w, display_h);
		glClearColor(clear_color.x * clear_color.w, clear_color.y * clear_color.w, clear_color.z * clear_color.w, clear_color.w);
		glClear(GL_COLOR_BUFFER_BIT);
		ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());

		glfwSwapBuffers(window);
	}

	ImGui_ImplOpenGL3_Shutdown();
	ImGui_ImplGlfw_Shutdown();
	ImGui::DestroyContext();

	glfwDestroyWindow(window);
	glfwTerminate();

	return 0;
}