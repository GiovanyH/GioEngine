# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/giovany/Development/GioEngine

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/giovany/Development/GioEngine/build

# Include any dependencies generated for this target.
include libs/SDL/CMakeFiles/SDL2_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.make

# Include the progress variables for this target.
include libs/SDL/CMakeFiles/SDL2_test.dir/progress.make

# Include the compile flags for this target's objects.
include libs/SDL/CMakeFiles/SDL2_test.dir/flags.make

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.o: ../libs/SDL/src/test/SDL_test_assert.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_assert.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_assert.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_assert.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.o: ../libs/SDL/src/test/SDL_test_common.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_common.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_common.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_common.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.o: ../libs/SDL/src/test/SDL_test_compare.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_compare.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_compare.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_compare.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.o: ../libs/SDL/src/test/SDL_test_crc32.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_crc32.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_crc32.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_crc32.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.o: ../libs/SDL/src/test/SDL_test_font.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_font.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_font.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_font.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.o: ../libs/SDL/src/test/SDL_test_fuzzer.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_fuzzer.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_fuzzer.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_fuzzer.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.o: ../libs/SDL/src/test/SDL_test_harness.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_harness.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_harness.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_harness.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.o: ../libs/SDL/src/test/SDL_test_imageBlit.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imageBlit.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imageBlit.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imageBlit.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.o: ../libs/SDL/src/test/SDL_test_imageBlitBlend.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imageBlitBlend.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imageBlitBlend.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imageBlitBlend.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.o: ../libs/SDL/src/test/SDL_test_imageFace.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imageFace.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imageFace.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imageFace.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.o: ../libs/SDL/src/test/SDL_test_imagePrimitives.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imagePrimitives.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imagePrimitives.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imagePrimitives.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.o: ../libs/SDL/src/test/SDL_test_imagePrimitivesBlend.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imagePrimitivesBlend.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imagePrimitivesBlend.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_imagePrimitivesBlend.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.o: ../libs/SDL/src/test/SDL_test_log.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_log.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_log.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_log.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.o: ../libs/SDL/src/test/SDL_test_md5.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_md5.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_md5.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_md5.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.o: ../libs/SDL/src/test/SDL_test_memory.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_memory.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_memory.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_memory.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.s

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/flags.make
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.o: ../libs/SDL/src/test/SDL_test_random.c
libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.o: libs/SDL/CMakeFiles/SDL2_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.o"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.o -MF CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.o.d -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.o -c /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_random.c

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.i"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_random.c > CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.i

libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.s"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/giovany/Development/GioEngine/libs/SDL/src/test/SDL_test_random.c -o CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.s

# Object files for target SDL2_test
SDL2_test_OBJECTS = \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.o" \
"CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.o"

# External object files for target SDL2_test
SDL2_test_EXTERNAL_OBJECTS =

libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_assert.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_common.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_compare.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_crc32.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_font.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_fuzzer.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_harness.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlit.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageBlitBlend.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imageFace.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitives.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_imagePrimitivesBlend.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_log.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_md5.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_memory.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/src/test/SDL_test_random.c.o
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/build.make
libs/SDL/libSDL2_test.a: libs/SDL/CMakeFiles/SDL2_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/giovany/Development/GioEngine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Linking C static library libSDL2_test.a"
	cd /home/giovany/Development/GioEngine/build/libs/SDL && $(CMAKE_COMMAND) -P CMakeFiles/SDL2_test.dir/cmake_clean_target.cmake
	cd /home/giovany/Development/GioEngine/build/libs/SDL && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SDL2_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libs/SDL/CMakeFiles/SDL2_test.dir/build: libs/SDL/libSDL2_test.a
.PHONY : libs/SDL/CMakeFiles/SDL2_test.dir/build

libs/SDL/CMakeFiles/SDL2_test.dir/clean:
	cd /home/giovany/Development/GioEngine/build/libs/SDL && $(CMAKE_COMMAND) -P CMakeFiles/SDL2_test.dir/cmake_clean.cmake
.PHONY : libs/SDL/CMakeFiles/SDL2_test.dir/clean

libs/SDL/CMakeFiles/SDL2_test.dir/depend:
	cd /home/giovany/Development/GioEngine/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/giovany/Development/GioEngine /home/giovany/Development/GioEngine/libs/SDL /home/giovany/Development/GioEngine/build /home/giovany/Development/GioEngine/build/libs/SDL /home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/SDL2_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libs/SDL/CMakeFiles/SDL2_test.dir/depend

