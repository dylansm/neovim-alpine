call plug#begin()
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'KabbAmine/vCoolor.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips' | Plug 'dylansm/vim-snippets', { 'branch': 'main'} " Group dependencies, vim-snippets depends on ultisnips
Plug 'cespare/vim-toml'
Plug 'chrisbra/csv.vim'
" Plug 'dansomething/vim-eclim', { 'for': 'java' }
Plug 'davidoc/taskpaper.vim'
" Plug 'digitaltoad/vim-pug'
Plug 'dylansm/html5.vim'
Plug 'dylansm/nginx.vim'
" Plug 'dylansm/one-dark.vim'
Plug 'overcache/NeoSolarized'
Plug 'dylansm/synbad'
Plug 'dylansm/vim-jsx'
Plug 'dylansm/vim-stripper'
Plug 'dylansm/vim-super-retab'
Plug 'dylansm/vim-twig'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'itspriddle/vim-marked'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'jwalton512/vim-blade'
Plug 'keith/swift.vim'
" Plug 'kewah/vim-stylefmt'
Plug 'kevinhui/vim-docker-tools'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mitsuse/autocomplete-swift'
" Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'mhartington/nvim-typescript'
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale' " syntax checking
Plug 'tpope/vim-dispatch', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist', { 'for': 'clojure' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
Plug 'venantius/vim-eastwood', { 'for': 'clojure' }
Plug 'vim-ruby/vim-ruby'
" Plug 'vim-scripts/mru.vim'
" Plug 'Valloric/YouCompleteMe'

" Add plugins to &runtimepath
call plug#end()
