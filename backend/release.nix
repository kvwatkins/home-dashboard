let
  pkgs = import <nixpkgs> { };

in
  pkgs.haskellPackages.callPackage ./home-dashboard-backend.nix { }
