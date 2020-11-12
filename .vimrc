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
"let &t_ti.="\e[5 q" "カーソルの形状を変更
set cursorline "現在のカーソル行を強調

"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする "===== マウス設定 =====
set mouse=a
set ttymouse=xterm2

set notitle

"カラースキーマの適用
"background color
autocmd ColorScheme * highlight Normal ctermbg=234
colorscheme molokai



set t_Co=256

set clipboard+=unnamed
set encoding=utf-8

" undo 永続化
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

set undolevels=1000

" ctagsの設定
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set tags=./tags;
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags


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
nnoremap <Leader>. :e ~/dotfiles/.vimrc<CR>
nnoremap <Leader>/ :e ~/dotfiles/.vim/rc<CR>
map <C-e> :NERDTreeToggle<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap <C-j> }
nnoremap <C-k> {
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"golang
au FileType go nmap <silent> <leader>r <Plug>(go-run)
au FileType go nmap <silent> <leader>f  :GoReferrers<CR>
au FileType go nmap <silent> <leader>ie :GoIfErr<CR>
au FileType go nmap <silent> <leader>at :GoAddTags<CR>

"python
au FileType python nmap <buffer> <leader>r :!python %<CR>
autocmd FileType python nnoremap <buffer> <c-f> :0,$!yapf<Cr>

"vim-lsp
augroup PylsCommands
    autocmd!
		autocmd FileType python setlocal omnifunc=lsp#complete  " オムニ補完を有効化
    autocmd FileType python nnoremap <buffer> gd :<C-u>LspDefinition<CR>
    autocmd FileType python nnoremap K :<C-u>LspHover<CR>
    autocmd FileType python nnoremap <LocalLeader>R :<C-u>LspRename<CR>
    autocmd FileType python nnoremap <LocalLeader>n :<C-u>LspReferences<CR>
augroup END
"C++
au FileType cpp nmap <buffer> <leader>r :!g++ % -o %<.exe && ./%<.exe<CR>

"markdown plugin setting
autocmd BufRead,BufNewFile *.md set filetype=markdown
nnoremap <silent> <leader>o :<C-u>PrevimOpen<CR>
nnoremap <silent> <leader>r :call previm#refresh()<CR>

" vimgrep
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ
autocmd QuickFixCmdPost *grep* cwindow

augroup MyAutoCmd
    "保存時に行末スペースを取り除く
    autocmd BufWritePre * %s/\s\+$//e
    "ファイル指定無しでvimを開いたらNerdTreeを開く
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END

" IMF OFF on Mac
"if has('mac')
"  set ttimeoutlen=1
"  let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
"  augroup MyIMEGroup
"    autocmd!
"    autocmd InsertLeave * :call system(g:imeoff)
"  augroup END
"  noremap <silent> <ESC> <ESC>:call system(g:imeoff)<CR>
"endif

"vim-tex
let g:tex_flavor = 'tex'

