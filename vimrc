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
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rdnetto/ycm-Generator'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

" NERDTree {{{
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" powerline
set rtp+=~/.local/lib/python3.5/site-packages/powerline/bindings/vim
set laststatus=2

" 2x spaces as tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" colorscheme stuff
syntax enable
set background=dark
colorscheme solarized

" highlighting stuff
" spelling
hi SpellBad cterm=underline,bold ctermfg=red
hi clear SpellCap
" search
set hlsearch
set relativenumber
" whitespace
hi ExtraWhitespace ctermbg=gray
match ExtraWhitespace /\s\+$/
" indent
let g:indent_guides_enable_on_vim_startup=1
hi IndentGuidesOdd ctermbg=0
hi IndentGuidesEven ctermbg=8

" keyboard shortcuts
" paste toggling
set pastetoggle=<F2>
" spell toggling
map <F5> :setlocal spell! spelllang=en_us<CR>
" NERDTree
map <C-N> :NERDTreeToggle<CR>
" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
