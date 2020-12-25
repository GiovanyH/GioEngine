#include "Includes.h"
#include "Utilities.h"

struct System
{
	struct ProjectSettings
	{
		static std::string title;
		static std::string description;
		static std::string version;

		static Color background;
	};

	struct WindowSettings
	{
		static std::string title;
		static unsigned int width;
		static unsigned int height;

		static SDL_Window* window;
		static SDL_Renderer* renderer;
	};

	struct InputSettings
	{
		static SDL_Event _event;
	};

	struct Engine
	{
		static bool is_running;
		
		static void start();
		
		static void Ready();
		static void Update();

		static void quit();
	};

	void test();
};
