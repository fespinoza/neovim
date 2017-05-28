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

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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

set complete+=i

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

" highlight last inserted text
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

  " Omni Completion
  autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete

  " May require ruby compiled in
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd BufNewFile,BufRead *_spec.rb compiler rspec
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript

  " My autocommants
  autocmd BufNewFile,BufRead *.js.erb set ft=javascript.eruby
  autocmd BufNewFile,BufRead *.html.erb set ft=html.eruby
  autocmd BufNewFile,BufRead *.html.haml set ft=haml
  autocmd BufNewFile,BufRead *.ctp set ft=php.html
  autocmd BufNewFile,BufRead *.md set ft=markdown
  autocmd BufNewFile,BufRead *.hbs set ft=handlebars.html
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  autocmd BufNewFile,BufRead .envrc set ft=zsh
  autocmd BufNewFile,BufRead .envrc-sample set ft=zsh

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,scss,coffee,eruby,yaml,cucumber set ai sw=2 sts=2 et
  autocmd FileType css,html,javascript,sass,python set ai sw=2 sts=2 et
  autocmd FileType php set ai sw=2 sts=2 noet
  autocmd FileType ruby,haml,scss,coffee,eruby,yaml,cucumber normal zR
  autocmd FileType css,html,javascript,sass,php,python normal zR

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
  " Use octodown as default build command for Markdown files
  autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'
  autocmd BufNewFile .envrc set ft=conf

  autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent

  " add jbuilder syntax highlighting
  au BufNewFile,BufRead *.json.jbuilder set ft=ruby syn=ruby
endif

" gui colors if running iTerm
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

" if no filetype specified, set ft=markdown (alternative would be text)
autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif

" Have the indent commands re-highlight the last visual selection to make
" multiple indentations easier
vnoremap > >gv
vnoremap < <gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extra Configurations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/Neovim/plugins.vim
source ~/Neovim/plugin_settings.vim
source ~/Neovim/custom_functions.vim

colorscheme railscasts
