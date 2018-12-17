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
Plug 'prettier/vim-prettier', {'do': 'yarn install'}
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'ap/vim-css-color'

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
set nu

" ENCODING:
set encoding=UTF-8

" BACKUP:
set nobackup
set nowb
set noswapfile

" FILE BROWSING:
set path+=$PWD/**
set autochdir

" FIND:
set wildmenu
set wildmode=longest:list,full

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

" PRETTIER: 
let g:prettier#exec_cmd_path = "~/.npm-global/bin/prettier"
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

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
