/* 
 * The main code goes in here
 * This file is responsible for handling all the other source
 */

#include <stdio.h>
#include "../Core/Config.h"

int main(int argc, char **argv) {
	printf("Version: %d.%d.%d\n", GioEngine_VERSION_MAJOR, GioEngine_VERSION_MINOR, GioEngine_VERSION_PATCH);
	return 0;
}
