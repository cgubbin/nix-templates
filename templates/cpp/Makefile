BUILD_DIR := build
GENERATOR := Ninja

.PHONY: debug release sanitize build run test format tidy compdb bench clean reconfigure

debug:
	cmake -B $(BUILD_DIR) -G $(GENERATOR) -DCMAKE_BUILD_TYPE=Debug

release:
	cmake -B $(BUILD_DIR) -G $(GENERATOR) -DCMAKE_BUILD_TYPE=Release

sanitize:
	cmake -B $(BUILD_DIR) -G $(GENERATOR) \
		-DCMAKE_BUILD_TYPE=Debug \
		-DENABLE_SANITIZERS=ON

build:
	cmake --build $(BUILD_DIR)

run:
	./$(BUILD_DIR)/main

test:
	ctest --test-dir $(BUILD_DIR) --output-on-failure

format:
	find src include tests bench -type f \( -name '*.cpp' -o -name '*.hpp' \) -exec clang-format -i {} +

tidy:
	clang-tidy src/*.cpp tests/*.cpp bench/*.cpp -- -Iinclude -std=c++20

compdb:
	ln -sf $(BUILD_DIR)/compile_commands.json compile_commands.json

bench:
	./$(BUILD_DIR)/bench_hello

clean:
	rm -rf $(BUILD_DIR)
	rm -f compile_commands.json

reconfigure: clean debug
