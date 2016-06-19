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
nnoremap <tab> %
vnoremap <tab> %
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType cpp nnoremap K :YcmCompleter GetDocQuick<CR>
au FileType cpp nnoremap gi :YcmCompleter GoToInclude<CR>
au FileType cpp nnoremap T :YcmCompleter GetType<CR>
au FileType cpp nnoremap <leader>k <C-w>o
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <C-n> :tabn<CR>
nnoremap <C-p> :tabp<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers=['']
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufEnter *.m compiler mlint

set background=dark
colorscheme solarized

function! s:goyo_enter()
    set noshowmode
    set noshowcmd
 endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

let NERDTreeIgnore=['\.o$', '\.pdf$', '\.wmv$', '\.mp4$', '\.jpg$', '\.png$', '\~$', '\.gz$', '\.bz$', '\.mat$', '\.zip$', '\.rar$', '\.avi$', '\.JPG', '\.djvu$', '\.epub$', '\.mobi$', '\.exe$', '\.doc$', '\.odt$', '\.docx$']

map <F7> :w !xclip <CR><CR>
vmap <F7> "*y
map <S-F7> :r!xclip -o <CR>
let g:ycm_global_ycm_extra_conf = "~/.vim_runtime/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_use_ultisnips_completer = 0
set exrc
set secure

