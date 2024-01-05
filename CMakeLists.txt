cmake_minimum_required(VERSION 3.24)
project(CppTemplateProject VERSION 0.1 LANGUAGES CXX)

# set language standard [TODO: use target_compile_features]
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# set cmake scripts directory
set(CMAKE_SCRIPTS_DIR ${CMAKE_SOURCE_DIR}/tool/cmake)

# set default install path 
# (can be overwritten with -DCMAKE_INSTALL_PREFIX=...)
set(CMAKE_INSTALL_PREFIX
    ${CMAKE_SOURCE_DIR}/install
    CACHE PATH "..." FORCE)

# create ctest configuration in current directory
enable_testing()

add_subdirectory(src)
add_subdirectory(test)
