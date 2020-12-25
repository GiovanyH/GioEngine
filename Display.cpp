#include "Display.h"

void Display::renderClear() 
{
	System::ProjectSettings::background = Color(0, 0, 0, 0);
	SDL_RenderClear(System::WindowSettings::renderer); 
}

void Display::renderPresent() { SDL_RenderPresent(System::WindowSettings::renderer); }

void Display::init(std::string title, unsigned int windowWidth, unsigned int windowHeight)
{
	System::ProjectSettings::title = title;

	if (System::WindowSettings::title == "") System::WindowSettings::title = System::ProjectSettings::title;

	System::WindowSettings::width = windowWidth;
	System::WindowSettings::height = windowHeight;

	System::WindowSettings::window = SDL_CreateWindow(
		title.c_str(),
		NULL,
		NULL,
		windowWidth,
		windowHeight,
		0
	);

	System::WindowSettings::renderer = SDL_CreateRenderer(System::WindowSettings::window, -1, SDL_RENDERER_ACCELERATED);

}

void Display::finish()
{
	SDL_DestroyRenderer(System::WindowSettings::renderer);
	SDL_DestroyWindow(System::WindowSettings::window);

	std::cout << "Finished successfully!" << std::endl;
}
