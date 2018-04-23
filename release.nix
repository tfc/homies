{ p }:
let
  homies = (import ./default.nix { pkgs = p; });
in {
  vim = homies.vim;
  tmux = homies.tmux;
}
