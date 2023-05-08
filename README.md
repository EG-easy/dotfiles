# dotfiles
**Environment: ubuntu 22.04**

## NeoVim settings
### Install dependecies

Check Release Page: https://github.com/neovim/neovim/releases/tag/stable

- use neovim v0.9.0

```
sudo apt update
apt install build-essential python3-neovim ripgrep -y

wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
cp ./nvim-linux64/bin/nvim /usr/bin/nvim

nvim --version
```

### How To Start

```sh
git clone https://github.com/EG-easy/dotfiles.git
cd dotfiles
make deploy
source ~/.bashrc
```

### Lsp Settings
```vim
:LspInstallServer
```

```vim
:LspStatus
```

### Dein plugin update
```vim
:call dein#update()
```

delete cache
```vim
:call dein#recache_runtimepath()
```

### ALE Settings
```vim
:AleInfo
```

```vim
:ALEDetail
```

### Denite grep

`q`: quit

### jsdoc

```sh
cd ~/dotfiles/nvim/dein/repos/github.com/heavenshell/vim-jsdoc && make clear && make install
```

## Change Color Scheme
Set below values in `.vimrc` or `init.vim`

```vim
let s:colorschemename =  ''
let s:colorschemeURL =  ''
```

## troubleShooting

### MarkdownPreivew
```vim
:call mkdp#util#install()
```
ref: https://github.com/iamcco/markdown-preview.nvim/issues/43

