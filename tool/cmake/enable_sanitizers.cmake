# 現状 GCC, CLang どちらもビルドエラーになる
function(enable_sanitizers target)
    set_target_properties(${target} PROPERTIES
        COMPILE_OPTIONS ""
    )
    target_compile_options(${target} PRIVATE
        -O0 -g -fno-omit-frame-pointer -fsanitize=address -fsanitize=leak -fsanitize=undefined
    )
    # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -g -fno-omit-frame-pointer -fsanitize=address -fsanitize=leak -fsanitize=undefined")
endfunction()
