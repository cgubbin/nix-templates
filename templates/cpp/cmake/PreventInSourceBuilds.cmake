function(prevent_in_source_builds)
    if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
        message(FATAL_ERROR
            "In-source builds are not allowed.\n"
            "Use: cmake -B build -G Ninja"
        )
    endif()
endfunction()
