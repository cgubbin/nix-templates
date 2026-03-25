{
  description = "LaTeX template using Tectonic";

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
          tectonic
          just
        ];

        shellHook = ''
          echo "LaTeX environment ready"
          echo "  just pdf"
          echo "  just watch"
          echo "  just clean"
        '';
      };
    });
  };
}
