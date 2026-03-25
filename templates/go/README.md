# Go Project

## Overview

This template provides a production-oriented Go setup using:

- Nix flakes for reproducibility
- Crane for Nix-native builds and checks
- Go 1.24
- `just` for command execution
- `golangci-lint` for linting
- `gopls` for editor support

It includes:

- structured application layout
- CLI with subcommands
- structured logging (`log/slog`)
- test, benchmark, and fuzz support

---

## Architecture

This template separates concerns:

| Layer        | Tool        |
|-------------|------------|
| Toolchain   | Nix (Go)   |
| Build       | Go         |
| CI          | Crane/Nix  |
| UX          | just       |

---

## Project Layout

    cmd/        → entrypoints
    internal/   → application code
    test/       → integration tests

---

## Getting Started

    nix develop
    direnv allow

Run:

    just run

---

## Common Commands

Run app:

    just run

Run subcommand:

    just run hello --name Alice

Test:

    just test

Lint:

    just lint

Check everything:

    just check

---

## Nix Workflows

Build:

    nix build

Run checks:

    nix flake check

---

## Notes

- Uses `internal/` for encapsulated app logic
- Uses standard library `log/slog` for logging
- CLI structure is minimal but extensible

---

## Extending

- add subcommands in `internal/app`
- introduce config parsing
- add database/service layer
