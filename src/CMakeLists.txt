add_library(Foo foo.cpp)
include(${CMAKE_SCRIPTS_DIR}/set_target_compile_props.cmake)
set_normal_compile_options(Foo)