# nix not supported git submodules at the time in a good way
{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    meghna = {
      url = github:themefisher/meghna-hugo;
      flake = false;
    };

  };
  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, meghna, ... }:

    flake-utils.lib.eachDefaultSystem (system:
    let
        pkgs = nixpkgs.legacyPackages.${system};
        version = builtins.substring 0 8 self.lastModifiedDate;
        overlay-unstable = final: prev: {
            unstable = nixpkgs-unstable.legacyPackages.${prev.system};
        };
    in {
        packages.steinreinigung-steffens = pkgs.stdenv.mkDerivation {
            name = "steinreinigung-steffens";
            src = ./.;
            nativeBuildInputs = [ pkgs.git pkgs.hugo ];
            buildPhase = ''
            mkdir -p themes
            ln -s ${meghna} themes/meghna-hugo
            ${pkgs.hugo}/bin/hugo --minify
            '';
            installPhase = "cp -r public $out";
            meta = with pkgs.lib; {
              description = "static site steinreinigung-steffens";
              platforms = platforms.all;
            };
        };
        defaultPackage = self.packages.${system}.steinreinigung-steffens;
        devShells = {
          default = pkgs.mkShell { buildInputs = with pkgs; [ hugo ]; };
        };
    });
}
