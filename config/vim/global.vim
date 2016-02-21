" don't need to be compliant with vi
set nocompatible

filetype off
filetype plugin indent on


" set <leader>
let mapleader=","

" set color
color mustang

" prevent security exploits
set modelines=0

" set tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set noerrorbells
" set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile

" fix vim's searching / regex handling
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault " global by default. use /g to revert to default
" highlight search results
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" show hidden characters (tabs, etc)
" set list
" set listchars=tab:▸\ ,eol:¬

" auto save
au FocusLost * :wa

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
" let g:airline#extensions#tabline#enabled       =  1
" let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
" let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_max_files = 0


if has('gui_running')
    set guifont=Menlo:h15
endif

" :colorscheme mustang
set background=dark

set backupdir=~/.vim/.backup//
set directory=~/.vim/.swap//
set undodir=~/.vim/.undo//
