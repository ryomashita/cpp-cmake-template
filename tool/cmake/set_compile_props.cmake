function(set_target_cxx20 target)
  target_compile_features(${target} PRIVATE cxx_std_20)
endfunction()

function(set_normal_compile_options target)
  # Set Language Standard
  set_target_cxx20(${target})  

  # Set Compile Options
  if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    # using Visual Studio C++ (/W4) # 例: 警告レベルを設定
    target_compile_options(${target} PRIVATE /W4)
    target_compile_options(${target} PRIVATE $<$<CONFIG:Release>:/O2>)
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID STREQUAL "Clang" OR CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
    # using GCC
    target_compile_options(${target} PRIVATE -O2)
    # Wextra : 有用でないor回避しづらい警告を有効にする
    # Wpedantic : コンパイラ拡張機能を警告する
    target_compile_options(${target} PRIVATE -Wextra -Wpedantic)

    # Recommended Compile Options by OpenSSF
    # https://best.openssf.org/Compiler-Hardening-Guides/Compiler-Options-Hardening-Guide-for-C-and-C++.html
    # https://www.linuxfoundation.jp/openssf/2023/12/compiler-options-hardening-guide-for-c-and-cpp-jp/
    target_compile_options(${target} PRIVATE
      -Wall -Wformat=2 -Wconversion -Wtrampolines -Wimplicit-fallthrough
      -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3
      -D_GLIBCXX_ASSERTIONS
      -fstrict-flex-arrays=3 # since GCC 13 & Clang 16.0.0
      -fstack-clash-protection -fstack-protector-strong
      -Wl,-z,nodlopen -Wl,-z,noexecstack # linker options are warned in clang
      -Wl,-z,relro -Wl,-z,now
      -fPIE -pie -fPIC -shared)
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    # using Clang
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Intel")
    # using Intel C++
  endif()
endfunction()
