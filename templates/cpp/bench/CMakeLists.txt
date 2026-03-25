add_executable(bench_hello
    bench_hello.cpp
)

target_link_libraries(bench_hello
    PRIVATE
        hello
)
