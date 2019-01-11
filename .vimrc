set nocompatible

" VIM PLUG:
if empty(glob("~/.vim/autoload/plug.vim"))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

call plug#begin("~/.vim/plugged")

" AUTOINSTALL:
if !empty(filter(copy(g:plugs), '!isDirectory(v:val.dir)'))
	autocmd VimEnter * PlugInstall | q
endif

" PLUGINS:
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'isRuslan/vim-es6'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'ap/vim-css-color'
Plug 'jacoborus/tender.vim'
Plug 'itchyny/lightline.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'cakebaker/scss-syntax.vim'

call plug#end()

" KEYS MAP:
let mapleader=","
autocmd FileType python nnoremap <buffer> <C-c> :exec '!clear;python3' shellescape(@%, 1)<cr>
let g:UltiSnipsExpandTrigger="<C-l>"

" AUTOCLOSE BRACKETS:
 inoremap {<CR> {<CR>}<ESC>O
 inoremap (<CR> (<CR>)<ESC>O
 inoremap {<Space> {<Space>}<ESC>i

" FILETYPES:
filetype plugin on
filetype indent on

" SYNTAX:
syntax enable
set t_CO=256
set background=dark
colorscheme tender
set laststatus=2

" NUM LINE:
set nu

" ENCODING:
set encoding=UTF-8

" BACKUP:
set nobackup
set nowb
set noswapfile

" FILE BROWSING:
set path+=$PWD/**
" set autochdir

" FIND:
set wildmenu
" set wildmode=longest:list,full
set wildignorecase
set wildmode=full

" INDENTATION:
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai             " autoindent
set si             " smart indent
autocmd FileType python setlocal ts=4 sw=4 expandtab

" WRAP:
set wrap

" Linter:
let g:ale_fixers = {}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint'],
      \ 'jsx': ['eslint'],
      \ 'vue': ['eslint'],
      \ }
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'jsx': ['eslint'],
      \ 'vue': ['eslint'],
      \ }
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" VUE:
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue
autocmd FileType vue syntax sync fromstart

" EMMET:
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
