set exrc
set secure
syntax on
filetype plugin indent on
colorscheme NeoSolarized
let g:neosolarized_vertSplitBgTrans = 1

" if $ITERM_PROFILE == 'Solarized Dark'
  " set background=dark
" elseif $ITERM_PROFILE == 'Solarized Light'
  " set background=light
" endif

" remember last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

hi NERDTreeOpenable ctermfg=246 guifg=#20b950
hi NERDTreeClosable ctermfg=250 guifg=#20b950
hi Title guifg=#20b950
hi VertSplit ctermfg=2 ctermbg=NONE cterm=NONE
hi StatusLineNC ctermbg=247 ctermfg=236
hi Comment cterm=italic
hi LineNr ctermfg=4 ctermbg=NONE cterm=NONE
" uncomment this to restore a line between vertical splits
set fillchars=eob:\ ,vert:\│,diff:—,fold:—
" set fillchars=eob:\ ,vert:\ ,diff:—,fold:—

hi SyntasticWarningSign guifg=Yellow guibg=#303030
hi SyntasticErrorSign guifg=Red guibg=#303030

let mapleader           = ","
let html_no_rendering   = 1
let g:netrw_liststyle   = 1
let g:netrw_winsize     = 28
let g:netrw_keepdir     = 0
let g:netrw_list_hide   = '.*\.swp\*,.*\.swp$,.*\.swp\s,.*/$,.*/\s'
let g:netrw_banner      = 0
let g:netrw_dirhistmax  = 10
let g:netrw_dirhist_cnt = 0

" enable italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set hidden
set viminfo=""
set noswapfile
set splitbelow
set splitright
set showmatch
set laststatus=0
set backspace=indent,eol,start
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set ai
set nohlsearch
set visualbell
set ruler
set nowrap
set linebreak
set showcmd
set smartcase
set incsearch
set scrolloff=2
set nolist
set wildmenu
set wildmode=longest,list
set shortmess+=I
set clipboard=unnamed
set nofoldenable
set showmode
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1

if has('nvim')
  set shada='1000,f1,<500,:100,/100
endif

" turn off cursorline underline
hi CursorLine term=bold cterm=bold

set rtp+=/usr/local/opt/fzf

" if $HOMEBREW_PREFIX == ''
  " let g:python3_host_prog = '/usr/local/bin/python3'
" else
  " let g:python3_host_prog = '/opt/homebrew/bin/python3'
" endif

" tagbar
let g:tagbar_autofocus = 1

let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" use 'f' to toggle filter
let NERDTreeIgnore = ['\.DS_Store', '\.sass-cache']
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '–'
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeStatusline = 1

if exists("g:vdebug_options")
  let g:vdebug_options['port'] = 9001
endif

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="horizontal"

let NERDSpaceDelims=1
" custom comments
let g:NERDCustomDelimiters = {
\ 'javascript.jsx': { 'left': '{/*', 'right': '*/}'}
\ }

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:.
set list listchars=tab:▸\ ,trail:.

let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

" Emmet / Zen Coding
let g:user_emmet_install_global = 0
autocmd FileType html,css,php,javascript,xml EmmetInstall
" let g:user_emmet_leader_key = '<c-y>'
let g:user_emmet_leader_key = '<c-m>'
let g:user_emmet_settings = {
\  'indentation' : '  '
\}

let ropevim_enable_shortcuts = 1

let g:rustfmt_autosave = 1
let g:rustfmt_command = "/Users/dylan/.cargo/bin/rustfmt"
let g:racer_cmd = "/Users/dylan/.cargo/bin/racer"
" let g:racer_experimental_completer = 1

if filereadable('/Users/dylan/bin/linter_wrappers/eslint.sh')
  " let g:ale_enabled = 0
  let g:ale_linters = ['eslint']
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_javascript_eslint_executable = '/Users/dylan/bin/linter_wrappers/eslint.sh'
  " let b:ale_filename_mappings = {
  " \ 'eslint': [
  " \   ['/User/dylan/dev/microservices/blog/client/src', '/data'],
  " \ ],
  " \}
endif

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'rust': ['rustfmt'],
\}

let g:tagbar_ctags_bin = '/usr/bin/ctags'

" CoC extensions
let g:coc_global_extensions = ['coc-json', 'coc-css', 'coc-html', 'coc-pairs', 'coc-prettier', 'coc-tsserver', 'coc-ultisnips']
" let g:coc_node_path = 'node-ts'
