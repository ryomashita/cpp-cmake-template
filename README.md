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

### Add `CMakeUserPresets.json`

Settings that depend on the environment (e.g., compilers and vcpkg installation path) should be defined in `CMakeUserPresets.json`.
`CMakeUserPresets.json`is not tracked by Git, so it needs to be created separately for each environment.

Example of `CMakeUserPresets.json` on Windows:
(In practice, specifying the full path to the compilers is recommended.)

```json:CMakeUserPresets.json
{
  "version": 2,
  "configurePresets": [
    {
      "name": "x64",
      "inherits": "default",
      "cacheVariables": {
        "CMAKE_C_COMPILER": "clang.exe",
        "CMAKE_CXX_COMPILER": "clang++.exe",
        "CMAKE_MAKE_PROGRAM": "ninja.exe"
      },
      "environment": {
        "VCPKG_ROOT": "C:/vcpkg"
      }
    }
  ]
}
```

[WARNING] **On Windows, the compilers bundled with Visual Studio will run targeting x86 by default.**
To work around this, need to call `vcvarsall.bat` to set up an x64 environment, or use custom-installed compilers such as LLVM/Clang (e.g., via winget).

### Add packages with vcpkg

Reference: https://learn.microsoft.com/ja-jp/vcpkg/get_started/get-started?pivots=shell-powershell

1. Install vcpkg

(On Linux)

```sh
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh # Linux / macOS

export VCPKG_ROOT=<path-to-vcpkg-dir> # e.g., export VCPKG_ROOT=$HOME/.local/vcpkg
export PATH=$VCPKG_ROOT:$PATH
```

(On Windows PowerShell)

```ps1
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat # Windows

$env:VCPKG_ROOT = "<path-to-vcpkg-dir>" # e.g., $env:VCPKG_ROOT = "C:\vcpkg"
$env:Path = "$env:Path;$env:VCPKG_ROOT"
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

4. Install packages

```sh
vcpkg add port <package-name> # e.g., vcpkg add port fmt
vcpkg install
```

5. Find packages and link libraries to targets in `CMakeLists.txt`

```cmake
# e.g., to use fmt library
find_package(fmt CONFIG REQUIRED)
target_link_libraries(<target> PRIVATE fmt::fmt)
```
