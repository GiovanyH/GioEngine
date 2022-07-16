#include "include.h"

TextEditor::Modes TextEditor::handleNormal(bool one) {
	current_mode = Normal;
	ImGuiIO& io = ImGui::GetIO();
	auto shift = io.KeyShift;
	auto ctrl = io.ConfigMacOSXBehaviors ? io.KeySuper : io.KeyCtrl;
	auto alt = io.ConfigMacOSXBehaviors ? io.KeyCtrl : io.KeyAlt;
	auto c = GetCursorPosition();

	if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_X))) {
		MoveRight(1);
		Backspace();
	}
			
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_B)))
		SetCursorPosition(FindWordStart(c));
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_E)))
		SetCursorPosition(FindWordEnd(c));
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_O))) {
		auto oldPos = GetCursorPosition();
		SetCursorPosition(Coordinates(GetCursorPosition().mLine, GetLineMaxColumn(oldPos.mLine)));
		EnterCharacter('\n', false);
		oldPos.mLine++;
		SetCursorPosition(oldPos);
	}
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_H))) MoveLeft(1);
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_L))) MoveRight(1);
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_J))) MoveDown(1);
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_K))) MoveUp(1);
	else {
		if(alt) {
			handleInsert(true);
		}	
	}

	if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_I))) return Insert;
	else if(ImGui::IsKeyPressed(ImGui::GetKeyIndex(ImGuiKey_V))) return Visual;
	else return Normal;
}
