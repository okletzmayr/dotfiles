" neovim
language en_US
set termguicolors

" vundle plugins
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#rc(expand("~/.config/nvim/bundle"))
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-sort-motion'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'digitaltoad/vim-pug'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elzr/vim-json'
Plugin 'iCyMind/NeoSolarized'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mattn/emmet-vim'
Plugin 'preservim/nerdtree'
Plugin 'python/black'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'yggdroot/indentline'

call vundle#end()
filetype plugin indent on

" appearance
colorscheme NeoSolarized

" scroll offsets
set scrolloff=1
set sidescrolloff=5

" wrapping
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set nowrap

" gutter settings - show line and relative line numbers
set number
set relativenumber

" scrolling offsets
set scrolloff=5
set sidescrolloff=5

" highlighting stuff
set hlsearch
hi NonText cterm=NONE ctermfg=NONE

" NERDTree ignore:
let NERDTreeIgnore=[]
" Python cache, package markers
let NERDTreeIgnore+=['__pycache__', '__init__.py']
" Git folder
let NERDTreeIgnore+=['.git']

" split settings
set splitbelow
set splitright

" whitespace
set list
set listchars=tab:»·,trail:·,extends:>,precedes:<,nbsp:+
set nowrap

" other options
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" always show the statusline - the one on the bottom
set laststatus=2
" always show the tabline
set showtabline=2
" never show the NORMAL, INSERT, etc. in the command line,
" as it's shown via Airline
set noshowmode
" backup and swapfile directories
set backupdir=~/.config/nvim/tmp
set directory=~/.config/nvim/tmp
" redefine word boundaries - '_' is a word seperator
set iskeyword-=_

" enable mouse scrolling in normal mode
set mouse=n

" make backspace work like sane editors
set backspace=indent,eol,start

" indentations settings
set ts=2 sw=2 sts=2 et
" indentation autocmds for some filetypes
autocmd FileType python setlocal ts=4 sw=4 sts=4 et
autocmd FileType html,json setlocal ts=2 sw=2 sts=0 et

" autoremove whitespace on BufWrite
autocmd BufWritePre * %s/\s\+$//e

" keyboard shortcuts
" paste toggling
set pastetoggle=<F2>

" spell toggling
map <F3> :set spell! spelllang=en,de<CR>

" NERDTree
map <C-N> :NERDTreeTabsToggle<CR>

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" unsets the "last search" register by hitting return - stackoverflow.com/a/662914
nnoremap <silent> <CR> :nohlsearch<CR><CR>

