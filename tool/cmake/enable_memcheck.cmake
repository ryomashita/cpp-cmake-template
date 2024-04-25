
# 現状 GCC では成功するが、 clnag では失敗する
function(enable_memcheck target)
    find_program(VALGRIND_EXECUTABLE valgrind)
    get_target_property(target_type ${target} TYPE)
    if (NOT target_type STREQUAL "EXECUTABLE")
        message(FATAL_ERROR "enable_memcheck() can only be used with executable targets")
    endif()
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${VALGRIND_EXECUTABLE} --leak-check=full --error-exitcode=1 $<TARGET_FILE:${target}>
    )
endfunction()
