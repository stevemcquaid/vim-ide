"" Color Settings
" ================
"
"" Assume a dark background
set background=dark

" Color Settings
" --------------

" Enable syntax highlighting
syntax enable

 "Set font and color scheme for Gvim
"set guifont=Inconsolata\ for\ Powerline:h14
"if has("gui_running")
    "if has("gui_win32")
        "set guifont=Consolas:h10:cANSI
    "endif
"else
    "set t_Co=256
"endif

set t_Co=256
set t_ut=

try
    colorscheme badwolf
    "colorscheme codedark
catch
endtry

let g:go_highlight_types = 1

let g:go_highlight_fields = 1

let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

let g:go_auto_type_info = 1
set updatetime=100
let g:go_auto_sameids = 1

