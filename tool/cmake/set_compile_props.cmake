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
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    # using GCC
    target_compile_options(${target} PRIVATE -Wall -Wextra -Wpedantic) # 例: 警告オプションを設定
    target_compile_options(${target} PRIVATE -O2)
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    # using Clang
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Intel")
    # using Intel C++
  endif()
endfunction()
