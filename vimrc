" vundle plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-sort-motion'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'digitaltoad/vim-pug'
Plugin 'elzr/vim-json'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'yggdroot/indentline'

call vundle#end()
filetype plugin indent on

" powerline
set rtp+=~/.local/lib/python3.5/site-packages/powerline/bindings/vim
set laststatus=2
set showtabline=2
set noshowmode

" 2x spaces as tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" colorscheme stuff
syntax enable
let g:solarized_termtrans=1
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

" highlighting stuff
" spelling
hi SpellBad cterm=underline,bold ctermfg=red
hi clear SpellCap
" search
set hlsearch
set relativenumber
" whitespace
set list
set listchars=trail:·
autocmd BufWritePre * %s/\s\+$//e

" keyboard shortcuts
" paste toggling
set pastetoggle=<F2>
" spell toggling
map <F3> :setlocal spell! spelllang=en_us<CR>
" NERDTree
map <C-N> :NERDTreeTabsToggle<CR>
" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
