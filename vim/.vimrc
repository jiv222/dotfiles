" ---------------------------------------------
" Install vim-plug
" ---------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ---------------------------------------------
" Plugins
" ---------------------------------------------
call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'ap/vim-css-color'
    Plug 'lervag/vimtex'
    Plug 'sirver/ultisnips'
    Plug 'KeitaNakamura/tex-conceal.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'idbrii/AsyncCommand'
    Plug 'mnick/vim-pomodoro'
call plug#end()

"----------------------------------------------
" GUI
"----------------------------------------------
syntax on
filetype on
set t_Co=256
set hidden
set noshowmode
set backspace=indent,eol,start

"----------------------------------------------
" Font
"----------------------------------------------
set encoding=utf-8
set nolazyredraw
set smartcase
set ignorecase

"----------------------------------------------
" Misc
"----------------------------------------------
set number relativenumber
set ruler
set mouse=a
set wrap
set hlsearch
set incsearch
set laststatus=2

"----------------------------------------------
" Tabs
"----------------------------------------------
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set shiftround
set autoindent
filetype plugin indent on

"----------------------------------------------
" Backups
"----------------------------------------------
set nobackup
set noswapfile
set nowritebackup

"----------------------------------------------
" Paste Settings
"----------------------------------------------
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

"----------------------------------------------
" Vim-tex 
"----------------------------------------------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"----------------------------------------------
" Ultisnips
"----------------------------------------------
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"----------------------------------------------
" Tex-conceal
"----------------------------------------------
set conceallevel=1
let g:tex_conceal='abdmg'

" Lightline
let g:lightline = {
    \ 'colorscheme': 'evangelion',
    \ }

" Add mouse support to alacritty
set ttymouse=sgr
