# Python Application

## Overview

This project is a Python 3.13 application template using:

- Nix flakes for the system development environment
- `uv` for Python dependency management
- `just` for task running
- `pytest` for tests
- `ruff` for linting and formatting
- `pyright` for type checking

It is intended for:

- command-line tools
- scripts
- services
- general applications

## Getting Started

Enter the development shell:

    nix develop

Or enable automatic loading with direnv:

    direnv allow

Create the Python environment and install dependencies:

    just sync

Run the application:

    just run

Run tests:

    just test

Lint:

    just lint

Format:

    just format

Run type checking:

    just typecheck

Launch JupyterLab:

    just notebook

## Project Layout

    .
    ├── flake.nix
    ├── justfile
    ├── pyproject.toml
    ├── src/
    │   └── my_project/
    │       ├── __init__.py
    │       ├── __main__.py
    │       └── cli.py
    ├── tests/
    └── notebooks/

## Common Commands

Install/update dependencies:

    just sync

Run the app:

    just run

Run the test suite:

    just test

Run lint checks:

    just lint

Format code:

    just format

Run type checks:

    just typecheck

Run all checks:

    just check

Show dependency tree:

    just tree

Update lockfile:

    just lock

Clean local caches:

    just clean

## Reproducibility

- `flake.lock` pins system dependencies
- `uv.lock` pins Python dependency resolution
