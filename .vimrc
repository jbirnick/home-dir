" vim-plug

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'

Plug 'doums/darcula'

call plug#end()

" cursor

set mouse=a
set cursorline
set scrolloff=3

" indentation

set shiftwidth=2
set autoindent
set smartindent

" tabs

set tabstop=4
set expandtab
set smarttab

" lightline issue

set laststatus=2

" remove mode messages like '-- INSERT --' because lightline displays it

set noshowmode

" set colorscheme to darcula

colorscheme darcula
set termguicolors

" set lightline color scheme

let g:lightline = { 'colorscheme': 'darculaOriginal' }

" remappings

noremap ; l
noremap l h
