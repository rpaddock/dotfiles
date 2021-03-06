set nocompatible
filetype off

" Vundle setup
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-dispatch'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'elzr/vim-json'
Plugin 'StanAngeloff/php.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
Plugin 'xolox/vim-misc'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'dracula/vim'
Plugin 'tomasiser/vim-code-dark'
call vundle#end()

filetype plugin indent on
set autoindent
set cursorline
set expandtab
set foldenable
set foldlevelstart=10
set foldmethod=indent
set foldnestmax=10
set hidden
set hlsearch
set ignorecase smartcase
set lazyredraw
set linebreak
set nomodeline
set noshowmode
set noswapfile
set omnifunc=syntaxcomplete#Complete
set shiftwidth=4
set showmatch matchtime=3
set smarttab
set softtabstop=4
set tabstop=4

let g:airline_theme = 'codedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'     " Show just the filename
let g:airline#extensions#tabline#tab_nr_type = 1     " Show buffer #, not # of splits
let g:airline#extensions#tabline#show_tab_nr = 1     " Show buffer # in tabline
let g:airline#extensions#tabline#show_tab_type = 1   " Show the tab type
let g:airline#extensions#tabline#buffer_idx_mode = 1 " Show buffer index

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

syntax on
set background=dark
colorscheme codedark

set termguicolors

nnoremap j gj
nnoremap k gk

inoremap jj <esc>

let mapleader=","
map ; :
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Close buffer without losing split
nnoremap <C-c> :bp\|bd #<CR>

" Ignore patterns in ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'
