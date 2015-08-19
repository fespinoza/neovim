set nocompatible

source ~/Neovim/plugins.vim

set nocompatible            " Must come first because it changes other options.
filetype off

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

" ==== UtilSnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit = "vertical"

" ==== NERD Commenter
let NERDSpaceDelims = 1
map <Leader>cc <plug>NERDComUncommentLine
map <Leader>cv <plug>NERDComAlignedComment

" ==== Buffer Explorer
map <Leader>bb :BufExplorer<CR>

" ===== JSON plugin
let g:vim_json_syntax_conceal = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strip trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTAGS AND TAGBAR CONFIGURATION (Mac OSX config)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctags_path='/usr/local/bin/ctags'
let g:ctags_args='-I __declspec+ --exclude=.git'
let g:ctags_title=1
let generate_tags=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOTABULATE WHEN TYPING TABLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" Only do this part when compiled with support for autocommands
if has("autocmd")
	autocmd! BufWritePost * Neomake
endif

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

" ==== Ctrl+P
let g:ctrlp_map = '<leader>t'

" ==== Silver Searcher
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

set exrc                          " enable per-directory .vimrc files
set secure                        " disable unsafe commands in local .vimrc files
