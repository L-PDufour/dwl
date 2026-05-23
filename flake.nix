{
  description = "dwl — patched fork, built from source";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems      = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          dwl  = pkgs.callPackage ./package.nix {};
        in {
          inherit dwl;
          default = dwl;
        });
    };
}
