{
  description = "C++ project template";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

  outputs = {
    self,
    nixpkgs,
  }: let
    lib = nixpkgs.lib;
    systems = ["x86_64-linux" "aarch64-linux"];
    forAllSystems = lib.genAttrs systems;
  in {
    devShells = forAllSystems (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
          clang
          cmake
          ninja
          gdb
          valgrind
          pkg-config
          clang-tools
          hyperfine
        ];

        shellHook = ''
          echo "Entered C++ development shell"
          echo "Common commands:"
          echo "  make debug"
          echo "  make build"
          echo "  make run"
          echo "  make test"
          echo "  make sanitize"
          echo "  make bench"
        '';
      };
    });
  };
}
