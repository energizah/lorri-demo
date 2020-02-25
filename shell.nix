{ pkgs ? import <nixpkgs> {} }:

let
  proj = pkgs.callPackage ./. {inherit pkgs;};
in
proj
