CC := gcc

WARN := -Wall -Wextra -Wpedantic -Wshadow -Wconversion -Wstrict-prototypes
CPPFLAGS := -Iinclude
CSTD := -std=c11

DEBUG_FLAGS := $(CSTD) $(WARN) -O0 -g3
RELEASE_FLAGS := $(CSTD) $(WARN) -O2 -DNDEBUG
SANITIZE_FLAGS := $(CSTD) $(WARN) -O1 -g3 -fsanitize=address,undefined -fno-omit-frame-pointer

SRC := $(wildcard src/*.c)
LIB_SRC := $(filter-out src/main.c,$(SRC))
TEST_SRC := $(wildcard tests/*.c)

BUILD_DIR := build
TEST_BUILD_DIR := $(BUILD_DIR)/tests

TARGET := $(BUILD_DIR)/main
TEST_TARGETS := $(patsubst tests/%.c,$(TEST_BUILD_DIR)/%,$(TEST_SRC))

.PHONY: all debug release sanitize run test format tidy clean compile-commands valgrind

all: debug

debug: CFLAGS := $(DEBUG_FLAGS)
debug: $(TARGET)

release: CFLAGS := $(RELEASE_FLAGS)
release: $(TARGET)

sanitize: CFLAGS := $(SANITIZE_FLAGS)
sanitize: LDFLAGS := -fsanitize=address,undefined
sanitize: $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(TEST_BUILD_DIR):
	mkdir -p $(TEST_BUILD_DIR)

$(TARGET): $(BUILD_DIR)
	$(CC) $(CFLAGS) $(CPPFLAGS) src/main.c $(LIB_SRC) -o $@ $(LDFLAGS)

run: debug
	./$(TARGET)

$(TEST_BUILD_DIR)/%: tests/%.c $(LIB_SRC) | $(TEST_BUILD_DIR)
	$(CC) $(DEBUG_FLAGS) $(CPPFLAGS) $< $(LIB_SRC) -o $@

test: $(TEST_TARGETS)
	@set -e; \
	for t in $(TEST_TARGETS); do \
	  echo "Running $$t"; \
	  "$$t"; \
	done

valgrind: debug
	valgrind --leak-check=full --show-leak-kinds=all ./$(TARGET)

format:
	find src include tests -type f \( -name '*.c' -o -name '*.h' \) -exec clang-format -i {} +

tidy:
	clang-tidy src/*.c tests/*.c -- $(CPPFLAGS)

compile-commands:
	bear -- make clean debug

clean:
	rm -rf $(BUILD_DIR)
	rm -f compile_commands.json
