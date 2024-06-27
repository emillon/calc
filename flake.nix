{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;
      in
      {
        formatter = pkgs.nixpkgs-fmt;
        packages.default = ocamlPackages.buildDunePackage {
          pname = "calc";
          version = "n/a";
          src = ./.;
          nativeBuildInputs = with ocamlPackages; [ menhir ];
          buildInputs = with ocamlPackages; [
            alcotest
            cmdliner
            ppx_deriving
            ppxlib
          ];
        };
        devShells.default = pkgs.mkShell {
          inputsFrom = [ self.packages.${system}.default ];
          nativeBuildInputs = with ocamlPackages; [
            merlin
            ocamlformat_0_26_1
          ];
        };
      });
}
