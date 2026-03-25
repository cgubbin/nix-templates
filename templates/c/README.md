# C Project

## Overview

This project uses a Nix flake to provide a reproducible C development environment.

It includes:

- a simple library/executable split
- debug and release build modes
- sanitizer builds
- a basic test target
- formatting and static analysis support

## Getting Started

Enter the development shell:

    nix develop

Or enable automatic loading with direnv:

    direnv allow

## Project Layout

    .
    ├── flake.nix
    ├── Makefile
    ├── include/
    │   └── hello.h
    ├── src/
    │   ├── hello.c
    │   └── main.c
    ├── tests/
    │   └── test_hello.c
    └── build/

- `src/` contains implementation files
- `include/` contains headers
- `tests/` contains test code
- `build/` contains generated artifacts

## Tooling

The development environment includes:

- gcc
- make
- gdb
- valgrind
- pkg-config
- clang-format
- clang-tidy
- bear

## Common Commands

Build the default debug configuration:

    make

Run the program:

    make run

Build an optimized release binary:

    make release

Build with sanitizers enabled:

    make sanitize

Run tests:

    make test

Format source files:

    make format

Run static analysis:

    make tidy

Generate `compile_commands.json`:

    make compile-commands

Clean build artifacts:

    make clean

## Notes

- The main executable is written to `build/main`
- Test binaries are written to `build/tests/`
- Headers should go in `include/`
- Source files should go in `src/`

## Reproducibility

- `flake.lock` pins the development toolchain and shell dependencies
