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

if exists("g:vdebug_options")
  let g:vdebug_options['port'] = 9001
endif

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:.
set list listchars=tab:▸\ ,trail:.

" Emmet / Zen Coding
let g:user_emmet_install_global = 0
au FileType html,css,php,javascript,xml,jsx,tsx EmmetInstall
let g:user_emmet_leader_key = '<c-m>'
let g:user_emmet_settings = {
\  'indentation' : '  '
\}

" comments in jsonc
au FileType json syntax match Comment +\/\/.\+$+

let g:tagbar_ctags_bin = '/usr/bin/ctags'

" CoC extensions
let g:coc_global_extensions = ['coc-json', 'coc-css', 'coc-html', 'coc-pairs', 'coc-prettier', 'coc-tsserver', 'coc-ultisnips']
" let g:coc_node_path = 'node-ts'

" Coc Explorer folder view
function! s:DisableFileExplorer()
    au! FileExplorer
endfunction

function! s:OpenDirHere(dir)
    if isdirectory(a:dir)
	exec "silent CocCommand explorer --current-buffer" . a:dir
    endif
endfunction

" Taken from vim-easytree plugin, and changed to use coc-explorer
augroup CocExplorerDefault
    autocmd VimEnter * call <SID>DisableFileExplorer()
    autocmd BufEnter * call <SID>OpenDirHere(expand('<amatch>'))
augroup end
