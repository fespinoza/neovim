" vim: fdm=marker foldenable sw=2 ts=2 sts=2
call plug#begin('~/.nvim/plugged')

" examples: https://github.com/mcantor/dotfiles/blob/master/vim/.vimrc

Plug 'tpope/vim-sensible'

Plug 'milch/vim-fastlane'

" {{{ Neomake

Plug 'neomake/neomake'

" Only do this part when compiled with support for autocommands
if has("autocmd")
  autocmd! BufWritePost * Neomake
endif

" }}}

" {{{ text objects

" kana/vim-textobj-user
Plug 'kana/vim-textobj-user'

" A Vim text object for selecting blank lines
Plug 'zandrmartin/vim-textobj-blanklines'

" Vim plugin: Text objects for the current line
Plug 'kana/vim-textobj-line'

" Vim plugin that defines a new text object representing lines of code at the
" same indent level. Useful for python/vim scripts, etc.
Plug 'michaeljsmith/vim-indent-object'

" Text-object like motion for arguments
Plug 'vim-scripts/argtextobj.vim'

" }}}

" {{{ CamelCaseMotiion
" A vim script to provide CamelCase motion through words (fork of inkarkat's
" camelcasemotion script)

Plug 'bkad/CamelCaseMotion'

" call camelcasemotion#CreateMotionMappings('<leader>')
" }}}

" {{{ Easy align

Plug 'junegunn/vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" {{{ GV: A git commit browser

Plug 'junegunn/gv.vim'

" }}}

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

" Vim and tmux, sittin' in a tree...
Plug 'christoomey/vim-tmux-runner'

" Automatically create any non-existent directories before writing the buffer.
Plug 'pbrisbin/vim-mkdir'

" HTML5 omnicomplete and syntax
Plug 'othree/html5.vim'

" Vim mapping for sorting a range of text
Plug 'christoomey/vim-sort-motion'

" Teach Vim about titlecase, with support for motions and text objects
Plug 'christoomey/vim-titlecase'

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

" {{{ For markdown
Plug 'tpope/vim-markdown'

let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'ruby', 'python', 'bash=sh', 'yaml', 'json']
" }}}

" Parse stack traces or quickfix entries and open the result in vim splits!
"Plug 'mattboehm/vim-unstack'

" Markdown Vim Mode http://plasticboy.com/markdown-vim-mode/
Plug 'plasticboy/vim-markdown'

" CoffeeScript support for vim
Plug 'kchmck/vim-coffee-script'

" {{{ fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

command Gs Gstatus
command Gc Gcommit -v
" }}}

" {{{ rhubarb.vim: GitHub extension for fugitive.vim
Plug 'tpope/vim-rhubarb'
" }}}

" rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-rails'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Vim/Ruby Configuration Files
Plug 'vim-ruby/vim-ruby'

" Buffer Explorer / Browser
Plug 'vim-scripts/bufexplorer.zip'

" repeat.vim: enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" More useful word motions for Vim
" https://github.com/chaoren/vim-wordmotion

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

" {{{ Snippets
Plug 'SirVer/ultisnips' | Plug 'fespinoza/vim-snippets'

let g:UltiSnipsSnippetDirectories=["~/Config/nvim/plugged/vim-snippets/UltiSnips"]
" }}}

" Collection of snippets for angular projects
Plug 'matthewsimo/angular-vim-snippets'

" eunuch.vim: helpers for UNIX
Plug 'tpope/vim-eunuch'

" This vim plugin brings syntax highlighting and linting for API Blueprint.
" http://apiblueprint.org
Plug 'kylef/apiblueprint.vim'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" A plugin of NERDTree showing git status
Plug 'Xuyuanp/nerdtree-git-plugin'

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" commentary.vim: comment stuff out
" https://github.com/tpope/vim-commentary

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

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

" Run Rspec specs from Vim
Plug 'thoughtbot/vim-rspec'

" https://github.com/jgdavey/tslime.vim
Plug 'jgdavey/tslime.vim'

" A Vim plugin that removes clutter and makes working on a widescreen monitor
" enjoyable
Plug 'merlinrebrovic/focus.vim'

" Vim configuration files for Elixir http://elixir-lang.org/
Plug 'elixir-lang/vim-elixir'

" Gist - Access and edit gists locally
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" Adds Swift support to vim. It covers syntax, intenting, and more.
Plug 'toyamarinyon/vim-swift'

" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
" Plug 'taglist.vim'

" SQL utilities - Formatting, generate - columns lists, procedures for databases
Plug 'SQLUtilities'

" SQLComplete is a SQL code completion system using the omnifunc framework
Plug 'SQLComplete.vim'

" Better SQL Syntax
Plug 'sql.vim--Stinson'

" Vim Auto conver small-case SQL keywords into upper-case with iabbr. I HATE
" type UPPERCASE a lot.
Plug 'stardiviner/autosqluppercase.vim'

Plug 'kazuakim/vim-sqlfix'

" Syntax Highlighting for Stylus
Plug 'wavded/vim-stylus'

" Ruby syntax extensions for highlighting YARD documentation.
Plug 'noprompt/vim-yardoc'

" {{{ Gradle/Groovy
Plug 'vim-scripts/groovy.vim'

Plug 'tfnico/vim-gradle'

" }}}

" {{{ Color schemes

" A vim color scheme based on the Railscasts Textmate theme.
Plug 'jpo/vim-railscasts-theme'

" A vim colorscheme based on Github's syntax highlighting.
Plug 'endel/vim-github-colorscheme'

" Mustard colorscheme for vim
Plug 'sts10/vim-mustard'

" A dark 16 color colorscheme for Vim, Gvim, and Nvim
Plug 'jansenfuller/crayon'

" precision colorscheme for the vim text editor
" http://ethanschoonover.com/solarized
Plug 'altercation/vim-colors-solarized'

" }}}

" Kotlin plugin for Vim. Featuring: syntax highlighting, basic indentation,
" Syntastic support
Plug 'udalov/kotlin-vim'

" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'

" Add plugins to &runtimepath
call plug#end()
