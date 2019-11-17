call plug#begin(stdpath('data') . '/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode'
Plug 'tpope/vim-fugitive'
Plug 'pelodelfuego/vim-swoop'
"Plug 'inkarkat/vim-mark'

call plug#end()

" Terminal mode mappings
tnoremap <Esc> <C-\><C-n>

" Syntax HL and indentation
syntax on
filetype plugin indent on
set et bs=2 ts=4 sts=4 sw=4
set bg=dark

" Indentation overrides
autocmd FileType yaml,yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Configure CtrlP
set runtimepath^=~/.vim/bundle/ctrlp

" Configure NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.retry$']
nmap <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Configure vim-go
let g:go_version_warning = 0 " Remove after updating nvim

" Make
command! -nargs=* Make :vs term://make <args>
