cmake_minimum_required(VERSION 3.20)

project(cpp_project VERSION 0.1.0 LANGUAGES CXX)

include(cmake/PreventInSourceBuilds.cmake)
prevent_in_source_builds()

option(ENABLE_SANITIZERS "Enable address/undefined sanitizers" OFF)
option(ENABLE_WARNINGS_AS_ERRORS "Treat warnings as errors" OFF)
option(ENABLE_FETCHCONTENT_EXAMPLE "Enable example external dependency setup" OFF)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE cxx_std_20)

add_library(project_warnings INTERFACE)
target_compile_options(project_warnings INTERFACE
    -Wall
    -Wextra
    -Wpedantic
    -Wshadow
    -Wconversion
)

if(ENABLE_WARNINGS_AS_ERRORS)
    target_compile_options(project_warnings INTERFACE -Werror)
endif()

add_library(project_sanitizers INTERFACE)
if(ENABLE_SANITIZERS)
    target_compile_options(project_sanitizers INTERFACE
        -fsanitize=address,undefined
        -fno-omit-frame-pointer
    )
    target_link_options(project_sanitizers INTERFACE
        -fsanitize=address,undefined
    )
endif()

if(ENABLE_FETCHCONTENT_EXAMPLE)
    include(FetchContent)

    # Example scaffold:
    # FetchContent_Declare(
    #   fmt
    #   GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    #   GIT_TAG 11.0.2
    # )
    # FetchContent_MakeAvailable(fmt)
endif()

add_library(hello
    src/hello.cpp
)

target_include_directories(hello
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_link_libraries(hello
    PUBLIC
        project_options
        project_warnings
        project_sanitizers
)

add_executable(main
    src/main.cpp
)

target_link_libraries(main
    PRIVATE
        hello
)

enable_testing()
add_subdirectory(tests)
add_subdirectory(bench)
