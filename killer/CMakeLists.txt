# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.22.1)

# Set the project name
project(SignatureKiller)

# Set C flags for compiling the native code
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror -fvisibility=hidden")

# Include the Android toolchain for building with NDK
set(CMAKE_TOOLCHAIN_FILE "${ANDROID_NDK}/build/cmake/android.toolchain.cmake")

# Specify the Android API level (ensure you set the minimum SDK version your project requires)
set(ANDROID_NATIVE_API_LEVEL 21)

# Specify supported ABIs (added aarch64 explicitly)
set(ANDROID_ABI "armeabi-v7a;arm64-v8a;aarch64;x86_64")

# Adds the shared library
add_library(
    SignatureKiller SHARED
    src/main/c/mt_jni.c
    src/main/c/xhook.c
    src/main/c/xh_core.c
    src/main/c/xh_elf.c
    src/main/c/xh_log.c
    src/main/c/xh_util.c
    src/main/c/xh_version.c
)

# Find the log library provided by Android NDK
find_library(
    log-lib
    log
)

# Link the native library with the log library
target_link_libraries(
    SignatureKiller
    ${log-lib}
)

# Optionally, set up any Android-specific CMake options
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fvisibility=hidden")