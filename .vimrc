call pathogen#infect()
call pathogen#helptags()


" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

" Other stuff
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'airblade/vim-gitgutter'

set nocompatible
set encoding=utf-8

syntax on
filetype plugin indent on

" Colors
set t_Co=256
color molokai

set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set ruler
set showcmd
set autoindent
set showmatch
set viminfo+=!
set history=500
set laststatus=2
set number
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set clipboard=unnamed

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Auto-reload buffers when file changed on disk
set autoread

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=100

set backupdir=~/.vim/_temp
set directory=~/.vim/_temp

"" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" http://vimcasts.org/e/14
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

command! Q q " Bind :Q to :q
command! Qall qall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>r :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commant-T options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-p> :CommandT<CR>
nnoremap <silent> <C-b> :CommandTBuffer<CR>
let g:CommandTMatchWindowReverse=1
let g:CommandTMaxHeight=10
set wildignore+=.git,*.png,*.jpg,*.jpeg,*.log,tmp,*.rdf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>

"Removes the higlight
map <leader><space> :nohl<CR>

"Highlights unwanted spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Ack
nnoremap <leader>a :Ack

" snipMate
let g:snippets_dir="~/.vim/bundle/snipmate-snippets"
autocmd BufNewFile,BufRead *.erb set filetype=html.eruby

" No arrow keys
map <Left>  :echo "ಠ_ಠ"<cr>
map <Right> :echo "ಠ_ಠ"<cr>
map <Up>    :echo "ಠ_ಠ"<cr>
map <Down>  :echo "ಠ_ಠ"<cr>

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

