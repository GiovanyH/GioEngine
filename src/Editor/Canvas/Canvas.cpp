#include "Canvas.h"
#include <math.h>
#include <iostream>

bool is_scrolling = false;
ImVec2 old_scrolling;
ImVec2 out_scrolling;
ImVec2 window_size;

ImVec2 get_window_size() {
	return window_size;
}

void set_window_size(ImVec2 size) {
	window_size = size;
}

ImVec2 get_canvas_scrolling() {
	return out_scrolling;
}

void set_canvas_scrolling(ImVec2 value) {
	out_scrolling = value;
}

ImGuiWindowFlags get_canvas_flags() {
	ImGuiWindowFlags canflas = ImGuiWindowFlags_MenuBar;
	canflas |= ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove;
        canflas |= ImGuiWindowFlags_NoBringToFrontOnFocus | ImGuiWindowFlags_NoNavFocus;

	return canflas;
}

bool CanvasBegin(std::string title, bool *p_open, ImGuiWindowFlags flags) {
	if(is_scrolling) {
		ImGui::SetNextWindowPos(ImVec2(get_canvas_scrolling().x + old_scrolling.x,
				get_canvas_scrolling().y + old_scrolling.y));
	}
	bool ret = ImGui::Begin(title.c_str(), p_open, flags);
	if(!is_scrolling) {
		old_scrolling = ImVec2(ImGui::GetWindowPos().x - get_canvas_scrolling().x,
				ImGui::GetWindowPos().y - get_canvas_scrolling().y);
	}

	return ret;
}

// In the end of mainloop render
void gioengine_draw_canvas() {
	ImVec2 scrolling = get_canvas_scrolling();

	bool opt_enable_context_menu = false;

	ImGui::SetNextWindowPos(ImVec2(0.0f, 0.0f));
        ImGui::SetNextWindowSize(get_window_size());
        ImGui::PushStyleVar(ImGuiStyleVar_WindowRounding, 0.0f);
        ImGui::PushStyleVar(ImGuiStyleVar_WindowBorderSize, 0.0f);

        ImGui::PushStyleVar(ImGuiStyleVar_WindowPadding, ImVec2(0.0f, 0.0f));

	ImGui::PopStyleVar(3);

	ImGui::Begin("canvas", nullptr, get_canvas_flags());

	ImVec2 canvas_p0 = ImGui::GetCursorScreenPos();
	ImVec2 canvas_sz = ImGui::GetContentRegionAvail();
	if (canvas_sz.x < 50.0f) canvas_sz.x = 50.0f;
	if (canvas_sz.y < 50.0f) canvas_sz.y = 50.0f;
	ImVec2 canvas_p1 = ImVec2(canvas_p0.x + canvas_sz.x,
			canvas_p0.y + canvas_sz.y);

	ImGuiIO& io = ImGui::GetIO();
	ImDrawList* draw_list = ImGui::GetWindowDrawList();
	draw_list->AddRectFilled(canvas_p0, canvas_p1,
			IM_COL32(50, 50, 50, 255));
	draw_list->AddRect(canvas_p0, canvas_p1,
			IM_COL32(255, 255, 255, 255));

	ImGui::InvisibleButton("canvas", canvas_sz, ImGuiButtonFlags_MouseButtonLeft | ImGuiButtonFlags_MouseButtonRight);
	const bool is_hovered = ImGui::IsItemHovered(); // Hovered
	const bool is_active = ImGui::IsItemActive();   // Held
	const ImVec2 origin(canvas_p0.x + scrolling.x, canvas_p0.y + scrolling.y); // Lock scrolled origin
	const ImVec2 mouse_pos_in_canvas(io.MousePos.x - origin.x, io.MousePos.y - origin.y);

	const float mouse_threshold_for_pan = opt_enable_context_menu ? -1.0f : 0.0f;
	if (is_active && ImGui::IsMouseDragging(ImGuiMouseButton_Right, mouse_threshold_for_pan)) {
		scrolling.x += io.MouseDelta.x;
		scrolling.y += io.MouseDelta.y;
		is_scrolling = true;
	}
	else is_scrolling = false;

	ImVec2 drag_delta = ImGui::GetMouseDragDelta(ImGuiMouseButton_Right);
	if (opt_enable_context_menu && drag_delta.x == 0.0f && drag_delta.y == 0.0f)
		ImGui::OpenPopupOnItemClick("context", ImGuiPopupFlags_MouseButtonRight);
	if (ImGui::BeginPopup("context")) {
		//if (ImGui::MenuItem("Remove one", NULL, false, points.Size > 0)) { points.resize(points.size() - 2); }
		//if (ImGui::MenuItem("Remove all", NULL, false, points.Size > 0)) { points.clear(); }
		ImGui::EndPopup();
	}

	draw_list->PushClipRect(canvas_p0, canvas_p1, true);
	//if (opt_enable_grid) {
		const float GRID_STEP = 64.0f;
		for (float x = fmodf(scrolling.x, GRID_STEP); x < canvas_sz.x; x += GRID_STEP)
		    draw_list->AddLine(ImVec2(canvas_p0.x + x, canvas_p0.y), ImVec2(canvas_p0.x + x, canvas_p1.y), IM_COL32(200, 200, 200, 40));
		for (float y = fmodf(scrolling.y, GRID_STEP); y < canvas_sz.y; y += GRID_STEP)
		    draw_list->AddLine(ImVec2(canvas_p0.x, canvas_p0.y + y), ImVec2(canvas_p1.x, canvas_p0.y + y), IM_COL32(200, 200, 200, 40));
	//}

	draw_list->PopClipRect();

	ImGui::End();

	set_canvas_scrolling(scrolling);
}
