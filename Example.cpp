#include "../Main.cpp"

void System::Engine::Ready()
{
	Display::init("teste", 400, 270);
}

void System::Engine::Update()
{

}

/*
 * --- Compiling example ---
 *  g++ Example.cpp -lSDL2 System.cpp Display.cpp -o builds/Example
 */
