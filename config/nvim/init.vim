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
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-sort-motion'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'digitaltoad/vim-pug'
Plugin 'elzr/vim-json'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mattn/emmet-vim'
Plugin 'python/black'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'yggdroot/indentline'

call vundle#end()
filetype plugin indent on

" appearance
" colorscheme
syntax enable
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


" gutter settings - show line and relative line numbers
set number
set relativenumber

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
set listchars=tab:»·,trail:·

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
set backupdir=~/.config/nvim/tmp,~/.tmp,/var/tmp,/tmp
set directory=~/.config/nvim/tmp,~/.tmp,/var/tmp,/tmp
" redefine word boundaries - '_' is a word seperator
set iskeyword-=_

" make backspace work like sane editors
set backspace=2

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

" python, ruby, etc.
let g:python_host_prog = "~/.pyenv/versions/neovim-python2/bin/python"
let g:python3_host_prog = "~/.pyenv/versions/neovim-python3/bin/python"
let g:ycm_python_binary_path = "~/.pyenv/versions/neovim/bin/python"
