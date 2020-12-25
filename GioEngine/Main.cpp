#include "Display.h"

int main(int argc, char **argv)
{
	System::Engine::start();

	System::Engine::Ready();

	while (System::Engine::is_running) {
		// Handling Input
		if (SDL_PollEvent(&(System::InputSettings::_event))) {
			if (System::InputSettings::_event.type == SDL_QUIT) {
				Display::finish();
				System::Engine::quit();
			}
		}

		Display::renderClear();
		System::Engine::Update();
		Display::renderPresent();
	}
	return 0;
}
