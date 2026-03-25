{
  description = "Go template with production structure and Crane";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    crane = {
      url = "github:ipetkov/crane";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    crane,
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
          go_1_24
          gopls
          golangci-lint
          delve
          just
        ];

        shellHook = ''
          echo "Go environment ready"
          echo "  just run"
          echo "  just test"
          echo "  just lint"
          echo "  nix build"
          echo "  nix flake check"
        '';
      };
    });

    packages = forAllSystems (system: let
      pkgs = import nixpkgs {inherit system;};
      craneLib = crane.mkLib pkgs;

      src = craneLib.cleanCargoSource ./.;
    in {
      default = craneLib.buildPackage {
        inherit src;
      };
    });

    checks = forAllSystems (system: let
      pkgs = import nixpkgs {inherit system;};
      craneLib = crane.mkLib pkgs;

      src = craneLib.cleanCargoSource ./.;
    in {
      build = craneLib.buildPackage {inherit src;};

      lint = pkgs.runCommand "golangci-lint" {} ''
        ${pkgs.golangci-lint}/bin/golangci-lint run ./...
        touch $out
      '';

      test = pkgs.runCommand "go-test" {} ''
        ${pkgs.go_1_24}/bin/go test ./...
        touch $out
      '';
    });
  };
}
