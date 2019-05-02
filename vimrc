" Syntax Highlight and file recognition by endings
filetype on
syntax on

" Dunno what's this, have to look up
set hidden

" Undo history 100 steps
set history=100

" Indentations, 2 Spaces no Tab
filetype indent on
set nowrap

"set wrap
set tabstop=2
set shiftwidth=2
set expandtab

" Highlight searchresults and show matches
set hlsearch
set showmatch

" Intellgent case recognition on search
set ignorecase
set smartcase

" Inkremental search during typing
set incsearch

" Linenumbers
set number

" Custom Hotkeys
nnoremap <F6> :edit ./ <CR>
nnoremap <F7> :bprev <CR>
nnoremap <F8> :bnext <CR>
nnoremap <F9> :buffers <CR>:buffer <SPACE>
nnoremap <F10> :bdel <CR>

" Custom commands
cmap w!! :w ! sudo tee /dev/null/ %

" Some configurations for the netrw file exlorer
let g:netrw_liststyle=3
let g:netrw_banner=0
