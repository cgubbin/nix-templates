{
  description = "Quarto-first Python 3.13 environment with PDF support";

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
          uv
          just
          quarto

          python313Packages.jupyterlab
          python313Packages.ipykernel

          python313Packages.numpy
          python313Packages.pandas
          python313Packages.matplotlib
          python313Packages.scipy
          python313Packages.seaborn
          python313Packages.plotly

          # PDF rendering support
          texliveFull

          # Python code rendering
          rPackages.reticulate
        ];

        shellHook = ''
          echo "Quarto environment ready"
          echo
          echo "Common commands:"
          echo "  just sync"
          echo "  just kernel"
          echo "  just preview"
          echo "  just render"
          echo "  just html"
          echo "  just pdf"
          echo "  just ipynb"
          echo "  just notebook"
        '';
      };
    });
  };
}
