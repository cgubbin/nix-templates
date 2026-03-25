# Shell Project

## Overview

This template provides a Bash-first shell development environment.

It includes:

- ShellCheck for linting
- shfmt for formatting
- bash-language-server for editor support
- bats for tests

## Getting Started

Enter the development shell:

    nix develop

Or enable automatic loading:

    direnv allow

Run the script:

    just run

Lint scripts:

    just lint

Format scripts:

    just fmt

Run tests:

    just test

## Project Layout

    .
    ├── flake.nix
    ├── justfile
    ├── scripts/
    └── test/

## Notes

- `scripts/` contains executable shell scripts
- `test/` contains bats tests
- This template targets Bash, not strict POSIX sh

## Reproducibility

- `flake.lock` pins the environment
