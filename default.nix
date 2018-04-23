# The main homies file, where homies are defined. See the README.md for
# instructions.
{ pkgs ? import <nixpkgs> {} }:
let
  customPkgs = import ./release.nix { pkgs = pkgs; };

  # The list of packages to be installed
  homies = (with customPkgs; [
      bashrc
      git
      tmux
      vim
    ]) ++ (with pkgs; [
      curl
      htop
      mosh
      nix
      sloccount
    ]);
in
  if pkgs.lib.inNixShell
  then pkgs.mkShell
    { buildInputs = homies;
      shellHook = ''
        $(bashrc)
        '';
    }
  else homies
