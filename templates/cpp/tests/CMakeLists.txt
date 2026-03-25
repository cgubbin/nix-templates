add_executable(test_hello
    test_hello.cpp
)

target_link_libraries(test_hello
    PRIVATE
        hello
)

add_test(NAME test_hello COMMAND test_hello)
