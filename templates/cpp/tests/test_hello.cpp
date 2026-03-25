#include <cassert>
#include <string_view>

#include "hello.hpp"

int main() {
    assert(hello_message() == std::string_view{"Hello, world!"});
    return 0;
}
