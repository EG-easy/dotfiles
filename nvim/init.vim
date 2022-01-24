"===normal===
set number
set showmatch
set cursorline
syntax enable
set t_Co=256

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
let s:colorschemename =  'molokai'
let s:colorschemeURL =  'https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim'
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

"===lsp settings===
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
  augroup END


"===key bindings=== 
let mapleader = "\<Space>"
nnoremap <Leader>. :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>/ :e ~/.config/nvim/rc<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
" markdown plugin
nnoremap <silent> <leader>o :MarkdownPreview<CR>
" jsDoc plugin
nnoremap <silent> <leader>j :JsDoc<CR>
