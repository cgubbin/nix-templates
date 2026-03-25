{
  description = "Shell scripting template";

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
          bash
          shellcheck
          shfmt
          bash-language-server
          bats
          just
          jq
          yq
        ];

        shellHook = ''
          echo "Shell environment ready"
          echo "  just run"
          echo "  just lint"
          echo "  just fmt"
          echo "  just test"
        '';
      };
    });
  };
}
