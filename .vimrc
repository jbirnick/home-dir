""" PLUGINS """"""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" UI
Plug 'doums/darcula'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'preservim/nerdtree'

" LaTeX
Plug 'lervag/vimtex'

call plug#end()

""" BASIC """"""""""""""""""""""""""""""""""""""""

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

""" COLORS """""""""""""""""""""""""""""""""""""""

" set colorscheme to darcula
colorscheme darcula
set termguicolors

""" LIGHTLINE """"""""""""""""""""""""""""""""""""

" lightline issue
set laststatus=2

" remove mode messages like '-- INSERT --' because lightline displays it
set noshowmode

" color scheme
let g:lightline = { 'colorscheme': 'darculaOriginal' }

" buffer line
set showtabline=2
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#unnamed      = '*unnamed*'
let g:lightline.tabline = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

""" KEYBOARD MAPPINGS """"""""""""""""""""""""""""

" general
noremap ; l
noremap l h
map <space> <leader>
let maplocalleader = ","
