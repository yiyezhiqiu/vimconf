""""""""""""""""""""""""""""""
" Global settings 
""""""""""""""""""""""""""""""
set nocompatible
set number
filetype on
set history=1000
set background=dark
syntax on
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set showmatch
set guioptions-=T
set ruler
set nohls
set incsearch
set hlsearch

set pastetoggle=<F9>
"set list
"set listchars=tab:>-,trail:-

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent on " load filetype plugins/indent settings
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType go setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType c setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType cpp setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType sh setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2 

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

set backspace=2
set backspace=indent,eol,start

set mouse=a

""""""""""""""""""""""""""""""
" Load pathogen 
""""""""""""""""""""""""""""""
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

""""""""""""""""""""""""""""""
" For Python autopep8 
""""""""""""""""""""""""""""""
autocmd FileType python map <buffer> <F4> :call Autopep8()<CR>

""""""""""""""""""""""""""""""
" JS beautifier
""""""""""""""""""""""""""""""
" for javascript
autocmd FileType javascript noremap <buffer>  <F4> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <F4> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <F4> :call CSSBeautify()<cr>


""""""""""""""""""""""""""""""
" Tagbar 
""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
nmap <F7> :BufExplorer<CR>
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

""""""""""""""""""""""""""""""
" NerdTree 
""""""""""""""""""""""""""""""
nmap <F3> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

""""""""""""""""""""""""""""""
" neocomplete 
""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Disable preview
set completeopt-=preview

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set laststatus=2
let g:lightline = {'colorscheme': 'default', }

""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_python_checkers=["pyflakes"]

""""""""""""""""""""""""""""""
" For Golang
""""""""""""""""""""""""""""""
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
