cmake_minimum_required(VERSION 3.24)
project(CppTemplateProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_EXTENSIONS OFF)

# generate build/compile_commands.json (for clang-tools)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# set cmake scripts directory
set(CMAKE_SCRIPTS_DIR ${CMAKE_SOURCE_DIR}/tool/cmake)
include(${CMAKE_SCRIPTS_DIR}/set_compile_props.cmake)

# set default install path 
# (can be overwritten with -DCMAKE_INSTALL_PREFIX=...)
set(CMAKE_INSTALL_PREFIX
    ${CMAKE_SOURCE_DIR}/install
    CACHE PATH "..." FORCE)

# create ctest configuration in current directory.
# This command should be in the source directory root.
enable_testing()

add_subdirectory(src)
add_subdirectory(test)
