# dotfiles
**Environment: ubuntu 20.04**

## NeoVim settings
### Install dependecies
- use neovim +0.6.1+

```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
apt install neovim ripgrep -y
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

