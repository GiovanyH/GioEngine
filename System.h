#include "Includes.h"
#include "Utilities.h"

class System
{
public:
	class ProjectSettings
	{
	public:
		static std::string title;
		static std::string description;
		static std::string version;

		static Color background;
	};

	class WindowSettings
	{
	public:
		static std::string title;
		static unsigned int width;
		static unsigned int height;

		static SDL_Window* window;
		static SDL_Renderer* renderer;
	};

	class InputSettings
	{
	public:
		static SDL_Event _event;
	};

	class Engine
	{
	public:
		static bool is_running;
		
		static void start();
		
		static void Ready();
		static void Update();

		static void quit();
	};

	void test();
};
