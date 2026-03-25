# LaTeX Project

## Overview

This template uses Tectonic for LaTeX compilation.

It is intended for:

- papers
- notes
- reports
- handouts

## Getting Started

Enter the development shell:

    nix develop

Or enable automatic loading:

    direnv allow

Build the PDF:

    just pdf

Watch and rebuild automatically:

    just watch

Clean generated files:

    just clean

## Project Layout

    .
    ├── flake.nix
    ├── justfile
    ├── main.tex
    ├── refs.bib
    └── figures/

## Notes

- `main.tex` is the document entrypoint
- `figures/` is for images and diagrams
- Tectonic handles dependency fetching automatically

## Reproducibility

- `flake.lock` pins the environment
