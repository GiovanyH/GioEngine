#include "System.h"

class Display
{
public:
	static void init(std::string name, unsigned int windowWidth, unsigned int windowHeight); // void for now

	static void renderClear();

	static void renderPresent();

	static void finish();
};
