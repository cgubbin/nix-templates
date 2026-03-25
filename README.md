![Nix](https://img.shields.io/badge/Nix-flakes-blue)
![License](https://img.shields.io/badge/license-MIT-green)

# Nix Project Templates

A curated collection of reproducible development templates built with:

- Nix flakes
- direnv
- just
- modern language tooling

These templates are designed for:

- fast project bootstrapping
- consistent developer environments
- reproducible builds
- minimal but scalable structure

---

## Usage

Create a new project from a template:

    nix flake new my-project -t github:<your-user>/nix-templates#<template>

Or locally:

    nix flake new my-project -t ~/src/nix-templates#<template>

---

## Templates

### Systems Languages

| Template | Description |
|----------|------------|
| `c` | Minimal C template with Make |
| `cpp` | Modern C++ with CMake + just |
| `rust` | Rust with Fenix + Crane + CLI + benchmarks |
| `go` | Go 1.24 with CLI, linting, fuzzing, and Crane |

---

### Python

| Template | Description |
|----------|------------|
| `python-app` | CLI/application template with uv |
| `python-lib` | Library template |
| `quarto-python` | Quarto-first research / notebook workflow |

---

### Documents

| Template | Description |
|----------|------------|
| `latex` | Tectonic-based LaTeX template |

---

### Tooling / Automation

| Template | Description |
|----------|------------|
| `shell` | Bash scripting with linting + tests |

---

### GPU / Compute

| Template | Description |
|----------|------------|
| `cuda` | CUDA C++ template (requires NVIDIA setup) |

---

## Workflow

All templates follow the same conventions:

- `nix develop` → enter environment
- `direnv allow` → auto-load environment
- `just` → primary command interface

---

## Philosophy

These templates are intentionally:

- minimal but complete
- reproducible by default
- consistent across languages
- extensible without framework lock-in

Each template separates:

| Concern        | Tool |
|----------------|------|
| Environment    | Nix |
| Build system   | Language-native (Cargo, Go, CMake, etc.) |
| CI / reproducibility | Nix / Crane |
| UX             | just |

---

## Adding a Template

1. Create a directory under `templates/`
2. Add a `flake.nix`
3. Add README + justfile
4. Register it in the root `flake.nix`

---

## Requirements

- Nix (flakes enabled)
- direnv (recommended)
- just

---

## License

MIT
