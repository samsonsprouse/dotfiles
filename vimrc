" fresh: twe4ked/dotfiles vim/vundle_before.vim

let run_bundle_install = 0

if !isdirectory(expand("~/.vim/bundle/vundle/"))
  silent !echo "Installing Vundle..."
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let run_bundle_install = 1
endif

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"

" fresh: config/vim/vundle.vim

" Bundles
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-dispatch'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'terryma/vim-multiple-cursors'

" Look and feel
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'croaker/mustang-vim'
Bundle 'nanotech/jellybeans.vim'

" Ruby
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'thoughtbot/vim-rspec'
Bundle 'gabebw/vim-spec-runner'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'AndrewRadev/splitjoin.vim'

" git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" autocomplete
Bundle 'Valloric/YouCompleteMe'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

" Tool integration
Bundle 'edkolev/tmuxline.vim'
Bundle 'edkolev/promptline.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'alvan/vim-closetag'
Bundle 'christoomey/vim-tmux-runner'
Bundle 'junegunn/fzf'

Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'

Bundle 'vim-scripts/AnsiEsc.vim'

Bundle 'tpope/vim-vinegar.git'

" fresh: twe4ked/dotfiles vim/vundle_after.vim

if run_bundle_install == 1
  :BundleInstall

  silent !echo ""
  silent !echo "Vim is now ready."
  :cq
endif

" fresh: config/vim/global.vim

" don't need to be compliant with vi
set nocompatible

filetype off
filetype plugin indent on


" set <leader>
let mapleader=" "

" ctrlP config
let g:ctrlp_map = "<c-p>"
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>e :CtrlPMRU<CR>
nnoremap <leader>f :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$|log\|tmp$\|node_modules$\|app\/assets\/webpack$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

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
set colorcolumn=80
set relativenumber
set number
set lazyredraw

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

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
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_max_files = 0


" :colorscheme mustang
set background=dark

set backupdir=~/.vim/.backup//
set directory=~/.vim/.swap//
set undodir=~/.vim/.undo//

if has('gui_running')
  set guifont=Source\ Code\ Pro\ for\ Powerline 
  " let g:rspec_runner = "os_x_iterm2"
  map <Leader>rs :Dispatch rspec %<CR>
  " map <Leader>rn :call RunNearestSpec()<CR>
  " map <Leader>rl :call RunLastSpec()<CR>
  " map <Leader>ra :call RunAllSpecs()<CR>
else
  " RSpec.vim commands
  map <Leader>rf :call RunCurrentSpecFile()<CR>
  map <Leader>rs :call RunNearestSpec()<CR>
  map <Leader>rl :call RunLastSpec()<CR>
  map <Leader>ra :call RunAllSpecs()<CR>
  
  let g:rspec_runner = "os_x_iterm2"
  let g:rspec_command = "compiler rspec | Make --format progress {spec}"
  " let g:rspec_command = "compiler rspec | set makeprg=bin/spring | Make rspec --format progress {spec}"
  " let g:rspec_command = "VtrSendCommandToRunner! bin/spring rspec {spec}"
  " let g:rspec_command = "Dispatch rspec {spec}"
  let g:dispatch_quickfix_height = 20
endif

" Fix issue where vim-autoclose combined youcompleteme cause escape to only
" exit autocomplete dialog and not go back to command mode
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}


let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb"

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

  map <Leader>rz :Dispatch rspec %<CR>
let g:VtrClearBeforeSend = 0

nnoremap <leader>rr :VtrSendCommandToRunner! restart_rails<cr>:VtrKillRunner<cr>

function! s:select_handler(line)
  let tokens = split(a:line, '  ')
  put =tokens[0].' '
  normal kJ^$
endfunction

nnoremap <silent> <Leader>j :call fzf#run({
\   'source': "! ~/Development/Jira/jiras.rb",
\   'sink':    function('<sid>select_handler'),
\   'down':    '30%',
\   'options': '--ansi'
\ })<CR>


:nmap <leader>p o<ESC>p==
