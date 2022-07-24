#include <fstream>
#include <stdio.h>
#include <string>
#include <iostream>
#include <streambuf>
#include <math.h>

#include <GLES2/gl2.h>
#include <GLFW/glfw3.h>

#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"

#include "config.h"
#include "config/version.h"

#include "../API/projectmanager/project.h"

// Core
#include "init.cpp"
#include "load_style.cpp"
#include "events.cpp"

#include "ghc/filesystem.hpp"
#include "nfd.h"

#include "canvas.h"

#include "editor.h"

#include "texteditor.cpp"

using namespace ghc;

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

bool show_project_manager = true;
bool show_z = true;
std::string fileToEdit;

void core::Update() {
	ImGui::PushFont(core::regular_font);

	bool show_demo_window = false;

	if(show_demo_window) ImGui::ShowDemoWindow(&show_demo_window);
	if(show_project_manager) ShowProjectManager(&show_project_manager);
	if(show_project_creation_window) ShowProjectCreationWindow(&show_project_creation_window);

	if(show_file_browser) {
		nfdchar_t *outPath = NULL;
		nfdresult_t result = NFD_PickFolder( NULL, &outPath );
		if (result == NFD_OKAY) {
			prj_path_ = outPath;
			free(outPath);
			show_file_browser = false;
		}
		else if (result == NFD_CANCEL) {
			show_file_browser = false;
		}
		else {
			printf("Error: %s\n", NFD_GetError() );
		}
	}

	SimpleOverlay();

	if(filesystem::exists(get_current_project_dir()) && show_z && show_text_editor) {
		zep_init(Zep::NVec2f(1.0f, 1.0f));
		zep_load(Zep::ZepPath(get_current_project_dir()) / "src" / "main.rs");
		show_z = false;
	}

	if(filesystem::exists(get_current_project_dir()) && show_text_editor) {
		zep_update();
		static Zep::NVec2i size = Zep::NVec2i(640, 480);
		zep_show(size);
	}

	gioengine_draw_canvas();

	ImGui::PopFont();

	ImGui::Render();
}

void core::Clear() {
	zep_destroy();
}

int main(int argc, char** argv) {
	glfwSetErrorCallback(glfw_error_callback);
	
	ImVec2 window_size = core::init();
	// Update canvas
	set_window_size(window_size);
	ImGuiIO& io = ImGui::GetIO(); (void)io;
	if (core::main_window == NULL) return 1;
	load_gioengine_projects();

	core::load_colors();
	core::load_style();
	core::load_fonts(io);

	core::main_loop(core::main_window);
	core::clear();

	return 0;
}
