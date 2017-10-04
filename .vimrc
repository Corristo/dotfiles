set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/UltiSnips'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

let mapleader=','

" solarized
syntax enable
set background=dark
colorscheme solarized
let g:airline_theme='solarized'

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 " use symbols from patched font

" fswitch
nmap <leader>t :FSHere<cr>

" turn of backup, undo,..
set nobackup
set nowb
set noswapfile

" tab/indentation
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" easier buffer handling
nmap <leader>c :bd<cr>

" fast saving
nmap <leader>w :w!<cr>

set modelines=0
set number
set nocompatible
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set undofile
set clipboard=unnamed
inoremap jj <ESC>
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" cpp settings
au FileType cpp nnoremap K :YcmCompleter GetDocQuick<CR>
au FileType cpp nnoremap gi :YcmCompleter GoToInclude<CR>
au FileType cpp nnoremap T :YcmCompleter GetType<CR>
au FileType cpp nnoremap <leader>k <C-w>o


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline=%*

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_server_python_interpreter = '/usr/bin/python3'

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers=['']
