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

### Lsp Settings
```
:LspInstallServer
```

## Vim settings
**require**
- node(for coc.vim)

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install v14.18.1
```

### LSP Setting
install javascript/typescript language server with coc.
```
:CocInstall coc-tsserver
```

ref: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions

## How To Start

```sh
git clone https://github.com/EG-easy/dotfiles.git
cd dotfiles
make deploy
```

## Dein plugin update
```vim
:call dein#update()
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

