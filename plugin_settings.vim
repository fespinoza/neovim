" ==== Ctrl+P
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = 0

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

" Tabular
" autotabulate when writing tables
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

" === Tagbar
let g:ctags_path='/usr/local/bin/ctags'
let g:ctags_args='-I __declspec+ --exclude=.git'
let g:ctags_title=1
let generate_tags=1

" ==== YouCompleteMe
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

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

" ==== NERD Tree
map <leader>n :NERDTreeToggle<CR>

" ==== Markdown
let g:vim_markdown_folding_disabled=1

" ==== Ag
nnoremap <leader>a :Ag

" ==== Vim Rspec
let g:rspec_command = 'call Send_to_Tmux("rspec {spec} -f documentation\n")'
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>re :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
