# dotfiles

**require**
- node(for coc.vim)

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm install v14.17.3
```

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
Set below values in `.vimrc`

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
