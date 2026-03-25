# Quarto Python Project

## Overview

This template is designed for a Quarto-first workflow using Python 3.13.

It is intended for:

- computational reports
- technical notes
- exploratory analysis
- research writeups
- Quarto authoring from Neovim

The source of truth is the `.qmd` document.

Typical workflow:

- write in `reports/*.qmd`
- execute with Jupyter
- preview with Quarto
- render to HTML or PDF
- optionally export to `.ipynb`

## Getting Started

Enter the development shell:

    nix develop

Or enable automatic loading with direnv:

    direnv allow

Initialize the Python environment:

    just sync

Register the project kernel:

    just kernel

Start live preview:

    just preview

Render the report:

    just render

Render PDF:

    just pdf

Export a notebook:

    just ipynb

Open JupyterLab if needed:

    just notebook

## Project Layout

    .
    ├── flake.nix
    ├── justfile
    ├── pyproject.toml
    ├── _quarto.yml
    ├── reports/
    │   └── report.qmd
    ├── notebooks/
    ├── data/
    └── assets/

- `reports/` contains Quarto source documents
- `notebooks/` can hold exported notebooks if you choose to keep them
- `data/` holds local datasets
- `assets/` holds images and other static files

## Common Commands

Show available tasks:

    just

Initialize or update Python dependencies:

    just sync

Register the Jupyter kernel:

    just kernel

Start Quarto live preview:

    just preview

Render with default format:

    just render

Render HTML:

    just html

Render PDF:

    just pdf

Export notebook:

    just ipynb

Launch JupyterLab:

    just notebook

Lint Python code:

    just lint

Format Python code:

    just format

Run type checking:

    just typecheck

Run all checks:

    just check

Clean caches and generated outputs:

    just clean

## Authoring Workflow

This template is Quarto-first.

That means:

- write and version-control `.qmd`
- treat `.ipynb` as a generated artifact unless you explicitly need it
- use Quarto preview for fast feedback
- use JupyterLab mainly for inspection, interoperability, or sharing

## Reproducibility

- `flake.lock` pins system tools and shell dependencies
- `uv.lock` pins Python dependency resolution
- `_quarto.yml` defines project-level Quarto behavior
