{
  description = "Forked adaptagrams.";

  inputs = {
    nixpkgs-pointer.url = "github:yipengsun/nixpkgs-pointer";
    nixpkgs.follows = "nixpkgs-pointer/nixpkgs";
    flake-utils.follows = "nixpkgs-pointer/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    {
      overlays.default = import ./nix/overlay.nix;
    } //
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
        };
        lib = pkgs.lib;
      in
      rec {
        packages = flake-utils.lib.flattenTree {
          inherit (pkgs)
            adaptagrams-fork
            cairomm
            cairomm_1_16
            ;
        };

        devShells.default = pkgs.mkShell {
          name = "adaptagrams-fork-dev";
          buildInputs = with pkgs; [
            conan
            cmake
          ];
        };
      });
}
