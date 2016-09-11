" vundle plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-sort-motion'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'digitaltoad/vim-pug'
Plugin 'elzr/vim-json'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kabbamine/zeavim.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'yggdroot/indentline'

call vundle#end()
filetype plugin indent on

" appearance
" colorscheme
syntax enable
colorscheme solarized

" ToggleBG function
fu! ToggleBG()
  let &background = (&background == "dark"?"light" : "dark")

  if &background == "dark"
    hi CursorLineNr ctermbg=0
  elseif &background == "light"
    hi CursorLineNr ctermbg=7
  endif

  hi SpecialKey ctermbg=NONE
  hi SpellBad cterm=undercurl
  hi clear SpellCap
endfu

" call it once to set background and highlights
call ToggleBG()

" gutter settings
set number
set relativenumber

" highlighting stuff
set hlsearch

" NERDTree ignore:
" Python cache, package markers
let NERDTreeIgnore=['__pycache__', '__init__.py']

" split settings
set splitbelow
set splitright

" whitespace
set list
set listchars=tab:»·,trail:·

" other options
" make backspace work like sane editors
set backspace=2

" indentations settings
set ts=2 sw=2 sts=2 et
" indentation autocmds for some filetypes
autocmd FileType python setlocal ts=4 sw=4 sts=4 et
autocmd FileType python let b:syntastic_python_python_exec = syntastic#util#parseShebang()['exe']
autocmd FileType html,json setlocal ts=2 sw=2 sts=0 noet

" autoremove whitespace on BufWrite
autocmd BufWritePre * %s/\s\+$//e

" keyboard shortcuts
" paste toggling
set pastetoggle=<F2>

" spell toggling
map <F3> :set spell! spelllang=en_us<CR>

" ToggleBG
map <F4> :call ToggleBG()<CR>

" run current buffer in Vimux Pane
map <F5> :w<CR>:call VimuxInterruptRunner()<CR>:call VimuxRunCommand("clear; " . expand("%:p"))<CR>

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
