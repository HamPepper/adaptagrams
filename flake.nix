{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-parts, ... } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; }  ({ ... }: {
      imports = [ inputs.flake-parts.flakeModules.easyOverlay ];

      systems = [ "x86_64-linux" /* "x86_64-darwin" */ "aarch64-darwin" ];

      perSystem = { config, system, pkgs', ... }:
        {
          _module.args.pkgs' = import nixpkgs { inherit system; };

          packages.adaptagrams = pkgs'.callPackage ./nix/default.nix { };

          overlayAttrs = {
            inherit (config.packages) adaptagrams;
          };
        };
    });
}
