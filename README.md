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

- `build/` : temporary build directory.
- `include/` : Contains public header files for users.
- `src/` : Contains source files and private header files.
- `tests/` : Contains test files.
- `examples/` : Contains example files.
- `externals/` : Contains files from external projects.
- `data/` : Contaqins not explicitly code files.
- `tools/` : Contains scripts and tools.
- `docs/` : Contains documents.
- `cmakes/` : Contains CMake scripts.

If you want to add submodule projects, you need to add the following directories.
- `libs/` : the root directory of the submodule projects.
- `extras/` : the root directory of the submodule projects with some dependencies.
