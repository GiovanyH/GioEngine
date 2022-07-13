#include "imgui.h"
#include <string>
#include "Config.h"

static void SimpleOverlay() {
	bool p_open = true;
	static int corner = 0;
	ImGuiIO& io = ImGui::GetIO();
	ImGuiWindowFlags window_flags = ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_AlwaysAutoResize | 
		ImGuiWindowFlags_NoSavedSettings | ImGuiWindowFlags_NoFocusOnAppearing | ImGuiWindowFlags_NoNav;
	if (corner != -1) {
		const float PAD = 10.0f;
		const ImGuiViewport* viewport = ImGui::GetMainViewport();
		ImVec2 work_pos = viewport->WorkPos;	
		ImVec2 work_size = viewport->WorkSize;
		ImVec2 window_pos, window_pos_pivot;
		window_pos.x = (corner & 1) ? (work_pos.x + work_size.x - PAD) : (work_pos.x + PAD);
		window_pos.y = (corner & 2) ? (work_pos.y + work_size.y - PAD) : (work_pos.y + PAD);
		window_pos_pivot.x = (corner & 1) ? 1.0f : 0.0f;
		window_pos_pivot.y = (corner & 2) ? 1.0f : 0.0f;
		ImGui::SetNextWindowPos(window_pos, ImGuiCond_Always, window_pos_pivot);
		window_flags |= ImGuiWindowFlags_NoMove;
	}
	ImGui::SetNextWindowBgAlpha(0.35f); 
	if (ImGui::Begin("Example: Simple overlay", &p_open, window_flags)) {
		std::string major, minor, patch;
		major = std::to_string(GioEngine_VERSION_MAJOR);
		minor = std::to_string(GioEngine_VERSION_MINOR);
		patch = std::to_string(GioEngine_VERSION_PATCH);
		ImGui::Text(("VERSION: " + major + '.' + minor + '.' + patch).c_str());
		ImGui::Separator();
	}
	ImGui::End();
}


