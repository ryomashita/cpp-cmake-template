include(${CMAKE_SCRIPTS_DIR}/set_compile_props.cmake)

add_library(Foo foo.cpp)
set_normal_compile_options(Foo)