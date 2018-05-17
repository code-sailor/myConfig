"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Directorys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim') == 0
    :silent !mkdir ~/.vim
endif

if isdirectory($HOME . '/.vim/backup') == 0
    :silent !mkdir ~/.vim/backup
endif
set backupdir=~/.vim/backup//

if isdirectory($HOME . '/.vim/swap') == 0
    :silent !mkdir ~/.vim/swap
endif
set directory=~/.vim/swap//

if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir ~/.vim/undo
endif
set undodir=~/.vim/undo//

if isdirectory($HOME . '/.vim') == 0
    :silent !mkdir ~/.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable vi-compatibility
set nocompatible

" Set how many lines of history VIM has to remember
set history=999

" Automatically update a file if it is changed externally
set autoread

" Height of the command bar
set cmdheight=2

" Visual autocomplete for command menu
set wildmenu

" show insert/replace/visual mode
set showmode

" Always display the status line, even if only one window is displayed
set laststatus=2

" confirm :q in case of unsaved changes
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell
" And reset the terminal code for the visual bell. => Do Nothing
set t_vb=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldmethod=syntax

" LaTeX syntax folding on
let g:tex_fold_enabled=1

" XML syntax folding on:
let g:xml_syntax_folding = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8

" file type specific settings
" enable file type detection
filetype on
" load the plugins for specific file types
filetype plugin on
" automatically indent code
filetype indent on
set autoindent

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fill tabs with spaces
set expandtab

" no extra space after '.' when joining lines
set nojoinspaces

" set indentation depth to 4 columns
set shiftwidth=4

" backspazing over 4 spaces like over tabs
set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight search matches
set hlsearch

" search while characters are entered
set incsearch

" search is case-insensitive by default
set ignorecase
" exept when using capital letters
set smartcase

" Show linenumbers
set number

" center view on the search result
noremap n nzz
noremap N Nzz

"""""""""""""""""""""""""""""""""""""""""""""
" Visual settings
"""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on

" Dark Background
set background=dark

" No line wraps
set nowrap

" highlight current acitve line
set cursorline
" Color this line
highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Show matching braces
set showmatch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tools
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" press F1 to fix indentation in whole file; overwrites marker 'q' position
noremap <F1> mqggVG=`qzz
inoremap <F1> <Esc>mqggVG=`qzza

" press F3 to sort selection or paragraph
vnoremap <F3> :sort i<CR>
nnoremap <F3> Vip:sort i<CR>

" Toggle Error-Window
map <F4> :cw

map <F5> :make run<CR>
map <F6> :make all<CR>
map <F7> :make debug<CR>
map <F8> :make test<CR>

" redraw screen, also turn off search highlighting until the next search
noremap <FF9> :nohl<CR><C-L>

" press F10 to turn the search results highlight off
noremap <F10> :nohl<CR>
inoremap <F10> <Esc>:nohl<CR>a

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" press F12 to toggle showing the non-printable charactes
noremap <F12> :set list!<CR>
inoremap <F12> <Esc>:set list!<CR>a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('autocmd')
    " delete empty or whitespaces-only lines at the end of file
    autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

    " replace groups of empty or whitespaces-only lines
    " with one empty line
    autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

    " delete any trailing whitespaces
    autocmd BufWritePre * :%s/\s\+$//ge
endif
