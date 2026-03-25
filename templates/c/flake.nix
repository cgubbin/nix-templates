{
  description = "C project template";

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
          gcc
          gnumake
          gdb
          valgrind
          pkg-config
          clang-tools
          bear
        ];

        shellHook = ''
          echo "Entered C development shell"
          echo "Targets: make debug | make release | make sanitize | make test | make format | make tidy"
        '';
      };
    });
  };
}
