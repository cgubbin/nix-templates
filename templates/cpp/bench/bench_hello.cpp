#include <chrono>
#include <cstddef>
#include <iostream>
#include <string_view>

#include "hello.hpp"

int main() {
    constexpr std::size_t iterations = 10'000'000;
    volatile std::size_t sink = 0;

    const auto start = std::chrono::steady_clock::now();

    for (std::size_t i = 0; i < iterations; ++i) {
        sink += hello_message().size();
    }

    const auto end = std::chrono::steady_clock::now();
    const auto elapsed = std::chrono::duration_cast<std::chrono::microseconds>(end - start);

    std::cout << "iterations: " << iterations << '\n';
    std::cout << "elapsed_us: " << elapsed.count() << '\n';
    std::cout << "sink: " << sink << '\n';

    return 0;
}
