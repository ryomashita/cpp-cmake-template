cmake_minimum_required(VERSION 3.24)
project(ggHostLoader VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# install default install path (can be overwritten with
# -DCMAKE_INSTALL_PREFIX=...)
set(CMAKE_INSTALL_PREFIX
    ${CMAKE_SOURCE_DIR}/install
    CACHE PATH "..." FORCE)

# create ctest configuration in current directory
enable_testing()

add_subdirectory(src)
add_subdirectory(test)
