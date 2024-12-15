# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.
cmake_minimum_required(VERSION 3.22.1)

# Set the project name (optional, but useful for debugging)
project(TestLibrary)

# Specify the Android API level (ensure you set the minimum SDK version your project requires)
set(ANDROID_NATIVE_API_LEVEL 21)

# Include the Android toolchain file for building with NDK
set(CMAKE_TOOLCHAIN_FILE "${ANDROID_NDK}/build/cmake/android.toolchain.cmake")

# Specify supported ABIs (added aarch64 explicitly)
set(ANDROID_ABI "armeabi-v7a;arm64-v8a;aarch64;x86_64")

# Adds the shared library (test)
add_library(
    test SHARED
    src/main/c/openat.c
)

# Find the log library (part of the Android NDK)
find_library(
    log-lib
    log
)

# Link the 'test' library to the log library
target_link_libraries(
    test
    ${log-lib}
)

# Optionally, set additional flags (e.g., enabling warnings, error visibility, etc.)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror -fvisibility=hidden")

# Optionally, set up any Android-specific CMake options
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fvisibility=hidden")