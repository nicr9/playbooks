call plug#begin(stdpath('data') . '/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'pelodelfuego/vim-swoop'
"Plug 'inkarkat/vim-mark'

call plug#end()

" Terminal mode mappings
tnoremap <Esc> <C-\><C-n>

" Centre view on next/previus search result
nmap n nzz
nmap N Nzz

" Move between splits with CTRL+[hjkl]
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Syntax HL and indentation
syntax on
filetype plugin indent on
set et bs=2 ts=4 sts=4 sw=4
set bg=dark

" Indentation overrides
autocmd FileType yaml,yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Configure ctrlpvim/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp

" Configure scrooloose/nerdtree
let NERDTreeIgnore = ['\.pyc$', '\.retry$']
nmap <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Configure fatih/vim-go
"let g:go_version_warning = 0 " Remove after updating nvim

" Configure tpope/vim-fugitive
command! Gadd exec "Git add -p"
command! -nargs=* Ggraph exec "vs term://git graph " . <q-args>
command! -nargs=? Gpush exec join(["Git push", len(<q-args>)==0?"origin":<q-args>, system("git rev-parse --abbrev-ref HEAD")], " ")[0:-2]
command! Gdiscard exec "Git checkout -p"
command! Gamend exec "Gcommit --amend"
command! Gpatch exec "Git diff --no-prefix"

" Configure vim-airline/vim-airline
let g:airline_powerline_fonts = 0
set laststatus=2

" Make
command! -nargs=* Make :vs term://make <args>
