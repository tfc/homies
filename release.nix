{
  nixpkgs ? <nixpkgs>,
  pkgs ? import nixpkgs {}
}:

{
  bashrc = pkgs.callPackage ./bashrc {};
  tmux = pkgs.callPackage ./tmux {};
  neovim = pkgs.callPackage ./neovim {};
}
