" Ctrl-P to fuzzy search files with FZF
map <c-p> :FZF<CR>

" Ag with <leader>f
map <Leader>f :Ag!<Space>

" Highlight word at cursor and then Ag it.
nnoremap <leader>H *<C-O>:AgFromSearch!<CR>

" Insert a single character w/o going to insert mode using <space><char>
noremap <silent> <space> :exe "normal i".nr2char(getchar())<CR>

" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Movement & wrapped long lines
nnoremap j gj
nnoremap k gk

" Converts Ruby 1.8 hashes to 1.9
command! -bar -range=% NotRocket execute '<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/e' . (&gdefault ? '' : 'g')

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Tagbar
nnoremap <F8> :TagbarToggle<CR>