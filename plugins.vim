call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'benekastah/neomake'

" endwise.vim: wisely add 'end' in ruby, endfunction/endif/more in vim script,
" etc
Plug 'tpope/vim-endwise'

" ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)
Plug 'tpope/vim-ragtag'

" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'

" Automatically create any non-existent directories before writing the buffer.
Plug 'pbrisbin/vim-mkdir'

" Global commands in vim
Plug 'karlbright/qfdo.vim'

" Start a * or # search from a visual block
Plug 'nelstrom/vim-visual-star-search'

Plug 'rking/ag.vim'

" Projectionist provides granular project configuration using 'projections'
Plug 'tpope/vim-projectionist'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" Automatically create any non-existent directories before writing the buffer.
Plug 'pbrisbin/vim-mkdir'

" HTML5 omnicomplete and syntax
Plug 'othree/html5.vim'

" lean & mean status/tabline for vim that's light as air
"Plug 'bling/vim-airline'
"Plug 'edkolev/tmuxline.vim'

" unimpaired.vim: pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" endwise.vim: wisely add 'end' in ruby, endfunction/endif/more in vim script,
" etc
Plug 'tpope/vim-endwise'

" ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)
Plug 'tpope/vim-ragtag'

"" Rails Development

" This is a lightweight bag of Vim goodies for Plugr, best accompanied by
" rake.vim and/or rails.vim
Plug 'tpope/vim-bundler'

" Rake.vim is a plugin leveraging projectile.vim to enable you to use all
" those parts of rails.vim that you wish you could use on your other Ruby
" projects, including :A, :Elib and friends, and of course :Rake. It's great
" when paired with gem open and bundle open and complemented nicely by
" bundler.vim
Plug 'tpope/vim-rake'

" This simple plugin provides a :Rbenv command that wraps !rbenv with tab
" complete. It also tells recent versions of vim-ruby where your Ruby installs
" are located, so that it can set 'path' and 'tags' in your Ruby buffers to
" reflect the nearest .ruby-version file.
Plug 'tpope/vim-rbenv'

"" CTAGS
" Automatic ctags generation on gem install
Plug 'tpope/gem-ctags'
" Updates entries in a tags file automatically when saving
Plug 'vim-scripts/AutoTag'

" For markdown
" Plug 'tpope/vim-markdown'


" Parse stack traces or quickfix entries and open the result in vim splits!
"Plug 'mattboehm/vim-unstack'

" The matchit.vim script allows you to configure % to match more than just
" single characters
Plug 'edsono/vim-matchit'

" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'

" Markdown Vim Mode http://plasticboy.com/markdown-vim-mode/
Plug 'plasticboy/vim-markdown'

" CoffeeScript support for vim
Plug 'kchmck/vim-coffee-script'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-rails'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Vim/Ruby Configuration Files
Plug 'vim-ruby/vim-ruby'

" Buffer Explorer / Browser
Plug 'vim-scripts/bufexplorer.zip'

" A vim plugin that simplifies the transition between multiline and
" single-line code
Plug 'AndrewRadev/splitjoin.vim'

" Better JS support
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'

" Syntax definitions for several libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Rails.vim but for angular
Plug 'burnettk/vim-angular'

Plug 'elzr/vim-json'

" SnipMate
Plug 'SirVer/ultisnips' | Plug 'fespinoza/vim-snippets'

" Collection of snippets for angular projects
Plug 'matthewsimo/angular-vim-snippets'

" eunuch.vim: helpers for UNIX
Plug 'tpope/vim-eunuch'

" This vim plugin brings syntax highlighting and linting for API Blueprint.
" http://apiblueprint.org
Plug 'kylef/apiblueprint.vim'

" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" A vim color scheme based on AstonJ's theme based on code school.
Plug 'akmassey/vim-codeschool'

" A vim color scheme based on the Railscasts Textmate theme.
Plug 'jpo/vim-railscasts-theme'

" A vim colorscheme based on Github's syntax highlighting.
Plug 'endel/vim-github-colorscheme'

" meta5: A vim colorscheme
Plug 'christophermca/meta5'

" abolish.vim: easily search for, substitute, and abbreviate multiple variants
" of a word
Plug 'tpope/vim-abolish'

" This is a VIM plugin. This plugin runs current buffer by ruby, and write
" results after marker comments.
" NEEDS :ruby support
" Plug 'kmdsbng/vim-ruby-eval'

" vim plugin for tmux.conf
Plug 'tmux-plugins/vim-tmux'

" Simple vim plugin that adds TomDoc templates to your code.
Plug 'jc00ke/vim-tomdoc'

" A simple syntax add-on for vim that highlights your TomDoc comments
Plug 'wellbredgrapefruit/tomdoc.vim'

" Add plugins to &runtimepath
call plug#end()
