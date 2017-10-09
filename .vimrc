set nocompatible "required for vundle
filetype off "required for vundle

"set runtimepath to include fzf
set rtp+=/usr/local/opt/fzf
"set runtimepath to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Vundle should manage itself
Plugin 'VundleVim/Vundle.vim'
"useful startscreen
Plugin 'mhinz/vim-startify'
"autocompletion for brackets and stuff
Plugin 'Raimondi/delimitMate'
"tab completion
Plugin 'ervandew/supertab'
"Autocompletion for Python
Plugin 'davidhalter/jedi-vim'
"Better syntax for js
Plugin 'jelera/vim-javascript-syntax'
"Snippets for faster coding
Plugin 'garbas/vim-snipmate'
"snippets for VimSnipmate
Plugin 'honza/vim-snippets'
"SnipMate dependency
Plugin 'MarcWeber/vim-addon-mw-utils'
"SnipMate dependency
Plugin 'tomtom/tlib_vim'
"Airline bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Highlight unwanted whitespace
Plugin 'ntpeters/vim-better-whitespace'
"Add smooth scrolling for easier navigation
Plugin 'yonchu/accelerated-smooth-scroll'
"easily create tables (in markdown)
Plugin 'dhruvasagar/vim-table-mode'
let g:table_mode_corner="|"
"Colorschemes
Plugin 'morhetz/gruvbox'
call vundle#end() "vundle required

filetype plugin indent on
syntax enable

"make themes work
set background=dark
set t_Co=256
colorscheme gruvbox

"airline unicode
let g:airline_theme='wombat'
let g:airline_symbols = {}
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Paste'
let g:airline_symbols.whitespace = 'Ξ'
" show buffers in top bar
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

"blue unwanted whitespace highlighting
highlight ExtraWhitespace ctermbg=blue guibg=#808080

"show $ sign on change selection for visual help
set cpoptions+=$

"python interactive mode :)
nmap <F8> :!python3 % <CR>

"unmap arrowkeys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

"map leader to comma
let mapleader=","

"linenumbers
set number

"map space to :
noremap <space> :

"buffer navigation
set hidden "suppresses warning when switching unsaved buffers
map <C-l> :bn<CR>
map <C-h> :bp<CR>

"map jj to escape in insertmode
inoremap jj <esc>

"search before pressing enter
set incsearch
"highlight matches
"set hlsearch

"search recursively into subfolders for easy navigation
set path+=**

"netrw as file explorer config
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=12
noremap <C-e> :Lexplore<CR>

"show keypresses
set showcmd

"share clipboard with system
set clipboard=unnamed

"Markdown2HTML
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>

"MacVim GUI Mode configuration
if has("gui_macvim")
    set guifont=InputMonoCompressed:h13
    "automatically resize splits when resizing window
    autocmd VimResized * wincmd =
    "don't show scrollbars
    set guioptions-=r
    set guioptions-=l
endif

"highlight current working line
set cursorline

"always use status bar
set laststatus=2
"use 4 spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4

"markdown specific config
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd Filetype markdown inoremap <S-cr> <space><space><cr>
"dont screw with markup files
let blacklist = ['markdown']
"display indentation guides
set list listchars=tab:⟩\ ,trail:·,extends:»,precedes:«,nbsp:×
"convert spaces to tabs when reading file
autocmd! bufreadpost * if &modifiable && index(blacklist, &ft) < 0 | set noexpandtab | retab! 4
"convert tabs to spaces before writing file
autocmd! bufwritepre * if index(blacklist, &ft) < 0 | set expandtab | retab! 4
"convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * if index(blacklist, &ft) < 0 | set noexpandtab | retab! 4
