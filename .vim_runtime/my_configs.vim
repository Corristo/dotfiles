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
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <C-n> :tabn<CR>
nnoremap <C-p> :tabp<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufEnter *.m compiler mlint

set background=dark
colorscheme solarized

function! NERDTreeOpenInCurDir()
    exec "silent! lcd %:p:h"
    if &filetype == 'mail'
    else
        let curDir = getcwd()
        exec ":NERDTree ".fnameescape(curDir)
        unlet curDir
    endif
endfunction


function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    exec ":NERDTreeToggle"
 endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

autocmd BufWinEnter * :call NERDTreeOpenInCurDir()
let g:NERDTreeWinSize = 20
function! CheckLeftBuffers()
    if tabpagenr('$') == 1
        let i = 1
        while i <= winnr('$')
            if getbufvar(winbufnr(i), '&buftype') == 'help' ||
                        \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
                        \ exists('t:NERDTreeBufName') &&
                        \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
                        \ bufname(winbufnr(i)) == '__Tag_List__'
                let i += 1
            else
                break
            endif
        endwhile
        if i == winnr('$') + 1
            qall
        endif
        unlet i
    endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

let NERDTreeIgnore=['\.o$', '\.pdf$', '\.wmv$', '\.mp4$', '\.jpg$', '\.png$', '\~$', '\.gz$', '\.bz$', '\.mat$', '\.zip$', '\.rar$', '\.avi$', '\.JPG', '\.djvu$', '\.epub$', '\.mobi$', '\.exe$', '\.doc$', '\.odt$', '\.docx$']

map <F7> :w !xclip <CR><CR>
vmap <F7> "*y
map <S-F7> :r!xclip -o <CR>
