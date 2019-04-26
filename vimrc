filetype on
syntax on

set hidden
set history=100

filetype indent on
set nowrap
"set wrap
set tabstop=2
set shiftwidth=2
set expandtab

set hlsearch
set showmatch

set number

nnoremap <F6> :edit ./ <CR>
nnoremap <F7> :bprev <CR>
nnoremap <F8> :bnext <CR>
nnoremap <F9> :buffers <CR>:buffer <SPACE>
nnoremap <F10> :bdel <CR>

