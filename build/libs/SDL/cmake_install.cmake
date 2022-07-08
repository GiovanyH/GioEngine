# Install script for directory: /home/giovany/Development/GioEngine/libs/SDL

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/giovany/Development/GioEngine/build/libs/SDL/libSDL2-2.0.so.0.2301.0"
    "/home/giovany/Development/GioEngine/build/libs/SDL/libSDL2-2.0.so.0"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2-2.0.so.0.2301.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2-2.0.so.0"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/giovany/Development/GioEngine/build/libs/SDL/libSDL2-2.0.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2-2.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2-2.0.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2-2.0.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/giovany/Development/GioEngine/build/libs/SDL/libSDL2main.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/giovany/Development/GioEngine/build/libs/SDL/libSDL2.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/giovany/Development/GioEngine/build/libs/SDL/libSDL2_test.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake"
         "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2mainTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2mainTargets.cmake"
         "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2mainTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2mainTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2mainTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2mainTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2mainTargets-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2staticTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2staticTargets.cmake"
         "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2staticTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2staticTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2staticTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2staticTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2staticTargets-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2testTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2testTargets.cmake"
         "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2testTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2testTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2testTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2testTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/home/giovany/Development/GioEngine/build/libs/SDL/CMakeFiles/Export/lib/cmake/SDL2/SDL2testTargets-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES
    "/home/giovany/Development/GioEngine/build/libs/SDL/SDL2Config.cmake"
    "/home/giovany/Development/GioEngine/build/libs/SDL/SDL2ConfigVersion.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL2" TYPE FILE FILES
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_assert.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_atomic.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_audio.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_bits.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_blendmode.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_clipboard.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_copying.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_cpuinfo.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_egl.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_endian.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_error.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_events.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_filesystem.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_gamecontroller.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_gesture.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_guid.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_haptic.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_hidapi.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_hints.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_joystick.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_keyboard.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_keycode.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_loadso.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_locale.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_log.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_main.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_messagebox.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_metal.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_misc.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_mouse.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_mutex.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_name.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_opengl.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_opengl_glext.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_opengles.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_opengles2.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_opengles2_gl2.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_opengles2_gl2ext.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_opengles2_gl2platform.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_opengles2_khrplatform.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_pixels.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_platform.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_power.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_quit.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_rect.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_render.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_rwops.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_scancode.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_sensor.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_shape.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_stdinc.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_surface.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_system.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_syswm.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_assert.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_common.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_compare.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_crc32.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_font.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_fuzzer.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_harness.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_images.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_log.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_md5.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_memory.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_test_random.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_thread.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_timer.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_touch.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_types.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_version.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_video.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/SDL_vulkan.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/begin_code.h"
    "/home/giovany/Development/GioEngine/libs/SDL/include/close_code.h"
    "/home/giovany/Development/GioEngine/build/libs/SDL/include/SDL_revision.h"
    "/home/giovany/Development/GioEngine/build/libs/SDL/include-config-/SDL_config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
            execute_process(COMMAND /usr/bin/cmake -E create_symlink
              "libSDL2-2.0.so" "libSDL2.so"
              WORKING_DIRECTORY "/home/giovany/Development/GioEngine/build/libs/SDL")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE FILES "/home/giovany/Development/GioEngine/build/libs/SDL/libSDL2.so")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/giovany/Development/GioEngine/build/libs/SDL/sdl2.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/home/giovany/Development/GioEngine/build/libs/SDL/sdl2-config")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/aclocal" TYPE FILE FILES "/home/giovany/Development/GioEngine/libs/SDL/sdl2.m4")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/SDL2" TYPE FILE FILES "/home/giovany/Development/GioEngine/libs/SDL/LICENSE.txt")
endif()

