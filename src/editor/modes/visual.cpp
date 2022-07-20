#include "include.h"

TextEditor::Modes TextEditor::handleVisual() {
	current_mode = Visual;
	if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_H))) MoveLeft(1, true);
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_L))) MoveRight(1, true);
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_J))) MoveDown(1, true);
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_K))) MoveUp(1, true);
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_X))) {
		Backspace();
		return Normal;
	}
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_V))) return Normal;

	return current_mode;
}
