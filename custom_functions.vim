" Strip trailing whitespace
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

function! VisualSingleQuotes()
  let _s=@/
  :.s/"\([^'#]*\)"/'\1'/g
  let @/=_s
endfunction
command! SingleQuotes :%s/"\([^'#]*\)"/'\1'/g
vmap <leader>sq :call VisualSingleQuotes()<CR>

command! LocalVimrc :call LocalVimfile()
function! LocalVimfile()
  :silent execute "!cp ~/.nvim/nvimrc.local ".getcwd()."/.nvimrc" | redraw!
endfunction

command! LocalProjections :call LocalProjectionsFile()
function! LocalProjectionsFile()
  :silent execute "!cp ~/.nvim/projections.json ".getcwd()."/.projections.json" | redraw!
endfunction

" reload my .vimrc
command! So :source $MYVIMRC | :nohlsearch

" Open Github Repo on the browser
:nmap <leader>gr :call GithubRepo()<CR>
function! GithubRepo()
  " get current line under the cursor
  let line=getline('.')
  " extract repo name from current line
  let repo_name=matchlist(line, "Plug '\\(.*\\)'")[1]
  " open url silently
  :silent execute "!open https://github.com/".repo_name | redraw!
endfunction

" Open Github app from Vim
command! Github :call OpenGithubApp()
function! OpenGithubApp()
  :silent execute "!github" | redraw!
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
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
map <leader>rn :call RenameFile()<cr>

function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

function! s:Marked()
  noautocmd silent execute "!open -a 'Marked 2' '" . expand("%:p") . "'"
  if v:shell_error
    echohl Error
    echon "Problem opening the file."
    echohl Normal
  endif
endfunction

command! -bar -nargs=0 Marked call s:Marked()

" Requires 'jq' (brew install jq)
function! s:PrettyJSON()
  %!jq .
  set filetype=json
endfunction
command! PrettyJSON :call <sid>PrettyJSON()

" Visual function
" JsonToRubyHash
" - replaces keys by symbols
" - transform nulls into nils
" - changes " by '

" Open/Create related spec/file
function! s:CreateRelated()
  let related = s:GetRelatedFile(expand('%'))
  call s:Open(related)
endfunction

" Return the related filename
function! s:GetRelatedFile(file)
  if match(a:file, '_spec\.rb$') != -1
    return substitute(substitute(a:file, "_spec.rb$", ".rb", ""), '^spec/', 'app/', '')
  else
    return substitute(substitute(a:file, ".rb$", "_spec.rb", ""), '^app/', 'spec/', '')
  endif
endfunction

" Open the related file in a vsplit
function! s:Open(file)
  exec('vsplit ' . a:file)
endfunction

" Register a new command `AC` for open/create a related file
command! AC :call <SID>CreateRelated()

map <leader>er :e README.md<CR>
map <leader>ep :e PR.md<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) \+= \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

function! ModernizeHash()
  let _s=@/
  :.s/:\?'\?\(.*\)\'\?\s*=>\s*\(.*\)/\1: \2/
  :call VisualSingleQuotes()
  let @/=_s
endfunction
:vmap <leader>mh :call ModernizeHash()<CR>

" puts the caller
nnoremap <leader>wtf oputs "#" * 120<c-m>puts caller<c-m>puts "#" * 120<esc>

" camelCase => camel_case
vnoremap ,case :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>

nmap <leader>cp :let @+ = expand("%")<CR>

let g:S = 0  "result in global variable S
function! Sum(number)
  let g:S = g:S + a:number
  return a:number
endfunction
