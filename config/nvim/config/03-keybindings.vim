" remap jj to escape
imap jj <ESC>
" toggle comments
map // <plug>NERDCommenterToggle
" toggler coc-explorer
nmap ;; :CocCommand explorer<CR>

" yank to end of line
nnoremap Y y$
" Clear screen clears search highlighting.
nnoremap <C-L> :nohl<CR><C-L>
nmap <C-L> :call coc#float#close_all() <CR>

" set background with same shortcut used in Keyboard Maestro
function ChooseProfileVariant(type)
  if a:type == "light"
    set background=light
    if $LC_TERMINAL == 'iTerm2'
      silent execute '!$HOMEBREW_PREFIX/bin/python3 /Users/dylan/bin/iTerm2/toggle_profile.py "Solarized Light"'
    elseif $LC_TERMINAL == 'Apple_Terminal'
      silent execute '!/Users/dylan/bin/Triggers/TerminalSolarizedLight'
    endif
  else
    set background=dark
    if $LC_TERMINAL == 'iTerm2'
      silent execute '!$HOMEBREW_PREFIX/bin/python3 /Users/dylan/bin/iTerm2/toggle_profile.py "Solarized Dark"'
    elseif $LC_TERMINAL == 'Apple_Terminal'
      silent execute '!/Users/dylan/bin/Triggers/TerminalSolarizedDark'
    endif
  endif
endfunction

nnoremap <silent> <M-L> :call ChooseProfileVariant("light")<CR>
nnoremap <silent> <M-D> :call ChooseProfileVariant('')<CR>

map <F7> :setlocal spell! spelllang=en_us<CR>

" alt-shift + h,j,k,l keys
map <silent>Ò :vertical res -10<CR>
map <silent>Ô :res -10<CR>
map <silent> :res +10<CR>
map <silent>Ó :vertical res +10<CR>
map <silent>¬ <C-w><
map <silent>∆ <C-W>-
map <silent>˚ <C-W>+
map <silent>˙ <C-w>>

" toggle NERDTree
"map ;; :NERDTreeToggle<CR>
" map ;; :Lexplore<CR>

" change window
map <Leader>ww :winc w<CR>

" quickfix open
map <Leader>aa :cope<CR>
" close
map <Leader>vv :ccl<CR>

" Utility function to echo syntax under cursor
nmap ;y :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Toggle paste mode
nmap <C-u> :set invpaste paste?<CR>

" set j/k keys to treat wrapped lines as multiple rows
nnoremap j gj
nnoremap k gk

" place cursor in middle after search and end-of-paragraph
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

" correct cursor placement after linebreak
"imap <C-c> <CR><Esc>O
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O


" exit pairs of all kind out-the-end
inoremap <C-]> <C-o>a

" Jump to the first placeholder by typing `<C-k>`.
" imap is a problem
"autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)

" map <C-n> :cnext<CR>
" map <C-p> :cprevious<CR>
" nnoremap <Leader>a :cclose<CR>

au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>i <Plug>(go-info)

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
"nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Clang Format
au FileType c,cpp,objc nmap <silent> <Leader>f :ClangFormat<CR>
nmap <Leader>m :!make<CR>

" Style Format
au FileType css nmap <silent> <Leader>f :Stylefmt<CR>
au FileType css vnoremap <silent> <Leader>f :StylefmtVisual<CR>

nnoremap <silent><leader>3 :set invnu<CR>
nnoremap <silent>;l :set invcursorcolumn invcursorline<CR>

" nmap <Leader>c :source %:p:h/.config.vim<CR>
nmap <Leader>x :!chmod a+x %<CR>

" python-mode
map <Leader>g :call RopeGotoDefinition()<CR>

map <C-F> :Ag<space>
" map <C-F> :Ack!<Space>
map ;f :FZF<CR>

command! -nargs=1 Locate call fzf#run(
  \ {'source': 'locate <q-args>', 'sink': 'e', 'options': '-m'})

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

 nmap <silent>;r :FZFMru<CR>

 nmap <silent>;w :set wrap!<CR>
 nmap <silent>;m :MarkedOpen!<CR>

 nmap <silent>\\ :TagbarToggle<CR>

" inoremap <C-]> <C-x><C-o>

" Dash for current word
" function! LookupCurrentWordInDash()
  " let cword = expand("<cword>")
  " :silent exec "!open 'dash://'" . cword
  " :redraw!
" endfunction

nmap <silent><Leader>/ :call LookupCurrentWordInDash()<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ;a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ;a <Plug>(EasyAlign)

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<CR>

" Shortcut to rapidly toggle `set list`
nmap <Leader>ll :set list!<CR>

" Clojure
" nnoremap <Leader>sh :Slamhound<CR>
" Vim Fireplace
" autocmd this so it's only on in clojure context
" nmap <Leader>q cqq
" nmap <Leader>c cqc
" nmap ;c :Connect nrepl://127.0.0.1:50133 .<CR>

" au FileType rust nmap <leader>rr <Plug>(rust-doc)
" au FileType rust nmap <leader>rd <Plug>(rust-def)
" au FileType rust nmap <leader>rs <Plug>(rust-def-split)
" au FileType rust nmap rx <Plug>(rust-def-vertical)


" CoC Town
" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
"if has('nvim')
  "inoremap <silent><expr> <c-space> coc#refresh()
"else
  "inoremap <silent><expr> <c-@> coc#refresh()
"endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" **** works to hit enter but tab would be better ****
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"inoremap <silent><expr> <TAB> pumvisible() ? coc#select_confirm() : "\<C-g>u\<TAB>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)



" Cursor over
nnoremap <silent> K :call CocAction('doHover')<CR>

" Auto tooltip
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()



" diagnostic list
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" workspace symbols
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

" fix issue
nmap <leader>do <Plug>(coc-codeaction)
