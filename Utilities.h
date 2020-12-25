#include "Includes.h"

struct Color
{
	uint8_t r, g, b, a;

	Color(uint8_t r, uint8_t g, uint8_t b, uint8_t a)
		: r(r), g(g), b(b), a(a) {}
};

struct Vector2
{
	float x, y;
	Vector2(float x, float y)
		: x(x), y(y) {}
	
	// Operator overloading
	Vector2 operator+(const Vector2& other) const	{ return Vector2(x + other.x, y + other.y); }
	Vector2 operator-(const Vector2& other) const   { return Vector2(x - other.x, y - other.y); }
	Vector2 operator*(const Vector2& other) const   { return Vector2(x * other.x, y * other.y); }
	Vector2 operator/(const Vector2& other) const   { return Vector2(x / other.x, y / other.y); }
};

struct Rect
{
	Vector2 pos, size;

	Rect(Vector2 pos, Vector2 size)
		: pos(pos), size(size) {}
};
