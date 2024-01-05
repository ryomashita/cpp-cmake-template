# cpp-cmake-template

## About
A template for C++ projects using CMake.
Contains settings for using the following tools:
+ [CMake](https://cmake.org/)
+ [VSCode](https://code.visualstudio.com/)
+ [Google Test](https://github.com/google/googletest)
+ [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
+ [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)

## Directoris
The directory structure is based on [The Pitchfork Layout (PFL)](https://api.csswg.org/bikeshed/?force=1&url=https://raw.githubusercontent.com/vector-of-bool/pitchfork/develop/data/spec.bs).
(but there are some differences.)

- `include/` : Contains public header files for users.
- `src/` : Contains source files (including private header files and cmake scripts).
- `test/` : Contains test files.
- `examples/` : Contains example files.
- `external/` : Contains source files and libraries from external projects.
- `data/` : Contains not explicitly code files.
- `tool/` : Contains scripts and tools.
  - `cmake/` : Contains CMake scripts.
- `doc/` : Contains documents.

The following directories are not included in the repository, but there names are reserved.
- `build/` : Temporary build directory.
- `install/` : Temporary install directory.

If you want to add submodule projects, you need to add the following directories.
- `lib/` : the root directory of the submodule projects.
- `extra/` : the root directory of the submodule projects with some dependencies.
