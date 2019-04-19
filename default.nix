# The main homies file, where homies are defined. See the README.md for
# instructions.
{
  nixpkgs ? <nixpkgs>,
  pkgs ? import nixpkgs {}
}:
let
  customPkgs = import ./release.nix { inherit pkgs; };

  # The list of packages to be installed
  homies = (with customPkgs; [
      tmux
      neovim
    ]) ++ (with pkgs; [
      curl
      git
      htop
      mosh
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
