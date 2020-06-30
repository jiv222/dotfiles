set nocompatible

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
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'dracula/vim'
    Plug 'preservim/nerdtree'
    Plug 'ap/vim-css-color'
    Plug 'lervag/vimtex'
    Plug 'sirver/ultisnips'
    Plug 'KeitaNakamura/tex-conceal.vim'
call plug#end()

"----------------------------------------------
" GUI
"----------------------------------------------
syntax on
filetype on
"set background=dark
set t_Co=256
set hidden
set noshowmode
set noshowcmd
set backspace=indent,eol,start

"----------------------------------------------
" Font
"----------------------------------------------
set encoding=utf-8
set guifont=
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

"----------------------------------------------
" Backups
"----------------------------------------------
set nobackup
set noswapfile
set nowritebackup

"----------------------------------------------
" Airline
"----------------------------------------------
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline_powerline_fonts=1

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

" Add mouse support to alacritty
set ttymouse=sgr
