""""""""""""""""""""""""""""""
" vim基本設定 """"""""""""""""""""""""""""""
"===== 表示設定 =====
set number "行番号の表示
set title "編集中ファイル名の表示
set showmatch "括弧入力時に対応する括弧を示す
" set list "タブ、空白、改行を可視化
set visualbell "ビープ音を視覚表示
set laststatus=2 "ステータスを表示
set ruler "カーソル位置を表示

"===== 文字、カーソル設定 =====
set fenc=utf-8 "文字コードを指定
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
set autoindent "自動インデント
set smartindent "オートインデント
set tabstop=2 "インデントをスペース2つ分に設定
set shiftwidth=2 "自動的に入力されたインデントの空白を2つ分に設定
set whichwrap=b,s,h,l,<,>,[,],~ "行頭、行末で行のカーソル移動を可能にする
set backspace=indent,eol,start "バックスペースでの行移動を可能にする
let &t_ti.="\e[5 q" "カーソルの形状を変更
set cursorline "現在のカーソル行を強調

"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする "===== マウス設定 =====
set mouse=a
set ttymouse=xterm2

"カラースキーマの適用
colorscheme molokai
set t_Co=256

set clipboard+=unnamed
set encoding=utf-8

" 自動的に閉じ括弧を入力
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" undo 永続化
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

set undolevels=1000


""""""""""""""""""""""""""""""
" dein本体の設定
""""""""""""""""""""""""""""""
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

"dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.vim/dein')

"dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

"dein.toml, dein_layz.tomlファイルのディレクトリをセット
let s:toml_dir = expand('~/.vim/rc')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

 "起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

 "遅延読み込みしたいプラグイン群
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

"End dein Scripts-------------------------

""""""""""""""""""""""""""""""
" key bindings
""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
nnoremap <Leader>. :e ~/.vimrc<CR>
map <C-e> :NERDTreeToggle<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap <C-j> }
nnoremap <C-k> {

