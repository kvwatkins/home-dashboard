#!/bin/bash

# Documentation 
# - https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/docker/examples.nix

{ pkgs ? import <nixpkgs> {}
, pkgsLinux ? import <nixpkgs> { system="x86_64-linux"; }
}:

rec {
  # https://github.com/Gabriel439/haskell-nix
   backend = pkgs.dockerTools.buildImage {

     name = "backend";
     tag = "latest";
     created = "now";

     contents = [
       pkgs.bashInteractive
       pkgs.cabal2nix
       pkgs.nix-prefetch-git
       pkgs.cabal-install
     ];

     runAsRoot = '' 
       mkdir -p /backend
     '';

     config = {
       Cmd = [ "${pkgs.bashInteractive}/bin/bash"];
       WorkingDir = "/backend";
       Volumes = {
         "/backend" = {};
       };
     };
   };
}