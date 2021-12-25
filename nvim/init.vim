"===normal===
set number
set showmatch
set cursorline

"===indent=== 
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

"===search=== 
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch

"===color scheme=== 
let s:colorschemename =  'onehalfdark'
let s:colorschemeURL =  'https://raw.githubusercontent.com/sonph/onehalf/master/vim/colors/onehalfdark.vim'
let s:vimdir = $HOME . '/.config/nvim'
if ! filereadable(s:vimdir . '/colors/'.s:colorschemename.'.vim')
    if executable('curl') && confirm('Prepare '.s:colorschemename.' form github?', "Yes\nNo", 2) == 1
        echo 'Ok, now installing '.s:colorschemename
	call system('mkdir ' . s:vimdir . '/colors')
	call system('curl '.s:colorschemeURL.'  > ' . s:vimdir . '/colors/'.s:colorschemename.'.vim')
        execute 'colorscheme ' . s:colorschemename
    else
        echo s:colorschemename.' is not installed'
    endif
else
    execute 'colorscheme ' . s:colorschemename
endif

"===dein initialze=== 
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('~/.config/nvim/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

let s:toml_dir = expand('~/.config/nvim/rc')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"===key bindings=== 
let mapleader = "\<Space>"
nnoremap <Leader>. :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>/ :e ~/.config/nvim/rc<CR>
