set shell := ["bash", "-cu"]

default:
    @just --list

fmt:
    nix fmt

check:
    nix flake check

update:
    nix flake update

list:
    nix flake show

clean:
    find . -name result -type l -delete


tmpdir := "/tmp/nix-template-check"

validate template:
    rm -rf {{tmpdir}}
    nix flake new {{tmpdir}} -t .#{{template}}

validate-c:
    just validate c
    cd {{tmpdir}} && nix develop -c bash -lc "make"

validate-cpp:
    just validate cpp
    cd {{tmpdir}} && nix develop -c bash -lc "just debug && just build"

validate-rust:
    just validate rust
    cd {{tmpdir}} && nix develop -c bash -lc "just init && just test"

validate-go:
    just validate go
    cd {{tmpdir}} && nix develop -c bash -lc "just test"

validate-python-app:
    just validate python-app
    cd {{tmpdir}} && nix develop -c bash -lc "just sync && just test"

validate-python-lib:
    just validate python-lib
    cd {{tmpdir}} && nix develop -c bash -lc "just sync && just test"

validate-quarto:
    just validate quarto-python
    cd {{tmpdir}} && nix develop -c bash -lc "just sync && just html"

validate-latex:
    just validate latex
    cd {{tmpdir}} && nix develop -c bash -lc "just pdf"

validate-shell:
    just validate shell
    cd {{tmpdir}} && nix develop -c bash -lc "just check"

validate-all:
    just validate-c
    just validate-cpp
    just validate-rust
    just validate-go
    just validate-python-app
    just validate-python-lib
    just validate-quarto
    just validate-latex
    just validate-shell


