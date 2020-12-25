#include "System.h"

/*
void System::init(std::string name, std::string description, std::string version)
{
	ProjectSettings::name = name;
	ProjectSettings::description = description;
	ProjectSettings::version = version;
}
*/

// Project Settings
std::string System::ProjectSettings::title = "default";
std::string System::ProjectSettings::description = "default";
std::string System::ProjectSettings::version = "1.0.0";
Color System::ProjectSettings::background(0, 0, 0, 0);

// Window Settings
std::string System::WindowSettings::title = "default";
unsigned int System::WindowSettings::width = 1024;
unsigned int System::WindowSettings::height = 512;
SDL_Window* System::WindowSettings::window = nullptr;
SDL_Renderer* System::WindowSettings::renderer = nullptr;

// Input Settings
SDL_Event System::InputSettings::_event;

// Engine
bool System::Engine::is_running = false;

void System::Engine::start()
{
	System::Engine::is_running = true;
	SDL_Init(SDL_INIT_EVERYTHING);
}
void System::Engine::quit()
{
	System::Engine::is_running = false;
}

// test

void System::test()
{
	std::cout << "Started!" << std::endl;
}
