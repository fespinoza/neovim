set nocompatible            " Must come first because it changes other options.
filetype off

source ~/Neovim/plugins.vim
source ~/Neovim/plugin_settings.vim
source ~/Neovim/custom_functions.vim

syntax enable
filetype plugin indent on " Turn on file type detection.

set clipboard+=unnamed  " enables copy in vim and paste in OSX

let mapleader=","

" neovim extra configuration
nmap <BS> <C-W>h

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" tab
set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab
set autoindent

set foldnestmax=8
nmap ,rr :redraw!<CR>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" color column
highlight ColorColumn ctermbg=000000
set colorcolumn=81

"" searching
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set hidden                        " Handle multiple buffers better.
set relativenumber                " Show relative line numbers
set number                        " Show line numbers.
set cursorline                    " Highlight the current line
set ruler                         " Show cursor position.
set novisualbell                  " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set exrc                          " enable per-directory .vimrc files
set secure                        " disable unsafe commands in local .vimrc files

colorscheme railscasts
