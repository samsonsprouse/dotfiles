#load pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

#don't need to be compliant with vi
set nocompatible

#prevent security exploits
set modelines=0

#set tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
#set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

#fix vim's searching / regex handling
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault #global by default. use /g to revert to default
#highlight search results
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

#handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

#show hidden characters (tabs, etc)
set list
set listchars=tab:▸\ ,eol:¬

#auto save
au FocusLost * :wa


if has('gui_running')
    set guifont=Menlo:h15
endif
:colorscheme mustang
set background=dark