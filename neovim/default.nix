{ vimUtils, fetchFromGitHub, neovim, vimPlugins }:

let
  emodeline = vimUtils.buildVimPluginFrom2Nix {
    pname = "emode";
    version = "0.1";
    src = fetchFromGitHub {
      owner = "vim-scripts";
      repo = "emodeline";
      rev = "19550795743876c2256021530209d83592f5924a";
      sha256 = "0x9y7rzbk6g8cq6jkn37wi95wzhq0abban6w10652v4kdmjrxrr0";
    };
  };

in neovim.override {
  configure = {
    customRC = builtins.readFile ./vimrc;
    packages.nixbundle = with vimPlugins; {
      start = [
        bufexplorer
        ctrlp
        emodeline
        fugitive
        haskell-vim
        neomake
        nerdtree
        surround
        vim-airline
        vim-nix
        vim-tmux-navigator
        vim-trailing-whitespace
      ];
      opt = [ ];
    };
  };
  vimAlias = true;
}
