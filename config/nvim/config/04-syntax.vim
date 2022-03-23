au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless'}
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "➔"
let g:syntastic_warning_symbol = "➝"

let g:jsx_ext_required = 1

let g:ale_sign_error = "➔"
let g:ale_sign_warning = "➝"
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" check jsx files two ways with ALE
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}

"let g:syntastic_python_python_exec = '~/.pyenv/shims/python'
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_json_checkers = ['jsonlint']
" let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_clojure_checkers = ['eastwood']
" let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_scss_checkers = ['stylelint-scss']
let g:syntastic_php_checkers = ['php']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_html_tidy_ignore_errors = [
    \  '<base> escaping malformed URI reference',
    \  '<script> escaping malformed URI reference',
    \  '<video> proprietary attribute',
    \ ]
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" automatically show info for identifier under cursor
" let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let g:syntastic_swift_checkers = ['swiftlint']
let g:syntastic_swift_swiftlint_use_defaults = 1

" au BufWritePost,FileWritePost *.coffee if exists("g:coffee") | :silent !coffee -c <afile>
au BufRead,BufNewFile *.hamlc set ft=haml
au BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
au BufEnter *.c compiler gcc
au BufRead,BufNewFile *.h,*.hpp,*.c,*.cpp,*.swift set ts=4 sw=4 sts=4
" au BufRead,BufNewFile *.cpp set ts=4 sw=4 sts=4
" au BufRead,BufNewFile *.h set ts=4 sw=4 sts=4
" au BufRead,BufNewFile *.hpp set ts=4 sw=4 sts=4
au BufRead,BufNewFile *.conf set ft=apache
au BufRead,BufNewFile *.go set noet ts=4 sw=4
au BufRead,BufNewFile *.markdown set noet sts=4 sw=4
au BufRead,BufNewFile *.java set ts=4 sw=4 sts=4
au BufRead,BufNewFile *.scss set sw=2 sts=2
au BufNewFile,BufRead * setlocal formatoptions-=o

au VimEnter * RainbowParenthesesToggle

let g:vim_jsx_pretty_colorful_config = 1

