{
  description = "Python 3.13 project template with pixi";

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
          python313
          pyright
          pixi
          python313Packages.ruff
          python313Packages.ipykernel
          python313Packages.jupyterlab
          just
        ];

    #     shellHook = ''
    #       echo "Entered Python 3.13 development shell"
    #
    #       if [ -f pyproject.toml ]; then
    #         if [ ! -d .venv ]; then
    #           echo "[python] creating venv"
    #           [ -f .venv/bin/activate ] || uv venv .venv
    #
    #           echo "[python] syncing deps"
    #           uv sync
    #         fi
    #         . ./.venv/bin/activate
    #       fi
    #     '';
      };
    });
  };
}
