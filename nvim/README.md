Installation
============

This is for neovim only.

Clone the repo:
`git clone https://github.com/lunks/vimfiles.git ~/.config/nvim`

Grab vim-plug:

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install fzf:

```sh
$ brew install fzf
```

Install plugins:

```sh
nvim +PlugInstall +qall
```
