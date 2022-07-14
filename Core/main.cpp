/* 
 * The main code goes in here
 * This file is responsible for handling all the other source
 */

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

// Better way of doing this later
bool show_text_editor = false;
bool show_file_browser = false;
bool show_project_creation_window = false;

#define show_text_editor_fn() (show_text_editor = true)
#define show_file_browser_fn() (show_file_browser = true)
#define show_project_creation_window_fn() (show_project_creation_window = true)



static void glfw_error_callback(int error, const char* description) {
    fprintf(stderr, "Glfw Error %d: %s\n", error, description);
}

// Wide window with two buttons & one text field
static void ShowProjectCreationWindow(bool* p_open) {
	ImGui::SetNextWindowSize(ImVec2(400, 200), ImGuiCond_FirstUseEver);
	ImGui::Begin("Project Creation", p_open);

	static char prj_name[100] = "";
	static char prj_path[100] = "";
	ImGui::SetNextItemWidth(-FLT_MIN);

	if(ImGui::Button("Create")) {
		create_gioengine_project(prj_name, prj_path);
		reload_gioengine_projects();
		*p_open = false;
	}
	ImGui::SameLine();
	if(ImGui::Button("Cancel")) *p_open = false;

	ImGui::InputText("##Project Name", prj_name, IM_ARRAYSIZE(prj_name));
	ImGui::InputText("##Project Path", prj_path, IM_ARRAYSIZE(prj_path));
	ImGui::SameLine();
	if(ImGui::Button("Open")) show_file_browser_fn();
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
    if (ImGui::Begin("ProjectTree", p_open, ImGuiWindowFlags_MenuBar)) {
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

void ShowExampleAppDockSpace(bool* p_open)
{
    static bool opt_fullscreen = true;
    static bool opt_padding = true;
    static ImGuiDockNodeFlags dockspace_flags = ImGuiDockNodeFlags_None;

    ImGuiWindowFlags window_flags = ImGuiWindowFlags_MenuBar | ImGuiWindowFlags_NoDocking;
    if (opt_fullscreen)
    {
        const ImGuiViewport* viewport = ImGui::GetMainViewport();
        ImGui::SetNextWindowPos(viewport->WorkPos);
        ImGui::SetNextWindowSize(viewport->WorkSize);
        ImGui::SetNextWindowViewport(viewport->ID);
        ImGui::PushStyleVar(ImGuiStyleVar_WindowRounding, 0.0f);
        ImGui::PushStyleVar(ImGuiStyleVar_WindowBorderSize, 0.0f);
        window_flags |= ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove;
        window_flags |= ImGuiWindowFlags_NoBringToFrontOnFocus | ImGuiWindowFlags_NoNavFocus;
    }
    else
    {
        dockspace_flags &= ~ImGuiDockNodeFlags_PassthruCentralNode;
    }

    if (dockspace_flags & ImGuiDockNodeFlags_PassthruCentralNode)
        window_flags |= ImGuiWindowFlags_NoBackground;

    if (!opt_padding)
        ImGui::PushStyleVar(ImGuiStyleVar_WindowPadding, ImVec2(0.0f, 0.0f));
    ImGui::Begin("DockSpace Demo", p_open, window_flags);
    if (!opt_padding)
        ImGui::PopStyleVar();

    if (opt_fullscreen)
        ImGui::PopStyleVar(2);

    ImGuiIO& io = ImGui::GetIO();
    if (io.ConfigFlags & ImGuiConfigFlags_DockingEnable)
    {
        ImGuiID dockspace_id = ImGui::GetID("MyDockSpace");
        ImGui::DockSpace(dockspace_id, ImVec2(0.0f, 0.0f), dockspace_flags);
    }

    ImGui::End();
}

int main(int argc, char** argv) {
	glfwSetErrorCallback(glfw_error_callback);
	if (!glfwInit()) return 1;

	// Decide GL+GLSL versions
	// Don't like this
#if defined(IMGUI_IMPL_OPENGL_ES2)
	// GL ES 2.0 + GLSL 100
	const char* glsl_version = "#version 100";
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0);
	glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_ES_API);
#elif defined(__APPLE__)
	// GL 3.2 + GLSL 150
	const char* glsl_version = "#version 150";
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);  // 3.2+ only
	glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);            // Required on Mac
#else
	// GL 3.0 + GLSL 130
	const char* glsl_version = "#version 130";
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0);
	//glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);  // 3.2+ only
	//glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);            // 3.0+ only
#endif

	// Create window with graphics context
	GLFWwindow* window = glfwCreateWindow(1280, 720, "GioEngine", NULL, NULL);
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
	
	io.ConfigFlags |= ImGuiConfigFlags_DockingEnable;

	bool show_demo_window = false;
	bool show_project_manager = true;
	bool show_dockspace = true;
	load_gioengine_projects();

	ImGui::GetStyle().WindowRounding = 3.0f;

	// create a file browser instance
	ImGui::FileBrowser fileDialog(ImGuiFileBrowserFlags_SelectDirectory);

	// (optional) set browser properties
	fileDialog.SetTitle("open project");

	while (!glfwWindowShouldClose(window)) {
		glfwPollEvents();
		
		ImGui_ImplOpenGL3_NewFrame();
		ImGui_ImplGlfw_NewFrame();
		ImGui::NewFrame();

		if(show_dockspace) ShowExampleAppDockSpace(&show_dockspace);
		if(show_demo_window) ImGui::ShowDemoWindow(&show_demo_window);
		if(show_project_manager) ShowProjectManager(&show_project_manager);
		if(show_project_creation_window) ShowProjectCreationWindow(&show_project_creation_window);

		if(show_file_browser) {
			fileDialog.Open();
			fileDialog.Display();
		}

		if(fileDialog.HasSelected()) {
		    std::cout << "Selected filename" << fileDialog.GetSelected().string() << std::endl;
		    fileDialog.ClearSelected();
		}

		//...do other stuff like ImGui::Render();

		SimpleOverlay();

		if(show_text_editor) {
			std::string fileToEdit = (get_current_project_dir() + "/src/main.rs").c_str();
			{
				std::ifstream t(fileToEdit.c_str());
				if (t.good()) {
					std::string str((std::istreambuf_iterator<char>(t)), std::istreambuf_iterator<char>());
					editor.SetText(str);
				}
			}

			ImGui::Begin("Vim-like editor", nullptr, ImGuiWindowFlags_HorizontalScrollbar | ImGuiWindowFlags_MenuBar);

			auto cpos = editor.GetCursorPosition();

			ImGui::Text("%6d/%-6d %6d lines  | %s | %s | %s | %s", cpos.mLine + 1, cpos.mColumn + 1, editor.GetTotalLines(),
				editor.IsOverwrite() ? "Ovr" : "Ins",
				editor.CanUndo() ? "*" : " ",
				editor.GetCurrentMode(), fileToEdit.c_str());

			editor.Render("TextEditor");

			ImGui::End();
		}

		ImGui::Render();
		int display_w, display_h;
		glfwGetFramebufferSize(window, &display_w, &display_h);
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
