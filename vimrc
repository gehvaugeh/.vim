" Syntax Highlight and file recognition by endings
filetype on
syntax on

" Dunno what's this, have to look up
set hidden

" Undo history 100 steps
set history=100

" Indentations, 2 Spaces no Tab
filetype indent on

" No line wrapping
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
"  New Empty buffer in new Tab
nnoremap <C-n> :tabedit <CR>
"  Open File from current dir in new Tab
nnoremap <C-o> :tabedit ./ <CR>
"  Delete Buffer in current window (and so close window)
noremap <F4>w :bd <CR>
"  Delete all Buffers in all windows in current tab (and close tab)
nnoremap <F4>t :windo bd <CR>
"  Tab / Shift Tab for tab navigation
nnoremap <Tab> :tabn <CR>
nnoremap <S-Tab> :tabp <CR>

" Custom commands
command Fw :w ! sudo tee > /dev/null % <CR>

" Some configurations for the netrw file exlorer
let g:netrw_liststyle=3
let g:netrw_banner=0

" Change behavior of autocomplete
" to just insert longest common text
" and open if only one entry is give
set completeopt=longest,menuone

" My Custom Statusline, first change Color
hi StatusLine cterm=standout ctermbg=0 ctermfg=11

set noshowmode    " Disable the bar that shows the mode
set noruler       " Disable ruler
set laststatus=2  " Always show Statusline

" Create custom highlight for statusbar and tab highlight
hi link ModeHighlight DiffText

" Update ModeHighlight
function! s:updateModeHighlight(mode)
  if a:mode == "i"
    hi! link ModeHighlight DiffChange
  elseif a:mode == "r"
    hi! link ModeHighlight DiffDelete
  elseif a:mode == "n"
    hi! link ModeHighlight DiffText
  endif
endfunction

" Statusline function
function! s:createStatusLine()
  " Clear Statusline
  set statusline=

  " Color Filename depending on Mode
  set statusline+=\ %#ModeHighlight#

  " File Information
  set statusline+=%f                                          " relative path & filename
  set statusline+=%#StatusLine#                               " Normal color
  set statusline+=\ [
  set statusline+=%Y                                          " filetype
  set statusline+=\ %{&fileencoding?&fileencoding:&encoding}  " file ecoding
  set statusline+=]
  set statusline+=%m

  set statusline+=%=                                          " Change to right Site
  
  " Line information
  set statusline+=\ %#ModeHighlight#
  set statusline+=%3p%%
  set statusline+=\ %3l:%-3L                                     " current Line / total amount of Lines in Buffer
endfunction

" Autocommand group for Modechange
augroup statusline
  " Remove all autocommands in this group
  au! 
  au InsertEnter * call s:updateModeHighlight(v:insertmode) | call s:createStatusLine()
  au InsertLeave * call s:updateModeHighlight(mode()) | call s:createStatusLine()
  au WinEnter,BufWinEnter * call s:createStatusLine()
augroup END

call s:createStatusLine()

" Custom Tabline Colors
hi clear TabLineFill
hi! link TabLineFill StatusLine

hi clear TabLineSel
hi! link TabLineSel StatusLine
hi TabLineSel cTerm=reverse

hi clear TabLine
hi! link TabLine conceal
