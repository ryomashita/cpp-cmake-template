# cpp-cmake-template

## About

A template for C++ projects using CMake.
This repository includes settings for the following tools:

- [CMake](https://cmake.org/)
- [vcpkg](https://github.com/microsoft/vcpkg)
- [Google Test](https://github.com/google/googletest)
- [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
- [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)
- [VSCode](https://code.visualstudio.com/)
- VSCode Extensions:
  - [clangd](https://clangd.llvm.org/)
  - [CMake Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools)
  - [C/C++ Include Guard](https://marketplace.visualstudio.com/items?itemName=akiramiyakoda.cppincludeguard)

## Directoris

The directory structure is based on [The Pitchfork Layout (PFL)](https://api.csswg.org/bikeshed/?force=1&url=https://raw.githubusercontent.com/vector-of-bool/pitchfork/develop/data/spec.bs).
(but there are some differences.)

- `include/` : Contains public header files for users.
- `src/` : Contains source files (including private header files and cmake scripts).
- `test/` : Contains test files.
- `example/` : Contains example files.
- `external/` : Contains source files and libraries from external projects.
- `data/` : Contains not explicitly code files.
- `tool/` : Contains scripts and tools.
  - `cmake/` : Contains CMake scripts.
- `doc/` : Contains documents.

The following directories are not included in the repository, but these names are reserved.

- `build/` : Temporary build directory.
- `install/` : Temporary install directory.

If you want to add submodule projects, you need to add the following directories.

- `lib/` : the root directory of the submodule projects.
- `extra/` : the root directory of the submodule projects with some dependencies.

## Usage

### add packages with vcpkg

Reference: https://learn.microsoft.com/ja-jp/vcpkg/get_started/get-started?pivots=shell-powershell

1. Install vcpkg

```sh
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh # Linux / macOS
.\bootstrap-vcpkg.bat # Windows

export VCPKG_ROOT=<path-to-vcpkg-dir> # e.g., export VCPKG_ROOT=$HOME/.local/vcpkg
export PATH=$VCPKG_ROOT:$PATH
```

2. Initialize vcpkg in the project directory

```sh
vcpkg new --application
```

3. Integrate vcpkg with CMake

CMake can automatically link libraries installed by vcpkg when `CMAKE_TOOLCHAIN_FILE` is set before `project()` command call.
The `CMAKE_TOOLCHAIN_FILE` is defined in `CMakePresets.json`.
However, the dependent VCPKG_ROOT variable needs to be defined in `CMakeUserPresets.json`.
Do not include `CMakeUserPresets.json` in version control.

Example of `CMakeUserPresets.json`:

```json:CMakeUserPresets.json
{
  "version": 2,
  "configurePresets": [
    {
      "name": "x64",
      "inherits": "default",
      "environment": {
        "VCPKG_ROOT": "$env{HOME}/path/to/vcpkg"
      }
    }
  ]
}
```

4. Install packages

```sh
vcpkg add port <package-name> # e.g., vcpkg add port fmt
vcpkg install
```

5. Find packages in `CMakeLists.txt` and link libraries to targets

```cmake
# e.g., to use fmt library
find_package(fmt CONFIG REQUIRED)
target_link_libraries(<target> PRIVATE fmt::fmt)
```
