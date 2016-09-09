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
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'yggdroot/indentline'

call vundle#end()
filetype plugin indent on

" appearance
" colorscheme stuff
syntax enable
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" gutter settings
set number
set relativenumber

" highlighting stuff
fu! OwnHighlights()
  hi DiffAdd ctermbg=NONE
  hi DiffChange ctermbg=NONE
  hi DiffDelete ctermbg=NONE
  hi DiffText ctermbg=NONE
  hi FoldColumn ctermbg=NONE
  hi Folded ctermbg=NONE
  hi LineNr ctermbg=NONE
  hi SpecialKey ctermbg=NONE
  hi SpellBad cterm=undercurl
  hi clear SpellCap
endfu
call OwnHighlights()
set hlsearch

" powerline
set rtp+=~/.local/lib/python3.5/site-packages/powerline/bindings/vim
set laststatus=2
set noshowmode

" split settings
set splitbelow
set splitright

" whitespace
set list
set listchars=tab:»·,trail:·

" other options
" make backspace work like sane editors
set backspace=2
" change to the foldmethod used in this vimrc
set foldmethod=marker

" indentations settings
set ts=2 sw=2 sts=2 et
" indentation autocmds for some filetypes
autocmd FileType python setlocal ts=4 sw=4 sts=4 et
autocmd FileType html,json setlocal ts=2 sw=2 sts=0 noet

" autoremove whitespace on BufWrite
autocmd BufWritePre * %s/\s\+$//e

" keyboard shortcuts
" paste toggling
set pastetoggle=<F2>
" spell toggling
map <F3> :set spell! spelllang=en_us<CR>
" NERDTree
map <C-N> :NERDTreeTabsToggle<CR>
" ToggleBG
map <F4> :!~/.togglebg.sh<CR>:let &background = (&background == "dark"?"light" : "dark")<CR>:call OwnHighlights()<CR>
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

