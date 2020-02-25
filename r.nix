{pkgs ? import <nixpkgs> {}}:


let
  gitignoreSrc = pkgs.fetchFromGitHub {
    owner = "hercules-ci";
    repo = "gitignore";
    # put the latest commit sha of gitignore Nix library here:
    rev = "7415c4feb127845553943a3856cbc5cb967ee5e0";
    # use what nix suggests in the mismatch message here:
    sha256 = "sha256:1zd1ylgkndbb5szji32ivfhwh04mr1sbgrnvbrqpmfb67g2g3r9i";
  };
  inherit (import gitignoreSrc { inherit (pkgs) lib; }) gitignoreSource;
  stdenv = pkgs.stdenv;
in with pkgs;
  # stdenv.mkDerivation {
  #   name = "myR";
  #   version = "1";
  #   src =  ./myr;
  #   installPhase =''
  #   cp -r R $out/
  #   '';
  # propagatedBuildInputs =
    with rPackages; [
      R
      ggplot2
      devtools
      tidyverse
      fastLink
      arrow
      dbplyr
      Xmisc
      RSQLite
      arrow-cpp
    ]
# ;
#   }
